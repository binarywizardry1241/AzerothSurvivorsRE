/* WARNING: Type propagation algorithm not settling */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,long param_2,long param_3)

{
  uint *puVar1;
  char *pcVar2;
  float fVar3;
  code *pcVar4;
  uint uVar5;
  uint uVar6;
  bool bVar7;
  bool bVar8;
  long lVar9;
  float *pfVar10;
  ulong uVar11;
  long lVar12;
  long lVar13;
  long lVar14;
  uint uVar15;
  int iVar16;
  int iVar17;
  ushort uVar18;
  int iVar19;
  ulong uVar20;
  long lVar21;
  long unaff_R12;
  long lVar22;
  undefined1 auVar23 [16];
  undefined1 auVar24 [16];
  float fVar25;
  undefined1 auVar26 [16];
  undefined1 auVar27 [16];
  undefined1 auVar28 [16];
  undefined1 auVar29 [16];
  undefined1 auVar30 [16];
  undefined1 auVar31 [16];
  undefined1 auVar32 [16];
  undefined1 auVar33 [16];
  undefined1 auVar34 [16];
  undefined1 auVar35 [16];
  undefined1 in_XMM5 [16];
  undefined1 auVar36 [16];
  undefined1 auVar37 [16];
  undefined4 in_XMM6_Da;
  float fVar38;
  undefined4 uVar39;
  float fVar40;
  undefined8 in_XMM7_Qa;
  undefined4 uVar41;
  float fVar42;
  undefined4 uVar43;
  undefined4 uVar44;
  undefined4 uVar45;
  undefined4 uVar46;
  undefined4 uVar47;
  undefined4 uVar48;
  undefined4 uVar49;
  undefined4 uVar50;
  float in_XMM11_Da;
  undefined4 uVar51;
  undefined4 uVar52;
  undefined8 local_238;
  undefined8 local_230;
  uint *local_140;
  long local_138;
  char local_130;
  ulong local_128;
  long local_120;
  ulong local_118;
  undefined4 *local_110;
  uint *local_108;
  long local_100;
  uint local_f8;
  uint local_f4;
  undefined4 *local_f0;
  undefined4 local_e4;
  long local_e0;
  undefined1 local_d2;
  char local_d1;
  undefined8 local_d0;
  undefined4 local_c8;
  undefined4 local_b8;

  uVar41 = (undefined4)((ulong)in_XMM7_Qa >> 0x20);
  local_b8 = (undefined4)in_XMM7_Qa;
  local_d0 = 0xfffffffffffffffe;
  local_c8 = in_XMM6_Da;
  if (*(long *)(param_3 + 0x90) != 0) {
    lVar9 = *(long *)(param_3 + 0x78);
    uVar11 = 0x9770b9d20072f145;
    lVar14 = 0;
    while( true ) {
      uVar11 = uVar11 & *(ulong *)(param_3 + 0x80);
      auVar24 = *(undefined1 (*) [16])(lVar9 + uVar11);
      auVar27[0] = -(auVar24[0] == DAT_145d6d8e0);
      auVar27[1] = -(auVar24[1] == DAT_145d6d8e0._1_1_);
      auVar27[2] = -(auVar24[2] == DAT_145d6d8e0._2_1_);
      auVar27[3] = -(auVar24[3] == DAT_145d6d8e0._3_1_);
      auVar27[4] = -(auVar24[4] == DAT_145d6d8e0._4_1_);
      auVar27[5] = -(auVar24[5] == DAT_145d6d8e0._5_1_);
      auVar27[6] = -(auVar24[6] == DAT_145d6d8e0._6_1_);
      auVar27[7] = -(auVar24[7] == DAT_145d6d8e0._7_1_);
      auVar27[8] = -(auVar24[8] == DAT_145d6d8e0._8_1_);
      auVar27[9] = -(auVar24[9] == DAT_145d6d8e0._9_1_);
      auVar27[10] = -(auVar24[10] == DAT_145d6d8e0._10_1_);
      auVar27[0xb] = -(auVar24[0xb] == DAT_145d6d8e0._11_1_);
      auVar27[0xc] = -(auVar24[0xc] == DAT_145d6d8e0._12_1_);
      auVar27[0xd] = -(auVar24[0xd] == DAT_145d6d8e0._13_1_);
      auVar27[0xe] = -(auVar24[0xe] == DAT_145d6d8e0._14_1_);
      auVar27[0xf] = -(auVar24[0xf] == DAT_145d6d8e0._15_1_);
      uVar18 = (ushort)(SUB161(auVar27 >> 7,0) & 1) | (ushort)(SUB161(auVar27 >> 0xf,0) & 1) << 1 |
               (ushort)(SUB161(auVar27 >> 0x17,0) & 1) << 2 |
               (ushort)(SUB161(auVar27 >> 0x1f,0) & 1) << 3 |
               (ushort)(SUB161(auVar27 >> 0x27,0) & 1) << 4 |
               (ushort)(SUB161(auVar27 >> 0x2f,0) & 1) << 5 |
               (ushort)(SUB161(auVar27 >> 0x37,0) & 1) << 6 |
               (ushort)(SUB161(auVar27 >> 0x3f,0) & 1) << 7 |
               (ushort)(SUB161(auVar27 >> 0x47,0) & 1) << 8 |
               (ushort)(SUB161(auVar27 >> 0x4f,0) & 1) << 9 |
               (ushort)(SUB161(auVar27 >> 0x57,0) & 1) << 10 |
               (ushort)(SUB161(auVar27 >> 0x5f,0) & 1) << 0xb |
               (ushort)(SUB161(auVar27 >> 0x67,0) & 1) << 0xc |
               (ushort)(SUB161(auVar27 >> 0x6f,0) & 1) << 0xd |
               (ushort)(SUB161(auVar27 >> 0x77,0) & 1) << 0xe | (ushort)(auVar27[0xf] >> 7) << 0xf;
      uVar15 = (uint)uVar18;
      while (param_2 = param_3, uVar18 != 0) {
        uVar5 = 0;
        for (uVar6 = uVar15; (uVar6 & 1) == 0; uVar6 = uVar6 >> 1 | 0x80000000) {
          uVar5 = uVar5 + 1;
        }
        uVar20 = uVar5 + uVar11 & *(ulong *)(param_3 + 0x80);
        pcVar2 = (char *)(lVar9 + -0x18 + uVar20 * -0x18);
        auVar30[0] = -(*pcVar2 == DAT_145d6d9b0);
        auVar30[1] = -(pcVar2[1] == DAT_145d6d9b0._1_1_);
        auVar30[2] = -(pcVar2[2] == DAT_145d6d9b0._2_1_);
        auVar30[3] = -(pcVar2[3] == DAT_145d6d9b0._3_1_);
        auVar30[4] = -(pcVar2[4] == DAT_145d6d9b0._4_1_);
        auVar30[5] = -(pcVar2[5] == DAT_145d6d9b0._5_1_);
        auVar30[6] = -(pcVar2[6] == DAT_145d6d9b0._6_1_);
        auVar30[7] = -(pcVar2[7] == DAT_145d6d9b0._7_1_);
        auVar30[8] = -(pcVar2[8] == DAT_145d6d9b0._8_1_);
        auVar30[9] = -(pcVar2[9] == DAT_145d6d9b0._9_1_);
        auVar30[10] = -(pcVar2[10] == DAT_145d6d9b0._10_1_);
        auVar30[0xb] = -(pcVar2[0xb] == DAT_145d6d9b0._11_1_);
        auVar30[0xc] = -(pcVar2[0xc] == DAT_145d6d9b0._12_1_);
        auVar30[0xd] = -(pcVar2[0xd] == DAT_145d6d9b0._13_1_);
        auVar30[0xe] = -(pcVar2[0xe] == DAT_145d6d9b0._14_1_);
        auVar30[0xf] = -(pcVar2[0xf] == DAT_145d6d9b0._15_1_);
        if ((ushort)((ushort)(SUB161(auVar30 >> 7,0) & 1) |
                     (ushort)(SUB161(auVar30 >> 0xf,0) & 1) << 1 |
                     (ushort)(SUB161(auVar30 >> 0x17,0) & 1) << 2 |
                     (ushort)(SUB161(auVar30 >> 0x1f,0) & 1) << 3 |
                     (ushort)(SUB161(auVar30 >> 0x27,0) & 1) << 4 |
                     (ushort)(SUB161(auVar30 >> 0x2f,0) & 1) << 5 |
                     (ushort)(SUB161(auVar30 >> 0x37,0) & 1) << 6 |
                     (ushort)(SUB161(auVar30 >> 0x3f,0) & 1) << 7 |
                     (ushort)(SUB161(auVar30 >> 0x47,0) & 1) << 8 |
                     (ushort)(SUB161(auVar30 >> 0x4f,0) & 1) << 9 |
                     (ushort)(SUB161(auVar30 >> 0x57,0) & 1) << 10 |
                     (ushort)(SUB161(auVar30 >> 0x5f,0) & 1) << 0xb |
                     (ushort)(SUB161(auVar30 >> 0x67,0) & 1) << 0xc |
                     (ushort)(SUB161(auVar30 >> 0x6f,0) & 1) << 0xd |
                     (ushort)(SUB161(auVar30 >> 0x77,0) & 1) << 0xe |
                    (ushort)(auVar30[0xf] >> 7) << 0xf) == 0xffff) {
          uVar11 = *(ulong *)(lVar9 + uVar20 * -0x18 + -8);
          if ((*(ulong *)(param_3 + 0x218) <= uVar11) ||
             (uVar11 = *(ulong *)(*(long *)(param_3 + 0x210) + uVar11 * 8), uVar11 == 0))
          goto LAB_140277ecc;
          lVar9 = ~uVar11 * 0x38;
          if (*(char *)(*(long *)(param_3 + 0x1e0) + 0x30 + lVar9) == '\0') goto LAB_140277ecc;
          fVar38 = **(float **)(*(long *)(param_3 + 0x1e0) + lVar9 + 0x10);
          uVar39 = 0;
          func_0x000140639a80(param_1,param_3,param_3,&local_238);
          if (((int)local_238 != 1) ||
             (in_XMM11_Da = local_238._4_4_, local_230._4_4_ - local_238._4_4_ <= _DAT_145d6d36c)) {
            bVar7 = false;
          }
          else {
            bVar7 = true;
          }
          func_0x000140382c10();
          func_0x000140376e00();
          if (local_238 != (undefined1 *)*(long *)(param_3 + 0x5a0)) {
            func_0x000145d270f0();
                    /* WARNING: Does not return */
            pcVar4 = (code *)invalidInstructionException();
            (*pcVar4)();
          }
          if (local_130 != '\0') {
            lVar9 = 0;
            goto LAB_140277e70;
          }
          lVar9 = 0;
          goto LAB_140277f10;
        }
        uVar18 = (ushort)(uVar15 - 1) & (ushort)uVar15;
        uVar15 = CONCAT22((short)(uVar15 - 1 >> 0x10),uVar18);
      }
      auVar28[0] = -(auVar24[0] == -1);
      auVar28[1] = -(auVar24[1] == -1);
      auVar28[2] = -(auVar24[2] == -1);
      auVar28[3] = -(auVar24[3] == -1);
      auVar28[4] = -(auVar24[4] == -1);
      auVar28[5] = -(auVar24[5] == -1);
      auVar28[6] = -(auVar24[6] == -1);
      auVar28[7] = -(auVar24[7] == -1);
      auVar28[8] = -(auVar24[8] == -1);
      auVar28[9] = -(auVar24[9] == -1);
      auVar28[10] = -(auVar24[10] == -1);
      auVar28[0xb] = -(auVar24[0xb] == -1);
      auVar28[0xc] = -(auVar24[0xc] == -1);
      auVar28[0xd] = -(auVar24[0xd] == -1);
      auVar28[0xe] = -(auVar24[0xe] == -1);
      auVar28[0xf] = -(auVar24[0xf] == -1);
      if ((((((((((((((((SUB161(auVar28 >> 7,0) & 1) != 0 || (SUB161(auVar28 >> 0xf,0) & 1) != 0) ||
                      (SUB161(auVar28 >> 0x17,0) & 1) != 0) || (SUB161(auVar28 >> 0x1f,0) & 1) != 0)
                    || (SUB161(auVar28 >> 0x27,0) & 1) != 0) || (SUB161(auVar28 >> 0x2f,0) & 1) != 0
                   ) || (SUB161(auVar28 >> 0x37,0) & 1) != 0) ||
                 (SUB161(auVar28 >> 0x3f,0) & 1) != 0) || (SUB161(auVar28 >> 0x47,0) & 1) != 0) ||
               (SUB161(auVar28 >> 0x4f,0) & 1) != 0) || (SUB161(auVar28 >> 0x57,0) & 1) != 0) ||
             (SUB161(auVar28 >> 0x5f,0) & 1) != 0) || (SUB161(auVar28 >> 0x67,0) & 1) != 0) ||
           (SUB161(auVar28 >> 0x6f,0) & 1) != 0) || (SUB161(auVar28 >> 0x77,0) & 1) != 0) ||
          auVar28[0xf] < '\0') break;
      uVar11 = uVar11 + lVar14 + 0x10;
      lVar14 = lVar14 + 0x10;
    }
  }
LAB_140277ecc:
  local_238 = &local_d2;
  local_230 = 0x144fe6670;
  func_0x000145d699c0(param_1,param_2,&local_238,0x145dbfa20,0x145dc05c0);
                    /* WARNING: Does not return */
  pcVar4 = (code *)invalidInstructionException();
  (*pcVar4)();
  while( true ) {
    puVar1 = (uint *)((long)local_140 + lVar9);
    lVar9 = lVar9 + 4;
    if (*(long *)(*(long *)(param_3 + 0x1a8) + 0x10 + (ulong)*puVar1 * 0x48) != 0) break;
LAB_140277e70:
    if (local_138 << 2 == lVar9) {
LAB_140277f76:
      func_0x00014003b160();
      return;
    }
  }
  lVar9 = *(long *)(param_3 + 0x1a8) + (ulong)*puVar1 * 0x48;
  if ((local_128 < *(ulong *)(lVar9 + 0x40)) &&
     (uVar11 = *(ulong *)(*(long *)(lVar9 + 0x38) + local_128 * 8), uVar11 != 0)) {
    lVar9 = *(long *)(*(long *)(lVar9 + 0x18) + 0x10 + ~uVar11 * 0x30);
  }
  else {
    lVar9 = 0;
  }
  goto LAB_140277f9d;
LAB_1402781fd:
  if (local_130 == '\0') {
    if ((int)uVar11 == (int)lVar9) {
      do {
        if (local_140 == local_108) goto LAB_1402786ea;
        uVar15 = *local_140;
        local_140 = local_140 + 1;
        lVar9 = *(long *)(*(long *)(param_3 + 0x108) + 0x58 + (ulong)uVar15 * 0xa0);
      } while (lVar9 == 0);
      lVar12 = *(long *)(param_3 + 0x108) + (ulong)uVar15 * 0xa0;
      uVar11 = (ulong)*(uint *)(lVar12 + 0x94);
      lVar22 = *(long *)(param_3 + 0x1a8);
      lVar14 = lVar22 + uVar11 * 0x48;
      lVar13 = *(long *)(lVar22 + 0x38 + uVar11 * 0x48);
      uVar11 = *(ulong *)(lVar22 + 0x40 + uVar11 * 0x48);
      if (local_128 < uVar11) {
        uVar20 = *(ulong *)(lVar13 + local_128 * 8);
        lVar21 = *(long *)(lVar14 + 0x18);
        if (uVar20 == 0) goto joined_r0x000140278374;
        local_e0 = *(long *)(lVar21 + 0x10 + ~uVar20 * 0x30);
        if (local_118 < uVar11) goto LAB_1402783f0;
LAB_14027840b:
        lVar14 = 0;
      }
      else {
        lVar21 = *(long *)(lVar14 + 0x18);
joined_r0x000140278374:
        local_e0 = 0;
        if (uVar11 <= local_118) goto LAB_14027840b;
LAB_1402783f0:
        uVar11 = *(ulong *)(lVar13 + local_118 * 8);
        if (uVar11 == 0) goto LAB_14027840b;
        lVar14 = *(long *)(lVar21 + 0x10 + ~uVar11 * 0x30);
      }
      lVar13 = ~*(ulong *)(lVar13 + local_120 * 8) * 0x30;
      lVar22 = *(long *)(lVar21 + 0x10 + lVar13);
      unaff_R12 = *(long *)(lVar21 + 0x28 + lVar13);
      local_100 = *(long *)(lVar12 + 0x50);
      uVar11 = 0;
    }
    iVar19 = (int)uVar11;
    uVar11 = (ulong)~*(uint *)(local_100 + 8 + uVar11 * 0x10);
  }
  else {
    if ((int)uVar11 == (int)lVar9) {
      do {
        if (local_140 == local_108) {
LAB_1402786ea:
          func_0x00014003b160();
          return;
        }
        uVar15 = *local_140;
        local_140 = local_140 + 1;
        lVar9 = *(long *)(*(long *)(param_3 + 0x1a8) + 0x10 + (ulong)uVar15 * 0x48);
      } while (lVar9 == 0);
      lVar14 = *(long *)(param_3 + 0x1a8) + (ulong)uVar15 * 0x48;
      lVar22 = *(long *)(lVar14 + 0x38);
      uVar11 = *(ulong *)(lVar14 + 0x40);
      if (local_128 < uVar11) {
        uVar20 = *(ulong *)(lVar22 + local_128 * 8);
        lVar13 = *(long *)(lVar14 + 0x18);
        if (uVar20 == 0) goto joined_r0x000140278357;
        local_e0 = *(long *)(lVar13 + 0x10 + ~uVar20 * 0x30);
        if (local_118 < uVar11) goto LAB_140278393;
LAB_1402783ae:
        lVar14 = 0;
      }
      else {
        lVar13 = *(long *)(lVar14 + 0x18);
joined_r0x000140278357:
        local_e0 = 0;
        if (uVar11 <= local_118) goto LAB_1402783ae;
LAB_140278393:
        uVar11 = *(ulong *)(lVar22 + local_118 * 8);
        if (uVar11 == 0) goto LAB_1402783ae;
        lVar14 = *(long *)(lVar13 + 0x10 + ~uVar11 * 0x30);
      }
      lVar12 = ~*(ulong *)(lVar22 + local_120 * 8) * 0x30;
      lVar22 = *(long *)(lVar13 + 0x10 + lVar12);
      unaff_R12 = *(long *)(lVar13 + 0x28 + lVar12);
      uVar11 = 0;
    }
    iVar19 = (int)uVar11;
  }
  lVar13 = uVar11 * 0x180 + lVar22;
  local_f0 = (undefined4 *)(unaff_R12 + uVar11 * 4);
  lVar12 = uVar11 * 0x68 + lVar14;
  if (*(char *)(local_e0 + uVar11) == '\0') {
    uVar41 = uVar43;
    uVar39 = uVar44;
    uVar51 = uVar45;
    uVar52 = uVar46;
    if ((local_f8 & 1) != 0) goto LAB_1402784c1;
    uVar41 = 0;
    iVar16 = 1;
    auVar35 = auVar24;
    if (*(int *)(lVar13 + 0x68) != 0) {
      bVar7 = false;
      goto LAB_1402785a0;
    }
    bVar7 = false;
    iVar17 = *(int *)(lVar13 + 0x78);
joined_r0x000140278655:
    bVar8 = bVar7;
    if (iVar17 == 0) goto LAB_140278660;
LAB_140278607:
    fVar25 = auVar35._0_4_;
    bVar8 = bVar7;
    if (iVar17 == 1) {
      fVar3 = *(float *)(lVar13 + 0x7c);
      in_XMM5 = ZEXT416((uint)fVar3);
      if ((fVar3 == fVar25) && (!NAN(fVar3) && !NAN(fVar25))) goto LAB_140278630;
      goto LAB_140278660;
    }
    fVar3 = *(float *)(lVar13 + 0x7c);
    in_XMM5 = ZEXT416((uint)fVar3);
    if ((fVar3 != 0.0) || (((NAN(fVar3) || (fVar25 != 0.0)) || (NAN(fVar25))))) goto LAB_140278660;
LAB_140278630:
    uVar11 = (ulong)(iVar19 + 1);
    iVar19 = *(int *)(lVar13 + 0x70);
    if (bVar7) goto LAB_14027863b;
LAB_140278688:
    fVar25 = auVar35._4_4_;
    if (iVar16 == iVar19) {
      if (iVar19 != 0) {
        fVar3 = *(float *)(lVar13 + 0x74);
        in_XMM5 = ZEXT416((uint)fVar3);
        if ((fVar3 != fVar25) || (NAN(fVar3) || NAN(fVar25))) goto LAB_1402781e0;
        goto LAB_1402781fd;
      }
    }
    else if (iVar19 != 0) {
      fVar3 = *(float *)(lVar13 + 0x74);
      in_XMM5 = ZEXT416((uint)fVar3);
      if ((fVar3 == 0.0) && (!NAN(fVar3))) {
        in_XMM5._4_4_ = fVar25;
        in_XMM5._0_4_ = fVar25;
        in_XMM5._8_4_ = auVar35._12_4_;
        in_XMM5._12_4_ = auVar35._12_4_;
        if ((fVar25 == 0.0) && (!NAN(fVar25))) goto LAB_1402781fd;
      }
    }
  }
  else {
    auVar34 = auVar27;
    in_XMM5 = auVar24;
    uVar41 = uVar47;
    uVar39 = uVar48;
    uVar51 = uVar49;
    uVar52 = uVar50;
    if ((local_f4 & 1) != 0) {
LAB_1402784c1:
      auVar36._4_4_ = fVar40 - *(float *)(lVar12 + 0x30) * *(float *)(lVar12 + 100) * fVar38;
      auVar36._0_4_ = uVar41;
      auVar36._8_4_ = uVar51;
      auVar36._12_4_ = uVar52;
      auVar37 = maxps(auVar36,(undefined1  [16])0x0);
      auVar33._4_4_ = fVar42 - *(float *)(lVar12 + 100) * *(float *)(lVar12 + 0x34) * fVar38;
      auVar33._0_4_ = uVar39;
      auVar33._8_4_ = uVar52;
      auVar33._12_4_ = uVar52;
      auVar34 = maxps(auVar33,(undefined1  [16])0x0);
      if (auVar37._4_4_ <= auVar37._0_4_) {
        auVar37._0_4_ = auVar37._4_4_;
      }
      if (auVar34._4_4_ <= auVar34._0_4_) {
        auVar34._0_4_ = auVar34._4_4_;
      }
      in_XMM5._4_12_ = auVar37._4_12_;
      in_XMM5._0_4_ = auVar37._0_4_ / fVar38;
    }
    auVar35._4_12_ = auVar34._4_12_;
    auVar35._0_4_ = auVar34._0_4_ / fVar38;
    uVar41 = 1;
    if (*(int *)(lVar13 + 0x68) == 0) {
      bVar7 = true;
      iVar16 = 0;
LAB_1402785a0:
      local_110 = (undefined4 *)(lVar13 + 0x6c);
      *local_f0 = local_e4;
      *(undefined4 *)(lVar13 + 0x68) = uVar41;
      *local_110 = in_XMM5._0_4_;
      iVar17 = *(int *)(lVar13 + 0x78);
      goto joined_r0x000140278655;
    }
    fVar25 = in_XMM5._0_4_;
    if (*(int *)(lVar13 + 0x68) == 1) {
      fVar3 = *(float *)(lVar13 + 0x6c);
      bVar7 = true;
      iVar16 = 0;
      if ((fVar3 != fVar25) || (NAN(fVar3) || NAN(fVar25))) goto LAB_1402785a0;
    }
    else {
      fVar3 = *(float *)(lVar13 + 0x6c);
      iVar17 = 0;
      bVar7 = true;
      iVar16 = 0;
      if ((((fVar3 != 0.0) || (iVar16 = iVar17, NAN(fVar3))) || (fVar25 != 0.0)) || (NAN(fVar25)))
      goto LAB_1402785a0;
    }
    iVar16 = 0;
    bVar7 = true;
    bVar8 = true;
    iVar17 = *(int *)(lVar13 + 0x78);
    if (iVar17 != 0) goto LAB_140278607;
LAB_140278660:
    *local_f0 = local_e4;
    *(undefined4 *)(lVar13 + 0x78) = 1;
    *(int *)(lVar13 + 0x7c) = auVar35._0_4_;
    uVar11 = (ulong)(iVar19 + 1);
    iVar19 = *(int *)(lVar13 + 0x70);
    if (!bVar8) goto LAB_140278688;
LAB_14027863b:
    fVar25 = auVar35._4_4_;
    if (iVar19 == 0 && iVar16 == 0) goto LAB_1402781fd;
  }
LAB_1402781e0:
  *local_f0 = local_e4;
  *(int *)(lVar13 + 0x70) = iVar16;
  *(float *)(lVar13 + 0x74) = fVar25;
  goto LAB_1402781fd;
  while( true ) {
    lVar14 = (ulong)*(uint *)((long)local_140 + lVar9) * 0xa0;
    lVar9 = lVar9 + 4;
    if (*(long *)(*(long *)(param_3 + 0x108) + 0x58 + lVar14) != 0) break;
LAB_140277f10:
    if (local_138 << 2 == lVar9) goto LAB_140277f76;
  }
  lVar14 = *(long *)(param_3 + 0x108) + lVar14;
  uVar11 = (ulong)*(uint *)(lVar14 + 0x94);
  if (local_128 < *(ulong *)(*(long *)(param_3 + 0x1a8) + 0x40 + uVar11 * 0x48)) {
    lVar9 = *(long *)(param_3 + 0x1a8) + uVar11 * 0x48;
    uVar11 = *(ulong *)(*(long *)(lVar9 + 0x38) + local_128 * 8);
    if (uVar11 == 0) goto LAB_140277f88;
    lVar9 = *(long *)(*(long *)(lVar9 + 0x18) + 0x10 + ~uVar11 * 0x30);
  }
  else {
LAB_140277f88:
    lVar9 = 0;
  }
  lVar9 = (ulong)~*(uint *)(*(long *)(lVar14 + 0x50) + 8) * 0xf8 + lVar9;
LAB_140277f9d:
  uVar15 = *(uint *)(lVar9 + 0xc0);
  uVar11 = (ulong)*(uint *)(lVar9 + 0xc4);
  pfVar10 = (float *)(lVar9 + 200);
  if (*(char *)(lVar9 + 0xb8) != '\0') {
    pfVar10 = (float *)(lVar9 + 0xbc);
  }
  fVar42 = *pfVar10;
  func_0x00014003b160();
  if (*(long *)(param_3 + 0x90) != 0) {
    fVar40 = (float)uVar15 / fVar42;
    fVar42 = (float)(long)uVar11 / fVar42;
    lVar9 = *(long *)(param_3 + 0x78);
    uVar11 = 0xb7d14969f30a9628;
    lVar14 = 0;
    while( true ) {
      uVar11 = uVar11 & *(ulong *)(param_3 + 0x80);
      auVar24 = *(undefined1 (*) [16])(lVar9 + uVar11);
      auVar31[0] = -(auVar24[0] == DAT_145d9af60);
      auVar31[1] = -(auVar24[1] == DAT_145d9af60._1_1_);
      auVar31[2] = -(auVar24[2] == DAT_145d9af60._2_1_);
      auVar31[3] = -(auVar24[3] == DAT_145d9af60._3_1_);
      auVar31[4] = -(auVar24[4] == DAT_145d9af60._4_1_);
      auVar31[5] = -(auVar24[5] == DAT_145d9af60._5_1_);
      auVar31[6] = -(auVar24[6] == DAT_145d9af60._6_1_);
      auVar31[7] = -(auVar24[7] == DAT_145d9af60._7_1_);
      auVar31[8] = -(auVar24[8] == DAT_145d9af60._8_1_);
      auVar31[9] = -(auVar24[9] == DAT_145d9af60._9_1_);
      auVar31[10] = -(auVar24[10] == DAT_145d9af60._10_1_);
      auVar31[0xb] = -(auVar24[0xb] == DAT_145d9af60._11_1_);
      auVar31[0xc] = -(auVar24[0xc] == DAT_145d9af60._12_1_);
      auVar31[0xd] = -(auVar24[0xd] == DAT_145d9af60._13_1_);
      auVar31[0xe] = -(auVar24[0xe] == DAT_145d9af60._14_1_);
      auVar31[0xf] = -(auVar24[0xf] == DAT_145d9af60._15_1_);
      uVar18 = (ushort)(SUB161(auVar31 >> 7,0) & 1) | (ushort)(SUB161(auVar31 >> 0xf,0) & 1) << 1 |
               (ushort)(SUB161(auVar31 >> 0x17,0) & 1) << 2 |
               (ushort)(SUB161(auVar31 >> 0x1f,0) & 1) << 3 |
               (ushort)(SUB161(auVar31 >> 0x27,0) & 1) << 4 |
               (ushort)(SUB161(auVar31 >> 0x2f,0) & 1) << 5 |
               (ushort)(SUB161(auVar31 >> 0x37,0) & 1) << 6 |
               (ushort)(SUB161(auVar31 >> 0x3f,0) & 1) << 7 |
               (ushort)(SUB161(auVar31 >> 0x47,0) & 1) << 8 |
               (ushort)(SUB161(auVar31 >> 0x4f,0) & 1) << 9 |
               (ushort)(SUB161(auVar31 >> 0x57,0) & 1) << 10 |
               (ushort)(SUB161(auVar31 >> 0x5f,0) & 1) << 0xb |
               (ushort)(SUB161(auVar31 >> 0x67,0) & 1) << 0xc |
               (ushort)(SUB161(auVar31 >> 0x6f,0) & 1) << 0xd |
               (ushort)(SUB161(auVar31 >> 0x77,0) & 1) << 0xe | (ushort)(auVar31[0xf] >> 7) << 0xf;
      uVar15 = (uint)uVar18;
      while (uVar18 != 0) {
        uVar5 = 0;
        for (uVar6 = uVar15; (uVar6 & 1) == 0; uVar6 = uVar6 >> 1 | 0x80000000) {
          uVar5 = uVar5 + 1;
        }
        uVar20 = uVar5 + uVar11 & *(ulong *)(param_3 + 0x80);
        pcVar2 = (char *)(lVar9 + -0x18 + uVar20 * -0x18);
        auVar32[0] = -(*pcVar2 == DAT_145dbf500);
        auVar32[1] = -(pcVar2[1] == DAT_145dbf500._1_1_);
        auVar32[2] = -(pcVar2[2] == DAT_145dbf500._2_1_);
        auVar32[3] = -(pcVar2[3] == DAT_145dbf500._3_1_);
        auVar32[4] = -(pcVar2[4] == DAT_145dbf500._4_1_);
        auVar32[5] = -(pcVar2[5] == DAT_145dbf500._5_1_);
        auVar32[6] = -(pcVar2[6] == DAT_145dbf500._6_1_);
        auVar32[7] = -(pcVar2[7] == DAT_145dbf500._7_1_);
        auVar32[8] = -(pcVar2[8] == DAT_145dbf500._8_1_);
        auVar32[9] = -(pcVar2[9] == DAT_145dbf500._9_1_);
        auVar32[10] = -(pcVar2[10] == DAT_145dbf500._10_1_);
        auVar32[0xb] = -(pcVar2[0xb] == DAT_145dbf500._11_1_);
        auVar32[0xc] = -(pcVar2[0xc] == DAT_145dbf500._12_1_);
        auVar32[0xd] = -(pcVar2[0xd] == DAT_145dbf500._13_1_);
        auVar32[0xe] = -(pcVar2[0xe] == DAT_145dbf500._14_1_);
        auVar32[0xf] = -(pcVar2[0xf] == DAT_145dbf500._15_1_);
        if ((ushort)((ushort)(SUB161(auVar32 >> 7,0) & 1) |
                     (ushort)(SUB161(auVar32 >> 0xf,0) & 1) << 1 |
                     (ushort)(SUB161(auVar32 >> 0x17,0) & 1) << 2 |
                     (ushort)(SUB161(auVar32 >> 0x1f,0) & 1) << 3 |
                     (ushort)(SUB161(auVar32 >> 0x27,0) & 1) << 4 |
                     (ushort)(SUB161(auVar32 >> 0x2f,0) & 1) << 5 |
                     (ushort)(SUB161(auVar32 >> 0x37,0) & 1) << 6 |
                     (ushort)(SUB161(auVar32 >> 0x3f,0) & 1) << 7 |
                     (ushort)(SUB161(auVar32 >> 0x47,0) & 1) << 8 |
                     (ushort)(SUB161(auVar32 >> 0x4f,0) & 1) << 9 |
                     (ushort)(SUB161(auVar32 >> 0x57,0) & 1) << 10 |
                     (ushort)(SUB161(auVar32 >> 0x5f,0) & 1) << 0xb |
                     (ushort)(SUB161(auVar32 >> 0x67,0) & 1) << 0xc |
                     (ushort)(SUB161(auVar32 >> 0x6f,0) & 1) << 0xd |
                     (ushort)(SUB161(auVar32 >> 0x77,0) & 1) << 0xe |
                    (ushort)(auVar32[0xf] >> 7) << 0xf) == 0xffff) {
          uVar11 = *(ulong *)(lVar9 + uVar20 * -0x18 + -8);
          if ((*(ulong *)(param_3 + 0x218) <= uVar11) ||
             (uVar11 = *(ulong *)(*(long *)(param_3 + 0x210) + uVar11 * 8), uVar11 == 0))
          goto LAB_140278131;
          lVar9 = ~uVar11 * 0x38;
          if (*(char *)(*(long *)(param_3 + 0x1e0) + 0x30 + lVar9) == '\0') goto LAB_140278131;
          puVar1 = *(uint **)(*(long *)(param_3 + 0x1e0) + lVar9 + 0x10);
          local_f8 = *puVar1;
          local_f4 = puVar1[3];
          uVar43 = (undefined4)*(undefined8 *)(puVar1 + 1);
          uVar44 = (undefined4)((ulong)*(undefined8 *)(puVar1 + 1) >> 0x20);
          uVar45 = 0;
          uVar46 = 0;
          uVar47 = (undefined4)*(undefined8 *)(puVar1 + 4);
          uVar48 = (undefined4)((ulong)*(undefined8 *)(puVar1 + 4) >> 0x20);
          uVar49 = 0;
          uVar50 = 0;
          func_0x00014039e640();
          local_e4 = *(undefined4 *)(param_3 + 0x5b0);
          func_0x000140383770();
          if (bVar7) {
            fVar25 = (fVar40 - in_XMM11_Da) + _DAT_145d6d650;
            if (fVar25 <= _DAT_145d6d650) {
              fVar25 = _DAT_145d6d650;
            }
          }
          else {
            uVar41 = 0;
            fVar25 = _DAT_145dbf540;
          }
          local_108 = local_140 + local_138;
          local_d1 = local_130;
          auVar23._0_8_ = (undefined8)DAT_145dbf550;
          auVar23._8_4_ = DAT_145dbf550._4_4_;
          auVar23._12_4_ = uVar41;
          auVar24._8_8_ = auVar23._8_8_;
          auVar24._0_4_ = (undefined4)DAT_145dbf550;
          auVar24._4_4_ = fVar25;
          auVar26._4_4_ = fVar38;
          auVar26._0_4_ = fVar38;
          auVar26._8_4_ = uVar39;
          auVar26._12_4_ = uVar39;
          auVar24 = divps(auVar24,auVar26);
          lVar9 = 0;
          local_100 = 8;
          auVar27 = ZEXT416(_DAT_145dbf560);
          lVar14 = 0;
          lVar22 = 0;
          local_e0 = 0;
          uVar11 = 0;
          goto LAB_1402781fd;
        }
        uVar18 = (ushort)(uVar15 - 1) & (ushort)uVar15;
        uVar15 = CONCAT22((short)(uVar15 - 1 >> 0x10),uVar18);
      }
      auVar29[0] = -(auVar24[0] == -1);
      auVar29[1] = -(auVar24[1] == -1);
      auVar29[2] = -(auVar24[2] == -1);
      auVar29[3] = -(auVar24[3] == -1);
      auVar29[4] = -(auVar24[4] == -1);
      auVar29[5] = -(auVar24[5] == -1);
      auVar29[6] = -(auVar24[6] == -1);
      auVar29[7] = -(auVar24[7] == -1);
      auVar29[8] = -(auVar24[8] == -1);
      auVar29[9] = -(auVar24[9] == -1);
      auVar29[10] = -(auVar24[10] == -1);
      auVar29[0xb] = -(auVar24[0xb] == -1);
      auVar29[0xc] = -(auVar24[0xc] == -1);
      auVar29[0xd] = -(auVar24[0xd] == -1);
      auVar29[0xe] = -(auVar24[0xe] == -1);
      auVar29[0xf] = -(auVar24[0xf] == -1);
      if ((((((((((((((((SUB161(auVar29 >> 7,0) & 1) != 0 || (SUB161(auVar29 >> 0xf,0) & 1) != 0) ||
                      (SUB161(auVar29 >> 0x17,0) & 1) != 0) || (SUB161(auVar29 >> 0x1f,0) & 1) != 0)
                    || (SUB161(auVar29 >> 0x27,0) & 1) != 0) || (SUB161(auVar29 >> 0x2f,0) & 1) != 0
                   ) || (SUB161(auVar29 >> 0x37,0) & 1) != 0) ||
                 (SUB161(auVar29 >> 0x3f,0) & 1) != 0) || (SUB161(auVar29 >> 0x47,0) & 1) != 0) ||
               (SUB161(auVar29 >> 0x4f,0) & 1) != 0) || (SUB161(auVar29 >> 0x57,0) & 1) != 0) ||
             (SUB161(auVar29 >> 0x5f,0) & 1) != 0) || (SUB161(auVar29 >> 0x67,0) & 1) != 0) ||
           (SUB161(auVar29 >> 0x6f,0) & 1) != 0) || (SUB161(auVar29 >> 0x77,0) & 1) != 0) ||
          auVar29[0xf] < '\0') break;
      uVar11 = uVar11 + lVar14 + 0x10;
      lVar14 = lVar14 + 0x10;
    }
  }
LAB_140278131:
  local_238 = &local_d2;
  local_230 = 0x144fe6670;
  func_0x000145d699c0();
                    /* WARNING: Does not return */
  pcVar4 = (code *)invalidInstructionException();
  (*pcVar4)();
}
