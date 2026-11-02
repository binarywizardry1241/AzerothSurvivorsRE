/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long param_3,undefined8 param_4,char *param_5,
          byte *param_6)

{
  char *pcVar1;
  char *pcVar2;
  byte bVar3;
  code *pcVar4;
  uint uVar5;
  uint uVar6;
  long lVar7;
  ulong uVar8;
  uint uVar9;
  long lVar10;
  ushort uVar11;
  ulong uVar12;
  ulong uVar13;
  long lVar14;
  bool bVar15;
  bool bVar16;
  char cVar17;
  bool bVar18;
  bool bVar19;
  char cVar20;
  bool bVar21;
  bool bVar22;
  undefined1 auVar23 [16];
  undefined1 auVar24 [16];
  undefined1 auVar25 [16];
  undefined1 auVar26 [16];
  undefined1 auVar27 [16];
  undefined1 auVar28 [16];
  undefined1 auVar29 [16];
  undefined1 auVar30 [16];
  undefined1 auVar31 [16];
  long local_168;
  bool local_50;

  cVar17 = *param_5;
  *param_5 = '\x01';
  if (cVar17 != '\x01') {
    func_0x00014063a3d0(param_6,param_3,0x145dcced5,param_3,8,0x145dccf1f);
    func_0x00014063a3d0();
    func_0x00014063a3d0();
    func_0x00014063a3d0();
    func_0x00014063a3d0();
    func_0x00014063a3d0();
    func_0x00014063a3d0();
    func_0x00014063a3d0();
    func_0x00014063a3d0();
  }
  func_0x00014063cd20();
  bVar16 = true;
  bVar15 = true;
  if (local_168 != -1) {
    auVar31 = func_0x00014006f550();
    if (auVar31._8_8_ == 1) {
      bVar15 = *auVar31._0_8_ != '0';
    }
    if (local_168 != 0) {
      func_0x0001400021d0();
    }
  }
  func_0x00014063cd20();
  if (local_168 != -1) {
    auVar31 = func_0x00014006f550();
    if (auVar31._8_8_ == 1) {
      bVar16 = *auVar31._0_8_ != '0';
    }
    if (local_168 != 0) {
      func_0x0001400021d0();
    }
  }
  func_0x00014063cd20();
  bVar18 = true;
  cVar17 = true;
  if (local_168 != -1) {
    auVar31 = func_0x00014006f550();
    if (auVar31._8_8_ == 1) {
      cVar17 = *auVar31._0_8_ != '0';
    }
    if (local_168 != 0) {
      func_0x0001400021d0();
    }
  }
  func_0x00014063cd20();
  if (local_168 != -1) {
    auVar31 = func_0x00014006f550();
    if (auVar31._8_8_ == 1) {
      bVar18 = *auVar31._0_8_ != '0';
    }
    if (local_168 != 0) {
      func_0x0001400021d0();
    }
  }
  func_0x00014063cd20();
  cVar20 = true;
  bVar19 = true;
  if (local_168 != -1) {
    auVar31 = func_0x00014006f550();
    bVar19 = true;
    if (auVar31._8_8_ == 1) {
      bVar19 = *auVar31._0_8_ != '0';
    }
    if (local_168 != 0) {
      func_0x0001400021d0();
    }
  }
  func_0x00014063cd20();
  if (local_168 != -1) {
    auVar31 = func_0x00014006f550();
    if (auVar31._8_8_ == 1) {
      cVar20 = *auVar31._0_8_ != '0';
    }
    if (local_168 != 0) {
      func_0x0001400021d0();
    }
  }
  func_0x00014063cd20();
  bVar21 = true;
  local_50 = true;
  if (local_168 != -1) {
    auVar31 = func_0x00014006f550();
    local_50 = true;
    if (auVar31._8_8_ == 1) {
      local_50 = *auVar31._0_8_ != '0';
    }
    if (local_168 != 0) {
      func_0x0001400021d0();
    }
  }
  func_0x00014063cd20();
  if (local_168 != -1) {
    auVar31 = func_0x00014006f550();
    bVar21 = true;
    if (auVar31._8_8_ == 1) {
      bVar21 = *auVar31._0_8_ != '0';
    }
    if (local_168 != 0) {
      func_0x0001400021d0();
    }
  }
  func_0x00014063cd20();
  if (local_168 == -1) {
    bVar22 = true;
    bVar3 = *param_6;
  }
  else {
    auVar31 = func_0x00014006f550();
    bVar22 = true;
    if (auVar31._8_8_ == 1) {
      bVar22 = *auVar31._0_8_ != '0';
    }
    if (local_168 != 0) {
      func_0x0001400021d0();
    }
    bVar3 = *param_6;
  }
  if ((bVar3 == 2) || (((bVar3 ^ bVar22) & 1) != 0)) {
    *param_6 = bVar22;
    if (*(long *)(param_3 + 0x90) != 0) {
      lVar7 = *(long *)(param_3 + 0x78);
      uVar8 = 0xe120481c1a6a0d50;
      lVar10 = 0;
      while( true ) {
        uVar8 = uVar8 & *(ulong *)(param_3 + 0x80);
        auVar31 = *(undefined1 (*) [16])(lVar7 + uVar8);
        auVar26[0] = -(auVar31[0] == DAT_145d6d970);
        auVar26[1] = -(auVar31[1] == DAT_145d6d970._1_1_);
        auVar26[2] = -(auVar31[2] == DAT_145d6d970._2_1_);
        auVar26[3] = -(auVar31[3] == DAT_145d6d970._3_1_);
        auVar26[4] = -(auVar31[4] == DAT_145d6d970._4_1_);
        auVar26[5] = -(auVar31[5] == DAT_145d6d970._5_1_);
        auVar26[6] = -(auVar31[6] == DAT_145d6d970._6_1_);
        auVar26[7] = -(auVar31[7] == DAT_145d6d970._7_1_);
        auVar26[8] = -(auVar31[8] == DAT_145d6d970._8_1_);
        auVar26[9] = -(auVar31[9] == DAT_145d6d970._9_1_);
        auVar26[10] = -(auVar31[10] == DAT_145d6d970._10_1_);
        auVar26[0xb] = -(auVar31[0xb] == DAT_145d6d970._11_1_);
        auVar26[0xc] = -(auVar31[0xc] == DAT_145d6d970._12_1_);
        auVar26[0xd] = -(auVar31[0xd] == DAT_145d6d970._13_1_);
        auVar26[0xe] = -(auVar31[0xe] == DAT_145d6d970._14_1_);
        auVar26[0xf] = -(auVar31[0xf] == DAT_145d6d970._15_1_);
        uVar11 = (ushort)(SUB161(auVar26 >> 7,0) & 1) | (ushort)(SUB161(auVar26 >> 0xf,0) & 1) << 1
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
        ;
        uVar9 = (uint)uVar11;
        while (uVar11 != 0) {
          uVar5 = 0;
          for (uVar6 = uVar9; (uVar6 & 1) == 0; uVar6 = uVar6 >> 1 | 0x80000000) {
            uVar5 = uVar5 + 1;
          }
          uVar12 = uVar5 + uVar8 & *(ulong *)(param_3 + 0x80);
          pcVar1 = (char *)(lVar7 + -0x18 + uVar12 * -0x18);
          auVar27[0] = -(*pcVar1 == DAT_145d6d980);
          auVar27[1] = -(pcVar1[1] == DAT_145d6d980._1_1_);
          auVar27[2] = -(pcVar1[2] == DAT_145d6d980._2_1_);
          auVar27[3] = -(pcVar1[3] == DAT_145d6d980._3_1_);
          auVar27[4] = -(pcVar1[4] == DAT_145d6d980._4_1_);
          auVar27[5] = -(pcVar1[5] == DAT_145d6d980._5_1_);
          auVar27[6] = -(pcVar1[6] == DAT_145d6d980._6_1_);
          auVar27[7] = -(pcVar1[7] == DAT_145d6d980._7_1_);
          auVar27[8] = -(pcVar1[8] == DAT_145d6d980._8_1_);
          auVar27[9] = -(pcVar1[9] == DAT_145d6d980._9_1_);
          auVar27[10] = -(pcVar1[10] == DAT_145d6d980._10_1_);
          auVar27[0xb] = -(pcVar1[0xb] == DAT_145d6d980._11_1_);
          auVar27[0xc] = -(pcVar1[0xc] == DAT_145d6d980._12_1_);
          auVar27[0xd] = -(pcVar1[0xd] == DAT_145d6d980._13_1_);
          auVar27[0xe] = -(pcVar1[0xe] == DAT_145d6d980._14_1_);
          auVar27[0xf] = -(pcVar1[0xf] == DAT_145d6d980._15_1_);
          if ((ushort)((ushort)(SUB161(auVar27 >> 7,0) & 1) |
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
                      (ushort)(auVar27[0xf] >> 7) << 0xf) == 0xffff) {
            uVar8 = *(ulong *)(lVar7 + uVar12 * -0x18 + -8);
            if (((*(ulong *)(param_3 + 0x218) <= uVar8) ||
                (uVar8 = *(ulong *)(*(long *)(param_3 + 0x210) + uVar8 * 8), uVar8 == 0)) ||
               (*(char *)(*(long *)(param_3 + 0x1e0) + 0x30 + ~uVar8 * 0x38) == '\0'))
            goto LAB_140370343;
            func_0x00014003eb80();
            goto LAB_140370049;
          }
          uVar11 = (ushort)(uVar9 - 1) & (ushort)uVar9;
          uVar9 = CONCAT22((short)(uVar9 - 1 >> 0x10),uVar11);
        }
        auVar23[0] = -(auVar31[0] == -1);
        auVar23[1] = -(auVar31[1] == -1);
        auVar23[2] = -(auVar31[2] == -1);
        auVar23[3] = -(auVar31[3] == -1);
        auVar23[4] = -(auVar31[4] == -1);
        auVar23[5] = -(auVar31[5] == -1);
        auVar23[6] = -(auVar31[6] == -1);
        auVar23[7] = -(auVar31[7] == -1);
        auVar23[8] = -(auVar31[8] == -1);
        auVar23[9] = -(auVar31[9] == -1);
        auVar23[10] = -(auVar31[10] == -1);
        auVar23[0xb] = -(auVar31[0xb] == -1);
        auVar23[0xc] = -(auVar31[0xc] == -1);
        auVar23[0xd] = -(auVar31[0xd] == -1);
        auVar23[0xe] = -(auVar31[0xe] == -1);
        auVar23[0xf] = -(auVar31[0xf] == -1);
        if ((((((((((((((((SUB161(auVar23 >> 7,0) & 1) != 0 || (SUB161(auVar23 >> 0xf,0) & 1) != 0)
                        || (SUB161(auVar23 >> 0x17,0) & 1) != 0) ||
                       (SUB161(auVar23 >> 0x1f,0) & 1) != 0) || (SUB161(auVar23 >> 0x27,0) & 1) != 0
                      ) || (SUB161(auVar23 >> 0x2f,0) & 1) != 0) ||
                    (SUB161(auVar23 >> 0x37,0) & 1) != 0) || (SUB161(auVar23 >> 0x3f,0) & 1) != 0)
                  || (SUB161(auVar23 >> 0x47,0) & 1) != 0) || (SUB161(auVar23 >> 0x4f,0) & 1) != 0)
                || (SUB161(auVar23 >> 0x57,0) & 1) != 0) || (SUB161(auVar23 >> 0x5f,0) & 1) != 0) ||
              (SUB161(auVar23 >> 0x67,0) & 1) != 0) || (SUB161(auVar23 >> 0x6f,0) & 1) != 0) ||
            (SUB161(auVar23 >> 0x77,0) & 1) != 0) || auVar23[0xf] < '\0') break;
        uVar8 = uVar8 + lVar10 + 0x10;
        lVar10 = lVar10 + 0x10;
      }
    }
LAB_140370343:
    func_0x000145d699c0();
                    /* WARNING: Does not return */
    pcVar4 = (code *)invalidInstructionException();
    (*pcVar4)();
  }
LAB_140370049:
  if (*(long *)(param_3 + 0x90) != 0) {
    lVar7 = *(long *)(param_3 + 0x78);
    uVar8 = *(ulong *)(param_3 + 0x80);
    uVar12 = 0xaf1deb95239f10da;
    lVar10 = 0;
    while( true ) {
      uVar12 = uVar12 & uVar8;
      pcVar1 = (char *)(lVar7 + uVar12);
      auVar31[0] = -(*pcVar1 == DAT_145d6d6d0);
      auVar31[1] = -(pcVar1[1] == DAT_145d6d6d0._1_1_);
      auVar31[2] = -(pcVar1[2] == DAT_145d6d6d0._2_1_);
      auVar31[3] = -(pcVar1[3] == DAT_145d6d6d0._3_1_);
      auVar31[4] = -(pcVar1[4] == DAT_145d6d6d0._4_1_);
      auVar31[5] = -(pcVar1[5] == DAT_145d6d6d0._5_1_);
      auVar31[6] = -(pcVar1[6] == DAT_145d6d6d0._6_1_);
      auVar31[7] = -(pcVar1[7] == DAT_145d6d6d0._7_1_);
      auVar31[8] = -(pcVar1[8] == DAT_145d6d6d0._8_1_);
      auVar31[9] = -(pcVar1[9] == DAT_145d6d6d0._9_1_);
      auVar31[10] = -(pcVar1[10] == DAT_145d6d6d0._10_1_);
      auVar31[0xb] = -(pcVar1[0xb] == DAT_145d6d6d0._11_1_);
      auVar31[0xc] = -(pcVar1[0xc] == DAT_145d6d6d0._12_1_);
      auVar31[0xd] = -(pcVar1[0xd] == DAT_145d6d6d0._13_1_);
      auVar31[0xe] = -(pcVar1[0xe] == DAT_145d6d6d0._14_1_);
      auVar31[0xf] = -(pcVar1[0xf] == DAT_145d6d6d0._15_1_);
      uVar11 = (ushort)(SUB161(auVar31 >> 7,0) & 1) | (ushort)(SUB161(auVar31 >> 0xf,0) & 1) << 1 |
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
      uVar9 = (uint)uVar11;
      while (uVar11 != 0) {
        uVar5 = 0;
        for (uVar6 = uVar9; (uVar6 & 1) == 0; uVar6 = uVar6 >> 1 | 0x80000000) {
          uVar5 = uVar5 + 1;
        }
        uVar13 = uVar5 + uVar12 & uVar8;
        pcVar2 = (char *)(lVar7 + -0x18 + uVar13 * -0x18);
        auVar28[0] = -(*pcVar2 == DAT_145d6da20);
        auVar28[1] = -(pcVar2[1] == DAT_145d6da20._1_1_);
        auVar28[2] = -(pcVar2[2] == DAT_145d6da20._2_1_);
        auVar28[3] = -(pcVar2[3] == DAT_145d6da20._3_1_);
        auVar28[4] = -(pcVar2[4] == DAT_145d6da20._4_1_);
        auVar28[5] = -(pcVar2[5] == DAT_145d6da20._5_1_);
        auVar28[6] = -(pcVar2[6] == DAT_145d6da20._6_1_);
        auVar28[7] = -(pcVar2[7] == DAT_145d6da20._7_1_);
        auVar28[8] = -(pcVar2[8] == DAT_145d6da20._8_1_);
        auVar28[9] = -(pcVar2[9] == DAT_145d6da20._9_1_);
        auVar28[10] = -(pcVar2[10] == DAT_145d6da20._10_1_);
        auVar28[0xb] = -(pcVar2[0xb] == DAT_145d6da20._11_1_);
        auVar28[0xc] = -(pcVar2[0xc] == DAT_145d6da20._12_1_);
        auVar28[0xd] = -(pcVar2[0xd] == DAT_145d6da20._13_1_);
        auVar28[0xe] = -(pcVar2[0xe] == DAT_145d6da20._14_1_);
        auVar28[0xf] = -(pcVar2[0xf] == DAT_145d6da20._15_1_);
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
          uVar12 = *(ulong *)(lVar7 + uVar13 * -0x18 + -8);
          if (*(ulong *)(param_3 + 0x218) <= uVar12) goto LAB_1403702e5;
          uVar12 = *(ulong *)(*(long *)(param_3 + 0x210) + uVar12 * 8);
          if (uVar12 == 0) goto LAB_1403702e5;
          lVar10 = *(long *)(param_3 + 0x1e0);
          lVar14 = ~uVar12 * 0x38;
          if (*(char *)(lVar10 + 0x30 + lVar14) == '\0') goto LAB_1403702e5;
          pcVar1 = *(char **)(lVar14 + lVar10 + 0x10);
          if ((((((bool)*pcVar1 == bVar15) && ((bool)pcVar1[1] == bVar16)) &&
               ((pcVar1[2] == cVar17 && (((bool)pcVar1[3] == bVar18 && ((bool)pcVar1[4] == bVar19)))
                ))) && (pcVar1[5] == cVar20)) &&
             ((((bool)pcVar1[6] == local_50 && ((bool)pcVar1[7] == bVar21)) &&
              ((bool)pcVar1[8] == bVar22)))) {
            return;
          }
          uVar12 = 0xaf1deb95239f10da;
          lVar14 = 0;
          goto LAB_1403701c4;
        }
        uVar11 = (ushort)(uVar9 - 1) & (ushort)uVar9;
        uVar9 = CONCAT22((short)(uVar9 - 1 >> 0x10),uVar11);
      }
      auVar24[0] = -(*pcVar1 == -1);
      auVar24[1] = -(pcVar1[1] == -1);
      auVar24[2] = -(pcVar1[2] == -1);
      auVar24[3] = -(pcVar1[3] == -1);
      auVar24[4] = -(pcVar1[4] == -1);
      auVar24[5] = -(pcVar1[5] == -1);
      auVar24[6] = -(pcVar1[6] == -1);
      auVar24[7] = -(pcVar1[7] == -1);
      auVar24[8] = -(pcVar1[8] == -1);
      auVar24[9] = -(pcVar1[9] == -1);
      auVar24[10] = -(pcVar1[10] == -1);
      auVar24[0xb] = -(pcVar1[0xb] == -1);
      auVar24[0xc] = -(pcVar1[0xc] == -1);
      auVar24[0xd] = -(pcVar1[0xd] == -1);
      auVar24[0xe] = -(pcVar1[0xe] == -1);
      auVar24[0xf] = -(pcVar1[0xf] == -1);
      if ((((((((((((((((SUB161(auVar24 >> 7,0) & 1) != 0 || (SUB161(auVar24 >> 0xf,0) & 1) != 0) ||
                      (SUB161(auVar24 >> 0x17,0) & 1) != 0) || (SUB161(auVar24 >> 0x1f,0) & 1) != 0)
                    || (SUB161(auVar24 >> 0x27,0) & 1) != 0) || (SUB161(auVar24 >> 0x2f,0) & 1) != 0
                   ) || (SUB161(auVar24 >> 0x37,0) & 1) != 0) ||
                 (SUB161(auVar24 >> 0x3f,0) & 1) != 0) || (SUB161(auVar24 >> 0x47,0) & 1) != 0) ||
               (SUB161(auVar24 >> 0x4f,0) & 1) != 0) || (SUB161(auVar24 >> 0x57,0) & 1) != 0) ||
             (SUB161(auVar24 >> 0x5f,0) & 1) != 0) || (SUB161(auVar24 >> 0x67,0) & 1) != 0) ||
           (SUB161(auVar24 >> 0x6f,0) & 1) != 0) || (SUB161(auVar24 >> 0x77,0) & 1) != 0) ||
          auVar24[0xf] < '\0') break;
      uVar12 = uVar12 + lVar10 + 0x10;
      lVar10 = lVar10 + 0x10;
    }
  }
LAB_1403702e5:
  func_0x000145d699c0();
                    /* WARNING: Does not return */
  pcVar4 = (code *)invalidInstructionException();
  (*pcVar4)();
LAB_1403701c4:
  uVar12 = uVar12 & uVar8;
  pcVar1 = (char *)(lVar7 + uVar12);
  auVar29[0] = -(*pcVar1 == DAT_145d6d6d0);
  auVar29[1] = -(pcVar1[1] == DAT_145d6d6d0._1_1_);
  auVar29[2] = -(pcVar1[2] == DAT_145d6d6d0._2_1_);
  auVar29[3] = -(pcVar1[3] == DAT_145d6d6d0._3_1_);
  auVar29[4] = -(pcVar1[4] == DAT_145d6d6d0._4_1_);
  auVar29[5] = -(pcVar1[5] == DAT_145d6d6d0._5_1_);
  auVar29[6] = -(pcVar1[6] == DAT_145d6d6d0._6_1_);
  auVar29[7] = -(pcVar1[7] == DAT_145d6d6d0._7_1_);
  auVar29[8] = -(pcVar1[8] == DAT_145d6d6d0._8_1_);
  auVar29[9] = -(pcVar1[9] == DAT_145d6d6d0._9_1_);
  auVar29[10] = -(pcVar1[10] == DAT_145d6d6d0._10_1_);
  auVar29[0xb] = -(pcVar1[0xb] == DAT_145d6d6d0._11_1_);
  auVar29[0xc] = -(pcVar1[0xc] == DAT_145d6d6d0._12_1_);
  auVar29[0xd] = -(pcVar1[0xd] == DAT_145d6d6d0._13_1_);
  auVar29[0xe] = -(pcVar1[0xe] == DAT_145d6d6d0._14_1_);
  auVar29[0xf] = -(pcVar1[0xf] == DAT_145d6d6d0._15_1_);
  uVar11 = (ushort)(SUB161(auVar29 >> 7,0) & 1) | (ushort)(SUB161(auVar29 >> 0xf,0) & 1) << 1 |
           (ushort)(SUB161(auVar29 >> 0x17,0) & 1) << 2 |
           (ushort)(SUB161(auVar29 >> 0x1f,0) & 1) << 3 |
           (ushort)(SUB161(auVar29 >> 0x27,0) & 1) << 4 |
           (ushort)(SUB161(auVar29 >> 0x2f,0) & 1) << 5 |
           (ushort)(SUB161(auVar29 >> 0x37,0) & 1) << 6 |
           (ushort)(SUB161(auVar29 >> 0x3f,0) & 1) << 7 |
           (ushort)(SUB161(auVar29 >> 0x47,0) & 1) << 8 |
           (ushort)(SUB161(auVar29 >> 0x4f,0) & 1) << 9 |
           (ushort)(SUB161(auVar29 >> 0x57,0) & 1) << 10 |
           (ushort)(SUB161(auVar29 >> 0x5f,0) & 1) << 0xb |
           (ushort)(SUB161(auVar29 >> 0x67,0) & 1) << 0xc |
           (ushort)(SUB161(auVar29 >> 0x6f,0) & 1) << 0xd |
           (ushort)(SUB161(auVar29 >> 0x77,0) & 1) << 0xe | (ushort)(auVar29[0xf] >> 7) << 0xf;
  uVar9 = (uint)uVar11;
  while (uVar11 != 0) {
    uVar5 = 0;
    for (uVar6 = uVar9; (uVar6 & 1) == 0; uVar6 = uVar6 >> 1 | 0x80000000) {
      uVar5 = uVar5 + 1;
    }
    uVar13 = uVar5 + uVar12 & uVar8;
    pcVar2 = (char *)(lVar7 + -0x18 + uVar13 * -0x18);
    auVar30[0] = -(*pcVar2 == DAT_145d6da20);
    auVar30[1] = -(pcVar2[1] == DAT_145d6da20._1_1_);
    auVar30[2] = -(pcVar2[2] == DAT_145d6da20._2_1_);
    auVar30[3] = -(pcVar2[3] == DAT_145d6da20._3_1_);
    auVar30[4] = -(pcVar2[4] == DAT_145d6da20._4_1_);
    auVar30[5] = -(pcVar2[5] == DAT_145d6da20._5_1_);
    auVar30[6] = -(pcVar2[6] == DAT_145d6da20._6_1_);
    auVar30[7] = -(pcVar2[7] == DAT_145d6da20._7_1_);
    auVar30[8] = -(pcVar2[8] == DAT_145d6da20._8_1_);
    auVar30[9] = -(pcVar2[9] == DAT_145d6da20._9_1_);
    auVar30[10] = -(pcVar2[10] == DAT_145d6da20._10_1_);
    auVar30[0xb] = -(pcVar2[0xb] == DAT_145d6da20._11_1_);
    auVar30[0xc] = -(pcVar2[0xc] == DAT_145d6da20._12_1_);
    auVar30[0xd] = -(pcVar2[0xd] == DAT_145d6da20._13_1_);
    auVar30[0xe] = -(pcVar2[0xe] == DAT_145d6da20._14_1_);
    auVar30[0xf] = -(pcVar2[0xf] == DAT_145d6da20._15_1_);
    if ((ushort)((ushort)(SUB161(auVar30 >> 7,0) & 1) | (ushort)(SUB161(auVar30 >> 0xf,0) & 1) << 1
                 | (ushort)(SUB161(auVar30 >> 0x17,0) & 1) << 2 |
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
                 (ushort)(SUB161(auVar30 >> 0x77,0) & 1) << 0xe | (ushort)(auVar30[0xf] >> 7) << 0xf
                ) == 0xffff) {
      uVar8 = *(ulong *)(lVar7 + uVar13 * -0x18 + -8);
      if (((uVar8 < *(ulong *)(param_3 + 0x218)) &&
          (uVar8 = *(ulong *)(*(long *)(param_3 + 0x210) + uVar8 * 8), uVar8 != 0)) &&
         (lVar7 = ~uVar8 * 0x38, *(char *)(lVar10 + 0x30 + lVar7) != '\0')) {
        lVar10 = lVar10 + lVar7;
        pcVar1 = *(char **)(lVar10 + 0x10);
        *(undefined4 *)(lVar10 + 0x2c) = *(undefined4 *)(param_3 + 0x5b0);
        *pcVar1 = bVar15;
        pcVar1[1] = bVar16;
        pcVar1[2] = cVar17;
        pcVar1[3] = bVar18;
        pcVar1[4] = bVar19;
        pcVar1[5] = cVar20;
        pcVar1[6] = local_50;
        pcVar1[7] = bVar21;
        pcVar1[8] = bVar22;
        return;
      }
      goto LAB_140370314;
    }
    uVar11 = (ushort)(uVar9 - 1) & (ushort)uVar9;
    uVar9 = CONCAT22((short)(uVar9 - 1 >> 0x10),uVar11);
  }
  auVar25[0] = -(*pcVar1 == -1);
  auVar25[1] = -(pcVar1[1] == -1);
  auVar25[2] = -(pcVar1[2] == -1);
  auVar25[3] = -(pcVar1[3] == -1);
  auVar25[4] = -(pcVar1[4] == -1);
  auVar25[5] = -(pcVar1[5] == -1);
  auVar25[6] = -(pcVar1[6] == -1);
  auVar25[7] = -(pcVar1[7] == -1);
  auVar25[8] = -(pcVar1[8] == -1);
  auVar25[9] = -(pcVar1[9] == -1);
  auVar25[10] = -(pcVar1[10] == -1);
  auVar25[0xb] = -(pcVar1[0xb] == -1);
  auVar25[0xc] = -(pcVar1[0xc] == -1);
  auVar25[0xd] = -(pcVar1[0xd] == -1);
  auVar25[0xe] = -(pcVar1[0xe] == -1);
  auVar25[0xf] = -(pcVar1[0xf] == -1);
  if ((((((((((((((((SUB161(auVar25 >> 7,0) & 1) != 0 || (SUB161(auVar25 >> 0xf,0) & 1) != 0) ||
                  (SUB161(auVar25 >> 0x17,0) & 1) != 0) || (SUB161(auVar25 >> 0x1f,0) & 1) != 0) ||
                (SUB161(auVar25 >> 0x27,0) & 1) != 0) || (SUB161(auVar25 >> 0x2f,0) & 1) != 0) ||
              (SUB161(auVar25 >> 0x37,0) & 1) != 0) || (SUB161(auVar25 >> 0x3f,0) & 1) != 0) ||
            (SUB161(auVar25 >> 0x47,0) & 1) != 0) || (SUB161(auVar25 >> 0x4f,0) & 1) != 0) ||
          (SUB161(auVar25 >> 0x57,0) & 1) != 0) || (SUB161(auVar25 >> 0x5f,0) & 1) != 0) ||
        (SUB161(auVar25 >> 0x67,0) & 1) != 0) || (SUB161(auVar25 >> 0x6f,0) & 1) != 0) ||
      (SUB161(auVar25 >> 0x77,0) & 1) != 0) || auVar25[0xf] < '\0') {
LAB_140370314:
    func_0x000145d699c0();
                    /* WARNING: Does not return */
    pcVar4 = (code *)invalidInstructionException();
    (*pcVar4)();
  }
  uVar12 = uVar12 + lVar14 + 0x10;
  lVar14 = lVar14 + 0x10;
  goto LAB_1403701c4;
}
