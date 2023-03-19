/*
 * Created by He, Hao at 2019-3-11
 */

#include <cstdarg>
#include <cstdio>
#include <cstdlib>
#include <iostream>
#include <string>
#include <pthread.h>
#include <mutex>
#include <unistd.h>

#include <elfio/elfio.hpp>

#include "BranchPredictor.h"
#include "Cache.h"
#include "Debug.h"
#include "MemoryManager.h"
#include "Simulator.h"

bool parseParameters(int argc, char **argv);
void printUsage();
void printElfInfo(ELFIO::elfio *reader);
void loadElfToMemory(ELFIO::elfio *reader, MemoryManager *memory, uint32_t base);
void shared_memory(void);
void thread_initilization(bool core);
void *thread_begin(void *arg);

char *elfFile0 = nullptr;
char *elfFile1 = nullptr;
bool verbose = 0;
bool isSingleStep = 0;
bool dumpHistory = 0;
bool cur_core = false;
uint32_t stackBaseAddr0 = 0x80000000;
uint32_t stackBaseAddr1 = 0x7fc00000;
uint32_t stackSize = 0x400000;
uint32_t base0 = 0x10000000;
uint32_t base1 = 0x20000000;
MemoryManager memory;
Cache *l3Cache;
Cache *core0l1Cache, *core0l2Cache;
Cache *core1l1Cache, *core1l2Cache;
Cache::Policy l1Policy, l2Policy, l3Policy;
BranchPredictor::Strategy strategy0 = BranchPredictor::Strategy::NT;
BranchPredictor::Strategy strategy1 = BranchPredictor::Strategy::NT;
BranchPredictor branchPredictor0;
BranchPredictor branchPredictor1;
Simulator simulator0(&memory, &branchPredictor0);
Simulator simulator1(&memory, &branchPredictor1);

pthread_mutex_t l3cache_mainmemory_lock = PTHREAD_MUTEX_INITIALIZER;

int32_t core0_id;
int32_t core1_id;

char core0_out[100005];
char core1_out[100005];

bool shared = false;
bool own_cache = false;

extern cache_state share_memory_cache[SHARE_CACHELINE_SIZE][2][3];
extern memory_state share_memory_memory[SHARE_CACHELINE_SIZE];

int main(int argc, char **argv)
{
  if (!parseParameters(argc, argv))
  {
    printUsage();
    exit(-1);
  }

  // Init cache

  l1Policy.cacheSize = 8 * 1024;
  l1Policy.blockSize = 32;
  l1Policy.blockNum = l1Policy.cacheSize / l1Policy.blockSize;
  l1Policy.associativity = 4;
  l1Policy.hitLatency = 0;
  l1Policy.missLatency = 8;

  l2Policy.cacheSize = 64 * 1024;
  l2Policy.blockSize = 32;
  l2Policy.blockNum = l2Policy.cacheSize / l2Policy.blockSize;
  l2Policy.associativity = 4;
  l2Policy.hitLatency = 8;
  l2Policy.missLatency = 20;

  l3Policy.cacheSize = 2 * 1024 * 1024;
  l3Policy.blockSize = 32;
  l3Policy.blockNum = l3Policy.cacheSize / l3Policy.blockSize;
  l3Policy.associativity = 4;
  l3Policy.hitLatency = 20;
  l3Policy.missLatency = 100;

  l3Cache = new Cache(&memory, l3Policy);

  thread_initilization(false);
  thread_initilization(true);

  shared_memory();

  fprintf(stderr, "----Thread Initiliazed.----\n");

  pthread_t core_1, core_2;

  int num1 = 0;
  int num2 = 1;

  pthread_create(&core_2, NULL, thread_begin, &num2);
  pthread_create(&core_1, NULL, thread_begin, &num1);

  fprintf(stderr, "---All thread created.---\n");

  pthread_join(core_1, NULL);

  pthread_join(core_2, NULL);

  fprintf(stderr, "\n\n\n---------The following is result of Core 0---------\n\n\n");
  puts(core0_out);
  fprintf(stderr, "\n\n\n---------The following is result of Core 1---------\n\n\n");
  puts(core1_out);

  delete core0l1Cache;
  delete core0l2Cache;
  delete core1l1Cache;
  delete core1l2Cache;
  delete l3Cache;
  return 0;
}

bool parseParameters(int argc, char **argv)
{
  bool core = false;
  // Read Parameters
  for (int i = 1; i < argc; ++i)
  {
    if (argv[i][0] == '-')
    {
      if (argv[i][1] == 'c' && argv[i][2] == '0')
      {
        core = false;
      }
      else if (argv[i][1] == 'c' && argv[i][2] == '1')
      {
        core = true;
      }
      else
      {
        return false;
      }
    }
    else
    {
      if (core == false && elfFile0 == NULL)
      {
        elfFile0 = argv[i];
      }
      else if (core == true && elfFile1 == NULL)
      {
        elfFile1 = argv[i];
      }
      else
      {
        return false;
      }
    }
  }
  if (elfFile0 == nullptr || elfFile1 == nullptr)
  {
    return false;
  }

  return true;
}

void printUsage()
{
  printf("Usage: Simulator riscv-elf-file [-v] [-s] [-d] [-b param]\n");
  printf("Parameters: \n\t[-v] verbose output \n\t[-s] single step\n");
  printf("\t[-d] dump memory and register trace to dump.txt\n");
  printf("\t[-b param] branch perdiction strategy, accepted param AT, NT, "
         "BTFNT, BPB\n");
}

void printElfInfo(ELFIO::elfio *reader)
{
  printf("==========ELF Information==========\n");

  if (reader->get_class() == ELFCLASS32)
  {
    printf("Type: ELF32\n");
  }
  else
  {
    printf("Type: ELF64\n");
  }

  if (reader->get_encoding() == ELFDATA2LSB)
  {
    printf("Encoding: Little Endian\n");
  }
  else
  {
    printf("Encoding: Large Endian\n");
  }

  if (reader->get_machine() == EM_RISCV)
  {
    printf("ISA: RISC-V(0x%x)\n", reader->get_machine());
  }
  else
  {
    dbgprintf("ISA: Unsupported(0x%x)\n", reader->get_machine());
    exit(-1);
  }

  ELFIO::Elf_Half sec_num = reader->sections.size();
  printf("Number of Sections: %d\n", sec_num);
  printf("ID\tName\t\tAddress\tSize\n");

  for (int i = 0; i < sec_num; ++i)
  {
    const ELFIO::section *psec = reader->sections[i];

    printf("[%d]\t%-12s\t0x%llx\t%lld\n", i, psec->get_name().c_str(),
           psec->get_address(), psec->get_size());
  }

  ELFIO::Elf_Half seg_num = reader->segments.size();
  printf("Number of Segments: %d\n", seg_num);
  printf("ID\tFlags\tAddress\tFSize\tMSize\n");

  for (int i = 0; i < seg_num; ++i)
  {
    const ELFIO::segment *pseg = reader->segments[i];

    printf("[%d]\t0x%x\t0x%llx\t%lld\t%lld\n", i, pseg->get_flags(),
           pseg->get_virtual_address(), pseg->get_file_size(),
           pseg->get_memory_size());
  }

  printf("===================================\n");
}

void loadElfToMemory(ELFIO::elfio *reader, MemoryManager *memory, uint32_t base)
{
  ELFIO::Elf_Half seg_num = reader->segments.size();
  for (int i = 0; i < seg_num; ++i)
  {
    const ELFIO::segment *pseg = reader->segments[i];

    uint64_t fullmemsz = pseg->get_memory_size();
    uint64_t fulladdr = pseg->get_virtual_address();
    // fprintf(stderr, "fullmemsz: %ld, fulladdr: %ld\n", fullmemsz, fulladdr);
    // Our 32bit simulator cannot handle this
    if (fulladdr + fullmemsz > 0xFFFFFFFF)
    {
      dbgprintf(
          "ELF address space larger than 32bit! Seg %d has max addr of 0x%lx\n",
          i, fulladdr + fullmemsz);
      exit(-1);
    }

    uint32_t filesz = pseg->get_file_size();
    uint32_t memsz = pseg->get_memory_size();
    uint32_t addr = (uint32_t)pseg->get_virtual_address();
    fprintf(stderr, "memsz: %ld, addr: %ld\n", memsz, addr);
    for (uint32_t p = addr + base; p < addr + memsz + base; ++p)
    {
      if (!memory->isPageExist(p))
      {
        memory->addPage(p);
      }

      if (p < addr + filesz + base)
      {
        memory->setByteNoCache(p, pseg->get_data()[p - addr - base]);
      }
      else
      {
        memory->setByteNoCache(p, 0);
      }
    }
  }
}

void shared_memory(void)
{
  /* We should allocate shared memory */
  fprintf(stderr, "Allocation and Initiliazing shared memory...\n");
  for (uint32_t p = 0x100000; p < 0x500000; p++)
  {
    if (!memory.isPageExist(p))
    {
      memory.addPage(p);
    }

    memory.setByteNoCache(p, 0);
  }
  fprintf(stderr, "Allocated and Initiliazed shared memory.\n");

  fprintf(stderr, "Initiliazing shared memory MESI state...\n");
  for (int32_t i = 0; i < SHARE_CACHELINE_SIZE; i++)
  {
    share_memory_cache[i][0][0] = CN;
    share_memory_cache[i][0][1] = CN;
    share_memory_cache[i][0][2] = CN;
    share_memory_cache[i][1][0] = CN;
    share_memory_cache[i][1][1] = CN;
    share_memory_cache[i][1][2] = CN;
    share_memory_memory[i] = MS;
  }
  fprintf(stderr, "Initiliazed shared memory MESI state.\n");
}

void thread_initilization(bool core)
{
  if (!core)
  { /* Core 0*/
    core0l2Cache = new Cache(&memory, l2Policy, l3Cache);
    core0l1Cache = new Cache(&memory, l1Policy, core0l2Cache);
    ELFIO::elfio reader;
    if (!reader.load(elfFile0))
    {
      fprintf(stderr, "Fail to load ELF file %s of core 0!\n", elfFile0);
      exit(-1);
    }

    if (verbose)
    {
      printElfInfo(&reader);
    }

    loadElfToMemory(&reader, &memory, base0);

    simulator0.core = false;
    simulator0.isSingleStep = isSingleStep;
    simulator0.verbose = verbose;
    simulator0.shouldDumpHistory = dumpHistory;
    simulator0.branchPredictor->strategy = strategy0;
    simulator0.pc = reader.get_entry();
    fprintf(stderr, "core0 pc: %d\n", simulator0.pc);
    simulator0.initStack(stackBaseAddr0, stackSize);
    memory.core0cache = core0l1Cache;
  }
  else
  {
    core1l2Cache = new Cache(&memory, l2Policy, l3Cache);
    core1l1Cache = new Cache(&memory, l1Policy, core1l2Cache);
    ELFIO::elfio reader;
    if (!reader.load(elfFile1))
    {
      fprintf(stderr, "Fail to load ELF file %s of core 1!\n", elfFile1);
      exit(-1);
    }

    if (verbose)
    {
      printElfInfo(&reader);
    }

    loadElfToMemory(&reader, &memory, base1);

    simulator1.core = true;
    simulator1.isSingleStep = isSingleStep;
    simulator1.verbose = verbose;
    simulator1.shouldDumpHistory = dumpHistory;
    simulator1.branchPredictor->strategy = strategy1;
    simulator1.pc = reader.get_entry();
    fprintf(stderr, "core1 pc: %d\n", simulator1.pc);
    simulator1.initStack(stackBaseAddr1, stackSize);
    memory.core1cache = core1l1Cache;
  }
}

void *thread_begin(void *arg)
{
  int tmp = *(int *)arg;
  if (tmp == 0)
  {
    fprintf(stderr, "----core 0 created.----\n");
    fprintf(stderr, "----core 0 simulate begin----.\n");
    core0_id = pthread_self();
    simulator0.simulate();
  }
  else
  {
    fprintf(stderr, "----core 1 created.----\n");
    fprintf(stderr, "----core 1 simulate begin----.\n");
    core1_id = pthread_self();
    simulator1.simulate();
  }
}