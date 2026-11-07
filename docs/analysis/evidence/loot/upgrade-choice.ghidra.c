
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined4 param_1,undefined4 param_2,undefined8 param_3,undefined8 param_4,char param_5,
          float *param_6,char param_7)

{
  undefined4 *puVar1;
  long *plVar2;
  long lVar3;
  code *pcVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  undefined8 uVar7;
  int iVar8;
  undefined8 *puVar9;
  ulong uVar10;
  float *pfVar11;
  ulong uVar12;
  long lVar13;
  undefined4 *puVar14;
  float *pfVar15;
  undefined8 *puVar16;
  float *pfVar17;
  undefined1 uVar18;
  long lVar19;
  float *pfVar20;
  long lVar21;
  long lVar22;
  undefined8 *puVar23;
  float *pfVar24;
  float *pfVar25;
  long lVar26;
  undefined4 uVar27;
  float fVar28;
  undefined4 in_XMM6_Da;
  float fVar29;
  undefined4 in_XMM7_Da;
  float fVar30;
  undefined8 *local_220;
  undefined8 *local_218;
  undefined8 *local_210;
  undefined8 local_1e8;
  undefined8 uStack_1e0;
  undefined8 local_1d8;
  undefined8 uStack_1d0;
  float *local_1c8;
  float *local_1c0;
  float *local_1b8;
  undefined8 *local_1b0;
  float *local_1a8;
  undefined8 *local_1a0;
  float *local_140;
  long local_138;
  float *local_130;
  float *local_128;
  ulong local_120;
  undefined8 *local_118;
  undefined8 uStack_110;
  float *local_108;
  float *local_f8;
  float *pfStack_f0;
  float *local_e8;
  long local_e0;
  undefined8 local_d8;
  undefined4 uStack_d0;
  undefined4 uStack_cc;
  float *local_c8;
  long local_b8;
  float *local_b0;
  char local_a2;
  char local_a1;
  float *local_a0;
  float *local_98;
  float *local_90;
  undefined1 local_81;
  undefined8 *local_80;
  undefined1 local_71;
  undefined8 local_70;
  undefined4 local_68;
  undefined4 local_58;

  local_70 = 0xfffffffffffffffe;
  local_a2 = param_7;
  local_a1 = param_5;
  local_98 = param_6;
  local_68 = in_XMM6_Da;
  local_58 = in_XMM7_Da;
  if (param_5 != '\0') {
    uVar27 = _DAT_1458ed010;
    if (param_5 == '\x01') {
      uVar27 = 0;
    }
    func_0x0001454e1d00(param_1,param_2,uVar27,param_3,param_6,param_6,&local_1e8);
    goto LAB_1454db131;
  }
  if ((byte)(*(char *)(param_6 + 0xa1) - 2U) < 10) {
    lVar21 = *(long *)((ulong)(byte)(*(char *)(param_6 + 0xa1) - 2U) * 8 + 0x1469aca28);
  }
  else {
    lVar21 = 0x146718768;
  }
  local_f8 = (float *)0x0;
  pfStack_f0 = (float *)&DAT_00000008;
  local_e8 = (float *)0x0;
  pfVar17 = *(float **)(param_6 + 0xa6);
  uVar10 = *(ulong *)(param_6 + 0xa8);
  lVar22 = uVar10 << 4;
  local_120 = uVar10;
  local_e0 = lVar22;
  if (uVar10 == 0) {
    local_80 = (undefined8 *)0x8;
LAB_1454da785:
    pfVar15 = local_98;
    if (*(long *)(lVar21 + 0x38) != 0) {
      puVar16 = *(undefined8 **)(lVar21 + 0x30);
      puVar23 = puVar16 + *(long *)(lVar21 + 0x38) * 2;
      uVar27 = *(undefined4 *)((ulong)(uVar10 < 3) * 4 + 0x1469aa610);
      local_a0 = (float *)&DAT_00000008;
      local_90 = (float *)0x0;
      do {
        pfVar17 = (float *)*puVar16;
        pfVar20 = (float *)puVar16[1];
        if (local_120 != 0) {
          lVar21 = 0;
          puVar9 = local_80;
          do {
            if ((*(float **)((long)puVar9 + 8 + lVar21) == pfVar20) &&
               (iVar8 = func_0x000145756dd7(), puVar9 = local_80, iVar8 == 0)) goto LAB_1454da824;
            lVar21 = lVar21 + 0x10;
          } while (lVar22 != lVar21);
        }
        if ((pfVar20 == (float *)0xd) &&
           (*(long *)((long)pfVar17 + 5) == 0x656d616c665f666f &&
            *(long *)pfVar17 == 0x5f666f5f6c6c6163)) {
          lVar21 = 0;
          do {
            if (*(long *)(pfVar15 + 0xa8) * 0x58 - lVar21 == 0) goto LAB_1454da824;
            plVar2 = (long *)(*(long *)(pfVar15 + 0xa6) + lVar21);
            lVar21 = lVar21 + 0x58;
          } while (*(char *)(*plVar2 + 0x75) != '\n');
        }
        lVar21 = *(long *)(pfVar15 + 0x200);
        if (lVar21 != 0) {
          lVar26 = *(long *)(local_98 + 0x1fe);
          lVar19 = 0;
          do {
            if ((*(float **)(lVar26 + 8 + lVar19) == pfVar20) &&
               (iVar8 = func_0x000145756dd7(), pfVar15 = local_98, lVar22 = local_e0, iVar8 == 0))
            goto LAB_1454da824;
            lVar19 = lVar19 + 0x10;
          } while (lVar21 << 4 != lVar19);
        }
        if (*(long *)(local_98 + 0x206) != 0) {
          lVar21 = *(long *)(local_98 + 0x204);
          lVar26 = *(long *)(local_98 + 0x206) * 0x18;
          lVar19 = 0;
          do {
            if ((*(float **)(lVar21 + 0x10 + lVar19) == pfVar20) &&
               (iVar8 = func_0x000145756dd7(), pfVar15 = local_98, lVar22 = local_e0, iVar8 == 0))
            goto LAB_1454da824;
            lVar19 = lVar19 + 0x18;
          } while (lVar26 != lVar19);
        }
        local_1e8 = (undefined8 *)CONCAT44(local_1e8._4_4_,uVar27);
        uStack_1e0 = (undefined8 *)0x8000000000000000;
        pfVar15 = local_98;
        local_1d8 = pfVar17;
        uStack_1d0 = pfVar20;
        if (local_90 == local_f8) {
          func_0x000145758120();
          local_a0 = pfStack_f0;
        }
        *(float **)(local_a0 + (long)local_90 * 10 + 8) = local_1c8;
        pfVar17 = local_a0 + (long)local_90 * 10 + 4;
        *pfVar17 = (float)local_1d8;
        pfVar17[1] = local_1d8._4_4_;
        pfVar17[2] = (float)uStack_1d0;
        pfVar17[3] = uStack_1d0._4_4_;
        pfVar17 = local_a0 + (long)local_90 * 10;
        *pfVar17 = (float)local_1e8;
        pfVar17[1] = local_1e8._4_4_;
        pfVar17[2] = (float)uStack_1e0;
        pfVar17[3] = uStack_1e0._4_4_;
        local_e8 = (float *)((long)local_90 + 1);
        lVar22 = local_e0;
        local_90 = local_e8;
LAB_1454da824:
        puVar16 = puVar16 + 2;
      } while (puVar16 != puVar23);
      pfVar17 = *(float **)(pfVar15 + 0xa6);
      uVar10 = *(ulong *)(pfVar15 + 0xa8);
    }
  }
  else {
    func_0x000140002200();
    lVar26 = func_0x0001400021c0();
    if (lVar26 == 0) {
      local_81 = 1;
      func_0x0001458e721b();
LAB_1454db51b:
                    /* WARNING: Does not return */
      pcVar4 = (code *)invalidInstructionException();
      (*pcVar4)();
    }
    if (uVar10 == 1) {
      uVar12 = 0;
LAB_1454da761:
      puVar1 = *(undefined4 **)(pfVar17 + uVar12 * 0x16);
      uVar27 = puVar1[1];
      uVar5 = puVar1[2];
      uVar6 = puVar1[3];
      puVar14 = (undefined4 *)(lVar26 + uVar12 * 0x10);
      *puVar14 = *puVar1;
      puVar14[1] = uVar27;
      puVar14[2] = uVar5;
      puVar14[3] = uVar6;
    }
    else {
      puVar14 = (undefined4 *)(lVar26 + 0x18);
      uVar12 = 0;
      pfVar15 = pfVar17;
      do {
        uVar7 = (*(undefined8 **)pfVar15)[1];
        *(undefined8 *)(puVar14 + -6) = **(undefined8 **)pfVar15;
        *(undefined8 *)(puVar14 + -4) = uVar7;
        puVar1 = *(undefined4 **)(pfVar15 + 0x16);
        uVar27 = puVar1[1];
        uVar5 = puVar1[2];
        uVar6 = puVar1[3];
        puVar14[-2] = *puVar1;
        puVar14[-1] = uVar27;
        *puVar14 = uVar5;
        puVar14[1] = uVar6;
        uVar12 = uVar12 + 2;
        pfVar15 = pfVar15 + 0x2c;
        puVar14 = puVar14 + 8;
      } while ((uVar10 & 0xfffffffffffffffe) != uVar12);
      if ((uVar10 & 1) != 0) goto LAB_1454da761;
    }
    pfVar15 = local_98;
    local_80 = (undefined8 *)lVar26;
    if (uVar10 < 6) goto LAB_1454da785;
  }
  local_a0 = pfVar17 + uVar10 * 0x16;
  local_b0 = pfVar15 + 0x116;
  pfVar20 = (float *)0x0;
LAB_1454daaa9:
  pfVar11 = local_f8;
  if (pfVar17 != local_a0) {
    local_d8 = (undefined8 *)0x4;
    if (*(float **)(pfVar15 + 0xa8) <= pfVar20) {
      local_b8 = (long)local_80;
      local_71 = 1;
      func_0x0001458e75b3();
      goto LAB_1454db51b;
    }
    uStack_1d0 = (float *)(*(long *)(pfVar15 + 0xa6) + (long)pfVar20 * 0x58);
    local_1d8 = *(float **)(*(long *)(pfVar15 + 0xa6) + (long)pfVar20 * 0x58);
    local_1e8 = *(undefined8 **)(local_1d8 + 0xc);
    uStack_1e0 = (undefined8 *)(*(long *)(local_1d8 + 0xe) + (long)local_1e8);
    local_1c8 = local_b0;
    local_1b8 = local_b0;
    local_b8 = (long)local_80;
    local_71 = 1;
    local_1c0 = uStack_1d0;
    local_1b0 = &local_d8;
    local_1a8 = uStack_1d0;
    local_1a0 = &local_d8;
    func_0x0001455292b0();
    pfVar24 = pfVar17 + 0x16;
    pfVar11 = (float *)((long)pfVar20 + 1);
    if (local_108 == (float *)0x0) {
      pfVar17 = pfVar24;
      pfVar20 = pfVar11;
      if (local_118 != (undefined8 *)0x0) {
        func_0x0001400021d0();
        pfVar20 = pfVar11;
      }
    }
    else {
      local_128 = pfVar24;
      local_90 = pfVar11;
      if (local_118 != (undefined8 *)0x0) {
        func_0x0001400021d0();
      }
      lVar21 = *(long *)(pfVar15 + 0x204);
      lVar22 = *(long *)(pfVar15 + 0x206);
      plVar2 = *(long **)pfVar17;
      local_d8 = (undefined8 *)*plVar2;
      uStack_d0 = (undefined4)plVar2[1];
      uStack_cc = *(undefined4 *)((long)plVar2 + 0xc);
      uStack_110 = (float *)0x1400020c0;
      local_b8 = (long)local_80;
      local_71 = 1;
      local_118 = &local_d8;
      func_0x00014570bf80();
      if (lVar22 != 0) {
        lVar22 = lVar22 * 0x18;
        lVar26 = 0;
        pfVar15 = local_1d8;
        do {
          if ((*(float **)(lVar21 + 0x10 + lVar26) == pfVar15) &&
             (iVar8 = func_0x000145756dd7(), iVar8 == 0)) {
            pfVar15 = local_98;
            pfVar17 = local_128;
            pfVar20 = local_90;
            if (local_1e8 != (undefined8 *)0x0) {
              func_0x0001400021d0();
              pfVar17 = local_128;
              pfVar20 = local_90;
            }
            goto LAB_1454daaa9;
          }
          lVar26 = lVar26 + 0x18;
        } while (lVar22 != lVar26);
      }
      if (local_1e8 != (undefined8 *)0x0) {
        func_0x0001400021d0();
      }
      func_0x000140002200();
      pfVar11 = (float *)func_0x0001400021c0();
      if (pfVar11 == (float *)0x0) {
        local_b8 = (long)local_80;
        local_71 = 1;
        func_0x0001458e7201();
        goto LAB_1454db51b;
      }
      if (*(long *)(*(long *)pfVar17 + 0x38) == 0) {
        local_90 = pfVar11;
        func_0x0001458e75b3();
        goto LAB_1454db51b;
      }
      *(undefined1 *)pfVar11 = **(undefined1 **)(*(long *)pfVar17 + 0x30);
      local_1e8 = (undefined8 *)CONCAT44(local_1e8._4_4_,0x3fa66666);
      uStack_1e0 = (undefined8 *)0x1;
      uStack_1d0 = (float *)0x1;
      pfVar15 = local_98;
      local_1d8 = pfVar11;
      local_1c8 = pfVar20;
      if (local_e8 == local_f8) {
        func_0x000145758120();
      }
      *(float **)(pfStack_f0 + (long)local_e8 * 10 + 8) = local_1c8;
      pfVar20 = pfStack_f0 + (long)local_e8 * 10 + 4;
      *pfVar20 = (float)local_1d8;
      pfVar20[1] = local_1d8._4_4_;
      pfVar20[2] = (float)uStack_1d0;
      pfVar20[3] = uStack_1d0._4_4_;
      pfVar20 = pfStack_f0 + (long)local_e8 * 10;
      *pfVar20 = (float)local_1e8;
      pfVar20[1] = local_1e8._4_4_;
      pfVar20[2] = (float)uStack_1e0;
      pfVar20[3] = uStack_1e0._4_4_;
      local_e8 = (float *)((long)local_e8 + 1);
      pfVar17 = pfVar17 + 0x16;
      pfVar20 = local_90;
    }
    goto LAB_1454daaa9;
  }
  local_90 = (float *)(4 - (ulong)((byte)(~*(byte *)((long)pfVar15 + 0x20f) |
                                         *(byte *)(pfVar15 + 599)) & 1));
  local_140 = (float *)0x0;
  local_138 = 8;
  local_130 = (float *)0x0;
  local_b0 = pfStack_f0;
  lVar21 = (long)local_e8 * 0x28;
  lVar22 = 0;
  uVar10 = (ulong)local_e8 & 0xffffffff;
  local_128 = local_e8;
  pfVar17 = local_e8;
  uVar27 = local_f8._0_4_;
  fVar29 = _DAT_1458f667c;
  fVar30 = _DAT_1459f7d90;
  while ((pfVar15 = local_130, local_a0 = pfVar17, local_130 < local_90 && (pfVar17 != (float *)0x0)
         )) {
    fVar28 = fVar29;
    if ((ulong)(lVar22 - (long)local_128) < 0xfffffffffffffffd) {
      uVar12 = 0;
      pfVar15 = local_b0;
      do {
        fVar28 = fVar28 + *pfVar15 + pfVar15[10] + pfVar15[0x14] + pfVar15[0x1e];
        uVar12 = uVar12 + 4;
        pfVar15 = pfVar15 + 0x28;
      } while (((ulong)pfVar17 & 0x3fffffffffffffc) != uVar12);
      if (((ulong)pfVar17 & 3) != 0) goto LAB_1454daeb8;
    }
    else {
      uVar12 = 0;
LAB_1454daeb8:
      lVar26 = 0;
      do {
        fVar28 = fVar28 + *(float *)((long)local_b0 + lVar26 + uVar12 * 0x28);
        lVar26 = lVar26 + 0x28;
      } while ((ulong)(((uint)uVar10 & 3) << 3) * 5 != lVar26);
    }
    if (fVar28 <= fVar30) {
      fVar28 = fVar30;
    }
    pfVar20 = local_b0;
    fVar28 = (float)func_0x0001454f97c0(uVar27,0,fVar28);
    pfVar15 = (float *)((long)pfVar17 + -1);
    lVar26 = 0;
    pfVar24 = (float *)0x0;
    do {
      pfVar25 = pfVar24;
      if (fVar28 < *(float *)((long)pfVar20 + lVar26)) break;
      pfVar24 = (float *)((long)pfVar24 + 1);
      fVar28 = fVar28 - *(float *)((long)pfVar20 + lVar26);
      lVar26 = lVar26 + 0x28;
      pfVar25 = pfVar15;
    } while (lVar21 != lVar26);
    pfVar24 = local_a0;
    if (pfVar17 <= pfVar25) {
LAB_1454db504:
      local_a0 = pfVar24;
      func_0x0001458e72eb();
      goto LAB_1454db51b;
    }
    puVar16 = *(undefined8 **)(pfVar20 + (long)pfVar25 * 10 + 2);
    local_108 = *(float **)(pfVar20 + (long)pfVar25 * 10 + 8);
    local_118 = *(undefined8 **)(pfVar20 + (long)pfVar25 * 10 + 4);
    uStack_110 = *(float **)(pfVar20 + (long)pfVar25 * 10 + 4 + 2);
    func_0x000145756dd1();
    pfVar20 = local_130;
    pfVar24 = pfVar15;
    if (puVar16 == (undefined8 *)0xffffffffffffffff) goto LAB_1454db504;
    uStack_1d0 = local_108;
    local_c8 = local_108;
    uStack_d0 = (undefined4)uStack_110;
    uStack_cc = uStack_110._4_4_;
    local_d8 = local_118;
    uStack_1e0 = local_118;
    local_1d8 = uStack_110;
    pfVar17 = pfVar15;
    local_1e8 = puVar16;
    if (local_130 == local_140) {
      func_0x0001457580b0();
      pfVar17 = pfVar15;
    }
    lVar26 = (long)pfVar20 * 0x20;
    *(undefined8 **)(local_138 + lVar26) = puVar16;
    puVar14 = (undefined4 *)(local_138 + 8 + lVar26);
    *puVar14 = (undefined4)local_d8;
    puVar14[1] = local_d8._4_4_;
    puVar14[2] = uStack_d0;
    puVar14[3] = uStack_cc;
    *(float **)(local_138 + 0x18 + lVar26) = local_c8;
    local_130 = (float *)((long)pfVar20 + 1);
    lVar22 = lVar22 + 1;
    uVar10 = (ulong)(byte)((char)uVar10 + 3);
    lVar21 = lVar21 + -0x28;
    uVar27 = (undefined4)local_d8;
  }
  local_90 = (float *)0x0;
  pfVar17 = local_140;
  lVar21 = local_138;
  while (local_a0 != local_90) {
    local_90 = (float *)((long)local_90 + 1);
    func_0x000145486b10();
  }
  if (pfVar11 != (float *)0x0) {
    func_0x0001400021d0();
  }
  uStack_1d0 = (float *)((long)pfVar15 * 0x20 + lVar21);
  local_1c8 = local_98;
  local_b8 = (long)local_80;
  local_71 = 0;
  param_6 = local_98;
  local_1e8 = (undefined8 *)lVar21;
  uStack_1e0 = (undefined8 *)lVar21;
  local_1d8 = pfVar17;
  func_0x000145536160();
  if (local_c8 == (float *)0x0) {
    uStack_110 = (float *)CONCAT44(uStack_110._4_4_,0x19);
    local_118 = (undefined8 *)0x8000000000000004;
    func_0x0001454ded40();
    if (local_d8 == (undefined8 *)0x0) {
      func_0x0001457a4a40();
    }
    func_0x000145756ddd();
    local_c8 = (float *)0x1;
  }
  local_1d8 = local_c8;
  local_1e8 = local_d8;
  uStack_1e0 = (undefined8 *)CONCAT44(uStack_cc,uStack_d0);
  if (local_120 != 0) {
    func_0x0001400021d0();
  }
LAB_1454db131:
  local_a0 = param_6 + 0x15a;
  local_b0 = *(float **)(param_6 + 0x15c);
  local_90 = *(float **)(param_6 + 0x15e);
  local_80 = (undefined8 *)0x0;
  while (local_90 != (float *)local_80) {
    local_80 = (undefined8 *)((long)local_80 + 1);
    func_0x000145486bd0();
  }
  pfVar17 = local_a0;
  pfVar15 = local_98;
  if (*(long *)local_a0 != 0) {
    func_0x0001400021d0(local_98,local_a0,*(long *)local_a0 * 0xa0,*(undefined8 *)(local_98 + 0x15c)
                        ,8);
  }
  *(float **)(pfVar17 + 4) = local_1d8;
  *pfVar17 = (float)local_1e8;
  pfVar17[1] = local_1e8._4_4_;
  pfVar17[2] = (float)uStack_1e0;
  pfVar17[3] = uStack_1e0._4_4_;
  lVar21 = *(long *)(pfVar15 + 0x15e);
  if (lVar21 != 0) {
    lVar22 = *(long *)(pfVar15 + 0x15c);
    local_a0 = pfVar15 + 0x16c;
    lVar26 = 0;
    do {
      uVar10 = *(ulong *)(lVar22 + 0x78 + lVar26);
      uVar12 = uVar10 ^ 0x8000000000000000;
      if (-1 < (long)uVar10) {
        uVar12 = 1;
      }
      if (uVar12 == 2) {
        local_220 = *(undefined8 **)(*(long *)(lVar22 + 0x80 + lVar26) + 8);
        if ((long)local_220 < 0) {
          func_0x0001458e721b();
                    /* WARNING: Does not return */
          pcVar4 = (code *)invalidInstructionException();
          (*pcVar4)();
        }
        local_210 = local_220;
        if (local_220 == (undefined8 *)0x0) {
          local_b0 = (float *)0x1;
          local_218 = (undefined8 *)local_b0;
        }
        else {
          func_0x000140002200();
          local_218 = (undefined8 *)func_0x0001400021c0();
          if (local_218 == (undefined8 *)0x0) {
            local_b0 = (float *)local_220;
            func_0x0001458e721b();
                    /* WARNING: Does not return */
            pcVar4 = (code *)invalidInstructionException();
            (*pcVar4)();
          }
          func_0x000145756ddd();
          local_b0 = (float *)local_218;
        }
LAB_1454db34a:
        uVar18 = *(undefined1 *)(lVar22 + 0x98 + lVar26);
        lVar19 = *(long *)(local_98 + 0x170);
        local_90 = (float *)local_218;
        local_80 = local_220;
        if (lVar19 == *(long *)(local_98 + 0x16c)) {
          func_0x0001457580b0();
        }
        lVar3 = *(long *)(local_98 + 0x16e);
        lVar13 = lVar19 * 0x20;
        *(undefined8 **)(lVar3 + lVar13) = local_80;
        *(float **)(lVar3 + 8 + lVar13) = local_90;
        *(undefined8 **)(lVar3 + 0x10 + lVar13) = local_210;
        *(undefined1 *)(lVar3 + 0x18 + lVar13) = uVar18;
        *(long *)(local_98 + 0x170) = lVar19 + 1;
        pfVar15 = local_98;
      }
      else if (uVar12 == 3) {
        func_0x00014570c440();
        goto LAB_1454db34a;
      }
      lVar26 = lVar26 + 0xa0;
    } while (lVar21 * 0xa0 != lVar26);
  }
  *(char *)((long)pfVar15 + 0x95d) = local_a1;
  if (local_a2 != '\0') {
    *(undefined1 *)((long)pfVar15 + 0x95f) = 2;
    func_0x00014548e7e0();
  }
  func_0x0001454dc9c0();
  lVar21 = *(long *)(pfVar15 + 0x158);
  if (lVar21 == *(long *)(pfVar15 + 0x154)) {
    local_80 = local_1e8;
    local_90 = (float *)uStack_1e0;
    func_0x000145757f60();
  }
  lVar22 = *(long *)(pfVar15 + 0x156);
  *(float **)(lVar22 + 0x10 + lVar21 * 0x18) = local_1d8;
  puVar14 = (undefined4 *)(lVar22 + lVar21 * 0x18);
  *puVar14 = (float)local_1e8;
  puVar14[1] = local_1e8._4_4_;
  puVar14[2] = (float)uStack_1e0;
  puVar14[3] = uStack_1e0._4_4_;
  *(long *)(pfVar15 + 0x158) = lVar21 + 1;
  func_0x0001454dc2a0();
  return;
}
