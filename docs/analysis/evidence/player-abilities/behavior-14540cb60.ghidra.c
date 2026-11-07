
void entry(undefined8 param_1,undefined8 param_2,ulong param_3,long param_4,ulong *param_5)

{
  undefined8 uVar1;
  int iVar2;
  long lVar3;
  undefined1 auVar4 [16];
  undefined1 auVar5 [16];
  code *pcVar6;
  ulong uVar7;
  ulong uVar8;
  ulong uVar9;
  ulong uVar10;
  ulong uVar11;
  uint uVar12;
  ulong uVar13;
  ulong uVar14;
  
  if (1 < param_3) {
    uVar10 = *param_5;
    uVar11 = param_5[1];
    uVar9 = param_5[3];
    uVar14 = param_5[2];
    uVar13 = param_3;
    do {
      if (uVar13 >> 0x20 == 0) {
        iVar2 = 0x1f;
        uVar12 = (uint)uVar13;
        if (uVar12 != 0) {
          for (; uVar12 >> iVar2 == 0; iVar2 = iVar2 + -1) {
          }
        }
        do {
          uVar8 = ((uVar10 + uVar9) * 0x800000 | uVar10 + uVar9 >> 0x29) + uVar10;
          uVar7 = uVar11 << 0x11;
          uVar14 = uVar14 ^ uVar10;
          uVar9 = uVar9 ^ uVar11;
          uVar11 = uVar11 ^ uVar14;
          uVar10 = uVar10 ^ uVar9;
          uVar9 = uVar9 << 0x2d | uVar9 >> 0x13;
          uVar14 = uVar14 ^ uVar7;
          uVar7 = (uVar8 >> 0x20) * uVar13;
        } while ((uVar12 << (~(byte)iVar2 & 0x1f)) - 1 < (uint)uVar7);
        *param_5 = uVar10;
        param_5[3] = uVar9;
        param_5[1] = uVar11;
        param_5[2] = uVar14;
        uVar7 = uVar7 >> 0x20;
      }
      else {
        lVar3 = 0x3f;
        if (uVar13 != 0) {
          for (; uVar13 >> lVar3 == 0; lVar3 = lVar3 + -1) {
          }
        }
        do {
          uVar7 = ((uVar10 + uVar9) * 0x800000 | uVar10 + uVar9 >> 0x29) + uVar10;
          uVar8 = uVar11 << 0x11;
          uVar14 = uVar14 ^ uVar10;
          uVar9 = uVar9 ^ uVar11;
          uVar10 = uVar10 ^ uVar9;
          uVar9 = uVar9 << 0x2d | uVar9 >> 0x13;
          uVar11 = uVar11 ^ uVar14;
          auVar4._8_8_ = 0;
          auVar4._0_8_ = uVar7;
          auVar5._8_8_ = 0;
          auVar5._0_8_ = uVar13;
          uVar7 = SUB168(auVar4 * auVar5,8);
          uVar14 = uVar14 ^ uVar8;
        } while ((uVar13 << (~(byte)lVar3 & 0x3f)) - 1 < SUB168(auVar4 * auVar5,0));
        *param_5 = uVar10;
        param_5[3] = uVar9;
        param_5[1] = uVar11;
        param_5[2] = uVar14;
      }
      uVar13 = uVar13 - 1;
      if (param_3 <= uVar13) {
        func_0x0001458e75b3(uVar11,uVar10,param_3,uVar13,0x14670e7a0);
                    /* WARNING: Does not return */
        pcVar6 = (code *)invalidInstructionException();
        (*pcVar6)();
      }
      if (param_3 <= uVar7) {
        func_0x0001458e75b3(uVar11,uVar10,param_3,uVar7,0x14670e7a0);
                    /* WARNING: Does not return */
        pcVar6 = (code *)invalidInstructionException();
        (*pcVar6)();
      }
      uVar1 = *(undefined8 *)(param_4 + uVar13 * 8);
      *(undefined8 *)(param_4 + uVar13 * 8) = *(undefined8 *)(param_4 + uVar7 * 8);
      *(undefined8 *)(param_4 + uVar7 * 8) = uVar1;
    } while (1 < uVar13);
  }
  return;
}

