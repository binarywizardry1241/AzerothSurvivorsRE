
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long param_3,undefined8 param_4,char *param_5)

{
  char *pcVar1;
  char *pcVar2;
  char cVar3;
  ulong uVar4;
  byte *pbVar5;
  code *pcVar6;
  uint uVar7;
  uint uVar8;
  long lVar9;
  ulong uVar10;
  uint uVar11;
  long lVar12;
  uint uVar13;
  ushort uVar14;
  ulong uVar15;
  long lVar16;
  bool bVar17;
  bool bVar18;
  bool bVar19;
  bool bVar20;
  bool bVar21;
  undefined1 auVar22 [16];
  undefined1 auVar23 [16];
  undefined1 auVar24 [16];
  undefined1 auVar25 [16];
  undefined1 auVar26 [16];
  undefined1 auVar27 [16];
  long local_78;
  bool local_58;
  bool local_50;

  cVar3 = *param_5;
  *param_5 = '\x01';
  if (cVar3 != '\x01') {
    func_0x00014064b4e0(0x145966378,param_3,0x145966335,param_3,8,0x145966378);
    func_0x00014064b4e0();
    func_0x00014064b4e0();
    func_0x00014064b4e0();
    func_0x00014064b4e0();
    func_0x00014064b4e0();
    func_0x00014064b4e0();
    func_0x00014064b4e0();
  }
  func_0x00014064e700();
  bVar18 = true;
  bVar17 = true;
  if (local_78 != -1) {
    auVar27 = func_0x0001400a4890();
    if (auVar27._8_8_ == 1) {
      bVar17 = *auVar27._0_8_ != '0';
    }
    if (local_78 != 0) {
      func_0x0001400021d0();
    }
  }
  func_0x00014064e700();
  if (local_78 != -1) {
    auVar27 = func_0x0001400a4890();
    if (auVar27._8_8_ == 1) {
      bVar18 = *auVar27._0_8_ != '0';
    }
    if (local_78 != 0) {
      func_0x0001400021d0();
    }
  }
  func_0x00014064e700();
  uVar11 = 1;
  bVar19 = true;
  if (local_78 != -1) {
    uVar11 = 1;
    auVar27 = func_0x0001400a4890();
    if (auVar27._8_8_ == 1) {
      bVar19 = *auVar27._0_8_ != '0';
    }
    if (local_78 != 0) {
      func_0x0001400021d0();
    }
  }
  func_0x00014064e700();
  if (local_78 != -1) {
    auVar27 = func_0x0001400a4890();
    if (auVar27._8_8_ == 1) {
      uVar11 = (uint)(*auVar27._0_8_ != '0');
    }
    if (local_78 != 0) {
      func_0x0001400021d0();
    }
  }
  func_0x00014064e700();
  bVar21 = true;
  bVar20 = true;
  if (local_78 != -1) {
    auVar27 = func_0x0001400a4890();
    if (auVar27._8_8_ == 1) {
      bVar20 = *auVar27._0_8_ != '0';
    }
    if (local_78 != 0) {
      func_0x0001400021d0();
    }
  }
  func_0x00014064e700();
  if (local_78 != -1) {
    auVar27 = func_0x0001400a4890();
    if (auVar27._8_8_ == 1) {
      bVar21 = *auVar27._0_8_ != '0';
    }
    if (local_78 != 0) {
      func_0x0001400021d0();
    }
  }
  func_0x00014064e700();
  local_58 = true;
  local_50 = true;
  if (local_78 != -1) {
    auVar27 = func_0x0001400a4890();
    local_50 = true;
    if (auVar27._8_8_ == 1) {
      local_50 = *auVar27._0_8_ != '0';
    }
    if (local_78 != 0) {
      func_0x0001400021d0();
    }
  }
  func_0x00014064e700();
  if (local_78 != -1) {
    auVar27 = func_0x0001400a4890();
    local_58 = true;
    if (auVar27._8_8_ == 1) {
      local_58 = *auVar27._0_8_ != '0';
    }
    if (local_78 != 0) {
      func_0x0001400021d0();
    }
  }
  if (*(long *)(param_3 + 0x90) != 0) {
    lVar9 = *(long *)(param_3 + 0x78);
    uVar4 = *(ulong *)(param_3 + 0x80);
    uVar10 = 0x19efe694c123e2fa;
    lVar12 = 0;
    while( true ) {
      uVar10 = uVar10 & uVar4;
      pcVar1 = (char *)(lVar9 + uVar10);
      auVar27[0] = -(*pcVar1 == DAT_145948010);
      auVar27[1] = -(pcVar1[1] == DAT_145948010._1_1_);
      auVar27[2] = -(pcVar1[2] == DAT_145948010._2_1_);
      auVar27[3] = -(pcVar1[3] == DAT_145948010._3_1_);
      auVar27[4] = -(pcVar1[4] == DAT_145948010._4_1_);
      auVar27[5] = -(pcVar1[5] == DAT_145948010._5_1_);
      auVar27[6] = -(pcVar1[6] == DAT_145948010._6_1_);
      auVar27[7] = -(pcVar1[7] == DAT_145948010._7_1_);
      auVar27[8] = -(pcVar1[8] == DAT_145948010._8_1_);
      auVar27[9] = -(pcVar1[9] == DAT_145948010._9_1_);
      auVar27[10] = -(pcVar1[10] == DAT_145948010._10_1_);
      auVar27[0xb] = -(pcVar1[0xb] == DAT_145948010._11_1_);
      auVar27[0xc] = -(pcVar1[0xc] == DAT_145948010._12_1_);
      auVar27[0xd] = -(pcVar1[0xd] == DAT_145948010._13_1_);
      auVar27[0xe] = -(pcVar1[0xe] == DAT_145948010._14_1_);
      auVar27[0xf] = -(pcVar1[0xf] == DAT_145948010._15_1_);
      uVar14 = (ushort)(SUB161(auVar27 >> 7,0) & 1) | (ushort)(SUB161(auVar27 >> 0xf,0) & 1) << 1 |
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
      uVar13 = (uint)uVar14;
      while (uVar14 != 0) {
        uVar7 = 0;
        for (uVar8 = uVar13; (uVar8 & 1) == 0; uVar8 = uVar8 >> 1 | 0x80000000) {
          uVar7 = uVar7 + 1;
        }
        uVar15 = uVar7 + uVar10 & uVar4;
        pcVar2 = (char *)(lVar9 + -0x18 + uVar15 * -0x18);
        auVar24[0] = -(*pcVar2 == DAT_145948020);
        auVar24[1] = -(pcVar2[1] == DAT_145948020._1_1_);
        auVar24[2] = -(pcVar2[2] == DAT_145948020._2_1_);
        auVar24[3] = -(pcVar2[3] == DAT_145948020._3_1_);
        auVar24[4] = -(pcVar2[4] == DAT_145948020._4_1_);
        auVar24[5] = -(pcVar2[5] == DAT_145948020._5_1_);
        auVar24[6] = -(pcVar2[6] == DAT_145948020._6_1_);
        auVar24[7] = -(pcVar2[7] == DAT_145948020._7_1_);
        auVar24[8] = -(pcVar2[8] == DAT_145948020._8_1_);
        auVar24[9] = -(pcVar2[9] == DAT_145948020._9_1_);
        auVar24[10] = -(pcVar2[10] == DAT_145948020._10_1_);
        auVar24[0xb] = -(pcVar2[0xb] == DAT_145948020._11_1_);
        auVar24[0xc] = -(pcVar2[0xc] == DAT_145948020._12_1_);
        auVar24[0xd] = -(pcVar2[0xd] == DAT_145948020._13_1_);
        auVar24[0xe] = -(pcVar2[0xe] == DAT_145948020._14_1_);
        auVar24[0xf] = -(pcVar2[0xf] == DAT_145948020._15_1_);
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
                    (ushort)(auVar24[0xf] >> 7) << 0xf) == 0xffff) {
          uVar10 = *(ulong *)(lVar9 + uVar15 * -0x18 + -8);
          if (*(ulong *)(param_3 + 0x218) <= uVar10) goto LAB_140363fe0;
          uVar10 = *(ulong *)(*(long *)(param_3 + 0x210) + uVar10 * 8);
          if (uVar10 == 0) goto LAB_140363fe0;
          lVar12 = *(long *)(param_3 + 0x1e0);
          lVar16 = ~uVar10 * 0x38;
          if (*(char *)(lVar12 + 0x30 + lVar16) == '\0') goto LAB_140363fe0;
          pbVar5 = *(byte **)(lVar16 + lVar12 + 0x10);
          if (((((bool)*pbVar5 == bVar17) && ((bool)pbVar5[1] == bVar18)) &&
              ((bool)pbVar5[2] == bVar19)) &&
             (((pbVar5[3] == (byte)uVar11 && ((bool)pbVar5[4] == bVar20)) &&
              (((bool)pbVar5[5] == bVar21 &&
               (((bool)pbVar5[6] == local_50 && ((bool)pbVar5[7] == local_58)))))))) {
            return;
          }
          uVar10 = 0x19efe694c123e2fa;
          lVar16 = 0;
          goto LAB_140363ec7;
        }
        uVar14 = (ushort)(uVar13 - 1) & (ushort)uVar13;
        uVar13 = CONCAT22((short)(uVar13 - 1 >> 0x10),uVar14);
      }
      auVar22[0] = -(*pcVar1 == -1);
      auVar22[1] = -(pcVar1[1] == -1);
      auVar22[2] = -(pcVar1[2] == -1);
      auVar22[3] = -(pcVar1[3] == -1);
      auVar22[4] = -(pcVar1[4] == -1);
      auVar22[5] = -(pcVar1[5] == -1);
      auVar22[6] = -(pcVar1[6] == -1);
      auVar22[7] = -(pcVar1[7] == -1);
      auVar22[8] = -(pcVar1[8] == -1);
      auVar22[9] = -(pcVar1[9] == -1);
      auVar22[10] = -(pcVar1[10] == -1);
      auVar22[0xb] = -(pcVar1[0xb] == -1);
      auVar22[0xc] = -(pcVar1[0xc] == -1);
      auVar22[0xd] = -(pcVar1[0xd] == -1);
      auVar22[0xe] = -(pcVar1[0xe] == -1);
      auVar22[0xf] = -(pcVar1[0xf] == -1);
      if ((((((((((((((((SUB161(auVar22 >> 7,0) & 1) != 0 || (SUB161(auVar22 >> 0xf,0) & 1) != 0) ||
                      (SUB161(auVar22 >> 0x17,0) & 1) != 0) || (SUB161(auVar22 >> 0x1f,0) & 1) != 0)
                    || (SUB161(auVar22 >> 0x27,0) & 1) != 0) || (SUB161(auVar22 >> 0x2f,0) & 1) != 0
                   ) || (SUB161(auVar22 >> 0x37,0) & 1) != 0) ||
                 (SUB161(auVar22 >> 0x3f,0) & 1) != 0) || (SUB161(auVar22 >> 0x47,0) & 1) != 0) ||
               (SUB161(auVar22 >> 0x4f,0) & 1) != 0) || (SUB161(auVar22 >> 0x57,0) & 1) != 0) ||
             (SUB161(auVar22 >> 0x5f,0) & 1) != 0) || (SUB161(auVar22 >> 0x67,0) & 1) != 0) ||
           (SUB161(auVar22 >> 0x6f,0) & 1) != 0) || (SUB161(auVar22 >> 0x77,0) & 1) != 0) ||
          auVar22[0xf] < '\0') break;
      uVar10 = uVar10 + lVar12 + 0x10;
      lVar12 = lVar12 + 0x10;
    }
  }
LAB_140363fe0:
  func_0x000145903d10();
                    /* WARNING: Does not return */
  pcVar6 = (code *)invalidInstructionException();
  (*pcVar6)();
LAB_140363ec7:
  uVar10 = uVar10 & uVar4;
  pcVar1 = (char *)(lVar9 + uVar10);
  auVar25[0] = -(*pcVar1 == DAT_145948010);
  auVar25[1] = -(pcVar1[1] == DAT_145948010._1_1_);
  auVar25[2] = -(pcVar1[2] == DAT_145948010._2_1_);
  auVar25[3] = -(pcVar1[3] == DAT_145948010._3_1_);
  auVar25[4] = -(pcVar1[4] == DAT_145948010._4_1_);
  auVar25[5] = -(pcVar1[5] == DAT_145948010._5_1_);
  auVar25[6] = -(pcVar1[6] == DAT_145948010._6_1_);
  auVar25[7] = -(pcVar1[7] == DAT_145948010._7_1_);
  auVar25[8] = -(pcVar1[8] == DAT_145948010._8_1_);
  auVar25[9] = -(pcVar1[9] == DAT_145948010._9_1_);
  auVar25[10] = -(pcVar1[10] == DAT_145948010._10_1_);
  auVar25[0xb] = -(pcVar1[0xb] == DAT_145948010._11_1_);
  auVar25[0xc] = -(pcVar1[0xc] == DAT_145948010._12_1_);
  auVar25[0xd] = -(pcVar1[0xd] == DAT_145948010._13_1_);
  auVar25[0xe] = -(pcVar1[0xe] == DAT_145948010._14_1_);
  auVar25[0xf] = -(pcVar1[0xf] == DAT_145948010._15_1_);
  uVar14 = (ushort)(SUB161(auVar25 >> 7,0) & 1) | (ushort)(SUB161(auVar25 >> 0xf,0) & 1) << 1 |
           (ushort)(SUB161(auVar25 >> 0x17,0) & 1) << 2 |
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
           (ushort)(SUB161(auVar25 >> 0x77,0) & 1) << 0xe | (ushort)(auVar25[0xf] >> 7) << 0xf;
  uVar13 = (uint)uVar14;
  while (uVar14 != 0) {
    uVar7 = 0;
    for (uVar8 = uVar13; (uVar8 & 1) == 0; uVar8 = uVar8 >> 1 | 0x80000000) {
      uVar7 = uVar7 + 1;
    }
    uVar15 = uVar7 + uVar10 & uVar4;
    pcVar2 = (char *)(lVar9 + -0x18 + uVar15 * -0x18);
    auVar26[0] = -(*pcVar2 == DAT_145948020);
    auVar26[1] = -(pcVar2[1] == DAT_145948020._1_1_);
    auVar26[2] = -(pcVar2[2] == DAT_145948020._2_1_);
    auVar26[3] = -(pcVar2[3] == DAT_145948020._3_1_);
    auVar26[4] = -(pcVar2[4] == DAT_145948020._4_1_);
    auVar26[5] = -(pcVar2[5] == DAT_145948020._5_1_);
    auVar26[6] = -(pcVar2[6] == DAT_145948020._6_1_);
    auVar26[7] = -(pcVar2[7] == DAT_145948020._7_1_);
    auVar26[8] = -(pcVar2[8] == DAT_145948020._8_1_);
    auVar26[9] = -(pcVar2[9] == DAT_145948020._9_1_);
    auVar26[10] = -(pcVar2[10] == DAT_145948020._10_1_);
    auVar26[0xb] = -(pcVar2[0xb] == DAT_145948020._11_1_);
    auVar26[0xc] = -(pcVar2[0xc] == DAT_145948020._12_1_);
    auVar26[0xd] = -(pcVar2[0xd] == DAT_145948020._13_1_);
    auVar26[0xe] = -(pcVar2[0xe] == DAT_145948020._14_1_);
    auVar26[0xf] = -(pcVar2[0xf] == DAT_145948020._15_1_);
    if ((ushort)((ushort)(SUB161(auVar26 >> 7,0) & 1) | (ushort)(SUB161(auVar26 >> 0xf,0) & 1) << 1
                 | (ushort)(SUB161(auVar26 >> 0x17,0) & 1) << 2 |
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
                 (ushort)(SUB161(auVar26 >> 0x77,0) & 1) << 0xe | (ushort)(auVar26[0xf] >> 7) << 0xf
                ) == 0xffff) {
      uVar4 = *(ulong *)(lVar9 + uVar15 * -0x18 + -8);
      if (((uVar4 < *(ulong *)(param_3 + 0x218)) &&
          (uVar4 = *(ulong *)(*(long *)(param_3 + 0x210) + uVar4 * 8), uVar4 != 0)) &&
         (lVar9 = ~uVar4 * 0x38, *(char *)(lVar12 + 0x30 + lVar9) != '\0')) {
        lVar12 = lVar12 + lVar9;
        *(undefined4 *)(lVar12 + 0x2c) = *(undefined4 *)(param_3 + 0x5b0);
        **(ulong **)(lVar12 + 0x10) =
             (ulong)bVar17 |
             (ulong)bVar18 << 8 |
             (ulong)bVar19 << 0x10 |
             (ulong)(uVar11 << 0x18) |
             (ulong)bVar20 << 0x20 |
             (ulong)bVar21 << 0x28 | (ulong)local_50 << 0x30 | (ulong)local_58 << 0x38;
        return;
      }
      goto LAB_14036400c;
    }
    uVar14 = (ushort)(uVar13 - 1) & (ushort)uVar13;
    uVar13 = CONCAT22((short)(uVar13 - 1 >> 0x10),uVar14);
  }
  auVar23[0] = -(*pcVar1 == -1);
  auVar23[1] = -(pcVar1[1] == -1);
  auVar23[2] = -(pcVar1[2] == -1);
  auVar23[3] = -(pcVar1[3] == -1);
  auVar23[4] = -(pcVar1[4] == -1);
  auVar23[5] = -(pcVar1[5] == -1);
  auVar23[6] = -(pcVar1[6] == -1);
  auVar23[7] = -(pcVar1[7] == -1);
  auVar23[8] = -(pcVar1[8] == -1);
  auVar23[9] = -(pcVar1[9] == -1);
  auVar23[10] = -(pcVar1[10] == -1);
  auVar23[0xb] = -(pcVar1[0xb] == -1);
  auVar23[0xc] = -(pcVar1[0xc] == -1);
  auVar23[0xd] = -(pcVar1[0xd] == -1);
  auVar23[0xe] = -(pcVar1[0xe] == -1);
  auVar23[0xf] = -(pcVar1[0xf] == -1);
  if ((((((((((((((((SUB161(auVar23 >> 7,0) & 1) != 0 || (SUB161(auVar23 >> 0xf,0) & 1) != 0) ||
                  (SUB161(auVar23 >> 0x17,0) & 1) != 0) || (SUB161(auVar23 >> 0x1f,0) & 1) != 0) ||
                (SUB161(auVar23 >> 0x27,0) & 1) != 0) || (SUB161(auVar23 >> 0x2f,0) & 1) != 0) ||
              (SUB161(auVar23 >> 0x37,0) & 1) != 0) || (SUB161(auVar23 >> 0x3f,0) & 1) != 0) ||
            (SUB161(auVar23 >> 0x47,0) & 1) != 0) || (SUB161(auVar23 >> 0x4f,0) & 1) != 0) ||
          (SUB161(auVar23 >> 0x57,0) & 1) != 0) || (SUB161(auVar23 >> 0x5f,0) & 1) != 0) ||
        (SUB161(auVar23 >> 0x67,0) & 1) != 0) || (SUB161(auVar23 >> 0x6f,0) & 1) != 0) ||
      (SUB161(auVar23 >> 0x77,0) & 1) != 0) || auVar23[0xf] < '\0') {
LAB_14036400c:
    func_0x000145903d10();
                    /* WARNING: Does not return */
    pcVar6 = (code *)invalidInstructionException();
    (*pcVar6)();
  }
  uVar10 = uVar10 + lVar16 + 0x10;
  lVar16 = lVar16 + 0x10;
  goto LAB_140363ec7;
}
