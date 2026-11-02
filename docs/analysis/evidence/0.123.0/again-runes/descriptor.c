
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 entry(undefined8 param_1,undefined8 param_2,long param_3,undefined8 param_4)

{
  ulong *puVar1;
  ushort uVar2;
  long lVar3;
  code *pcVar4;
  ushort uVar5;
  long lVar6;
  long lVar7;
  ulong extraout_RDX;
  ulong uVar8;
  ulong extraout_RDX_00;
  ulong uVar9;
  ulong extraout_RDX_01;
  long extraout_RDX_02;
  long extraout_RDX_03;
  long lVar10;
  int iVar11;
  long lVar12;
  undefined8 uVar13;
  long lVar14;
  long lVar15;
  ulong uVar16;
  long lVar17;
  int local_148 [20];
  long *local_f8;
  undefined1 *local_f0;
  undefined8 local_e8;
  undefined8 local_e0;
  ulong uStack_d8;
  undefined4 local_b8;
  undefined4 uStack_b4;
  undefined4 uStack_b0;
  undefined4 uStack_ac;
  undefined8 local_98;
  long local_90;
  long local_88;
  long local_80;
  long local_78;
  undefined8 local_70;
  undefined1 *local_68;
  undefined8 local_60;
  int local_58;
  undefined4 local_54;
  undefined1 local_49;
  undefined8 local_48;
  
  local_48 = 0xfffffffffffffffe;
  local_98 = param_4;
  local_78 = param_3;
  func_0x000145b06f60();
  uVar8 = extraout_RDX;
  for (iVar11 = 0; (ushort)iVar11 < 0x30; iVar11 = iVar11 + 1) {
    lVar7 = local_90;
    lVar15 = local_88;
    if (local_90 == 0) {
      lVar7 = 0;
    }
    else {
      while( true ) {
        uVar9 = (ulong)*(ushort *)(lVar7 + 0x36);
        uVar16 = (ulong)((uint)*(ushort *)(lVar7 + 0x36) * 2);
        uVar8 = 0xffffffffffffffff;
        do {
          if (uVar16 == 0) {
            uVar8 = uVar9;
            if (lVar15 != 0) goto LAB_145b08de9;
            goto LAB_145b08df2;
          }
          uVar2 = *(ushort *)(lVar7 + 0x3a + uVar8 * 2);
          uVar5 = (ushort)(iVar11 + 0x2fU);
          uVar8 = uVar8 + 1;
          uVar16 = uVar16 - 2;
        } while ((char)((uVar2 < uVar5) - (uVar5 < uVar2)) == '\x01');
        if (uVar2 < uVar5 == uVar5 < uVar2) {
          *(undefined4 *)(lVar7 + 8 + uVar8 * 4) = 0;
          goto LAB_145b08d78;
        }
        uVar9 = uVar8;
        if (lVar15 == 0) break;
LAB_145b08de9:
        lVar7 = *(long *)(lVar7 + 0x50 + uVar9 * 8);
        lVar15 = lVar15 + -1;
      }
    }
LAB_145b08df2:
    uStack_d8 = (ulong)(iVar11 + 0x2fU & 0xffff);
    local_e8 = 0;
    local_f8 = &local_90;
    local_f0 = (undefined1 *)lVar7;
    local_e0 = uVar8;
    func_0x000145b98dc0();
    uVar8 = extraout_RDX_00;
LAB_145b08d78:
  }
  for (iVar11 = 0; (ushort)iVar11 < 6; iVar11 = iVar11 + 1) {
    lVar7 = local_90;
    lVar15 = local_88;
    if (local_90 == 0) {
      lVar7 = 0;
    }
    else {
      while( true ) {
        uVar9 = (ulong)*(ushort *)(lVar7 + 0x36);
        uVar16 = (ulong)((uint)*(ushort *)(lVar7 + 0x36) * 2);
        uVar8 = 0xffffffffffffffff;
        do {
          if (uVar16 == 0) {
            uVar8 = uVar9;
            if (lVar15 != 0) goto LAB_145b08ea9;
            goto LAB_145b08eb2;
          }
          uVar2 = *(ushort *)(lVar7 + 0x3a + uVar8 * 2);
          uVar5 = (ushort)(iVar11 + 0x5fU);
          uVar8 = uVar8 + 1;
          uVar16 = uVar16 - 2;
        } while ((char)((uVar2 < uVar5) - (uVar5 < uVar2)) == '\x01');
        if (uVar2 < uVar5 == uVar5 < uVar2) {
          *(undefined4 *)(lVar7 + 8 + uVar8 * 4) = 0;
          goto LAB_145b08e38;
        }
        uVar9 = uVar8;
        if (lVar15 == 0) break;
LAB_145b08ea9:
        lVar7 = *(long *)(lVar7 + 0x50 + uVar9 * 8);
        lVar15 = lVar15 + -1;
      }
    }
LAB_145b08eb2:
    uStack_d8 = (ulong)(iVar11 + 0x5fU & 0xffff);
    local_e8 = 0;
    local_f8 = &local_90;
    local_f0 = (undefined1 *)lVar7;
    local_e0 = uVar8;
    func_0x000145b98dc0();
    uVar8 = extraout_RDX_01;
LAB_145b08e38:
  }
  func_0x000145b1fb20();
  local_e0 = _DAT_14732b9c0;
  uStack_d8 = uRam000000014732b9c8;
  local_b8 = _DAT_14732b9b0;
  uStack_b4 = uRam000000014732b9b4;
  uStack_b0 = uRam000000014732b9b8;
  uStack_ac = uRam000000014732b9bc;
  lVar15 = *(long *)(local_78 + 0x3a8);
  lVar3 = *(long *)(local_78 + 0x3b0);
  lVar14 = 1;
  lVar17 = 0;
  lVar10 = 1;
  lVar12 = 0;
  lVar7 = extraout_RDX_02;
  do {
    if (lVar10 == 2) {
LAB_145b08f56:
      if (lVar12 == 2) {
        local_58 = 0;
        local_70 = 0;
        local_68 = (undefined1 *)0x1;
        local_60 = 0;
        uVar13 = local_98;
        if (local_80 != 0) {
          local_49 = 1;
          func_0x0001461adc50(*(undefined8 *)(local_78 + 0x4b0),local_98,lVar7,&local_70);
          *local_68 = 0;
          local_60 = 1;
          local_49 = 1;
          func_0x000145aaeb70();
          local_49 = 1;
          func_0x000145aab700();
          local_58 = local_58 + 1;
        }
        local_e8 = local_60;
        local_e0 = CONCAT44(local_54,local_58);
        local_f8 = (long *)local_70;
        local_f0 = local_68;
        local_49 = 0;
        func_0x000145aa9a00();
        func_0x000145ab1020();
        return uVar13;
      }
      puVar1 = &local_e0 + lVar12;
      lVar12 = lVar12 + 1;
      lVar10 = 2;
      uVar8 = *puVar1;
      if (0x12 < uVar8) goto LAB_145b08ffc;
LAB_145b08f79:
      iVar11 = local_148[uVar8];
    }
    else {
      if (lVar14 != 1) {
        lVar14 = 2;
        if (lVar17 == 2) goto LAB_145b08f56;
        lVar7 = lVar17 * 2;
        lVar17 = lVar17 + 1;
        lVar10 = 1;
        uVar8 = *(ulong *)(&local_b8 + lVar7);
        if (uVar8 < 0x13) goto LAB_145b08f79;
LAB_145b08ffc:
        func_0x0001461ae0f3();
                    /* WARNING: Does not return */
        pcVar4 = (code *)invalidInstructionException();
        (*pcVar4)();
      }
      uVar8 = 1;
      lVar14 = 0;
      lVar10 = 1;
      iVar11 = local_148[1];
    }
    lVar6 = lVar3 * 0x48;
    lVar7 = lVar15;
    if (iVar11 == 0) {
      do {
        if (lVar6 == 0) {
          func_0x000145aab4e0();
          lVar7 = extraout_RDX_03;
          break;
        }
        puVar1 = (ulong *)(lVar7 + 0x30);
        lVar7 = lVar7 + 0x48;
        lVar6 = lVar6 + -0x48;
      } while (*puVar1 != uVar8);
    }
  } while( true );
}

