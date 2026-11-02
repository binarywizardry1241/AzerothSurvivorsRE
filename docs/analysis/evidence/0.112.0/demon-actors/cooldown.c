
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(ulong param_1,ulong param_2,ulong param_3,long param_4)

{
  char cVar1;
  code *pcVar2;
  long *plVar3;
  long lVar4;
  long lVar5;
  undefined4 in_XMM6_Da;
  undefined4 in_XMM7_Da;
  undefined8 *local_d0;
  undefined8 local_c8;
  undefined8 local_70;
  undefined8 local_68;
  undefined8 local_50;
  undefined4 local_48;
  undefined4 local_38;

  local_50 = 0xfffffffffffffffe;
  local_48 = in_XMM6_Da;
  local_38 = in_XMM7_Da;
  if (*(ulong *)(param_4 + 0xd8) <= param_3) {
    func_0x000145da9883(param_1,param_2,*(ulong *)(param_4 + 0xd8),param_3,0x146c0b6f8);
                    /* WARNING: Does not return */
    pcVar2 = (code *)invalidInstructionException();
    (*pcVar2)();
  }
  cVar1 = *(char *)(*(long *)(*(long *)(param_4 + 0xd0) + 0x18 + param_3 * 0x80) + 0x39);
  if (cVar1 == '\0') {
    return;
  }
  if (cVar1 != '\a') {
    return;
  }
  local_70 = 0x146c0901a;
  local_68 = 0xb;
  lVar5 = 0;
  do {
    if (*(long *)(lVar5 + 0x146bf5eb8) == 0xb) {
      param_1 = **(ulong **)(lVar5 + 0x146bf5eb0) ^ 0x625f776f64616873;
      param_2 = *(ulong *)((long)*(ulong **)(lVar5 + 0x146bf5eb0) + 3) ^ 0x746c6f625f776f64 |
                param_1;
      if (param_2 == 0) {
        plVar3 = (long *)(lVar5 + 0x146bf5eb0);
        if (*(long *)(param_4 + 0x338) == 0) goto LAB_1459599f1;
        lVar4 = 0;
        break;
      }
    }
    lVar5 = lVar5 + 0x78;
    if (lVar5 == 0x34f8) {
      local_d0 = &local_70;
      local_c8 = 0x1400020c0;
      func_0x000145da9a60(param_1,param_2,&local_d0,0x146bf5098,0x146bf50a8);
                    /* WARNING: Does not return */
      pcVar2 = (code *)invalidInstructionException();
      (*pcVar2)();
    }
  } while( true );
  while (lVar4 = lVar4 + 0x58, plVar3 = (long *)(lVar5 + 0x146bf5eb0),
        *(long *)(param_4 + 0x338) * 0x58 - lVar4 != 0) {
    plVar3 = *(long **)(*(long *)(param_4 + 0x330) + lVar4);
    if ((plVar3[1] == 0xb) &&
       (*(long *)(*plVar3 + 3) == 0x746c6f625f776f64 && *(long *)*plVar3 == 0x625f776f64616873))
    break;
  }
LAB_1459599f1:
  func_0x000145897880(&local_d0,plVar3,param_4 + 0x1c8,&local_d0);
  func_0x000145897ab0();
  func_0x000145896300();
  return;
}
