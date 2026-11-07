ulong * FUN_14589e020(undefined8 param_1,undefined8 param_2,long param_3,ulong *param_4,char param_5
                     )

{
  char *pcVar1;
  code *pcVar2;
  ulong uVar3;
  long lVar4;
  long lVar5;
  ulong uVar6;
  ulong uVar7;

  uVar6 = 0;
  lVar4 = 0;
  lVar5 = *(long *)(param_3 + 0x68);
  do {
    if (*(long *)(param_3 + 0x70) << 5 == lVar4) {
      uVar3 = 8;
      uVar7 = 0;
      goto LAB_14589e0f6;
    }
    lVar4 = lVar4 + 0x20;
    pcVar1 = (char *)(lVar5 + 4);
    lVar5 = lVar5 + 0x20;
  } while (*pcVar1 != param_5);
  uVar7 = *(ulong *)(*(long *)(param_3 + 0x68) + -8 + lVar4);
  if (0x7ffffffffffffff8 < uVar7 << 4 || uVar7 >> 0x3c != 0) {
LAB_14589e093:
    func_0x000145d992bb();
                    /* WARNING: Does not return */
    pcVar2 = (code *)invalidInstructionException();
    (*pcVar2)();
  }
  if (uVar7 << 4 == 0) {
    uVar3 = 8;
    uVar6 = 0;
  }
  else {
    func_0x000140002200();
    uVar3 = func_0x0001400021c0();
    uVar6 = uVar7;
    if (uVar3 == 0) goto LAB_14589e093;
  }
  if (uVar7 != 0) {
    func_0x000145bfa0e7();
  }
LAB_14589e0f6:
  *param_4 = uVar6;
  param_4[1] = uVar3;
  param_4[2] = uVar7;
  return param_4;
}
