ulong * FUN_1400a9710(undefined8 param_1,undefined8 param_2,long param_3,ulong *param_4,long param_5
                     )

{
  code *pcVar1;
  long lVar2;
  ulong uVar3;
  ulong uVar4;
  ulong uVar5;
  undefined1 auVar6 [16];
  ulong local_48;

  uVar4 = param_5 - param_3;
  if (0x7ffffffffffffff8 < uVar4 * 2 || 0x7ffffffffffffff8 < uVar4) {
LAB_1400a9755:
    func_0x000145d992bb();
                    /* WARNING: Does not return */
    pcVar1 = (code *)invalidInstructionException();
    (*pcVar1)();
  }
  uVar5 = uVar4 >> 3;
  if (uVar4 * 2 == 0) {
    local_48 = 8;
    uVar4 = 0;
  }
  else {
    func_0x000140002200();
    local_48 = func_0x0001400021c0();
    uVar4 = uVar5;
    if (local_48 == 0) goto LAB_1400a9755;
  }
  if (param_3 == param_5) {
    uVar5 = 0;
  }
  else {
    lVar2 = 0;
    uVar3 = uVar5;
    do {
      auVar6 = FUN_14590eac0();
      *(long *)(local_48 + lVar2 * 2) = auVar6._0_8_;
      *(long *)(local_48 + 8 + lVar2 * 2) = auVar6._8_8_;
      lVar2 = lVar2 + 8;
      uVar3 = uVar3 - 1;
    } while (uVar3 != 0);
  }
  *param_4 = uVar4;
  param_4[1] = local_48;
  param_4[2] = uVar5;
  return param_4;
}
