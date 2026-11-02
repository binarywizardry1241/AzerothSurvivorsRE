
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long param_3,long *param_4,long param_5,
          long param_6)

{
  char *pcVar1;
  byte bVar2;
  long lVar3;
  long lVar4;
  undefined8 uVar5;
  ulong uVar6;
  code *pcVar7;
  double dVar8;
  undefined5 uVar9;
  undefined4 uVar10;
  byte bVar11;
  undefined1 *puVar12;
  undefined8 **ppuVar13;
  undefined1 *puVar14;
  ulong uVar15;
  long lVar16;
  undefined8 **ppuVar17;
  ulong uVar18;
  long lVar19;
  ulong **ppuVar20;
  undefined4 *puVar21;
  long lVar22;
  undefined4 in_XMM6_Da;
  undefined4 uVar23;
  undefined4 uVar24;
  undefined1 auVar25 [16];
  char *in_stack_00000028;
  undefined8 **local_198;
  undefined1 *local_190;
  undefined8 **local_188;
  undefined1 local_180;
  undefined4 local_17f;
  ulong **local_178;
  undefined1 *local_170;
  long local_168;
  undefined1 *local_158;
  undefined1 *local_150;
  undefined4 local_148;
  undefined4 uStack_144;
  undefined1 *local_140;
  undefined8 **local_138;
  undefined1 local_130;
  undefined4 local_12f;
  undefined3 uStack_12b;
  undefined1 *local_128;
  undefined1 *local_120;
  undefined8 **local_118;
  undefined8 local_110;
  undefined4 uStack_108;
  undefined3 uStack_104;
  undefined8 **local_100;
  long local_f8;
  long local_f0;
  undefined4 local_e8;
  undefined3 uStack_e4;
  undefined1 *local_e0;
  long local_d8;
  undefined1 *local_d0;
  undefined8 local_c8;
  undefined1 *puStack_c0;
  undefined1 *local_b8;
  undefined4 uStack_b0;
  undefined4 uStack_ac;
  char local_a1;
  undefined8 local_a0;
  undefined1 *local_98;
  undefined1 *local_90;
  undefined8 **local_88;
  undefined1 *puStack_80;
  undefined8 **local_78;
  undefined8 uStack_70;
  undefined1 local_67;
  undefined1 local_66;
  undefined1 local_65;
  undefined1 local_64;
  undefined1 local_63;
  undefined1 local_62;
  undefined1 local_61;
  undefined8 local_60;
  undefined4 local_58;

  local_60 = 0xfffffffffffffffe;
  local_58 = in_XMM6_Da;
  func_0x000140002200();
  local_120 = (undefined1 *)func_0x0001400021c0();
  if (local_120 == (undefined1 *)0x0) {
    func_0x000145eb6fcb();
                    /* WARNING: Does not return */
    pcVar7 = (code *)invalidInstructionException();
    (*pcVar7)();
  }
  *local_120 = 0x5b;
  local_a1 = *in_stack_00000028;
  puVar21 = (undefined4 *)((long)&uStack_70 + 1);
  lVar3 = *(long *)(param_6 + 0x20);
  lVar4 = *(long *)(param_6 + 0x28);
  local_64 = 1;
  uVar23 = (undefined4)_DAT_145ee3c88;
  uVar24 = (undefined4)((ulong)_DAT_145ee3c88 >> 0x20);
  local_118 = (ulong **)0x1;
  local_100 = (ulong **)0x1;
  lVar16 = param_3;
  lVar19 = local_d8;
  do {
    local_d8 = lVar16;
    if (local_d8 == param_5 * 200 + param_3) {
      local_d8 = lVar19;
      func_0x000140002200();
      puVar12 = (undefined1 *)func_0x0001400021c0();
      if (puVar12 != (undefined1 *)0x0) {
        *puVar12 = 0x7b;
        local_88 = (undefined8 **)0x1;
        local_78 = (undefined8 **)0x1;
        uStack_70 = CONCAT71(uStack_70._1_7_,1);
        local_63 = 1;
        puStack_80 = puVar12;
        func_0x000145858350();
        local_88 = local_100;
        puStack_80 = local_120;
        local_78 = local_118;
        uStack_70._0_5_ = CONCAT41(local_e8,local_64);
        uStack_70 = CONCAT44(CONCAT31(uStack_e4,local_e8._3_1_),(undefined4)uStack_70);
        ppuVar20 = local_118;
        if (local_100 == local_118) {
          func_0x000145d14a10();
        }
        puStack_80[(long)ppuVar20] = 0x5d;
        local_168 = (long)ppuVar20 + 1;
        local_178 = local_88;
        local_170 = puStack_80;
        local_67 = 0;
        func_0x000145858210();
        if (local_88 == local_78) {
          func_0x000145d14a10();
        }
        puStack_80[(long)local_78] = 0x7d;
        param_4[2] = (long)local_78 + 1;
        *param_4 = (long)local_88;
        param_4[1] = (long)puStack_80;
        return;
      }
      local_63 = 1;
      func_0x000145eb6fcb();
LAB_145999095:
                    /* WARNING: Does not return */
      pcVar7 = (code *)invalidInstructionException();
      (*pcVar7)();
    }
    bVar11 = *(char *)(local_d8 + 0xc2) - 1;
    if ((bVar11 < 0xb) && ((0x5dfU >> (bVar11 & 0x1f) & 1) != 0)) {
      lVar19 = *(long *)((ulong)bVar11 * 8 + 0x147339e20);
      local_c8 = (undefined1 *)(lVar19 + 0x10);
      puStack_c0 = (undefined1 *)0x1400020c0;
      local_63 = 1;
      func_0x000145ce7350();
      local_f0 = *(long *)(lVar19 + 0x20);
      uVar5 = *(undefined8 *)(lVar19 + 0x28);
      local_90 = puStack_80;
      auVar25 = func_0x0001458dff90();
      lVar19 = auVar25._0_8_;
      if (local_88 != (undefined8 **)0x0) {
        func_0x0001400021d0();
      }
      local_110 = auVar25._8_8_;
      if (lVar19 == 0) {
        local_110 = uVar5;
        lVar19 = local_f0;
      }
    }
    else {
      local_f0 = 1;
      local_110 = 0;
      lVar19 = local_f0;
    }
    local_f0 = lVar19;
    local_a0 = *(undefined8 *)(local_d8 + 0x68);
    local_f8 = *(long *)(local_d8 + 0x70);
    if (local_f8 - 2U < 7) {
                    /* WARNING: Could not emulate address calculation at 0x000145998181 */
                    /* WARNING: Treating indirect jump as call */
      (*(code *)((long)*(int *)((local_f8 - 2U) * 4 + 0x147339e78) + 0x147339e78))();
      return;
    }
    lVar19 = *(long *)(local_d8 + 0x98);
    lVar16 = *(long *)(local_d8 + 0xa0);
    func_0x000140002200();
    puVar12 = (undefined1 *)func_0x0001400021c0();
    if (puVar12 == (undefined1 *)0x0) {
      local_63 = 1;
      func_0x000145eb6fcb();
      goto LAB_145999095;
    }
    *puVar12 = 0x5b;
    local_e0 = puVar12;
    if (lVar16 == 0) {
      local_d0 = (undefined1 *)0x1;
      bVar11 = 1;
      local_90 = (undefined1 *)0x1;
    }
    else {
      bVar11 = 1;
      local_90 = (undefined1 *)0x1;
      ppuVar17 = (undefined8 **)0x1;
      lVar22 = 0;
      do {
        local_88 = (undefined8 **)local_90;
        puStack_80 = local_e0;
        uStack_70 = CONCAT71(uStack_70._1_7_,bVar11);
        *(uint *)((long)puVar21 + 3) = CONCAT31((undefined3)uStack_144,local_148._3_1_);
        *puVar21 = local_148;
        bVar2 = *(byte *)(lVar19 + lVar22);
        dVar8 = (double)bVar2;
        ppuVar13 = (undefined8 **)0x7fffffffffffffff;
        if (dVar8 < (double)CONCAT44(uVar24,uVar23) || dVar8 == (double)CONCAT44(uVar24,uVar23)) {
          ppuVar13 = (undefined8 **)(ulong)bVar2;
        }
        local_198 = (undefined8 **)0x0;
        if (!NAN(dVar8)) {
          local_198 = ppuVar13;
        }
        local_178 = (ulong **)&local_198;
        local_170 = (undefined1 *)0x145cf9dc0;
        local_150 = local_90;
        local_65 = 0;
        ppuVar13 = (undefined8 **)local_90;
        local_78 = ppuVar17;
        func_0x000145ce7350(local_90,ppuVar17,0x14700d304,&local_c8,&local_178);
        puVar12 = local_b8;
        local_128 = local_c8;
        local_d0 = puStack_c0;
        if ((bVar11 & 1) == 0) {
          if (ppuVar13 == ppuVar17) {
            func_0x000145d14a10();
            local_e0 = puStack_80;
            ppuVar13 = local_88;
          }
          local_e0[(long)ppuVar17] = 0x2c;
          ppuVar17 = (undefined8 **)((long)ppuVar17 + 1);
          local_78 = ppuVar17;
        }
        uStack_70 = uStack_70 & 0xffffffffffffff00;
        if ((undefined1 *)((long)ppuVar13 + -(long)ppuVar17) < puVar12) {
          func_0x000145d14a10();
          ppuVar17 = local_78;
          bVar11 = (byte)uStack_70;
LAB_1459985d4:
          puVar14 = puStack_80;
          func_0x000145d145fb();
          local_90 = (undefined1 *)local_88;
        }
        else {
          bVar11 = 0;
          puVar14 = puStack_80;
          local_90 = (undefined1 *)ppuVar13;
          if (puVar12 != (undefined1 *)0x0) goto LAB_1459985d4;
        }
        puVar21 = (undefined4 *)((long)&uStack_70 + 1);
        uVar10 = uStack_70._1_4_;
        uVar9 = CONCAT14(local_c8._7_1_,uStack_70._4_4_);
        local_c8 = (undefined1 *)CONCAT44((int)((uint5)uVar9 >> 8),uVar10);
        local_e0 = puVar14;
        if (local_128 != (undefined1 *)0x0) {
          func_0x0001400021d0();
        }
        ppuVar17 = (undefined8 **)((long)ppuVar17 + (long)puVar12);
        uStack_144._0_3_ = (undefined3)((ulong)local_c8 >> 0x20);
        lVar22 = lVar22 + 1;
        local_148 = (undefined4)local_c8;
      } while (lVar22 != lVar16);
      uStack_104 = (undefined3)uStack_144;
      uStack_108 = (undefined4)local_c8;
      local_d0 = (undefined1 *)ppuVar17;
    }
    local_198 = local_100;
    local_190 = local_120;
    local_188 = local_118;
    local_180 = local_64;
    local_17f = local_e8;
    func_0x000140002200();
    puVar14 = (undefined1 *)func_0x0001400021c0();
    puVar12 = local_90;
    if (puVar14 == (undefined1 *)0x0) {
      local_98 = local_90;
      local_61 = 1;
      local_62 = 1;
      func_0x000145eb6fcb();
      goto LAB_145999095;
    }
    *puVar14 = 0x7b;
    local_88 = (undefined8 **)0x1;
    local_78 = (undefined8 **)0x1;
    uStack_70._0_1_ = 1;
    local_98 = local_90;
    local_61 = 1;
    local_62 = 1;
    puStack_80 = puVar14;
    func_0x000145858350();
    local_98 = puVar12;
    local_61 = 1;
    local_62 = 1;
    func_0x000145858350();
    local_98 = puVar12;
    local_61 = 1;
    local_62 = 1;
    func_0x000145858350();
    local_98 = puVar12;
    local_61 = 1;
    local_62 = 1;
    func_0x000145858350();
    local_88 = (undefined8 **)puVar12;
    puStack_80 = local_e0;
    local_78 = (undefined8 **)local_d0;
    uStack_70 = CONCAT71(uStack_70._1_7_,bVar11);
    *(uint *)((long)puVar21 + 3) = CONCAT31(uStack_104,uStack_108._3_1_);
    *puVar21 = uStack_108;
    if (puVar12 == local_d0) {
      func_0x000145d14a10();
      puVar12 = local_90;
    }
    puStack_80[(long)local_d0] = 0x5d;
    local_b8 = local_d0 + 1;
    local_c8 = (undefined1 *)local_88;
    puStack_c0 = puStack_80;
    local_66 = 0;
    local_158 = puVar12;
    func_0x000145858210();
    lVar19 = local_d8;
    local_61 = 1;
    local_62 = 0;
    local_98 = puVar12;
    func_0x000145858350();
    local_61 = 1;
    local_62 = 0;
    local_98 = puVar12;
    func_0x000145858350();
    local_61 = 1;
    local_62 = 0;
    local_98 = puVar12;
    func_0x000145858350();
    uVar15 = func_0x0001458095e0();
    lVar16 = 0;
    do {
      if (lVar4 << 4 == lVar16) {
        uVar18 = 1;
        goto LAB_145998a45;
      }
      lVar22 = lVar16 + 0x10;
      pcVar1 = (char *)(lVar3 + lVar16);
      lVar16 = lVar22;
    } while (*pcVar1 != local_a1);
    uVar6 = *(ulong *)(lVar3 + -8 + lVar22);
    uVar18 = 0xc;
    if (uVar6 < 0xc) {
      uVar18 = uVar6;
    }
    if (uVar6 == 0) {
      uVar18 = 1;
    }
LAB_145998a45:
    func_0x0001458580a0();
    uVar15 = 5 - (ulong)(uVar15 < uVar18);
    if ((ulong)((long)local_c8 - (long)local_b8) < uVar15) {
      func_0x000145d14a10();
    }
    func_0x000145d145fb();
    puVar12 = local_90;
    lVar16 = local_d8;
    local_b8 = local_b8 + uVar15;
    local_88 = (undefined8 **)local_c8;
    puStack_80 = puStack_c0;
    uStack_70 = CONCAT44(uStack_ac,uStack_b0);
    local_98 = local_90;
    local_61 = 1;
    local_62 = 0;
    local_78 = (undefined8 **)local_b8;
    func_0x00014584ef40();
    local_98 = puVar12;
    local_61 = 1;
    local_62 = 0;
    func_0x00014584ef40();
    bVar11 = *(byte *)(lVar16 + 0xc0);
    func_0x0001458580a0();
    uVar15 = (ulong)bVar11 ^ 5;
    if ((ulong)((long)local_88 - (long)local_78) < uVar15) {
      func_0x000145d14a10();
    }
    func_0x000145d145fb();
    local_b8 = (undefined1 *)((long)local_78 + uVar15);
    local_c8 = (undefined1 *)local_88;
    puStack_c0 = puStack_80;
    uStack_b0 = (undefined4)uStack_70;
    uStack_ac = uStack_70._4_4_;
    bVar11 = *(byte *)(local_d8 + 0xc1);
    local_78 = (undefined8 **)local_b8;
    func_0x0001458580a0();
    uVar15 = (ulong)bVar11 ^ 5;
    if ((ulong)((long)local_c8 - (long)local_b8) < uVar15) {
      func_0x000145d14a10();
    }
    func_0x000145d145fb();
    local_b8 = local_b8 + uVar15;
    local_88 = (undefined8 **)local_c8;
    puStack_80 = puStack_c0;
    uStack_70 = CONCAT44(uStack_ac,uStack_b0);
    local_98 = local_90;
    local_61 = 1;
    local_62 = 0;
    local_78 = (undefined8 **)local_b8;
    func_0x000145858350();
    puVar12 = local_b8;
    if (local_c8 == local_b8) {
      func_0x000145d14a10();
    }
    puStack_c0[(long)puVar12] = 0x7d;
    local_78 = (undefined8 **)(puVar12 + 1);
    local_88 = (undefined8 **)local_c8;
    puStack_80 = puStack_c0;
    local_98 = local_90;
    local_61 = 0;
    local_62 = 0;
    func_0x000145855000();
    local_100 = (undefined8 **)CONCAT44(uStack_144,local_148);
    local_120 = local_140;
    lVar16 = lVar19 + 200;
    local_64 = local_130;
    local_118 = local_138;
    local_e8 = local_12f;
    uStack_e4 = uStack_12b;
    lVar19 = local_d8;
  } while( true );
}
