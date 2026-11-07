/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_1401982b0(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 param_4,
                  long *param_5,long *param_6)

{
  double dVar1;
  char cVar2;
  int iVar3;
  undefined4 uVar4;
  long lVar5;
  long lVar6;
  long lVar7;
  long lVar8;
  int *piVar9;
  undefined8 uVar10;
  undefined1 auVar11 [16];
  uint uVar12;
  float *pfVar13;
  long lVar14;
  long lVar15;
  ulong uVar16;
  long lVar17;
  undefined8 uVar18;
  ulong uVar19;
  uint uVar20;
  uint *puVar21;
  long lVar22;
  undefined8 *puVar23;
  uint *puVar24;
  long lVar25;
  long lVar26;
  int *piVar27;
  undefined8 uVar28;
  long lVar29;
  uint uVar30;
  uint uVar31;
  int iVar32;
  uint uVar33;
  int iVar34;
  float fVar35;
  float fVar36;
  float fVar37;
  undefined1 auVar38 [16];
  undefined1 auVar39 [16];
  undefined1 auVar40 [16];
  undefined1 auVar42 [16];
  undefined1 auVar43 [16];
  undefined1 auVar44 [16];
  float fVar45;
  undefined1 auVar46 [16];
  undefined4 in_XMM6_Da;
  float fVar47;
  undefined4 in_XMM7_Da;
  float fVar48;
  float fVar49;
  float fVar50;
  float fVar51;
  float fVar52;
  undefined4 uVar53;
  undefined4 uVar54;
  undefined4 uVar55;
  undefined4 uVar56;
  undefined4 uVar57;
  undefined4 uVar58;
  float fVar59;
  undefined4 uVar60;
  undefined4 uVar61;
  undefined4 uVar62;
  float fVar63;
  float fVar64;
  long *in_stack_00000028;
  undefined8 *in_stack_00000030;
  undefined8 *in_stack_00000040;
  long local_190;
  long local_188;
  long local_180;
  long local_178;
  undefined4 local_160;
  long local_158;
  undefined8 local_148;
  undefined4 *local_140;
  long local_108;
  undefined1 (*local_100) [16];
  ushort local_f0;
  long local_e8;
  long local_e0;
  long local_d8;
  undefined1 (*local_d0) [16];
  undefined4 local_c8;
  undefined4 local_b8;
  undefined1 auVar41 [16];

  lVar25 = *param_3;
  lVar17 = param_3[1];
  lVar14 = param_3[2];
  iVar32 = *(int *)((long)param_3 + 0x14);
  lVar5 = *param_5;
  lVar6 = param_5[1];
  lVar22 = param_5[2];
  iVar3 = *(int *)((long)param_5 + 0x14);
  lVar26 = *param_6;
  lVar29 = param_6[1];
  lVar7 = *in_stack_00000028;
  lVar8 = in_stack_00000028[1];
  uVar4 = *(undefined4 *)((long)in_stack_00000028 + 0x14);
  piVar9 = (int *)*in_stack_00000040;
  local_140 = (undefined4 *)in_stack_00000040[2];
  local_160 = *(undefined4 *)((long)in_stack_00000040 + 0x1c);
  local_c8 = in_XMM6_Da;
  local_b8 = in_XMM7_Da;
  FUN_140180b10(local_160,local_140,*in_stack_00000030,&local_108);
  if ((char)local_108 != '\x01') {
    local_d0 = local_100;
    if ((((*(int *)*local_100 != 1) || (*(double *)(*local_100 + 8) < 0.0)) ||
        (dVar1 = *(double *)local_100[1], dVar1 < 0.0)) ||
       (((double)*(uint *)local_100[0xc] <= *(double *)(*local_100 + 8) ||
        ((double)*(uint *)(local_100[0xc] + 4) <= dVar1)))) {
      func_0x00014361df00();
      if (local_e8 == 0) {
        return;
      }
      uVar20 = (uint)local_f0;
      if (local_f0 == 0) {
        do {
          auVar39 = *local_100;
          local_108 = local_108 + -0x880;
          local_100 = local_100 + 1;
          uVar20 = (ushort)((ushort)(SUB161(auVar39 >> 7,0) & 1) |
                            (ushort)(SUB161(auVar39 >> 0xf,0) & 1) << 1 |
                            (ushort)(SUB161(auVar39 >> 0x17,0) & 1) << 2 |
                            (ushort)(SUB161(auVar39 >> 0x1f,0) & 1) << 3 |
                            (ushort)(SUB161(auVar39 >> 0x27,0) & 1) << 4 |
                            (ushort)(SUB161(auVar39 >> 0x2f,0) & 1) << 5 |
                            (ushort)(SUB161(auVar39 >> 0x37,0) & 1) << 6 |
                            (ushort)(SUB161(auVar39 >> 0x3f,0) & 1) << 7 |
                            (ushort)(SUB161(auVar39 >> 0x47,0) & 1) << 8 |
                            (ushort)(SUB161(auVar39 >> 0x4f,0) & 1) << 9 |
                            (ushort)(SUB161(auVar39 >> 0x57,0) & 1) << 10 |
                            (ushort)(SUB161(auVar39 >> 0x5f,0) & 1) << 0xb |
                            (ushort)(SUB161(auVar39 >> 0x67,0) & 1) << 0xc |
                            (ushort)(SUB161(auVar39 >> 0x6f,0) & 1) << 0xd |
                            (ushort)(SUB161(auVar39 >> 0x77,0) & 1) << 0xe |
                           (ushort)(byte)(auVar39[0xf] >> 7) << 0xf) ^ 0xffff;
        } while (uVar20 == 0);
      }
      local_f0 = (ushort)uVar20;
      uVar12 = 0;
      for (; (uVar20 & 1) == 0; uVar20 = uVar20 >> 1 | 0x80000000) {
        uVar12 = uVar12 + 1;
      }
      local_f0 = local_f0 - 1 & local_f0;
      local_e8 = local_e8 + -1;
      fVar47 = *(float *)(local_108 + -4 + ((ulong)uVar12 * -0x80 - (ulong)(uVar12 << 3)));
    }
    else {
      pfVar13 = (float *)(local_100[0xc] + 8);
      if (local_100[0xb][8] != '\0') {
        pfVar13 = (float *)(local_100[0xb] + 0xc);
      }
      fVar47 = (float)dVar1 / *pfVar13;
    }
    puVar21 = *(uint **)(lVar25 + 0xf8);
    puVar24 = puVar21 + *(long *)(lVar25 + 0x100);
    uVar12 = iVar32 - (int)lVar14;
    uVar20 = 0xc233b000;
    if (uVar12 < 0xc233b000) {
      uVar20 = uVar12;
    }
    if (*(char *)(lVar25 + 0x108) == '\0') {
      lVar14 = 8;
      uVar12 = 0;
      uVar18 = 0;
      lVar15 = 0;
      local_190 = 0;
      local_188 = 0;
      do {
        do {
          do {
            do {
              if (uVar12 == (uint)uVar18) {
                if (puVar21 == puVar24) goto LAB_140198a8f;
                uVar12 = *puVar21;
                puVar21 = puVar21 + 1;
                if (*(long *)(*(long *)(lVar17 + 0x108) + 0x58 + (ulong)uVar12 * 0xa0) == 0) {
                  do {
                    if (puVar21 == puVar24) goto LAB_140198a8f;
                    uVar12 = *puVar21;
                    puVar21 = puVar21 + 1;
                  } while (*(long *)(*(long *)(lVar17 + 0x108) + 0x58 + (ulong)uVar12 * 0xa0) == 0);
                  lVar14 = *(long *)(lVar17 + 0x108) + (ulong)uVar12 * 0xa0;
                }
                else {
                  lVar14 = *(long *)(lVar17 + 0x108) + (ulong)uVar12 * 0xa0;
                }
                puVar23 = (undefined8 *)(lVar14 + 0x58);
                lVar15 = *(long *)(lVar17 + 0x1a8) + (ulong)*(uint *)(lVar14 + 0x94) * 0x48;
                uVar19 = *(ulong *)(*(long *)(lVar17 + 0x1a8) + 0x40 +
                                   (ulong)*(uint *)(lVar14 + 0x94) * 0x48);
                if ((*(ulong *)(lVar25 + 0x110) < uVar19) &&
                   (uVar16 = *(ulong *)(*(long *)(lVar15 + 0x38) + *(ulong *)(lVar25 + 0x110) * 8),
                   uVar16 != 0)) {
                  local_188 = *(long *)(*(long *)(lVar15 + 0x18) + 0x10 + ~uVar16 * 0x30);
                  uVar16 = *(ulong *)(lVar25 + 0x118);
                  if (uVar19 <= uVar16) goto LAB_140198770;
LAB_1401988a9:
                  uVar19 = *(ulong *)(*(long *)(lVar15 + 0x38) + uVar16 * 8);
                  if (uVar19 == 0) goto LAB_140198770;
                  local_190 = *(long *)(*(long *)(lVar15 + 0x18) + 0x10 + ~uVar19 * 0x30);
                }
                else {
                  local_188 = 0;
                  uVar16 = *(ulong *)(lVar25 + 0x118);
                  if (uVar16 < uVar19) goto LAB_1401988a9;
LAB_140198770:
                  local_190 = 0;
                }
                lVar15 = func_0x000144e4f270();
                lVar14 = *(long *)(lVar14 + 0x50);
                uVar18 = *puVar23;
                uVar12 = 0;
              }
              uVar19 = (ulong)uVar12;
              uVar12 = uVar12 + 1;
              uVar19 = (ulong)~*(uint *)(lVar14 + 8 + uVar19 * 0x10);
            } while (uVar20 <= (uint)(iVar32 - *(int *)(lVar15 + uVar19 * 4)));
            if ((char *)(local_188 + uVar19) == (char *)0x0) goto LAB_140198a8f;
          } while (*(char *)(local_188 + uVar19) != '\0');
          local_148 = *(undefined8 *)(local_190 + uVar19 * 8);
          piVar27 = (int *)((ulong)~(uint)local_148 * 0x18 + *(long *)(lVar29 + 8));
          if (*(ulong *)(lVar29 + 0x10) <= (ulong)~(uint)local_148) {
            piVar27 = (int *)&DAT_145de5448;
          }
        } while ((piVar27[4] != (int)((ulong)local_148 >> 0x20)) || (*piVar27 == 0));
        uVar19 = *(ulong *)(piVar27 + 1);
      } while ((*(ulong *)(lVar26 + 0x38) <= uVar19 >> 0x20) ||
              ((*(ulong *)(*(long *)(lVar26 + 0x28) + (uVar19 >> 0x26) * 8) >>
                (uVar19 >> 0x20 & 0x3f) & 1) == 0));
    }
    else {
      uVar12 = 0;
      uVar18 = 0;
      lVar14 = 0;
      local_190 = 0;
      local_188 = 0;
      do {
        do {
          do {
            do {
              if (uVar12 == (uint)uVar18) {
                if (puVar21 == puVar24) {
LAB_140198a8f:
                  puVar21 = *(uint **)(lVar5 + 0xf8);
                  puVar24 = puVar21 + *(long *)(lVar5 + 0x100);
                  cVar2 = *(char *)(lVar5 + 0x108);
                  uVar12 = iVar3 - (int)lVar22;
                  uVar20 = 0xc233b000;
                  if (uVar12 < 0xc233b000) {
                    uVar20 = uVar12;
                  }
                  lVar17 = 0;
                  local_158 = 8;
                  fVar48 = 0.0;
                  uVar56 = 0;
                  uVar57 = 0;
                  uVar58 = 0;
                  uVar60 = 0;
                  uVar61 = 0;
                  uVar62 = 0;
                  lVar25 = 8;
                  local_180 = 0;
                  local_188 = 0;
                  local_190 = 0;
                  local_178 = 0;
                  uVar18 = 0;
                  uVar12 = 0;
                  fVar49 = fRam0000000145dcd054;
                  fVar50 = fRam0000000145dcd05c;
                  fVar51 = _DAT_145dcce60;
                  fVar52 = fRam0000000145dcce64;
                  uVar53 = uRam0000000145dcce68;
                  uVar54 = uRam0000000145dcce6c;
                  uVar55 = _DAT_145dd4ac8;
                  fVar59 = _DAT_145d9d2a0;
                  fVar63 = _DAT_145de2518;
                  fVar64 = _DAT_145de4d54;
                  do {
                    if (cVar2 == '\0') {
                      do {
                        if (uVar12 == (uint)uVar18) {
                          if (puVar21 == puVar24) {
                            return;
                          }
                          uVar12 = *puVar21;
                          puVar21 = puVar21 + 1;
                          if (*(long *)(*(long *)(lVar6 + 0x108) + 0x58 + (ulong)uVar12 * 0xa0) == 0
                             ) {
                            do {
                              if (puVar21 == puVar24) {
                                return;
                              }
                              uVar12 = *puVar21;
                              puVar21 = puVar21 + 1;
                            } while (*(long *)(*(long *)(lVar6 + 0x108) + 0x58 +
                                              (ulong)uVar12 * 0xa0) == 0);
                            lVar26 = *(long *)(lVar6 + 0x108) + (ulong)uVar12 * 0xa0;
                          }
                          else {
                            lVar26 = *(long *)(lVar6 + 0x108) + (ulong)uVar12 * 0xa0;
                          }
                          lVar25 = *(long *)(lVar6 + 0x1a8) + (ulong)*(uint *)(lVar26 + 0x94) * 0x48
                          ;
                          uVar19 = *(ulong *)(*(long *)(lVar6 + 0x1a8) + 0x40 +
                                             (ulong)*(uint *)(lVar26 + 0x94) * 0x48);
                          if ((*(ulong *)(lVar5 + 0x110) < uVar19) &&
                             (uVar16 = *(ulong *)(*(long *)(lVar25 + 0x38) +
                                                 *(ulong *)(lVar5 + 0x110) * 8), uVar16 != 0)) {
                            local_180 = *(long *)(*(long *)(lVar25 + 0x18) + 0x10 + ~uVar16 * 0x30);
                            uVar16 = *(ulong *)(lVar5 + 0x118);
                            if (uVar19 <= uVar16) goto LAB_140198e90;
LAB_140198e56:
                            uVar16 = *(ulong *)(*(long *)(lVar25 + 0x38) + uVar16 * 8);
                            if (uVar16 == 0) goto LAB_140198e90;
                            local_188 = *(long *)(*(long *)(lVar25 + 0x18) + 0x10 + ~uVar16 * 0x30);
                            uVar16 = *(ulong *)(lVar5 + 0x120);
                            if (uVar16 < uVar19) goto LAB_140198ea6;
LAB_140198ee0:
                            local_190 = 0;
                            uVar16 = *(ulong *)(lVar5 + 0x128);
                            if (uVar19 <= uVar16) goto LAB_140198f20;
LAB_140198ef6:
                            uVar19 = *(ulong *)(*(long *)(lVar25 + 0x38) + uVar16 * 8);
                            if (uVar19 == 0) goto LAB_140198f20;
                            local_178 = *(long *)(*(long *)(lVar25 + 0x18) + 0x10 + ~uVar19 * 0x30);
                          }
                          else {
                            local_180 = 0;
                            uVar16 = *(ulong *)(lVar5 + 0x118);
                            if (uVar16 < uVar19) goto LAB_140198e56;
LAB_140198e90:
                            local_188 = 0;
                            uVar16 = *(ulong *)(lVar5 + 0x120);
                            if (uVar19 <= uVar16) goto LAB_140198ee0;
LAB_140198ea6:
                            uVar16 = *(ulong *)(*(long *)(lVar25 + 0x38) + uVar16 * 8);
                            if (uVar16 == 0) goto LAB_140198ee0;
                            local_190 = *(long *)(*(long *)(lVar25 + 0x18) + 0x10 + ~uVar16 * 0x30);
                            uVar16 = *(ulong *)(lVar5 + 0x128);
                            if (uVar16 < uVar19) goto LAB_140198ef6;
LAB_140198f20:
                            local_178 = 0;
                          }
                          lVar17 = func_0x000144e4f270();
                          lVar25 = *(long *)(lVar26 + 0x50);
                          uVar18 = *(undefined8 *)(lVar26 + 0x58);
                          uVar12 = 0;
                        }
                        uVar16 = (ulong)uVar12;
                        uVar12 = uVar12 + 1;
                        uVar19 = (ulong)~*(uint *)(lVar25 + 8 + uVar16 * 0x10);
                      } while ((uVar20 <= (uint)(iVar3 - *(int *)(lVar17 + uVar19 * 4))) ||
                              (uVar28 = *(undefined8 *)(uVar16 * 0x10 + lVar25), (int)uVar28 == 0));
                    }
                    else {
                      do {
                        if (uVar12 == (uint)uVar18) {
                          if (puVar21 == puVar24) {
                            return;
                          }
                          uVar19 = (ulong)*puVar21;
                          puVar21 = puVar21 + 1;
                          lVar17 = *(long *)(lVar6 + 0x1a8);
                          if (*(long *)(lVar17 + 0x10 + uVar19 * 0x48) == 0) {
                            do {
                              if (puVar21 == puVar24) {
                                return;
                              }
                              uVar12 = *puVar21;
                              puVar21 = puVar21 + 1;
                            } while (*(long *)(*(long *)(lVar6 + 0x1a8) + 0x10 +
                                              (ulong)uVar12 * 0x48) == 0);
                            lVar26 = *(long *)(lVar6 + 0x1a8) + (ulong)uVar12 * 0x48;
                            puVar23 = (undefined8 *)(lVar26 + 0x10);
                            uVar19 = *(ulong *)(lVar5 + 0x110);
                            uVar16 = *(ulong *)(lVar26 + 0x40);
                            if (uVar19 < uVar16) goto LAB_140198bdc;
LAB_140198c20:
                            local_180 = 0;
                            uVar19 = *(ulong *)(lVar5 + 0x118);
                            if (uVar16 <= uVar19) goto LAB_140198c70;
LAB_140198c36:
                            uVar19 = *(ulong *)(*(long *)(lVar26 + 0x38) + uVar19 * 8);
                            if (uVar19 == 0) goto LAB_140198c70;
                            local_188 = *(long *)(*(long *)(lVar26 + 0x18) + 0x10 + ~uVar19 * 0x30);
                            uVar19 = *(ulong *)(lVar5 + 0x120);
                            if (uVar19 < uVar16) goto LAB_140198c86;
LAB_140198cc0:
                            local_190 = 0;
                            uVar19 = *(ulong *)(lVar5 + 0x128);
                            if (uVar16 <= uVar19) goto LAB_140198d00;
LAB_140198cd6:
                            uVar19 = *(ulong *)(*(long *)(lVar26 + 0x38) + uVar19 * 8);
                            if (uVar19 == 0) goto LAB_140198d00;
                            local_178 = *(long *)(*(long *)(lVar26 + 0x18) + 0x10 + ~uVar19 * 0x30);
                          }
                          else {
                            lVar26 = lVar17 + uVar19 * 0x48;
                            puVar23 = (undefined8 *)(lVar17 + uVar19 * 0x48 + 0x10);
                            uVar19 = *(ulong *)(lVar5 + 0x110);
                            uVar16 = *(ulong *)(lVar26 + 0x40);
                            if (uVar16 <= uVar19) goto LAB_140198c20;
LAB_140198bdc:
                            uVar19 = *(ulong *)(*(long *)(lVar26 + 0x38) + uVar19 * 8);
                            if (uVar19 == 0) goto LAB_140198c20;
                            local_180 = *(long *)(*(long *)(lVar26 + 0x18) + 0x10 + ~uVar19 * 0x30);
                            uVar19 = *(ulong *)(lVar5 + 0x118);
                            if (uVar19 < uVar16) goto LAB_140198c36;
LAB_140198c70:
                            local_188 = 0;
                            uVar19 = *(ulong *)(lVar5 + 0x120);
                            if (uVar16 <= uVar19) goto LAB_140198cc0;
LAB_140198c86:
                            uVar19 = *(ulong *)(*(long *)(lVar26 + 0x38) + uVar19 * 8);
                            if (uVar19 == 0) goto LAB_140198cc0;
                            local_190 = *(long *)(*(long *)(lVar26 + 0x18) + 0x10 + ~uVar19 * 0x30);
                            uVar19 = *(ulong *)(lVar5 + 0x128);
                            if (uVar19 < uVar16) goto LAB_140198cd6;
LAB_140198d00:
                            local_178 = 0;
                          }
                          lVar17 = func_0x000144e4f270();
                          local_158 = *(long *)(lVar26 + 8);
                          uVar18 = *puVar23;
                          uVar12 = 0;
                        }
                        uVar19 = (ulong)uVar12;
                        uVar12 = uVar12 + 1;
                      } while ((uVar20 <= (uint)(iVar3 - *(int *)(lVar17 + uVar19 * 4))) ||
                              (uVar28 = *(undefined8 *)(local_158 + uVar19 * 8), (int)uVar28 == 0));
                    }
                    puVar23 = (undefined8 *)(local_188 + uVar19 * 8);
                    lVar29 = uVar19 * 0x68 + local_190;
                    lVar26 = uVar19 * 0x20 + local_178;
                    if ((int)uVar28 == 0) {
                      return;
                    }
                    if ((*(char *)(local_180 + uVar19) == '\0') && (*piVar9 == 0)) {
                      uVar10 = *puVar23;
                      uVar19 = (ulong)~(uint)uVar10;
                      piVar27 = (int *)(uVar19 * 0x18 + *(long *)(lVar8 + 8));
                      if (*(ulong *)(lVar8 + 0x10) <= uVar19) {
                        piVar27 = (int *)&DAT_145de5448;
                      }
                      if ((piVar27[4] == (int)((ulong)uVar10 >> 0x20)) && (*piVar27 != 0)) {
                        uVar19 = *(ulong *)(piVar27 + 1);
                        if ((uVar19 >> 0x20 < *(ulong *)(lVar7 + 0x38)) &&
                           ((*(ulong *)(*(long *)(lVar7 + 0x28) + (uVar19 >> 0x26) * 8) >>
                             (uVar19 >> 0x20 & 0x3f) & 1) != 0)) {
                          local_d8 = *(long *)(*(long *)(lVar8 + 0x1a8) + 0x18 +
                                              (ulong)(uint)piVar27[3] * 0x48);
                          local_e0 = *(long *)(*(long *)(lVar8 + 0x1a8) + 0x38 +
                                              (ulong)(uint)piVar27[3] * 0x48);
                          lVar14 = *(long *)(local_d8 + 0x10 +
                                            ~*(ulong *)(local_e0 + *(long *)(lVar7 + 0x118) * 8) *
                                            0x30);
                          uVar19 = (ulong)~(uint)uVar19;
                          lVar22 = uVar19 * 0x68;
                          fVar35 = *(float *)(lVar14 + 100 + lVar22);
                          fVar36 = *(float *)(lVar14 + 0x34 + lVar22) * fVar35;
                          fVar35 = fVar35 * *(float *)(lVar14 + 0x3c + lVar22);
                          uVar10 = *(undefined8 *)(lVar29 + 0x30);
                          pfVar13 = (float *)(local_d0[0xc] + 8);
                          if (local_d0[0xb][8] != '\0') {
                            pfVar13 = (float *)(local_d0[0xb] + 0xc);
                          }
                          uVar30 = *(uint *)(lVar29 + 0x34);
                          auVar38._4_4_ = uVar30;
                          auVar38._0_4_ = fVar35;
                          auVar38._8_8_ = 0;
                          auVar11._4_4_ = fVar52;
                          auVar11._0_4_ = fVar51;
                          auVar11._8_4_ = uVar53;
                          auVar11._12_4_ = uVar54;
                          auVar39 = maxps(auVar38,auVar11);
                          uVar31 = -(uint)NAN(auVar39._0_4_);
                          uVar33 = -(uint)NAN(auVar39._4_4_);
                          auVar46._0_4_ = ~uVar31 & (uint)auVar39._0_4_;
                          auVar46._4_4_ = ~uVar33 & (uint)auVar39._4_4_;
                          auVar46._8_4_ = ~-(uint)NAN(auVar39._8_4_) & (uint)auVar39._8_4_;
                          auVar46._12_4_ = ~-(uint)NAN(auVar39._12_4_) & (uint)auVar39._12_4_;
                          auVar39._4_4_ = uVar30 & uVar33;
                          auVar39._0_4_ = (uint)fVar35 & uVar31;
                          auVar39._8_8_ = 0;
                          auVar40._4_4_ =
                               *pfVar13 * fVar47 -
                               ((float)((ulong)uVar10 >> 0x20) * fVar50 * *(float *)(lVar26 + 0xc) +
                                (float)uVar10 * fVar49 * *(float *)(lVar26 + 4) +
                               *(float *)(lVar26 + 0x14));
                          auVar40._0_4_ = fVar36;
                          auVar40._8_8_ = 0;
                          auVar39 = divps(auVar40,auVar46 | auVar39);
                          auVar44._4_4_ = uVar56;
                          auVar44._0_4_ = uVar55;
                          auVar44._8_4_ = uVar57;
                          auVar44._12_4_ = uVar58;
                          auVar39 = maxps(auVar44,auVar39);
                          iVar32 = -(uint)(fVar51 < auVar39._0_4_);
                          iVar34 = -(uint)(fVar52 < auVar39._4_4_);
                          auVar42._4_4_ = iVar34;
                          auVar42._0_4_ = iVar32;
                          auVar42._8_4_ = iVar34;
                          auVar42._12_4_ = iVar34;
                          auVar41._8_8_ = auVar42._8_8_;
                          auVar41._4_4_ = iVar32;
                          auVar41._0_4_ = iVar32;
                          uVar30 = movmskpd((int)pfVar13,auVar41);
                          fVar37 = fVar59;
                          if ((uVar30 & 2) == 0) {
                            fVar37 = auVar39._4_4_;
                          }
                          fVar45 = fVar59;
                          if ((uVar30 & 1) == 0) {
                            fVar45 = auVar39._0_4_;
                          }
                          lVar29 = ~*(ulong *)(local_e0 + *(long *)(lVar7 + 0x110) * 8) * 0x30;
                          lVar26 = *(long *)(local_d8 + 0x10 + lVar29);
                          fVar35 = fVar35 - fVar36;
                          if (fVar35 <= fVar48) {
                            fVar35 = fVar48;
                          }
                          fVar36 = fVar59 - fVar45;
                          if (fVar59 - fVar45 <= fVar64) {
                            fVar36 = fVar64;
                          }
                          fVar36 = (fVar37 + fVar45 * fVar63) / fVar36;
                          fVar37 = 0.0;
                          if (0.0 <= fVar36) {
                            fVar37 = fVar36;
                          }
                          auVar43._4_4_ = uVar60;
                          auVar43._0_4_ = fVar59;
                          auVar43._8_4_ = uVar61;
                          auVar43._12_4_ = uVar62;
                          if (fVar37 <= fVar59) {
                            auVar43._0_4_ = fVar37;
                          }
                          fVar35 = auVar43._0_4_ * fVar35;
                          *(undefined4 *)(*(long *)(local_d8 + 0x28 + lVar29) + uVar19 * 4) = uVar4;
                          *(float *)(lVar26 + 4 + uVar19 * 8) = fVar35;
                          uVar10 = *puVar23;
                          *local_140 = local_160;
                          *(undefined8 *)piVar9 = uVar10;
                          *(undefined8 *)(piVar9 + 2) = uVar28;
                          piVar9[4] = (int)fVar47;
                          piVar9[5] = (int)fVar35;
                        }
                      }
                    }
                  } while( true );
                }
                uVar19 = (ulong)*puVar21;
                puVar21 = puVar21 + 1;
                lVar14 = *(long *)(lVar17 + 0x1a8);
                if (*(long *)(lVar14 + 0x10 + uVar19 * 0x48) == 0) {
                  do {
                    if (puVar21 == puVar24) goto LAB_140198a8f;
                    uVar12 = *puVar21;
                    puVar21 = puVar21 + 1;
                  } while (*(long *)(*(long *)(lVar17 + 0x1a8) + 0x10 + (ulong)uVar12 * 0x48) == 0);
                  lVar15 = *(long *)(lVar17 + 0x1a8) + (ulong)uVar12 * 0x48;
                  puVar23 = (undefined8 *)(lVar15 + 0x10);
                  uVar19 = *(ulong *)(lVar25 + 0x110);
                  uVar16 = *(ulong *)(lVar15 + 0x40);
                  if (uVar19 < uVar16) goto LAB_1401985fb;
LAB_140198640:
                  local_188 = 0;
                  uVar19 = *(ulong *)(lVar25 + 0x118);
                  if (uVar16 <= uVar19) goto LAB_140198540;
LAB_140198659:
                  uVar19 = *(ulong *)(*(long *)(lVar15 + 0x38) + uVar19 * 8);
                  if (uVar19 == 0) goto LAB_140198540;
                  local_190 = *(long *)(*(long *)(lVar15 + 0x18) + 0x10 + ~uVar19 * 0x30);
                }
                else {
                  lVar15 = lVar14 + uVar19 * 0x48;
                  puVar23 = (undefined8 *)(lVar14 + uVar19 * 0x48 + 0x10);
                  uVar19 = *(ulong *)(lVar25 + 0x110);
                  uVar16 = *(ulong *)(lVar15 + 0x40);
                  if (uVar16 <= uVar19) goto LAB_140198640;
LAB_1401985fb:
                  uVar19 = *(ulong *)(*(long *)(lVar15 + 0x38) + uVar19 * 8);
                  if (uVar19 == 0) goto LAB_140198640;
                  local_188 = *(long *)(*(long *)(lVar15 + 0x18) + 0x10 + ~uVar19 * 0x30);
                  uVar19 = *(ulong *)(lVar25 + 0x118);
                  if (uVar19 < uVar16) goto LAB_140198659;
LAB_140198540:
                  local_190 = 0;
                }
                lVar14 = func_0x000144e4f270();
                uVar18 = *puVar23;
                uVar12 = 0;
              }
              uVar19 = (ulong)uVar12;
              uVar12 = uVar12 + 1;
            } while (uVar20 <= (uint)(iVar32 - *(int *)(lVar14 + uVar19 * 4)));
            if ((char *)(local_188 + uVar19) == (char *)0x0) goto LAB_140198a8f;
          } while (*(char *)(local_188 + uVar19) != '\0');
          local_148 = *(undefined8 *)(local_190 + uVar19 * 8);
          piVar27 = (int *)((ulong)~(uint)local_148 * 0x18 + *(long *)(lVar29 + 8));
          if (*(ulong *)(lVar29 + 0x10) <= (ulong)~(uint)local_148) {
            piVar27 = (int *)&DAT_145de5448;
          }
        } while ((piVar27[4] != (int)((ulong)local_148 >> 0x20)) || (*piVar27 == 0));
        uVar19 = *(ulong *)(piVar27 + 1);
      } while ((*(ulong *)(lVar26 + 0x38) <= uVar19 >> 0x20) ||
              ((*(ulong *)(*(long *)(lVar26 + 0x28) + (uVar19 >> 0x26) * 8) >>
                (uVar19 >> 0x20 & 0x3f) & 1) == 0));
    }
    uVar18 = *(undefined8 *)
              (*(long *)(*(long *)(*(long *)(lVar29 + 0x1a8) + 0x18 + (ulong)(uint)piVar27[3] * 0x48
                                  ) + 0x10 +
                        ~*(ulong *)(*(long *)(*(long *)(lVar29 + 0x1a8) + 0x38 +
                                             (ulong)(uint)piVar27[3] * 0x48) +
                                   *(long *)(lVar26 + 0x110) * 8) * 0x30) + (ulong)~(uint)uVar19 * 8
              );
    FUN_140180d30();
    if ((int)local_108 == -1) {
      iVar32 = *(int *)(*local_100 + 4);
      *local_140 = local_160;
      *(undefined8 *)piVar9 = uVar18;
      *(undefined8 *)(piVar9 + 2) = local_148;
      piVar9[4] = (int)fVar47;
      piVar9[5] = iVar32;
    }
  }
  return;
}
