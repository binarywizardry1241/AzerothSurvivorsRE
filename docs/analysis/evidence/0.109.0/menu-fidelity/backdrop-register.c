/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(void)

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
  undefined4 *puVar10;
  long in_RCX;
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
  ulong local_330;
  ulong uStack_328;
  ulong *local_320;
  ulong uStack_318;
  ulong local_310;
  ulong uStack_308;
  ulong local_300;
  ulong uStack_2f8;
  ulong local_2f0;
  ulong uStack_2e8;
  ulong local_2e0;
  ulong uStack_2d8;
  ulong local_2d0;
  ulong uStack_2c8;
  undefined8 local_240;
  undefined4 local_c0;
  undefined1 local_bc;
  ulong local_b8;
  ulong uStack_b0;
  ulong *local_a8;
  ulong uStack_a0;
  ulong *local_98;
  ulong uStack_90;
  ulong local_88;
  ulong uStack_80;
  ulong local_78;
  ulong uStack_70;
  ulong local_68;
  ulong uStack_60;
  ulong local_58;
  ulong uStack_50;
  ulong *local_40;
  undefined8 local_38;

  local_38 = 0xfffffffffffffffe;
  uStack_a0 = in_RCX + 0x40;
  local_98 = (ulong *)(in_RCX + 0x5a8);
  local_b8 = 0;
  uStack_b0 = 8;
  local_a8 = (ulong *)0x0;
  if (*(long *)(in_RCX + 0x90) != 0) {
    uVar12 = 0x5ad1703cb9f182f4;
    lVar9 = *(long *)(in_RCX + 0x78);
    lVar14 = 0;
    while( true ) {
      uVar12 = uVar12 & *(ulong *)(in_RCX + 0x80);
      pcVar1 = (char *)(lVar9 + uVar12);
      auVar23[0] = -(*pcVar1 == DAT_145d9d660);
      auVar23[1] = -(pcVar1[1] == cRam0000000145d9d661);
      auVar23[2] = -(pcVar1[2] == cRam0000000145d9d662);
      auVar23[3] = -(pcVar1[3] == cRam0000000145d9d663);
      auVar23[4] = -(pcVar1[4] == cRam0000000145d9d664);
      auVar23[5] = -(pcVar1[5] == cRam0000000145d9d665);
      auVar23[6] = -(pcVar1[6] == cRam0000000145d9d666);
      auVar23[7] = -(pcVar1[7] == cRam0000000145d9d667);
      auVar23[8] = -(pcVar1[8] == cRam0000000145d9d668);
      auVar23[9] = -(pcVar1[9] == cRam0000000145d9d669);
      auVar23[10] = -(pcVar1[10] == cRam0000000145d9d66a);
      auVar23[0xb] = -(pcVar1[0xb] == cRam0000000145d9d66b);
      auVar23[0xc] = -(pcVar1[0xc] == cRam0000000145d9d66c);
      auVar23[0xd] = -(pcVar1[0xd] == cRam0000000145d9d66d);
      auVar23[0xe] = -(pcVar1[0xe] == cRam0000000145d9d66e);
      auVar23[0xf] = -(pcVar1[0xf] == cRam0000000145d9d66f);
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
        uVar17 = uVar7 + uVar12 & *(ulong *)(in_RCX + 0x80);
        pcVar2 = (char *)(lVar9 + -0x18 + uVar17 * -0x18);
        auVar24[0] = -(*pcVar2 == DAT_145d9db10);
        auVar24[1] = -(pcVar2[1] == cRam0000000145d9db11);
        auVar24[2] = -(pcVar2[2] == cRam0000000145d9db12);
        auVar24[3] = -(pcVar2[3] == cRam0000000145d9db13);
        auVar24[4] = -(pcVar2[4] == cRam0000000145d9db14);
        auVar24[5] = -(pcVar2[5] == cRam0000000145d9db15);
        auVar24[6] = -(pcVar2[6] == cRam0000000145d9db16);
        auVar24[7] = -(pcVar2[7] == cRam0000000145d9db17);
        auVar24[8] = -(pcVar2[8] == cRam0000000145d9db18);
        auVar24[9] = -(pcVar2[9] == cRam0000000145d9db19);
        auVar24[10] = -(pcVar2[10] == cRam0000000145d9db1a);
        auVar24[0xb] = -(pcVar2[0xb] == cRam0000000145d9db1b);
        auVar24[0xc] = -(pcVar2[0xc] == cRam0000000145d9db1c);
        auVar24[0xd] = -(pcVar2[0xd] == cRam0000000145d9db1d);
        auVar24[0xe] = -(pcVar2[0xe] == cRam0000000145d9db1e);
        auVar24[0xf] = -(pcVar2[0xf] == cRam0000000145d9db1f);
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
          goto LAB_1400704b1;
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
  lVar9 = *(long *)(in_RCX + 0xe0);
  uVar12 = *(ulong *)(in_RCX + 0xe8);
  uVar17 = 0x5ad1703cb9f182f4;
  lVar14 = 0;
  while( true ) {
    uVar17 = uVar17 & uVar12;
    pcVar1 = (char *)(lVar9 + uVar17);
    auVar25[0] = -(*pcVar1 == DAT_145d9d660);
    auVar25[1] = -(pcVar1[1] == cRam0000000145d9d661);
    auVar25[2] = -(pcVar1[2] == cRam0000000145d9d662);
    auVar25[3] = -(pcVar1[3] == cRam0000000145d9d663);
    auVar25[4] = -(pcVar1[4] == cRam0000000145d9d664);
    auVar25[5] = -(pcVar1[5] == cRam0000000145d9d665);
    auVar25[6] = -(pcVar1[6] == cRam0000000145d9d666);
    auVar25[7] = -(pcVar1[7] == cRam0000000145d9d667);
    auVar25[8] = -(pcVar1[8] == cRam0000000145d9d668);
    auVar25[9] = -(pcVar1[9] == cRam0000000145d9d669);
    auVar25[10] = -(pcVar1[10] == cRam0000000145d9d66a);
    auVar25[0xb] = -(pcVar1[0xb] == cRam0000000145d9d66b);
    auVar25[0xc] = -(pcVar1[0xc] == cRam0000000145d9d66c);
    auVar25[0xd] = -(pcVar1[0xd] == cRam0000000145d9d66d);
    auVar25[0xe] = -(pcVar1[0xe] == cRam0000000145d9d66e);
    auVar25[0xf] = -(pcVar1[0xf] == cRam0000000145d9d66f);
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
LAB_140070370:
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
LAB_14007041e:
      uVar12 = *local_98;
      *local_98 = uVar12 + 1;
      local_330 = 1;
      uStack_328 = _DAT_145dcd380;
      local_320 = (ulong *)uRam0000000145dcd388;
      uStack_308 = 8;
      local_300 = 0x20;
      uStack_2e8 = 0;
      local_2e0 = CONCAT53(local_2e0._3_5_,0x10100);
      uStack_318 = 0;
      uStack_2f8 = CONCAT71(uStack_2f8._1_7_,2);
      func_0x00014000f330(uStack_a0,in_RCX,uVar12,uStack_a0,&local_330);
      func_0x00014000f180();
      if (local_b8 != 0) {
LAB_14007049b:
        func_0x0001400021d0();
      }
LAB_1400704b1:
      if (((*(ulong *)(in_RCX + 0x218) <= uVar12) ||
          (uVar17 = *(ulong *)(*(long *)(in_RCX + 0x210) + uVar12 * 8), uVar17 == 0)) ||
         (*(char *)(*(long *)(in_RCX + 0x1e0) + 0x30 + ~uVar17 * 0x38) == '\0')) {
        local_330 = 0;
        uStack_318 = uStack_318 & 0xffffff0000000000;
        uVar3 = *(undefined4 *)(in_RCX + 0x5b0);
        func_0x000144e65ff0();
        local_b8 = uVar12;
        lVar9 = func_0x0001400e99b0();
        if (*(char *)(lVar9 + 0x30) == '\x01') {
          func_0x000144e7e940();
        }
        else {
          func_0x000145bfa0ed();
          *(undefined4 *)(lVar9 + 0x28) = uVar3;
          *(undefined1 *)(lVar9 + 0x30) = 1;
        }
        *(undefined4 *)(lVar9 + 0x2c) = uVar3;
      }
      func_0x000140002200();
      local_40 = (ulong *)func_0x0001400021c0();
      if (local_40 != (ulong *)0x0) {
        func_0x000140002200();
        puVar10 = (undefined4 *)func_0x0001400021c0();
        if (puVar10 == (undefined4 *)0x0) {
          func_0x000145d992a1();
        }
        else {
          *puVar10 = 0;
          *(undefined1 *)(puVar10 + 1) = 0;
          *(undefined1 *)(puVar10 + 2) = 2;
          func_0x000144e1fc30();
          local_240 = 0xffffffffffffffff;
          local_c0 = 0;
          local_bc = 0;
          func_0x000140002200();
          lVar9 = func_0x0001400021c0();
          if (lVar9 != 0) {
            func_0x000145bfa0e7(lVar9);
            func_0x000144e1fc30();
            local_40[0xc] = local_58;
            local_40[0xd] = uStack_50;
            local_40[10] = local_68;
            local_40[0xb] = uStack_60;
            local_40[8] = local_78;
            local_40[9] = uStack_70;
            local_40[6] = local_88;
            local_40[7] = uStack_80;
            local_40[4] = (ulong)local_98;
            local_40[5] = uStack_90;
            local_40[2] = (ulong)local_a8;
            local_40[3] = uStack_a0;
            *local_40 = local_b8;
            local_40[1] = uStack_b0;
            local_40[0xe] = local_330;
            local_40[0xf] = uStack_328;
            local_40[0x10] = (ulong)local_320;
            local_40[0x11] = uStack_318;
            local_40[0x12] = local_310;
            local_40[0x13] = uStack_308;
            local_40[0x14] = local_300;
            local_40[0x15] = uStack_2f8;
            local_40[0x16] = local_2f0;
            local_40[0x17] = uStack_2e8;
            local_40[0x18] = local_2e0;
            local_40[0x19] = uStack_2d8;
            local_40[0x1a] = local_2d0;
            local_40[0x1b] = uStack_2c8;
            uStack_328 = 2;
            local_320 = local_40;
            uStack_318 = 2;
            local_310 = 0;
            uStack_308 = 8;
            local_300 = 0;
            uStack_2f8 = 0;
            local_330 = 0xffffffffffffffff;
            func_0x000144e9bf10();
            local_58 = local_2d0;
            uStack_50 = uStack_2c8;
            local_68 = local_2e0;
            uStack_60 = uStack_2d8;
            local_78 = local_2f0;
            uStack_70 = uStack_2e8;
            local_88 = local_300;
            uStack_80 = uStack_2f8;
            local_98 = (ulong *)local_310;
            uStack_90 = uStack_308;
            local_a8 = local_320;
            uStack_a0 = uStack_318;
            local_b8 = local_330;
            uStack_b0 = uStack_328;
            func_0x0001400b4130();
            func_0x000145bb9990();
            if (local_330 != 0xffffffffffffffff) {
              if (local_330 != 0) {
                func_0x0001400021d0();
              }
              func_0x0001400b33c0();
            }
            return;
          }
          func_0x000145d992a1();
        }
                    /* WARNING: Does not return */
        pcVar4 = (code *)invalidInstructionException();
        (*pcVar4)();
      }
      func_0x000145d992a1();
                    /* WARNING: Does not return */
      pcVar4 = (code *)invalidInstructionException();
      (*pcVar4)();
    }
    uVar17 = uVar17 + lVar14 + 0x10;
    lVar14 = lVar14 + 0x10;
  }
LAB_14007032a:
  uVar7 = 0;
  for (uVar8 = uVar13; (uVar8 & 1) == 0; uVar8 = uVar8 >> 1 | 0x80000000) {
    uVar7 = uVar7 + 1;
  }
  uVar18 = uVar7 + uVar17 & uVar12;
  lVar15 = lVar9 + uVar18 * -0x80;
  auVar26[0] = -(*(char *)(lVar15 + -0x80) == DAT_145d9db10);
  auVar26[1] = -(*(char *)(lVar15 + -0x7f) == cRam0000000145d9db11);
  auVar26[2] = -(*(char *)(lVar15 + -0x7e) == cRam0000000145d9db12);
  auVar26[3] = -(*(char *)(lVar15 + -0x7d) == cRam0000000145d9db13);
  auVar26[4] = -(*(char *)(lVar15 + -0x7c) == cRam0000000145d9db14);
  auVar26[5] = -(*(char *)(lVar15 + -0x7b) == cRam0000000145d9db15);
  auVar26[6] = -(*(char *)(lVar15 + -0x7a) == cRam0000000145d9db16);
  auVar26[7] = -(*(char *)(lVar15 + -0x79) == cRam0000000145d9db17);
  auVar26[8] = -(*(char *)(lVar15 + -0x78) == cRam0000000145d9db18);
  auVar26[9] = -(*(char *)(lVar15 + -0x77) == cRam0000000145d9db19);
  auVar26[10] = -(*(char *)(lVar15 + -0x76) == cRam0000000145d9db1a);
  auVar26[0xb] = -(*(char *)(lVar15 + -0x75) == cRam0000000145d9db1b);
  auVar26[0xc] = -(*(char *)(lVar15 + -0x74) == cRam0000000145d9db1c);
  auVar26[0xd] = -(*(char *)(lVar15 + -0x73) == cRam0000000145d9db1d);
  auVar26[0xe] = -(*(char *)(lVar15 + -0x72) == cRam0000000145d9db1e);
  auVar26[0xf] = -(*(char *)(lVar15 + -0x71) == cRam0000000145d9db1f);
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
      != 0xffff) goto code_r0x00014007035a;
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
    *(long *)(in_RCX + 0xf0) = *(long *)(in_RCX + 0xf0) + 1;
    uVar11 = 0xff;
  }
  *(undefined1 *)(lVar9 + uVar18) = uVar11;
  *(undefined1 *)(lVar9 + 0x10 + uVar12) = uVar11;
  *(long *)(in_RCX + 0xf8) = *(long *)(in_RCX + 0xf8) + -1;
  local_330 = *(ulong *)(lVar15 + -0x70);
  if (local_330 == 2) goto LAB_14007041e;
  uStack_2c8 = *(ulong *)(lVar15 + -8);
  uStack_2d8 = *(ulong *)(lVar15 + -0x18);
  local_2d0 = *(ulong *)(lVar15 + -0x10);
  uStack_2e8 = *(ulong *)(lVar15 + -0x28);
  local_2e0 = *(ulong *)(lVar15 + -0x20);
  uStack_328 = *(ulong *)(lVar15 + -0x68);
  local_320 = *(ulong **)(lVar15 + -0x60);
  uStack_318 = *(ulong *)(lVar15 + -0x58);
  local_310 = *(ulong *)(lVar15 + -0x50);
  uStack_308 = *(ulong *)(lVar15 + -0x48);
  local_300 = *(ulong *)(lVar15 + -0x40);
  uStack_2f8 = *(ulong *)(lVar15 + -0x38);
  local_2f0 = *(ulong *)(lVar15 + -0x30);
  uVar12 = func_0x000144e08f20(uStack_a0,in_RCX,&local_b8,&local_330);
  if (local_b8 == 0) goto LAB_1400704b1;
  goto LAB_14007049b;
code_r0x00014007035a:
  uVar16 = (ushort)(uVar13 - 1) & (ushort)uVar13;
  uVar13 = CONCAT22((short)(uVar13 - 1 >> 0x10),uVar16);
  if (uVar16 == 0) goto LAB_140070370;
  goto LAB_14007032a;
}
