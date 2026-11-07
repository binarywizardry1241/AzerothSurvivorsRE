
void FUN_145829f80(undefined8 param_1,undefined8 param_2,ulong param_3,long param_4,int param_5)

{
  code *pcVar1;
  undefined2 uVar2;
  uint uVar3;
  uint uVar4;
  
  if (param_3 < 4) {
    uVar3 = (uint)*(ushort *)(param_4 + param_3 * 2) +
            (uint)*(ushort *)(param_3 * 0x30 + 0x146ccb878) *
            (int)(char)((0 < param_5) - (param_5 < 0));
    uVar4 = (uint)*(ushort *)(param_3 * 0x30 + 0x146ccb876);
    if (uVar3 < uVar4) {
      uVar4 = uVar3;
    }
    uVar2 = 100;
    if (99 < (int)uVar3) {
      uVar2 = (undefined2)uVar4;
    }
    *(undefined2 *)(param_4 + param_3 * 2) = uVar2;
    return;
  }
  func_0x000145eb7363(param_1,param_2,4,param_3,0x146ccb938);
                    /* WARNING: Does not return */
  pcVar1 = (code *)invalidInstructionException();
  (*pcVar1)();
}

