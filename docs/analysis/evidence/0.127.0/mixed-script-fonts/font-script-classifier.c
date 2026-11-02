
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,byte *param_3,long *param_4,long param_5)

{
  byte *pbVar1;
  byte bVar2;
  long lVar3;
  uint uVar4;
  undefined4 uVar5;
  long lVar6;
  long lVar7;
  uint uVar8;
  long lVar9;
  byte *pbVar10;
  short *psVar11;
  undefined1 auVar12 [16];
  int iVar13;
  int iVar14;
  int iVar15;
  int iVar16;
  uint uVar17;
  uint uVar18;
  uint uVar19;
  uint uVar20;
  int iVar21;
  int iVar22;
  int iVar23;
  int iVar24;
  
  pbVar10 = param_3 + param_5;
  uVar17 = _DAT_14620d290;
  uVar18 = uRam000000014620d294;
  uVar19 = uRam000000014620d298;
  uVar20 = uRam000000014620d29c;
  iVar13 = _DAT_146272030;
  iVar14 = iRam0000000146272034;
  iVar15 = iRam0000000146272038;
  iVar16 = iRam000000014627203c;
  iVar21 = _DAT_146272040;
  iVar22 = iRam0000000146272044;
  iVar23 = iRam0000000146272048;
  iVar24 = iRam000000014627204c;
LAB_14027c394:
  do {
    if (param_3 == pbVar10) {
      return;
    }
    bVar2 = *param_3;
    uVar8 = (uint)bVar2;
    if ((char)bVar2 < '\0') {
      pbVar1 = param_3 + 1;
      if (bVar2 < 0xe0) {
        param_3 = param_3 + 2;
        uVar8 = (uVar8 & 0x1f) << 6 | *pbVar1 & 0x3f;
      }
      else {
        uVar4 = param_3[2] & 0x3f | (*pbVar1 & 0x3f) << 6;
        if (bVar2 < 0xf0) {
          param_3 = param_3 + 3;
          uVar8 = uVar4 | (uVar8 & 0x1f) << 0xc;
        }
        else {
          pbVar1 = param_3 + 3;
          param_3 = param_3 + 4;
          uVar8 = *pbVar1 & 0x3f | uVar4 << 6 | (uVar8 & 7) << 0x12;
        }
      }
    }
    else {
      param_3 = param_3 + 1;
    }
  } while (uVar8 < 0x1100);
  psVar11 = (short *)0x146273bec;
  if ((((0x2ba3 < uVar8 - 0xac00 && 0x5f < uVar8 - 0x3130) && (uVar8 & 0x1fff00) != 0x1100) &&
      (psVar11 = (short *)&DAT_146273bea,
      (0x39 < uVar8 - 0xff66 && 0xbf < uVar8 - 0x3040) && (uVar8 & 0x1ffff0) != 0x31f0)) &&
     (psVar11 = (short *)0x146273be8, (uVar8 & 0x1fffc0) != 0x3000)) goto code_r0x00014027c531;
  goto LAB_14027c4b4;
code_r0x00014027c531:
  auVar12._0_4_ = -(uint)(iVar21 < (int)(uVar8 + iVar13 ^ uVar17));
  auVar12._4_4_ = -(uint)(iVar22 < (int)(uVar8 + iVar14 ^ uVar18));
  auVar12._8_4_ = -(uint)(iVar23 < (int)(uVar8 + iVar15 ^ uVar19));
  auVar12._12_4_ = -(uint)(iVar24 < (int)(uVar8 + iVar16 ^ uVar20));
  uVar5 = movmskps(uVar8,auVar12);
  psVar11 = (short *)0x146273be8;
  if ((char)uVar5 != '\x0f') {
LAB_14027c4b4:
    lVar6 = param_4[1];
    lVar3 = param_4[2];
    lVar9 = lVar3 * 0x10;
    if (lVar3 != 0) {
      lVar7 = 0;
      do {
        if ((*(long *)(lVar6 + 8 + lVar7) == 2) && (**(short **)(lVar6 + lVar7) == *psVar11))
        goto LAB_14027c394;
        lVar7 = lVar7 + 0x10;
      } while (lVar9 != lVar7);
    }
    if (lVar3 == *param_4) {
      func_0x000146062030();
      lVar6 = param_4[1];
    }
    *(short **)(lVar6 + lVar9) = psVar11;
    *(undefined8 *)(lVar6 + 8 + lVar9) = 2;
    param_4[2] = lVar3 + 1;
  }
  goto LAB_14027c394;
}

