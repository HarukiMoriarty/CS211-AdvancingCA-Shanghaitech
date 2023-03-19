#include "lib.h"

/**
 * Compare and Swap
 * @param dest
 * @param new_value
 * @param old_value
 * @return success `1' or not `0'
 */
int CAS(long *dest, long new_value, long old_value)
{
  int ret = 0;

  // TODO: write your code here
  __asm__ __volatile__(
      "retry: lr.w  %0, %[output2]\n"
      "       bne   %0, %[input1], fail\n"
      "       sc.w  %0, %[input2], %[output2]\n"
      "       bnez  %0, retry\n"
      "       li    %[output1], 1\n"
      "       j     success\n"
      "fail:  li    %[output1], 0\n"
      "success: \n"
      : [output1] "=&r"(ret), [output2] "+A"(*dest)
      : [input1] "rJ"(old_value), [input2] "rJ"(new_value)
      : "memory");

  return ret;
}

static long dst;

int main()
{
  int res;

  dst = 1;

  for (int i = 0; i < 2; ++i)
  {
    res = CAS(&dst, 211, i);
    if (res)
      print_s("CAS SUCCESS\n");
    else
      print_s("CAS FAIL\n");

    print_d(res);
    print_c('\n');
    print_d(dst);
    print_c('\n');
  }

  exit_proc();
}