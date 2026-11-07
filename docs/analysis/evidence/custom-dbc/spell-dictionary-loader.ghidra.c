/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

long entry(void)

{
  char *pcVar1;
  uint uVar2;
  uint uVar3;
  int *piVar4;
  long *plVar5;
  ulong uVar6;
  uint in_ECX;
  int *piVar7;
  int *piVar8;
  long lVar9;
  long lVar10;
  uint uVar11;
  ushort uVar12;
  ulong uVar13;
  byte bVar14;
  undefined1 auVar15 [16];
  undefined1 auVar16 [16];
  undefined1 auVar17 [16];
  undefined4 in_XMM6_Da;
  undefined4 uVar18;
  undefined4 uVar19;
  undefined4 uVar20;
  undefined4 uVar21;
  undefined4 in_XMM7_Da;
  undefined4 uVar22;
  undefined4 uVar23;
  undefined4 uVar24;
  undefined4 uVar25;
  undefined8 local_198;
  long lStack_190;
  undefined8 local_188;
  undefined8 uStack_180;
  long local_178;
  long lStack_170;
  int *local_168;
  int *local_160;
  int *local_158;
  long local_150;
  uint local_148;
  int local_144;
  undefined8 local_140;
  int *local_138;
  int *local_130;
  int *local_128;
  long local_120;
  uint local_118;
  int local_114;
  long local_110;
  int *local_108;
  int *local_100;
  int *piStack_f8;
  long local_f0;
  int **local_e8;
  int *piStack_e0;
  int *piStack_d8;
  long local_d0;
  long lStack_c8;
  long lStack_c0;
  uint local_ac;
  int *local_a8;
  int *local_a0;
  undefined8 local_98;
  undefined8 uStack_90;
  undefined8 local_88;
  undefined8 uStack_80;
  undefined8 local_78;
  long lStack_70;
  int *local_60;
  int *local_58;
  undefined8 local_50;
  undefined4 local_48;
  undefined4 local_38;

  local_50 = 0xfffffffffffffffe;
  uVar6 = (ulong)in_ECX;
  local_ac = in_ECX;
  local_48 = in_XMM6_Da;
  local_38 = in_XMM7_Da;
  if (_DAT_148004638 == 0) {
LAB_1458c076d:
    if (_DAT_148004638 != 0) {
      return 0;
    }
    if (_DAT_148004620 == 0) {
      return 0;
    }
    uVar6 = func_0x000140d8aa00();
    bVar14 = (byte)(uVar6 >> 0x39);
    auVar15 = ZEXT216(CONCAT11(bVar14,bVar14));
    auVar15 = pshuflw(auVar15,auVar15,0);
    lVar9 = 0;
    lVar10 = 0;
    do {
      uVar6 = uVar6 & _DAT_148004610;
      pcVar1 = (char *)(_DAT_148004608 + uVar6);
      auVar17[0] = -(*pcVar1 == auVar15[0]);
      auVar17[1] = -(pcVar1[1] == auVar15[1]);
      auVar17[2] = -(pcVar1[2] == auVar15[2]);
      auVar17[3] = -(pcVar1[3] == auVar15[3]);
      auVar17[4] = -(pcVar1[4] == auVar15[4]);
      auVar17[5] = -(pcVar1[5] == auVar15[5]);
      auVar17[6] = -(pcVar1[6] == auVar15[6]);
      auVar17[7] = -(pcVar1[7] == auVar15[7]);
      auVar17[8] = -(pcVar1[8] == auVar15[0]);
      auVar17[9] = -(pcVar1[9] == auVar15[1]);
      auVar17[10] = -(pcVar1[10] == auVar15[2]);
      auVar17[0xb] = -(pcVar1[0xb] == auVar15[3]);
      auVar17[0xc] = -(pcVar1[0xc] == auVar15[4]);
      auVar17[0xd] = -(pcVar1[0xd] == auVar15[5]);
      auVar17[0xe] = -(pcVar1[0xe] == auVar15[6]);
      auVar17[0xf] = -(pcVar1[0xf] == auVar15[7]);
      uVar12 = (ushort)(SUB161(auVar17 >> 7,0) & 1) | (ushort)(SUB161(auVar17 >> 0xf,0) & 1) << 1 |
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
      uVar11 = (uint)uVar12;
      while (uVar12 != 0) {
        uVar2 = 0;
        for (uVar3 = uVar11; (uVar3 & 1) == 0; uVar3 = uVar3 >> 1 | 0x80000000) {
          uVar2 = uVar2 + 1;
        }
        uVar13 = uVar2 + uVar6 & _DAT_148004610;
        if (in_ECX == *(uint *)(_DAT_148004608 + -0x48 + uVar13 * -0x48)) {
          lVar9 = _DAT_148004608 + uVar13 * -0x48;
          goto LAB_1458c082d;
        }
        uVar12 = (ushort)(uVar11 - 1) & (ushort)uVar11;
        uVar11 = CONCAT22((short)(uVar11 - 1 >> 0x10),uVar12);
      }
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
      if ((((((((((((((((SUB161(auVar16 >> 7,0) & 1) != 0 || (SUB161(auVar16 >> 0xf,0) & 1) != 0) ||
                      (SUB161(auVar16 >> 0x17,0) & 1) != 0) || (SUB161(auVar16 >> 0x1f,0) & 1) != 0)
                    || (SUB161(auVar16 >> 0x27,0) & 1) != 0) || (SUB161(auVar16 >> 0x2f,0) & 1) != 0
                   ) || (SUB161(auVar16 >> 0x37,0) & 1) != 0) ||
                 (SUB161(auVar16 >> 0x3f,0) & 1) != 0) || (SUB161(auVar16 >> 0x47,0) & 1) != 0) ||
               (SUB161(auVar16 >> 0x4f,0) & 1) != 0) || (SUB161(auVar16 >> 0x57,0) & 1) != 0) ||
             (SUB161(auVar16 >> 0x5f,0) & 1) != 0) || (SUB161(auVar16 >> 0x67,0) & 1) != 0) ||
           (SUB161(auVar16 >> 0x6f,0) & 1) != 0) || (SUB161(auVar16 >> 0x77,0) & 1) != 0) ||
          auVar16[0xf] < '\0') {
LAB_1458c082d:
        if (lVar9 != 0) {
          return lVar9 + -0x40;
        }
        return 0;
      }
      uVar6 = uVar6 + lVar10 + 0x10;
      lVar10 = lVar10 + 0x10;
    } while( true );
  }
  func_0x000145a36150();
  local_58 = local_98;
  local_60 = uStack_90;
  if (local_98 == (int *)0xffffffffffffffff) {
    local_58 = (int *)0x0;
    local_60 = (int *)0x1;
  }
  func_0x000145aa6bf0();
  if (local_e8 == (int **)0xffffffffffffffff) {
    func_0x000145b6c710();
    piVar4 = local_58;
    goto joined_r0x0001458c0736;
  }
  local_f0 = local_d0;
  local_100 = piStack_e0;
  piStack_f8 = piStack_d8;
  local_108 = (int *)local_e8;
  if (local_58 != (int *)0x0) {
    func_0x0001400021d0();
  }
  func_0x000145aa7f80();
  local_a0 = (int *)local_e8;
  if (local_98 == (int *)0xffffffffffffffff) {
    func_0x000145b6c710();
  }
  else {
    if ((local_88 < (int *)0x14) || (*uStack_90 != 0x43424457)) {
      local_60 = uStack_90;
      local_58 = local_98;
      uStack_90 = (int *)func_0x000145d4cf00();
    }
    else {
      uVar11 = uStack_90[1];
      uVar13 = (ulong)(uStack_90[3] * uVar11);
      if ((int *)((uint)uStack_90[4] + uVar13 + 0x14) <= local_88) {
        local_120 = uVar13 + 0x14;
        local_114 = uStack_90[2];
        local_78 = CONCAT44(local_114,uVar11);
        lStack_70 = CONCAT44(lStack_70._4_4_,uStack_90[3]);
        local_130 = uStack_90;
        local_128 = local_88;
        local_110 = lStack_70;
        local_138 = local_98;
        local_118 = uVar11;
        uStack_80 = local_120;
        func_0x000145aa7f80();
        if (local_98 == (int *)0xffffffffffffffff) {
          func_0x000145b6c710();
        }
        else {
          if ((local_88 < (int *)0x14) || (*uStack_90 != 0x43424457)) {
            local_60 = uStack_90;
            local_58 = local_98;
            uStack_90 = (int *)func_0x000145d4cf00();
          }
          else {
            local_148 = uStack_90[1];
            uVar13 = (ulong)(uStack_90[3] * local_148);
            if ((int *)((uint)uStack_90[4] + uVar13 + 0x14) <= local_88) {
              local_150 = uVar13 + 0x14;
              local_144 = uStack_90[2];
              local_78 = CONCAT44(local_144,local_148);
              lStack_70 = CONCAT44(lStack_70._4_4_,uStack_90[3]);
              local_160 = uStack_90;
              local_158 = local_88;
              local_140 = lStack_70;
              local_168 = local_98;
              piStack_e0 = (int *)((ulong)local_148 << 0x20);
              local_e8 = &local_168;
              uStack_80 = local_150;
              plVar5 = (long *)func_0x000143d98020();
              local_78 = *plVar5;
              lStack_70 = plVar5[1];
              *plVar5 = *plVar5 + 1;
              local_88 = (int *)CONCAT44(uRam0000000146bb3384,_DAT_146bb3380);
              uStack_80 = CONCAT44(uRam0000000146bb338c,uRam0000000146bb3388);
              local_98 = (int *)CONCAT44(uRam0000000146bb3374,_DAT_146bb3370);
              uStack_90 = (int *)CONCAT44(uRam0000000146bb337c,uRam0000000146bb3378);
              uVar18 = _DAT_146bb3380;
              uVar19 = uRam0000000146bb3384;
              uVar20 = uRam0000000146bb3388;
              uVar21 = uRam0000000146bb338c;
              uVar22 = _DAT_146bb3370;
              uVar23 = uRam0000000146bb3374;
              uVar24 = uRam0000000146bb3378;
              uVar25 = uRam0000000146bb337c;
              func_0x0001458b9140();
              local_178 = local_78;
              lStack_170 = lStack_70;
              local_188 = local_88;
              uStack_180 = uStack_80;
              local_198 = local_98;
              lStack_190 = (long)uStack_90;
              uVar11 = local_118;
              plVar5 = (long *)func_0x000143d98020();
              local_78 = *plVar5;
              lStack_70 = plVar5[1];
              *plVar5 = *plVar5 + 1;
              local_88 = (int *)CONCAT44(uVar19,uVar18);
              uStack_80 = CONCAT44(uVar21,uVar20);
              local_98 = (int *)CONCAT44(uVar23,uVar22);
              uStack_90 = (int *)CONCAT44(uVar25,uVar24);
              if (uVar11 != 0) {
                func_0x000145d4da10();
              }
              piStack_e0 = (int *)&local_198;
              piStack_d8 = (int *)((ulong)uVar11 << 0x20);
              local_e8 = &local_138;
              func_0x0001459b2e30();
              lStack_c8 = local_78;
              lStack_c0 = lStack_70;
              piStack_d8 = local_88;
              local_d0 = uStack_80;
              local_e8 = (int **)local_98;
              piStack_e0 = uStack_90;
              if (_DAT_148004638 != 0) {
                func_0x000145d4d231();
              }
              if (local_e8 != (int **)0x0) {
                lStack_70 = lStack_c0;
                uStack_80 = local_d0;
                local_78 = lStack_c8;
                uStack_90 = piStack_e0;
                local_88 = piStack_d8;
                local_98 = (int *)local_e8;
                func_0x0001405d2cc0();
              }
              if ((lStack_190 != 0) &&
                 (lStack_190 + (lStack_190 * 0x18 + 0x27U & 0xfffffffffffffff0) != -0x11)) {
                func_0x0001400021d0();
              }
              if (local_168 != (int *)0x0) {
                func_0x0001400021d0();
              }
              if (local_138 != (int *)0x0) {
                func_0x0001400021d0();
              }
              piVar4 = piStack_f8;
              in_ECX = (uint)uVar6;
              local_60 = piStack_f8;
              if (piStack_f8 != (int *)0x0) {
                piVar7 = (int *)0x1;
                local_a8 = local_100;
                piVar8 = local_100;
                do {
                  plVar5 = *(long **)piVar8;
                  LOCK();
                  *plVar5 = *plVar5 + -1;
                  UNLOCK();
                  local_58 = piVar7;
                  if (*plVar5 == 0) {
                    func_0x000145a41300();
                  }
                  in_ECX = (uint)uVar6;
                  piVar7 = (int *)((long)local_58 + 1);
                  piVar8 = piVar8 + 2;
                } while (local_58 != piVar4);
              }
              if (local_a0 != (int *)0x0) {
                func_0x0001400021d0();
              }
              goto LAB_1458c076d;
            }
            local_60 = uStack_90;
            local_58 = local_98;
            uStack_90 = (int *)func_0x000145d4cf00();
          }
          local_98 = (int *)0xffffffffffffffff;
          if (local_58 != (int *)0x0) {
            func_0x0001400021d0();
          }
          func_0x000145b6c710();
        }
        if (local_138 != (int *)0x0) {
          func_0x0001400021d0();
        }
        goto LAB_1458c0869;
      }
      local_60 = uStack_90;
      local_58 = local_98;
      uStack_90 = (int *)func_0x000145d4cf00();
    }
    local_98 = (int *)0xffffffffffffffff;
    if (local_58 != (int *)0x0) {
      func_0x0001400021d0();
    }
    func_0x000145b6c710();
  }
LAB_1458c0869:
  local_60 = piStack_f8;
  piVar4 = local_a0;
  if (piStack_f8 != (int *)0x0) {
    lVar9 = -(long)piStack_f8;
    piVar7 = (int *)0x1;
    local_a8 = local_100;
    piVar8 = local_100;
    do {
      plVar5 = *(long **)piVar8;
      LOCK();
      *plVar5 = *plVar5 + -1;
      UNLOCK();
      local_58 = piVar7;
      if (*plVar5 == 0) {
        func_0x000145a41300();
      }
      piVar7 = (int *)((long)local_58 + 1);
      piVar8 = piVar8 + 2;
      piVar4 = local_a0;
    } while (lVar9 + (long)local_58 != 0);
  }
joined_r0x0001458c0736:
  if (piVar4 != (int *)0x0) {
    func_0x0001400021d0();
  }
  return 0;
}
