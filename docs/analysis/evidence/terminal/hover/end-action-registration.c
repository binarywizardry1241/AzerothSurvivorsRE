/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

long entry(void)

{
  char *pcVar1;
  ushort uVar2;
  short sVar3;
  uint uVar4;
  uint uVar5;
  long lVar6;
  long in_RCX;
  long lVar7;
  ushort uVar8;
  ulong uVar9;
  ulong uVar10;
  undefined1 uVar11;
  ulong uVar12;
  uint uVar13;
  long lVar14;
  undefined1 auVar15 [16];
  undefined1 auVar16 [16];
  undefined1 auVar17 [16];
  undefined1 auVar18 [16];
  undefined1 auVar19 [16];
  undefined1 auVar20 [16];
  undefined1 auVar21 [16];
  undefined1 auVar22 [16];
  undefined4 in_XMM6_Da;
  long local_e0;
  undefined8 uStack_d8;
  undefined8 uStack_d0;
  undefined8 uStack_c8;
  undefined8 uStack_c0;
  undefined8 local_b8;
  undefined8 uStack_b0;
  undefined8 local_a8;
  undefined8 uStack_a0;
  undefined8 uStack_98;
  undefined8 local_90;
  undefined8 uStack_88;
  undefined8 local_80;
  undefined8 uStack_78;
  long local_70;
  long local_68;
  long local_60;
  long local_58;
  long *local_50;
  undefined1 local_41;
  undefined8 local_40;
  undefined4 local_38;

  local_40 = 0xfffffffffffffffe;
  local_58 = in_RCX + 0x40;
  local_50 = (long *)(in_RCX + 0x5a8);
  local_70 = 0;
  local_68 = 8;
  local_60 = 0;
  local_38 = in_XMM6_Da;
  if (*(long *)(in_RCX + 0x70) != 0) {
    uVar12 = 0x427b007cc519b5b;
    lVar6 = *(long *)(in_RCX + 0x58);
    lVar14 = 0;
    while( true ) {
      uVar12 = uVar12 & *(ulong *)(in_RCX + 0x60);
      auVar21 = *(undefined1 (*) [16])(lVar6 + uVar12);
      auVar19[0] = -(auVar21[0] == DAT_145d6dc90);
      auVar19[1] = -(auVar21[1] == cRam0000000145d6dc91);
      auVar19[2] = -(auVar21[2] == cRam0000000145d6dc92);
      auVar19[3] = -(auVar21[3] == cRam0000000145d6dc93);
      auVar19[4] = -(auVar21[4] == cRam0000000145d6dc94);
      auVar19[5] = -(auVar21[5] == cRam0000000145d6dc95);
      auVar19[6] = -(auVar21[6] == cRam0000000145d6dc96);
      auVar19[7] = -(auVar21[7] == cRam0000000145d6dc97);
      auVar19[8] = -(auVar21[8] == cRam0000000145d6dc98);
      auVar19[9] = -(auVar21[9] == cRam0000000145d6dc99);
      auVar19[10] = -(auVar21[10] == cRam0000000145d6dc9a);
      auVar19[0xb] = -(auVar21[0xb] == cRam0000000145d6dc9b);
      auVar19[0xc] = -(auVar21[0xc] == cRam0000000145d6dc9c);
      auVar19[0xd] = -(auVar21[0xd] == cRam0000000145d6dc9d);
      auVar19[0xe] = -(auVar21[0xe] == cRam0000000145d6dc9e);
      auVar19[0xf] = -(auVar21[0xf] == cRam0000000145d6dc9f);
      uVar8 = (ushort)(SUB161(auVar19 >> 7,0) & 1) | (ushort)(SUB161(auVar19 >> 0xf,0) & 1) << 1 |
              (ushort)(SUB161(auVar19 >> 0x17,0) & 1) << 2 |
              (ushort)(SUB161(auVar19 >> 0x1f,0) & 1) << 3 |
              (ushort)(SUB161(auVar19 >> 0x27,0) & 1) << 4 |
              (ushort)(SUB161(auVar19 >> 0x2f,0) & 1) << 5 |
              (ushort)(SUB161(auVar19 >> 0x37,0) & 1) << 6 |
              (ushort)(SUB161(auVar19 >> 0x3f,0) & 1) << 7 |
              (ushort)(SUB161(auVar19 >> 0x47,0) & 1) << 8 |
              (ushort)(SUB161(auVar19 >> 0x4f,0) & 1) << 9 |
              (ushort)(SUB161(auVar19 >> 0x57,0) & 1) << 10 |
              (ushort)(SUB161(auVar19 >> 0x5f,0) & 1) << 0xb |
              (ushort)(SUB161(auVar19 >> 0x67,0) & 1) << 0xc |
              (ushort)(SUB161(auVar19 >> 0x6f,0) & 1) << 0xd |
              (ushort)(SUB161(auVar19 >> 0x77,0) & 1) << 0xe | (ushort)(auVar19[0xf] >> 7) << 0xf;
      uVar13 = (uint)uVar8;
      while (uVar8 != 0) {
        uVar4 = 0;
        for (uVar5 = uVar13; (uVar5 & 1) == 0; uVar5 = uVar5 >> 1 | 0x80000000) {
          uVar4 = uVar4 + 1;
        }
        uVar9 = uVar4 + uVar12 & *(ulong *)(in_RCX + 0x60);
        pcVar1 = (char *)(lVar6 + -0x18 + uVar9 * -0x18);
        auVar20[0] = -(*pcVar1 == DAT_145da8d00);
        auVar20[1] = -(pcVar1[1] == DAT_145da8d00._1_1_);
        auVar20[2] = -(pcVar1[2] == DAT_145da8d00._2_1_);
        auVar20[3] = -(pcVar1[3] == DAT_145da8d00._3_1_);
        auVar20[4] = -(pcVar1[4] == DAT_145da8d00._4_1_);
        auVar20[5] = -(pcVar1[5] == DAT_145da8d00._5_1_);
        auVar20[6] = -(pcVar1[6] == DAT_145da8d00._6_1_);
        auVar20[7] = -(pcVar1[7] == DAT_145da8d00._7_1_);
        auVar20[8] = -(pcVar1[8] == DAT_145da8d00._8_1_);
        auVar20[9] = -(pcVar1[9] == DAT_145da8d00._9_1_);
        auVar20[10] = -(pcVar1[10] == DAT_145da8d00._10_1_);
        auVar20[0xb] = -(pcVar1[0xb] == DAT_145da8d00._11_1_);
        auVar20[0xc] = -(pcVar1[0xc] == DAT_145da8d00._12_1_);
        auVar20[0xd] = -(pcVar1[0xd] == DAT_145da8d00._13_1_);
        auVar20[0xe] = -(pcVar1[0xe] == DAT_145da8d00._14_1_);
        auVar20[0xf] = -(pcVar1[0xf] == DAT_145da8d00._15_1_);
        if ((ushort)((ushort)(SUB161(auVar20 >> 7,0) & 1) |
                     (ushort)(SUB161(auVar20 >> 0xf,0) & 1) << 1 |
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
                     (ushort)(SUB161(auVar20 >> 0x77,0) & 1) << 0xe |
                    (ushort)(auVar20[0xf] >> 7) << 0xf) == 0xffff) {
          lVar6 = *(long *)(lVar6 + uVar9 * -0x18 + -8);
          func_0x000144e52a40(uVar9 * -3,lVar6,8,local_58,0,lVar6);
          goto LAB_1402a6cf1;
        }
        uVar8 = (ushort)(uVar13 - 1) & (ushort)uVar13;
        uVar13 = CONCAT22((short)(uVar13 - 1 >> 0x10),uVar8);
      }
      auVar17[0] = -(auVar21[0] == -1);
      auVar17[1] = -(auVar21[1] == -1);
      auVar17[2] = -(auVar21[2] == -1);
      auVar17[3] = -(auVar21[3] == -1);
      auVar17[4] = -(auVar21[4] == -1);
      auVar17[5] = -(auVar21[5] == -1);
      auVar17[6] = -(auVar21[6] == -1);
      auVar17[7] = -(auVar21[7] == -1);
      auVar17[8] = -(auVar21[8] == -1);
      auVar17[9] = -(auVar21[9] == -1);
      auVar17[10] = -(auVar21[10] == -1);
      auVar17[0xb] = -(auVar21[0xb] == -1);
      auVar17[0xc] = -(auVar21[0xc] == -1);
      auVar17[0xd] = -(auVar21[0xd] == -1);
      auVar17[0xe] = -(auVar21[0xe] == -1);
      auVar17[0xf] = -(auVar21[0xf] == -1);
      if ((((((((((((((((SUB161(auVar17 >> 7,0) & 1) != 0 || (SUB161(auVar17 >> 0xf,0) & 1) != 0) ||
                      (SUB161(auVar17 >> 0x17,0) & 1) != 0) || (SUB161(auVar17 >> 0x1f,0) & 1) != 0)
                    || (SUB161(auVar17 >> 0x27,0) & 1) != 0) || (SUB161(auVar17 >> 0x2f,0) & 1) != 0
                   ) || (SUB161(auVar17 >> 0x37,0) & 1) != 0) ||
                 (SUB161(auVar17 >> 0x3f,0) & 1) != 0) || (SUB161(auVar17 >> 0x47,0) & 1) != 0) ||
               (SUB161(auVar17 >> 0x4f,0) & 1) != 0) || (SUB161(auVar17 >> 0x57,0) & 1) != 0) ||
             (SUB161(auVar17 >> 0x5f,0) & 1) != 0) || (SUB161(auVar17 >> 0x67,0) & 1) != 0) ||
           (SUB161(auVar17 >> 0x6f,0) & 1) != 0) || (SUB161(auVar17 >> 0x77,0) & 1) != 0) ||
          auVar17[0xf] < '\0') break;
      uVar12 = uVar12 + lVar14 + 0x10;
      lVar14 = lVar14 + 0x10;
    }
  }
  lVar6 = *(long *)(in_RCX + 0xc0);
  uVar12 = *(ulong *)(in_RCX + 200);
  uVar9 = 0x427b007cc519b5b;
  lVar14 = 0;
  while( true ) {
    uVar9 = uVar9 & uVar12;
    pcVar1 = (char *)(lVar6 + uVar9);
    auVar21[0] = -(*pcVar1 == DAT_145d6dc90);
    auVar21[1] = -(pcVar1[1] == cRam0000000145d6dc91);
    auVar21[2] = -(pcVar1[2] == cRam0000000145d6dc92);
    auVar21[3] = -(pcVar1[3] == cRam0000000145d6dc93);
    auVar21[4] = -(pcVar1[4] == cRam0000000145d6dc94);
    auVar21[5] = -(pcVar1[5] == cRam0000000145d6dc95);
    auVar21[6] = -(pcVar1[6] == cRam0000000145d6dc96);
    auVar21[7] = -(pcVar1[7] == cRam0000000145d6dc97);
    auVar21[8] = -(pcVar1[8] == cRam0000000145d6dc98);
    auVar21[9] = -(pcVar1[9] == cRam0000000145d6dc99);
    auVar21[10] = -(pcVar1[10] == cRam0000000145d6dc9a);
    auVar21[0xb] = -(pcVar1[0xb] == cRam0000000145d6dc9b);
    auVar21[0xc] = -(pcVar1[0xc] == cRam0000000145d6dc9c);
    auVar21[0xd] = -(pcVar1[0xd] == cRam0000000145d6dc9d);
    auVar21[0xe] = -(pcVar1[0xe] == cRam0000000145d6dc9e);
    auVar21[0xf] = -(pcVar1[0xf] == cRam0000000145d6dc9f);
    uVar8 = (ushort)(SUB161(auVar21 >> 7,0) & 1) | (ushort)(SUB161(auVar21 >> 0xf,0) & 1) << 1 |
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
    uVar13 = (uint)uVar8;
    if (uVar8 != 0) break;
LAB_1402a6ac0:
    auVar18[0] = -(*pcVar1 == -1);
    auVar18[1] = -(pcVar1[1] == -1);
    auVar18[2] = -(pcVar1[2] == -1);
    auVar18[3] = -(pcVar1[3] == -1);
    auVar18[4] = -(pcVar1[4] == -1);
    auVar18[5] = -(pcVar1[5] == -1);
    auVar18[6] = -(pcVar1[6] == -1);
    auVar18[7] = -(pcVar1[7] == -1);
    auVar18[8] = -(pcVar1[8] == -1);
    auVar18[9] = -(pcVar1[9] == -1);
    auVar18[10] = -(pcVar1[10] == -1);
    auVar18[0xb] = -(pcVar1[0xb] == -1);
    auVar18[0xc] = -(pcVar1[0xc] == -1);
    auVar18[0xd] = -(pcVar1[0xd] == -1);
    auVar18[0xe] = -(pcVar1[0xe] == -1);
    auVar18[0xf] = -(pcVar1[0xf] == -1);
    if ((((((((((((((((SUB161(auVar18 >> 7,0) & 1) != 0 || (SUB161(auVar18 >> 0xf,0) & 1) != 0) ||
                    (SUB161(auVar18 >> 0x17,0) & 1) != 0) || (SUB161(auVar18 >> 0x1f,0) & 1) != 0)
                  || (SUB161(auVar18 >> 0x27,0) & 1) != 0) || (SUB161(auVar18 >> 0x2f,0) & 1) != 0)
                || (SUB161(auVar18 >> 0x37,0) & 1) != 0) || (SUB161(auVar18 >> 0x3f,0) & 1) != 0) ||
              (SUB161(auVar18 >> 0x47,0) & 1) != 0) || (SUB161(auVar18 >> 0x4f,0) & 1) != 0) ||
            (SUB161(auVar18 >> 0x57,0) & 1) != 0) || (SUB161(auVar18 >> 0x5f,0) & 1) != 0) ||
          (SUB161(auVar18 >> 0x67,0) & 1) != 0) || (SUB161(auVar18 >> 0x6f,0) & 1) != 0) ||
        (SUB161(auVar18 >> 0x77,0) & 1) != 0) || auVar18[0xf] < '\0') {
LAB_1402a6b71:
      lVar6 = *local_50;
      *local_50 = lVar6 + 1;
      local_e0 = 1;
      uStack_d8 = _DAT_145d9e700;
      uStack_d0 = uRam0000000145d9e708;
      local_b8 = 1;
      uStack_b0 = 1;
      uStack_98 = 0;
      local_90 = CONCAT53(local_90._3_5_,0x10100);
      uStack_c8 = 2;
      uStack_c0 = 0x14015fde0;
      local_a8 = CONCAT71(local_a8._1_7_,2);
      func_0x000140011c70(in_RCX,lVar6,lVar6,local_58,&local_e0);
      func_0x000140011ac0();
      if (local_60 == local_70) {
        func_0x000145bcb370();
      }
      *(long *)(local_68 + local_60 * 8) = lVar6;
      local_60 = local_60 + 1;
      local_e0 = 0;
      uStack_d8 = 8;
      uStack_d0 = 0;
      uStack_c8 = _DAT_145dc2630;
      uStack_c0 = uRam0000000145dc2638;
      local_b8 = _DAT_145dc2640;
      uStack_b0 = uRam0000000145dc2648;
      local_a8 = 0;
      uStack_a0 = 8;
      uStack_98 = 0;
      local_90 = _DAT_145dc2630;
      uStack_88 = uRam0000000145dc2638;
      local_80 = _DAT_145dc2640;
      uStack_78 = uRam0000000145dc2648;
      local_41 = 1;
      func_0x000144e2db80();
      if (local_60 != 0) {
        local_60 = local_60 + -1;
      }
      lVar14 = lVar6 * 0x130 + *(long *)(local_58 + 8);
      func_0x00014000e980();
      *(undefined8 *)(lVar14 + 0xb8) = local_80;
      *(undefined8 *)(lVar14 + 0xc0) = uStack_78;
      *(undefined8 *)(lVar14 + 0xa8) = local_90;
      *(undefined8 *)(lVar14 + 0xb0) = uStack_88;
      *(undefined8 *)(lVar14 + 0x98) = uStack_a0;
      *(undefined8 *)(lVar14 + 0xa0) = uStack_98;
      *(undefined8 *)(lVar14 + 0x88) = uStack_b0;
      *(undefined8 *)(lVar14 + 0x90) = local_a8;
      *(undefined8 *)(lVar14 + 0x78) = uStack_c0;
      *(undefined8 *)(lVar14 + 0x80) = local_b8;
      *(undefined8 *)(lVar14 + 0x68) = uStack_d0;
      *(undefined8 *)(lVar14 + 0x70) = uStack_c8;
      *(long *)(lVar14 + 0x58) = local_e0;
      *(undefined8 *)(lVar14 + 0x60) = uStack_d8;
LAB_1402a6cf1:
      if (local_70 != 0) {
LAB_1402a6cfa:
        func_0x0001400021d0();
      }
      return lVar6;
    }
    uVar9 = uVar9 + lVar14 + 0x10;
    lVar14 = lVar14 + 0x10;
  }
LAB_1402a6a79:
  uVar4 = 0;
  for (uVar5 = uVar13; (uVar5 & 1) == 0; uVar5 = uVar5 >> 1 | 0x80000000) {
    uVar4 = uVar4 + 1;
  }
  uVar10 = uVar4 + uVar9 & uVar12;
  lVar7 = lVar6 + uVar10 * -0x80;
  auVar22[0] = -(*(char *)(lVar7 + -0x80) == DAT_145da8d00);
  auVar22[1] = -(*(char *)(lVar7 + -0x7f) == DAT_145da8d00._1_1_);
  auVar22[2] = -(*(char *)(lVar7 + -0x7e) == DAT_145da8d00._2_1_);
  auVar22[3] = -(*(char *)(lVar7 + -0x7d) == DAT_145da8d00._3_1_);
  auVar22[4] = -(*(char *)(lVar7 + -0x7c) == DAT_145da8d00._4_1_);
  auVar22[5] = -(*(char *)(lVar7 + -0x7b) == DAT_145da8d00._5_1_);
  auVar22[6] = -(*(char *)(lVar7 + -0x7a) == DAT_145da8d00._6_1_);
  auVar22[7] = -(*(char *)(lVar7 + -0x79) == DAT_145da8d00._7_1_);
  auVar22[8] = -(*(char *)(lVar7 + -0x78) == DAT_145da8d00._8_1_);
  auVar22[9] = -(*(char *)(lVar7 + -0x77) == DAT_145da8d00._9_1_);
  auVar22[10] = -(*(char *)(lVar7 + -0x76) == DAT_145da8d00._10_1_);
  auVar22[0xb] = -(*(char *)(lVar7 + -0x75) == DAT_145da8d00._11_1_);
  auVar22[0xc] = -(*(char *)(lVar7 + -0x74) == DAT_145da8d00._12_1_);
  auVar22[0xd] = -(*(char *)(lVar7 + -0x73) == DAT_145da8d00._13_1_);
  auVar22[0xe] = -(*(char *)(lVar7 + -0x72) == DAT_145da8d00._14_1_);
  auVar22[0xf] = -(*(char *)(lVar7 + -0x71) == DAT_145da8d00._15_1_);
  if ((ushort)((ushort)(SUB161(auVar22 >> 7,0) & 1) | (ushort)(SUB161(auVar22 >> 0xf,0) & 1) << 1 |
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
               (ushort)(SUB161(auVar22 >> 0x77,0) & 1) << 0xe | (ushort)(auVar22[0xf] >> 7) << 0xf)
      != 0xffff) goto code_r0x0001402a6aa7;
  uVar12 = uVar10 - 0x10 & uVar12;
  pcVar1 = (char *)(lVar6 + uVar12);
  auVar15[0] = -(*pcVar1 == -1);
  auVar15[1] = -(pcVar1[1] == -1);
  auVar15[2] = -(pcVar1[2] == -1);
  auVar15[3] = -(pcVar1[3] == -1);
  auVar15[4] = -(pcVar1[4] == -1);
  auVar15[5] = -(pcVar1[5] == -1);
  auVar15[6] = -(pcVar1[6] == -1);
  auVar15[7] = -(pcVar1[7] == -1);
  auVar15[8] = -(pcVar1[8] == -1);
  auVar15[9] = -(pcVar1[9] == -1);
  auVar15[10] = -(pcVar1[10] == -1);
  auVar15[0xb] = -(pcVar1[0xb] == -1);
  auVar15[0xc] = -(pcVar1[0xc] == -1);
  auVar15[0xd] = -(pcVar1[0xd] == -1);
  auVar15[0xe] = -(pcVar1[0xe] == -1);
  auVar15[0xf] = -(pcVar1[0xf] == -1);
  uVar2 = (ushort)(SUB161(auVar15 >> 7,0) & 1) | (ushort)(SUB161(auVar15 >> 0xf,0) & 1) << 1 |
          (ushort)(SUB161(auVar15 >> 0x17,0) & 1) << 2 |
          (ushort)(SUB161(auVar15 >> 0x1f,0) & 1) << 3 |
          (ushort)(SUB161(auVar15 >> 0x27,0) & 1) << 4 |
          (ushort)(SUB161(auVar15 >> 0x2f,0) & 1) << 5 |
          (ushort)(SUB161(auVar15 >> 0x37,0) & 1) << 6 |
          (ushort)(SUB161(auVar15 >> 0x3f,0) & 1) << 7 |
          (ushort)(SUB161(auVar15 >> 0x47,0) & 1) << 8 |
          (ushort)(SUB161(auVar15 >> 0x4f,0) & 1) << 9 |
          (ushort)(SUB161(auVar15 >> 0x57,0) & 1) << 10 |
          (ushort)(SUB161(auVar15 >> 0x5f,0) & 1) << 0xb |
          (ushort)(SUB161(auVar15 >> 0x67,0) & 1) << 0xc |
          (ushort)(SUB161(auVar15 >> 0x6f,0) & 1) << 0xd |
          (ushort)(SUB161(auVar15 >> 0x77,0) & 1) << 0xe | (ushort)(auVar15[0xf] >> 7) << 0xf;
  pcVar1 = (char *)(lVar6 + uVar10);
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
  uVar8 = 0xf;
  if (uVar2 != 0) {
    for (; uVar2 >> uVar8 == 0; uVar8 = uVar8 - 1) {
    }
  }
  sVar3 = 0;
  for (uVar13 = (ushort)((ushort)(SUB161(auVar16 >> 7,0) & 1) |
                         (ushort)(SUB161(auVar16 >> 0xf,0) & 1) << 1 |
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
                         (ushort)(SUB161(auVar16 >> 0x77,0) & 1) << 0xe |
                        (ushort)(auVar16[0xf] >> 7) << 0xf) | 0x10000; (uVar13 & 1) == 0;
      uVar13 = uVar13 >> 1 | 0x80000000) {
    sVar3 = sVar3 + 1;
  }
  uVar11 = 0x80;
  if ((ushort)(sVar3 + (uVar8 ^ 0xf)) < 0x10) {
    *(long *)(in_RCX + 0xd0) = *(long *)(in_RCX + 0xd0) + 1;
    uVar11 = 0xff;
  }
  *(undefined1 *)(lVar6 + uVar10) = uVar11;
  *(undefined1 *)(lVar6 + 0x10 + uVar12) = uVar11;
  *(long *)(in_RCX + 0xd8) = *(long *)(in_RCX + 0xd8) + -1;
  local_e0 = *(long *)(lVar7 + -0x70);
  if (local_e0 == 2) goto LAB_1402a6b71;
  uStack_78 = *(undefined8 *)(lVar7 + -8);
  uStack_88 = *(undefined8 *)(lVar7 + -0x18);
  local_80 = *(undefined8 *)(lVar7 + -0x10);
  uStack_98 = *(undefined8 *)(lVar7 + -0x28);
  local_90 = *(undefined8 *)(lVar7 + -0x20);
  uStack_d8 = *(undefined8 *)(lVar7 + -0x68);
  uStack_d0 = *(undefined8 *)(lVar7 + -0x60);
  uStack_c8 = *(undefined8 *)(lVar7 + -0x58);
  uStack_c0 = *(undefined8 *)(lVar7 + -0x50);
  local_b8 = *(undefined8 *)(lVar7 + -0x48);
  uStack_b0 = *(undefined8 *)(lVar7 + -0x40);
  local_a8 = *(undefined8 *)(lVar7 + -0x38);
  uStack_a0 = *(undefined8 *)(lVar7 + -0x30);
  lVar6 = func_0x000144df2330(uVar10,lVar7,&local_70,&local_e0);
  if (local_70 == 0) {
    return lVar6;
  }
  goto LAB_1402a6cfa;
code_r0x0001402a6aa7:
  uVar8 = (ushort)(uVar13 - 1) & (ushort)uVar13;
  uVar13 = CONCAT22((short)(uVar13 - 1 >> 0x10),uVar8);
  if (uVar8 == 0) goto LAB_1402a6ac0;
  goto LAB_1402a6a79;
}
