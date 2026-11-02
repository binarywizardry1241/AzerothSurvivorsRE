
/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,long param_2)

{
  if ((*(int *)(param_2 + 0x970) == 1) && (*(char *)(param_2 + 0xab8) != '\0')) {
    func_0x000145bfa165();
    func_0x000145bfa165();
  }
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}

