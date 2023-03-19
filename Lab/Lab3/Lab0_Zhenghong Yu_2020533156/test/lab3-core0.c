#include "lib.h"

int main()
{

  char *a;
  a = 0x100000;
  a[0] = 'C';
  print_c(a[666]);
  print_c(a[257]);
  print_c('\n');

  exit_proc();
}