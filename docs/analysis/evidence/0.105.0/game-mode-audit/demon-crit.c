/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8
FUN_145950e90(ulong param_1,undefined8 param_2,ulong param_3,long param_4,undefined8 param_5,
             long param_6)

{
  long *plVar1;
  char *pcVar2;
  char cVar3;
  ulong uVar4;
  code *pcVar5;
  ulong uVar6;
  ulong uVar7;
  long lVar8;
  int *piVar9;
  long lVar10;
  long lVar11;
  ulong uVar12;
  byte bVar13;
  ulong uVar14;
  float fVar15;
  float fVar16;
  long lVar17;
  long lVar18;
  undefined1 auVar19 [16];
  undefined1 auVar20 [16];

  if (*(ulong *)(param_4 + 0xd8) <= param_3) {
    func_0x000145d697e3(param_1,param_2,*(ulong *)(param_4 + 0xd8),param_3,0x146e7aa70);
                    /* WARNING: Does not return */
    pcVar5 = (code *)invalidInstructionException();
    (*pcVar5)();
  }
  lVar10 = *(long *)(param_4 + 0x778);
  uVar4 = *(ulong *)(param_4 + 0x780);
  if (uVar4 == 0) {
    uVar12 = *(ulong *)(param_4 + 0x380);
  }
  else {
    if (uVar4 != 1) {
      uVar12 = 0;
      do {
        uVar12 = uVar12 + 2;
      } while ((uVar4 & 0xfffffffffffffffe) != uVar12);
    }
    uVar12 = *(ulong *)(param_4 + 0x380);
  }
  if (uVar12 != 0) {
    if (uVar12 == 1) {
      param_1 = 0;
    }
    else {
      param_1 = 0;
      do {
        param_1 = param_1 + 2;
      } while ((uVar12 & 0xfffffffffffffffe) != param_1);
      if ((uVar12 & 1) == 0) goto LAB_145951058;
    }
    uVar12 = param_1 * 3;
  }
LAB_145951058:
  fVar15 = _DAT_145d70c70;
  if (uVar4 != 0) {
    if (uVar4 == 1) {
      uVar7 = 0;
    }
    else {
      uVar7 = 0;
      do {
        if (*(char *)(lVar10 + uVar7 * 8) == '\x1d') {
          fVar15 = fVar15 + *(float *)(lVar10 + 4 + uVar7 * 8);
          cVar3 = *(char *)(lVar10 + 8 + uVar7 * 8);
        }
        else {
          cVar3 = *(char *)(lVar10 + 8 + uVar7 * 8);
        }
        if (cVar3 == '\x1d') {
          fVar15 = fVar15 + *(float *)(lVar10 + 0xc + uVar7 * 8);
        }
        uVar7 = uVar7 + 2;
      } while ((uVar4 & 0xfffffffffffffffe) != uVar7);
      if ((uVar4 & 1) == 0) goto LAB_1459510fb;
    }
    if (*(char *)(lVar10 + uVar7 * 8) == '\x1d') {
      fVar15 = fVar15 + *(float *)(lVar10 + 4 + uVar7 * 8);
    }
  }
LAB_1459510fb:
  fVar15 = *(float *)(param_4 + 0x484) + fVar15;
  if (*(char *)(*(long *)(*(long *)(param_4 + 0xd0) + 0x18 + param_3 * 0x78) + 0x39) != '\x02')
  goto LAB_145951145;
  lVar10 = 0;
  do {
    if (*(long *)(param_4 + 0x7b0) << 6 == lVar10) {
      bVar13 = 0;
      goto LAB_14595122e;
    }
    lVar8 = lVar10 + 0x40;
    pcVar2 = (char *)(*(long *)(param_4 + 0x7a8) + lVar10);
    lVar10 = lVar8;
  } while (*pcVar2 != '\x1e');
  bVar13 = *(byte *)(*(long *)(param_4 + 0x7a8) + -0x3f + lVar8);
LAB_14595122e:
  lVar8 = *(long *)(param_4 + 0x560);
  lVar11 = 0;
  lVar10 = lVar8;
  do {
    if (*(long *)(param_4 + 0x568) * 0x160 - lVar11 == 0) goto LAB_145951145;
    lVar11 = lVar11 + 0x160;
    plVar1 = (long *)(lVar10 + 0x88);
    lVar10 = lVar10 + 0x160;
  } while (*plVar1 != param_6);
  if ((bVar13 != 0) && (3 < bVar13)) {
    func_0x000145d697e3(param_1,uVar12,3,(ulong)bVar13 - 1,0x146e7aa98);
                    /* WARNING: Does not return */
    pcVar5 = (code *)invalidInstructionException();
    (*pcVar5)();
  }
  uVar4 = *(ulong *)(lVar8 + -0x150 + lVar11);
  if (uVar4 == 0) goto LAB_145951145;
  lVar10 = *(long *)(lVar8 + -0x158 + lVar11);
  if (uVar4 < 4) {
    uVar7 = 0;
    uVar12 = 0;
LAB_145951396:
    lVar8 = uVar4 - uVar7;
    piVar9 = (int *)(lVar10 + uVar7 * 0x30 + 0x10);
    do {
      uVar12 = uVar12 + (*piVar9 == 0x3d4);
      piVar9 = piVar9 + 0xc;
      lVar8 = lVar8 + -1;
    } while (lVar8 != 0);
  }
  else {
    uVar7 = uVar4 & 0xfffffffffffffffc;
    piVar9 = (int *)(lVar10 + 0xa0);
    lVar17 = 0;
    lVar18 = 0;
    lVar8 = 0;
    lVar11 = 0;
    uVar12 = uVar7;
    do {
      auVar19._0_4_ = -(uint)(piVar9[-0x24] == _DAT_146e786f0);
      auVar19._4_4_ = -(uint)(iRam0000000146e786f4 == 0);
      auVar19._8_4_ = -(uint)(piVar9[-0x18] == iRam0000000146e786f8);
      auVar19._12_4_ = -(uint)(iRam0000000146e786fc == 0);
      lVar8 = lVar8 + SUB168(auVar19 & _DAT_145d6d310,0);
      lVar11 = lVar11 + SUB168(auVar19 & _DAT_145d6d310,8);
      auVar20._0_4_ = -(uint)(piVar9[-0xc] == _DAT_146e786f0);
      auVar20._4_4_ = -(uint)(iRam0000000146e786f4 == 0);
      auVar20._8_4_ = -(uint)(*piVar9 == iRam0000000146e786f8);
      auVar20._12_4_ = -(uint)(iRam0000000146e786fc == 0);
      lVar17 = lVar17 + SUB168(auVar20 & _DAT_145d6d310,0);
      lVar18 = lVar18 + SUB168(auVar20 & _DAT_145d6d310,8);
      piVar9 = piVar9 + 0x30;
      uVar12 = uVar12 - 4;
    } while (uVar12 != 0);
    uVar12 = lVar18 + lVar11 + lVar17 + lVar8;
    if (uVar4 != uVar7) goto LAB_145951396;
  }
  if (uVar12 != 0) {
    fVar15 = fVar15 + (float)uVar12 * _DAT_145d73d44;
  }
LAB_145951145:
  uVar12 = *(ulong *)(param_4 + 0x958);
  uVar7 = *(ulong *)(param_4 + 0x960);
  uVar4 = *(ulong *)(param_4 + 0x970) + uVar12;
  uVar14 = *(ulong *)(param_4 + 0x968) ^ uVar12;
  uVar6 = *(ulong *)(param_4 + 0x970) ^ uVar7;
  *(ulong *)(param_4 + 0x960) = uVar7 ^ uVar14;
  *(ulong *)(param_4 + 0x958) = uVar12 ^ uVar6;
  *(ulong *)(param_4 + 0x968) = uVar14 ^ uVar7 << 0x11;
  uVar7 = uVar6 << 0x2d | uVar6 >> 0x13;
  fVar16 = (float)(uint)((uVar4 * 0x800000 | uVar4 >> 0x29) + uVar12 >> 0x28) * _DAT_145e4cdf4;
  if (_DAT_145d6d36c <= fVar15) {
    fVar15 = _DAT_145d6d36c;
  }
  *(ulong *)(param_4 + 0x970) = uVar7;
  return CONCAT71((int7)(uVar7 >> 8),fVar16 < fVar15);
}
