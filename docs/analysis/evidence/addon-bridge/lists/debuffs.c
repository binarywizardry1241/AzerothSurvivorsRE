/* WARNING: Type propagation algorithm not settling */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 * FUN_1458ecf10(undefined8 param_1,undefined8 param_2,long param_3,undefined4 *param_4)

{
  undefined4 *puVar1;
  long *plVar2;
  undefined8 uVar3;
  undefined1 auVar4 [16];
  char cVar5;
  uint uVar6;
  long lVar7;
  long lVar8;
  char cVar9;
  undefined8 uVar10;
  undefined8 *puVar11;
  long lVar12;
  long unaff_R15;
  ulong uVar13;
  int *piVar14;
  undefined4 uVar15;
  undefined4 in_XMM6_Da;
  undefined4 in_XMM7_Da;
  undefined4 uVar16;
  undefined1 auVar17 [16];
  undefined8 local_218;
  undefined8 local_210;
  undefined4 local_208;
  undefined4 uStack_204;
  undefined4 uStack_200;
  undefined4 uStack_1fc;
  undefined8 local_1f8;
  long local_1f0;
  long *local_1e8;
  ulong local_1e0;
  long local_1d8;
  long *local_1d0;
  long *local_1c8;
  undefined4 *local_1c0;
  undefined4 local_1b8;
  undefined4 uStack_1b4;
  undefined4 uStack_1b0;
  undefined4 uStack_1ac;
  undefined8 local_1a8;
  undefined8 local_198;
  undefined8 uStack_190;
  int *local_188;
  undefined8 local_180;
  int *local_178;
  undefined8 local_170;
  undefined4 *local_168;
  undefined8 local_160;
  undefined4 *local_158;
  undefined8 local_150;
  undefined1 *local_148;
  undefined8 local_140;
  undefined8 *local_138;
  undefined8 local_130;
  undefined4 *local_128;
  undefined8 local_120;
  undefined8 **local_118;
  undefined8 local_110;
  long local_108;
  long local_100;
  undefined4 local_ec;
  undefined4 local_e8;
  int local_e4;
  int *local_e0;
  undefined8 *local_d8;
  undefined8 uStack_d0;
  undefined8 local_c8;
  long local_c0;
  long local_b8;
  long local_b0;
  long local_a8;
  long local_a0;
  undefined1 local_95;
  int local_94;
  uint local_90;
  undefined4 local_8c;
  long local_88;
  undefined4 *local_80;
  undefined1 local_72;
  undefined1 local_71;
  undefined8 local_70;
  undefined4 local_68;
  undefined4 local_58;

  local_70 = 0xfffffffffffffffe;
  local_68 = in_XMM6_Da;
  local_58 = in_XMM7_Da;
  func_0x00014599d110(param_1,param_2,*(undefined8 *)(param_3 + 0x560),&local_1f0);
  local_198 = (undefined8 *)&local_95;
  if (1 < local_1e0) {
    if (local_1e0 < 0x15) {
      func_0x000145981d60(local_1e8,local_1e0,local_1e0,local_1e8,1,&local_198);
    }
    else {
      local_72 = 1;
      func_0x0001459879f0(local_1e8,local_1e0,local_1e0,local_1e8);
    }
  }
  local_c0 = 0;
  local_b8 = 8;
  local_b0 = 0;
  local_100 = local_1f0;
  local_1c8 = local_1e8 + local_1e0;
  uVar15 = _DAT_145d73d14;
  local_1c0 = param_4;
  do {
    if (local_1e8 == local_1c8) {
      if (local_100 != 0) {
        func_0x0001400021d0();
      }
      func_0x0001458b82d0();
      puVar1 = local_1c0;
      *(int **)(local_1c0 + 4) = local_188;
      *local_1c0 = (int)local_198;
      local_1c0[1] = local_198._4_4_;
      local_1c0[2] = (undefined4)uStack_190;
      local_1c0[3] = uStack_190._4_4_;
      if (local_b0 != 0) {
        lVar8 = local_b8 + 8;
        lVar7 = local_b0;
        do {
          if (*(long *)(lVar8 + -8) != 0) {
            func_0x0001400021d0();
          }
          lVar8 = lVar8 + 0x18;
          lVar7 = lVar7 + -1;
        } while (lVar7 != 0);
      }
      if (local_c0 != 0) {
        func_0x0001400021d0();
      }
      return puVar1;
    }
    lVar7 = *local_1e8;
    local_1e8 = local_1e8 + 1;
    lVar12 = 0;
    local_1d0 = local_1e8;
    local_a8 = lVar7;
    for (lVar8 = 0xb0; lVar8 != 0xf0; lVar8 = lVar8 + 4) {
      local_94 = *(int *)(lVar7 + lVar8);
      if (local_94 != 0) {
        local_1d8 = lVar8;
        local_108 = lVar12;
        uVar6 = func_0x0001458df730();
        local_e4 = (uVar6 >> ((char)local_108 * '\b' & 0x1fU) & 0xff) + 1;
        lVar7 = 0;
        do {
          lVar8 = lVar7;
          if (*(int *)(lVar8 + 0x146bacb18) == local_94) {
            puVar11 = (undefined8 *)(lVar8 + 0x146bacad8);
            plVar2 = (long *)*puVar11;
            lVar7 = *(long *)(lVar8 + 0x146bacae0);
            goto joined_r0x0001458ed423;
          }
          if (*(int *)(lVar8 + 0x146bacb90) == local_94) {
            puVar11 = (undefined8 *)(lVar8 + 0x146bacb50);
            plVar2 = (long *)*puVar11;
            lVar7 = *(long *)(lVar8 + 0x146bacb58);
            goto joined_r0x0001458ed423;
          }
          if (*(int *)(lVar8 + 0x146bacc08) == local_94) {
            puVar11 = (undefined8 *)(lVar8 + 0x146bacbc8);
            plVar2 = (long *)*puVar11;
            lVar7 = *(long *)(lVar8 + 0x146bacbd0);
            goto joined_r0x0001458ed423;
          }
          if (*(int *)(lVar8 + 0x146bacc80) == local_94) {
            puVar11 = (undefined8 *)(lVar8 + 0x146bacc40);
            plVar2 = (long *)*puVar11;
            lVar7 = *(long *)(lVar8 + 0x146bacc48);
            goto joined_r0x0001458ed423;
          }
          if (*(int *)(lVar8 + 0x146baccf8) == local_94) {
            puVar11 = (undefined8 *)(lVar8 + 0x146baccb8);
            plVar2 = (long *)*puVar11;
            lVar7 = *(long *)(lVar8 + 0x146baccc0);
            goto joined_r0x0001458ed423;
          }
          if (lVar8 == 0x32a0) {
            func_0x0001458df590();
            puVar11 = (undefined8 *)0x0;
            cVar9 = '\x01';
            uVar13 = 0;
            local_e8 = uVar15;
            uVar16 = uVar15;
            cVar5 = '\x01';
            if ((int)local_198 == 1) goto LAB_1458ed1ba;
            goto LAB_1458ed1c7;
          }
          lVar7 = lVar8 + 0x2d0;
        } while (*(int *)(lVar8 + 0x146bacd70) != local_94);
        puVar11 = (undefined8 *)(lVar8 + 0x146bacd30);
        plVar2 = (long *)*puVar11;
        lVar7 = *(long *)(lVar8 + 0x146bacd38);
joined_r0x0001458ed423:
        if (lVar7 == 0xb) {
          if (*(long *)((long)plVar2 + 3) != 0x657269665f656972 || *plVar2 != 0x665f656972656166)
          goto LAB_1458ed154;
LAB_1458ed193:
          uVar13 = CONCAT71((int7)((ulong)unaff_R15 >> 8),1);
        }
        else {
          if ((lVar7 == 0xc) && ((int)plVar2[1] == 0x6b72616d && *plVar2 == 0x5f737265746e7568))
          goto LAB_1458ed193;
LAB_1458ed154:
          uVar13 = 0;
        }
        func_0x0001458df590();
        cVar9 = '\0';
        local_e8 = uVar15;
        uVar16 = uVar15;
        cVar5 = '\0';
        if ((byte)((byte)local_198 ^ 1 | (byte)uVar13) != 1) {
LAB_1458ed1ba:
          cVar9 = cVar5;
          uVar13 = 0;
          uVar15 = local_198._4_4_;
          local_e8 = (undefined4)uStack_190;
        }
LAB_1458ed1c7:
        local_ec = uVar15;
        lVar7 = func_0x0001458c0250();
        if (cVar9 == '\0') {
          uStack_d0 = 0x1400020c0;
          local_d8 = puVar11;
          local_88 = lVar7;
          func_0x000145b9c4d0();
          uVar10 = puVar11[2];
          uVar3 = puVar11[3];
          local_80 = (undefined4 *)uStack_190;
          local_90 = (uint)uVar13;
          auVar17 = func_0x0001458da590();
          if (local_198 != (undefined8 *)0x0) {
            func_0x0001400021d0();
          }
          auVar4._8_8_ = uVar3;
          auVar4._0_8_ = uVar10;
          if (auVar17._0_8_ == 0) {
            auVar17 = auVar4;
          }
          lVar8 = auVar17._8_8_;
          uVar10 = auVar17._0_8_;
          local_d8 = puVar11 + 4;
          uStack_d0 = 0x1400020c0;
          func_0x000145b9c4d0();
          uVar13 = (ulong)local_90;
          local_a0 = uStack_190;
          local_e0 = local_188;
          if (local_88 != 0) {
            local_80 = (undefined4 *)local_198;
            lVar7 = local_88;
            goto LAB_1458ed314;
          }
          if (local_198 == (undefined8 *)0xffffffffffffffff) {
            local_88 = 1;
            local_188 = (int *)0x0;
            local_80 = (undefined4 *)0x0;
          }
          else {
            local_80 = (undefined4 *)local_198;
            local_88 = uStack_190;
          }
LAB_1458ed4e8:
          local_8c = *(undefined4 *)(local_a8 + 0x88);
          local_71 = (undefined1)local_90;
          local_218 = 1;
          local_210 = 0;
          piVar14 = local_188;
        }
        else {
          if (lVar7 == 0) {
            lVar8 = 0;
            local_188 = (int *)0x0;
            local_88 = 1;
            local_80 = (undefined4 *)0x0;
            local_90 = (uint)uVar13;
            goto LAB_1458ed4e8;
          }
          uVar10 = *(undefined8 *)(lVar7 + 8);
          lVar8 = *(long *)(lVar7 + 0x10);
          local_80 = (undefined4 *)0xffffffffffffffff;
LAB_1458ed314:
          func_0x000145b9c990(uVar10,lVar8,lVar7 + 0x18,&local_198);
          local_88 = uStack_190;
          if (local_80 == (undefined4 *)0xffffffffffffffff) {
            if (local_198 == (undefined8 *)0xffffffffffffffff) {
              local_88 = 1;
              local_188 = (int *)0x0;
              local_80 = (undefined4 *)0x0;
            }
            else {
              local_80 = (undefined4 *)local_198;
            }
          }
          else {
            if ((undefined1 *)((long)local_198 - 1U) < (undefined1 *)0xfffffffffffffffe) {
              func_0x0001400021d0();
            }
            local_88 = local_a0;
            local_188 = local_e0;
          }
          local_8c = *(undefined4 *)(local_a8 + 0x88);
          local_218 = *(undefined8 *)(lVar7 + 0x30);
          local_210 = *(undefined8 *)(lVar7 + 0x38);
          piVar14 = local_188;
          local_71 = (char)uVar13;
        }
        local_198 = (undefined8 *)0x0;
        uStack_190 = 1;
        local_188 = (int *)0x0;
        uVar15 = uVar16;
        if (piVar14 != (int *)0x0) {
          func_0x000145bcb2d0();
          uVar15 = uVar16;
        }
        unaff_R15 = (long)piVar14 + local_88;
        func_0x0001459b9b70();
        local_1a8 = local_188;
        local_1b8 = (int)local_198;
        uStack_1b4 = local_198._4_4_;
        uStack_1b0 = (undefined4)uStack_190;
        uStack_1ac = uStack_190._4_4_;
        local_198 = (undefined8 *)0x0;
        uStack_190 = 1;
        local_188 = (int *)0x0;
        if (lVar8 != 0) {
          func_0x000145bcb2d0();
        }
        func_0x0001459b9b70();
        local_c8 = local_188;
        local_d8 = local_198;
        uStack_d0 = uStack_190;
        uStack_190 = 0x145badf80;
        local_188 = &local_94;
        local_180 = 0x145badf80;
        local_178 = &local_e4;
        local_170 = 0x145badf80;
        local_168 = &local_e8;
        local_160 = 0x145bad280;
        local_158 = &local_ec;
        local_150 = 0x145bad280;
        local_148 = &local_71;
        local_140 = 0x145baa8b0;
        local_138 = &local_218;
        local_130 = 0x1400020c0;
        local_128 = &local_1b8;
        local_120 = 0x1400020e0;
        local_118 = &local_d8;
        local_110 = 0x1400020e0;
        local_198 = (undefined8 *)&local_8c;
        func_0x000145b9c4d0();
        if (local_d8 != (undefined8 *)0x0) {
          func_0x0001400021d0();
        }
        if (CONCAT44(uStack_1b4,local_1b8) != 0) {
          func_0x0001400021d0();
        }
        if (local_b0 == local_c0) {
          func_0x000145bcb3e0();
        }
        *(undefined8 *)(local_b8 + 0x10 + local_b0 * 0x18) = local_1f8;
        puVar1 = (undefined4 *)(local_b8 + local_b0 * 0x18);
        *puVar1 = local_208;
        puVar1[1] = uStack_204;
        puVar1[2] = uStack_200;
        puVar1[3] = uStack_1fc;
        local_b0 = local_b0 + 1;
        lVar7 = local_a8;
        lVar8 = local_1d8;
        local_1e8 = local_1d0;
        lVar12 = local_108;
        if (local_80 != (undefined4 *)0x0) {
          func_0x0001400021d0();
          lVar7 = local_a8;
          lVar8 = local_1d8;
          local_1e8 = local_1d0;
          lVar12 = local_108;
        }
      }
      lVar12 = lVar12 + 1;
    }
  } while( true );
}
