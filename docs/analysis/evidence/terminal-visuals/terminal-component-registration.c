/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined1 (*) [16]
entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined1 (*param_4) [16])

{
  char *pcVar1;
  long lVar2;
  long lVar3;
  ushort uVar4;
  short sVar5;
  uint uVar6;
  uint uVar7;
  undefined1 uVar8;
  ulong uVar9;
  undefined8 extraout_RDX;
  uint uVar10;
  long lVar11;
  long lVar12;
  ushort uVar13;
  ulong uVar14;
  ulong uVar15;
  undefined1 auVar16 [16];
  undefined1 auVar17 [16];
  undefined1 auVar18 [16];
  undefined1 auVar19 [16];
  undefined1 auVar20 [16];
  undefined4 in_XMM6_Da;
  undefined1 auVar21 [16];
  undefined1 auVar22 [16];
  undefined1 auVar23 [16];
  long local_e0;
  long lStack_d8;
  long lStack_d0;
  long lStack_c8;
  long lStack_c0;
  long local_b8;
  long lStack_b0;
  long local_a8;
  long lStack_a0;
  long lStack_98;
  long local_90;
  long lStack_88;
  long local_80;
  long lStack_78;
  long *local_70;
  undefined1 local_61;
  undefined8 local_60;
  undefined4 local_58;

  local_60 = 0xfffffffffffffffe;
  lVar2 = param_3[3];
  local_58 = in_XMM6_Da;
  if (*(long *)(lVar2 + 0x30) != 0) {
    uVar9 = 0xb45778ce2bcdc6a7;
    lVar3 = *(long *)(lVar2 + 0x18);
    lVar11 = 0;
    while( true ) {
      uVar9 = uVar9 & *(ulong *)(lVar2 + 0x20);
      auVar21 = *(undefined1 (*) [16])(lVar3 + uVar9);
      auVar22[0] = -(auVar21[0] == DAT_145d97e60);
      auVar22[1] = -(auVar21[1] == cRam0000000145d97e61);
      auVar22[2] = -(auVar21[2] == cRam0000000145d97e62);
      auVar22[3] = -(auVar21[3] == cRam0000000145d97e63);
      auVar22[4] = -(auVar21[4] == cRam0000000145d97e64);
      auVar22[5] = -(auVar21[5] == cRam0000000145d97e65);
      auVar22[6] = -(auVar21[6] == cRam0000000145d97e66);
      auVar22[7] = -(auVar21[7] == cRam0000000145d97e67);
      auVar22[8] = -(auVar21[8] == cRam0000000145d97e68);
      auVar22[9] = -(auVar21[9] == cRam0000000145d97e69);
      auVar22[10] = -(auVar21[10] == cRam0000000145d97e6a);
      auVar22[0xb] = -(auVar21[0xb] == cRam0000000145d97e6b);
      auVar22[0xc] = -(auVar21[0xc] == cRam0000000145d97e6c);
      auVar22[0xd] = -(auVar21[0xd] == cRam0000000145d97e6d);
      auVar22[0xe] = -(auVar21[0xe] == cRam0000000145d97e6e);
      auVar22[0xf] = -(auVar21[0xf] == cRam0000000145d97e6f);
      uVar13 = (ushort)(SUB161(auVar22 >> 7,0) & 1) | (ushort)(SUB161(auVar22 >> 0xf,0) & 1) << 1 |
               (ushort)(SUB161(auVar22 >> 0x17,0) & 1) << 2 |
               (ushort)(SUB161(auVar22 >> 0x1f,0) & 1) << 3 |
               (ushort)(SUB161(auVar22 >> 0x27,0) & 1) << 4 |
               (ushort)(SUB161(auVar22 >> 0x2f,0) & 1) << 5 |
               (ushort)(SUB161(auVar22 >> 0x37,0) & 1) << 6 |
               (ushort)(SUB161(auVar22 >> 0x3f,0) & 1) << 7 |
               (ushort)(SUB161(auVar22 >> 0x47,0) & 1) << 8 |
               (ushort)(SUB161(auVar22 >> 0x4f,0) & 1) << 9 |
               (ushort)(SUB161(auVar22 >> 0x57,0) & 1) << 10 |
               (ushort)(SUB161(auVar22 >> 0x5f,0) & 1) << 0xb |
               (ushort)(SUB161(auVar22 >> 0x67,0) & 1) << 0xc |
               (ushort)(SUB161(auVar22 >> 0x6f,0) & 1) << 0xd |
               (ushort)(SUB161(auVar22 >> 0x77,0) & 1) << 0xe | (ushort)(auVar22[0xf] >> 7) << 0xf;
      uVar10 = (uint)uVar13;
      while (uVar13 != 0) {
        uVar6 = 0;
        for (uVar7 = uVar10; (uVar7 & 1) == 0; uVar7 = uVar7 >> 1 | 0x80000000) {
          uVar6 = uVar6 + 1;
        }
        uVar14 = uVar6 + uVar9 & *(ulong *)(lVar2 + 0x20);
        pcVar1 = (char *)(lVar3 + -0x18 + uVar14 * -0x18);
        auVar23[0] = -(*pcVar1 == DAT_145d973d0);
        auVar23[1] = -(pcVar1[1] == DAT_145d973d0._1_1_);
        auVar23[2] = -(pcVar1[2] == DAT_145d973d0._2_1_);
        auVar23[3] = -(pcVar1[3] == DAT_145d973d0._3_1_);
        auVar23[4] = -(pcVar1[4] == DAT_145d973d0._4_1_);
        auVar23[5] = -(pcVar1[5] == DAT_145d973d0._5_1_);
        auVar23[6] = -(pcVar1[6] == DAT_145d973d0._6_1_);
        auVar23[7] = -(pcVar1[7] == DAT_145d973d0._7_1_);
        auVar23[8] = -(pcVar1[8] == DAT_145d973d0._8_1_);
        auVar23[9] = -(pcVar1[9] == DAT_145d973d0._9_1_);
        auVar23[10] = -(pcVar1[10] == DAT_145d973d0._10_1_);
        auVar23[0xb] = -(pcVar1[0xb] == DAT_145d973d0._11_1_);
        auVar23[0xc] = -(pcVar1[0xc] == DAT_145d973d0._12_1_);
        auVar23[0xd] = -(pcVar1[0xd] == DAT_145d973d0._13_1_);
        auVar23[0xe] = -(pcVar1[0xe] == DAT_145d973d0._14_1_);
        auVar23[0xf] = -(pcVar1[0xf] == DAT_145d973d0._15_1_);
        if ((ushort)((ushort)(SUB161(auVar23 >> 7,0) & 1) |
                     (ushort)(SUB161(auVar23 >> 0xf,0) & 1) << 1 |
                     (ushort)(SUB161(auVar23 >> 0x17,0) & 1) << 2 |
                     (ushort)(SUB161(auVar23 >> 0x1f,0) & 1) << 3 |
                     (ushort)(SUB161(auVar23 >> 0x27,0) & 1) << 4 |
                     (ushort)(SUB161(auVar23 >> 0x2f,0) & 1) << 5 |
                     (ushort)(SUB161(auVar23 >> 0x37,0) & 1) << 6 |
                     (ushort)(SUB161(auVar23 >> 0x3f,0) & 1) << 7 |
                     (ushort)(SUB161(auVar23 >> 0x47,0) & 1) << 8 |
                     (ushort)(SUB161(auVar23 >> 0x4f,0) & 1) << 9 |
                     (ushort)(SUB161(auVar23 >> 0x57,0) & 1) << 10 |
                     (ushort)(SUB161(auVar23 >> 0x5f,0) & 1) << 0xb |
                     (ushort)(SUB161(auVar23 >> 0x67,0) & 1) << 0xc |
                     (ushort)(SUB161(auVar23 >> 0x6f,0) & 1) << 0xd |
                     (ushort)(SUB161(auVar23 >> 0x77,0) & 1) << 0xe |
                    (ushort)(auVar23[0xf] >> 7) << 0xf) == 0xffff) {
          local_70 = *(long **)(lVar3 + uVar14 * -0x18 + -8);
          func_0x000144e632f0(param_3,param_4,param_3[1],lVar2,param_3[2]);
          goto LAB_1402d040c;
        }
        uVar13 = (ushort)(uVar10 - 1) & (ushort)uVar10;
        uVar10 = CONCAT22((short)(uVar10 - 1 >> 0x10),uVar13);
      }
      auVar18[0] = -(auVar21[0] == -1);
      auVar18[1] = -(auVar21[1] == -1);
      auVar18[2] = -(auVar21[2] == -1);
      auVar18[3] = -(auVar21[3] == -1);
      auVar18[4] = -(auVar21[4] == -1);
      auVar18[5] = -(auVar21[5] == -1);
      auVar18[6] = -(auVar21[6] == -1);
      auVar18[7] = -(auVar21[7] == -1);
      auVar18[8] = -(auVar21[8] == -1);
      auVar18[9] = -(auVar21[9] == -1);
      auVar18[10] = -(auVar21[10] == -1);
      auVar18[0xb] = -(auVar21[0xb] == -1);
      auVar18[0xc] = -(auVar21[0xc] == -1);
      auVar18[0xd] = -(auVar21[0xd] == -1);
      auVar18[0xe] = -(auVar21[0xe] == -1);
      auVar18[0xf] = -(auVar21[0xf] == -1);
      if ((((((((((((((((SUB161(auVar18 >> 7,0) & 1) != 0 || (SUB161(auVar18 >> 0xf,0) & 1) != 0) ||
                      (SUB161(auVar18 >> 0x17,0) & 1) != 0) || (SUB161(auVar18 >> 0x1f,0) & 1) != 0)
                    || (SUB161(auVar18 >> 0x27,0) & 1) != 0) || (SUB161(auVar18 >> 0x2f,0) & 1) != 0
                   ) || (SUB161(auVar18 >> 0x37,0) & 1) != 0) ||
                 (SUB161(auVar18 >> 0x3f,0) & 1) != 0) || (SUB161(auVar18 >> 0x47,0) & 1) != 0) ||
               (SUB161(auVar18 >> 0x4f,0) & 1) != 0) || (SUB161(auVar18 >> 0x57,0) & 1) != 0) ||
             (SUB161(auVar18 >> 0x5f,0) & 1) != 0) || (SUB161(auVar18 >> 0x67,0) & 1) != 0) ||
           (SUB161(auVar18 >> 0x6f,0) & 1) != 0) || (SUB161(auVar18 >> 0x77,0) & 1) != 0) ||
          auVar18[0xf] < '\0') break;
      uVar9 = uVar9 + lVar11 + 0x10;
      lVar11 = lVar11 + 0x10;
    }
  }
  lVar3 = *(long *)(lVar2 + 0x80);
  uVar9 = *(ulong *)(lVar2 + 0x88);
  uVar14 = 0xb45778ce2bcdc6a7;
  lVar11 = 0;
  while( true ) {
    uVar14 = uVar14 & uVar9;
    pcVar1 = (char *)(lVar3 + uVar14);
    auVar21[0] = -(*pcVar1 == DAT_145d97e60);
    auVar21[1] = -(pcVar1[1] == cRam0000000145d97e61);
    auVar21[2] = -(pcVar1[2] == cRam0000000145d97e62);
    auVar21[3] = -(pcVar1[3] == cRam0000000145d97e63);
    auVar21[4] = -(pcVar1[4] == cRam0000000145d97e64);
    auVar21[5] = -(pcVar1[5] == cRam0000000145d97e65);
    auVar21[6] = -(pcVar1[6] == cRam0000000145d97e66);
    auVar21[7] = -(pcVar1[7] == cRam0000000145d97e67);
    auVar21[8] = -(pcVar1[8] == cRam0000000145d97e68);
    auVar21[9] = -(pcVar1[9] == cRam0000000145d97e69);
    auVar21[10] = -(pcVar1[10] == cRam0000000145d97e6a);
    auVar21[0xb] = -(pcVar1[0xb] == cRam0000000145d97e6b);
    auVar21[0xc] = -(pcVar1[0xc] == cRam0000000145d97e6c);
    auVar21[0xd] = -(pcVar1[0xd] == cRam0000000145d97e6d);
    auVar21[0xe] = -(pcVar1[0xe] == cRam0000000145d97e6e);
    auVar21[0xf] = -(pcVar1[0xf] == cRam0000000145d97e6f);
    uVar13 = (ushort)(SUB161(auVar21 >> 7,0) & 1) | (ushort)(SUB161(auVar21 >> 0xf,0) & 1) << 1 |
             (ushort)(SUB161(auVar21 >> 0x17,0) & 1) << 2 |
             (ushort)(SUB161(auVar21 >> 0x1f,0) & 1) << 3 |
             (ushort)(SUB161(auVar21 >> 0x27,0) & 1) << 4 |
             (ushort)(SUB161(auVar21 >> 0x2f,0) & 1) << 5 |
             (ushort)(SUB161(auVar21 >> 0x37,0) & 1) << 6 |
             (ushort)(SUB161(auVar21 >> 0x3f,0) & 1) << 7 |
             (ushort)(SUB161(auVar21 >> 0x47,0) & 1) << 8 |
             (ushort)(SUB161(auVar21 >> 0x4f,0) & 1) << 9 |
             (ushort)(SUB161(auVar21 >> 0x57,0) & 1) << 10 |
             (ushort)(SUB161(auVar21 >> 0x5f,0) & 1) << 0xb |
             (ushort)(SUB161(auVar21 >> 0x67,0) & 1) << 0xc |
             (ushort)(SUB161(auVar21 >> 0x6f,0) & 1) << 0xd |
             (ushort)(SUB161(auVar21 >> 0x77,0) & 1) << 0xe | (ushort)(auVar21[0xf] >> 7) << 0xf;
    uVar10 = (uint)uVar13;
    if (uVar13 != 0) break;
LAB_1402d0180:
    auVar19[0] = -(*pcVar1 == -1);
    auVar19[1] = -(pcVar1[1] == -1);
    auVar19[2] = -(pcVar1[2] == -1);
    auVar19[3] = -(pcVar1[3] == -1);
    auVar19[4] = -(pcVar1[4] == -1);
    auVar19[5] = -(pcVar1[5] == -1);
    auVar19[6] = -(pcVar1[6] == -1);
    auVar19[7] = -(pcVar1[7] == -1);
    auVar19[8] = -(pcVar1[8] == -1);
    auVar19[9] = -(pcVar1[9] == -1);
    auVar19[10] = -(pcVar1[10] == -1);
    auVar19[0xb] = -(pcVar1[0xb] == -1);
    auVar19[0xc] = -(pcVar1[0xc] == -1);
    auVar19[0xd] = -(pcVar1[0xd] == -1);
    auVar19[0xe] = -(pcVar1[0xe] == -1);
    auVar19[0xf] = -(pcVar1[0xf] == -1);
    if ((((((((((((((((SUB161(auVar19 >> 7,0) & 1) != 0 || (SUB161(auVar19 >> 0xf,0) & 1) != 0) ||
                    (SUB161(auVar19 >> 0x17,0) & 1) != 0) || (SUB161(auVar19 >> 0x1f,0) & 1) != 0)
                  || (SUB161(auVar19 >> 0x27,0) & 1) != 0) || (SUB161(auVar19 >> 0x2f,0) & 1) != 0)
                || (SUB161(auVar19 >> 0x37,0) & 1) != 0) || (SUB161(auVar19 >> 0x3f,0) & 1) != 0) ||
              (SUB161(auVar19 >> 0x47,0) & 1) != 0) || (SUB161(auVar19 >> 0x4f,0) & 1) != 0) ||
            (SUB161(auVar19 >> 0x57,0) & 1) != 0) || (SUB161(auVar19 >> 0x5f,0) & 1) != 0) ||
          (SUB161(auVar19 >> 0x67,0) & 1) != 0) || (SUB161(auVar19 >> 0x6f,0) & 1) != 0) ||
        (SUB161(auVar19 >> 0x77,0) & 1) != 0) || auVar19[0xf] < '\0') {
LAB_1402d0232:
      lVar3 = *(long *)param_3[4];
      *(long *)param_3[4] = lVar3 + 1;
      local_e0 = 1;
      lStack_d8 = _DAT_145da6a68;
      lStack_d0 = uRam0000000145da6a70;
      local_b8 = 1;
      lStack_b0 = 1;
      lStack_98 = 0;
      local_90 = CONCAT53(local_90._3_5_,0x10100);
      lStack_c8 = 2;
      lStack_c0 = 0x1400121f0;
      local_a8 = CONCAT71(local_a8._1_7_,2);
      func_0x0001400186e0(param_3,param_4,lVar3,lVar2,&local_e0);
      func_0x000140018530();
      lVar2 = param_3[2];
      if (lVar2 == *param_3) {
        func_0x000145bf4c40();
      }
      *(long *)(param_3[1] + lVar2 * 8) = lVar3;
      param_3[2] = lVar2 + 1;
      local_e0 = 0;
      lStack_d8 = 8;
      lStack_d0 = 0;
      lStack_c8 = _DAT_145df3150;
      lStack_c0 = lRam0000000145df3158;
      local_b8 = _DAT_145df3160;
      lStack_b0 = lRam0000000145df3168;
      local_a8 = 0;
      lStack_a0 = 8;
      lStack_98 = 0;
      local_90 = _DAT_145df3150;
      lStack_88 = lRam0000000145df3158;
      local_80 = _DAT_145df3160;
      lStack_78 = lRam0000000145df3168;
      local_61 = 1;
      func_0x000144e3e430();
      if (param_3[2] != 0) {
        param_3[2] = param_3[2] + -1;
      }
      local_70 = (long *)(lVar3 * 0x130 + *(long *)(param_3[3] + 8) + 0x58);
      func_0x000140010040();
      local_70[0xc] = local_80;
      local_70[0xd] = lStack_78;
      local_70[10] = local_90;
      local_70[0xb] = lStack_88;
      local_70[8] = lStack_a0;
      local_70[9] = lStack_98;
      local_70[6] = lStack_b0;
      local_70[7] = local_a8;
      local_70[4] = lStack_c0;
      local_70[5] = local_b8;
      local_70[2] = lStack_d0;
      local_70[3] = lStack_c8;
      *local_70 = local_e0;
      local_70[1] = lStack_d8;
      local_70 = (long *)lVar3;
LAB_1402d040c:
      auVar21 = func_0x000140397df0();
      auVar22 = func_0x000140148750();
      func_0x000140146fe0();
      auVar23 = func_0x000140093970();
      *(undefined8 *)(param_4[5] + 8) = 1;
      *(undefined8 *)param_4[6] = extraout_RDX;
      param_4[6][8] = 1;
      *(undefined1 (*) [16])(param_4[4] + 8) = auVar23;
      auVar23 = func_0x000140149120();
      param_4[1] = auVar22;
      param_4[2] = auVar21;
      *(undefined8 *)param_4[3] = 1;
      *(long **)(param_4[3] + 8) = local_70;
      param_4[4][0] = 1;
      *param_4 = auVar23;
      return param_4;
    }
    uVar14 = uVar14 + lVar11 + 0x10;
    lVar11 = lVar11 + 0x10;
  }
LAB_1402d0137:
  uVar6 = 0;
  for (uVar7 = uVar10; (uVar7 & 1) == 0; uVar7 = uVar7 >> 1 | 0x80000000) {
    uVar6 = uVar6 + 1;
  }
  uVar15 = uVar6 + uVar14 & uVar9;
  lVar12 = lVar3 + uVar15 * -0x80;
  auVar20[0] = -(*(char *)(lVar12 + -0x80) == DAT_145d973d0);
  auVar20[1] = -(*(char *)(lVar12 + -0x7f) == DAT_145d973d0._1_1_);
  auVar20[2] = -(*(char *)(lVar12 + -0x7e) == DAT_145d973d0._2_1_);
  auVar20[3] = -(*(char *)(lVar12 + -0x7d) == DAT_145d973d0._3_1_);
  auVar20[4] = -(*(char *)(lVar12 + -0x7c) == DAT_145d973d0._4_1_);
  auVar20[5] = -(*(char *)(lVar12 + -0x7b) == DAT_145d973d0._5_1_);
  auVar20[6] = -(*(char *)(lVar12 + -0x7a) == DAT_145d973d0._6_1_);
  auVar20[7] = -(*(char *)(lVar12 + -0x79) == DAT_145d973d0._7_1_);
  auVar20[8] = -(*(char *)(lVar12 + -0x78) == DAT_145d973d0._8_1_);
  auVar20[9] = -(*(char *)(lVar12 + -0x77) == DAT_145d973d0._9_1_);
  auVar20[10] = -(*(char *)(lVar12 + -0x76) == DAT_145d973d0._10_1_);
  auVar20[0xb] = -(*(char *)(lVar12 + -0x75) == DAT_145d973d0._11_1_);
  auVar20[0xc] = -(*(char *)(lVar12 + -0x74) == DAT_145d973d0._12_1_);
  auVar20[0xd] = -(*(char *)(lVar12 + -0x73) == DAT_145d973d0._13_1_);
  auVar20[0xe] = -(*(char *)(lVar12 + -0x72) == DAT_145d973d0._14_1_);
  auVar20[0xf] = -(*(char *)(lVar12 + -0x71) == DAT_145d973d0._15_1_);
  if ((ushort)((ushort)(SUB161(auVar20 >> 7,0) & 1) | (ushort)(SUB161(auVar20 >> 0xf,0) & 1) << 1 |
               (ushort)(SUB161(auVar20 >> 0x17,0) & 1) << 2 |
               (ushort)(SUB161(auVar20 >> 0x1f,0) & 1) << 3 |
               (ushort)(SUB161(auVar20 >> 0x27,0) & 1) << 4 |
               (ushort)(SUB161(auVar20 >> 0x2f,0) & 1) << 5 |
               (ushort)(SUB161(auVar20 >> 0x37,0) & 1) << 6 |
               (ushort)(SUB161(auVar20 >> 0x3f,0) & 1) << 7 |
               (ushort)(SUB161(auVar20 >> 0x47,0) & 1) << 8 |
               (ushort)(SUB161(auVar20 >> 0x4f,0) & 1) << 9 |
               (ushort)(SUB161(auVar20 >> 0x57,0) & 1) << 10 |
               (ushort)(SUB161(auVar20 >> 0x5f,0) & 1) << 0xb |
               (ushort)(SUB161(auVar20 >> 0x67,0) & 1) << 0xc |
               (ushort)(SUB161(auVar20 >> 0x6f,0) & 1) << 0xd |
               (ushort)(SUB161(auVar20 >> 0x77,0) & 1) << 0xe | (ushort)(auVar20[0xf] >> 7) << 0xf)
      != 0xffff) goto code_r0x0001402d0167;
  uVar9 = uVar15 - 0x10 & uVar9;
  pcVar1 = (char *)(lVar3 + uVar9);
  auVar16[0] = -(*pcVar1 == -1);
  auVar16[1] = -(pcVar1[1] == -1);
  auVar16[2] = -(pcVar1[2] == -1);
  auVar16[3] = -(pcVar1[3] == -1);
  auVar16[4] = -(pcVar1[4] == -1);
  auVar16[5] = -(pcVar1[5] == -1);
  auVar16[6] = -(pcVar1[6] == -1);
  auVar16[7] = -(pcVar1[7] == -1);
  auVar16[8] = -(pcVar1[8] == -1);
  auVar16[9] = -(pcVar1[9] == -1);
  auVar16[10] = -(pcVar1[10] == -1);
  auVar16[0xb] = -(pcVar1[0xb] == -1);
  auVar16[0xc] = -(pcVar1[0xc] == -1);
  auVar16[0xd] = -(pcVar1[0xd] == -1);
  auVar16[0xe] = -(pcVar1[0xe] == -1);
  auVar16[0xf] = -(pcVar1[0xf] == -1);
  uVar4 = (ushort)(SUB161(auVar16 >> 7,0) & 1) | (ushort)(SUB161(auVar16 >> 0xf,0) & 1) << 1 |
          (ushort)(SUB161(auVar16 >> 0x17,0) & 1) << 2 |
          (ushort)(SUB161(auVar16 >> 0x1f,0) & 1) << 3 |
          (ushort)(SUB161(auVar16 >> 0x27,0) & 1) << 4 |
          (ushort)(SUB161(auVar16 >> 0x2f,0) & 1) << 5 |
          (ushort)(SUB161(auVar16 >> 0x37,0) & 1) << 6 |
          (ushort)(SUB161(auVar16 >> 0x3f,0) & 1) << 7 |
          (ushort)(SUB161(auVar16 >> 0x47,0) & 1) << 8 |
          (ushort)(SUB161(auVar16 >> 0x4f,0) & 1) << 9 |
          (ushort)(SUB161(auVar16 >> 0x57,0) & 1) << 10 |
          (ushort)(SUB161(auVar16 >> 0x5f,0) & 1) << 0xb |
          (ushort)(SUB161(auVar16 >> 0x67,0) & 1) << 0xc |
          (ushort)(SUB161(auVar16 >> 0x6f,0) & 1) << 0xd |
          (ushort)(SUB161(auVar16 >> 0x77,0) & 1) << 0xe | (ushort)(auVar16[0xf] >> 7) << 0xf;
  pcVar1 = (char *)(lVar3 + uVar15);
  auVar17[0] = -(*pcVar1 == -1);
  auVar17[1] = -(pcVar1[1] == -1);
  auVar17[2] = -(pcVar1[2] == -1);
  auVar17[3] = -(pcVar1[3] == -1);
  auVar17[4] = -(pcVar1[4] == -1);
  auVar17[5] = -(pcVar1[5] == -1);
  auVar17[6] = -(pcVar1[6] == -1);
  auVar17[7] = -(pcVar1[7] == -1);
  auVar17[8] = -(pcVar1[8] == -1);
  auVar17[9] = -(pcVar1[9] == -1);
  auVar17[10] = -(pcVar1[10] == -1);
  auVar17[0xb] = -(pcVar1[0xb] == -1);
  auVar17[0xc] = -(pcVar1[0xc] == -1);
  auVar17[0xd] = -(pcVar1[0xd] == -1);
  auVar17[0xe] = -(pcVar1[0xe] == -1);
  auVar17[0xf] = -(pcVar1[0xf] == -1);
  uVar13 = 0xf;
  if (uVar4 != 0) {
    for (; uVar4 >> uVar13 == 0; uVar13 = uVar13 - 1) {
    }
  }
  sVar5 = 0;
  for (uVar10 = (ushort)((ushort)(SUB161(auVar17 >> 7,0) & 1) |
                         (ushort)(SUB161(auVar17 >> 0xf,0) & 1) << 1 |
                         (ushort)(SUB161(auVar17 >> 0x17,0) & 1) << 2 |
                         (ushort)(SUB161(auVar17 >> 0x1f,0) & 1) << 3 |
                         (ushort)(SUB161(auVar17 >> 0x27,0) & 1) << 4 |
                         (ushort)(SUB161(auVar17 >> 0x2f,0) & 1) << 5 |
                         (ushort)(SUB161(auVar17 >> 0x37,0) & 1) << 6 |
                         (ushort)(SUB161(auVar17 >> 0x3f,0) & 1) << 7 |
                         (ushort)(SUB161(auVar17 >> 0x47,0) & 1) << 8 |
                         (ushort)(SUB161(auVar17 >> 0x4f,0) & 1) << 9 |
                         (ushort)(SUB161(auVar17 >> 0x57,0) & 1) << 10 |
                         (ushort)(SUB161(auVar17 >> 0x5f,0) & 1) << 0xb |
                         (ushort)(SUB161(auVar17 >> 0x67,0) & 1) << 0xc |
                         (ushort)(SUB161(auVar17 >> 0x6f,0) & 1) << 0xd |
                         (ushort)(SUB161(auVar17 >> 0x77,0) & 1) << 0xe |
                        (ushort)(auVar17[0xf] >> 7) << 0xf) | 0x10000; (uVar10 & 1) == 0;
      uVar10 = uVar10 >> 1 | 0x80000000) {
    sVar5 = sVar5 + 1;
  }
  uVar8 = 0x80;
  if ((ushort)(sVar5 + (uVar13 ^ 0xf)) < 0x10) {
    *(long *)(lVar2 + 0x90) = *(long *)(lVar2 + 0x90) + 1;
    uVar8 = 0xff;
  }
  *(undefined1 *)(lVar3 + uVar15) = uVar8;
  *(undefined1 *)(lVar3 + 0x10 + uVar9) = uVar8;
  *(long *)(lVar2 + 0x98) = *(long *)(lVar2 + 0x98) + -1;
  local_e0 = *(long *)(lVar12 + -0x70);
  if (local_e0 != 2) {
    lStack_78 = *(long *)(lVar12 + -8);
    lStack_88 = *(long *)(lVar12 + -0x18);
    local_80 = *(long *)(lVar12 + -0x10);
    lStack_98 = *(long *)(lVar12 + -0x28);
    local_90 = *(long *)(lVar12 + -0x20);
    lStack_d8 = *(long *)(lVar12 + -0x68);
    lStack_d0 = *(long *)(lVar12 + -0x60);
    lStack_c8 = *(long *)(lVar12 + -0x58);
    lStack_c0 = *(long *)(lVar12 + -0x50);
    local_b8 = *(long *)(lVar12 + -0x48);
    lStack_b0 = *(long *)(lVar12 + -0x40);
    local_a8 = *(long *)(lVar12 + -0x38);
    lStack_a0 = *(long *)(lVar12 + -0x30);
    local_70 = (long *)func_0x000144e02be0(param_3,param_4,param_3,&local_e0);
    goto LAB_1402d040c;
  }
  goto LAB_1402d0232;
code_r0x0001402d0167:
  uVar13 = (ushort)(uVar10 - 1) & (ushort)uVar10;
  uVar10 = CONCAT22((short)(uVar10 - 1 >> 0x10),uVar13);
  if (uVar13 == 0) goto LAB_1402d0180;
  goto LAB_1402d0137;
}
