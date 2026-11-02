
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long param_3)

{
  long lVar1;
  uint *puVar2;
  char *pcVar3;
  char *pcVar4;
  int iVar5;
  undefined4 uVar6;
  long *plVar7;
  code *pcVar8;
  uint uVar9;
  uint uVar10;
  char cVar11;
  int *piVar12;
  ulong uVar13;
  long lVar14;
  long lVar15;
  uint uVar16;
  ushort uVar17;
  ulong uVar18;
  long lVar19;
  undefined1 auVar20 [16];
  undefined1 auVar21 [16];
  undefined1 auVar22 [16];
  undefined1 auVar23 [16];
  undefined1 auVar24 [16];
  undefined1 auVar25 [16];
  undefined1 auVar26 [16];
  undefined1 auVar27 [16];
  undefined1 auVar28 [16];
  long local_1d0;
  long local_d8;
  long local_d0;
  char local_c8;
  ulong local_c0;
  long local_a0;
  long local_98;
  long local_90;
  
  func_0x000140488020();
  func_0x0001404790a0();
  if (local_1d0 != *(long *)(param_3 + 0x5a0)) {
    func_0x0001461c1300();
LAB_140213826:
                    /* WARNING: Does not return */
    pcVar8 = (code *)invalidInstructionException();
    (*pcVar8)();
  }
  if (local_c8 != '\0') {
    lVar14 = 0;
    do {
      if (local_d0 << 2 == lVar14) goto LAB_1402133d8;
      puVar2 = (uint *)(local_d8 + lVar14);
      lVar14 = lVar14 + 4;
    } while (*(long *)(*(long *)(param_3 + 0x1a8) + 0x10 + (ulong)*puVar2 * 0x48) == 0);
    lVar14 = *(long *)(param_3 + 0x1a8) + (ulong)*puVar2 * 0x48;
    if ((local_c0 < *(ulong *)(lVar14 + 0x40)) &&
       (uVar13 = *(ulong *)(*(long *)(lVar14 + 0x38) + local_c0 * 8), uVar13 != 0)) {
      piVar12 = *(int **)(*(long *)(lVar14 + 0x18) + 0x10 + ~uVar13 * 0x30);
      iVar5 = *piVar12;
    }
    else {
      piVar12 = (int *)0x0;
      iVar5 = iRam0000000000000000;
    }
    goto joined_r0x00014021326f;
  }
  lVar14 = 0;
  do {
    if (local_d0 << 2 == lVar14) goto LAB_1402133d8;
    lVar15 = (ulong)*(uint *)(local_d8 + lVar14) * 0xa0;
    lVar14 = lVar14 + 4;
  } while (*(long *)(*(long *)(param_3 + 0x108) + 0x58 + lVar15) == 0);
  lVar15 = *(long *)(param_3 + 0x108) + lVar15;
  uVar13 = (ulong)*(uint *)(lVar15 + 0x94);
  if (local_c0 < *(ulong *)(*(long *)(param_3 + 0x1a8) + 0x40 + uVar13 * 0x48)) {
    lVar14 = *(long *)(param_3 + 0x1a8) + uVar13 * 0x48;
    uVar13 = *(ulong *)(*(long *)(lVar14 + 0x38) + local_c0 * 8);
    if (uVar13 == 0) goto LAB_140213276;
    lVar14 = *(long *)(*(long *)(lVar14 + 0x18) + 0x10 + ~uVar13 * 0x30);
  }
  else {
LAB_140213276:
    lVar14 = 0;
  }
  piVar12 = (int *)((ulong)~*(uint *)(*(long *)(lVar15 + 0x50) + 8) * 0xf8 + lVar14);
  iVar5 = *piVar12;
joined_r0x00014021326f:
  if ((((iVar5 != 1) || (*(double *)(piVar12 + 2) < 0.0)) || (*(double *)(piVar12 + 4) < 0.0)) ||
     (((double)(uint)piVar12[0x30] <= *(double *)(piVar12 + 2) ||
      ((double)(uint)piVar12[0x31] <= *(double *)(piVar12 + 4))))) {
LAB_1402133d8:
    func_0x000140153b80();
    if (*(long *)(param_3 + 0x90) != 0) {
      lVar14 = *(long *)(param_3 + 0x78);
      uVar13 = 0x63f1b974fb8f7c39;
      lVar15 = 0;
      while( true ) {
        uVar13 = uVar13 & *(ulong *)(param_3 + 0x80);
        pcVar3 = (char *)(lVar14 + uVar13);
        auVar25[0] = -(*pcVar3 == DAT_14624cd10);
        auVar25[1] = -(pcVar3[1] == DAT_14624cd10._1_1_);
        auVar25[2] = -(pcVar3[2] == DAT_14624cd10._2_1_);
        auVar25[3] = -(pcVar3[3] == DAT_14624cd10._3_1_);
        auVar25[4] = -(pcVar3[4] == DAT_14624cd10._4_1_);
        auVar25[5] = -(pcVar3[5] == DAT_14624cd10._5_1_);
        auVar25[6] = -(pcVar3[6] == DAT_14624cd10._6_1_);
        auVar25[7] = -(pcVar3[7] == DAT_14624cd10._7_1_);
        auVar25[8] = -(pcVar3[8] == DAT_14624cd10._8_1_);
        auVar25[9] = -(pcVar3[9] == DAT_14624cd10._9_1_);
        auVar25[10] = -(pcVar3[10] == DAT_14624cd10._10_1_);
        auVar25[0xb] = -(pcVar3[0xb] == DAT_14624cd10._11_1_);
        auVar25[0xc] = -(pcVar3[0xc] == DAT_14624cd10._12_1_);
        auVar25[0xd] = -(pcVar3[0xd] == DAT_14624cd10._13_1_);
        auVar25[0xe] = -(pcVar3[0xe] == DAT_14624cd10._14_1_);
        auVar25[0xf] = -(pcVar3[0xf] == DAT_14624cd10._15_1_);
        uVar17 = (ushort)(SUB161(auVar25 >> 7,0) & 1) | (ushort)(SUB161(auVar25 >> 0xf,0) & 1) << 1
                 | (ushort)(SUB161(auVar25 >> 0x17,0) & 1) << 2 |
                 (ushort)(SUB161(auVar25 >> 0x1f,0) & 1) << 3 |
                 (ushort)(SUB161(auVar25 >> 0x27,0) & 1) << 4 |
                 (ushort)(SUB161(auVar25 >> 0x2f,0) & 1) << 5 |
                 (ushort)(SUB161(auVar25 >> 0x37,0) & 1) << 6 |
                 (ushort)(SUB161(auVar25 >> 0x3f,0) & 1) << 7 |
                 (ushort)(SUB161(auVar25 >> 0x47,0) & 1) << 8 |
                 (ushort)(SUB161(auVar25 >> 0x4f,0) & 1) << 9 |
                 (ushort)(SUB161(auVar25 >> 0x57,0) & 1) << 10 |
                 (ushort)(SUB161(auVar25 >> 0x5f,0) & 1) << 0xb |
                 (ushort)(SUB161(auVar25 >> 0x67,0) & 1) << 0xc |
                 (ushort)(SUB161(auVar25 >> 0x6f,0) & 1) << 0xd |
                 (ushort)(SUB161(auVar25 >> 0x77,0) & 1) << 0xe | (ushort)(auVar25[0xf] >> 7) << 0xf
        ;
        uVar16 = (uint)uVar17;
        while (uVar17 != 0) {
          uVar9 = 0;
          for (uVar10 = uVar16; (uVar10 & 1) == 0; uVar10 = uVar10 >> 1 | 0x80000000) {
            uVar9 = uVar9 + 1;
          }
          uVar18 = uVar9 + uVar13 & *(ulong *)(param_3 + 0x80);
          pcVar4 = (char *)(lVar14 + -0x18 + uVar18 * -0x18);
          auVar26[0] = -(*pcVar4 == DAT_14625ffb0);
          auVar26[1] = -(pcVar4[1] == cRam000000014625ffb1);
          auVar26[2] = -(pcVar4[2] == cRam000000014625ffb2);
          auVar26[3] = -(pcVar4[3] == cRam000000014625ffb3);
          auVar26[4] = -(pcVar4[4] == cRam000000014625ffb4);
          auVar26[5] = -(pcVar4[5] == cRam000000014625ffb5);
          auVar26[6] = -(pcVar4[6] == cRam000000014625ffb6);
          auVar26[7] = -(pcVar4[7] == cRam000000014625ffb7);
          auVar26[8] = -(pcVar4[8] == cRam000000014625ffb8);
          auVar26[9] = -(pcVar4[9] == cRam000000014625ffb9);
          auVar26[10] = -(pcVar4[10] == cRam000000014625ffba);
          auVar26[0xb] = -(pcVar4[0xb] == cRam000000014625ffbb);
          auVar26[0xc] = -(pcVar4[0xc] == cRam000000014625ffbc);
          auVar26[0xd] = -(pcVar4[0xd] == cRam000000014625ffbd);
          auVar26[0xe] = -(pcVar4[0xe] == cRam000000014625ffbe);
          auVar26[0xf] = -(pcVar4[0xf] == cRam000000014625ffbf);
          if ((ushort)((ushort)(SUB161(auVar26 >> 7,0) & 1) |
                       (ushort)(SUB161(auVar26 >> 0xf,0) & 1) << 1 |
                       (ushort)(SUB161(auVar26 >> 0x17,0) & 1) << 2 |
                       (ushort)(SUB161(auVar26 >> 0x1f,0) & 1) << 3 |
                       (ushort)(SUB161(auVar26 >> 0x27,0) & 1) << 4 |
                       (ushort)(SUB161(auVar26 >> 0x2f,0) & 1) << 5 |
                       (ushort)(SUB161(auVar26 >> 0x37,0) & 1) << 6 |
                       (ushort)(SUB161(auVar26 >> 0x3f,0) & 1) << 7 |
                       (ushort)(SUB161(auVar26 >> 0x47,0) & 1) << 8 |
                       (ushort)(SUB161(auVar26 >> 0x4f,0) & 1) << 9 |
                       (ushort)(SUB161(auVar26 >> 0x57,0) & 1) << 10 |
                       (ushort)(SUB161(auVar26 >> 0x5f,0) & 1) << 0xb |
                       (ushort)(SUB161(auVar26 >> 0x67,0) & 1) << 0xc |
                       (ushort)(SUB161(auVar26 >> 0x6f,0) & 1) << 0xd |
                       (ushort)(SUB161(auVar26 >> 0x77,0) & 1) << 0xe |
                      (ushort)(auVar26[0xf] >> 7) << 0xf) == 0xffff) {
            uVar13 = *(ulong *)(lVar14 + uVar18 * -0x18 + -8);
            if (((*(ulong *)(param_3 + 0x218) <= uVar13) ||
                (uVar13 = *(ulong *)(*(long *)(param_3 + 0x210) + uVar13 * 8), uVar13 == 0)) ||
               (*(char *)(*(long *)(param_3 + 0x1e0) + 0x30 + ~uVar13 * 0x38) == '\0'))
            goto LAB_1402137ea;
            goto LAB_140213511;
          }
          uVar17 = (ushort)(uVar16 - 1) & (ushort)uVar16;
          uVar16 = CONCAT22((short)(uVar16 - 1 >> 0x10),uVar17);
        }
        auVar21[0] = -(*pcVar3 == -1);
        auVar21[1] = -(pcVar3[1] == -1);
        auVar21[2] = -(pcVar3[2] == -1);
        auVar21[3] = -(pcVar3[3] == -1);
        auVar21[4] = -(pcVar3[4] == -1);
        auVar21[5] = -(pcVar3[5] == -1);
        auVar21[6] = -(pcVar3[6] == -1);
        auVar21[7] = -(pcVar3[7] == -1);
        auVar21[8] = -(pcVar3[8] == -1);
        auVar21[9] = -(pcVar3[9] == -1);
        auVar21[10] = -(pcVar3[10] == -1);
        auVar21[0xb] = -(pcVar3[0xb] == -1);
        auVar21[0xc] = -(pcVar3[0xc] == -1);
        auVar21[0xd] = -(pcVar3[0xd] == -1);
        auVar21[0xe] = -(pcVar3[0xe] == -1);
        auVar21[0xf] = -(pcVar3[0xf] == -1);
        if ((((((((((((((((SUB161(auVar21 >> 7,0) & 1) != 0 || (SUB161(auVar21 >> 0xf,0) & 1) != 0)
                        || (SUB161(auVar21 >> 0x17,0) & 1) != 0) ||
                       (SUB161(auVar21 >> 0x1f,0) & 1) != 0) || (SUB161(auVar21 >> 0x27,0) & 1) != 0
                      ) || (SUB161(auVar21 >> 0x2f,0) & 1) != 0) ||
                    (SUB161(auVar21 >> 0x37,0) & 1) != 0) || (SUB161(auVar21 >> 0x3f,0) & 1) != 0)
                  || (SUB161(auVar21 >> 0x47,0) & 1) != 0) || (SUB161(auVar21 >> 0x4f,0) & 1) != 0)
                || (SUB161(auVar21 >> 0x57,0) & 1) != 0) || (SUB161(auVar21 >> 0x5f,0) & 1) != 0) ||
              (SUB161(auVar21 >> 0x67,0) & 1) != 0) || (SUB161(auVar21 >> 0x6f,0) & 1) != 0) ||
            (SUB161(auVar21 >> 0x77,0) & 1) != 0) || auVar21[0xf] < '\0') break;
        uVar13 = uVar13 + lVar15 + 0x10;
        lVar15 = lVar15 + 0x10;
      }
    }
  }
  else {
    func_0x000140153b80();
    cVar11 = func_0x000140664980();
    if (*(long *)(param_3 + 0x90) != 0) {
      lVar14 = *(long *)(param_3 + 0x78);
      uVar13 = 0x63f1b974fb8f7c39;
      lVar15 = 0;
      do {
        uVar13 = uVar13 & *(ulong *)(param_3 + 0x80);
        auVar25 = *(undefined1 (*) [16])(lVar14 + uVar13);
        auVar23[0] = -(auVar25[0] == DAT_14624cd10);
        auVar23[1] = -(auVar25[1] == DAT_14624cd10._1_1_);
        auVar23[2] = -(auVar25[2] == DAT_14624cd10._2_1_);
        auVar23[3] = -(auVar25[3] == DAT_14624cd10._3_1_);
        auVar23[4] = -(auVar25[4] == DAT_14624cd10._4_1_);
        auVar23[5] = -(auVar25[5] == DAT_14624cd10._5_1_);
        auVar23[6] = -(auVar25[6] == DAT_14624cd10._6_1_);
        auVar23[7] = -(auVar25[7] == DAT_14624cd10._7_1_);
        auVar23[8] = -(auVar25[8] == DAT_14624cd10._8_1_);
        auVar23[9] = -(auVar25[9] == DAT_14624cd10._9_1_);
        auVar23[10] = -(auVar25[10] == DAT_14624cd10._10_1_);
        auVar23[0xb] = -(auVar25[0xb] == DAT_14624cd10._11_1_);
        auVar23[0xc] = -(auVar25[0xc] == DAT_14624cd10._12_1_);
        auVar23[0xd] = -(auVar25[0xd] == DAT_14624cd10._13_1_);
        auVar23[0xe] = -(auVar25[0xe] == DAT_14624cd10._14_1_);
        auVar23[0xf] = -(auVar25[0xf] == DAT_14624cd10._15_1_);
        uVar17 = (ushort)(SUB161(auVar23 >> 7,0) & 1) | (ushort)(SUB161(auVar23 >> 0xf,0) & 1) << 1
                 | (ushort)(SUB161(auVar23 >> 0x17,0) & 1) << 2 |
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
                 (ushort)(SUB161(auVar23 >> 0x77,0) & 1) << 0xe | (ushort)(auVar23[0xf] >> 7) << 0xf
        ;
        uVar16 = (uint)uVar17;
        if (uVar17 != 0) {
          while( true ) {
            uVar9 = 0;
            for (uVar10 = uVar16; (uVar10 & 1) == 0; uVar10 = uVar10 >> 1 | 0x80000000) {
              uVar9 = uVar9 + 1;
            }
            uVar18 = uVar9 + uVar13 & *(ulong *)(param_3 + 0x80);
            pcVar3 = (char *)(lVar14 + -0x18 + uVar18 * -0x18);
            auVar24[0] = -(*pcVar3 == DAT_14625ffb0);
            auVar24[1] = -(pcVar3[1] == cRam000000014625ffb1);
            auVar24[2] = -(pcVar3[2] == cRam000000014625ffb2);
            auVar24[3] = -(pcVar3[3] == cRam000000014625ffb3);
            auVar24[4] = -(pcVar3[4] == cRam000000014625ffb4);
            auVar24[5] = -(pcVar3[5] == cRam000000014625ffb5);
            auVar24[6] = -(pcVar3[6] == cRam000000014625ffb6);
            auVar24[7] = -(pcVar3[7] == cRam000000014625ffb7);
            auVar24[8] = -(pcVar3[8] == cRam000000014625ffb8);
            auVar24[9] = -(pcVar3[9] == cRam000000014625ffb9);
            auVar24[10] = -(pcVar3[10] == cRam000000014625ffba);
            auVar24[0xb] = -(pcVar3[0xb] == cRam000000014625ffbb);
            auVar24[0xc] = -(pcVar3[0xc] == cRam000000014625ffbc);
            auVar24[0xd] = -(pcVar3[0xd] == cRam000000014625ffbd);
            auVar24[0xe] = -(pcVar3[0xe] == cRam000000014625ffbe);
            auVar24[0xf] = -(pcVar3[0xf] == cRam000000014625ffbf);
            if ((ushort)((ushort)(SUB161(auVar24 >> 7,0) & 1) |
                         (ushort)(SUB161(auVar24 >> 0xf,0) & 1) << 1 |
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
                         (ushort)(SUB161(auVar24 >> 0x77,0) & 1) << 0xe |
                        (ushort)(auVar24[0xf] >> 7) << 0xf) == 0xffff) break;
            uVar17 = (ushort)(uVar16 - 1) & (ushort)uVar16;
            uVar16 = CONCAT22((short)(uVar16 - 1 >> 0x10),uVar17);
            if (uVar17 == 0) goto LAB_1402133b9;
          }
          uVar13 = *(ulong *)(lVar14 + uVar18 * -0x18 + -8);
          if ((*(ulong *)(param_3 + 0x218) <= uVar13) ||
             (uVar13 = *(ulong *)(*(long *)(param_3 + 0x210) + uVar13 * 8), uVar13 == 0)) break;
          lVar14 = *(long *)(param_3 + 0x1e0);
          lVar15 = ~uVar13 * 0x38;
          if (*(char *)(lVar14 + 0x30 + lVar15) == '\0') break;
          uVar6 = *(undefined4 *)(param_3 + 0x5b0);
          if (cVar11 == '\0') {
LAB_140213511:
            local_98 = 2;
            local_a0 = 0;
            local_90 = 0;
            lVar14 = *(long *)(param_3 + 0x90);
          }
          else {
            func_0x0001400ffcd0();
            if (local_90 != 0) {
              lVar1 = local_90 * 4;
              lVar19 = local_98;
              do {
                *(undefined4 *)(lVar14 + lVar15 + 0x2c) = uVar6;
                func_0x000140243f80();
                lVar19 = lVar19 + 4;
              } while (lVar19 != local_98 + lVar1);
            }
            lVar14 = *(long *)(param_3 + 0x90);
          }
          if (lVar14 != 0) {
            lVar14 = *(long *)(param_3 + 0x78);
            uVar13 = 0xf0d24689c64c4dc3;
            lVar15 = 0;
            while( true ) {
              uVar13 = uVar13 & *(ulong *)(param_3 + 0x80);
              auVar25 = *(undefined1 (*) [16])(lVar14 + uVar13);
              auVar27[0] = -(auVar25[0] == DAT_146232870);
              auVar27[1] = -(auVar25[1] == DAT_146232870._1_1_);
              auVar27[2] = -(auVar25[2] == DAT_146232870._2_1_);
              auVar27[3] = -(auVar25[3] == DAT_146232870._3_1_);
              auVar27[4] = -(auVar25[4] == DAT_146232870._4_1_);
              auVar27[5] = -(auVar25[5] == DAT_146232870._5_1_);
              auVar27[6] = -(auVar25[6] == DAT_146232870._6_1_);
              auVar27[7] = -(auVar25[7] == DAT_146232870._7_1_);
              auVar27[8] = -(auVar25[8] == DAT_146232870._8_1_);
              auVar27[9] = -(auVar25[9] == DAT_146232870._9_1_);
              auVar27[10] = -(auVar25[10] == DAT_146232870._10_1_);
              auVar27[0xb] = -(auVar25[0xb] == DAT_146232870._11_1_);
              auVar27[0xc] = -(auVar25[0xc] == DAT_146232870._12_1_);
              auVar27[0xd] = -(auVar25[0xd] == DAT_146232870._13_1_);
              auVar27[0xe] = -(auVar25[0xe] == DAT_146232870._14_1_);
              auVar27[0xf] = -(auVar25[0xf] == DAT_146232870._15_1_);
              uVar17 = (ushort)(SUB161(auVar27 >> 7,0) & 1) |
                       (ushort)(SUB161(auVar27 >> 0xf,0) & 1) << 1 |
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
                       (ushort)(SUB161(auVar27 >> 0x77,0) & 1) << 0xe |
                       (ushort)(auVar27[0xf] >> 7) << 0xf;
              uVar16 = (uint)uVar17;
              while (uVar17 != 0) {
                uVar9 = 0;
                for (uVar10 = uVar16; (uVar10 & 1) == 0; uVar10 = uVar10 >> 1 | 0x80000000) {
                  uVar9 = uVar9 + 1;
                }
                uVar18 = uVar9 + uVar13 & *(ulong *)(param_3 + 0x80);
                pcVar3 = (char *)(lVar14 + -0x18 + uVar18 * -0x18);
                auVar28[0] = -(*pcVar3 == DAT_14625feb0);
                auVar28[1] = -(pcVar3[1] == DAT_14625feb0._1_1_);
                auVar28[2] = -(pcVar3[2] == DAT_14625feb0._2_1_);
                auVar28[3] = -(pcVar3[3] == DAT_14625feb0._3_1_);
                auVar28[4] = -(pcVar3[4] == DAT_14625feb0._4_1_);
                auVar28[5] = -(pcVar3[5] == DAT_14625feb0._5_1_);
                auVar28[6] = -(pcVar3[6] == DAT_14625feb0._6_1_);
                auVar28[7] = -(pcVar3[7] == DAT_14625feb0._7_1_);
                auVar28[8] = -(pcVar3[8] == DAT_14625feb0._8_1_);
                auVar28[9] = -(pcVar3[9] == DAT_14625feb0._9_1_);
                auVar28[10] = -(pcVar3[10] == DAT_14625feb0._10_1_);
                auVar28[0xb] = -(pcVar3[0xb] == DAT_14625feb0._11_1_);
                auVar28[0xc] = -(pcVar3[0xc] == DAT_14625feb0._12_1_);
                auVar28[0xd] = -(pcVar3[0xd] == DAT_14625feb0._13_1_);
                auVar28[0xe] = -(pcVar3[0xe] == DAT_14625feb0._14_1_);
                auVar28[0xf] = -(pcVar3[0xf] == DAT_14625feb0._15_1_);
                if ((ushort)((ushort)(SUB161(auVar28 >> 7,0) & 1) |
                             (ushort)(SUB161(auVar28 >> 0xf,0) & 1) << 1 |
                             (ushort)(SUB161(auVar28 >> 0x17,0) & 1) << 2 |
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
                             (ushort)(SUB161(auVar28 >> 0x77,0) & 1) << 0xe |
                            (ushort)(auVar28[0xf] >> 7) << 0xf) == 0xffff) {
                  uVar13 = *(ulong *)(lVar14 + uVar18 * -0x18 + -8);
                  if ((uVar13 < *(ulong *)(param_3 + 0x218)) &&
                     (uVar13 = *(ulong *)(*(long *)(param_3 + 0x210) + uVar13 * 8), uVar13 != 0)) {
                    lVar14 = ~uVar13 * 0x38;
                    if (*(char *)(*(long *)(param_3 + 0x1e0) + 0x30 + lVar14) != '\0') {
                      lVar14 = *(long *)(param_3 + 0x1e0) + lVar14;
                      plVar7 = *(long **)(lVar14 + 0x10);
                      *(undefined4 *)(lVar14 + 0x2c) = *(undefined4 *)(param_3 + 0x5b0);
                      if (*plVar7 != 0) {
                        func_0x0001400021d0();
                      }
                      *plVar7 = local_a0;
                      plVar7[1] = local_98;
                      plVar7[2] = local_90;
                      return;
                    }
                  }
                  goto LAB_1402137ac;
                }
                uVar17 = (ushort)(uVar16 - 1) & (ushort)uVar16;
                uVar16 = CONCAT22((short)(uVar16 - 1 >> 0x10),uVar17);
              }
              auVar22[0] = -(auVar25[0] == -1);
              auVar22[1] = -(auVar25[1] == -1);
              auVar22[2] = -(auVar25[2] == -1);
              auVar22[3] = -(auVar25[3] == -1);
              auVar22[4] = -(auVar25[4] == -1);
              auVar22[5] = -(auVar25[5] == -1);
              auVar22[6] = -(auVar25[6] == -1);
              auVar22[7] = -(auVar25[7] == -1);
              auVar22[8] = -(auVar25[8] == -1);
              auVar22[9] = -(auVar25[9] == -1);
              auVar22[10] = -(auVar25[10] == -1);
              auVar22[0xb] = -(auVar25[0xb] == -1);
              auVar22[0xc] = -(auVar25[0xc] == -1);
              auVar22[0xd] = -(auVar25[0xd] == -1);
              auVar22[0xe] = -(auVar25[0xe] == -1);
              auVar22[0xf] = -(auVar25[0xf] == -1);
              if ((((((((((((((((SUB161(auVar22 >> 7,0) & 1) != 0 ||
                               (SUB161(auVar22 >> 0xf,0) & 1) != 0) ||
                              (SUB161(auVar22 >> 0x17,0) & 1) != 0) ||
                             (SUB161(auVar22 >> 0x1f,0) & 1) != 0) ||
                            (SUB161(auVar22 >> 0x27,0) & 1) != 0) ||
                           (SUB161(auVar22 >> 0x2f,0) & 1) != 0) ||
                          (SUB161(auVar22 >> 0x37,0) & 1) != 0) ||
                         (SUB161(auVar22 >> 0x3f,0) & 1) != 0) ||
                        (SUB161(auVar22 >> 0x47,0) & 1) != 0) ||
                       (SUB161(auVar22 >> 0x4f,0) & 1) != 0) || (SUB161(auVar22 >> 0x57,0) & 1) != 0
                      ) || (SUB161(auVar22 >> 0x5f,0) & 1) != 0) ||
                    (SUB161(auVar22 >> 0x67,0) & 1) != 0) || (SUB161(auVar22 >> 0x6f,0) & 1) != 0)
                  || (SUB161(auVar22 >> 0x77,0) & 1) != 0) || auVar22[0xf] < '\0') break;
              uVar13 = uVar13 + lVar15 + 0x10;
              lVar15 = lVar15 + 0x10;
            }
          }
LAB_1402137ac:
          func_0x000146208ee0();
          goto LAB_140213826;
        }
LAB_1402133b9:
        auVar20[0] = -(auVar25[0] == -1);
        auVar20[1] = -(auVar25[1] == -1);
        auVar20[2] = -(auVar25[2] == -1);
        auVar20[3] = -(auVar25[3] == -1);
        auVar20[4] = -(auVar25[4] == -1);
        auVar20[5] = -(auVar25[5] == -1);
        auVar20[6] = -(auVar25[6] == -1);
        auVar20[7] = -(auVar25[7] == -1);
        auVar20[8] = -(auVar25[8] == -1);
        auVar20[9] = -(auVar25[9] == -1);
        auVar20[10] = -(auVar25[10] == -1);
        auVar20[0xb] = -(auVar25[0xb] == -1);
        auVar20[0xc] = -(auVar25[0xc] == -1);
        auVar20[0xd] = -(auVar25[0xd] == -1);
        auVar20[0xe] = -(auVar25[0xe] == -1);
        auVar20[0xf] = -(auVar25[0xf] == -1);
        if ((((((((((((((((SUB161(auVar20 >> 7,0) & 1) != 0 || (SUB161(auVar20 >> 0xf,0) & 1) != 0)
                        || (SUB161(auVar20 >> 0x17,0) & 1) != 0) ||
                       (SUB161(auVar20 >> 0x1f,0) & 1) != 0) || (SUB161(auVar20 >> 0x27,0) & 1) != 0
                      ) || (SUB161(auVar20 >> 0x2f,0) & 1) != 0) ||
                    (SUB161(auVar20 >> 0x37,0) & 1) != 0) || (SUB161(auVar20 >> 0x3f,0) & 1) != 0)
                  || (SUB161(auVar20 >> 0x47,0) & 1) != 0) || (SUB161(auVar20 >> 0x4f,0) & 1) != 0)
                || (SUB161(auVar20 >> 0x57,0) & 1) != 0) || (SUB161(auVar20 >> 0x5f,0) & 1) != 0) ||
              (SUB161(auVar20 >> 0x67,0) & 1) != 0) || (SUB161(auVar20 >> 0x6f,0) & 1) != 0) ||
            (SUB161(auVar20 >> 0x77,0) & 1) != 0) || auVar20[0xf] < '\0') break;
        uVar13 = uVar13 + lVar15 + 0x10;
        lVar15 = lVar15 + 0x10;
      } while( true );
    }
  }
LAB_1402137ea:
  func_0x000146208ee0();
                    /* WARNING: Does not return */
  pcVar8 = (code *)invalidInstructionException();
  (*pcVar8)();
}

