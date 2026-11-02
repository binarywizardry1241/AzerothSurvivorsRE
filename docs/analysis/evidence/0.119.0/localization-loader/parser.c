/* Ghidra raw-binary import; external memory/callees absent; inferred ABI.
 * Original PE instructions govern Windows-x64 arguments and globals. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 * entry(ulong param_1,undefined8 param_2,long param_3,undefined8 *param_4,byte *param_5)

{
  long *plVar1;
  byte bVar2;
  long *plVar3;
  long *plVar4;
  long *plVar5;
  byte *pbVar6;
  ulong uVar7;
  ulong uVar8;
  ulong uVar9;
  long lVar10;
  uint uVar11;
  long lVar12;
  byte *pbVar13;
  byte *pbVar14;
  ulong uVar15;
  char cVar16;
  long lVar17;
  long lVar18;
  char cVar22;
  char cVar23;
  undefined1 auVar19 [16];
  undefined1 auVar20 [16];
  undefined1 auVar21 [16];
  undefined1 auVar24 [16];
  undefined8 local_100;
  undefined8 uStack_f8;
  undefined8 local_f0;
  long local_e8 [3];
  long *local_d0;
  long *plStack_c8;
  long *local_c0;
  long *plStack_b8;
  long *local_b0;
  long *plStack_a8;
  long local_a0;
  long lStack_98;
  long local_90;
  long *local_88;
  long *local_80;
  byte *local_78;
  ulong local_70;
  ulong local_68;
  long *local_60;
  long *local_58;
  char local_4a;
  undefined1 local_49;
  undefined8 local_48;

  local_48 = 0xfffffffffffffffe;
  pbVar13 = (byte *)0x0;
  do {
    while( true ) {
      pbVar6 = param_5;
      if (pbVar13 == param_5) goto LAB_145b2b295;
      pbVar14 = pbVar13 + param_3;
      bVar2 = *pbVar14;
      pbVar6 = pbVar13;
      if ((-1 < (char)bVar2) || (bVar2 < 0xe0)) goto LAB_145b2b295;
      uVar11 = (pbVar14[1] & 0x3f) << 6;
      param_1 = (ulong)uVar11;
      uVar11 = pbVar14[2] & 0x3f | uVar11;
      if (0xef < bVar2) break;
      pbVar13 = pbVar14 + -param_3 + 3;
      if ((uVar11 | (bVar2 & 0x1f) << 0xc) != 0xfeff) goto LAB_145b2b295;
    }
    uVar11 = pbVar14[3] & 0x3f | uVar11 << 6 | (bVar2 & 7) << 0x12;
    param_1 = (ulong)uVar11;
    pbVar13 = pbVar14 + -param_3 + 4;
  } while (uVar11 == 0xfeff);
LAB_145b2b295:
  local_78 = pbVar6 + param_3;
  local_a0 = 0;
  lStack_98 = 8;
  local_90 = 0;
  local_70 = (long)param_5 - (long)pbVar6;
  if (local_70 == 0) {
    local_68 = 0;
  }
  else {
    uVar7 = 0;
    do {
      local_68 = uVar7;
      if ((0x20 < (ulong)local_78[uVar7]) ||
         ((0x100002600U >> ((ulong)local_78[uVar7] & 0x3f) & 1) == 0)) break;
      uVar7 = uVar7 + 1;
      local_68 = local_70;
    } while (local_70 != uVar7);
  }
  func_0x000145b273b0(param_1,param_4,&local_78,&local_d0,CONCAT71((int7)(local_70 >> 8),0x7b));
  if (local_d0 == (long *)0xffffffffffffffff) {
    uVar15 = local_68;
    uVar7 = local_70;
    if (local_68 < local_70) {
      do {
        uVar15 = local_68;
        bVar2 = local_78[uVar15];
        if ((0x20 < (ulong)bVar2) || ((0x100002600U >> ((ulong)bVar2 & 0x3f) & 1) == 0)) {
          if (bVar2 == 0x7d) goto LAB_145b2b3f3;
          break;
        }
        local_68 = uVar15 + 1;
        uVar15 = local_70;
      } while (local_70 != local_68);
    }
LAB_145b2b420:
    local_68 = uVar15;
    if (uVar15 < uVar7) {
      do {
        local_68 = uVar15;
        if ((0x20 < (ulong)local_78[uVar15]) ||
           ((0x100002600U >> ((ulong)local_78[uVar15] & 0x3f) & 1) == 0)) break;
        uVar15 = uVar15 + 1;
        local_68 = uVar7;
      } while (uVar7 != uVar15);
    }
    func_0x000145b275c0();
    plVar1 = plStack_b8;
    local_58 = plStack_c8;
    local_60 = local_c0;
    if ((int)local_d0 == 1) {
      param_4[1] = plStack_c8;
      param_4[2] = local_c0;
      param_4[3] = plStack_b8;
      goto LAB_145b2b322;
    }
    uVar7 = local_68;
    if (local_68 < local_70) {
      do {
        local_68 = uVar7;
        if ((0x20 < (ulong)local_78[local_68]) ||
           ((0x100002600U >> ((ulong)local_78[local_68] & 0x3f) & 1) == 0)) break;
        uVar7 = local_68 + 1;
        local_68 = local_70;
      } while (local_70 != uVar7);
    }
    local_49 = 1;
    func_0x000145b273b0();
    if (local_d0 != (long *)0xffffffffffffffff) {
      param_4[3] = local_c0;
      param_4[1] = local_d0;
      param_4[2] = plStack_c8;
      *param_4 = 1;
      goto LAB_145b2b84b;
    }
    uVar7 = local_68;
    if (local_68 < local_70) {
      do {
        local_68 = uVar7;
        if ((0x20 < (ulong)local_78[local_68]) ||
           ((0x100002600U >> ((ulong)local_78[local_68] & 0x3f) & 1) == 0)) break;
        uVar7 = local_68 + 1;
        local_68 = local_70;
      } while (local_70 != uVar7);
    }
    local_49 = 1;
    func_0x000145b275c0();
    lVar12 = local_90;
    plVar5 = plStack_b8;
    plVar4 = local_c0;
    plVar3 = plStack_c8;
    local_80 = local_c0;
    if ((int)local_d0 == 1) {
      param_4[1] = plStack_c8;
      param_4[2] = local_c0;
      param_4[3] = plStack_b8;
      *param_4 = 1;
      goto LAB_145b2b84b;
    }
    local_88 = plStack_c8;
    if ((plVar1 == (long *)0x0) || (cVar16 = '\x01', (char)*local_60 != '_')) {
      local_d0 = local_58;
      plStack_c8 = local_60;
      local_c0 = plVar1;
      plStack_b8 = plVar3;
      local_b0 = plVar4;
      plStack_a8 = plVar5;
      if (local_90 == local_a0) {
        func_0x000145f947e0();
      }
      lVar10 = lVar12 * 0x30;
      plVar1 = (long *)(lStack_98 + 0x20 + lVar10);
      *plVar1 = (long)local_b0;
      plVar1[1] = (long)plStack_a8;
      plVar1 = (long *)(lStack_98 + 0x10 + lVar10);
      *plVar1 = (long)local_c0;
      plVar1[1] = (long)plStack_b8;
      *(long *)(lStack_98 + lVar10) = (long)local_d0;
      ((long *)(lStack_98 + lVar10))[1] = (long)plStack_c8;
      local_90 = lVar12 + 1;
      cVar16 = '\0';
    }
    uVar7 = local_70;
    uVar8 = local_68;
    if (local_70 <= local_68) {
LAB_145b2b648:
      uVar15 = local_68 + 1;
      goto LAB_145b2b64f;
    }
    while( true ) {
      uVar15 = uVar8 + 1;
      bVar2 = local_78[uVar8];
      if ((0x20 < (ulong)bVar2) || ((0x100002600U >> ((ulong)bVar2 & 0x3f) & 1) == 0)) break;
      local_68 = local_70;
      uVar8 = uVar15;
      if (uVar15 == local_70) goto LAB_145b2b648;
    }
    local_68 = uVar15;
    if (bVar2 == 0x2c) {
      if (cVar16 != '\0') {
        if (local_88 != (long *)0x0) {
          func_0x0001400021d0();
        }
        if (local_58 != (long *)0x0) {
          func_0x0001400021d0();
        }
      }
      goto LAB_145b2b420;
    }
    if (bVar2 == 0x7d) {
      if (cVar16 != '\0') {
        if (local_88 != (long *)0x0) {
          func_0x0001400021d0();
        }
        if (local_58 != (long *)0x0) {
          func_0x0001400021d0();
        }
      }
LAB_145b2b3f3:
      param_4[3] = local_90;
      param_4[1] = local_a0;
      param_4[2] = lStack_98;
      *param_4 = 0;
      return param_4;
    }
LAB_145b2b64f:
    local_e8[0] = 0x1472de0d0;
    local_e8[1] = 0xf;
    uVar7 = uVar15;
    if (local_70 < uVar15) {
      uVar7 = local_70;
    }
    if (uVar7 == 0) {
      local_e8[2] = 0;
    }
    else {
      if (3 < uVar7) {
        uVar8 = uVar7 & 0xfffffffffffffffc;
        lVar12 = 0;
        lVar10 = 0;
        uVar9 = 0;
        lVar17 = 0;
        lVar18 = 0;
        do {
          auVar19[0] = -((char)*(undefined2 *)(local_78 + uVar9) == DAT_1463e2fc0);
          cVar22 = -((char)((ushort)*(undefined2 *)(local_78 + uVar9) >> 8) == cRam00000001463e2fc1)
          ;
          cVar23 = -(cRam00000001463e2fc7 == '\0');
          auVar19._8_8_ =
               (undefined8)
               (CONCAT72(CONCAT61(CONCAT51(CONCAT41(CONCAT31(CONCAT21(CONCAT11(cVar23,cVar23),
                                                                      -(cRam00000001463e2fc6 == '\0'
                                                                       )),
                                                             -(cRam00000001463e2fc6 == '\0')),
                                                    -(cRam00000001463e2fc5 == '\0')),
                                           -(cRam00000001463e2fc5 == '\0')),
                                  -(cRam00000001463e2fc4 == '\0')),
                         CONCAT11(-(cRam00000001463e2fc4 == '\0'),cVar23)) >> 8);
          auVar19[7] = -(cRam00000001463e2fc3 == '\0');
          auVar19[6] = -(cRam00000001463e2fc3 == '\0');
          auVar19[5] = -(cRam00000001463e2fc2 == '\0');
          auVar19[4] = -(cRam00000001463e2fc2 == '\0');
          auVar19[3] = cVar22;
          auVar19[2] = cVar22;
          auVar19[1] = auVar19[0];
          auVar19 = pshuflw(auVar19,auVar19,0xd4);
          auVar20._12_4_ = auVar19._12_4_;
          auVar20._0_8_ = auVar19._0_8_;
          auVar20._8_4_ = auVar19._4_4_;
          auVar20 = auVar20 & _DAT_146163e10;
          lVar17 = lVar17 + auVar20._0_8_;
          lVar18 = lVar18 + auVar20._8_8_;
          auVar24[0] = -((char)*(undefined2 *)(local_78 + uVar9 + 2) == DAT_1463e2fc0);
          cVar22 = -((char)((ushort)*(undefined2 *)(local_78 + uVar9 + 2) >> 8) ==
                    cRam00000001463e2fc1);
          cVar23 = -(cRam00000001463e2fc7 == '\0');
          auVar24._8_8_ =
               (undefined8)
               (CONCAT72(CONCAT61(CONCAT51(CONCAT41(CONCAT31(CONCAT21(CONCAT11(cVar23,cVar23),
                                                                      -(cRam00000001463e2fc6 == '\0'
                                                                       )),
                                                             -(cRam00000001463e2fc6 == '\0')),
                                                    -(cRam00000001463e2fc5 == '\0')),
                                           -(cRam00000001463e2fc5 == '\0')),
                                  -(cRam00000001463e2fc4 == '\0')),
                         CONCAT11(-(cRam00000001463e2fc4 == '\0'),cVar23)) >> 8);
          auVar24[7] = -(cRam00000001463e2fc3 == '\0');
          auVar24[6] = -(cRam00000001463e2fc3 == '\0');
          auVar24[5] = -(cRam00000001463e2fc2 == '\0');
          auVar24[4] = -(cRam00000001463e2fc2 == '\0');
          auVar24[3] = cVar22;
          auVar24[2] = cVar22;
          auVar24[1] = auVar24[0];
          auVar19 = pshuflw(auVar20,auVar24,0xd4);
          auVar21._12_4_ = auVar19._12_4_;
          auVar21._0_8_ = auVar19._0_8_;
          auVar21._8_4_ = auVar19._4_4_;
          lVar12 = lVar12 + SUB168(auVar21 & _DAT_146163e10,0);
          lVar10 = lVar10 + SUB168(auVar21 & _DAT_146163e10,8);
          uVar9 = uVar9 + 4;
        } while (uVar8 != uVar9);
        local_e8[2] = lVar10 + lVar18 + lVar12 + lVar17;
        goto LAB_145b2b7c8;
      }
      uVar8 = 0;
      local_e8[2] = 0;
      do {
        local_e8[2] = local_e8[2] + (ulong)(local_78[uVar8] == 10);
        uVar8 = uVar8 + 1;
LAB_145b2b7c8:
      } while (uVar7 != uVar8);
    }
    local_e8[2] = local_e8[2] + 1;
    local_d0 = local_e8 + 2;
    plStack_c8 = (long *)0x145f798d0;
    local_c0 = local_e8;
    plStack_b8 = (long *)0x1400020c0;
    local_68 = uVar15;
    local_4a = cVar16;
    func_0x000145f66f30();
    param_4[3] = local_f0;
    param_4[1] = local_100;
    param_4[2] = uStack_f8;
    *param_4 = 1;
    if (cVar16 != '\0') {
      if (local_88 != (long *)0x0) {
        func_0x0001400021d0();
      }
LAB_145b2b84b:
      if (local_58 != (long *)0x0) {
        func_0x0001400021d0();
      }
    }
  }
  else {
    param_4[3] = local_c0;
    param_4[1] = local_d0;
    param_4[2] = plStack_c8;
LAB_145b2b322:
    *param_4 = 1;
  }
  if (local_90 != 0) {
    lVar10 = lStack_98 + 0x20;
    lVar12 = local_90;
    do {
      if (*(long *)(lVar10 + -0x20) != 0) {
        func_0x0001400021d0();
      }
      if (*(long *)(lVar10 + -8) != 0) {
        func_0x0001400021d0();
      }
      lVar10 = lVar10 + 0x30;
      lVar12 = lVar12 + -1;
    } while (lVar12 != 0);
  }
  if (local_a0 != 0) {
    func_0x0001400021d0();
  }
  return param_4;
}
