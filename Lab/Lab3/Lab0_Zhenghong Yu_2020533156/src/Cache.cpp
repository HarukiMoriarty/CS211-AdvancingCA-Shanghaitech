/*
 * Implementation of a simple cache simulator
 *
 * Created By He, Hao in 2019-04-27
 */

#include <cstdio>
#include <cstdlib>
#include <stdio.h>
#include <pthread.h>

#include "Cache.h"

/* Used for format output */
extern char core0_out[100005];
extern char core1_out[100005];

/* Used for distinguish thread */
extern int32_t core0_id;
extern int32_t core1_id;

extern Cache *core0l1Cache;
extern Cache *core1l1Cache;
extern Cache::Policy l1Policy, l2Policy, l3Policy;

/* MESI directory */
cache_state share_memory_cache[SHARE_CACHELINE_SIZE][2][3];
memory_state share_memory_memory[SHARE_CACHELINE_SIZE];

/* Used for search cacheline in MESI directory */
uint32_t get_id_from_addr(uint32_t addr);

/* Used for change other location copy data status */
void read_modified_other_core_MESI(uint32_t addr, uint32_t id);

/* Get latest data from another core(the memory is invalid) */
void get_another_core_right_data_back(uint32_t addr, uint32_t id);

/* Used for invalid all other location copy of data for writing */
void invalid_data(uint32_t addr, uint32_t id);

/* To decide whether the address operation is in shared memory */
bool is_shared_memory(uint32_t addr);

Cache::Cache(MemoryManager *manager, Policy policy, Cache *lowerCache,
             bool writeBack, bool writeAllocate)
{
  this->referenceCounter = 0;
  this->memory = manager;
  this->policy = policy;
  this->lowerCache = lowerCache;
  if (!this->isPolicyValid())
  {
    fprintf(stderr, "Policy invalid!\n");
    exit(-1);
  }
  this->initCache();
  this->statistics.numRead = 0;
  this->statistics.numWrite = 0;
  this->statistics.numHit = 0;
  this->statistics.numMiss = 0;
  this->statistics.totalCycles = 0;
  this->writeBack = writeBack;
  this->writeAllocate = writeAllocate;
}

bool Cache::inCache(uint32_t addr)
{
  return getBlockId(addr) != -1 ? true : false;
}

uint32_t Cache::getBlockId(uint32_t addr)
{
  uint32_t tag = this->getTag(addr);
  uint32_t id = this->getId(addr);
  // printf("0x%x 0x%x 0x%x\n", addr, tag, id);
  // iterate over the given set
  for (uint32_t i = id * policy.associativity;
       i < (id + 1) * policy.associativity; ++i)
  {
    if (this->blocks[i].id != id)
    {
      fprintf(stderr, "Inconsistent ID in block %d\n", i);
      exit(-1);
    }
    if (this->blocks[i].valid && this->blocks[i].tag == tag)
    {
      return i;
    }
  }
  return -1;
}

uint8_t Cache::getByte(uint32_t addr, uint32_t *cycles)
{
  this->referenceCounter++;
  this->statistics.numRead++;

  // If in cache, return directly
  int blockId;
  if ((blockId = this->getBlockId(addr)) != -1)
  { /* If MESI operation hit the cacheline, then nothing happens, all status keep the same */
    // if (addr <= 0x500000 && addr >= 0x100000)
    //  fprintf(stderr, "Get addr: %x Hit!\n", addr);
    uint32_t offset = this->getOffset(addr);
    this->statistics.numHit++;
    this->statistics.totalCycles += this->policy.hitLatency;
    this->blocks[blockId].lastReference = this->referenceCounter;
    if (cycles)
      *cycles = this->policy.hitLatency;
    return this->blocks[blockId].data[offset];
  }

  // Else, find the data in memory or other level of cache
  this->statistics.numMiss++;
  this->statistics.totalCycles += this->policy.missLatency;
  this->loadBlockFromLowerLevel(addr, cycles);

  // The block is in top level cache now, return directly
  if ((blockId = this->getBlockId(addr)) != -1)
  {
    uint32_t offset = this->getOffset(addr);
    this->blocks[blockId].lastReference = this->referenceCounter;

    /* MESI State*/
    if (is_shared_memory(addr))
    {
      int32_t tmp = pthread_self(); /* To decide current thread */
      if (tmp == core0_id)
      {
        if (own_cache == true)
        { /* If the data only use in the current core, then just take the status to CE */
          int level = this->find_cache_level();
          uint32_t id = get_id_from_addr(addr);
          share_memory_cache[id][0][level] = CE;
          fprintf(stderr, "Own copy data of core 0, set state to E! id: %d\n", id);
        }
        else
        { /* If the data has other copy data, then just take the status to CS */
          int level = this->find_cache_level();
          uint32_t id = get_id_from_addr(addr);
          share_memory_cache[id][0][level] = CS;
          fprintf(stderr, "Multi copy back to core 0, set state to S! id:\n", id);
        }
      }
      else if (tmp == core1_id)
      { /* If the data only use in the current core, then just take the status to CE */
        if (own_cache == true)
        {
          fprintf(stderr, "Own copy data of core 1, set state to E!\n");
          int level = this->find_cache_level();
          uint32_t id = get_id_from_addr(addr);
          share_memory_cache[id][1][level] = CE;
        }
        else
        { /* If the data has other copy data, then just take the status to CS */
          fprintf(stderr, "Multi copy back to core 1, set state to S!\n");
          int level = this->find_cache_level();
          uint32_t id = get_id_from_addr(addr);
          share_memory_cache[id][1][level] = CS;
        }
      }
    }
    return this->blocks[blockId].data[offset];
  }
  else
  {
    fprintf(stderr, "Error: data not in top level cache!\n");
    exit(-1);
  }
}

void Cache::setByte(uint32_t addr, uint8_t val, uint32_t *cycles)
{
  this->referenceCounter++;
  this->statistics.numWrite++;

  // If in cache, write to it directly
  int blockId;
  if ((blockId = this->getBlockId(addr)) != -1)
  {
    // if (addr <= 0x500000 && addr >= 0x100000)
    // fprintf(stderr, "Set addr: %x Hit!\n", addr);
    uint32_t offset = this->getOffset(addr);
    this->statistics.numHit++;
    this->statistics.totalCycles += this->policy.hitLatency;
    this->blocks[blockId].modified = true;
    this->blocks[blockId].lastReference = this->referenceCounter;
    this->blocks[blockId].data[offset] = val;
    if (!this->writeBack)
    {
      this->writeBlockToLowerLevel(this->blocks[blockId]);
      this->statistics.totalCycles += this->policy.missLatency;
    }
    if (cycles)
      *cycles = this->policy.hitLatency;

    /* MESI */
    if (is_shared_memory(addr))
    {
      uint32_t id = get_id_from_addr(addr);
      int32_t tmp = pthread_self();
      if (tmp == core0_id)
      {
        if (share_memory_cache[id][0][0] == CE || share_memory_cache[id][0][0] == CS)
        { /* If the data is in the top cache, we will sure that the state in valid, just change it to M, and invalid other cache/memory state*/
          fprintf(stderr, "Write data already in core 0 l1 cache!\n");
          share_memory_cache[id][0][0] == CM;
          share_memory_memory[id] = MI;
          invalid_data(addr, id);
        }
        /* If in CM just do nothing */
      }
      else if (tmp == core1_id)
      {
        if (share_memory_cache[id][1][0] == CE || share_memory_cache[id][1][0] == CS)
        { /* If the data is in the top cache, we will sure that the state in valid, just change it to M, and invalid other cache/memory state*/
          fprintf(stderr, "Write data already in core 0 l1 cache!\n");
          share_memory_cache[id][1][0] == CM;
          share_memory_memory[id] = MI;
          invalid_data(addr, id);
        }
        /* If in CM just do nothing*/
      }
    }
    return;
  }

  // Else, load the data from cache
  // TODO: implement bypassing
  this->statistics.numMiss++;
  this->statistics.totalCycles += this->policy.missLatency;

  if (this->writeAllocate)
  {
    this->loadBlockFromLowerLevel(addr, cycles);
    /* After the load, we make sure that the data is in the current cache */
    if ((blockId = this->getBlockId(addr)) != -1)
    {
      uint32_t offset = this->getOffset(addr);
      this->blocks[blockId].modified = true;
      this->blocks[blockId].lastReference = this->referenceCounter;
      this->blocks[blockId].data[offset] = val;

      /* MESI */
      if (is_shared_memory(addr))
      {
        uint32_t id = get_id_from_addr(addr);
        fprintf(stderr, "####id: %d\n", id);
        int32_t tmp = pthread_self();
        if (tmp == core0_id)
        {
          if (share_memory_cache[id][0][0] == CE || share_memory_cache[id][0][0] == CS || share_memory_cache[id][0][0] == CN)
          { /* If the data is in the top cache, we will sure that the state in valid, just change it to M, and invalid other cache/memory state*/
            fprintf(stderr, "Write data not in core 0 l1 cache! Already read back!\n");
            share_memory_cache[id][0][0] = CM;
            share_memory_memory[id] = MI;
            invalid_data(addr, id);
          }
          /* If in CM just do nothing */
        }
        else if (tmp == core1_id)
        {
          if (share_memory_cache[id][1][0] == CE || share_memory_cache[id][1][0] == CS || share_memory_cache[id][1][0] == CN)
          { /* If the data is in the top cache, we will sure that the state in valid, just change it to M, and invalid other cache/memory state*/
            fprintf(stderr, "Write data not in core 0 l1 cache! Already read back!\n");
            share_memory_cache[id][1][0] = CM;
            share_memory_memory[id] = MI;
            invalid_data(addr, id);
          }
          /* If in CM just do nothing*/
        }
      }
      return;
    }
    else
    {
      fprintf(stderr, "Error: data not in top level cache!\n");
      exit(-1);
    }
  }
  else
  {
    if (this->lowerCache == nullptr)
    {
      this->memory->setByteNoCache(addr, val);
    }
    else
    {
      this->lowerCache->setByte(addr, val);
    }
  }
}

void Cache::printInfo(bool verbose)
{
  printf("---------- Cache Info -----------\n");
  printf("Cache Size: %d bytes\n", this->policy.cacheSize);
  printf("Block Size: %d bytes\n", this->policy.blockSize);
  printf("Block Num: %d\n", this->policy.blockNum);
  printf("Associativiy: %d\n", this->policy.associativity);
  printf("Hit Latency: %d\n", this->policy.hitLatency);
  printf("Miss Latency: %d\n", this->policy.missLatency);

  if (verbose)
  {
    for (int j = 0; j < this->blocks.size(); ++j)
    {
      const Block &b = this->blocks[j];
      printf("Block %d: tag 0x%x id %d %s %s (last ref %d)\n", j, b.tag, b.id,
             b.valid ? "valid" : "invalid",
             b.modified ? "modified" : "unmodified", b.lastReference);
      // printf("Data: ");
      // for (uint8_t d : b.data)
      // printf("%d ", d);
      // printf("\n");
    }
  }
}

void Cache::printStatistics()
{
  int32_t tmp = pthread_self();
  if (tmp == core0_id)
  {
    sprintf(core0_out, "%s-------- STATISTICS ----------\n", core0_out);
    sprintf(core0_out, "%sNum Read: %d\n", core0_out, this->statistics.numRead);
    sprintf(core0_out, "%sNum Write: %d\n", core0_out, this->statistics.numWrite);
    sprintf(core0_out, "%sNum Hit: %d\n", core0_out, this->statistics.numHit);
    sprintf(core0_out, "%sNum Miss: %d\n", core0_out, this->statistics.numMiss);
    sprintf(core0_out, "%sTotal Cycles: %llu\n", core0_out, this->statistics.totalCycles);
    sprintf(core0_out, "%sHit rate: %f\n", core0_out, (float)this->statistics.numHit / (float)this->statistics.numMiss);
    if (this->lowerCache->lowerCache != nullptr)
    {
      sprintf(core0_out, "%s---------- LOWER CACHE ----------\n", core0_out);
      this->lowerCache->printStatistics();
    }
  }
  else if (tmp == core1_id)
  {
    sprintf(core1_out, "%s-------- STATISTICS ----------\n", core1_out);
    sprintf(core1_out, "%sNum Read: %d\n", core1_out, this->statistics.numRead);
    sprintf(core1_out, "%sNum Write: %d\n", core1_out, this->statistics.numWrite);
    sprintf(core1_out, "%sNum Hit: %d\n", core1_out, this->statistics.numHit);
    sprintf(core1_out, "%sNum Miss: %d\n", core1_out, this->statistics.numMiss);
    sprintf(core1_out, "%sTotal Cycles: %llu\n", core1_out, this->statistics.totalCycles);
    sprintf(core1_out, "%sHit rate: %f\n", core1_out, (float)this->statistics.numHit / (float)this->statistics.numMiss);
    if (this->lowerCache != nullptr)
    {
      sprintf(core1_out, "%s---------- LOWER CACHE ----------\n", core1_out);
      this->lowerCache->printStatistics();
    }
  }
}

bool Cache::isPolicyValid()
{
  if (!this->isPowerOfTwo(policy.cacheSize))
  {
    fprintf(stderr, "Invalid Cache Size %d\n", policy.cacheSize);
    return false;
  }
  if (!this->isPowerOfTwo(policy.blockSize))
  {
    fprintf(stderr, "Invalid Block Size %d\n", policy.blockSize);
    return false;
  }
  if (policy.cacheSize % policy.blockSize != 0)
  {
    fprintf(stderr, "cacheSize %% blockSize != 0\n");
    return false;
  }
  if (policy.blockNum * policy.blockSize != policy.cacheSize)
  {
    fprintf(stderr, "blockNum * blockSize != cacheSize\n");
    return false;
  }
  if (policy.blockNum % policy.associativity != 0)
  {
    fprintf(stderr, "blockNum %% associativity != 0\n");
    return false;
  }
  return true;
}

void Cache::initCache()
{
  this->blocks = std::vector<Block>(policy.blockNum);
  for (uint32_t i = 0; i < this->blocks.size(); ++i)
  {
    Block &b = this->blocks[i];
    b.valid = false;
    b.modified = false;
    b.size = policy.blockSize;
    b.tag = 0;
    b.id = i / policy.associativity;
    b.lastReference = 0;
    b.data = std::vector<uint8_t>(b.size);
  }
}

void Cache::loadBlockFromLowerLevel(const uint32_t addr, uint32_t *cycles)
{
  uint32_t blockSize = this->policy.blockSize;

  // Initialize new block from memory
  Block b;
  b.valid = true;
  b.modified = false;
  b.tag = this->getTag(addr);
  b.id = this->getId(addr);
  b.size = blockSize;
  b.data = std::vector<uint8_t>(b.size);
  uint32_t bits = this->log2i(blockSize);
  uint32_t mask = ~((1 << bits) - 1);
  uint32_t blockAddrBegin = addr & mask;
  for (uint32_t i = blockAddrBegin; i < blockAddrBegin + blockSize; ++i)
  {
    if (this->lowerCache == nullptr)
    {
      if (!is_shared_memory(addr))
      {
        b.data[i - blockAddrBegin] = this->memory->getByteNoCache(i);
        if (cycles)
          *cycles = 100;
      }
      /* MESI */
      else
      { /* L3 cache miss */
        uint32_t id = get_id_from_addr(addr);
        if (share_memory_memory[id] == MS)
        { /* Valid memory copy */
          /* First copy data back */
          b.data[i - blockAddrBegin] = this->memory->getByteNoCache(i);
          /* Then maintain right MESI state*/
          int32_t tmp = pthread_self();
          if (tmp == core0_id)
          { /* For core 0*/
            if ((share_memory_cache[id][1][0] == CN || share_memory_cache[id][1][0] == CI) &&
                (share_memory_cache[id][1][1] == CN || share_memory_cache[id][1][1] == CI))
            {
              // fprintf(stderr, "Core 0 read all cache miss! Has valid copy in memory! No other copy in core 1!\n");
              own_cache = true;
            }
            else
            {
              // fprintf(stderr, "Core 0 read all cache miss! Has valid copy in memory! Has other copy in core 1!\n");
              own_cache = false;
            }
          }
          else if (tmp == core1_id)
          { /* For core 1*/
            if ((share_memory_cache[id][0][0] == CN || share_memory_cache[id][0][0] == CI) &&
                (share_memory_cache[id][0][1] == CN || share_memory_cache[id][0][1] == CI))
            {
              // fprintf(stderr, "Core 1 read all cache miss! Has valid copy in memory! No other copy in core 0!\n");
              own_cache = true;
            }
            else
            {
              // fprintf(stderr, "Core 1 read all cache miss! Has valid copy in memory! Has other copy in core 0!\n");
              own_cache = false;
            }
          }
          read_modified_other_core_MESI(addr, id);
        }
        else if (share_memory_memory[id] == MI)
        { /* Invalid copy in memory, has data in another core*/
          /* First we need to copy data back*/
          fprintf(stderr, "id: %d\n", get_id_from_addr(addr));
          fprintf(stderr, "No data in current l1, l2, shared l3, memory, load from another core!\n");
          get_another_core_right_data_back(addr, id);
          /* Now I have correct data in memory */
          /* Read back from memory */
          if (share_memory_memory[id] == MS)
          { /* Valid memory copy */
            /* First copy data back */
            b.data[i - blockAddrBegin] = this->memory->getByteNoCache(i);
            /* Then maintain right MESI state*/
            int32_t tmp = pthread_self();
            if (tmp == core0_id)
            { /* For core 0*/
              if ((share_memory_cache[id][1][0] == CN || share_memory_cache[id][1][0] == CI) &&
                  (share_memory_cache[id][1][1] == CN || share_memory_cache[id][1][1] == CI) &&
                  (share_memory_cache[id][1][2] == CN || share_memory_cache[id][1][2] == CI))
              {
                fprintf(stderr, "Core 0 read all cache miss! Has valid copy in memory! No other copy in core 1!\n");
                own_cache = true;
              }
              else
              {
                fprintf(stderr, "Core 0 read all cache miss! Has valid copy in memory! Has other copy in core 1!\n");
                own_cache = false;
              }
            }
            else if (tmp == core1_id)
            { /* For core 1*/
              if ((share_memory_cache[id][0][0] == CN || share_memory_cache[id][0][0] == CI) &&
                  (share_memory_cache[id][0][1] == CN || share_memory_cache[id][0][1] == CI) &&
                  (share_memory_cache[id][0][2] == CN || share_memory_cache[id][0][2] == CI))
              {
                fprintf(stderr, "Core 1 read all cache miss! Has valid copy in memory! No other copy in core 0!\n");
                own_cache = true;
              }
              else
              {
                fprintf(stderr, "Core 1 read all cache miss! Has valid copy in memory! Has other copy in core 0!\n");
                own_cache = false;
              }
            }
            /* Change other core */
            read_modified_other_core_MESI(addr, id);
          }
          else
          {
            fprintf(stderr, "The currect data should be in memory!%x\n", addr);
            exit(-1);
          }
        }
      }
    }
    else
      b.data[i - blockAddrBegin] = this->lowerCache->getByte(i, cycles);
  }

  // Find replace block
  uint32_t id = this->getId(addr);
  uint32_t blockIdBegin = id * this->policy.associativity;
  uint32_t blockIdEnd = (id + 1) * this->policy.associativity;
  uint32_t replaceId = this->getReplacementBlockId(blockIdBegin, blockIdEnd);
  Block replaceBlock = this->blocks[replaceId];
  if (this->writeBack && replaceBlock.valid &&
      replaceBlock.modified)
  { // write back to memory
    this->writeBlockToLowerLevel(replaceBlock);
    this->statistics.totalCycles += this->policy.missLatency;
  }

  this->blocks[replaceId] = b;
}

uint32_t Cache::getReplacementBlockId(uint32_t begin, uint32_t end)
{
  // Find invalid block first
  for (uint32_t i = begin; i < end; ++i)
  {
    if (!this->blocks[i].valid)
      return i;
  }

  // Otherwise use LRU
  uint32_t resultId = begin;
  uint32_t min = this->blocks[begin].lastReference;
  for (uint32_t i = begin; i < end; ++i)
  {
    if (this->blocks[i].lastReference < min)
    {
      resultId = i;
      min = this->blocks[i].lastReference;
    }
  }
  return resultId;
}

void Cache::writeBlockToLowerLevel(Cache::Block &b)
{
  uint32_t addrBegin = this->getAddr(b);
  if (this->lowerCache == nullptr)
  {
    for (uint32_t i = 0; i < b.size; ++i)
    {
      this->memory->setByteNoCache(addrBegin + i, b.data[i]);
    }
    /* MESI */
    if (is_shared_memory(addrBegin))
    { /* If it is the last level, then write back to memory, and then put memory state to be shared */
      uint32_t id = get_id_from_addr(addrBegin);
      int32_t tmp = pthread_self();
      if (tmp == core0_id)
      {
        share_memory_cache[id][0][2] = CI;
        share_memory_memory[id] = MS;
      }
      else if (tmp == core1_id)
      {
        share_memory_cache[id][1][2] = CI;
        share_memory_memory[id] = MS;
      }
    }
  }
  else
  {
    for (uint32_t i = 0; i < b.size; ++i)
    {
      this->lowerCache->setByte(addrBegin + i, b.data[i]);
    }
    /* MESI */
    if (is_shared_memory(addrBegin))
    { /* If it is not last level, keep state to the next level */
      int32_t level = this->find_cache_level();
      uint32_t id = get_id_from_addr(addrBegin);
      int32_t tmp = pthread_self();
      if (tmp == core0_id)
      {
        share_memory_cache[id][0][level] = CI;
        share_memory_cache[id][0][level + 1] = CM;
      }
      else if (tmp == core1_id)
      {
        share_memory_cache[id][1][level] = CI;
        share_memory_cache[id][1][level + 1] = CM;
      }
    }
  }
}

bool Cache::isPowerOfTwo(uint32_t n) { return n > 0 && (n & (n - 1)) == 0; }

uint32_t Cache::log2i(uint32_t val)
{
  if (val == 0)
    return uint32_t(-1);
  if (val == 1)
    return 0;
  uint32_t ret = 0;
  while (val > 1)
  {
    val >>= 1;
    ret++;
  }
  return ret;
}

uint32_t Cache::getTag(uint32_t addr)
{
  uint32_t offsetBits = log2i(policy.blockSize);
  uint32_t idBits = log2i(policy.blockNum / policy.associativity);
  uint32_t mask = (1 << (32 - offsetBits - idBits)) - 1;
  return (addr >> (offsetBits + idBits)) & mask;
}

uint32_t Cache::getId(uint32_t addr)
{
  uint32_t offsetBits = log2i(policy.blockSize);
  uint32_t idBits = log2i(policy.blockNum / policy.associativity);
  uint32_t mask = (1 << idBits) - 1;
  return (addr >> offsetBits) & mask;
}

uint32_t Cache::getOffset(uint32_t addr)
{
  uint32_t bits = log2i(policy.blockSize);
  uint32_t mask = (1 << bits) - 1;
  return addr & mask;
}

uint32_t Cache::getAddr(Cache::Block &b)
{
  uint32_t offsetBits = log2i(policy.blockSize);
  uint32_t idBits = log2i(policy.blockNum / policy.associativity);
  return (b.tag << (offsetBits + idBits)) | (b.id << offsetBits);
}

int Cache::find_cache_level()
{
  if (this->lowerCache == nullptr)
  {
    return 2;
  }
  else if (this->lowerCache->lowerCache == nullptr)
  {
    return 1;
  }
  else if (this->lowerCache->lowerCache->lowerCache == nullptr)
  {
    return 0;
  }
}

uint32_t get_id_from_addr(uint32_t addr)
{ /* Minus the 0x100000 base, and get 32-bit begin address, to get the directory index */
  uint32_t offset = addr - 0x100000;
  uint32_t id = offset / 0x20;
  return id;
}

void read_modified_other_core_MESI(uint32_t addr, uint32_t id)
{
  int32_t tmp = pthread_self();
  if (tmp == core0_id)
  {
    if (own_cache == true)
    {
      // fprintf(stderr, "Own data in core 0, do nothing to core 1\n");
    }
    else
    {
      if (core1l1Cache->inCache(addr))
      {
        fprintf(stderr, "Find other copy in core1 l1 cache, change to S!\n");
        share_memory_cache[id][1][0] = CS;
      }
      if (core1l1Cache->lowerCache->inCache(addr))
      {
        fprintf(stderr, "Find other copy in core1 l2 cache, change to S!\n");
        share_memory_cache[id][1][1] = CS;
      }
      if (core1l1Cache->lowerCache->lowerCache->inCache(addr))
      {
        fprintf(stderr, "Find other copy in core1 l3 cache, change to S!\n");
        share_memory_cache[id][1][2] = CS;
      }
    }
  }
  else
  {
    if (own_cache == true)
    {
      // fprintf(stderr, "Own data in core 1, do nothing to core 0\n");
    }
    else
    {
      if (core0l1Cache->inCache(addr))
      {
        fprintf(stderr, "Find other copy in core0 l1 cache, change to S!\n");
        share_memory_cache[id][0][0] = CS;
      }
      if (core0l1Cache->lowerCache->inCache(addr))
      {
        fprintf(stderr, "Find other copy in core0 l2 cache, change to S!\n");
        share_memory_cache[id][0][1] = CS;
      }
      if (core0l1Cache->lowerCache->lowerCache->inCache(addr))
      {
        fprintf(stderr, "Find other copy in core0 l3 cache, change to S!\n");
        share_memory_cache[id][0][2] = CS;
      }
    }
  }
}

void get_another_core_right_data_back(uint32_t addr, uint32_t id)
{
  int32_t tmp = pthread_self();
  if (tmp == core0_id)
  {
    int blockId;
    if ((blockId = core1l1Cache->getBlockId(addr)) != -1)
    {
      fprintf(stderr, "Find correct data in core1 l1cache, write back to memory!\n");
      uint32_t sta_addr = (addr / l1Policy.blockSize) * l1Policy.blockSize;
      for (int i = 0; i < l1Policy.blockSize; i++)
      {
        core1l1Cache->blocks[blockId].lastReference = core1l1Cache->referenceCounter;
        core1l1Cache->memory->setByteNoCache(sta_addr + i, core1l1Cache->blocks[blockId].data[i]);
      }
      share_memory_cache[id][1][0] = CS;
      share_memory_memory[id] = MS;
      return;
    }
    else if ((blockId = core1l1Cache->lowerCache->getBlockId(addr)) != -1)
    {
      fprintf(stderr, "Find correct data in core 1 l2cache, write back to memory!\n");
      uint32_t sta_addr = (addr / l2Policy.blockSize) * l2Policy.blockSize;
      for (int i = 0; i < l2Policy.blockSize; i++)
      {
        core1l1Cache->lowerCache->blocks[blockId].lastReference = core1l1Cache->lowerCache->referenceCounter;
        core1l1Cache->lowerCache->memory->setByteNoCache(sta_addr + i, core1l1Cache->lowerCache->blocks[blockId].data[i]);
      }
      share_memory_cache[id][1][1] = CS;
      share_memory_memory[id] = MS;
      return;
    }

    if (blockId == -1)
    {
      fprintf(stderr, "id: %d\n", get_id_from_addr(addr));
      fprintf(stderr, "ERROR! NO VALID DATA IN ALL MEMORY AND CACHE! core 0 need data from core 1\n");
      exit(-1);
    }
  }
  else
  {
    int blockId;
    if ((blockId = core0l1Cache->getBlockId(addr)) != -1)
    {
      fprintf(stderr, "Find correct data in core0 l1cache, write back to memory!\n");
      uint32_t sta_addr = (addr / l1Policy.blockSize) * l1Policy.blockSize;
      for (int i = 0; i < l1Policy.blockSize; i++)
      {
        core0l1Cache->blocks[blockId].lastReference = core0l1Cache->referenceCounter;
        core0l1Cache->memory->setByteNoCache(sta_addr + i, core0l1Cache->blocks[blockId].data[i]);
      }
      share_memory_cache[id][1][0] = CS;
      share_memory_memory[id] = MS;
      return;
    }
    else if ((blockId = core0l1Cache->lowerCache->getBlockId(addr)) != -1)
    {
      fprintf(stderr, "Find correct data in core 0 l2cache, write back to memory!\n");
      uint32_t sta_addr = (addr / l2Policy.blockSize) * l2Policy.blockSize;
      for (int i = 0; i < l2Policy.blockSize; i++)
      {
        core0l1Cache->lowerCache->blocks[blockId].lastReference = core0l1Cache->lowerCache->referenceCounter;
        core0l1Cache->lowerCache->memory->setByteNoCache(sta_addr + i, core0l1Cache->lowerCache->blocks[blockId].data[i]);
      }
      share_memory_cache[id][1][1] = CS;
      share_memory_memory[id] = MS;
      return;
    }

    if (blockId == -1)
    {
      fprintf(stderr, "ERROR! NO VALID DATA IN ALL MEMORY AND CACHE!\n");
      exit(-1);
    }
  }
}

void invalid_data(uint32_t addr, uint32_t id)
{
  int32_t tmp = pthread_self();
  if (tmp == core0_id)
  {
    int blockId;
    if ((blockId = core0l1Cache->lowerCache->getBlockId(addr)) != -1)
    {
      fprintf(stderr, "Find old data copy in core 0 l2 cache, invalid!\n");
      core0l1Cache->lowerCache->blocks[blockId].valid = false;
      share_memory_cache[id][0][1] = CI;
    }
    if ((blockId = core0l1Cache->lowerCache->lowerCache->getBlockId(addr)) != -1)
    {
      fprintf(stderr, "Find old data copy in l3 cache, invalid!\n");
      core0l1Cache->lowerCache->lowerCache->blocks[blockId].valid = false;
      share_memory_cache[id][0][2] = share_memory_cache[id][1][2] = CI;
    }
    if ((blockId = core1l1Cache->getBlockId(addr)) != -1)
    {
      fprintf(stderr, "Find old data copy in core 1 l1 cache, invalid!\n");
      core1l1Cache->blocks[blockId].valid = false;
      share_memory_cache[id][1][0] = CI;
    }
    if ((blockId = core1l1Cache->lowerCache->getBlockId(addr)) != -1)
    {
      fprintf(stderr, "Find old data copy in core 1 l2 cache, invalid!\n");
      core1l1Cache->lowerCache->blocks[blockId].valid = false;
      share_memory_cache[id][1][1] = CI;
    }
  }
  else
  {
    int blockId;
    if ((blockId = core1l1Cache->lowerCache->getBlockId(addr)) != -1)
    {
      fprintf(stderr, "Find old data copy in core 1 l2 cache, invalid!\n");
      core1l1Cache->lowerCache->blocks[blockId].valid = false;
      share_memory_cache[id][1][1] = CI;
    }
    if ((blockId = core1l1Cache->lowerCache->lowerCache->getBlockId(addr)) != -1)
    {
      fprintf(stderr, "Find old data copy in l3 cache, invalid!\n");
      core1l1Cache->lowerCache->lowerCache->blocks[blockId].valid = false;
      share_memory_cache[id][1][2] = share_memory_cache[id][0][2] = CI;
    }
    if ((blockId = core0l1Cache->getBlockId(addr)) != -1)
    {
      fprintf(stderr, "Find old data copy in core 0 l1 cache, invalid!\n");
      core0l1Cache->blocks[blockId].valid = false;
      share_memory_cache[id][0][0] = CI;
    }
    if ((blockId = core0l1Cache->lowerCache->getBlockId(addr)) != -1)
    {
      fprintf(stderr, "Find old data copy in core 0 l2 cache, invalid!\n");
      core0l1Cache->lowerCache->blocks[blockId].valid = false;
      share_memory_cache[id][0][1] = CI;
    }
  }
}

bool is_shared_memory(uint32_t addr)
{
  if (addr <= 0x500000 && addr >= 100000)
  {
    return true;
  }
  return false;
}