/* Static Ghidra raw-slice observation, not original source.
 * Target 0.139.1 SHA-256 1c0912276637a41a1a971886bb74626577d021af55a313128f85fdbfcc3b2f1d
 * Raw virtual entry 0x1408882e0; original Win64 operands require independent checking.
 * Evidence ev_8b38dcd249c951122e557fb8174efbb8c1950cbea2b47a2ba47d31ea9fd8e336
 */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long param_3)

{
  char *pcVar1;
  char *pcVar2;
  undefined4 uVar3;
  code *pcVar4;
  ushort uVar5;
  short sVar6;
  uint uVar7;
  uint uVar8;
  long lVar9;
  undefined8 *puVar10;
  undefined1 uVar11;
  ulong uVar12;
  uint uVar13;
  long lVar14;
  long lVar15;
  ushort uVar16;
  ulong uVar17;
  ulong uVar18;
  undefined1 auVar19 [16];
  undefined1 auVar20 [16];
  undefined1 auVar21 [16];
  undefined1 auVar22 [16];
  undefined1 auVar23 [16];
  undefined1 auVar24 [16];
  undefined1 auVar25 [16];
  undefined1 auVar26 [16];
  ulong local_218;
  undefined8 uStack_210;
  undefined1 local_208 [16];
  undefined8 local_1f8;
  undefined8 uStack_1f0;
  ulong local_1e8;
  undefined8 uStack_1e0;
  undefined8 local_1d8;
  undefined8 uStack_1d0;
  undefined8 local_1c8;
  undefined8 uStack_1c0;
  undefined8 local_1b8;
  undefined8 uStack_1b0;
  long local_e8 [4];
  ulong *local_c8;
  long local_c0;
  ulong local_b8;
  undefined8 uStack_b0;
  undefined8 local_a8;
  undefined8 uStack_a0;
  undefined8 local_98;
  undefined8 uStack_90;
  ulong local_88;
  undefined8 uStack_80;
  undefined8 local_78;
  undefined8 uStack_70;
  undefined8 local_68;
  undefined8 uStack_60;
  undefined8 local_58;
  undefined8 uStack_50;
  undefined1 local_3a;
  undefined8 local_38;
  
  local_38 = 0xfffffffffffffffe;
  local_e8[3] = param_3 + 0x40;
  local_c8 = (ulong *)(param_3 + 0x5a8);
  local_e8[0] = 0;
  local_e8[1] = 8;
  local_e8[2] = 0;
  if (*(long *)(param_3 + 0x90) != 0) {
    uVar12 = 0x6524a949793abf2f;
    lVar9 = *(long *)(param_3 + 0x78);
    lVar14 = 0;
    while( true ) {
      uVar12 = uVar12 & *(ulong *)(param_3 + 0x80);
      pcVar1 = (char *)(lVar9 + uVar12);
      auVar23[0] = -(*pcVar1 == DAT_1464db300);
      auVar23[1] = -(pcVar1[1] == cRam00000001464db301);
      auVar23[2] = -(pcVar1[2] == cRam00000001464db302);
      auVar23[3] = -(pcVar1[3] == cRam00000001464db303);
      auVar23[4] = -(pcVar1[4] == cRam00000001464db304);
      auVar23[5] = -(pcVar1[5] == cRam00000001464db305);
      auVar23[6] = -(pcVar1[6] == cRam00000001464db306);
      auVar23[7] = -(pcVar1[7] == cRam00000001464db307);
      auVar23[8] = -(pcVar1[8] == cRam00000001464db308);
      auVar23[9] = -(pcVar1[9] == cRam00000001464db309);
      auVar23[10] = -(pcVar1[10] == cRam00000001464db30a);
      auVar23[0xb] = -(pcVar1[0xb] == cRam00000001464db30b);
      auVar23[0xc] = -(pcVar1[0xc] == cRam00000001464db30c);
      auVar23[0xd] = -(pcVar1[0xd] == cRam00000001464db30d);
      auVar23[0xe] = -(pcVar1[0xe] == cRam00000001464db30e);
      auVar23[0xf] = -(pcVar1[0xf] == cRam00000001464db30f);
      uVar16 = (ushort)(SUB161(auVar23 >> 7,0) & 1) | (ushort)(SUB161(auVar23 >> 0xf,0) & 1) << 1 |
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
      uVar13 = (uint)uVar16;
      while (uVar16 != 0) {
        uVar7 = 0;
        for (uVar8 = uVar13; (uVar8 & 1) == 0; uVar8 = uVar8 >> 1 | 0x80000000) {
          uVar7 = uVar7 + 1;
        }
        uVar17 = uVar7 + uVar12 & *(ulong *)(param_3 + 0x80);
        pcVar2 = (char *)(lVar9 + -0x18 + uVar17 * -0x18);
        auVar24[0] = -(*pcVar2 == DAT_146528f70);
        auVar24[1] = -(pcVar2[1] == cRam0000000146528f71);
        auVar24[2] = -(pcVar2[2] == cRam0000000146528f72);
        auVar24[3] = -(pcVar2[3] == cRam0000000146528f73);
        auVar24[4] = -(pcVar2[4] == cRam0000000146528f74);
        auVar24[5] = -(pcVar2[5] == cRam0000000146528f75);
        auVar24[6] = -(pcVar2[6] == cRam0000000146528f76);
        auVar24[7] = -(pcVar2[7] == cRam0000000146528f77);
        auVar24[8] = -(pcVar2[8] == cRam0000000146528f78);
        auVar24[9] = -(pcVar2[9] == cRam0000000146528f79);
        auVar24[10] = -(pcVar2[10] == cRam0000000146528f7a);
        auVar24[0xb] = -(pcVar2[0xb] == cRam0000000146528f7b);
        auVar24[0xc] = -(pcVar2[0xc] == cRam0000000146528f7c);
        auVar24[0xd] = -(pcVar2[0xd] == cRam0000000146528f7d);
        auVar24[0xe] = -(pcVar2[0xe] == cRam0000000146528f7e);
        auVar24[0xf] = -(pcVar2[0xf] == cRam0000000146528f7f);
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
          uVar12 = *(ulong *)(lVar9 + uVar17 * -0x18 + -8);
          goto LAB_1408886e5;
        }
        uVar16 = (ushort)(uVar13 - 1) & (ushort)uVar13;
        uVar13 = CONCAT22((short)(uVar13 - 1 >> 0x10),uVar16);
      }
      auVar21[0] = -(*pcVar1 == -1);
      auVar21[1] = -(pcVar1[1] == -1);
      auVar21[2] = -(pcVar1[2] == -1);
      auVar21[3] = -(pcVar1[3] == -1);
      auVar21[4] = -(pcVar1[4] == -1);
      auVar21[5] = -(pcVar1[5] == -1);
      auVar21[6] = -(pcVar1[6] == -1);
      auVar21[7] = -(pcVar1[7] == -1);
      auVar21[8] = -(pcVar1[8] == -1);
      auVar21[9] = -(pcVar1[9] == -1);
      auVar21[10] = -(pcVar1[10] == -1);
      auVar21[0xb] = -(pcVar1[0xb] == -1);
      auVar21[0xc] = -(pcVar1[0xc] == -1);
      auVar21[0xd] = -(pcVar1[0xd] == -1);
      auVar21[0xe] = -(pcVar1[0xe] == -1);
      auVar21[0xf] = -(pcVar1[0xf] == -1);
      if ((((((((((((((((SUB161(auVar21 >> 7,0) & 1) != 0 || (SUB161(auVar21 >> 0xf,0) & 1) != 0) ||
                      (SUB161(auVar21 >> 0x17,0) & 1) != 0) || (SUB161(auVar21 >> 0x1f,0) & 1) != 0)
                    || (SUB161(auVar21 >> 0x27,0) & 1) != 0) || (SUB161(auVar21 >> 0x2f,0) & 1) != 0
                   ) || (SUB161(auVar21 >> 0x37,0) & 1) != 0) ||
                 (SUB161(auVar21 >> 0x3f,0) & 1) != 0) || (SUB161(auVar21 >> 0x47,0) & 1) != 0) ||
               (SUB161(auVar21 >> 0x4f,0) & 1) != 0) || (SUB161(auVar21 >> 0x57,0) & 1) != 0) ||
             (SUB161(auVar21 >> 0x5f,0) & 1) != 0) || (SUB161(auVar21 >> 0x67,0) & 1) != 0) ||
           (SUB161(auVar21 >> 0x6f,0) & 1) != 0) || (SUB161(auVar21 >> 0x77,0) & 1) != 0) ||
          auVar21[0xf] < '\0') break;
      uVar12 = uVar12 + lVar14 + 0x10;
      lVar14 = lVar14 + 0x10;
    }
  }
  lVar9 = *(long *)(param_3 + 0xe0);
  uVar12 = *(ulong *)(param_3 + 0xe8);
  uVar17 = 0x6524a949793abf2f;
  lVar14 = 0;
  while( true ) {
    uVar17 = uVar17 & uVar12;
    pcVar1 = (char *)(lVar9 + uVar17);
    auVar25[0] = -(*pcVar1 == DAT_1464db300);
    auVar25[1] = -(pcVar1[1] == cRam00000001464db301);
    auVar25[2] = -(pcVar1[2] == cRam00000001464db302);
    auVar25[3] = -(pcVar1[3] == cRam00000001464db303);
    auVar25[4] = -(pcVar1[4] == cRam00000001464db304);
    auVar25[5] = -(pcVar1[5] == cRam00000001464db305);
    auVar25[6] = -(pcVar1[6] == cRam00000001464db306);
    auVar25[7] = -(pcVar1[7] == cRam00000001464db307);
    auVar25[8] = -(pcVar1[8] == cRam00000001464db308);
    auVar25[9] = -(pcVar1[9] == cRam00000001464db309);
    auVar25[10] = -(pcVar1[10] == cRam00000001464db30a);
    auVar25[0xb] = -(pcVar1[0xb] == cRam00000001464db30b);
    auVar25[0xc] = -(pcVar1[0xc] == cRam00000001464db30c);
    auVar25[0xd] = -(pcVar1[0xd] == cRam00000001464db30d);
    auVar25[0xe] = -(pcVar1[0xe] == cRam00000001464db30e);
    auVar25[0xf] = -(pcVar1[0xf] == cRam00000001464db30f);
    uVar16 = (ushort)(SUB161(auVar25 >> 7,0) & 1) | (ushort)(SUB161(auVar25 >> 0xf,0) & 1) << 1 |
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
    uVar13 = (uint)uVar16;
    if (uVar16 != 0) break;
LAB_140888480:
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
                  || (SUB161(auVar22 >> 0x27,0) & 1) != 0) || (SUB161(auVar22 >> 0x2f,0) & 1) != 0)
                || (SUB161(auVar22 >> 0x37,0) & 1) != 0) || (SUB161(auVar22 >> 0x3f,0) & 1) != 0) ||
              (SUB161(auVar22 >> 0x47,0) & 1) != 0) || (SUB161(auVar22 >> 0x4f,0) & 1) != 0) ||
            (SUB161(auVar22 >> 0x57,0) & 1) != 0) || (SUB161(auVar22 >> 0x5f,0) & 1) != 0) ||
          (SUB161(auVar22 >> 0x67,0) & 1) != 0) || (SUB161(auVar22 >> 0x6f,0) & 1) != 0) ||
        (SUB161(auVar22 >> 0x77,0) & 1) != 0) || auVar22[0xf] < '\0') {
LAB_14088851e:
      uVar12 = *local_c8;
      *local_c8 = uVar12 + 1;
      local_b8 = 1;
      uStack_b0 = _DAT_1465af888;
      local_a8 = uRam00000001465af890;
      uStack_90 = 8;
      local_88 = 0x38;
      uStack_70 = 0x1401a2430;
      local_68 = CONCAT53(local_68._3_5_,0x10100);
      uStack_a0 = 0;
      uStack_80 = CONCAT71(uStack_80._1_7_,2);
      func_0x000145bb92f0(local_e8[3],param_3,uVar12,&local_218,&local_b8);
      if (*(ulong *)(param_3 + 0x50) < uVar12 + 1) {
        local_3a = 1;
        func_0x00014009cba0();
      }
      if (*(int *)(*(long *)(param_3 + 0x48) + uVar12 * 0x130) != 2) {
        local_c0 = *(long *)(param_3 + 0x48) + uVar12 * 0x130;
        func_0x00014078bcd0();
        lVar9 = local_c0;
        if (*(long *)(local_c0 + 0xe8) != 0) {
          func_0x0001400021d0();
        }
        if (*(long *)(lVar9 + 200) != 0) {
          func_0x0001400021d0();
        }
      }
      func_0x00014632c29b();
      func_0x0001400661b0();
LAB_1408886e5:
      if (((*(ulong *)(param_3 + 0x218) <= uVar12) ||
          (uVar17 = *(ulong *)(*(long *)(param_3 + 0x210) + uVar12 * 8), uVar17 == 0)) ||
         (*(char *)(*(long *)(param_3 + 0x1e0) + 0x30 + ~uVar17 * 0x38) == '\0')) {
        local_208 = (undefined1  [16])0x0;
        local_218 = 0;
        uStack_210 = 4;
        local_1f8 = 8;
        uStack_1f0 = 0;
        local_1e8 = local_1e8 & 0xffffffffffff0000;
        uVar3 = *(undefined4 *)(param_3 + 0x5b0);
        func_0x000145bd75d0();
        local_b8 = uVar12;
        lVar9 = func_0x00014100b670();
        if (*(char *)(lVar9 + 0x30) == '\x01') {
          func_0x000145c016e0();
        }
        else {
          func_0x00014632c2a1();
          *(undefined4 *)(lVar9 + 0x28) = uVar3;
          *(undefined1 *)(lVar9 + 0x30) = 1;
        }
        *(undefined4 *)(lVar9 + 0x2c) = uVar3;
      }
      func_0x000140002200();
      puVar10 = (undefined8 *)func_0x0001400021c0();
      if (puVar10 != (undefined8 *)0x0) {
        *puVar10 = 0;
        *(undefined4 *)(puVar10 + 4) = 0;
        *(undefined1 *)((long)puVar10 + 0x24) = 0;
        func_0x000145b94850();
        func_0x000141035c90();
        func_0x000140118d20();
        local_58 = local_1b8;
        uStack_50 = uStack_1b0;
        local_68 = local_1c8;
        uStack_60 = uStack_1c0;
        local_78 = local_1d8;
        uStack_70 = uStack_1d0;
        local_88 = local_1e8;
        uStack_80 = uStack_1e0;
        local_98 = local_1f8;
        uStack_90 = uStack_1f0;
        local_a8 = local_208._0_8_;
        uStack_a0 = local_208._8_8_;
        local_b8 = local_218;
        uStack_b0 = uStack_210;
        func_0x000141035c90();
        func_0x0001413ae820();
        local_1b8 = local_58;
        uStack_1b0 = uStack_50;
        local_1c8 = local_68;
        uStack_1c0 = uStack_60;
        local_1d8 = local_78;
        uStack_1d0 = uStack_70;
        local_1e8 = local_88;
        uStack_1e0 = uStack_80;
        local_1f8 = local_98;
        uStack_1f0 = uStack_90;
        local_208._0_8_ = local_a8;
        local_208._8_8_ = uStack_a0;
        local_218 = local_b8;
        uStack_210 = uStack_b0;
        func_0x000141035c90();
        func_0x0001413ae920();
        local_58 = local_1b8;
        uStack_50 = uStack_1b0;
        local_68 = local_1c8;
        uStack_60 = uStack_1c0;
        local_78 = local_1d8;
        uStack_70 = uStack_1d0;
        local_88 = local_1e8;
        uStack_80 = uStack_1e0;
        local_98 = local_1f8;
        uStack_90 = uStack_1f0;
        local_a8 = local_208._0_8_;
        uStack_a0 = local_208._8_8_;
        local_b8 = local_218;
        uStack_b0 = uStack_210;
        func_0x000141035c90();
        func_0x0001413ae920();
        local_1b8 = local_58;
        uStack_1b0 = uStack_50;
        local_1c8 = local_68;
        uStack_1c0 = uStack_60;
        local_1d8 = local_78;
        uStack_1d0 = uStack_70;
        local_1e8 = local_88;
        uStack_1e0 = uStack_80;
        local_1f8 = local_98;
        uStack_1f0 = uStack_90;
        local_208._8_8_ = uStack_a0;
        local_208._0_8_ = local_a8;
        local_218 = local_b8;
        uStack_210 = uStack_b0;
        func_0x000140647250();
        return;
      }
      func_0x0001464d4011();
                    /* WARNING: Does not return */
      pcVar4 = (code *)invalidInstructionException();
      (*pcVar4)();
    }
    uVar17 = uVar17 + lVar14 + 0x10;
    lVar14 = lVar14 + 0x10;
  }
LAB_14088843a:
  uVar7 = 0;
  for (uVar8 = uVar13; (uVar8 & 1) == 0; uVar8 = uVar8 >> 1 | 0x80000000) {
    uVar7 = uVar7 + 1;
  }
  uVar18 = uVar7 + uVar17 & uVar12;
  lVar15 = lVar9 + uVar18 * -0x80;
  auVar26[0] = -(*(char *)(lVar15 + -0x80) == DAT_146528f70);
  auVar26[1] = -(*(char *)(lVar15 + -0x7f) == cRam0000000146528f71);
  auVar26[2] = -(*(char *)(lVar15 + -0x7e) == cRam0000000146528f72);
  auVar26[3] = -(*(char *)(lVar15 + -0x7d) == cRam0000000146528f73);
  auVar26[4] = -(*(char *)(lVar15 + -0x7c) == cRam0000000146528f74);
  auVar26[5] = -(*(char *)(lVar15 + -0x7b) == cRam0000000146528f75);
  auVar26[6] = -(*(char *)(lVar15 + -0x7a) == cRam0000000146528f76);
  auVar26[7] = -(*(char *)(lVar15 + -0x79) == cRam0000000146528f77);
  auVar26[8] = -(*(char *)(lVar15 + -0x78) == cRam0000000146528f78);
  auVar26[9] = -(*(char *)(lVar15 + -0x77) == cRam0000000146528f79);
  auVar26[10] = -(*(char *)(lVar15 + -0x76) == cRam0000000146528f7a);
  auVar26[0xb] = -(*(char *)(lVar15 + -0x75) == cRam0000000146528f7b);
  auVar26[0xc] = -(*(char *)(lVar15 + -0x74) == cRam0000000146528f7c);
  auVar26[0xd] = -(*(char *)(lVar15 + -0x73) == cRam0000000146528f7d);
  auVar26[0xe] = -(*(char *)(lVar15 + -0x72) == cRam0000000146528f7e);
  auVar26[0xf] = -(*(char *)(lVar15 + -0x71) == cRam0000000146528f7f);
  if ((ushort)((ushort)(SUB161(auVar26 >> 7,0) & 1) | (ushort)(SUB161(auVar26 >> 0xf,0) & 1) << 1 |
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
               (ushort)(SUB161(auVar26 >> 0x77,0) & 1) << 0xe | (ushort)(auVar26[0xf] >> 7) << 0xf)
      != 0xffff) goto code_r0x00014088846a;
  uVar12 = uVar18 - 0x10 & uVar12;
  pcVar1 = (char *)(lVar9 + uVar12);
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
  uVar5 = (ushort)(SUB161(auVar19 >> 7,0) & 1) | (ushort)(SUB161(auVar19 >> 0xf,0) & 1) << 1 |
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
  pcVar1 = (char *)(lVar9 + uVar18);
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
  uVar16 = 0xf;
  if (uVar5 != 0) {
    for (; uVar5 >> uVar16 == 0; uVar16 = uVar16 - 1) {
    }
  }
  sVar6 = 0;
  for (uVar13 = (ushort)((ushort)(SUB161(auVar20 >> 7,0) & 1) |
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
                        (ushort)(auVar20[0xf] >> 7) << 0xf) | 0x10000; (uVar13 & 1) == 0;
      uVar13 = uVar13 >> 1 | 0x80000000) {
    sVar6 = sVar6 + 1;
  }
  uVar11 = 0x80;
  if ((ushort)(sVar6 + (uVar16 ^ 0xf)) < 0x10) {
    *(long *)(param_3 + 0xf0) = *(long *)(param_3 + 0xf0) + 1;
    uVar11 = 0xff;
  }
  *(undefined1 *)(lVar9 + uVar18) = uVar11;
  *(undefined1 *)(lVar9 + 0x10 + uVar12) = uVar11;
  *(long *)(param_3 + 0xf8) = *(long *)(param_3 + 0xf8) + -1;
  if (*(ulong *)(lVar15 + -0x70) != 2) {
    uStack_1b0 = *(undefined8 *)(lVar15 + -8);
    uStack_1c0 = *(undefined8 *)(lVar15 + -0x18);
    local_1b8 = *(undefined8 *)(lVar15 + -0x10);
    uStack_1d0 = *(undefined8 *)(lVar15 + -0x28);
    local_1c8 = *(undefined8 *)(lVar15 + -0x20);
    uStack_210 = *(undefined8 *)(lVar15 + -0x68);
    local_208 = *(undefined1 (*) [16])(lVar15 + -0x60);
    local_1f8 = *(undefined8 *)(lVar15 + -0x50);
    uStack_1f0 = *(undefined8 *)(lVar15 + -0x48);
    local_1e8 = *(ulong *)(lVar15 + -0x40);
    uStack_1e0 = *(undefined8 *)(lVar15 + -0x38);
    local_1d8 = *(undefined8 *)(lVar15 + -0x30);
    local_218 = *(ulong *)(lVar15 + -0x70);
    uVar12 = func_0x000145b7db40(local_e8[3],param_3,local_e8,&local_218);
    if (local_e8[0] != 0) {
      func_0x0001400021d0();
    }
    goto LAB_1408886e5;
  }
  goto LAB_14088851e;
code_r0x00014088846a:
  uVar16 = (ushort)(uVar13 - 1) & (ushort)uVar13;
  uVar13 = CONCAT22((short)(uVar13 - 1 >> 0x10),uVar16);
  if (uVar16 == 0) goto LAB_140888480;
  goto LAB_14088843a;
}

