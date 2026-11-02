/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,long param_2,long param_3)

{
  char *pcVar1;
  uint *puVar2;
  char *pcVar3;
  long *plVar4;
  code *pcVar5;
  uint uVar6;
  uint uVar7;
  ulong *puVar8;
  char cVar9;
  long lVar10;
  ulong uVar11;
  undefined8 *******pppppppuVar12;
  long lVar13;
  uint uVar14;
  ushort uVar15;
  ulong uVar16;
  undefined1 auVar17 [16];
  undefined1 auVar18 [16];
  undefined1 auVar19 [16];
  undefined1 auVar20 [16];
  undefined1 auVar21 [16];
  undefined1 auVar22 [16];
  undefined1 auVar23 [16];
  undefined1 auVar24 [16];
  undefined1 auVar25 [16];
  undefined1 auVar26 [16];
  undefined1 auVar27 [16];
  undefined1 auVar28 [16];
  undefined1 auVar29 [16];
  undefined1 auVar30 [16];
  undefined1 auVar31 [16];
  undefined8 ******local_188;
  undefined8 ******ppppppuStack_180;
  long local_178;
  long local_170;
  undefined8 local_168;
  undefined8 local_160;
  undefined8 local_158;
  undefined8 local_150;
  undefined8 local_148;
  undefined8 local_140;
  undefined8 local_138;
  undefined8 ******local_130;
  long local_90;
  long local_88;
  char local_80;
  undefined8 ******local_70;
  undefined8 ******ppppppuStack_68;
  long lStack_60;
  undefined8 ******local_58;
  undefined8 ******ppppppuStack_50;
  long local_48;
  undefined1 local_3b;
  undefined1 local_3a [10];

  local_3a._2_8_ = 0xfffffffffffffffe;
  if (*(long *)(param_3 + 0x90) != 0) {
    lVar10 = *(long *)(param_3 + 0x78);
    uVar11 = 0x56c0c6005ba1f42;
    lVar13 = 0;
    while( true ) {
      uVar11 = uVar11 & *(ulong *)(param_3 + 0x80);
      pcVar1 = (char *)(lVar10 + uVar11);
      auVar22[0] = -(*pcVar1 == DAT_145dcd1d0);
      auVar22[1] = -(pcVar1[1] == DAT_145dcd1d0._1_1_);
      auVar22[2] = -(pcVar1[2] == DAT_145dcd1d0._2_1_);
      auVar22[3] = -(pcVar1[3] == DAT_145dcd1d0._3_1_);
      auVar22[4] = -(pcVar1[4] == DAT_145dcd1d0._4_1_);
      auVar22[5] = -(pcVar1[5] == DAT_145dcd1d0._5_1_);
      auVar22[6] = -(pcVar1[6] == DAT_145dcd1d0._6_1_);
      auVar22[7] = -(pcVar1[7] == DAT_145dcd1d0._7_1_);
      auVar22[8] = -(pcVar1[8] == DAT_145dcd1d0._8_1_);
      auVar22[9] = -(pcVar1[9] == DAT_145dcd1d0._9_1_);
      auVar22[10] = -(pcVar1[10] == DAT_145dcd1d0._10_1_);
      auVar22[0xb] = -(pcVar1[0xb] == DAT_145dcd1d0._11_1_);
      auVar22[0xc] = -(pcVar1[0xc] == DAT_145dcd1d0._12_1_);
      auVar22[0xd] = -(pcVar1[0xd] == DAT_145dcd1d0._13_1_);
      auVar22[0xe] = -(pcVar1[0xe] == DAT_145dcd1d0._14_1_);
      auVar22[0xf] = -(pcVar1[0xf] == DAT_145dcd1d0._15_1_);
      uVar15 = (ushort)(SUB161(auVar22 >> 7,0) & 1) | (ushort)(SUB161(auVar22 >> 0xf,0) & 1) << 1 |
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
      uVar14 = (uint)uVar15;
      while (param_2 = param_3, uVar15 != 0) {
        uVar6 = 0;
        for (uVar7 = uVar14; (uVar7 & 1) == 0; uVar7 = uVar7 >> 1 | 0x80000000) {
          uVar6 = uVar6 + 1;
        }
        uVar16 = uVar6 + uVar11 & *(ulong *)(param_3 + 0x80);
        pcVar3 = (char *)(lVar10 + -0x18 + uVar16 * -0x18);
        auVar23[0] = -(*pcVar3 == DAT_145ea3490);
        auVar23[1] = -(pcVar3[1] == DAT_145ea3490._1_1_);
        auVar23[2] = -(pcVar3[2] == DAT_145ea3490._2_1_);
        auVar23[3] = -(pcVar3[3] == DAT_145ea3490._3_1_);
        auVar23[4] = -(pcVar3[4] == DAT_145ea3490._4_1_);
        auVar23[5] = -(pcVar3[5] == DAT_145ea3490._5_1_);
        auVar23[6] = -(pcVar3[6] == DAT_145ea3490._6_1_);
        auVar23[7] = -(pcVar3[7] == DAT_145ea3490._7_1_);
        auVar23[8] = -(pcVar3[8] == DAT_145ea3490._8_1_);
        auVar23[9] = -(pcVar3[9] == DAT_145ea3490._9_1_);
        auVar23[10] = -(pcVar3[10] == DAT_145ea3490._10_1_);
        auVar23[0xb] = -(pcVar3[0xb] == DAT_145ea3490._11_1_);
        auVar23[0xc] = -(pcVar3[0xc] == DAT_145ea3490._12_1_);
        auVar23[0xd] = -(pcVar3[0xd] == DAT_145ea3490._13_1_);
        auVar23[0xe] = -(pcVar3[0xe] == DAT_145ea3490._14_1_);
        auVar23[0xf] = -(pcVar3[0xf] == DAT_145ea3490._15_1_);
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
          uVar11 = *(ulong *)(lVar10 + uVar16 * -0x18 + -8);
          if ((*(ulong *)(param_3 + 0x218) <= uVar11) ||
             (uVar11 = *(ulong *)(*(long *)(param_3 + 0x210) + uVar11 * 8), uVar11 == 0))
          goto LAB_140706a6a;
          lVar10 = ~uVar11 * 0x38;
          if (*(char *)(*(long *)(param_3 + 0x1e0) + 0x30 + lVar10) == '\0') goto LAB_140706a6a;
          lVar10 = *(long *)(param_3 + 0x1e0) + lVar10;
          pcVar1 = *(char **)(lVar10 + 0x10);
          *(undefined4 *)(lVar10 + 0x2c) = *(undefined4 *)(param_3 + 0x5b0);
          cVar9 = *pcVar1;
          *pcVar1 = '\0';
          puVar8 = _DAT_14807cfa8;
          if (cVar9 != '\x01') {
            return;
          }
          if (*(long *)(param_3 + 0x90) == 0) goto LAB_140706b96;
          lVar10 = *(long *)(param_3 + 0x78);
          uVar11 = 0xe1b8538ff078909a;
          lVar13 = 0;
          goto LAB_1407069f9;
        }
        uVar15 = (ushort)(uVar14 - 1) & (ushort)uVar14;
        uVar14 = CONCAT22((short)(uVar14 - 1 >> 0x10),uVar15);
      }
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
      if ((((((((((((((((SUB161(auVar17 >> 7,0) & 1) != 0 || (SUB161(auVar17 >> 0xf,0) & 1) != 0) ||
                      (SUB161(auVar17 >> 0x17,0) & 1) != 0) || (SUB161(auVar17 >> 0x1f,0) & 1) != 0)
                    || (SUB161(auVar17 >> 0x27,0) & 1) != 0) || (SUB161(auVar17 >> 0x2f,0) & 1) != 0
                   ) || (SUB161(auVar17 >> 0x37,0) & 1) != 0) ||
                 (SUB161(auVar17 >> 0x3f,0) & 1) != 0) || (SUB161(auVar17 >> 0x47,0) & 1) != 0) ||
               (SUB161(auVar17 >> 0x4f,0) & 1) != 0) || (SUB161(auVar17 >> 0x57,0) & 1) != 0) ||
             (SUB161(auVar17 >> 0x5f,0) & 1) != 0) || (SUB161(auVar17 >> 0x67,0) & 1) != 0) ||
           (SUB161(auVar17 >> 0x6f,0) & 1) != 0) || (SUB161(auVar17 >> 0x77,0) & 1) != 0) ||
          auVar17[0xf] < '\0') break;
      uVar11 = uVar11 + lVar13 + 0x10;
      lVar13 = lVar13 + 0x10;
    }
  }
LAB_140706a6a:
  local_188 = (undefined8 ******)local_3a;
  ppppppuStack_180 = (undefined8 ******)0x144ffd300;
  func_0x000145d99830(param_1,param_2,&local_188,0x145ea3c17,0x145eabde0);
                    /* WARNING: Does not return */
  pcVar5 = (code *)invalidInstructionException();
  (*pcVar5)();
LAB_1407069f9:
  uVar11 = uVar11 & *(ulong *)(param_3 + 0x80);
  auVar22 = *(undefined1 (*) [16])(lVar10 + uVar11);
  auVar24[0] = -(auVar22[0] == DAT_145dd3030);
  auVar24[1] = -(auVar22[1] == DAT_145dd3030._1_1_);
  auVar24[2] = -(auVar22[2] == DAT_145dd3030._2_1_);
  auVar24[3] = -(auVar22[3] == DAT_145dd3030._3_1_);
  auVar24[4] = -(auVar22[4] == DAT_145dd3030._4_1_);
  auVar24[5] = -(auVar22[5] == DAT_145dd3030._5_1_);
  auVar24[6] = -(auVar22[6] == DAT_145dd3030._6_1_);
  auVar24[7] = -(auVar22[7] == DAT_145dd3030._7_1_);
  auVar24[8] = -(auVar22[8] == DAT_145dd3030._8_1_);
  auVar24[9] = -(auVar22[9] == DAT_145dd3030._9_1_);
  auVar24[10] = -(auVar22[10] == DAT_145dd3030._10_1_);
  auVar24[0xb] = -(auVar22[0xb] == DAT_145dd3030._11_1_);
  auVar24[0xc] = -(auVar22[0xc] == DAT_145dd3030._12_1_);
  auVar24[0xd] = -(auVar22[0xd] == DAT_145dd3030._13_1_);
  auVar24[0xe] = -(auVar22[0xe] == DAT_145dd3030._14_1_);
  auVar24[0xf] = -(auVar22[0xf] == DAT_145dd3030._15_1_);
  uVar15 = (ushort)(SUB161(auVar24 >> 7,0) & 1) | (ushort)(SUB161(auVar24 >> 0xf,0) & 1) << 1 |
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
           (ushort)(SUB161(auVar24 >> 0x77,0) & 1) << 0xe | (ushort)(auVar24[0xf] >> 7) << 0xf;
  uVar14 = (uint)uVar15;
  while (uVar15 != 0) {
    uVar6 = 0;
    for (uVar7 = uVar14; (uVar7 & 1) == 0; uVar7 = uVar7 >> 1 | 0x80000000) {
      uVar6 = uVar6 + 1;
    }
    uVar16 = uVar6 + uVar11 & *(ulong *)(param_3 + 0x80);
    pcVar1 = (char *)(lVar10 + -0x18 + uVar16 * -0x18);
    auVar25[0] = -(*pcVar1 == DAT_145e7cd70);
    auVar25[1] = -(pcVar1[1] == DAT_145e7cd70._1_1_);
    auVar25[2] = -(pcVar1[2] == DAT_145e7cd70._2_1_);
    auVar25[3] = -(pcVar1[3] == DAT_145e7cd70._3_1_);
    auVar25[4] = -(pcVar1[4] == DAT_145e7cd70._4_1_);
    auVar25[5] = -(pcVar1[5] == DAT_145e7cd70._5_1_);
    auVar25[6] = -(pcVar1[6] == DAT_145e7cd70._6_1_);
    auVar25[7] = -(pcVar1[7] == DAT_145e7cd70._7_1_);
    auVar25[8] = -(pcVar1[8] == DAT_145e7cd70._8_1_);
    auVar25[9] = -(pcVar1[9] == DAT_145e7cd70._9_1_);
    auVar25[10] = -(pcVar1[10] == DAT_145e7cd70._10_1_);
    auVar25[0xb] = -(pcVar1[0xb] == DAT_145e7cd70._11_1_);
    auVar25[0xc] = -(pcVar1[0xc] == DAT_145e7cd70._12_1_);
    auVar25[0xd] = -(pcVar1[0xd] == DAT_145e7cd70._13_1_);
    auVar25[0xe] = -(pcVar1[0xe] == DAT_145e7cd70._14_1_);
    auVar25[0xf] = -(pcVar1[0xf] == DAT_145e7cd70._15_1_);
    if ((ushort)((ushort)(SUB161(auVar25 >> 7,0) & 1) | (ushort)(SUB161(auVar25 >> 0xf,0) & 1) << 1
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
                ) == 0xffff) {
      uVar11 = *(ulong *)(lVar10 + uVar16 * -0x18 + -8);
      if ((*(ulong *)(param_3 + 0x218) <= uVar11) ||
         (uVar11 = *(ulong *)(*(long *)(param_3 + 0x210) + uVar11 * 8), uVar11 == 0))
      goto LAB_140706b96;
      lVar10 = ~uVar11 * 0x38;
      if (*(char *)(*(long *)(param_3 + 0x1e0) + 0x30 + lVar10) == '\0') goto LAB_140706b96;
      if (**(char **)(*(long *)(param_3 + 0x1e0) + lVar10 + 0x10) != '\x02') {
        if (2 < *_DAT_14807cfa8) {
          return;
        }
        if (1 < DAT_148043ed0 - 1) {
          if (DAT_148043ed0 == 0) {
            return;
          }
          cVar9 = func_0x000145d45220();
          if (cVar9 == '\0') {
            return;
          }
        }
        cVar9 = func_0x000144c5d8d0();
        if (cVar9 == '\0') {
          return;
        }
        local_170 = _DAT_148043ec0 + 0x30;
        local_58 = (undefined8 ******)0x145eabe10;
        ppppppuStack_50 = (undefined8 ******)0x63;
        local_70 = &local_58;
        ppppppuStack_68 = (undefined8 ******)0x145ea3bd8;
        local_188 = (undefined8 ******)0x1;
        ppppppuStack_180 = &local_70;
        local_178 = 1;
        func_0x000144c5f0f0();
        return;
      }
      if ((*_DAT_14807cfa8 < 3) &&
         (((DAT_148043ee8 - 1 < 2 ||
           ((DAT_148043ee8 != 0 && (cVar9 = func_0x000145d45220(), cVar9 != '\0')))) &&
          (cVar9 = func_0x000144c5d8d0(), cVar9 != '\0')))) {
        local_170 = _DAT_148043ed8 + 0x30;
        local_58 = (undefined8 *******)0x145eabe41;
        ppppppuStack_50 = (undefined8 *******)0x89;
        local_70 = &local_58;
        ppppppuStack_68 = (undefined8 *******)0x145ea3bd8;
        local_188 = (undefined8 *******)0x1;
        ppppppuStack_180 = &local_70;
        local_178 = 1;
        func_0x000144c5f0f0();
      }
      FUN_140748010();
      pppppppuVar12 = &local_58;
      FUN_140742c00();
      if ((undefined8 *******)local_58 != (undefined8 *******)0x0) {
        local_178 = local_48;
        local_188 = local_58;
        ppppppuStack_180 = ppppppuStack_50;
        func_0x0001406d1d00();
      }
      FUN_140747ed0();
      if (*(long *)(param_3 + 0x90) == 0) goto LAB_140706da1;
      lVar10 = *(long *)(param_3 + 0x78);
      uVar11 = 0xf8df6f26cdb24414;
      lVar13 = 0;
      goto LAB_140706cfa;
    }
    uVar15 = (ushort)(uVar14 - 1) & (ushort)uVar14;
    uVar14 = CONCAT22((short)(uVar14 - 1 >> 0x10),uVar15);
  }
  goto LAB_140706a4b;
LAB_140706cfa:
  uVar11 = uVar11 & *(ulong *)(param_3 + 0x80);
  pcVar1 = (char *)(lVar10 + uVar11);
  auVar26[0] = -(*pcVar1 == DAT_145dd3050);
  auVar26[1] = -(pcVar1[1] == DAT_145dd3050._1_1_);
  auVar26[2] = -(pcVar1[2] == DAT_145dd3050._2_1_);
  auVar26[3] = -(pcVar1[3] == DAT_145dd3050._3_1_);
  auVar26[4] = -(pcVar1[4] == DAT_145dd3050._4_1_);
  auVar26[5] = -(pcVar1[5] == DAT_145dd3050._5_1_);
  auVar26[6] = -(pcVar1[6] == DAT_145dd3050._6_1_);
  auVar26[7] = -(pcVar1[7] == DAT_145dd3050._7_1_);
  auVar26[8] = -(pcVar1[8] == DAT_145dd3050._8_1_);
  auVar26[9] = -(pcVar1[9] == DAT_145dd3050._9_1_);
  auVar26[10] = -(pcVar1[10] == DAT_145dd3050._10_1_);
  auVar26[0xb] = -(pcVar1[0xb] == DAT_145dd3050._11_1_);
  auVar26[0xc] = -(pcVar1[0xc] == DAT_145dd3050._12_1_);
  auVar26[0xd] = -(pcVar1[0xd] == DAT_145dd3050._13_1_);
  auVar26[0xe] = -(pcVar1[0xe] == DAT_145dd3050._14_1_);
  auVar26[0xf] = -(pcVar1[0xf] == DAT_145dd3050._15_1_);
  uVar15 = (ushort)(SUB161(auVar26 >> 7,0) & 1) | (ushort)(SUB161(auVar26 >> 0xf,0) & 1) << 1 |
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
           (ushort)(SUB161(auVar26 >> 0x77,0) & 1) << 0xe | (ushort)(auVar26[0xf] >> 7) << 0xf;
  uVar14 = (uint)uVar15;
  while (uVar15 != 0) {
    uVar6 = 0;
    for (uVar7 = uVar14; (uVar7 & 1) == 0; uVar7 = uVar7 >> 1 | 0x80000000) {
      uVar6 = uVar6 + 1;
    }
    uVar16 = uVar6 + uVar11 & *(ulong *)(param_3 + 0x80);
    pcVar3 = (char *)(lVar10 + -0x18 + uVar16 * -0x18);
    auVar27[0] = -(*pcVar3 == DAT_145ea34a0);
    auVar27[1] = -(pcVar3[1] == cRam0000000145ea34a1);
    auVar27[2] = -(pcVar3[2] == cRam0000000145ea34a2);
    auVar27[3] = -(pcVar3[3] == cRam0000000145ea34a3);
    auVar27[4] = -(pcVar3[4] == cRam0000000145ea34a4);
    auVar27[5] = -(pcVar3[5] == cRam0000000145ea34a5);
    auVar27[6] = -(pcVar3[6] == cRam0000000145ea34a6);
    auVar27[7] = -(pcVar3[7] == cRam0000000145ea34a7);
    auVar27[8] = -(pcVar3[8] == cRam0000000145ea34a8);
    auVar27[9] = -(pcVar3[9] == cRam0000000145ea34a9);
    auVar27[10] = -(pcVar3[10] == cRam0000000145ea34aa);
    auVar27[0xb] = -(pcVar3[0xb] == cRam0000000145ea34ab);
    auVar27[0xc] = -(pcVar3[0xc] == cRam0000000145ea34ac);
    auVar27[0xd] = -(pcVar3[0xd] == cRam0000000145ea34ad);
    auVar27[0xe] = -(pcVar3[0xe] == cRam0000000145ea34ae);
    auVar27[0xf] = -(pcVar3[0xf] == cRam0000000145ea34af);
    if ((ushort)((ushort)(SUB161(auVar27 >> 7,0) & 1) | (ushort)(SUB161(auVar27 >> 0xf,0) & 1) << 1
                 | (ushort)(SUB161(auVar27 >> 0x17,0) & 1) << 2 |
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
                 (ushort)(SUB161(auVar27 >> 0x77,0) & 1) << 0xe | (ushort)(auVar27[0xf] >> 7) << 0xf
                ) == 0xffff) {
      uVar11 = *(ulong *)(lVar10 + uVar16 * -0x18 + -8);
      if (((*(ulong *)(param_3 + 0x218) <= uVar11) ||
          (uVar11 = *(ulong *)(*(long *)(param_3 + 0x210) + uVar11 * 8), uVar11 == 0)) ||
         (*(char *)(*(long *)(param_3 + 0x1e0) + 0x30 + ~uVar11 * 0x38) == '\0'))
      goto LAB_140706da1;
      goto LAB_14070709c;
    }
    uVar15 = (ushort)(uVar14 - 1) & (ushort)uVar14;
    uVar14 = CONCAT22((short)(uVar14 - 1 >> 0x10),uVar15);
  }
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
                  (SUB161(auVar19 >> 0x17,0) & 1) != 0) || (SUB161(auVar19 >> 0x1f,0) & 1) != 0) ||
                (SUB161(auVar19 >> 0x27,0) & 1) != 0) || (SUB161(auVar19 >> 0x2f,0) & 1) != 0) ||
              (SUB161(auVar19 >> 0x37,0) & 1) != 0) || (SUB161(auVar19 >> 0x3f,0) & 1) != 0) ||
            (SUB161(auVar19 >> 0x47,0) & 1) != 0) || (SUB161(auVar19 >> 0x4f,0) & 1) != 0) ||
          (SUB161(auVar19 >> 0x57,0) & 1) != 0) || (SUB161(auVar19 >> 0x5f,0) & 1) != 0) ||
        (SUB161(auVar19 >> 0x67,0) & 1) != 0) || (SUB161(auVar19 >> 0x6f,0) & 1) != 0) ||
      (SUB161(auVar19 >> 0x77,0) & 1) != 0) || auVar19[0xf] < '\0') goto LAB_140706da1;
  uVar11 = uVar11 + lVar13 + 0x10;
  lVar13 = lVar13 + 0x10;
  goto LAB_140706cfa;
LAB_140706a4b:
  auVar18[0] = -(auVar22[0] == -1);
  auVar18[1] = -(auVar22[1] == -1);
  auVar18[2] = -(auVar22[2] == -1);
  auVar18[3] = -(auVar22[3] == -1);
  auVar18[4] = -(auVar22[4] == -1);
  auVar18[5] = -(auVar22[5] == -1);
  auVar18[6] = -(auVar22[6] == -1);
  auVar18[7] = -(auVar22[7] == -1);
  auVar18[8] = -(auVar22[8] == -1);
  auVar18[9] = -(auVar22[9] == -1);
  auVar18[10] = -(auVar22[10] == -1);
  auVar18[0xb] = -(auVar22[0xb] == -1);
  auVar18[0xc] = -(auVar22[0xc] == -1);
  auVar18[0xd] = -(auVar22[0xd] == -1);
  auVar18[0xe] = -(auVar22[0xe] == -1);
  auVar18[0xf] = -(auVar22[0xf] == -1);
  if ((((((((((((((((SUB161(auVar18 >> 7,0) & 1) != 0 || (SUB161(auVar18 >> 0xf,0) & 1) != 0) ||
                  (SUB161(auVar18 >> 0x17,0) & 1) != 0) || (SUB161(auVar18 >> 0x1f,0) & 1) != 0) ||
                (SUB161(auVar18 >> 0x27,0) & 1) != 0) || (SUB161(auVar18 >> 0x2f,0) & 1) != 0) ||
              (SUB161(auVar18 >> 0x37,0) & 1) != 0) || (SUB161(auVar18 >> 0x3f,0) & 1) != 0) ||
            (SUB161(auVar18 >> 0x47,0) & 1) != 0) || (SUB161(auVar18 >> 0x4f,0) & 1) != 0) ||
          (SUB161(auVar18 >> 0x57,0) & 1) != 0) || (SUB161(auVar18 >> 0x5f,0) & 1) != 0) ||
        (SUB161(auVar18 >> 0x67,0) & 1) != 0) || (SUB161(auVar18 >> 0x6f,0) & 1) != 0) ||
      (SUB161(auVar18 >> 0x77,0) & 1) != 0) || auVar18[0xf] < '\0') {
LAB_140706b96:
    local_188 = (undefined8 ******)local_3a;
    ppppppuStack_180 = (undefined8 ******)0x144ffd300;
    func_0x000145d99830(param_1,param_3,&local_188,0x145ea3c17,0x145eabdf8);
                    /* WARNING: Does not return */
    pcVar5 = (code *)invalidInstructionException();
    (*pcVar5)();
  }
  uVar11 = uVar11 + lVar13 + 0x10;
  lVar13 = lVar13 + 0x10;
  goto LAB_1407069f9;
LAB_140706da1:
  func_0x000141091660();
  func_0x0001406e9510();
  if ((undefined8 *******)local_58 != (undefined8 *******)0x0) {
    local_178 = local_48;
    local_188 = local_58;
    ppppppuStack_180 = ppppppuStack_50;
    func_0x0001406d1d00();
  }
  if (*(long *)(param_3 + 0x90) != 0) {
    lVar10 = *(long *)(param_3 + 0x78);
    uVar11 = 0xfe1614d5c652a2de;
    lVar13 = 0;
    while( true ) {
      uVar11 = uVar11 & *(ulong *)(param_3 + 0x80);
      auVar22 = *(undefined1 (*) [16])(lVar10 + uVar11);
      auVar28[0] = -(auVar22[0] == DAT_145d9db50);
      auVar28[1] = -(auVar22[1] == DAT_145d9db50._1_1_);
      auVar28[2] = -(auVar22[2] == DAT_145d9db50._2_1_);
      auVar28[3] = -(auVar22[3] == DAT_145d9db50._3_1_);
      auVar28[4] = -(auVar22[4] == DAT_145d9db50._4_1_);
      auVar28[5] = -(auVar22[5] == DAT_145d9db50._5_1_);
      auVar28[6] = -(auVar22[6] == DAT_145d9db50._6_1_);
      auVar28[7] = -(auVar22[7] == DAT_145d9db50._7_1_);
      auVar28[8] = -(auVar22[8] == DAT_145d9db50._8_1_);
      auVar28[9] = -(auVar22[9] == DAT_145d9db50._9_1_);
      auVar28[10] = -(auVar22[10] == DAT_145d9db50._10_1_);
      auVar28[0xb] = -(auVar22[0xb] == DAT_145d9db50._11_1_);
      auVar28[0xc] = -(auVar22[0xc] == DAT_145d9db50._12_1_);
      auVar28[0xd] = -(auVar22[0xd] == DAT_145d9db50._13_1_);
      auVar28[0xe] = -(auVar22[0xe] == DAT_145d9db50._14_1_);
      auVar28[0xf] = -(auVar22[0xf] == DAT_145d9db50._15_1_);
      uVar15 = (ushort)(SUB161(auVar28 >> 7,0) & 1) | (ushort)(SUB161(auVar28 >> 0xf,0) & 1) << 1 |
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
               (ushort)(SUB161(auVar28 >> 0x77,0) & 1) << 0xe | (ushort)(auVar28[0xf] >> 7) << 0xf;
      uVar14 = (uint)uVar15;
      while (uVar15 != 0) {
        uVar6 = 0;
        for (uVar7 = uVar14; (uVar7 & 1) == 0; uVar7 = uVar7 >> 1 | 0x80000000) {
          uVar6 = uVar6 + 1;
        }
        uVar16 = uVar6 + uVar11 & *(ulong *)(param_3 + 0x80);
        pcVar1 = (char *)(lVar10 + -0x18 + uVar16 * -0x18);
        auVar29[0] = -(*pcVar1 == DAT_145e8bc50);
        auVar29[1] = -(pcVar1[1] == DAT_145e8bc50._1_1_);
        auVar29[2] = -(pcVar1[2] == DAT_145e8bc50._2_1_);
        auVar29[3] = -(pcVar1[3] == DAT_145e8bc50._3_1_);
        auVar29[4] = -(pcVar1[4] == DAT_145e8bc50._4_1_);
        auVar29[5] = -(pcVar1[5] == DAT_145e8bc50._5_1_);
        auVar29[6] = -(pcVar1[6] == DAT_145e8bc50._6_1_);
        auVar29[7] = -(pcVar1[7] == DAT_145e8bc50._7_1_);
        auVar29[8] = -(pcVar1[8] == DAT_145e8bc50._8_1_);
        auVar29[9] = -(pcVar1[9] == DAT_145e8bc50._9_1_);
        auVar29[10] = -(pcVar1[10] == DAT_145e8bc50._10_1_);
        auVar29[0xb] = -(pcVar1[0xb] == DAT_145e8bc50._11_1_);
        auVar29[0xc] = -(pcVar1[0xc] == DAT_145e8bc50._12_1_);
        auVar29[0xd] = -(pcVar1[0xd] == DAT_145e8bc50._13_1_);
        auVar29[0xe] = -(pcVar1[0xe] == DAT_145e8bc50._14_1_);
        auVar29[0xf] = -(pcVar1[0xf] == DAT_145e8bc50._15_1_);
        if ((ushort)((ushort)(SUB161(auVar29 >> 7,0) & 1) |
                     (ushort)(SUB161(auVar29 >> 0xf,0) & 1) << 1 |
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
                     (ushort)(SUB161(auVar29 >> 0x77,0) & 1) << 0xe |
                    (ushort)(auVar29[0xf] >> 7) << 0xf) == 0xffff) {
          uVar11 = *(ulong *)(lVar10 + uVar16 * -0x18 + -8);
          if ((*(ulong *)(param_3 + 0x260) <= uVar11) ||
             (uVar11 = *(ulong *)(*(long *)(param_3 + 600) + uVar11 * 8), uVar11 == 0))
          goto LAB_140706fd7;
          lVar10 = ~uVar11 * 0x38;
          if (*(char *)(*(long *)(param_3 + 0x228) + 0x30 + lVar10) != '\x01') goto LAB_140706fd7;
          lVar10 = *(long *)(param_3 + 0x228) + lVar10;
          FUN_14071f320();
          *(undefined1 *)(lVar10 + 0x30) = 0;
          plVar4 = *(long **)(lVar10 + 0x10);
          if ((undefined8 *******)*plVar4 == (undefined8 *******)0x0) goto LAB_140706fd7;
          ppppppuStack_68 = (undefined8 ******)plVar4[1];
          lStack_60 = plVar4[2];
          local_3a[1] = 1;
          local_70 = (undefined8 *******)*plVar4;
          FUN_140745490();
          local_3b = 1;
          func_0x000140cb41f0();
          local_48 = lStack_60;
          local_58 = local_70;
          ppppppuStack_50 = ppppppuStack_68;
          local_3b = 0;
          FUN_1407446a0();
          func_0x0001403f60e0();
          if ((undefined8 *******)local_188 != (undefined8 *******)0x0) {
            func_0x0001400021d0();
          }
          if (local_170 != 0) {
            func_0x0001400021d0();
          }
          goto LAB_14070709c;
        }
        uVar15 = (ushort)(uVar14 - 1) & (ushort)uVar14;
        uVar14 = CONCAT22((short)(uVar14 - 1 >> 0x10),uVar15);
      }
      auVar20[0] = -(auVar22[0] == -1);
      auVar20[1] = -(auVar22[1] == -1);
      auVar20[2] = -(auVar22[2] == -1);
      auVar20[3] = -(auVar22[3] == -1);
      auVar20[4] = -(auVar22[4] == -1);
      auVar20[5] = -(auVar22[5] == -1);
      auVar20[6] = -(auVar22[6] == -1);
      auVar20[7] = -(auVar22[7] == -1);
      auVar20[8] = -(auVar22[8] == -1);
      auVar20[9] = -(auVar22[9] == -1);
      auVar20[10] = -(auVar22[10] == -1);
      auVar20[0xb] = -(auVar22[0xb] == -1);
      auVar20[0xc] = -(auVar22[0xc] == -1);
      auVar20[0xd] = -(auVar22[0xd] == -1);
      auVar20[0xe] = -(auVar22[0xe] == -1);
      auVar20[0xf] = -(auVar22[0xf] == -1);
      if ((((((((((((((((SUB161(auVar20 >> 7,0) & 1) != 0 || (SUB161(auVar20 >> 0xf,0) & 1) != 0) ||
                      (SUB161(auVar20 >> 0x17,0) & 1) != 0) || (SUB161(auVar20 >> 0x1f,0) & 1) != 0)
                    || (SUB161(auVar20 >> 0x27,0) & 1) != 0) || (SUB161(auVar20 >> 0x2f,0) & 1) != 0
                   ) || (SUB161(auVar20 >> 0x37,0) & 1) != 0) ||
                 (SUB161(auVar20 >> 0x3f,0) & 1) != 0) || (SUB161(auVar20 >> 0x47,0) & 1) != 0) ||
               (SUB161(auVar20 >> 0x4f,0) & 1) != 0) || (SUB161(auVar20 >> 0x57,0) & 1) != 0) ||
             (SUB161(auVar20 >> 0x5f,0) & 1) != 0) || (SUB161(auVar20 >> 0x67,0) & 1) != 0) ||
           (SUB161(auVar20 >> 0x6f,0) & 1) != 0) || (SUB161(auVar20 >> 0x77,0) & 1) != 0) ||
          auVar20[0xf] < '\0') break;
      uVar11 = uVar11 + lVar13 + 0x10;
      lVar13 = lVar13 + 0x10;
    }
  }
LAB_140706fd7:
  if (((*puVar8 < 4) &&
      ((DAT_148043f90 - 1 < 2 ||
       ((DAT_148043f90 != 0 && (cVar9 = func_0x000145d45220(), cVar9 != '\0')))))) &&
     (cVar9 = func_0x000144c5d8d0(), cVar9 != '\0')) {
    local_170 = _DAT_148043f80 + 0x30;
    local_58 = (undefined8 *******)0x145eac063;
    ppppppuStack_50 = (undefined8 *******)0x93;
    ppppppuStack_68 = (undefined8 *******)0x145ea3bd8;
    local_188 = (undefined8 *******)0x1;
    ppppppuStack_180 = &local_70;
    local_178 = 1;
    local_70 = &local_58;
    func_0x000144c5f0f0();
  }
LAB_14070709c:
  func_0x000141429f50();
  func_0x000141429b30();
  if ((undefined8 *******)local_188 != *(undefined8 ********)(param_3 + 0x5a0)) {
    func_0x000145d4b100();
                    /* WARNING: Does not return */
    pcVar5 = (code *)invalidInstructionException();
    (*pcVar5)();
  }
  if (local_80 == '\0') {
    lVar10 = 0;
    do {
      if (local_88 << 2 == lVar10) goto LAB_140707201;
      puVar2 = (uint *)(local_90 + lVar10);
      lVar10 = lVar10 + 4;
    } while (*(long *)(*(long *)(param_3 + 0x108) + 0x58 + (ulong)*puVar2 * 0xa0) == 0);
  }
  else {
    lVar10 = 0;
    do {
      if (local_88 << 2 == lVar10) {
LAB_140707201:
        func_0x00014005ca50();
        return;
      }
      puVar2 = (uint *)(local_90 + lVar10);
      lVar10 = lVar10 + 4;
    } while (*(long *)(*(long *)(param_3 + 0x1a8) + 0x10 + (ulong)*puVar2 * 0x48) == 0);
  }
  func_0x00014005ca50();
  if (*(long *)(param_3 + 0x90) != 0) {
    lVar10 = *(long *)(param_3 + 0x78);
    uVar11 = 0x498bcb093de4d9e6;
    lVar13 = 0;
    while( true ) {
      uVar11 = uVar11 & *(ulong *)(param_3 + 0x80);
      auVar22 = *(undefined1 (*) [16])(lVar10 + uVar11);
      auVar30[0] = -(auVar22[0] == DAT_145de25e0);
      auVar30[1] = -(auVar22[1] == DAT_145de25e0._1_1_);
      auVar30[2] = -(auVar22[2] == DAT_145de25e0._2_1_);
      auVar30[3] = -(auVar22[3] == DAT_145de25e0._3_1_);
      auVar30[4] = -(auVar22[4] == DAT_145de25e0._4_1_);
      auVar30[5] = -(auVar22[5] == DAT_145de25e0._5_1_);
      auVar30[6] = -(auVar22[6] == DAT_145de25e0._6_1_);
      auVar30[7] = -(auVar22[7] == DAT_145de25e0._7_1_);
      auVar30[8] = -(auVar22[8] == DAT_145de25e0._8_1_);
      auVar30[9] = -(auVar22[9] == DAT_145de25e0._9_1_);
      auVar30[10] = -(auVar22[10] == DAT_145de25e0._10_1_);
      auVar30[0xb] = -(auVar22[0xb] == DAT_145de25e0._11_1_);
      auVar30[0xc] = -(auVar22[0xc] == DAT_145de25e0._12_1_);
      auVar30[0xd] = -(auVar22[0xd] == DAT_145de25e0._13_1_);
      auVar30[0xe] = -(auVar22[0xe] == DAT_145de25e0._14_1_);
      auVar30[0xf] = -(auVar22[0xf] == DAT_145de25e0._15_1_);
      uVar15 = (ushort)(SUB161(auVar30 >> 7,0) & 1) | (ushort)(SUB161(auVar30 >> 0xf,0) & 1) << 1 |
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
               (ushort)(SUB161(auVar30 >> 0x77,0) & 1) << 0xe | (ushort)(auVar30[0xf] >> 7) << 0xf;
      uVar14 = (uint)uVar15;
      while (uVar15 != 0) {
        uVar6 = 0;
        for (uVar7 = uVar14; (uVar7 & 1) == 0; uVar7 = uVar7 >> 1 | 0x80000000) {
          uVar6 = uVar6 + 1;
        }
        uVar16 = uVar6 + uVar11 & *(ulong *)(param_3 + 0x80);
        pcVar1 = (char *)(lVar10 + -0x18 + uVar16 * -0x18);
        auVar31[0] = -(*pcVar1 == DAT_145e7ca60);
        auVar31[1] = -(pcVar1[1] == DAT_145e7ca60._1_1_);
        auVar31[2] = -(pcVar1[2] == DAT_145e7ca60._2_1_);
        auVar31[3] = -(pcVar1[3] == DAT_145e7ca60._3_1_);
        auVar31[4] = -(pcVar1[4] == DAT_145e7ca60._4_1_);
        auVar31[5] = -(pcVar1[5] == DAT_145e7ca60._5_1_);
        auVar31[6] = -(pcVar1[6] == DAT_145e7ca60._6_1_);
        auVar31[7] = -(pcVar1[7] == DAT_145e7ca60._7_1_);
        auVar31[8] = -(pcVar1[8] == DAT_145e7ca60._8_1_);
        auVar31[9] = -(pcVar1[9] == DAT_145e7ca60._9_1_);
        auVar31[10] = -(pcVar1[10] == DAT_145e7ca60._10_1_);
        auVar31[0xb] = -(pcVar1[0xb] == DAT_145e7ca60._11_1_);
        auVar31[0xc] = -(pcVar1[0xc] == DAT_145e7ca60._12_1_);
        auVar31[0xd] = -(pcVar1[0xd] == DAT_145e7ca60._13_1_);
        auVar31[0xe] = -(pcVar1[0xe] == DAT_145e7ca60._14_1_);
        auVar31[0xf] = -(pcVar1[0xf] == DAT_145e7ca60._15_1_);
        if ((ushort)((ushort)(SUB161(auVar31 >> 7,0) & 1) |
                     (ushort)(SUB161(auVar31 >> 0xf,0) & 1) << 1 |
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
                     (ushort)(SUB161(auVar31 >> 0x77,0) & 1) << 0xe |
                    (ushort)(auVar31[0xf] >> 7) << 0xf) == 0xffff) {
          uVar11 = *(ulong *)(lVar10 + uVar16 * -0x18 + -8);
          if ((uVar11 < *(ulong *)(param_3 + 0x218)) &&
             (uVar11 = *(ulong *)(*(long *)(param_3 + 0x210) + uVar11 * 8), uVar11 != 0)) {
            lVar10 = ~uVar11 * 0x38;
            if (*(char *)(*(long *)(param_3 + 0x1e0) + 0x30 + lVar10) == '\x01') {
              *(undefined4 *)(*(long *)(param_3 + 0x1e0) + lVar10 + 0x2c) =
                   *(undefined4 *)(param_3 + 0x5b0);
              func_0x000140adcbf0();
              return;
            }
          }
          goto LAB_140707268;
        }
        uVar15 = (ushort)(uVar14 - 1) & (ushort)uVar14;
        uVar14 = CONCAT22((short)(uVar14 - 1 >> 0x10),uVar15);
      }
      auVar21[0] = -(auVar22[0] == -1);
      auVar21[1] = -(auVar22[1] == -1);
      auVar21[2] = -(auVar22[2] == -1);
      auVar21[3] = -(auVar22[3] == -1);
      auVar21[4] = -(auVar22[4] == -1);
      auVar21[5] = -(auVar22[5] == -1);
      auVar21[6] = -(auVar22[6] == -1);
      auVar21[7] = -(auVar22[7] == -1);
      auVar21[8] = -(auVar22[8] == -1);
      auVar21[9] = -(auVar22[9] == -1);
      auVar21[10] = -(auVar22[10] == -1);
      auVar21[0xb] = -(auVar22[0xb] == -1);
      auVar21[0xc] = -(auVar22[0xc] == -1);
      auVar21[0xd] = -(auVar22[0xd] == -1);
      auVar21[0xe] = -(auVar22[0xe] == -1);
      auVar21[0xf] = -(auVar22[0xf] == -1);
      if ((((((((((((((((SUB161(auVar21 >> 7,0) & 1) != 0 || (SUB161(auVar21 >> 0xf,0) & 1) != 0) ||
                      (SUB161(auVar21 >> 0x17,0) & 1) != 0) || (SUB161(auVar21 >> 0x1f,0) & 1) != 0)
                    || (SUB161(auVar21 >> 0x27,0) & 1) != 0) || (SUB161(auVar21 >> 0x2f,0) & 1) != 0
                   ) || (SUB161(auVar21 >> 0x37,0) & 1) != 0) ||
                 (SUB161(auVar21 >> 0x3f,0) & 1) != 0) || (SUB161(auVar21 >> 0x47,0) & 1) != 0) ||
               (SUB161(auVar21 >> 0x4f,0) & 1) != 0) || (SUB161(auVar21 >> 0x57,0) & 1) != 0) ||
             (SUB161(auVar21 >> 0x5f,0) & 1) != 0) || (SUB161(auVar21 >> 0x67,0) & 1) != 0) ||
           (SUB161(auVar21 >> 0x6f,0) & 1) != 0) || (SUB161(auVar21 >> 0x77,0) & 1) != 0) ||
          auVar21[0xf] < '\0') break;
      uVar11 = uVar11 + lVar13 + 0x10;
      lVar13 = lVar13 + 0x10;
    }
  }
LAB_140707268:
  if (*_DAT_14808a290 != 0) {
    local_58 = (undefined8 ******)local_3a;
    ppppppuStack_50 = (undefined8 ******)0x144ffd300;
    local_158 = 1;
    local_150 = 0x145ea406b;
    local_148 = 0xf;
    local_138 = 0x145ea3fd8;
    local_188 = (undefined8 ******)0x0;
    ppppppuStack_180 = (undefined8 ******)0x145ea406b;
    local_178 = 0xf;
    local_170 = 0;
    local_168 = 0x145ea3d38;
    local_160 = 0x65;
    local_140 = 0xb2900000001;
    local_130 = pppppppuVar12;
    func_0x000144ff6dd0();
  }
  return;
}
