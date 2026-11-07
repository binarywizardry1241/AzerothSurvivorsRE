/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_14007c2e0(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 param_4,
                  undefined8 *param_5,long *param_6)

{
  uint *puVar1;
  long lVar2;
  char *pcVar3;
  undefined1 auVar4 [12];
  char cVar5;
  int iVar6;
  int iVar7;
  undefined8 uVar8;
  long lVar9;
  long lVar10;
  long lVar11;
  ulong uVar12;
  long lVar13;
  uint *puVar14;
  ulong uVar15;
  undefined8 *puVar16;
  long lVar17;
  long *plVar18;
  long lVar19;
  uint uVar20;
  long unaff_R14;
  float fVar21;
  float fVar22;
  float fVar23;
  undefined1 auVar24 [16];
  undefined4 in_XMM6_Da;
  undefined4 uVar25;
  float fVar26;
  undefined4 in_XMM7_Da;
  float fVar27;
  undefined4 uVar28;
  float fVar29;
  long *in_stack_00000030;
  long *in_stack_00000038;
  long *in_stack_00000040;
  float local_138;
  float fStack_134;
  float local_130;
  float fStack_12c;
  undefined8 local_128;
  long lStack_120;
  float local_118;
  float local_114;
  float local_110;
  float local_10c;
  long local_108;
  long local_100;
  undefined4 local_f8;
  undefined4 local_f4;
  undefined8 local_f0;
  undefined4 local_e8;
  undefined4 uStack_e4;
  undefined4 uStack_e0;
  undefined4 uStack_dc;
  float local_d8;
  undefined4 uStack_d4;
  long local_c8;
  long local_c0;
  long local_b8;
  long *local_b0;
  undefined4 *local_a8;
  undefined8 local_a0;
  undefined4 local_98;
  undefined4 local_88;

  local_a0 = 0xfffffffffffffffe;
  plVar18 = (long *)*param_3;
  local_a8 = (undefined4 *)param_3[2];
  local_b8 = CONCAT44(local_b8._4_4_,*(undefined4 *)((long)param_3 + 0x1c));
  local_108 = *in_stack_00000030;
  local_c0 = *in_stack_00000038;
  lVar19 = in_stack_00000038[1];
  local_f4 = *(undefined4 *)((long)in_stack_00000038 + 0x14);
  lVar2 = *in_stack_00000040;
  lVar9 = in_stack_00000040[1];
  local_f8 = *(undefined4 *)((long)in_stack_00000040 + 0x14);
  uVar25 = *(undefined4 *)(local_108 + 0x5c);
  local_98 = in_XMM6_Da;
  local_88 = in_XMM7_Da;
  if ((((*(char *)((long)plVar18 + 0x1c) == '\x01') &&
       (pcVar3 = (char *)*param_5, pcVar3[0xd] == '\x01')) && (pcVar3[0xe] == '\x01')) &&
     (*pcVar3 == '\0')) {
    uVar8 = *(undefined8 *)(*param_6 + 0x28);
    func_0x000145bbd970(*(undefined8 *)(*param_6 + 0x20),local_108,0x145dcf8a8,&local_138,0x12);
    lVar13 = CONCAT44(fStack_134,local_138);
    local_c8 = uVar8;
    if (lVar13 == -2) {
      lVar13 = CONCAT44(fStack_12c,local_130);
      if (lVar13 == -1) goto LAB_14007c4f7;
      if (_DAT_14808a3b0[1] == 0) {
        lVar11 = 0;
      }
      else {
        lVar11 = *_DAT_14808a3b0;
        lVar17 = _DAT_14808a3b0[1] * 0xf0;
        lVar10 = lStack_120;
        local_100 = lVar13;
        local_b0 = plVar18;
        do {
          if ((*(long *)(lVar11 + 0x10) == lVar10) &&
             (iVar6 = func_0x000145bfa0e1(), lVar13 = local_100, plVar18 = local_b0, iVar6 == 0))
          goto LAB_14007c4df;
          lVar11 = lVar11 + 0xf0;
          lVar17 = lVar17 + -0xf0;
        } while (lVar17 != 0);
        lVar11 = 0;
        lVar13 = local_100;
        plVar18 = local_b0;
      }
LAB_14007c4df:
      if (lVar13 != 0) {
        func_0x0001400021d0();
      }
      if (lVar11 == 0) goto LAB_14007c4f7;
    }
    else {
      if ((lVar13 != -1) && (lVar13 != 0)) {
        func_0x0001400021d0();
      }
LAB_14007c4f7:
      lVar11 = func_0x00014588d200();
    }
    lVar10 = *(long *)(lVar11 + 8);
    unaff_R14 = *(long *)(lVar11 + 0x10);
    lVar13 = *plVar18;
    lVar11 = unaff_R14;
    if (lVar13 != 0) goto LAB_14007c3b1;
LAB_14007c51f:
    local_c8 = lVar9;
    if (lVar10 == 0) goto LAB_14007c7ca;
    *local_a8 = (undefined4)local_b8;
    *plVar18 = lVar10;
    plVar18[1] = unaff_R14;
    *(undefined4 *)(plVar18 + 2) = uVar25;
    lVar11 = unaff_R14;
LAB_14007c547:
    uVar25 = 0;
    if ((lVar10 != 0) && (unaff_R14 == lVar11)) {
      uVar8 = func_0x000145bfa0e1();
      uVar25 = (undefined4)CONCAT71((int7)((ulong)uVar8 >> 8),(int)uVar8 == 0);
    }
    local_100 = CONCAT44(local_100._4_4_,uVar25);
    lVar10 = func_0x00014588d200();
    func_0x0001459a77c0();
    func_0x000145bbd970();
    lVar13 = CONCAT44(uStack_e4,local_e8);
    if (lVar13 == -2) {
      local_b0 = (long *)CONCAT44(uStack_dc,uStack_e0);
      if (local_b0 != (long *)0xffffffffffffffff) {
        local_f0 = CONCAT44(uStack_d4,local_d8);
        func_0x000145bdb8d0();
        if (local_b0 != (long *)0x0) {
          func_0x0001400021d0();
        }
      }
    }
    else if ((lVar13 != -1) && (lVar13 != 0)) {
      func_0x0001400021d0();
    }
    fVar23 = *(float *)(lVar10 + 0xc0);
    lVar13 = _DAT_14808a3b0[1];
    if (lVar13 == 0) {
      fVar26 = 0.0;
    }
    else {
      local_f0 = CONCAT44(local_f0._4_4_,fVar23);
      lVar9 = *_DAT_14808a3b0;
      iVar6 = 0;
      lVar10 = 0;
      local_b0 = plVar18;
      do {
        if (*(long *)(lVar9 + 0x10 + lVar10) == unaff_R14) {
          iVar7 = func_0x000145bfa0e1();
          if (iVar7 == 0) {
            fVar26 = (float)-iVar6;
            goto LAB_14007c682;
          }
        }
        iVar6 = iVar6 + -1;
        lVar10 = lVar10 + 0xf0;
      } while (lVar13 * 0xf0 - lVar10 != 0);
      fVar26 = 0.0;
LAB_14007c682:
      plVar18 = local_b0;
      lVar9 = local_c8;
      fVar23 = (float)local_f0;
    }
    fVar21 = (float)func_0x000145bfa117();
    fVar22 = (float)func_0x000145bfa117();
    fVar27 = fVar21 * local_110 + fStack_12c;
    fVar21 = (float)func_0x000145bfa11d();
    fVar29 = fStack_12c * local_118;
    local_118 = local_114 + local_130;
    auVar4._8_4_ = fStack_134;
    auVar4._4_4_ = local_138;
    fStack_12c = fVar27 * fVar21 + local_138;
    auVar4._0_4_ = fStack_134 - _DAT_145d9d2a0 * (float)local_128;
    auVar24._0_8_ = auVar4._0_8_ << 0x20;
    auVar24._8_4_ = local_138 - fVar29 * fVar21;
    auVar24._12_4_ = fStack_134 - fVar29 * fVar22;
    lStack_120 = auVar24._8_8_;
    local_128 = CONCAT44(local_130 + _DAT_145d9d2a0 * (float)local_128,fStack_134 + fVar22 * fVar27)
    ;
    local_114 = local_10c;
    local_138 = 1.4013e-45;
    fStack_134 = fVar23;
    local_130 = fVar26;
    func_0x000140811850();
    func_0x0001408116a0();
    if ((char)local_100 == '\0') goto LAB_14007c7eb;
    lVar13 = local_108;
    cVar5 = func_0x000140811a60();
    fVar23 = *(float *)(lVar13 + 0x58);
    if (cVar5 != '\0') {
      fVar23 = fVar23 / _DAT_145dcce80 + *(float *)(plVar18 + 3);
      if (_DAT_145d9d2a0 <= fVar23) {
        fVar23 = _DAT_145d9d2a0;
      }
      goto LAB_14007c806;
    }
  }
  else {
    lVar10 = 0;
    lVar13 = *plVar18;
    lVar11 = unaff_R14;
    if (lVar13 == 0) goto LAB_14007c51f;
LAB_14007c3b1:
    lVar17 = plVar18[1];
    local_c8 = lVar9;
    if (((lVar10 != 0 && lVar17 == lVar11) &&
        (iVar6 = func_0x000145bfa0e1(lVar17,lVar13,lVar10,lVar13,lVar11), unaff_R14 = lVar11,
        iVar6 == 0)) || (unaff_R14 = lVar17, 0.0 < *(float *)(plVar18 + 3))) goto LAB_14007c547;
    *local_a8 = (undefined4)local_b8;
    *plVar18 = lVar10;
    plVar18[1] = lVar11;
    *(undefined4 *)(plVar18 + 2) = uVar25;
    unaff_R14 = lVar11;
    if (lVar10 != 0) goto LAB_14007c547;
LAB_14007c7ca:
    local_138 = 0.0;
    func_0x000140811850();
    func_0x0001408116a0();
LAB_14007c7eb:
    fVar23 = *(float *)(local_108 + 0x58);
  }
  fVar23 = fVar23 / _DAT_145dcd144 + *(float *)(plVar18 + 3);
  if (fVar23 <= 0.0) {
    fVar23 = 0.0;
  }
LAB_14007c806:
  *local_a8 = (undefined4)local_b8;
  *(float *)(plVar18 + 3) = fVar23;
  fVar26 = _DAT_145d9d2a0 - (_DAT_145dcced0 - (fVar23 + fVar23)) * fVar23 * fVar23;
  fVar23 = fVar26;
  if (*(char *)((long)plVar18 + 0x1c) == '\0') {
    fVar23 = 0.0;
  }
  puVar14 = *(uint **)(local_c0 + 0xf8);
  puVar1 = puVar14 + *(long *)(local_c0 + 0x100);
  if (*(char *)(local_c0 + 0x108) != '\0') {
    lVar13 = 0;
    local_a8 = (undefined4 *)0x0;
    uVar12 = 0;
    uVar8 = _DAT_145dcd150;
    do {
      if ((int)uVar12 == (int)lVar13) {
        do {
          if (puVar14 == puVar1) {
LAB_14007ca8e:
            puVar14 = *(uint **)(lVar2 + 0xf8);
            puVar1 = puVar14 + *(long *)(lVar2 + 0x100);
            uVar25 = (undefined4)_DAT_145dcd160;
            uVar28 = (undefined4)((ulong)_DAT_145dcd160 >> 0x20);
            if (*(char *)(lVar2 + 0x108) == '\0') {
              lVar19 = 0;
              local_c0 = 8;
              lVar13 = 0;
              uVar20 = 0;
              do {
                if (uVar20 == (uint)lVar19) {
                  do {
                    if (puVar14 == puVar1) {
                      return;
                    }
                    uVar20 = *puVar14;
                    puVar14 = puVar14 + 1;
                    lVar19 = *(long *)(*(long *)(lVar9 + 0x108) + 0x58 + (ulong)uVar20 * 0xa0);
                  } while (lVar19 == 0);
                  lVar11 = *(long *)(lVar9 + 0x108) + (ulong)uVar20 * 0xa0;
                  uVar12 = (ulong)*(uint *)(lVar11 + 0x94);
                  lVar10 = *(long *)(*(long *)(lVar9 + 0x1a8) + 0x18 + uVar12 * 0x48);
                  lVar9 = ~*(ulong *)(*(long *)(*(long *)(lVar9 + 0x1a8) + 0x38 + uVar12 * 0x48) +
                                     *(long *)(lVar2 + 0x110) * 8) * 0x30;
                  lVar13 = *(long *)(lVar10 + 0x10 + lVar9);
                  local_a8 = *(undefined4 **)(lVar10 + 0x28 + lVar9);
                  local_c0 = *(long *)(lVar11 + 0x50);
                  uVar20 = 0;
                }
                uVar12 = (ulong)~*(uint *)(local_c0 + 8 + (ulong)uVar20 * 0x10);
                puVar16 = (undefined8 *)(lVar13 + uVar12 * 0x14);
                uStack_dc = 0x3c449ba6;
                local_e8 = 0;
                uStack_e4 = uVar25;
                uStack_e0 = uVar28;
                local_d8 = fVar26;
                cVar5 = func_0x000140087c10();
                if (cVar5 == '\0') {
                  *(undefined4 *)((long)local_a8 + uVar12 * 4) = local_f8;
                  *(float *)(puVar16 + 2) = local_d8;
                  *puVar16 = CONCAT44(uStack_e4,local_e8);
                  puVar16[1] = CONCAT44(uStack_dc,uStack_e0);
                }
                uVar20 = uVar20 + 1;
                lVar9 = local_c8;
              } while( true );
            }
            lVar19 = 0;
            lVar13 = 0;
            uVar20 = 0;
            do {
              if (uVar20 == (uint)lVar19) {
                do {
                  if (puVar14 == puVar1) {
                    return;
                  }
                  uVar20 = *puVar14;
                  puVar14 = puVar14 + 1;
                  lVar19 = *(long *)(*(long *)(lVar9 + 0x1a8) + 0x10 + (ulong)uVar20 * 0x48);
                } while (lVar19 == 0);
                lVar9 = *(long *)(lVar9 + 0x1a8) + (ulong)uVar20 * 0x48;
                lVar10 = *(long *)(lVar9 + 0x18);
                lVar9 = ~*(ulong *)(*(long *)(lVar9 + 0x38) + *(long *)(lVar2 + 0x110) * 8) * 0x30;
                lVar13 = *(long *)(lVar10 + 0x10 + lVar9);
                local_c0 = *(long *)(lVar10 + 0x28 + lVar9);
                uVar20 = 0;
              }
              puVar16 = (undefined8 *)(lVar13 + (ulong)uVar20 * 0x14);
              uStack_dc = 0x3c449ba6;
              local_e8 = 0;
              uStack_e4 = uVar25;
              uStack_e0 = uVar28;
              local_d8 = fVar26;
              cVar5 = func_0x000140087c10();
              if (cVar5 == '\0') {
                *(undefined4 *)(local_c0 + (ulong)uVar20 * 4) = local_f8;
                *(float *)(puVar16 + 2) = local_d8;
                *puVar16 = CONCAT44(uStack_e4,local_e8);
                puVar16[1] = CONCAT44(uStack_dc,uStack_e0);
              }
              uVar20 = uVar20 + 1;
              lVar9 = local_c8;
            } while( true );
          }
          uVar20 = *puVar14;
          puVar14 = puVar14 + 1;
          lVar13 = *(long *)(*(long *)(lVar19 + 0x1a8) + 0x10 + (ulong)uVar20 * 0x48);
        } while (lVar13 == 0);
        lVar9 = *(long *)(lVar19 + 0x1a8) + (ulong)uVar20 * 0x48;
        lVar10 = *(long *)(lVar9 + 0x18);
        lVar9 = ~*(ulong *)(*(long *)(lVar9 + 0x38) + *(long *)(local_c0 + 0x110) * 8) * 0x30;
        local_a8 = *(undefined4 **)(lVar10 + 0x10 + lVar9);
        local_b8 = *(long *)(lVar10 + 0x28 + lVar9);
        uVar12 = 0;
      }
      uStack_e4 = (undefined4)uVar8;
      uStack_e0 = (undefined4)((ulong)uVar8 >> 0x20);
      uStack_dc = 0x3eb851ec;
      local_e8 = 0;
      puVar16 = (undefined8 *)((long)local_a8 + uVar12 * 0x88 + 0x38);
      uVar15 = uVar12;
      local_d8 = fVar23;
      cVar5 = func_0x000140087c10(puVar16,uVar12,&local_e8,puVar16);
      if (cVar5 == '\0') {
        *(undefined4 *)(local_b8 + uVar12 * 4) = local_f4;
        *(float *)(puVar16 + 2) = local_d8;
        *puVar16 = CONCAT44(uStack_e4,local_e8);
        puVar16[1] = CONCAT44(uStack_dc,uStack_e0);
      }
      uVar12 = (ulong)((int)uVar15 + 1);
      lVar9 = local_c8;
    } while( true );
  }
  lVar13 = 0;
  local_a8 = (undefined4 *)0x8;
  local_b8 = 0;
  uVar12 = 0;
  uVar8 = _DAT_145dcd150;
  do {
    if ((int)uVar12 == (int)lVar13) {
      do {
        if (puVar14 == puVar1) goto LAB_14007ca8e;
        uVar20 = *puVar14;
        puVar14 = puVar14 + 1;
        lVar13 = *(long *)(*(long *)(lVar19 + 0x108) + 0x58 + (ulong)uVar20 * 0xa0);
      } while (lVar13 == 0);
      lVar10 = *(long *)(lVar19 + 0x108) + (ulong)uVar20 * 0xa0;
      uVar12 = (ulong)*(uint *)(lVar10 + 0x94);
      lVar9 = *(long *)(*(long *)(lVar19 + 0x1a8) + 0x18 + uVar12 * 0x48);
      lVar11 = ~*(ulong *)(*(long *)(*(long *)(lVar19 + 0x1a8) + 0x38 + uVar12 * 0x48) +
                          *(long *)(local_c0 + 0x110) * 8) * 0x30;
      local_b8 = *(long *)(lVar9 + 0x10 + lVar11);
      local_108 = *(long *)(lVar9 + 0x28 + lVar11);
      local_a8 = *(undefined4 **)(lVar10 + 0x50);
      uVar12 = 0;
    }
    uVar15 = (ulong)~*(uint *)((long)local_a8 + 8 + uVar12 * 0x10);
    uStack_e4 = (undefined4)uVar8;
    uStack_e0 = (undefined4)((ulong)uVar8 >> 0x20);
    uStack_dc = 0x3eb851ec;
    local_e8 = 0;
    puVar16 = (undefined8 *)(local_b8 + uVar15 * 0x88 + 0x38);
    local_d8 = fVar23;
    cVar5 = func_0x000140087c10(puVar16,uVar12,&local_e8,puVar16);
    if (cVar5 == '\0') {
      *(undefined4 *)(local_108 + uVar15 * 4) = local_f4;
      *(float *)(puVar16 + 2) = local_d8;
      *puVar16 = CONCAT44(uStack_e4,local_e8);
      puVar16[1] = CONCAT44(uStack_dc,uStack_e0);
    }
    uVar12 = (ulong)((int)uVar12 + 1);
    lVar9 = local_c8;
  } while( true );
}
