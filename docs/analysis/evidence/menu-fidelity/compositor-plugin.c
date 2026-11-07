/* WARNING: Removing unreachable block (ram,0x000140bfa56b) */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long param_3)

{
  long lVar1;
  ulong *puVar2;
  char *pcVar3;
  char *pcVar4;
  undefined4 uVar5;
  code *pcVar6;
  ushort uVar7;
  short sVar8;
  uint uVar9;
  uint uVar10;
  long lVar11;
  undefined8 *puVar12;
  undefined4 *puVar13;
  undefined1 uVar14;
  ulong uVar15;
  long lVar16;
  long lVar17;
  ushort uVar18;
  ulong uVar19;
  ulong uVar20;
  uint uVar21;
  undefined1 auVar22 [16];
  undefined1 auVar23 [16];
  undefined1 auVar24 [16];
  undefined1 auVar25 [16];
  undefined1 auVar26 [16];
  undefined1 auVar27 [16];
  undefined1 auVar28 [16];
  undefined1 auVar29 [16];
  undefined8 uStack_4c8;
  undefined8 local_4c0;
  undefined8 uStack_4b8;
  undefined8 local_4b0;
  undefined8 uStack_4a8;
  undefined8 uStack_4a0;
  undefined8 uStack_498;
  undefined8 uStack_490;
  undefined8 uStack_488;
  undefined8 *local_480;
  undefined8 uStack_478;
  undefined8 local_470;
  undefined8 uStack_468;
  undefined8 local_128;
  undefined8 uStack_120;
  undefined8 local_118;
  undefined8 uStack_110;
  undefined8 local_108;
  undefined8 uStack_100;
  undefined8 local_f8;
  undefined8 uStack_f0;
  undefined8 local_e8;
  undefined8 uStack_e0;
  undefined8 local_d8;
  undefined8 uStack_d0;
  undefined8 local_c8;
  undefined8 uStack_c0;
  ulong local_b8;
  undefined8 uStack_90;
  undefined8 local_88;
  undefined8 uStack_80;
  undefined8 local_78;
  undefined8 uStack_70;
  undefined8 local_68;
  undefined8 uStack_60;
  undefined8 local_58;
  undefined8 uStack_50;

  func_0x000140002200();
  local_480 = (undefined8 *)func_0x0001400021c0();
  if (local_480 == (undefined8 *)0x0) {
    func_0x000145d992a1();
                    /* WARNING: Does not return */
    pcVar6 = (code *)invalidInstructionException();
    (*pcVar6)();
  }
  *local_480 = 0;
  *(undefined4 *)(local_480 + 3) = 0;
  *(undefined1 *)((long)local_480 + 0x1c) = 0;
  uStack_488 = 0x140fa8610;
  uStack_468 = 0;
  uStack_478 = 0x145fd53d0;
  uStack_4c8 = 8;
  local_4c0 = 0;
  uStack_4b8 = 0;
  local_4b0 = 8;
  uStack_4a8 = 0;
  uStack_4a0 = 0;
  uStack_498 = 8;
  uStack_490 = 0;
  local_470 = 0x140fa9f00;
  func_0x000140ec1a50();
  lVar1 = param_3 + 0x40;
  puVar2 = (ulong *)(param_3 + 0x5a8);
  local_b8 = 0;
  if (*(long *)(param_3 + 0x90) != 0) {
    uVar15 = 0x46a681bcb906b635;
    lVar11 = *(long *)(param_3 + 0x78);
    lVar16 = 0;
    while( true ) {
      uVar15 = uVar15 & *(ulong *)(param_3 + 0x80);
      pcVar3 = (char *)(lVar11 + uVar15);
      auVar26[0] = -(*pcVar3 == DAT_145dccee0);
      auVar26[1] = -(pcVar3[1] == cRam0000000145dccee1);
      auVar26[2] = -(pcVar3[2] == cRam0000000145dccee2);
      auVar26[3] = -(pcVar3[3] == cRam0000000145dccee3);
      auVar26[4] = -(pcVar3[4] == cRam0000000145dccee4);
      auVar26[5] = -(pcVar3[5] == cRam0000000145dccee5);
      auVar26[6] = -(pcVar3[6] == cRam0000000145dccee6);
      auVar26[7] = -(pcVar3[7] == cRam0000000145dccee7);
      auVar26[8] = -(pcVar3[8] == cRam0000000145dccee8);
      auVar26[9] = -(pcVar3[9] == cRam0000000145dccee9);
      auVar26[10] = -(pcVar3[10] == cRam0000000145dcceea);
      auVar26[0xb] = -(pcVar3[0xb] == cRam0000000145dcceeb);
      auVar26[0xc] = -(pcVar3[0xc] == cRam0000000145dcceec);
      auVar26[0xd] = -(pcVar3[0xd] == cRam0000000145dcceed);
      auVar26[0xe] = -(pcVar3[0xe] == cRam0000000145dcceee);
      auVar26[0xf] = -(pcVar3[0xf] == cRam0000000145dcceef);
      uVar18 = (ushort)(SUB161(auVar26 >> 7,0) & 1) | (ushort)(SUB161(auVar26 >> 0xf,0) & 1) << 1 |
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
      uVar21 = (uint)uVar18;
      while (uVar18 != 0) {
        uVar9 = 0;
        for (uVar10 = uVar21; (uVar10 & 1) == 0; uVar10 = uVar10 >> 1 | 0x80000000) {
          uVar9 = uVar9 + 1;
        }
        uVar19 = uVar9 + uVar15 & *(ulong *)(param_3 + 0x80);
        pcVar4 = (char *)(lVar11 + -0x18 + uVar19 * -0x18);
        auVar27[0] = -(*pcVar4 == DAT_145f3de30);
        auVar27[1] = -(pcVar4[1] == cRam0000000145f3de31);
        auVar27[2] = -(pcVar4[2] == cRam0000000145f3de32);
        auVar27[3] = -(pcVar4[3] == cRam0000000145f3de33);
        auVar27[4] = -(pcVar4[4] == cRam0000000145f3de34);
        auVar27[5] = -(pcVar4[5] == cRam0000000145f3de35);
        auVar27[6] = -(pcVar4[6] == cRam0000000145f3de36);
        auVar27[7] = -(pcVar4[7] == cRam0000000145f3de37);
        auVar27[8] = -(pcVar4[8] == cRam0000000145f3de38);
        auVar27[9] = -(pcVar4[9] == cRam0000000145f3de39);
        auVar27[10] = -(pcVar4[10] == cRam0000000145f3de3a);
        auVar27[0xb] = -(pcVar4[0xb] == cRam0000000145f3de3b);
        auVar27[0xc] = -(pcVar4[0xc] == cRam0000000145f3de3c);
        auVar27[0xd] = -(pcVar4[0xd] == cRam0000000145f3de3d);
        auVar27[0xe] = -(pcVar4[0xe] == cRam0000000145f3de3e);
        auVar27[0xf] = -(pcVar4[0xf] == cRam0000000145f3de3f);
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
          uVar15 = *(ulong *)(lVar11 + uVar19 * -0x18 + -8);
          goto LAB_140bfa581;
        }
        uVar18 = (ushort)(uVar21 - 1) & (ushort)uVar21;
        uVar21 = CONCAT22((short)(uVar21 - 1 >> 0x10),uVar18);
      }
      auVar24[0] = -(*pcVar3 == -1);
      auVar24[1] = -(pcVar3[1] == -1);
      auVar24[2] = -(pcVar3[2] == -1);
      auVar24[3] = -(pcVar3[3] == -1);
      auVar24[4] = -(pcVar3[4] == -1);
      auVar24[5] = -(pcVar3[5] == -1);
      auVar24[6] = -(pcVar3[6] == -1);
      auVar24[7] = -(pcVar3[7] == -1);
      auVar24[8] = -(pcVar3[8] == -1);
      auVar24[9] = -(pcVar3[9] == -1);
      auVar24[10] = -(pcVar3[10] == -1);
      auVar24[0xb] = -(pcVar3[0xb] == -1);
      auVar24[0xc] = -(pcVar3[0xc] == -1);
      auVar24[0xd] = -(pcVar3[0xd] == -1);
      auVar24[0xe] = -(pcVar3[0xe] == -1);
      auVar24[0xf] = -(pcVar3[0xf] == -1);
      if ((((((((((((((((SUB161(auVar24 >> 7,0) & 1) != 0 || (SUB161(auVar24 >> 0xf,0) & 1) != 0) ||
                      (SUB161(auVar24 >> 0x17,0) & 1) != 0) || (SUB161(auVar24 >> 0x1f,0) & 1) != 0)
                    || (SUB161(auVar24 >> 0x27,0) & 1) != 0) || (SUB161(auVar24 >> 0x2f,0) & 1) != 0
                   ) || (SUB161(auVar24 >> 0x37,0) & 1) != 0) ||
                 (SUB161(auVar24 >> 0x3f,0) & 1) != 0) || (SUB161(auVar24 >> 0x47,0) & 1) != 0) ||
               (SUB161(auVar24 >> 0x4f,0) & 1) != 0) || (SUB161(auVar24 >> 0x57,0) & 1) != 0) ||
             (SUB161(auVar24 >> 0x5f,0) & 1) != 0) || (SUB161(auVar24 >> 0x67,0) & 1) != 0) ||
           (SUB161(auVar24 >> 0x6f,0) & 1) != 0) || (SUB161(auVar24 >> 0x77,0) & 1) != 0) ||
          auVar24[0xf] < '\0') break;
      uVar15 = uVar15 + lVar16 + 0x10;
      lVar16 = lVar16 + 0x10;
    }
  }
  lVar11 = *(long *)(param_3 + 0xe0);
  uVar15 = *(ulong *)(param_3 + 0xe8);
  uVar19 = 0x46a681bcb906b635;
  lVar16 = 0;
  while( true ) {
    uVar19 = uVar19 & uVar15;
    pcVar3 = (char *)(lVar11 + uVar19);
    auVar28[0] = -(*pcVar3 == DAT_145dccee0);
    auVar28[1] = -(pcVar3[1] == cRam0000000145dccee1);
    auVar28[2] = -(pcVar3[2] == cRam0000000145dccee2);
    auVar28[3] = -(pcVar3[3] == cRam0000000145dccee3);
    auVar28[4] = -(pcVar3[4] == cRam0000000145dccee4);
    auVar28[5] = -(pcVar3[5] == cRam0000000145dccee5);
    auVar28[6] = -(pcVar3[6] == cRam0000000145dccee6);
    auVar28[7] = -(pcVar3[7] == cRam0000000145dccee7);
    auVar28[8] = -(pcVar3[8] == cRam0000000145dccee8);
    auVar28[9] = -(pcVar3[9] == cRam0000000145dccee9);
    auVar28[10] = -(pcVar3[10] == cRam0000000145dcceea);
    auVar28[0xb] = -(pcVar3[0xb] == cRam0000000145dcceeb);
    auVar28[0xc] = -(pcVar3[0xc] == cRam0000000145dcceec);
    auVar28[0xd] = -(pcVar3[0xd] == cRam0000000145dcceed);
    auVar28[0xe] = -(pcVar3[0xe] == cRam0000000145dcceee);
    auVar28[0xf] = -(pcVar3[0xf] == cRam0000000145dcceef);
    uVar18 = (ushort)(SUB161(auVar28 >> 7,0) & 1) | (ushort)(SUB161(auVar28 >> 0xf,0) & 1) << 1 |
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
    uVar21 = (uint)uVar18;
    if (uVar18 != 0) break;
LAB_140bfa440:
    auVar25[0] = -(*pcVar3 == -1);
    auVar25[1] = -(pcVar3[1] == -1);
    auVar25[2] = -(pcVar3[2] == -1);
    auVar25[3] = -(pcVar3[3] == -1);
    auVar25[4] = -(pcVar3[4] == -1);
    auVar25[5] = -(pcVar3[5] == -1);
    auVar25[6] = -(pcVar3[6] == -1);
    auVar25[7] = -(pcVar3[7] == -1);
    auVar25[8] = -(pcVar3[8] == -1);
    auVar25[9] = -(pcVar3[9] == -1);
    auVar25[10] = -(pcVar3[10] == -1);
    auVar25[0xb] = -(pcVar3[0xb] == -1);
    auVar25[0xc] = -(pcVar3[0xc] == -1);
    auVar25[0xd] = -(pcVar3[0xd] == -1);
    auVar25[0xe] = -(pcVar3[0xe] == -1);
    auVar25[0xf] = -(pcVar3[0xf] == -1);
    if ((((((((((((((((SUB161(auVar25 >> 7,0) & 1) != 0 || (SUB161(auVar25 >> 0xf,0) & 1) != 0) ||
                    (SUB161(auVar25 >> 0x17,0) & 1) != 0) || (SUB161(auVar25 >> 0x1f,0) & 1) != 0)
                  || (SUB161(auVar25 >> 0x27,0) & 1) != 0) || (SUB161(auVar25 >> 0x2f,0) & 1) != 0)
                || (SUB161(auVar25 >> 0x37,0) & 1) != 0) || (SUB161(auVar25 >> 0x3f,0) & 1) != 0) ||
              (SUB161(auVar25 >> 0x47,0) & 1) != 0) || (SUB161(auVar25 >> 0x4f,0) & 1) != 0) ||
            (SUB161(auVar25 >> 0x57,0) & 1) != 0) || (SUB161(auVar25 >> 0x5f,0) & 1) != 0) ||
          (SUB161(auVar25 >> 0x67,0) & 1) != 0) || (SUB161(auVar25 >> 0x6f,0) & 1) != 0) ||
        (SUB161(auVar25 >> 0x77,0) & 1) != 0) || auVar25[0xf] < '\0') {
LAB_140bfa4ee:
      uVar15 = *puVar2;
      *puVar2 = uVar15 + 1;
      uStack_4c8 = _DAT_145f3e4a0;
      uStack_4a8 = 4;
      uStack_4a0 = 4;
      uStack_488 = 0;
      uVar19 = (ulong)local_480 >> 0x18;
      local_480 = (undefined8 *)CONCAT53((int5)uVar19,0x10100);
      local_4c0 = uRam0000000145f3e4a8;
      uStack_4b8 = 0;
      uStack_498 = 2;
      func_0x00014000f330();
      func_0x00014000f180();
LAB_140bfa581:
      if (((*(ulong *)(param_3 + 0x218) <= uVar15) ||
          (uVar15 = *(ulong *)(*(long *)(param_3 + 0x210) + uVar15 * 8), uVar15 == 0)) ||
         (*(char *)(*(long *)(param_3 + 0x1e0) + 0x30 + ~uVar15 * 0x38) == '\0')) {
        uVar21 = func_0x000140beb6a0();
        local_b8 = (ulong)uVar21;
        uVar5 = *(undefined4 *)(param_3 + 0x5b0);
        func_0x000144e65ff0();
        lVar11 = func_0x000140cb1b80();
        if (*(char *)(lVar11 + 0x30) == '\x01') {
          func_0x000144e7e940();
        }
        else {
          func_0x000145bfa0ed();
          *(undefined4 *)(lVar11 + 0x28) = uVar5;
          *(undefined1 *)(lVar11 + 0x30) = 1;
        }
        *(undefined4 *)(lVar11 + 0x2c) = uVar5;
      }
      func_0x000140515110();
      func_0x000140002200();
      puVar12 = (undefined8 *)func_0x0001400021c0();
      if (puVar12 != (undefined8 *)0x0) {
        func_0x000140002200();
        puVar13 = (undefined4 *)func_0x0001400021c0();
        if (puVar13 == (undefined4 *)0x0) {
          func_0x000145d992a1();
        }
        else {
          *puVar13 = 0;
          *(undefined1 *)(puVar13 + 1) = 0;
          *(undefined8 *)(puVar13 + 0x40) = 0xffffffffffffffff;
          func_0x000144e1fc30();
          func_0x000140002200();
          lVar11 = func_0x0001400021c0();
          if (lVar11 == 0) {
            func_0x000145d992a1();
          }
          else {
            func_0x000145bfa0e7(lVar11);
            func_0x000144e1fc30();
            func_0x000140002200();
            lVar11 = func_0x0001400021c0();
            if (lVar11 != 0) {
              func_0x000145bfa0e7(lVar11);
              func_0x000144e1fc30();
              puVar12[0xc] = local_c8;
              puVar12[0xd] = uStack_c0;
              puVar12[10] = local_d8;
              puVar12[0xb] = uStack_d0;
              puVar12[8] = local_e8;
              puVar12[9] = uStack_e0;
              puVar12[6] = local_f8;
              puVar12[7] = uStack_f0;
              puVar12[4] = local_108;
              puVar12[5] = uStack_100;
              puVar12[2] = local_118;
              puVar12[3] = uStack_110;
              *puVar12 = local_128;
              puVar12[1] = uStack_120;
              puVar12[0xe] = local_b8;
              puVar12[0xf] = 8;
              puVar12[0x10] = 0;
              puVar12[0x11] = lVar1;
              puVar12[0x12] = puVar2;
              puVar12[0x13] = uStack_90;
              puVar12[0x14] = local_88;
              puVar12[0x15] = uStack_80;
              puVar12[0x16] = local_78;
              puVar12[0x17] = uStack_70;
              puVar12[0x18] = local_68;
              puVar12[0x19] = uStack_60;
              puVar12[0x1a] = local_58;
              puVar12[0x1b] = uStack_50;
              puVar12[0x1c] = 0xffffffffffffffff;
              puVar12[0x1d] = uStack_4c8;
              puVar12[0x1e] = local_4c0;
              puVar12[0x1f] = uStack_4b8;
              puVar12[0x20] = local_4b0;
              puVar12[0x21] = uStack_4a8;
              puVar12[0x22] = uStack_4a0;
              puVar12[0x23] = uStack_498;
              puVar12[0x24] = uStack_490;
              puVar12[0x25] = uStack_488;
              puVar12[0x26] = local_480;
              puVar12[0x27] = uStack_478;
              puVar12[0x28] = local_470;
              puVar12[0x29] = uStack_468;
              func_0x000144e9bf10();
              func_0x00014051a3a0();
              return;
            }
            func_0x000145d992a1();
          }
        }
                    /* WARNING: Does not return */
        pcVar6 = (code *)invalidInstructionException();
        (*pcVar6)();
      }
      func_0x000145d992a1();
                    /* WARNING: Does not return */
      pcVar6 = (code *)invalidInstructionException();
      (*pcVar6)();
    }
    uVar19 = uVar19 + lVar16 + 0x10;
    lVar16 = lVar16 + 0x10;
  }
LAB_140bfa3fa:
  uVar9 = 0;
  for (uVar10 = uVar21; (uVar10 & 1) == 0; uVar10 = uVar10 >> 1 | 0x80000000) {
    uVar9 = uVar9 + 1;
  }
  uVar20 = uVar9 + uVar19 & uVar15;
  lVar17 = lVar11 + uVar20 * -0x80;
  auVar29[0] = -(*(char *)(lVar17 + -0x80) == DAT_145f3de30);
  auVar29[1] = -(*(char *)(lVar17 + -0x7f) == cRam0000000145f3de31);
  auVar29[2] = -(*(char *)(lVar17 + -0x7e) == cRam0000000145f3de32);
  auVar29[3] = -(*(char *)(lVar17 + -0x7d) == cRam0000000145f3de33);
  auVar29[4] = -(*(char *)(lVar17 + -0x7c) == cRam0000000145f3de34);
  auVar29[5] = -(*(char *)(lVar17 + -0x7b) == cRam0000000145f3de35);
  auVar29[6] = -(*(char *)(lVar17 + -0x7a) == cRam0000000145f3de36);
  auVar29[7] = -(*(char *)(lVar17 + -0x79) == cRam0000000145f3de37);
  auVar29[8] = -(*(char *)(lVar17 + -0x78) == cRam0000000145f3de38);
  auVar29[9] = -(*(char *)(lVar17 + -0x77) == cRam0000000145f3de39);
  auVar29[10] = -(*(char *)(lVar17 + -0x76) == cRam0000000145f3de3a);
  auVar29[0xb] = -(*(char *)(lVar17 + -0x75) == cRam0000000145f3de3b);
  auVar29[0xc] = -(*(char *)(lVar17 + -0x74) == cRam0000000145f3de3c);
  auVar29[0xd] = -(*(char *)(lVar17 + -0x73) == cRam0000000145f3de3d);
  auVar29[0xe] = -(*(char *)(lVar17 + -0x72) == cRam0000000145f3de3e);
  auVar29[0xf] = -(*(char *)(lVar17 + -0x71) == cRam0000000145f3de3f);
  if ((ushort)((ushort)(SUB161(auVar29 >> 7,0) & 1) | (ushort)(SUB161(auVar29 >> 0xf,0) & 1) << 1 |
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
               (ushort)(SUB161(auVar29 >> 0x77,0) & 1) << 0xe | (ushort)(auVar29[0xf] >> 7) << 0xf)
      != 0xffff) goto code_r0x000140bfa42a;
  uVar15 = uVar20 - 0x10 & uVar15;
  pcVar3 = (char *)(lVar11 + uVar15);
  auVar22[0] = -(*pcVar3 == -1);
  auVar22[1] = -(pcVar3[1] == -1);
  auVar22[2] = -(pcVar3[2] == -1);
  auVar22[3] = -(pcVar3[3] == -1);
  auVar22[4] = -(pcVar3[4] == -1);
  auVar22[5] = -(pcVar3[5] == -1);
  auVar22[6] = -(pcVar3[6] == -1);
  auVar22[7] = -(pcVar3[7] == -1);
  auVar22[8] = -(pcVar3[8] == -1);
  auVar22[9] = -(pcVar3[9] == -1);
  auVar22[10] = -(pcVar3[10] == -1);
  auVar22[0xb] = -(pcVar3[0xb] == -1);
  auVar22[0xc] = -(pcVar3[0xc] == -1);
  auVar22[0xd] = -(pcVar3[0xd] == -1);
  auVar22[0xe] = -(pcVar3[0xe] == -1);
  auVar22[0xf] = -(pcVar3[0xf] == -1);
  uVar7 = (ushort)(SUB161(auVar22 >> 7,0) & 1) | (ushort)(SUB161(auVar22 >> 0xf,0) & 1) << 1 |
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
  pcVar3 = (char *)(lVar11 + uVar20);
  auVar23[0] = -(*pcVar3 == -1);
  auVar23[1] = -(pcVar3[1] == -1);
  auVar23[2] = -(pcVar3[2] == -1);
  auVar23[3] = -(pcVar3[3] == -1);
  auVar23[4] = -(pcVar3[4] == -1);
  auVar23[5] = -(pcVar3[5] == -1);
  auVar23[6] = -(pcVar3[6] == -1);
  auVar23[7] = -(pcVar3[7] == -1);
  auVar23[8] = -(pcVar3[8] == -1);
  auVar23[9] = -(pcVar3[9] == -1);
  auVar23[10] = -(pcVar3[10] == -1);
  auVar23[0xb] = -(pcVar3[0xb] == -1);
  auVar23[0xc] = -(pcVar3[0xc] == -1);
  auVar23[0xd] = -(pcVar3[0xd] == -1);
  auVar23[0xe] = -(pcVar3[0xe] == -1);
  auVar23[0xf] = -(pcVar3[0xf] == -1);
  uVar18 = 0xf;
  if (uVar7 != 0) {
    for (; uVar7 >> uVar18 == 0; uVar18 = uVar18 - 1) {
    }
  }
  sVar8 = 0;
  for (uVar21 = (ushort)((ushort)(SUB161(auVar23 >> 7,0) & 1) |
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
                        (ushort)(auVar23[0xf] >> 7) << 0xf) | 0x10000; (uVar21 & 1) == 0;
      uVar21 = uVar21 >> 1 | 0x80000000) {
    sVar8 = sVar8 + 1;
  }
  uVar14 = 0x80;
  if ((ushort)(sVar8 + (uVar18 ^ 0xf)) < 0x10) {
    *(long *)(param_3 + 0xf0) = *(long *)(param_3 + 0xf0) + 1;
    uVar14 = 0xff;
  }
  *(undefined1 *)(lVar11 + uVar20) = uVar14;
  *(undefined1 *)(lVar11 + 0x10 + uVar15) = uVar14;
  *(long *)(param_3 + 0xf8) = *(long *)(param_3 + 0xf8) + -1;
  if (*(long *)(lVar17 + -0x70) != 2) {
    uStack_468 = *(undefined8 *)(lVar17 + -8);
    uStack_478 = *(undefined8 *)(lVar17 + -0x18);
    local_470 = *(undefined8 *)(lVar17 + -0x10);
    uStack_488 = *(undefined8 *)(lVar17 + -0x28);
    local_480 = *(undefined8 **)(lVar17 + -0x20);
    uStack_4c8 = *(undefined8 *)(lVar17 + -0x68);
    local_4c0 = *(undefined8 *)(lVar17 + -0x60);
    uStack_4b8 = *(undefined8 *)(lVar17 + -0x58);
    local_4b0 = *(undefined8 *)(lVar17 + -0x50);
    uStack_4a8 = *(undefined8 *)(lVar17 + -0x48);
    uStack_4a0 = *(undefined8 *)(lVar17 + -0x40);
    uStack_498 = *(undefined8 *)(lVar17 + -0x38);
    uStack_490 = *(undefined8 *)(lVar17 + -0x30);
    uVar15 = func_0x000144e08f20();
    goto LAB_140bfa581;
  }
  goto LAB_140bfa4ee;
code_r0x000140bfa42a:
  uVar18 = (ushort)(uVar21 - 1) & (ushort)uVar21;
  uVar21 = CONCAT22((short)(uVar21 - 1 >> 0x10),uVar18);
  if (uVar18 == 0) goto LAB_140bfa440;
  goto LAB_140bfa3fa;
}
