void FUN_14006af20(undefined8 param_1,undefined8 param_2,undefined8 param_3,long *param_4)

{
  code *pcVar1;
  ulong uVar2;
  int iVar3;
  long lVar4;
  ulong uStack_48;
  ulong uStack_40;
  long lStack_38;
  undefined8 uStack_30;

  uStack_30 = 0xfffffffffffffffe;
  uStack_48 = 0;
  lVar4 = FUN_1400b2670(param_3,param_4,&uStack_48,param_3,8);
  if (lVar4 == 0) {
    uVar2 = uStack_48 >> 0x20;
    if (uVar2 < 0x100001) {
      iVar3 = (int)uStack_48;
      if (uVar2 == 0) {
        lStack_38 = 1;
      }
      else {
        func_0x000140002200();
        lStack_38 = func_0x0001400021f0();
        if (lStack_38 == 0) {
          func_0x000145d992bb();
                    /* WARNING: Does not return */
          pcVar1 = (code *)invalidInstructionException();
          (*pcVar1)();
        }
      }
      uStack_40 = uVar2;
      lVar4 = FUN_1400b2670();
      if (lVar4 == 0) {
        if (iVar3 != 2) {
          *(int *)param_4 = iVar3;
          param_4[1] = uStack_40;
          param_4[2] = lStack_38;
          param_4[3] = uStack_40;
          return;
        }
        *param_4 = 0x600000003;
        param_4[1] = -1;
      }
      else {
        *param_4 = lVar4;
        param_4[1] = -1;
      }
      if (uStack_40 == 0) {
        return;
      }
      func_0x0001400021d0();
      return;
    }
    lVar4 = 0x1500000003;
  }
  *param_4 = lVar4;
  param_4[1] = -1;
  return;
}
