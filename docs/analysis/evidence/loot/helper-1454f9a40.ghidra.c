
int entry(undefined8 param_1,undefined8 param_2,uint param_3,ulong *param_4,uint param_5)

{
  int iVar1;
  code *pcVar2;
  ulong uVar3;
  ulong uVar4;
  ulong uVar5;
  ulong uVar6;
  long lVar7;
  uint uVar8;
  ulong uVar9;
  ulong uVar10;

  uVar8 = param_5 - param_3;
  if (param_3 <= param_5 && uVar8 != 0) {
    iVar1 = 0x1f;
    if (uVar8 != 0) {
      for (; uVar8 >> iVar1 == 0; iVar1 = iVar1 + -1) {
      }
    }
    uVar10 = *param_4;
    uVar3 = param_4[1];
    uVar5 = param_4[3];
    uVar9 = param_4[2];
    do {
      uVar6 = ((uVar10 + uVar5) * 0x800000 | uVar10 + uVar5 >> 0x29) + uVar10;
      uVar4 = uVar3 << 0x11;
      uVar9 = uVar9 ^ uVar10;
      uVar5 = uVar5 ^ uVar3;
      uVar3 = uVar3 ^ uVar9;
      uVar10 = uVar10 ^ uVar5;
      uVar5 = uVar5 << 0x2d | uVar5 >> 0x13;
      uVar9 = uVar9 ^ uVar4;
      lVar7 = (uVar6 >> 0x20) * (ulong)uVar8;
    } while ((uVar8 << (~(byte)iVar1 & 0x1f)) - 1 < (uint)lVar7);
    *param_4 = uVar10;
    param_4[3] = uVar5;
    param_4[1] = uVar3;
    param_4[2] = uVar9;
    return param_3 + (int)((ulong)lVar7 >> 0x20);
  }
  func_0x0001458e7770(param_1,param_2,0x19,0x1469ad725,0x1469ad7a0);
                    /* WARNING: Does not return */
  pcVar2 = (code *)invalidInstructionException();
  (*pcVar2)();
}
