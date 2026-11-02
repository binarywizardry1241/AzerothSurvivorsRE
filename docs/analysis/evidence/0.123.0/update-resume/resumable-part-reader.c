
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined1  [16] entry(void)

{
  undefined1 auVar1 [16];
  undefined8 uVar2;
  undefined8 uVar3;
  uint uVar4;
  long lVar5;
  long in_RCX;
  undefined8 *puVar6;
  long lVar7;
  long *plVar8;
  undefined8 in_R8;
  undefined8 *puVar9;
  undefined8 *puVar10;
  ulong uVar11;
  ulong uVar12;
  double dVar13;
  undefined1 auVar14 [16];
  undefined1 auVar15 [16];
  undefined8 in_XMM6_Qa;
  undefined1 auVar16 [16];
  undefined1 auVar17 [12];
  ushort local_360;
  undefined1 local_358 [16];
  undefined8 *local_348;
  undefined8 uStack_340;
  undefined4 local_338;
  undefined4 uStack_334;
  undefined4 uStack_330;
  undefined4 uStack_32c;
  undefined4 local_328;
  undefined4 uStack_324;
  undefined4 uStack_320;
  undefined4 uStack_31c;
  undefined8 local_318;
  undefined8 uStack_310;
  undefined8 local_308;
  undefined8 uStack_300;
  undefined8 local_2f8;
  undefined1 local_248 [16];
  undefined8 *local_238;
  ulong uStack_230;
  undefined4 local_228;
  undefined4 uStack_224;
  undefined4 uStack_220;
  undefined4 uStack_21c;
  undefined4 local_218;
  undefined4 uStack_214;
  undefined4 uStack_210;
  undefined4 uStack_20c;
  undefined8 local_208;
  undefined8 uStack_200;
  undefined8 local_1f8;
  undefined8 uStack_1f0;
  undefined8 local_1e8;
  undefined8 **local_138;
  undefined8 local_130;
  undefined1 local_128 [16];
  undefined8 *local_118;
  undefined8 uStack_110;
  undefined4 local_108;
  undefined4 uStack_104;
  undefined4 uStack_100;
  undefined4 uStack_fc;
  undefined4 local_f8;
  undefined4 uStack_f4;
  undefined4 uStack_f0;
  undefined4 uStack_ec;
  undefined8 local_e8;
  undefined8 uStack_e0;
  undefined8 local_d8;
  undefined8 uStack_d0;
  undefined8 local_c8;
  undefined8 local_b8;
  long local_b0;
  undefined8 *local_a8;
  undefined8 *local_a0;
  long local_90;
  long local_88;
  ulong local_80;
  undefined1 local_78 [16];
  undefined1 local_61;
  undefined8 local_60;
  undefined8 local_58;
  
  local_60 = 0xfffffffffffffffe;
  local_b0 = in_RCX + 0x58;
  local_b8 = in_R8;
  local_88 = in_RCX;
  local_58 = in_XMM6_Qa;
  do {
    auVar16._8_8_ = local_78._8_8_;
    auVar16._0_8_ = local_78._0_8_;
    if (*(long *)(in_RCX + 0x28) == 0) {
      lVar7 = *(long *)(in_RCX + 0x10);
      if (lVar7 == *(long *)(in_RCX + 0x18)) {
        uVar11 = 0;
        goto LAB_140062562;
      }
      *(long *)(in_RCX + 0x10) = lVar7 + 0x20;
      puVar10 = *(undefined8 **)(lVar7 + 0x18);
      uVar2 = *(undefined8 *)(lVar7 + 0x10);
      uVar3 = *(undefined8 *)(lVar7 + 0x18);
      *(undefined8 *)(in_RCX + 0x28) = *(undefined8 *)(lVar7 + 8);
      *(undefined8 *)(in_RCX + 0x30) = uVar2;
      *(undefined8 *)(in_RCX + 0x38) = uVar3;
      *(undefined8 *)(in_RCX + 0x40) = 0;
      puVar9 = (undefined8 *)0x0;
      if (*(long *)(in_RCX + 0x48) == 0) goto LAB_140061c62;
LAB_140061bde:
      local_78._8_8_ = *(long *)(in_RCX + 0x50);
    }
    else {
      puVar10 = *(undefined8 **)(in_RCX + 0x38);
      puVar9 = *(undefined8 **)(in_RCX + 0x40);
      if (*(long *)(in_RCX + 0x48) != 0) goto LAB_140061bde;
LAB_140061c62:
      local_a8 = puVar9;
      func_0x000140476d20();
      if (puVar9 != (undefined8 *)0x0) {
        local_1e8 = local_c8;
        local_1f8 = local_d8;
        uStack_1f0 = uStack_d0;
        local_208 = local_e8;
        uStack_200 = uStack_e0;
        local_218 = local_f8;
        uStack_214 = uStack_f4;
        uStack_210 = uStack_f0;
        uStack_20c = uStack_ec;
        local_228 = local_108;
        uStack_224 = uStack_104;
        uStack_220 = uStack_100;
        uStack_21c = uStack_fc;
        local_238 = local_118;
        uStack_230 = uStack_110;
        local_138 = &local_a8;
        local_130 = 0x145fea740;
        local_248 = local_128;
        func_0x000145fd7da0();
        local_78._8_8_ = local_358._0_8_;
        local_78._0_8_ = local_358._8_8_;
        func_0x00014047a970();
        local_118 = local_348;
        uStack_110 = uStack_340;
        local_108 = local_338;
        uStack_104 = uStack_334;
        uStack_100 = uStack_330;
        uStack_fc = uStack_32c;
        local_f8 = local_328;
        uStack_f4 = uStack_324;
        uStack_f0 = uStack_320;
        uStack_ec = uStack_31c;
        local_e8 = local_318;
        uStack_e0 = uStack_310;
        local_d8 = local_308;
        uStack_d0 = uStack_300;
        local_c8 = local_2f8;
        local_128 = local_358;
        if (local_78._8_8_ != 0) {
          func_0x0001400021d0();
        }
      }
      local_1e8 = local_c8;
      local_1f8 = local_d8;
      uStack_1f0 = uStack_d0;
      local_208 = local_e8;
      uStack_200 = uStack_e0;
      local_218 = local_f8;
      uStack_214 = uStack_f4;
      uStack_210 = uStack_f0;
      uStack_20c = uStack_ec;
      local_228 = local_108;
      uStack_224 = uStack_104;
      uStack_220 = uStack_100;
      uStack_21c = uStack_fc;
      local_238 = local_118;
      uStack_230 = uStack_110;
      local_248 = local_128;
      func_0x00014047aa70();
      if (local_358._0_8_ != -2) {
        func_0x00014600504b();
        uVar4 = func_0x00014047faa0();
                    /* WARNING: Could not emulate address calculation at 0x000140062090 */
                    /* WARNING: Treating indirect jump as call */
        auVar16 = (*(code *)((long)*(int *)((ulong)(uVar4 & 3) * 4 + 0x1461ba2ec) + 0x1461ba2ec))();
        return auVar16;
      }
      func_0x00014600504b();
      uVar4 = (uint)local_360;
      local_78 = func_0x00014047cac0();
      in_RCX = local_88;
      local_358 = local_78;
      lVar7 = local_78._0_8_;
      if ((puVar9 != (undefined8 *)0x0) && ((uVar4 & 0xffff) != 0xce)) {
        local_248._8_8_ = local_a8;
        local_238 = local_a8;
        local_248._0_8_ = local_358;
        auVar16 = func_0x0001402131e0();
        puVar6 = auVar16._8_8_;
        if (((auVar16._0_8_ & 1) != 0) ||
           (puVar6 = (undefined8 *)0x2500000003, lVar7 = local_358._0_8_, auVar16._8_8_ < local_a8))
        {
          local_78._8_8_ = local_358._0_8_;
          local_78._0_8_ = local_358._8_8_;
          if (*(code **)local_358._8_8_ != (code *)0x0) {
            (**(code **)local_358._8_8_)();
          }
          if (*(long *)(local_78._0_8_ + 8) != 0) {
            func_0x0001400021d0();
                    /* WARNING: Could not emulate address calculation at 0x000140061f78 */
                    /* WARNING: Treating indirect jump as call */
            auVar16 = (*(code *)((long)*(int *)((ulong)((uint)puVar6 & 3) * 4 + 0x1461ba2ec) +
                                0x1461ba2ec))();
            return auVar16;
          }
                    /* WARNING: Could not emulate address calculation at 0x000140062137 */
                    /* WARNING: Treating indirect jump as call */
          auVar16 = (*(code *)((long)*(int *)((ulong)((uint)puVar6 & 3) * 4 + 0x1461ba2ec) +
                              0x1461ba2ec))();
          return auVar16;
        }
      }
      local_78 = local_358;
      if (lVar7 == 0) goto LAB_140061bfe;
      local_90 = *(long *)(in_RCX + 0x48);
      auVar16 = local_358;
      if (local_90 != 0) {
        local_a0 = *(undefined8 **)(in_RCX + 0x50);
        if ((code *)*local_a0 != (code *)0x0) {
          (*(code *)*local_a0)();
          auVar16 = local_78;
        }
        in_RCX = local_88;
        if (local_a0[1] != 0) {
          local_78 = auVar16;
          func_0x0001400021d0();
          auVar16 = local_78;
        }
      }
      local_78._8_8_ = auVar16._8_8_;
      *(undefined1 (*) [16])(in_RCX + 0x48) = auVar16;
    }
    puVar6 = (undefined8 *)(local_78._8_8_ + 0x18);
    local_78 = auVar16;
    auVar16 = (*(code *)*puVar6)();
    uVar11 = auVar16._8_8_;
    local_78._8_8_ = uVar11;
    if ((auVar16._0_8_ & 1) != 0) {
LAB_140061bfe:
                    /* WARNING: Could not emulate address calculation at 0x000140061c0c */
                    /* WARNING: Treating indirect jump as call */
      auVar16 = (*(code *)((long)*(int *)((ulong)(local_78._8_4_ & 3) * 4 + 0x1461ba2ec) +
                          0x1461ba2ec))();
      return auVar16;
    }
    if ((puVar9 < puVar10) && (uVar11 == 0)) {
      uVar4 = func_0x000145fa8a50();
                    /* WARNING: Could not emulate address calculation at 0x000140061fbf */
                    /* WARNING: Treating indirect jump as call */
      auVar16 = (*(code *)((long)*(int *)((ulong)(uVar4 & 3) * 4 + 0x1461ba2ec) + 0x1461ba2ec))();
      return auVar16;
    }
    if (uVar11 != 0) {
      *(undefined4 *)(in_RCX + 0x58) = 0;
      if (*(long *)(in_RCX + 0x28) != 0) {
        *(long *)(in_RCX + 0x40) = *(long *)(in_RCX + 0x40) + uVar11;
      }
      plVar8 = *(long **)(in_RCX + 0x20);
      lVar7 = *plVar8 + uVar11;
      *plVar8 = lVar7;
      local_61 = 0;
      local_80 = uVar11;
      auVar17 = func_0x000145faed80();
      auVar14._8_4_ = auVar17._4_4_;
      auVar14._0_8_ = auVar17._0_8_;
      auVar14._12_4_ = uRam00000001461b8164;
      dVar13 = (double)auVar17._8_4_ / _DAT_1461b8180 +
               (auVar14._8_8_ - dRam00000001461b8178) +
               ((double)CONCAT44(_DAT_1461b8160,auVar17._0_4_) - _DAT_1461b8170);
      if (_DAT_1461b8188 <= dVar13) {
        lVar5 = lVar7 - plVar8[3];
        auVar15._8_4_ = (int)((ulong)lVar5 >> 0x20);
        auVar15._0_8_ = lVar5;
        auVar15._12_4_ = uRam00000001461b8164;
        dVar13 = ((auVar15._8_8_ - dRam00000001461b8178) +
                 ((double)CONCAT44(_DAT_1461b8160,(int)lVar5) - _DAT_1461b8170)) / dVar13;
        uVar12 = -(ulong)((double)plVar8[2] == 0.0);
        uVar12 = ~uVar12 & (ulong)(_DAT_1461b8198 * dVar13 + _DAT_1461b8190 * (double)plVar8[2]) |
                 (ulong)dVar13 & uVar12;
        plVar8[2] = uVar12;
        local_61 = 0;
        local_80 = uVar11;
        auVar17 = func_0x000145faec30();
        *(undefined1 (*) [12])(plVar8 + 6) = auVar17;
        plVar8[3] = lVar7;
      }
      else {
        uVar12 = plVar8[2];
      }
      local_61 = 0;
      local_80 = uVar11;
      func_0x000140062980();
      local_238 = (undefined8 *)plVar8[1];
      local_248._0_8_ = 2;
      local_61 = 0;
      local_248._8_8_ = lVar7;
      uStack_230 = uVar12;
      local_80 = uVar11;
      func_0x000140056cd0();
LAB_140062562:
      auVar1._8_8_ = 0;
      auVar1._0_8_ = uVar11;
      return auVar1 << 0x40;
    }
    *(undefined8 *)(in_RCX + 0x28) = 0;
    local_78._8_8_ = *(long *)(in_RCX + 0x48);
    if (local_78._8_8_ != 0) {
      local_78._0_8_ = *(undefined8 *)(in_RCX + 0x50);
      if (*(code **)local_78._0_8_ != (code *)0x0) {
        (**(code **)local_78._0_8_)();
      }
      in_RCX = local_88;
      if (*(long *)(local_78._0_8_ + 8) != 0) {
        func_0x0001400021d0();
      }
    }
    *(undefined8 *)(in_RCX + 0x48) = 0;
  } while( true );
}

