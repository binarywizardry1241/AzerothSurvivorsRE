void FUN_145fc4810(ulonglong *param_1)

{
  code *pcVar1;
  ulonglong uVar2;
  ulonglong uVar3;
  int aiStack_28 [2];
  ulonglong uStack_20;
  undefined8 uStack_18;

  uVar2 = *param_1 * 2;
  uVar3 = 4;
  if (4 < uVar2) {
    uVar3 = uVar2;
  }
  FUN_145f94a80(aiStack_28,*param_1,param_1[1],uVar3,4,8);
  if (aiStack_28[0] != 1) {
    param_1[1] = uStack_20;
    *param_1 = uVar3;
    return;
  }
  FUN_14613b1bb(uStack_20,uStack_18);
                    /* WARNING: Does not return */
  pcVar1 = (code *)invalidInstructionException();
  (*pcVar1)();
}
