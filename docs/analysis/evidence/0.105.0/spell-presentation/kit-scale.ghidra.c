/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

ulong entry(undefined8 param_1,undefined8 param_2,long param_3,undefined8 *param_4)

{
  char *pcVar1;
  float fVar2;
  long lVar3;
  long lVar4;
  undefined8 *puVar5;
  long *plVar6;
  undefined8 uVar7;
  float *pfVar8;
  uint uVar9;
  uint uVar10;
  short sVar11;
  char cVar12;
  ushort uVar13;
  int iVar14;
  undefined8 *puVar15;
  undefined8 *puVar16;
  undefined1 *puVar17;
  undefined8 **ppuVar18;
  int *piVar19;
  ulong uVar20;
  undefined8 **extraout_RDX;
  uint uVar21;
  long *plVar22;
  long *plVar23;
  ulong unaff_R14;
  undefined4 *puVar24;
  bool bVar25;
  byte bVar26;
  float fVar27;
  undefined1 auVar28 [16];
  char cVar29;
  char cVar30;
  char cVar31;
  char cVar32;
  char cVar33;
  char cVar34;
  char cVar35;
  char cVar36;
  char cVar37;
  char cVar38;
  char cVar39;
  char cVar40;
  char cVar41;
  char cVar42;
  char cVar43;
  undefined1 in_XMM7_Ba;
  char cVar44;
  undefined1 in_XMM7_Bb;
  char cVar45;
  undefined1 in_XMM7_Bc;
  char cVar46;
  undefined1 in_XMM7_Bd;
  char cVar47;
  undefined1 in_XMM7_Be;
  char cVar48;
  undefined1 in_XMM7_Bf;
  char cVar49;
  undefined1 in_XMM7_Bg;
  char cVar50;
  undefined1 in_XMM7_Bh;
  char cVar51;
  undefined1 in_XMM7_Bi;
  char cVar52;
  undefined1 in_XMM7_Bj;
  char cVar53;
  undefined1 in_XMM7_Bk;
  char cVar54;
  undefined1 in_XMM7_Bl;
  char cVar55;
  undefined1 in_XMM7_Bm;
  char cVar56;
  undefined1 in_XMM7_Bn;
  char cVar57;
  undefined1 in_XMM7_Bo;
  char cVar58;
  undefined1 in_XMM7_Bp;
  char cVar59;
  char cVar60;
  char cVar62;
  char cVar63;
  char cVar64;
  char cVar65;
  char cVar66;
  char cVar67;
  char cVar68;
  char cVar69;
  char cVar70;
  char cVar71;
  char cVar72;
  char cVar73;
  char cVar74;
  char cVar75;
  char cVar76;
  undefined1 auVar61 [16];
  undefined8 *local_150;
  ushort local_148;
  undefined2 uStack_146;
  undefined4 local_144;
  undefined2 uStack_140;
  undefined4 uStack_13e;
  undefined8 local_138;
  undefined4 local_130;
  long local_128;
  undefined8 *local_120;
  undefined8 local_118;
  undefined2 local_110;
  undefined6 uStack_10e;
  undefined2 local_108;
  undefined6 uStack_106;
  long *local_100;
  long *local_f8;
  undefined8 local_f0;
  undefined8 *local_e8;
  undefined8 uStack_e0;
  undefined8 uStack_d8;
  undefined8 uStack_d0;
  undefined8 local_c8;
  undefined8 uStack_c0;
  undefined8 local_b8;
  undefined8 uStack_b0;
  undefined1 local_a8;
  undefined7 uStack_a7;
  undefined8 uStack_a0;
  ulong local_98;
  undefined8 *local_90;
  long local_88;
  undefined8 local_80;

  local_80 = 0xfffffffffffffffe;
  if ((*(int *)(param_3 + 0x18) != 1) || (*(float *)*param_4 < *(float *)(param_3 + 0x1c))) {
    if (*(int *)(param_3 + 0x20) != 0) {
      uVar20 = (ulong)~(uint)*(undefined8 *)(param_3 + 0x20);
      puVar17 = &DAT_145eed910;
      if (uVar20 < *(ulong *)(*(long *)param_4[2] + 0x10)) {
        puVar17 = (undefined1 *)(uVar20 * 0x18 + *(long *)(*(long *)param_4[2] + 8));
      }
      unaff_R14 = CONCAT71((int7)(unaff_R14 >> 8),1);
      if (*(int *)(puVar17 + 0x10) == (int)((ulong)*(undefined8 *)(param_3 + 0x20) >> 0x20))
      goto LAB_1408d97c9;
      if ((*(char *)(param_3 + 0x32) != '\x01') || (*(char *)(param_3 + 0x34) != '\0')) {
        cVar12 = func_0x0001422a4f70();
        if (cVar12 != '\0') {
          local_e8 = (undefined8 *)param_4[3];
          uStack_e0 = 0x144e0c7c0;
          local_c8 = (long *)(param_3 + 0x34);
          uStack_d0 = (long *)0x1400020e0;
          uStack_c0 = (undefined8 **)0x145baefb0;
          uStack_d8 = param_3;
          func_0x000145b9c4d0();
          func_0x0001422a4be0();
          goto LAB_1408d92c1;
        }
        goto LAB_1408d92dc;
      }
      *(undefined4 *)(param_3 + 0x20) = 0;
      cVar12 = func_0x0001422a4f70();
      if (cVar12 != '\0') {
        local_e8 = (undefined8 *)param_4[3];
        uStack_e0 = 0x144e0c7c0;
        uStack_d0 = (long *)0x1400020e0;
        uStack_d8 = param_3;
        func_0x000145b9c4d0();
        local_88 = local_118;
        func_0x0001422a4be0();
        if (local_88 != 0) {
          func_0x0001400021d0();
        }
      }
    }
    if ((*(char *)(param_3 + 0x32) == '\0') && (*(int *)(param_3 + 0x18) == 0)) {
      fVar27 = *(float *)*param_4 + _DAT_145d6d650;
      *(undefined4 *)(param_3 + 0x18) = 1;
      *(float *)(param_3 + 0x1c) = fVar27;
    }
    plVar22 = (long *)param_4[4];
    *(undefined4 *)plVar22[2] = *(undefined4 *)((long)plVar22 + 0x1c);
    func_0x000140573390();
    plVar22 = (long *)*plVar22;
    unaff_R14 = CONCAT71((int7)(unaff_R14 >> 8),1);
    if (plVar22[3] != 0) {
      local_128 = param_3 + 0x32;
      local_98 = func_0x0001402510b0();
      lVar3 = *plVar22;
      uVar20 = plVar22[1];
      bVar26 = (byte)(local_98 >> 0x39);
      auVar28 = ZEXT216(CONCAT11(bVar26,bVar26));
      auVar28 = pshuflw(auVar28,auVar28,0);
      cVar12 = auVar28[0];
      cVar29 = auVar28[1];
      cVar30 = auVar28[2];
      cVar31 = auVar28[3];
      cVar32 = auVar28[4];
      cVar33 = auVar28[5];
      cVar34 = auVar28[6];
      cVar35 = auVar28[7];
      puVar24 = *(undefined4 **)(param_3 + 8);
      lVar4 = *(long *)(param_3 + 0x10);
      local_90 = (undefined8 *)0x0;
      iVar14 = -(uint)(CONCAT13(in_XMM7_Bd,CONCAT12(in_XMM7_Bc,CONCAT11(in_XMM7_Bb,in_XMM7_Ba))) ==
                      CONCAT13(in_XMM7_Bd,CONCAT12(in_XMM7_Bc,CONCAT11(in_XMM7_Bb,in_XMM7_Ba))));
      cVar44 = (char)iVar14;
      cVar45 = (char)((uint)iVar14 >> 8);
      cVar46 = (char)((uint)iVar14 >> 0x10);
      cVar47 = (char)((uint)iVar14 >> 0x18);
      iVar14 = -(uint)(CONCAT13(in_XMM7_Bh,CONCAT12(in_XMM7_Bg,CONCAT11(in_XMM7_Bf,in_XMM7_Be))) ==
                      CONCAT13(in_XMM7_Bh,CONCAT12(in_XMM7_Bg,CONCAT11(in_XMM7_Bf,in_XMM7_Be))));
      cVar48 = (char)iVar14;
      cVar49 = (char)((uint)iVar14 >> 8);
      cVar50 = (char)((uint)iVar14 >> 0x10);
      cVar51 = (char)((uint)iVar14 >> 0x18);
      iVar14 = -(uint)(CONCAT13(in_XMM7_Bl,CONCAT12(in_XMM7_Bk,CONCAT11(in_XMM7_Bj,in_XMM7_Bi))) ==
                      CONCAT13(in_XMM7_Bl,CONCAT12(in_XMM7_Bk,CONCAT11(in_XMM7_Bj,in_XMM7_Bi))));
      cVar52 = (char)iVar14;
      cVar53 = (char)((uint)iVar14 >> 8);
      cVar54 = (char)((uint)iVar14 >> 0x10);
      cVar55 = (char)((uint)iVar14 >> 0x18);
      iVar14 = -(uint)(CONCAT13(in_XMM7_Bp,CONCAT12(in_XMM7_Bo,CONCAT11(in_XMM7_Bn,in_XMM7_Bm))) ==
                      CONCAT13(in_XMM7_Bp,CONCAT12(in_XMM7_Bo,CONCAT11(in_XMM7_Bn,in_XMM7_Bm))));
      cVar56 = (char)iVar14;
      cVar57 = (char)((uint)iVar14 >> 8);
      cVar58 = (char)((uint)iVar14 >> 0x10);
      cVar59 = (char)((uint)iVar14 >> 0x18);
      cVar36 = cVar12;
      cVar37 = cVar29;
      cVar38 = cVar30;
      cVar39 = cVar31;
      cVar40 = cVar32;
      cVar41 = cVar33;
      cVar42 = cVar34;
      cVar43 = cVar35;
      do {
        local_98 = local_98 & uVar20;
        pcVar1 = (char *)(lVar3 + local_98);
        cVar60 = *pcVar1;
        cVar62 = pcVar1[1];
        cVar63 = pcVar1[2];
        cVar64 = pcVar1[3];
        cVar65 = pcVar1[4];
        cVar66 = pcVar1[5];
        cVar67 = pcVar1[6];
        cVar68 = pcVar1[7];
        cVar69 = pcVar1[8];
        cVar70 = pcVar1[9];
        cVar71 = pcVar1[10];
        cVar72 = pcVar1[0xb];
        cVar73 = pcVar1[0xc];
        cVar74 = pcVar1[0xd];
        cVar75 = pcVar1[0xe];
        cVar76 = pcVar1[0xf];
        auVar28[0] = -(cVar60 == cVar12);
        auVar28[1] = -(cVar62 == cVar29);
        auVar28[2] = -(cVar63 == cVar30);
        auVar28[3] = -(cVar64 == cVar31);
        auVar28[4] = -(cVar65 == cVar32);
        auVar28[5] = -(cVar66 == cVar33);
        auVar28[6] = -(cVar67 == cVar34);
        auVar28[7] = -(cVar68 == cVar35);
        auVar28[8] = -(cVar69 == cVar36);
        auVar28[9] = -(cVar70 == cVar37);
        auVar28[10] = -(cVar71 == cVar38);
        auVar28[0xb] = -(cVar72 == cVar39);
        auVar28[0xc] = -(cVar73 == cVar40);
        auVar28[0xd] = -(cVar74 == cVar41);
        auVar28[0xe] = -(cVar75 == cVar42);
        auVar28[0xf] = -(cVar76 == cVar43);
        uVar13 = (ushort)(SUB161(auVar28 >> 7,0) & 1) | (ushort)(SUB161(auVar28 >> 0xf,0) & 1) << 1
                 | (ushort)(SUB161(auVar28 >> 0x17,0) & 1) << 2 |
                 (ushort)(SUB161(auVar28 >> 0x1f,0) & 1) << 3 |
                 (ushort)(SUB161(auVar28 >> 0x27,0) & 1) << 4 |
                 (ushort)(SUB161(auVar28 >> 0x2f,0) & 1) << 5 |
                 (ushort)(SUB161(auVar28 >> 0x37,0) & 1) << 6 |
                 (ushort)(SUB161(auVar28 >> 0x3f,0) & 1) << 7 |
                 (ushort)(SUB161(auVar28 >> 0x47,0) & 1) << 8 |
                 (ushort)(SUB161(auVar28 >> 0x4f,0) & 1) << 9 |
                 (ushort)(SUB161(auVar28 >> 0x57,0) & 1) << 10 |
                 (ushort)(SUB161(auVar28 >> 0x5f,0) & 1) << 0xb |
                 (ushort)(SUB161(auVar28 >> 0x67,0) & 1) << 0xc |
                 (ushort)(SUB161(auVar28 >> 0x6f,0) & 1) << 0xd |
                 (ushort)(SUB161(auVar28 >> 0x77,0) & 1) << 0xe | (ushort)(auVar28[0xf] >> 7) << 0xf
        ;
        uVar21 = (uint)uVar13;
        while (uVar13 != 0) {
          uVar9 = 0;
          for (uVar10 = uVar21; (uVar10 & 1) == 0; uVar10 = uVar10 >> 1 | 0x80000000) {
            uVar9 = uVar9 + 1;
          }
          local_88 = (uVar9 + local_98 & uVar20) * -0x348;
          if (lVar4 == *(long *)(lVar3 + -0x338 + local_88)) {
            local_88 = local_88 + lVar3;
            iVar14 = func_0x000145bc9787();
            if (iVar14 == 0) {
              if (*(long *)(local_88 + -0x160) == -1) goto LAB_1408d97c6;
              unaff_R14 = CONCAT71((int7)((ulong)puVar24 >> 8),1);
              if (*(short *)(param_3 + 0x30) == -1) {
                if (*(char *)(param_3 + 0x32) == '\0') {
                  local_a8 = 0;
                }
                else {
                  local_a8 = func_0x000140573f60();
                }
                puVar15 = (undefined8 *)param_4[2];
                func_0x000140576520();
                local_120 = (undefined8 *)param_4[3];
                uStack_b0 = *local_120;
                local_b8 = (ushort *)((ulong)local_b8 & 0xffffffffffffff00);
                local_98 = puVar15[1];
                local_90 = (undefined8 *)func_0x000144e07d20();
                local_100 = (long *)puVar15[2];
                local_f8 = (long *)puVar15[3];
                plVar22 = local_100;
                if (local_100 == (long *)0x0) {
                  plVar22 = local_f8;
                }
                lVar3 = plVar22[2];
                if ((ulong)(*plVar22 - lVar3) < 0x68) {
                  func_0x000145bcb2d0();
                }
                lVar4 = plVar22[1];
                *(undefined8 *)(lVar4 + lVar3) = 0x140b58d70;
                puVar5 = (undefined8 *)(lVar4 + 8 + lVar3);
                *puVar5 = local_e8;
                puVar5[1] = uStack_e0;
                puVar24 = (undefined4 *)(lVar4 + 0x18 + lVar3);
                *puVar24 = (undefined4)uStack_d8;
                puVar24[1] = uStack_d8._4_4_;
                puVar24[2] = (undefined4)uStack_d0;
                puVar24[3] = uStack_d0._4_4_;
                puVar24 = (undefined4 *)(lVar4 + 0x28 + lVar3);
                *puVar24 = (undefined4)local_c8;
                puVar24[1] = local_c8._4_4_;
                puVar24[2] = (undefined4)uStack_c0;
                puVar24[3] = uStack_c0._4_4_;
                puVar24 = (undefined4 *)(lVar4 + 0x38 + lVar3);
                *puVar24 = (undefined4)local_b8;
                puVar24[1] = local_b8._4_4_;
                puVar24[2] = (undefined4)uStack_b0;
                puVar24[3] = uStack_b0._4_4_;
                puVar5 = (undefined8 *)(lVar4 + 0x48 + lVar3);
                *puVar5 = CONCAT71(uStack_a7,local_a8);
                puVar5[1] = uStack_a0;
                *(undefined8 **)(lVar4 + 0x58 + lVar3) = local_90;
                plVar22[2] = lVar3 + 0x68;
                local_f0 = puVar15[4];
                local_110 = (undefined2)*puVar15;
                uStack_10e = (undefined6)((ulong)*puVar15 >> 0x10);
                local_108 = (undefined2)local_98;
                uStack_106 = (undefined6)(local_98 >> 0x10);
                local_118 = (long)local_90;
                local_90 = puVar15;
                puVar15 = (undefined8 *)func_0x0001415e2420();
                uVar7 = *puVar15;
                local_98 = CONCAT71(local_98._1_7_,1);
                cVar12 = *(char *)(param_3 + 0x33);
                puVar15 = local_120;
              }
              else {
                if (*(char *)param_4[6] == '\0') goto LAB_1408d97c9;
                puVar5 = (undefined8 *)param_4[2];
                puVar15 = (undefined8 *)param_4[3];
                local_120 = puVar15;
                if (*(long *)param_4[9] == 0) {
LAB_1408d9308:
                  local_150 = (undefined8 *)*puVar15;
                  local_130 = 0;
                  local_138 = 0;
                  local_98 = CONCAT71(local_98._1_7_,1);
                }
                else {
                  plVar22 = (long *)param_4[10];
                  local_c8._0_4_ = CONCAT22(*(short *)(param_3 + 0x30),1);
                  local_e8 = (undefined8 *)0x1;
                  uStack_e0 = 0;
                  uStack_d8 = 2;
                  uStack_d0 = (long *)CONCAT44(uStack_d0._4_4_,0x13000f);
                  func_0x000140f8a6c0();
                  if ((int)local_118 != 1) goto LAB_1408d9308;
                  sVar11 = local_118._4_2_;
                  uStack_140 = (undefined2)uStack_106;
                  uStack_13e = (undefined4)((uint6)uStack_106 >> 0x10);
                  local_148 = (ushort)uStack_10e;
                  uStack_146 = (undefined2)((uint6)uStack_10e >> 0x10);
                  local_144._0_2_ = (undefined2)((uint6)uStack_10e >> 0x20);
                  local_144._2_2_ = local_108;
                  if (*plVar22 == 0) goto LAB_1408d9308;
                  *(undefined4 *)plVar22[2] = *(undefined4 *)((long)plVar22 + 0x1c);
                  local_150 = (undefined8 *)func_0x0001415d4990();
                  if ((int)local_150 == 0) goto LAB_1408d9308;
                  local_130 = uStack_13e;
                  local_138 = CONCAT26(uStack_140,
                                       CONCAT24(local_144._2_2_,
                                                CONCAT22((undefined2)local_144,uStack_146)));
                  local_98 = CONCAT71(local_98._1_7_,sVar11 == 0x13);
                }
                local_90 = (undefined8 *)puVar5[1];
                puVar15 = (undefined8 *)func_0x000144e07d20();
                plVar22 = (long *)puVar5[2];
                plVar6 = (long *)puVar5[3];
                plVar23 = plVar22;
                if (plVar22 == (long *)0x0) {
                  plVar23 = plVar6;
                }
                lVar3 = plVar23[2];
                if ((ulong)(*plVar23 - lVar3) < 0x58) {
                  func_0x000145bcb2d0();
                }
                lVar4 = plVar23[1];
                *(undefined8 *)(lVar4 + lVar3) = 0x140b580a0;
                uVar7 = uRam0000000145e4ccf8;
                puVar16 = (undefined8 *)(lVar4 + 8 + lVar3);
                *puVar16 = _DAT_145e4ccf0;
                puVar16[1] = uVar7;
                *(undefined8 *)(lVar4 + 0x18 + lVar3) = local_138;
                *(undefined4 *)(lVar4 + 0x20 + lVar3) = local_130;
                *(undefined8 *)(lVar4 + 0x24 + lVar3) = 0x3f8000003f800000;
                *(undefined4 *)(lVar4 + 0x2c + lVar3) = 0x3f800000;
                *(undefined1 *)(lVar4 + 0x38 + lVar3) = 0;
                *(undefined8 **)(lVar4 + 0x48 + lVar3) = puVar15;
                plVar23[2] = lVar3 + 0x58;
                uStack_e0 = *puVar5;
                uStack_c0 = (undefined8 **)puVar5[4];
                uStack_d8 = (long)local_90;
                ppuVar18 = &local_e8;
                local_e8 = puVar15;
                uStack_d0 = plVar22;
                local_c8 = plVar6;
                puVar16 = (undefined8 *)func_0x0001415e2420();
                puVar15 = local_120;
                uVar7 = *puVar16;
                uStack_d0 = (long *)puVar5[2];
                if (uStack_d0 != (long *)0x0) {
                  ppuVar18 = (undefined8 **)puVar5[4];
                }
                local_c8 = (long *)puVar5[3];
                uStack_e0 = *puVar5;
                uStack_d8 = puVar5[1];
                local_e8 = local_150;
                uStack_c0 = ppuVar18;
                local_90 = puVar5;
                func_0x000144e61ed0();
                cVar12 = *(char *)(param_3 + 0x33);
              }
              if (cVar12 == '\0') {
                uVar20 = (ulong)~(uint)*puVar15;
                lVar3 = ((long *)param_4[0xb])[1];
                piVar19 = (int *)&DAT_145eed910;
                if (uVar20 < *(ulong *)(lVar3 + 0x10)) {
                  piVar19 = (int *)(uVar20 * 0x18 + *(long *)(lVar3 + 8));
                }
                if ((piVar19[4] == (int)((ulong)*puVar15 >> 0x20)) && (*piVar19 != 0)) {
                  lVar3 = *(long *)param_4[0xb];
                  uVar20 = *(ulong *)(piVar19 + 1) >> 0x20;
                  if ((uVar20 < *(ulong *)(lVar3 + 0x38)) &&
                     (((*(ulong *)(*(long *)(lVar3 + 0x28) + (*(ulong *)(piVar19 + 1) >> 0x26) * 8)
                        >> (uVar20 & 0x3f) & 1) != 0 &&
                      (uVar20 = func_0x0001407e00a0(), (uVar20 & 1) != 0)))) {
                    func_0x0001407e0cc0();
                  }
                }
              }
              pfVar8 = (float *)*param_4;
              local_e8 = (undefined8 *)param_4[0xc];
              *(undefined4 *)local_e8[2] = *(undefined4 *)((long)local_e8 + 0x1c);
              local_e8 = (undefined8 *)*local_e8;
              puVar5 = (undefined8 *)param_4[0xd];
              *(undefined4 *)puVar5[2] = *(undefined4 *)((long)puVar5 + 0x1c);
              uStack_e0 = *puVar5;
              puVar5 = (undefined8 *)param_4[0xe];
              *(undefined4 *)puVar5[2] = *(undefined4 *)((long)puVar5 + 0x1c);
              uStack_d8 = *puVar5;
              puVar5 = (undefined8 *)param_4[0xf];
              puVar24 = (undefined4 *)puVar5[2];
              *puVar24 = *(undefined4 *)((long)puVar5 + 0x1c);
              uStack_d0 = (long *)*puVar5;
              **(undefined4 **)(param_4[0x11] + 0x10) = *(undefined4 *)(param_4[0x11] + 0x1c);
              func_0x000140573fa0();
              *(undefined8 *)(param_3 + 0x20) = uVar7;
              if (*(char *)(param_3 + 0x32) == '\0') {
                fVar27 = _DAT_145d6d36c;
                if (*(char *)(local_88 + -0x100) != '\0') {
                  fVar27 = *(float *)(local_88 + -0xfc);
                }
                fVar2 = *pfVar8;
                *(undefined4 *)(param_3 + 0x18) = 1;
                *(float *)(param_3 + 0x1c) = fVar27 + fVar2;
              }
              cVar12 = func_0x0001422a4f70();
              if (cVar12 == '\0') goto LAB_1408d97c6;
              bVar25 = *(int *)(param_3 + 0x18) == 1;
              if (bVar25) {
                local_144 = *(float *)(param_3 + 0x1c) - *pfVar8;
              }
              local_148 = (ushort)bVar25;
              uStack_146 = 0;
              uStack_e0 = 0x144e0c7c0;
              uStack_d0 = (long *)0x1400020e0;
              local_c8 = (long *)local_128;
              uStack_c0 = (undefined8 **)0x145baefb0;
              local_b8 = &local_148;
              uStack_b0 = 0x1409291c0;
              local_e8 = puVar15;
              uStack_d8 = param_3;
              func_0x000145b9c4d0();
              local_88 = CONCAT62(uStack_10e,local_110);
              func_0x0001422a4be0();
              unaff_R14 = CONCAT71((int7)((ulong)puVar24 >> 8),1);
              if (local_118 != 0) {
                func_0x0001400021d0();
              }
              goto LAB_1408d97c9;
            }
          }
          uVar13 = (ushort)(uVar21 - 1) & (ushort)uVar21;
          uVar21 = CONCAT22((short)(uVar21 - 1 >> 0x10),uVar13);
        }
        auVar61[0] = -(cVar60 == cVar44);
        auVar61[1] = -(cVar62 == cVar45);
        auVar61[2] = -(cVar63 == cVar46);
        auVar61[3] = -(cVar64 == cVar47);
        auVar61[4] = -(cVar65 == cVar48);
        auVar61[5] = -(cVar66 == cVar49);
        auVar61[6] = -(cVar67 == cVar50);
        auVar61[7] = -(cVar68 == cVar51);
        auVar61[8] = -(cVar69 == cVar52);
        auVar61[9] = -(cVar70 == cVar53);
        auVar61[10] = -(cVar71 == cVar54);
        auVar61[0xb] = -(cVar72 == cVar55);
        auVar61[0xc] = -(cVar73 == cVar56);
        auVar61[0xd] = -(cVar74 == cVar57);
        auVar61[0xe] = -(cVar75 == cVar58);
        auVar61[0xf] = -(cVar76 == cVar59);
        if ((((((((((((((((SUB161(auVar61 >> 7,0) & 1) != 0 || (SUB161(auVar61 >> 0xf,0) & 1) != 0)
                        || (SUB161(auVar61 >> 0x17,0) & 1) != 0) ||
                       (SUB161(auVar61 >> 0x1f,0) & 1) != 0) || (SUB161(auVar61 >> 0x27,0) & 1) != 0
                      ) || (SUB161(auVar61 >> 0x2f,0) & 1) != 0) ||
                    (SUB161(auVar61 >> 0x37,0) & 1) != 0) || (SUB161(auVar61 >> 0x3f,0) & 1) != 0)
                  || (SUB161(auVar61 >> 0x47,0) & 1) != 0) || (SUB161(auVar61 >> 0x4f,0) & 1) != 0)
                || (SUB161(auVar61 >> 0x57,0) & 1) != 0) || (SUB161(auVar61 >> 0x5f,0) & 1) != 0) ||
              (SUB161(auVar61 >> 0x67,0) & 1) != 0) || (SUB161(auVar61 >> 0x6f,0) & 1) != 0) ||
            (SUB161(auVar61 >> 0x77,0) & 1) != 0) || auVar61[0xf] < '\0') goto LAB_1408d97c6;
        local_98 = local_98 + (long)local_90 + 0x10;
        local_90 = (undefined8 *)((long)local_90 + 0x10);
      } while( true );
    }
  }
  else {
    if (*(int *)(param_3 + 0x20) != 0) {
      puVar15 = *(undefined8 **)(param_3 + 0x20);
      func_0x000140576850(param_4,param_3,puVar15,param_4[1]);
      puVar5 = (undefined8 *)param_4[2];
      uStack_d0 = (long *)puVar5[2];
      uStack_c0 = extraout_RDX;
      if (uStack_d0 != (long *)0x0) {
        uStack_c0 = (undefined8 **)puVar5[4];
      }
      local_c8 = (long *)puVar5[3];
      uStack_e0 = *puVar5;
      uStack_d8 = puVar5[1];
      local_e8 = puVar15;
      func_0x000144e5ebd0();
    }
    cVar12 = func_0x0001422a4f70();
    if (cVar12 != '\0') {
      local_e8 = (undefined8 *)param_4[3];
      uStack_e0 = 0x144e0c7c0;
      uStack_d0 = (long *)0x1400020e0;
      uStack_d8 = param_3;
      func_0x000145b9c4d0();
      func_0x0001422a4be0();
LAB_1408d92c1:
      if (local_118 != 0) {
        func_0x0001400021d0();
      }
    }
LAB_1408d92dc:
    unaff_R14 = 0;
  }
LAB_1408d97c9:
  return unaff_R14 & 0xffffffff;
LAB_1408d97c6:
  unaff_R14 = CONCAT71((int7)((ulong)puVar24 >> 8),1);
  goto LAB_1408d97c9;
}
