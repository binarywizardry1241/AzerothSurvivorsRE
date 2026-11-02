
/* WARNING: Removing unreachable block (ram,0x0001454a5594) */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2)

{
  long *plVar1;
  char *pcVar2;
  undefined8 *puVar3;
  ushort uVar4;
  long lVar5;
  long in_RCX;
  long lVar6;
  undefined4 uVar7;
  int in_R8D;
  ulong uVar8;
  ulong uVar9;
  ulong uVar10;
  bool bVar11;
  float fVar12;
  float fVar13;
  undefined4 in_XMM1_Dc;
  undefined4 in_XMM1_Dd;
  float fVar14;
  float fVar15;
  undefined4 uVar16;
  undefined1 auVar17 [16];
  undefined1 auVar18 [16];
  float fVar19;
  float fVar20;
  undefined8 local_98;
  undefined8 uStack_90;
  undefined8 local_88;
  undefined8 uStack_80;

  fVar19 = (float)param_2;
  fVar12 = *(float *)(in_RCX + 0x418);
  fVar13 = fVar19 + fVar12;
  fVar20 = fVar13;
  if (*(float *)(in_RCX + 0x470) <= fVar13) {
    fVar20 = *(float *)(in_RCX + 0x470);
  }
  auVar17._4_4_ = (int)((ulong)param_2 >> 0x20);
  auVar17._0_4_ = (uint)fVar13 & -(uint)NAN(fVar20);
  auVar17._8_4_ = in_XMM1_Dc;
  auVar17._12_4_ = in_XMM1_Dd;
  auVar17 = ZEXT416(~-(uint)NAN(fVar20) & (uint)fVar20) | auVar17;
  fVar20 = auVar17._0_4_;
  *(float *)(in_RCX + 0x418) = fVar20;
  auVar18._4_12_ = auVar17._4_12_;
  auVar18._0_4_ = fVar20 - fVar12;
  func_0x0001454a53b0();
  if (in_R8D != 0) {
    fVar20 = auVar18._0_4_;
    fVar12 = fVar20;
    if (fVar20 <= 0.0) {
      fVar12 = 0.0;
    }
    fVar19 = fVar19 - fVar20;
    if (fVar19 <= 0.0) {
      fVar19 = 0.0;
    }
    if (0.0 < fVar19) {
      lVar5 = 0;
      do {
        if (*(long *)(in_RCX + 0x718) << 6 == lVar5) goto LAB_1454a55d4;
        lVar6 = lVar5 + 0x40;
        pcVar2 = (char *)(*(long *)(in_RCX + 0x710) + lVar5);
        lVar5 = lVar6;
      } while (*pcVar2 != '\x14');
      fVar13 = *(float *)(*(long *)(in_RCX + 0x710) + -0x3c + lVar6) * *(float *)(in_RCX + 0x470);
      if (*(float *)(in_RCX + 0x41c) < fVar13) {
        fVar14 = *(float *)(in_RCX + 0x41c) + fVar19;
        fVar15 = fVar14;
        if (fVar13 <= fVar14) {
          fVar15 = fVar13;
        }
        *(uint *)(in_RCX + 0x41c) =
             ~-(uint)NAN(fVar15) & (uint)fVar15 | (uint)fVar14 & -(uint)NAN(fVar15);
      }
    }
LAB_1454a55d4:
    if (0.0 < fVar12 + fVar19) {
      lVar5 = 0;
      do {
        if (*(long *)(in_RCX + 0x718) << 6 == lVar5) goto LAB_1454a561f;
        pcVar2 = (char *)(*(long *)(in_RCX + 0x710) + lVar5);
        lVar5 = lVar5 + 0x40;
      } while (*pcVar2 != '\x15');
      *(float *)(in_RCX + 0x120) = fVar12 + fVar19 + *(float *)(in_RCX + 0x120);
    }
LAB_1454a561f:
    if (_DAT_145907490 <= fVar20) {
      func_0x00014545d980();
      lVar5 = *(long *)(in_RCX + 0x560);
      if (lVar5 == *(long *)(in_RCX + 0x550)) {
        func_0x000145774710();
      }
      lVar6 = *(long *)(in_RCX + 0x558);
      puVar3 = (undefined8 *)(lVar6 + 0x10 + lVar5 * 0x20);
      *puVar3 = local_88;
      puVar3[1] = uStack_80;
      puVar3 = (undefined8 *)(lVar6 + lVar5 * 0x20);
      *puVar3 = local_98;
      puVar3[1] = uStack_90;
      *(long *)(in_RCX + 0x560) = lVar5 + 1;
    }
  }
  fVar12 = *(float *)(in_RCX + 0x418);
  uVar16 = *(undefined4 *)(in_RCX + 0x470);
  fVar20 = 0.0;
  if (fVar12 <= 0.0) {
    fVar12 = 0.0;
  }
  fVar12 = (float)func_0x00014577327d(fVar12);
  uVar7 = (int)(long)fVar12;
  if (fVar12 < fVar20) {
    uVar7 = 0;
  }
  if (_DAT_14590752c < fVar12) {
    uVar7 = 0xffffffff;
  }
  fVar12 = _DAT_14590752c;
  fVar19 = (float)func_0x00014577327d(uVar16);
  uVar16 = (int)(long)fVar19;
  if (fVar19 < fVar20) {
    uVar16 = 0;
  }
  if (fVar12 < fVar19) {
    uVar16 = 0xffffffff;
  }
  plVar1 = (long *)(in_RCX + 0x8d8);
  lVar5 = *(long *)(in_RCX + 0x8d8);
  if (lVar5 != 0) {
    lVar6 = *(long *)(in_RCX + 0x8e0);
    do {
      uVar10 = (ulong)((uint)*(ushort *)(lVar5 + 0x36) * 2);
      uVar9 = 0xffffffffffffffff;
      do {
        uVar8 = (ulong)*(ushort *)(lVar5 + 0x36);
        if (uVar10 == 0) goto LAB_1454a5783;
        uVar4 = *(ushort *)(lVar5 + 0x3a + uVar9 * 2);
        uVar8 = uVar9 + 1;
        uVar10 = uVar10 - 2;
        uVar9 = uVar8;
      } while ((char)((uVar4 < 0x16) - (0x16 < uVar4)) == '\x01');
      if (uVar4 < 0x16 == 0x16 < uVar4) {
        *(undefined4 *)(lVar5 + 8 + uVar8 * 4) = uVar7;
        lVar5 = *plVar1;
        if (lVar5 != 0) goto LAB_1454a57a5;
        goto LAB_1454a5853;
      }
LAB_1454a5783:
      bVar11 = lVar6 == 0;
      lVar6 = lVar6 + -1;
      if (bVar11) break;
      lVar5 = *(long *)(lVar5 + 0x50 + uVar8 * 8);
    } while( true );
  }
  func_0x00014552a730();
  lVar5 = *plVar1;
  if (lVar5 == 0) {
LAB_1454a5853:
    func_0x00014552a730();
    return;
  }
LAB_1454a57a5:
  lVar6 = *(long *)(in_RCX + 0x8e0);
  do {
    uVar10 = (ulong)((uint)*(ushort *)(lVar5 + 0x36) * 2);
    uVar9 = 0xffffffffffffffff;
    do {
      uVar8 = (ulong)*(ushort *)(lVar5 + 0x36);
      if (uVar10 == 0) goto LAB_1454a5803;
      uVar4 = *(ushort *)(lVar5 + 0x3a + uVar9 * 2);
      uVar8 = uVar9 + 1;
      uVar10 = uVar10 - 2;
      uVar9 = uVar8;
    } while ((char)((uVar4 < 0x1c) - (0x1c < uVar4)) == '\x01');
    if (uVar4 < 0x1c == 0x1c < uVar4) {
      *(undefined4 *)(lVar5 + 8 + uVar8 * 4) = uVar16;
      return;
    }
LAB_1454a5803:
    bVar11 = lVar6 == 0;
    lVar6 = lVar6 + -1;
    if (bVar11) goto LAB_1454a5853;
    lVar5 = *(long *)(lVar5 + 0x50 + uVar8 * 8);
  } while( true );
}
