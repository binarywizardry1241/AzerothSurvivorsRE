/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

ulong entry(undefined8 param_1,undefined8 param_2,long *param_3,long param_4)

{
  char *pcVar1;
  long lVar2;
  ushort uVar3;
  short sVar4;
  uint uVar5;
  uint uVar6;
  long lVar7;
  ulong uVar8;
  long lVar9;
  ulong uVar10;
  long lVar11;
  undefined1 uVar12;
  uint uVar13;
  long lVar14;
  ushort uVar15;
  ulong uVar16;
  ulong uVar17;
  byte bVar18;
  undefined1 auVar19 [16];
  undefined1 auVar20 [16];
  undefined1 auVar21 [16];
  undefined1 auVar22 [16];
  undefined1 auVar23 [16];
  undefined1 auVar24 [16];
  long local_1e0;
  undefined8 local_1d8;
  undefined8 uStack_1d0;
  undefined8 local_1c8;
  undefined8 uStack_1c0;
  undefined8 local_1b8;
  undefined8 uStack_1b0;
  undefined8 local_1a8;
  undefined8 uStack_1a0;
  undefined8 local_198;
  undefined8 uStack_190;
  undefined8 local_188;
  undefined8 uStack_180;
  undefined8 local_178;
  undefined8 local_b0;
  undefined8 local_a8;
  undefined8 uStack_a0;
  undefined8 local_98;
  undefined8 local_88;
  undefined8 local_80;
  undefined1 local_78;
  undefined8 local_68;
  undefined2 local_60;
  undefined1 local_5e;
  long local_58;
  undefined1 local_49;
  undefined8 local_48;

  local_48 = 0xfffffffffffffffe;
  lVar9 = *(long *)(param_4 + 0x18);
  if (*(long *)(lVar9 + 0x50) == 0) {
    lVar7 = *param_3;
    uVar8 = param_3[1];
  }
  else {
    lVar7 = *param_3;
    uVar8 = param_3[1];
    lVar2 = *(long *)(lVar9 + 0x38);
    bVar18 = (byte)(uVar8 >> 0x39);
    auVar19 = ZEXT216(CONCAT11(bVar18,bVar18));
    auVar19 = pshuflw(auVar19,auVar19,0);
    lVar14 = 0;
    uVar10 = uVar8;
    while( true ) {
      uVar10 = uVar10 & *(ulong *)(lVar9 + 0x40);
      pcVar1 = (char *)(lVar2 + uVar10);
      auVar23[0] = -(*pcVar1 == auVar19[0]);
      auVar23[1] = -(pcVar1[1] == auVar19[1]);
      auVar23[2] = -(pcVar1[2] == auVar19[2]);
      auVar23[3] = -(pcVar1[3] == auVar19[3]);
      auVar23[4] = -(pcVar1[4] == auVar19[4]);
      auVar23[5] = -(pcVar1[5] == auVar19[5]);
      auVar23[6] = -(pcVar1[6] == auVar19[6]);
      auVar23[7] = -(pcVar1[7] == auVar19[7]);
      auVar23[8] = -(pcVar1[8] == auVar19[0]);
      auVar23[9] = -(pcVar1[9] == auVar19[1]);
      auVar23[10] = -(pcVar1[10] == auVar19[2]);
      auVar23[0xb] = -(pcVar1[0xb] == auVar19[3]);
      auVar23[0xc] = -(pcVar1[0xc] == auVar19[4]);
      auVar23[0xd] = -(pcVar1[0xd] == auVar19[5]);
      auVar23[0xe] = -(pcVar1[0xe] == auVar19[6]);
      auVar23[0xf] = -(pcVar1[0xf] == auVar19[7]);
      uVar15 = (ushort)(SUB161(auVar23 >> 7,0) & 1) | (ushort)(SUB161(auVar23 >> 0xf,0) & 1) << 1 |
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
      uVar13 = (uint)uVar15;
      while (uVar15 != 0) {
        uVar5 = 0;
        for (uVar6 = uVar13; (uVar6 & 1) == 0; uVar6 = uVar6 >> 1 | 0x80000000) {
          uVar5 = uVar5 + 1;
        }
        uVar16 = uVar5 + uVar10 & *(ulong *)(lVar9 + 0x40);
        if (*(long *)(lVar2 + -0x18 + uVar16 * -0x18) == lVar7 &&
            *(ulong *)(lVar2 + -0x10 + uVar16 * -0x18) == uVar8) {
          return *(ulong *)(lVar2 + uVar16 * -0x18 + -8);
        }
        uVar15 = (ushort)(uVar13 - 1) & (ushort)uVar13;
        uVar13 = CONCAT22((short)(uVar13 - 1 >> 0x10),uVar15);
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
      uVar10 = uVar10 + lVar14 + 0x10;
      lVar14 = lVar14 + 0x10;
    }
  }
  lVar2 = *(long *)(lVar9 + 0xa0);
  uVar10 = *(ulong *)(lVar9 + 0xa8);
  bVar18 = (byte)(uVar8 >> 0x39);
  auVar19 = ZEXT216(CONCAT11(bVar18,bVar18));
  auVar19 = pshuflw(auVar19,auVar19,0);
  lVar14 = 0;
  uVar16 = uVar8;
  do {
    uVar16 = uVar16 & uVar10;
    pcVar1 = (char *)(lVar2 + uVar16);
    auVar24[0] = -(*pcVar1 == auVar19[0]);
    auVar24[1] = -(pcVar1[1] == auVar19[1]);
    auVar24[2] = -(pcVar1[2] == auVar19[2]);
    auVar24[3] = -(pcVar1[3] == auVar19[3]);
    auVar24[4] = -(pcVar1[4] == auVar19[4]);
    auVar24[5] = -(pcVar1[5] == auVar19[5]);
    auVar24[6] = -(pcVar1[6] == auVar19[6]);
    auVar24[7] = -(pcVar1[7] == auVar19[7]);
    auVar24[8] = -(pcVar1[8] == auVar19[0]);
    auVar24[9] = -(pcVar1[9] == auVar19[1]);
    auVar24[10] = -(pcVar1[10] == auVar19[2]);
    auVar24[0xb] = -(pcVar1[0xb] == auVar19[3]);
    auVar24[0xc] = -(pcVar1[0xc] == auVar19[4]);
    auVar24[0xd] = -(pcVar1[0xd] == auVar19[5]);
    auVar24[0xe] = -(pcVar1[0xe] == auVar19[6]);
    auVar24[0xf] = -(pcVar1[0xf] == auVar19[7]);
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
    uVar13 = (uint)uVar15;
    while (uVar15 != 0) {
      uVar5 = 0;
      for (uVar6 = uVar13; (uVar6 & 1) == 0; uVar6 = uVar6 >> 1 | 0x80000000) {
        uVar5 = uVar5 + 1;
      }
      uVar17 = uVar5 + uVar16 & uVar10;
      lVar11 = lVar2 + uVar17 * -0x80;
      if (*(long *)(lVar11 + -0x80) == lVar7 && *(ulong *)(lVar11 + -0x78) == uVar8) {
        uVar10 = uVar17 - 0x10 & uVar10;
        pcVar1 = (char *)(lVar2 + uVar10);
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
        uVar3 = (ushort)(SUB161(auVar19 >> 7,0) & 1) | (ushort)(SUB161(auVar19 >> 0xf,0) & 1) << 1 |
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
        pcVar1 = (char *)(lVar2 + uVar17);
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
        uVar15 = 0xf;
        if (uVar3 != 0) {
          for (; uVar3 >> uVar15 == 0; uVar15 = uVar15 - 1) {
          }
        }
        sVar4 = 0;
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
          sVar4 = sVar4 + 1;
        }
        uVar12 = 0x80;
        if ((ushort)(sVar4 + (uVar15 ^ 0xf)) < 0x10) {
          *(long *)(lVar9 + 0xb0) = *(long *)(lVar9 + 0xb0) + 1;
          uVar12 = 0xff;
        }
        *(undefined1 *)(lVar2 + uVar17) = uVar12;
        *(undefined1 *)(lVar2 + 0x10 + uVar10) = uVar12;
        *(long *)(lVar9 + 0xb8) = *(long *)(lVar9 + 0xb8) + -1;
        local_1e0 = *(long *)(lVar11 + -0x70);
        if (local_1e0 != 2) {
          local_178 = *(undefined8 *)(lVar11 + -8);
          local_188 = *(undefined8 *)(lVar11 + -0x18);
          uStack_180 = *(undefined8 *)(lVar11 + -0x10);
          local_198 = *(undefined8 *)(lVar11 + -0x28);
          uStack_190 = *(undefined8 *)(lVar11 + -0x20);
          local_1d8 = *(undefined8 *)(lVar11 + -0x68);
          uStack_1d0 = *(undefined8 *)(lVar11 + -0x60);
          local_1c8 = *(undefined8 *)(lVar11 + -0x58);
          uStack_1c0 = *(undefined8 *)(lVar11 + -0x50);
          local_1b8 = *(undefined8 *)(lVar11 + -0x48);
          uStack_1b0 = *(undefined8 *)(lVar11 + -0x40);
          local_1a8 = *(undefined8 *)(lVar11 + -0x38);
          uStack_1a0 = *(undefined8 *)(lVar11 + -0x30);
          uVar8 = func_0x000144e08f20(lVar11,lVar9,param_4,&local_1e0);
          return uVar8;
        }
        goto LAB_1445619c5;
      }
      uVar15 = (ushort)(uVar13 - 1) & (ushort)uVar13;
      uVar13 = CONCAT22((short)(uVar13 - 1 >> 0x10),uVar15);
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
                  || (SUB161(auVar22 >> 0x27,0) & 1) != 0) || (SUB161(auVar22 >> 0x2f,0) & 1) != 0)
                || (SUB161(auVar22 >> 0x37,0) & 1) != 0) || (SUB161(auVar22 >> 0x3f,0) & 1) != 0) ||
              (SUB161(auVar22 >> 0x47,0) & 1) != 0) || (SUB161(auVar22 >> 0x4f,0) & 1) != 0) ||
            (SUB161(auVar22 >> 0x57,0) & 1) != 0) || (SUB161(auVar22 >> 0x5f,0) & 1) != 0) ||
          (SUB161(auVar22 >> 0x67,0) & 1) != 0) || (SUB161(auVar22 >> 0x6f,0) & 1) != 0) ||
        (SUB161(auVar22 >> 0x77,0) & 1) != 0) || auVar22[0xf] < '\0') {
LAB_1445619c5:
      uVar10 = **(ulong **)(param_4 + 0x20);
      uVar8 = uVar10 + 1;
      **(ulong **)(param_4 + 0x20) = uVar8;
      local_60 = 0x100;
      local_b0 = 1;
      local_a8 = _DAT_14692eb20;
      uStack_a0 = uRam000000014692eb28;
      local_88 = 8;
      local_80 = 0x80;
      local_68 = 0x140058d00;
      local_5e = 1;
      local_98 = 0;
      local_78 = 2;
      func_0x000144e444e0(uVar10,lVar9,uVar10,&local_1e0,&local_b0);
      if (*(ulong *)(lVar9 + 0x10) < uVar8) {
        local_49 = 1;
        func_0x000140089d90();
      }
      local_58 = *(long *)(lVar9 + 8) + uVar10 * 0x130;
      if (*(int *)(*(long *)(lVar9 + 8) + uVar10 * 0x130) != 2) {
        func_0x0001406e2b60();
      }
      func_0x000145bfa0e7();
      func_0x00014000f180();
      return uVar10;
    }
    uVar16 = uVar16 + lVar14 + 0x10;
    lVar14 = lVar14 + 0x10;
  } while( true );
}
