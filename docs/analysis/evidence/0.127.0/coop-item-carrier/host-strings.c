
ulong * entry(undefined8 param_1,undefined8 param_2,long param_3,ulong *param_4,long param_5)

{
  code *pcVar1;
  long lVar2;
  long lVar3;
  ulong uVar4;
  long lVar5;
  long *plVar6;
  ulong uVar7;
  long local_80;
  long local_78;
  long local_70;
  ulong local_68;
  ulong uStack_60;
  
  uVar7 = (ulong)(param_5 - param_3) >> 2;
  if (0x1555555555555554 < (ulong)(param_5 - param_3)) {
LAB_145d0331b:
    func_0x00014620896b();
                    /* WARNING: Does not return */
    pcVar1 = (code *)invalidInstructionException();
    (*pcVar1)();
  }
  if (uVar7 * 0x18 == 0) {
    local_68 = 0;
    uStack_60 = 8;
  }
  else {
    func_0x000140002200();
    uStack_60 = func_0x0001400021c0();
    local_68 = uVar7;
    if (uStack_60 == 0) goto LAB_145d0331b;
  }
  if (param_3 == param_5) {
    uVar7 = 0;
  }
  else {
    plVar6 = (long *)(uStack_60 + 0x10);
    uVar4 = 0;
    do {
      func_0x000145af3cf0();
      lVar3 = local_80;
      lVar5 = local_78;
      lVar2 = local_70;
      if (local_80 == -1) {
        lVar5 = 1;
        lVar3 = 0;
        lVar2 = 0;
      }
      plVar6[-2] = lVar3;
      plVar6[-1] = lVar5;
      *plVar6 = lVar2;
      uVar4 = uVar4 + 1;
      plVar6 = plVar6 + 3;
    } while (uVar7 != uVar4);
  }
  param_4[2] = uVar7;
  *param_4 = local_68;
  param_4[1] = uStack_60;
  return param_4;
}

