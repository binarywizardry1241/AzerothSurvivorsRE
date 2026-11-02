/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined1  [16] entry(void)

{
  char *pcVar1;
  short sVar2;
  uint uVar3;
  long lVar4;
  long *in_RCX;
  long lVar5;
  undefined1 uVar6;
  ulong uVar7;
  uint uVar8;
  ulong uVar9;
  uint uVar10;
  long lVar11;
  int iVar12;
  long lVar13;
  ushort uVar14;
  ulong uVar15;
  ulong uVar16;
  undefined1 auVar17 [16];
  undefined1 auVar18 [16];
  undefined1 auVar19 [16];
  undefined1 auVar20 [16];
  undefined1 auVar21 [16];
  undefined1 auVar22 [16];
  undefined1 auVar23 [16];
  undefined1 auVar24 [16];
  undefined4 in_XMM6_Da;
  undefined1 auVar25 [16];
  long local_b8;
  undefined8 uStack_b0;
  undefined8 uStack_a8;
  undefined8 uStack_a0;
  undefined8 uStack_98;
  undefined8 local_90;
  undefined8 uStack_88;
  undefined8 local_80;
  undefined8 uStack_78;
  undefined8 uStack_70;
  undefined8 local_68;
  undefined8 uStack_60;
  undefined8 local_58;
  undefined8 uStack_50;
  undefined1 local_41;
  undefined8 local_40;
  undefined4 local_38;

  local_40 = 0xfffffffffffffffe;
  lVar5 = in_RCX[3];
  local_38 = in_XMM6_Da;
  if (*(long *)(lVar5 + 0x30) != 0) {
    uVar7 = 0xaa5f7a713a1e5058;
    lVar4 = *(long *)(lVar5 + 0x18);
    lVar11 = 0;
    while( true ) {
      uVar7 = uVar7 & *(ulong *)(lVar5 + 0x20);
      auVar23 = *(undefined1 (*) [16])(lVar4 + uVar7);
      auVar21[0] = -(auVar23[0] == DAT_145dd7ce0);
      auVar21[1] = -(auVar23[1] == cRam0000000145dd7ce1);
      auVar21[2] = -(auVar23[2] == cRam0000000145dd7ce2);
      auVar21[3] = -(auVar23[3] == cRam0000000145dd7ce3);
      auVar21[4] = -(auVar23[4] == cRam0000000145dd7ce4);
      auVar21[5] = -(auVar23[5] == cRam0000000145dd7ce5);
      auVar21[6] = -(auVar23[6] == cRam0000000145dd7ce6);
      auVar21[7] = -(auVar23[7] == cRam0000000145dd7ce7);
      auVar21[8] = -(auVar23[8] == cRam0000000145dd7ce8);
      auVar21[9] = -(auVar23[9] == cRam0000000145dd7ce9);
      auVar21[10] = -(auVar23[10] == cRam0000000145dd7cea);
      auVar21[0xb] = -(auVar23[0xb] == cRam0000000145dd7ceb);
      auVar21[0xc] = -(auVar23[0xc] == cRam0000000145dd7cec);
      auVar21[0xd] = -(auVar23[0xd] == cRam0000000145dd7ced);
      auVar21[0xe] = -(auVar23[0xe] == cRam0000000145dd7cee);
      auVar21[0xf] = -(auVar23[0xf] == cRam0000000145dd7cef);
      uVar14 = (ushort)(SUB161(auVar21 >> 7,0) & 1) | (ushort)(SUB161(auVar21 >> 0xf,0) & 1) << 1 |
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
      uVar10 = (uint)uVar14;
      while (uVar14 != 0) {
        uVar8 = 0;
        for (uVar3 = uVar10; (uVar3 & 1) == 0; uVar3 = uVar3 >> 1 | 0x80000000) {
          uVar8 = uVar8 + 1;
        }
        uVar15 = uVar8 + uVar7 & *(ulong *)(lVar5 + 0x20);
        pcVar1 = (char *)(lVar4 + -0x18 + uVar15 * -0x18);
        auVar22[0] = -(*pcVar1 == DAT_145dd7cf0);
        auVar22[1] = -(pcVar1[1] == DAT_145dd7cf0._1_1_);
        auVar22[2] = -(pcVar1[2] == DAT_145dd7cf0._2_1_);
        auVar22[3] = -(pcVar1[3] == DAT_145dd7cf0._3_1_);
        auVar22[4] = -(pcVar1[4] == DAT_145dd7cf0._4_1_);
        auVar22[5] = -(pcVar1[5] == DAT_145dd7cf0._5_1_);
        auVar22[6] = -(pcVar1[6] == DAT_145dd7cf0._6_1_);
        auVar22[7] = -(pcVar1[7] == DAT_145dd7cf0._7_1_);
        auVar22[8] = -(pcVar1[8] == DAT_145dd7cf0._8_1_);
        auVar22[9] = -(pcVar1[9] == DAT_145dd7cf0._9_1_);
        auVar22[10] = -(pcVar1[10] == DAT_145dd7cf0._10_1_);
        auVar22[0xb] = -(pcVar1[0xb] == DAT_145dd7cf0._11_1_);
        auVar22[0xc] = -(pcVar1[0xc] == DAT_145dd7cf0._12_1_);
        auVar22[0xd] = -(pcVar1[0xd] == DAT_145dd7cf0._13_1_);
        auVar22[0xe] = -(pcVar1[0xe] == DAT_145dd7cf0._14_1_);
        auVar22[0xf] = -(pcVar1[0xf] == DAT_145dd7cf0._15_1_);
        if ((ushort)((ushort)(SUB161(auVar22 >> 7,0) & 1) |
                     (ushort)(SUB161(auVar22 >> 0xf,0) & 1) << 1 |
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
                     (ushort)(SUB161(auVar22 >> 0x77,0) & 1) << 0xe |
                    (ushort)(auVar22[0xf] >> 7) << 0xf) == 0xffff) {
          lVar4 = *(long *)(lVar4 + uVar15 * -0x18 + -8);
          func_0x000144e8b490(lVar4,in_RCX,in_RCX[1],lVar5,in_RCX[2],lVar4);
          goto LAB_14019ca83;
        }
        uVar14 = (ushort)(uVar10 - 1) & (ushort)uVar10;
        uVar10 = CONCAT22((short)(uVar10 - 1 >> 0x10),uVar14);
      }
      auVar19[0] = -(auVar23[0] == -1);
      auVar19[1] = -(auVar23[1] == -1);
      auVar19[2] = -(auVar23[2] == -1);
      auVar19[3] = -(auVar23[3] == -1);
      auVar19[4] = -(auVar23[4] == -1);
      auVar19[5] = -(auVar23[5] == -1);
      auVar19[6] = -(auVar23[6] == -1);
      auVar19[7] = -(auVar23[7] == -1);
      auVar19[8] = -(auVar23[8] == -1);
      auVar19[9] = -(auVar23[9] == -1);
      auVar19[10] = -(auVar23[10] == -1);
      auVar19[0xb] = -(auVar23[0xb] == -1);
      auVar19[0xc] = -(auVar23[0xc] == -1);
      auVar19[0xd] = -(auVar23[0xd] == -1);
      auVar19[0xe] = -(auVar23[0xe] == -1);
      auVar19[0xf] = -(auVar23[0xf] == -1);
      if ((((((((((((((((SUB161(auVar19 >> 7,0) & 1) != 0 || (SUB161(auVar19 >> 0xf,0) & 1) != 0) ||
                      (SUB161(auVar19 >> 0x17,0) & 1) != 0) || (SUB161(auVar19 >> 0x1f,0) & 1) != 0)
                    || (SUB161(auVar19 >> 0x27,0) & 1) != 0) || (SUB161(auVar19 >> 0x2f,0) & 1) != 0
                   ) || (SUB161(auVar19 >> 0x37,0) & 1) != 0) ||
                 (SUB161(auVar19 >> 0x3f,0) & 1) != 0) || (SUB161(auVar19 >> 0x47,0) & 1) != 0) ||
               (SUB161(auVar19 >> 0x4f,0) & 1) != 0) || (SUB161(auVar19 >> 0x57,0) & 1) != 0) ||
             (SUB161(auVar19 >> 0x5f,0) & 1) != 0) || (SUB161(auVar19 >> 0x67,0) & 1) != 0) ||
           (SUB161(auVar19 >> 0x6f,0) & 1) != 0) || (SUB161(auVar19 >> 0x77,0) & 1) != 0) ||
          auVar19[0xf] < '\0') break;
      uVar7 = uVar7 + lVar11 + 0x10;
      lVar11 = lVar11 + 0x10;
    }
  }
  lVar4 = *(long *)(lVar5 + 0x80);
  uVar7 = *(ulong *)(lVar5 + 0x88);
  uVar15 = 0xaa5f7a713a1e5058;
  lVar11 = 0;
  while( true ) {
    uVar15 = uVar15 & uVar7;
    pcVar1 = (char *)(lVar4 + uVar15);
    auVar23[0] = -(*pcVar1 == DAT_145dd7ce0);
    auVar23[1] = -(pcVar1[1] == cRam0000000145dd7ce1);
    auVar23[2] = -(pcVar1[2] == cRam0000000145dd7ce2);
    auVar23[3] = -(pcVar1[3] == cRam0000000145dd7ce3);
    auVar23[4] = -(pcVar1[4] == cRam0000000145dd7ce4);
    auVar23[5] = -(pcVar1[5] == cRam0000000145dd7ce5);
    auVar23[6] = -(pcVar1[6] == cRam0000000145dd7ce6);
    auVar23[7] = -(pcVar1[7] == cRam0000000145dd7ce7);
    auVar23[8] = -(pcVar1[8] == cRam0000000145dd7ce8);
    auVar23[9] = -(pcVar1[9] == cRam0000000145dd7ce9);
    auVar23[10] = -(pcVar1[10] == cRam0000000145dd7cea);
    auVar23[0xb] = -(pcVar1[0xb] == cRam0000000145dd7ceb);
    auVar23[0xc] = -(pcVar1[0xc] == cRam0000000145dd7cec);
    auVar23[0xd] = -(pcVar1[0xd] == cRam0000000145dd7ced);
    auVar23[0xe] = -(pcVar1[0xe] == cRam0000000145dd7cee);
    auVar23[0xf] = -(pcVar1[0xf] == cRam0000000145dd7cef);
    uVar14 = (ushort)(SUB161(auVar23 >> 7,0) & 1) | (ushort)(SUB161(auVar23 >> 0xf,0) & 1) << 1 |
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
             (ushort)(SUB161(auVar23 >> 0x77,0) & 1) << 0xe | (ushort)(auVar23[0xf] >> 7) << 0xf;
    uVar9 = (ulong)uVar14;
    if (uVar14 != 0) break;
LAB_14019c800:
    auVar20[0] = -(*pcVar1 == -1);
    auVar20[1] = -(pcVar1[1] == -1);
    auVar20[2] = -(pcVar1[2] == -1);
    auVar20[3] = -(pcVar1[3] == -1);
    auVar20[4] = -(pcVar1[4] == -1);
    auVar20[5] = -(pcVar1[5] == -1);
    auVar20[6] = -(pcVar1[6] == -1);
    auVar20[7] = -(pcVar1[7] == -1);
    auVar20[8] = -(pcVar1[8] == -1);
    auVar20[9] = -(pcVar1[9] == -1);
    auVar20[10] = -(pcVar1[10] == -1);
    auVar20[0xb] = -(pcVar1[0xb] == -1);
    auVar20[0xc] = -(pcVar1[0xc] == -1);
    auVar20[0xd] = -(pcVar1[0xd] == -1);
    auVar20[0xe] = -(pcVar1[0xe] == -1);
    auVar20[0xf] = -(pcVar1[0xf] == -1);
    if ((((((((((((((((SUB161(auVar20 >> 7,0) & 1) != 0 || (SUB161(auVar20 >> 0xf,0) & 1) != 0) ||
                    (SUB161(auVar20 >> 0x17,0) & 1) != 0) || (SUB161(auVar20 >> 0x1f,0) & 1) != 0)
                  || (SUB161(auVar20 >> 0x27,0) & 1) != 0) || (SUB161(auVar20 >> 0x2f,0) & 1) != 0)
                || (SUB161(auVar20 >> 0x37,0) & 1) != 0) || (SUB161(auVar20 >> 0x3f,0) & 1) != 0) ||
              (SUB161(auVar20 >> 0x47,0) & 1) != 0) || (SUB161(auVar20 >> 0x4f,0) & 1) != 0) ||
            (SUB161(auVar20 >> 0x57,0) & 1) != 0) || (SUB161(auVar20 >> 0x5f,0) & 1) != 0) ||
          (SUB161(auVar20 >> 0x67,0) & 1) != 0) || (SUB161(auVar20 >> 0x6f,0) & 1) != 0) ||
        (SUB161(auVar20 >> 0x77,0) & 1) != 0) || auVar20[0xf] < '\0') {
LAB_14019c8b1:
      lVar4 = *(long *)in_RCX[4];
      *(long *)in_RCX[4] = lVar4 + 1;
      local_b8 = 1;
      uStack_b0 = _DAT_145da0a78;
      uStack_a8 = uRam0000000145da0a80;
      local_90 = 1;
      uStack_88 = 1;
      uStack_70 = 0;
      local_68 = CONCAT53(local_68._3_5_,0x10100);
      uStack_a0 = 2;
      uStack_98 = 0x140232e70;
      local_80 = CONCAT71(local_80._1_7_,2);
      func_0x0001400106a0(lVar4,in_RCX,lVar4,lVar5,&local_b8);
      func_0x0001400104f0();
      lVar5 = in_RCX[2];
      if (lVar5 == *in_RCX) {
        func_0x000145bf39e0();
      }
      *(long *)(in_RCX[1] + lVar5 * 8) = lVar4;
      in_RCX[2] = lVar5 + 1;
      local_b8 = 0;
      uStack_b0 = 8;
      uStack_a8 = 0;
      uStack_a0 = _DAT_145dd8de0;
      uStack_98 = uRam0000000145dd8de8;
      local_90 = _DAT_145dd8df0;
      uStack_88 = uRam0000000145dd8df8;
      local_80 = 0;
      uStack_78 = 8;
      uStack_70 = 0;
      local_68 = _DAT_145dd8de0;
      uStack_60 = uRam0000000145dd8de8;
      local_58 = _DAT_145dd8df0;
      uStack_50 = uRam0000000145dd8df8;
      local_41 = 1;
      func_0x000144e3e8f0();
      if (in_RCX[2] != 0) {
        in_RCX[2] = in_RCX[2] + -1;
      }
      lVar5 = lVar4 * 0x130 + *(long *)(in_RCX[3] + 8);
      func_0x00014000b630();
      *(undefined8 *)(lVar5 + 0xb8) = local_58;
      *(undefined8 *)(lVar5 + 0xc0) = uStack_50;
      *(undefined8 *)(lVar5 + 0xa8) = local_68;
      *(undefined8 *)(lVar5 + 0xb0) = uStack_60;
      *(undefined8 *)(lVar5 + 0x98) = uStack_78;
      *(undefined8 *)(lVar5 + 0xa0) = uStack_70;
      *(undefined8 *)(lVar5 + 0x88) = uStack_88;
      *(undefined8 *)(lVar5 + 0x90) = local_80;
      *(undefined8 *)(lVar5 + 0x78) = uStack_98;
      *(undefined8 *)(lVar5 + 0x80) = local_90;
      *(undefined8 *)(lVar5 + 0x68) = uStack_a8;
      *(undefined8 *)(lVar5 + 0x70) = uStack_a0;
      *(long *)(lVar5 + 0x58) = local_b8;
      *(undefined8 *)(lVar5 + 0x60) = uStack_b0;
LAB_14019ca83:
      auVar25._8_8_ = lVar4;
      auVar25._0_8_ = 1;
      return auVar25;
    }
    uVar15 = uVar15 + lVar11 + 0x10;
    lVar11 = lVar11 + 0x10;
  }
LAB_14019c7b7:
  uVar10 = 0;
  for (uVar8 = (uint)uVar9; (uVar8 & 1) == 0; uVar8 = uVar8 >> 1 | 0x80000000) {
    uVar10 = uVar10 + 1;
  }
  uVar16 = uVar10 + uVar15 & uVar7;
  lVar13 = lVar4 + uVar16 * -0x80;
  auVar24[0] = -(*(char *)(lVar13 + -0x80) == DAT_145dd7cf0);
  auVar24[1] = -(*(char *)(lVar13 + -0x7f) == DAT_145dd7cf0._1_1_);
  auVar24[2] = -(*(char *)(lVar13 + -0x7e) == DAT_145dd7cf0._2_1_);
  auVar24[3] = -(*(char *)(lVar13 + -0x7d) == DAT_145dd7cf0._3_1_);
  auVar24[4] = -(*(char *)(lVar13 + -0x7c) == DAT_145dd7cf0._4_1_);
  auVar24[5] = -(*(char *)(lVar13 + -0x7b) == DAT_145dd7cf0._5_1_);
  auVar24[6] = -(*(char *)(lVar13 + -0x7a) == DAT_145dd7cf0._6_1_);
  auVar24[7] = -(*(char *)(lVar13 + -0x79) == DAT_145dd7cf0._7_1_);
  auVar24[8] = -(*(char *)(lVar13 + -0x78) == DAT_145dd7cf0._8_1_);
  auVar24[9] = -(*(char *)(lVar13 + -0x77) == DAT_145dd7cf0._9_1_);
  auVar24[10] = -(*(char *)(lVar13 + -0x76) == DAT_145dd7cf0._10_1_);
  auVar24[0xb] = -(*(char *)(lVar13 + -0x75) == DAT_145dd7cf0._11_1_);
  auVar24[0xc] = -(*(char *)(lVar13 + -0x74) == DAT_145dd7cf0._12_1_);
  auVar24[0xd] = -(*(char *)(lVar13 + -0x73) == DAT_145dd7cf0._13_1_);
  auVar24[0xe] = -(*(char *)(lVar13 + -0x72) == DAT_145dd7cf0._14_1_);
  auVar24[0xf] = -(*(char *)(lVar13 + -0x71) == DAT_145dd7cf0._15_1_);
  if ((ushort)((ushort)(SUB161(auVar24 >> 7,0) & 1) | (ushort)(SUB161(auVar24 >> 0xf,0) & 1) << 1 |
               (ushort)(SUB161(auVar24 >> 0x17,0) & 1) << 2 |
               (ushort)(SUB161(auVar24 >> 0x1f,0) & 1) << 3 |
               (ushort)(SUB161(auVar24 >> 0x27,0) & 1) << 4 |
               (ushort)(SUB161(auVar24 >> 0x2f,0) & 1) << 5 |
               (ushort)(SUB161(auVar24 >> 0x37,0) & 1) << 6 |
               (ushort)(SUB161(auVar24 >> 0x3f,0) & 1) << 7 |
               (ushort)(SUB161(auVar24 >> 0x47,0) & 1) << 8 |
               (ushort)(SUB161(auVar24 >> 0x4f,0) & 1) << 9 |
               (ushort)(SUB161(auVar24 >> 0x57,0) & 1) << 10 |
               (ushort)(SUB161(auVar24 >> 0x5f,0) & 1) << 0xb |
               (ushort)(SUB161(auVar24 >> 0x67,0) & 1) << 0xc |
               (ushort)(SUB161(auVar24 >> 0x6f,0) & 1) << 0xd |
               (ushort)(SUB161(auVar24 >> 0x77,0) & 1) << 0xe | (ushort)(auVar24[0xf] >> 7) << 0xf)
      != 0xffff) goto code_r0x00014019c7e5;
  uVar7 = uVar16 - 0x10 & uVar7;
  pcVar1 = (char *)(lVar4 + uVar7);
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
  uVar14 = (ushort)(SUB161(auVar17 >> 7,0) & 1) | (ushort)(SUB161(auVar17 >> 0xf,0) & 1) << 1 |
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
           (ushort)(SUB161(auVar17 >> 0x77,0) & 1) << 0xe | (ushort)(auVar17[0xf] >> 7) << 0xf;
  pcVar1 = (char *)(lVar4 + uVar16);
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
  sVar2 = 0xf;
  if (uVar14 != 0) {
    for (; uVar14 >> sVar2 == 0; sVar2 = sVar2 + -1) {
    }
  }
  uVar8 = (uint)CONCAT62((int6)(uVar9 >> 0x10),sVar2) ^ 0xf;
  sVar2 = 0;
  for (uVar10 = (ushort)((ushort)(SUB161(auVar18 >> 7,0) & 1) |
                         (ushort)(SUB161(auVar18 >> 0xf,0) & 1) << 1 |
                         (ushort)(SUB161(auVar18 >> 0x17,0) & 1) << 2 |
                         (ushort)(SUB161(auVar18 >> 0x1f,0) & 1) << 3 |
                         (ushort)(SUB161(auVar18 >> 0x27,0) & 1) << 4 |
                         (ushort)(SUB161(auVar18 >> 0x2f,0) & 1) << 5 |
                         (ushort)(SUB161(auVar18 >> 0x37,0) & 1) << 6 |
                         (ushort)(SUB161(auVar18 >> 0x3f,0) & 1) << 7 |
                         (ushort)(SUB161(auVar18 >> 0x47,0) & 1) << 8 |
                         (ushort)(SUB161(auVar18 >> 0x4f,0) & 1) << 9 |
                         (ushort)(SUB161(auVar18 >> 0x57,0) & 1) << 10 |
                         (ushort)(SUB161(auVar18 >> 0x5f,0) & 1) << 0xb |
                         (ushort)(SUB161(auVar18 >> 0x67,0) & 1) << 0xc |
                         (ushort)(SUB161(auVar18 >> 0x6f,0) & 1) << 0xd |
                         (ushort)(SUB161(auVar18 >> 0x77,0) & 1) << 0xe |
                        (ushort)(auVar18[0xf] >> 7) << 0xf) | 0x10000; (uVar10 & 1) == 0;
      uVar10 = uVar10 >> 1 | 0x80000000) {
    sVar2 = sVar2 + 1;
  }
  uVar6 = 0x80;
  if ((ushort)(sVar2 + (short)uVar8) < 0x10) {
    *(long *)(lVar5 + 0x90) = *(long *)(lVar5 + 0x90) + 1;
    uVar6 = 0xff;
  }
  *(undefined1 *)(lVar4 + uVar16) = uVar6;
  *(undefined1 *)(lVar4 + 0x10 + uVar7) = uVar6;
  *(long *)(lVar5 + 0x98) = *(long *)(lVar5 + 0x98) + -1;
  local_b8 = *(long *)(lVar13 + -0x70);
  if (local_b8 != 2) {
    uStack_50 = *(undefined8 *)(lVar13 + -8);
    uStack_60 = *(undefined8 *)(lVar13 + -0x18);
    local_58 = *(undefined8 *)(lVar13 + -0x10);
    uStack_70 = *(undefined8 *)(lVar13 + -0x28);
    local_68 = *(undefined8 *)(lVar13 + -0x20);
    uStack_b0 = *(undefined8 *)(lVar13 + -0x68);
    uStack_a8 = *(undefined8 *)(lVar13 + -0x60);
    uStack_a0 = *(undefined8 *)(lVar13 + -0x58);
    uStack_98 = *(undefined8 *)(lVar13 + -0x50);
    local_90 = *(undefined8 *)(lVar13 + -0x48);
    uStack_88 = *(undefined8 *)(lVar13 + -0x40);
    local_80 = *(undefined8 *)(lVar13 + -0x38);
    uStack_78 = *(undefined8 *)(lVar13 + -0x30);
    lVar4 = func_0x000144e030a0(uVar8,in_RCX,in_RCX,&local_b8);
    goto LAB_14019ca83;
  }
  goto LAB_14019c8b1;
code_r0x00014019c7e5:
  iVar12 = (uint)uVar9 - 1;
  uVar14 = (ushort)iVar12 & (ushort)uVar9;
  uVar9 = (ulong)CONCAT22((short)((uint)iVar12 >> 0x10),uVar14);
  if (uVar14 == 0) goto LAB_14019c800;
  goto LAB_14019c7b7;
}
