void entry(undefined8 param_1,undefined8 param_2,ulong param_3,long param_4,char param_5)

{
  long lVar1;
  code *pcVar2;
  long lVar3;

  if (*(int *)(param_4 + 0xf60) == 3) {
    if (*(ulong *)(param_4 + 4000) <= param_3) {
      func_0x0001464ce413(param_1,param_2,*(ulong *)(param_4 + 4000),param_3,0x14769e458);
                    /* WARNING: Does not return */
      pcVar2 = (code *)invalidInstructionException();
      (*pcVar2)();
    }
    if (((*(long *)(*(long *)(param_4 + 0xf98) + 0x390 + param_3 * 0x858) != -1) &&
        (*(long *)(param_4 + 0xfe0) != -1)) && (*(long *)(param_4 + 0xff0) != 0)) {
      lVar1 = *(long *)(param_4 + 0xfe8);
      lVar3 = 0;
      do {
        if ((*(long *)(lVar1 + lVar3) ==
             *(long *)(*(long *)(param_4 + 0xf98) + param_3 * 0x858 + 0x560)) &&
           (*(char *)(lVar1 + 8 + lVar3) == '\0')) {
          *(char *)(lVar1 + 8 + lVar3) = '\x02' - param_5;
          return;
        }
        lVar3 = lVar3 + 0x10;
      } while (*(long *)(param_4 + 0xff0) << 4 != lVar3);
    }
  }
  return;
}
