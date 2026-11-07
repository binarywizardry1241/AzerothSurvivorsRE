
/* WARNING: Type propagation algorithm not settling */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(void)

{
  int *piVar1;
  int iVar2;
  undefined8 uVar3;
  code *pcVar4;
  long lVar5;
  undefined1 auVar6 [16];
  undefined1 auVar7 [16];
  byte bVar8;
  undefined4 uVar9;
  uint uVar10;
  ulong uVar11;
  ulong *******pppppppuVar12;
  ulong *******pppppppuVar13;
  undefined1 *puVar14;
  uint uVar15;
  ulong *******in_RCX;
  ulong *******pppppppuVar16;
  ulong ******ppppppuVar17;
  undefined4 extraout_EDX;
  uint uVar18;
  ulong uVar19;
  long lVar20;
  ulong ******ppppppuVar21;
  char cVar22;
  ulong ******ppppppuVar23;
  uint uVar24;
  undefined8 uVar25;
  ulong uVar26;
  undefined1 uVar27;
  undefined8 in_R9;
  undefined7 uVar28;
  long lVar29;
  ulong *******pppppppuVar30;
  int iVar31;
  ulong ******ppppppuVar32;
  ulong *******pppppppuVar33;
  long lVar34;
  ulong *******pppppppuVar35;
  bool bVar36;
  float fVar37;
  float fVar38;
  float fVar39;
  float fVar40;
  float fVar41;
  undefined4 in_XMM6_Da;
  float fVar42;
  undefined4 in_XMM7_Da;
  float fVar43;
  float fVar44;
  float fVar45;
  float fVar46;
  undefined1 auVar47 [16];
  ulong *******local_290;
  ulong *******local_288;
  ulong *******local_280;
  undefined1 local_278;
  undefined4 local_277;
  undefined1 uStack_274;
  undefined3 uStack_273;
  undefined8 local_270;
  undefined8 uStack_268;
  undefined8 local_260;
  undefined8 uStack_258;
  ulong ******local_250;
  ulong ******ppppppuStack_248;
  ulong ******local_240;
  ulong *******local_238;
  ulong *******local_230;
  ulong local_228;
  ulong local_220;
  ulong local_218;
  undefined1 local_210 [16];
  undefined8 local_200;
  undefined8 local_1f8;
  ulong *******local_1f0;
  ulong *******local_1e8;
  ulong *******local_1e0;
  ulong *******local_1d8;
  undefined1 local_1d0;
  int local_1cf;
  undefined3 uStack_1cb;
  ulong ******local_1c8;
  ulong *******local_1c0;
  ulong *******local_1b8;
  ulong *******local_1b0;
  ulong *******local_1a8;
  ulong *******local_1a0;
  ulong *******local_198;
  ulong *******local_190;
  undefined8 local_188;
  undefined8 uStack_180;
  undefined8 local_178;
  undefined8 uStack_170;
  undefined8 local_168;
  undefined8 local_160;
  int *local_158;
  undefined8 local_150;
  undefined8 local_148;
  undefined8 local_140;
  ulong *******local_138;
  undefined8 local_130;
  int local_124;
  ulong *******local_120;
  ulong *******local_118;
  ulong *******pppppppuStack_110;
  ulong *******local_108;
  ulong *******local_f8;
  ulong *******local_f0;
  ulong local_e8;
  undefined1 local_da;
  undefined1 local_d9;
  undefined1 local_d8;
  undefined1 local_d7;
  undefined1 local_d6;
  undefined1 local_d5;
  undefined1 local_d4;
  undefined1 local_d3;
  undefined1 local_d2;
  char local_d1;
  undefined8 local_d0;
  undefined4 local_c8;
  undefined4 local_b8;

  local_d0 = 0xfffffffffffffffe;
  if ((*(int *)(in_RCX + 2) != 2) && (*(char *)((long)in_RCX + 0x9c9) != '\0')) {
    local_f8 = (ulong *******)CONCAT44(local_f8._4_4_,*(undefined4 *)(in_RCX + 0x84));
    fVar41 = *(float *)((long)in_RCX + 0x944);
    uVar11 = (ulong)*(uint *)(in_RCX + 0x110);
    local_1c8 = in_RCX[0x1f0];
    local_f0 = (ulong *******)(ulong)*(byte *)((long)in_RCX + 0x2ac);
    local_1c0 = (ulong *******)in_RCX[0x47];
    local_1b8 = (ulong *******)in_RCX[0x48];
    fVar46 = (float)*(ushort *)(in_RCX + 0x4b);
    fVar37 = (float)*(uint *)((long)in_RCX + 0x684) / (fVar46 / _DAT_14590753c);
    ppppppuVar17 = (ulong ******)0x0;
    fVar44 = 0.0;
    ppppppuVar21 = (ulong ******)((long)fVar37 & 0xffffffff);
    if (fVar37 < 0.0) {
      ppppppuVar21 = ppppppuVar17;
    }
    if (_DAT_14590752c < fVar37) {
      ppppppuVar21 = (ulong ******)0xffffffff;
    }
    uVar19 = (ulong)*(uint *)(in_RCX + 0xd2);
    fVar37 = _DAT_14590753c;
    fVar45 = _DAT_14590752c;
    local_1a0 = in_RCX;
    local_c8 = in_XMM6_Da;
    local_b8 = in_XMM7_Da;
    local_e8 = func_0x000145420480(ppppppuVar21,uVar19,local_1b8,local_1c0);
    lVar29 = uVar19 * 8;
    fVar42 = (float)(long)ppppppuVar21 * _DAT_1459132f0;
    fVar38 = (float)func_0x00014577322f(fVar42);
    ppppppuVar21 = (ulong ******)(long)fVar38;
    if (_DAT_145a2ea80 < fVar38) {
      ppppppuVar21 = (ulong ******)0x7fffffffffffffff;
    }
    if (NAN(fVar38)) {
      ppppppuVar21 = ppppppuVar17;
    }
    fVar43 = (fVar41 / _DAT_1459158a4) * _DAT_145907510;
    fVar38 = _DAT_145a2ea80;
    fVar39 = (float)func_0x00014577322f(fVar43);
    local_270 = (ulong ******)(long)fVar39;
    if (fVar38 < fVar39) {
      local_270 = (ulong ******)0x7fffffffffffffff;
    }
    if (NAN(fVar39)) {
      local_270 = ppppppuVar17;
    }
    ppppppuVar17 = (ulong ******)(lVar29 * 5);
    lVar29 = -200;
    if (uVar11 == 0) {
      lVar29 = 0;
    }
    ppppppuVar32 = (ulong ******)0xc8;
    fVar39 = _DAT_145915850;
    if (uVar11 == 0) {
      ppppppuVar32 = (ulong ******)0x0;
      fVar39 = 0.0;
    }
    fVar40 = _DAT_145907490;
    local_218 = uVar11;
    fVar42 = (float)func_0x00014577322f((((float)(int)local_e8 * _DAT_14673ded0) / _DAT_1459e492c +
                                        _DAT_145907490) *
                                        ((float)(long)uVar19 * _DAT_145913350 + fVar43 + fVar42 +
                                        fVar39));
    pppppppuVar30 = local_1a0;
    ppppppuVar23 = (ulong ******)0x0;
    uVar11 = (long)fVar42 & 0xffffffff;
    if (fVar42 < fVar44) {
      uVar11 = 0;
    }
    if (fVar45 < fVar42) {
      uVar11 = 0xffffffff;
    }
    lVar34 = (long)ppppppuVar17 + (long)local_270 + (long)ppppppuVar21;
    local_250 = (ulong ******)((lVar29 - lVar34) + uVar11);
    lVar29 = lVar34 + (long)ppppppuVar32 + (long)local_250;
    local_e8 = (long)fVar41 & 0xffffffff;
    if (fVar41 < fVar44) {
      local_e8 = 0;
    }
    fVar44 = ((float)*(ushort *)((long)local_1a0 + 0x25e) + _DAT_146074e20) / fVar37;
    if (fVar45 < fVar41) {
      local_e8 = 0xffffffff;
    }
    fVar40 = fVar44 + fVar44 +
             (((float)*(ushort *)((long)local_1a0 + 0x25c) + _DAT_146074e20) / fVar37) *
             _DAT_145907534 +
             (((float)*(ushort *)((long)local_1a0 + 0x25a) + _DAT_146074e20) / fVar37) *
             _DAT_14593fc74 + ((fVar46 + _DAT_146074e20) / fVar37) * _DAT_1459158a0 + fVar40;
    if (_DAT_1459132f4 <= fVar40) {
      fVar40 = _DAT_1459132f4;
    }
    uStack_268 = ppppppuVar21;
    local_260 = ppppppuVar17;
    uStack_258 = ppppppuVar32;
    fVar41 = (float)func_0x00014577322f((fVar40 + _DAT_14590750c) * (float)lVar29);
    ppppppuStack_248 = (ulong ******)(long)fVar41;
    ppppppuVar21 = (ulong ******)0x7fffffffffffffff;
    if (fVar38 < fVar41) {
      ppppppuStack_248 = (ulong ******)0x7fffffffffffffff;
    }
    if (NAN(fVar41)) {
      ppppppuStack_248 = ppppppuVar23;
    }
    fVar41 = (float)func_0x00014577322f((float)((long)ppppppuStack_248 + lVar29) *
                                        *(float *)(pppppppuVar30 + 0x200));
    local_240 = (ulong ******)(long)fVar41;
    if (fVar38 < fVar41) {
      local_240 = ppppppuVar21;
    }
    if (NAN(fVar41)) {
      local_240 = ppppppuVar23;
    }
    pppppppuVar12 = pppppppuVar30 + 0x1f1;
    local_178 = (ulong *******)0x0;
    uStack_170 = 7;
    local_188 = (ulong *******)&local_270;
    uStack_180 = pppppppuVar12;
    func_0x0001455457e0();
    auVar7._8_8_ = local_210._8_8_;
    auVar7._0_8_ = local_210._0_8_;
    auVar47._8_8_ = local_210._8_8_;
    auVar47._0_8_ = local_210._0_8_;
    uVar28 = (undefined7)((ulong)in_R9 >> 8);
    ppppppuVar21 = local_1c8;
    if (local_228 == 0) {
      local_124 = 0;
      pppppppuVar12[6] = local_240;
      pppppppuVar12[4] = local_250;
      pppppppuVar12[5] = ppppppuStack_248;
      pppppppuVar12[2] = local_260;
      pppppppuVar12[3] = uStack_258;
      *(undefined4 *)pppppppuVar12 = (undefined4)local_270;
      *(undefined4 *)((long)pppppppuVar12 + 4) = local_270._4_4_;
      *(undefined4 *)(pppppppuVar12 + 1) = (undefined4)uStack_268;
      *(undefined4 *)((long)pppppppuVar12 + 0xc) = uStack_268._4_4_;
      bVar36 = local_1c8 != (ulong ******)0xffffff;
      uVar9 = (undefined4)CONCAT71(uVar28,1);
    }
    else {
      if (local_228 < 5) {
        uVar11 = 0;
        lVar29 = 0;
      }
      else {
        uVar11 = 4;
        if ((local_228 & 3) != 0) {
          uVar11 = (ulong)((uint)local_228 & 3);
        }
        uVar11 = local_228 - uVar11;
        pppppppuVar16 = local_230 + 5;
        lVar29 = 0;
        lVar34 = 0;
        lVar20 = 0;
        lVar5 = 0;
        uVar19 = uVar11;
        do {
          lVar20 = lVar20 + (long)pppppppuVar16[-4];
          lVar5 = lVar5 + (long)pppppppuVar16[-2];
          lVar29 = lVar29 + (long)*pppppppuVar16;
          lVar34 = lVar34 + (long)pppppppuVar16[2];
          pppppppuVar16 = pppppppuVar16 + 8;
          uVar19 = uVar19 - 4;
        } while (uVar19 != 0);
        lVar29 = lVar34 + lVar5 + lVar29 + lVar20;
      }
      pppppppuVar16 = local_230 + uVar11 * 2 + 1;
      do {
        lVar29 = lVar29 + (long)*pppppppuVar16;
        uVar11 = uVar11 + 1;
        pppppppuVar16 = pppppppuVar16 + 2;
      } while (local_228 != uVar11);
      lVar34 = 0;
      if (0 < lVar29) {
        lVar34 = lVar29;
      }
      local_124 = (int)lVar34;
      pppppppuVar12[6] = local_240;
      pppppppuVar12[4] = local_250;
      pppppppuVar12[5] = ppppppuStack_248;
      *(undefined4 *)(pppppppuVar12 + 2) = (undefined4)local_260;
      *(undefined4 *)((long)pppppppuVar12 + 0x14) = local_260._4_4_;
      *(undefined4 *)(pppppppuVar12 + 3) = (undefined4)uStack_258;
      *(undefined4 *)((long)pppppppuVar12 + 0x1c) = uStack_258._4_4_;
      *(undefined4 *)pppppppuVar12 = (undefined4)local_270;
      *(undefined4 *)((long)pppppppuVar12 + 4) = local_270._4_4_;
      *(undefined4 *)(pppppppuVar12 + 1) = (undefined4)uStack_268;
      *(undefined4 *)((long)pppppppuVar12 + 0xc) = uStack_268._4_4_;
      uVar9 = (undefined4)CONCAT71(uVar28,1);
      bVar36 = local_1c8 != (ulong ******)0xffffff;
      local_210 = auVar47;
      if ((bVar36) && (local_210 = auVar7, local_124 != 0)) {
        lVar29 = 0;
        do {
          lVar34 = lVar29;
          if ((long)pppppppuVar30[0x151] << 5 == lVar34) {
            local_220 = 0;
            goto LAB_14544a7b6;
          }
          lVar29 = lVar34 + 0x20;
        } while (*(char *)((long)pppppppuVar30[0x150] + lVar34 + 4) != (char)local_f0);
        local_220 = (ulong)*(uint *)((long)pppppppuVar30[0x150] + lVar34);
LAB_14544a7b6:
        local_d1 = 1;
        uVar9 = func_0x00014542f260();
        local_1f0 = (ulong *******)CONCAT44(local_1f0._4_4_,uVar9);
        local_d1 = 1;
        uVar9 = extraout_EDX;
        func_0x0001454356a0();
        uVar24 = 0;
        lVar29 = 0;
        do {
          lVar34 = lVar29;
          if ((long)pppppppuVar30[0x151] << 5 == lVar34) goto LAB_14544a818;
          lVar29 = lVar34 + 0x20;
        } while (*(char *)((long)pppppppuVar30[0x150] + lVar34 + 4) != (char)local_f0);
        uVar24 = *(uint *)((long)pppppppuVar30[0x150] + lVar34);
LAB_14544a818:
        uVar10 = 0x6e;
        do {
          uVar15 = uVar24 - (uVar10 - 0x1e);
          if (((uVar24 < uVar10 - 0x1e) || (uVar18 = uVar15 - (uVar10 - 0xf), uVar15 < uVar10 - 0xf)
              ) || (uVar24 = uVar18 - uVar10, uVar18 < uVar10)) break;
          uVar10 = uVar10 + 0x2d;
        } while (uVar10 != 0x36b);
        uVar24 = (int)local_f0 - 2;
        if ((byte)uVar24 < 10) {
          lVar29 = *(long *)((ulong)(uVar24 & 0xff) * 8 + 0x14673e938);
        }
        else {
          lVar29 = 0x146735848;
        }
        local_118 = (ulong *******)(lVar29 + 0x10);
        pppppppuStack_110 = (ulong *******)0x1400020c0;
        local_d1 = 1;
        func_0x000145728390();
        local_198 = local_230;
        local_1a8 = (ulong *******)CONCAT44(local_1a8._4_4_,uVar9);
        uVar25 = *(undefined8 *)(lVar29 + 0x20);
        uVar3 = *(undefined8 *)(lVar29 + 0x28);
        local_120 = uStack_180;
        local_210 = func_0x000145457cb0();
        if (local_188 != (ulong *******)0x0) {
          func_0x0001400021d0();
        }
        auVar6._8_8_ = uVar3;
        auVar6._0_8_ = uVar25;
        if (local_210._0_8_ == 0) {
          local_210 = auVar6;
        }
        func_0x000140002200();
        local_120 = (ulong *******)0x1;
        pppppppuVar12 = (ulong *******)func_0x0001400021c0();
        pppppppuVar30 = local_1a0;
        if (pppppppuVar12 == (ulong *******)0x0) {
          local_d1 = 1;
          func_0x00014590379b();
          goto LAB_14544bc21;
        }
        *(undefined1 *)pppppppuVar12 = 0x5b;
        pppppppuVar33 = local_198 + local_228 * 2;
        uVar27 = 1;
        pppppppuVar16 = (ulong *******)&local_1e8;
        pppppppuVar13 = (ulong *******)0x1;
        local_1b0 = pppppppuVar12;
        local_190 = local_238;
        for (pppppppuVar35 = local_198; pppppppuVar35 != pppppppuVar33;
            pppppppuVar35 = pppppppuVar35 + 2) {
          while (0 < (long)pppppppuVar35[1]) {
            ppppppuVar21 = *pppppppuVar35;
            local_1e8 = local_120;
            uStack_1cb = (undefined3)((ulong)local_200 >> 0x20);
            local_1cf = (int)local_200;
            local_1e0 = pppppppuVar12;
            local_1d8 = pppppppuVar13;
            local_1d0 = uVar27;
            func_0x000140002200();
            pppppppuVar12 = (ulong *******)func_0x0001400021c0();
            if (pppppppuVar12 == (ulong *******)0x0) {
              local_d5 = 1;
              func_0x00014590379b();
              goto LAB_14544bc21;
            }
            *(undefined1 *)pppppppuVar12 = 0x7b;
            local_188 = (ulong *******)0x1;
            local_178 = (ulong *******)0x1;
            uStack_170 = CONCAT71(uStack_170._1_7_,1);
            uStack_180 = pppppppuVar12;
            if (ppppppuVar21 == (ulong ******)0x5) {
              local_d6 = 1;
              func_0x000145457cb0();
            }
            else {
              local_d6 = 1;
              func_0x000145457cb0();
              if (ppppppuVar21 < (ulong ******)0x5) {
                local_d6 = 1;
                func_0x000145457cb0();
              }
            }
            local_d6 = 0;
            func_0x000145456ed0();
            local_d5 = 1;
            func_0x000145453d10();
            pppppppuVar12 = local_178;
            pppppppuVar16 = (ulong *******)&local_1e8;
            if (local_188 == local_178) {
              func_0x0001457744b0();
            }
            *(undefined1 *)((long)uStack_180 + (long)pppppppuVar12) = 0x7d;
            local_108 = (ulong *******)((long)pppppppuVar12 + 1);
            local_118 = local_188;
            pppppppuStack_110 = uStack_180;
            local_d5 = 0;
            func_0x0001454569d0();
            pppppppuVar35 = pppppppuVar35 + 2;
            local_120 = local_290;
            local_200._0_7_ = CONCAT43(CONCAT31(uStack_273,uStack_274),(int3)local_277);
            local_1b0 = local_288;
            pppppppuVar13 = local_280;
            pppppppuVar12 = local_288;
            uVar27 = local_278;
            if (pppppppuVar35 == pppppppuVar33) goto LAB_14544abfd;
          }
        }
LAB_14544abfd:
        bVar36 = local_190 != (ulong *******)0x0;
        local_190 = pppppppuVar13;
        if (bVar36) {
          func_0x0001400021d0();
        }
        func_0x000140002200();
        puVar14 = (undefined1 *)func_0x0001400021c0();
        ppppppuVar21 = local_1c8;
        iVar31 = (uint)local_1a8;
        if (puVar14 == (undefined1 *)0x0) {
          local_d2 = 1;
          func_0x00014590379b();
          goto LAB_14544bc21;
        }
        *puVar14 = 0x7b;
        local_188 = (ulong *******)0x1;
        local_178 = (ulong *******)0x1;
        uStack_170 = CONCAT71(uStack_170._1_7_,1);
        local_d2 = 1;
        uStack_180 = (ulong *******)puVar14;
        func_0x000145456ed0();
        local_d2 = 1;
        func_0x000145454010();
        local_d2 = 1;
        func_0x000145454010();
        local_d2 = 1;
        func_0x000145454010();
        local_d2 = 1;
        func_0x000145454010();
        iVar31 = iVar31 - (uint)local_1f0;
        local_d2 = 1;
        func_0x000145454010();
        local_d2 = 1;
        func_0x000145454010();
        local_d2 = 1;
        func_0x000145454010();
        local_d2 = 1;
        func_0x000145456ed0();
        local_188 = local_120;
        uStack_180 = local_1b0;
        local_178 = local_190;
        iVar2 = (int)local_200;
        uStack_170._0_5_ = CONCAT41(iVar2,uVar27);
        uStack_170 = CONCAT44(local_200._3_4_,(undefined4)uStack_170);
        if (local_120 == local_190) {
          func_0x0001457744b0();
        }
        uVar25 = 0x14673e30e;
        *(undefined1 *)((long)uStack_180 + (long)local_190) = 0x5d;
        local_1d8 = (ulong *******)((long)local_190 + 1);
        local_1e8 = local_188;
        local_1e0 = uStack_180;
        local_d9 = 0;
        func_0x000145456d90();
        pppppppuVar12 = local_178;
        if (local_188 == local_178) {
          func_0x0001457744b0();
          *(undefined1 *)((long)uStack_180 + (long)pppppppuVar12) = 0x7d;
          iVar2 = *(int *)(pppppppuVar30 + 2);
          pppppppuVar13 = local_198;
          pppppppuVar35 = local_190;
          local_198 = local_188;
          local_190 = uStack_180;
        }
        else {
          *(undefined1 *)((long)uStack_180 + (long)local_178) = 0x7d;
          iVar2 = *(int *)(pppppppuVar30 + 2);
          pppppppuVar13 = local_198;
          pppppppuVar35 = local_190;
          local_198 = local_188;
          local_190 = uStack_180;
        }
        local_188 = local_198;
        uStack_180 = local_190;
        pppppppuVar33 = local_198;
        if (iVar2 != 2) {
          if (iVar31 == 1) {
            local_d3 = 1;
            func_0x000145457cb0();
            local_188 = (ulong *******)0x14673e104;
            uStack_180 = (ulong *******)0x5;
            local_178 = (ulong *******)local_210;
            uStack_170 = 0x14673e0e0;
            local_160 = 2;
            local_158 = &local_124;
            local_150 = 0x14673e390;
            local_d3 = 1;
            local_168 = uVar25;
            func_0x000145458060();
          }
          else if ((uint)local_1f0 < (uint)local_1a8) {
            local_d3 = 1;
            func_0x000145457cb0();
            local_1e8 = (ulong *******)CONCAT44(local_1e8._4_4_,iVar31);
            local_188 = (ulong *******)0x14673e104;
            uStack_180 = (ulong *******)0x5;
            local_178 = (ulong *******)local_210;
            uStack_170 = 0x14673e0e0;
            local_160 = 2;
            local_158 = &local_124;
            local_150 = 0x14673e390;
            local_148 = 0x14673e435;
            local_140 = 1;
            local_130 = 0x14673e390;
            local_d3 = 1;
            local_168 = uVar25;
            local_138 = pppppppuVar16;
            func_0x000145458060();
          }
          else {
            local_d3 = 1;
            func_0x000145457cb0();
            local_188 = (ulong *******)0x14673e104;
            uStack_180 = (ulong *******)0x5;
            local_178 = (ulong *******)local_210;
            uStack_170 = 0x14673e0e0;
            local_160 = 2;
            local_158 = &local_124;
            local_150 = 0x14673e390;
            local_d3 = 1;
            local_168 = uVar25;
            func_0x000145458060();
          }
          local_1e8 = (ulong *******)&local_118;
          local_1e0 = (ulong *******)0x1400020e0;
          local_da = 1;
          func_0x000145728390();
          ppppppuVar21 = local_1c8;
          local_1a8 = local_188;
          local_d7 = 1;
          local_1f0 = uStack_180;
          func_0x00014545dc90();
          ppppppuVar17 = pppppppuVar30[0xae];
          if (ppppppuVar17 == pppppppuVar30[0xac]) {
            func_0x000145774710();
          }
          ppppppuVar32 = pppppppuVar30[0xad];
          ppppppuVar23 = ppppppuVar32 + (long)ppppppuVar17 * 4 + 2;
          *(undefined4 *)ppppppuVar23 = (undefined4)local_178;
          *(undefined4 *)((long)ppppppuVar23 + 4) = local_178._4_4_;
          *(undefined4 *)(ppppppuVar23 + 1) = (undefined4)uStack_170;
          *(undefined4 *)((long)ppppppuVar23 + 0xc) = uStack_170._4_4_;
          ppppppuVar32 = ppppppuVar32 + (long)ppppppuVar17 * 4;
          *(undefined4 *)ppppppuVar32 = (undefined4)local_188;
          *(undefined4 *)((long)ppppppuVar32 + 4) = local_188._4_4_;
          *(undefined4 *)(ppppppuVar32 + 1) = (undefined4)uStack_180;
          *(undefined4 *)((long)ppppppuVar32 + 0xc) = uStack_180._4_4_;
          pppppppuVar30[0xae] = (ulong ******)((long)ppppppuVar17 + 1);
          ppppppuVar17 = pppppppuVar30[0xb1];
          if (ppppppuVar17 == pppppppuVar30[0xaf]) {
            func_0x0001457745c0();
          }
          ppppppuVar32 = pppppppuVar30[0xb0];
          ppppppuVar32[(long)ppppppuVar17 * 3] = (ulong *****)local_198;
          ppppppuVar32[(long)ppppppuVar17 * 3 + 1] = (ulong *****)local_190;
          ppppppuVar32[(long)ppppppuVar17 * 3 + 2] = (ulong *****)((long)pppppppuVar12 + 1);
          pppppppuVar30[0xb1] = (ulong ******)((long)ppppppuVar17 + 1);
          pppppppuVar13 = local_198;
          pppppppuVar35 = local_190;
          pppppppuVar33 = local_118;
          if (local_1a8 != (ulong *******)0x0) {
            func_0x0001400021d0();
            pppppppuVar13 = local_198;
            pppppppuVar35 = local_190;
            pppppppuVar33 = local_118;
          }
        }
        local_190 = pppppppuVar35;
        local_198 = pppppppuVar13;
        if (pppppppuVar33 != (ulong *******)0x0) {
          func_0x0001400021d0();
        }
        bVar36 = true;
        uVar9 = 0;
      }
    }
    ppppppuVar32 = pppppppuVar30[0x144];
    lVar29 = 0;
    ppppppuVar17 = ppppppuVar32;
    do {
      lVar34 = lVar29;
      if ((long)pppppppuVar30[0x145] * 0x38 - lVar34 == 0) {
        if ((pppppppuVar30[0x1b8] != (ulong ******)0xffffffffffffffff) &&
           (pppppppuVar30[0x1bb] == ppppppuVar21)) {
          uVar24 = *(uint *)(pppppppuVar30 + 0x1bc);
          if (*(uint *)(pppppppuVar30 + 0x1bc) < (uint)local_f8) {
            uVar24 = (uint)local_f8;
          }
          *(uint *)(pppppppuVar30 + 0x1bc) = uVar24;
        }
        goto LAB_14544b3cf;
      }
      ppppppuVar23 = ppppppuVar17 + 3;
      ppppppuVar17 = ppppppuVar17 + 7;
      lVar29 = lVar34 + 0x38;
    } while ((ulong ******)*ppppppuVar23 != ppppppuVar21);
    uVar24 = *(uint *)((long)ppppppuVar32 + lVar34 + 0x20);
    if (uVar24 < (uint)local_f8) {
      uVar24 = (uint)local_f8;
    }
    uVar10 = *(uint *)((long)ppppppuVar32 + lVar34 + 0x24);
    *(uint *)((long)ppppppuVar32 + lVar34 + 0x20) = uVar24;
    if (uVar10 < (uint)local_e8) {
      uVar10 = (uint)local_e8;
    }
    *(uint *)((long)ppppppuVar32 + lVar34 + 0x24) = uVar10;
LAB_14544b3cf:
    if (*(char *)((long)pppppppuVar30 + 0x1042) == '\0') {
      local_e8 = CONCAT44(local_e8._4_4_,uVar9);
      *(undefined1 *)((long)pppppppuVar30 + 0x1042) = 1;
      if (((byte)local_218 & bVar36) != 0) {
        uVar11 = func_0x000145420480();
        if (uVar11 < 0xb) {
          ppppppuVar17 = pppppppuVar30[0x147];
          ppppppuVar32 = pppppppuVar30[0x148];
          lVar34 = (long)ppppppuVar32 << 4;
          lVar29 = 0;
          do {
            lVar20 = lVar29;
            if (lVar34 == lVar20) goto LAB_14544b493;
            lVar29 = lVar20 + 0x10;
          } while (*(char *)((long)ppppppuVar17 + lVar20) != (char)local_f0);
          uVar19 = *(ulong *)((long)ppppppuVar17 + lVar20 + 8);
          uVar26 = 0xc;
          if (uVar19 < 0xc) {
            uVar26 = uVar19;
          }
          if ((uVar19 == 0) || (uVar26 <= uVar11 + 1)) {
LAB_14544b493:
            lVar29 = 0;
            do {
              lVar20 = lVar29;
              if (lVar34 == lVar20) {
                if (ppppppuVar32 == pppppppuVar30[0x146]) {
                  local_d1 = (char)local_e8;
                  func_0x000145774860();
                  ppppppuVar17 = pppppppuVar30[0x147];
                }
                *(char *)((long)ppppppuVar17 + lVar34) = (char)local_f0;
                *(ulong *)((long)ppppppuVar17 + lVar34 + 8) = uVar11 + 2;
                pppppppuVar30[0x148] = (ulong ******)((long)ppppppuVar32 + 1);
                goto LAB_14544b509;
              }
              lVar29 = lVar20 + 0x10;
            } while (*(char *)((long)ppppppuVar17 + lVar20) != (char)local_f0);
            *(ulong *)((long)ppppppuVar17 + lVar20 + 8) = uVar11 + 2;
LAB_14544b509:
            local_d1 = (char)local_e8;
            func_0x0001454356a0();
            bVar8 = (char)local_f0 - 2;
            if (bVar8 < 10) {
              lVar29 = *(long *)((ulong)bVar8 * 8 + 0x14673e938);
            }
            else {
              lVar29 = 0x146735848;
            }
            local_118 = (ulong *******)(lVar29 + 0x10);
            pppppppuStack_110 = (ulong *******)0x1400020c0;
            local_d1 = (char)local_e8;
            func_0x000145728390();
            pppppppuVar12 = *(ulong ********)(lVar29 + 0x20);
            uVar25 = *(undefined8 *)(lVar29 + 0x28);
            local_f8 = uStack_180;
            local_f0 = (ulong *******)((uVar11 + 1) * 0xf0 + 0x146733518);
            auVar47 = func_0x000145457cb0();
            local_1f8 = auVar47._8_8_;
            pppppppuVar16 = auVar47._0_8_;
            if (local_188 != (ulong *******)0x0) {
              func_0x0001400021d0();
            }
            if (pppppppuVar16 == (ulong *******)0x0) {
              local_1f8 = uVar25;
              pppppppuVar16 = pppppppuVar12;
            }
            local_200 = pppppppuVar16;
            func_0x000140002200();
            pppppppuVar12 = (ulong *******)func_0x0001400021c0();
            local_d1 = (char)local_e8;
            if (pppppppuVar12 == (ulong *******)0x0) {
              func_0x00014590379b();
LAB_14544bc21:
                    /* WARNING: Does not return */
              pcVar4 = (code *)invalidInstructionException();
              (*pcVar4)();
            }
            *(undefined1 *)pppppppuVar12 = 0x7b;
            local_188 = (ulong *******)0x1;
            local_178 = (ulong *******)0x1;
            uStack_170 = CONCAT71(uStack_170._1_7_,1);
            uStack_180 = pppppppuVar12;
            func_0x000145456ed0();
            pppppppuVar12 = local_f0;
            local_1e8 = local_f0 + 1;
            local_1e0 = (ulong *******)0x1400020c0;
            local_d8 = 1;
            local_1b8 = local_1e8;
            local_f8 = pppppppuVar16;
            func_0x000145728390();
            ppppppuVar21 = pppppppuVar12[3];
            local_f0 = (ulong *******)pppppppuVar12[4];
            local_1c0 = uStack_180;
            func_0x000145457cb0();
            if (local_188 != (ulong *******)0x0) {
              func_0x0001400021d0();
            }
            local_d8 = 0;
            func_0x000145456ed0();
            local_d1 = (char)local_e8;
            local_1c0 = (ulong *******)ppppppuVar21;
            func_0x000145456ed0();
            pppppppuVar12 = local_108;
            if (local_118 == local_108) {
              func_0x0001457744b0(local_108,local_108,local_108,&local_118,1,1);
              pppppppuVar30 = local_1a0;
            }
            ppppppuVar21 = local_1c8;
            *(undefined1 *)((long)pppppppuStack_110 + (long)pppppppuVar12) = 0x7d;
            if (*(int *)(pppppppuVar30 + 2) == 2) {
              if (local_118 != (ulong *******)0x0) {
                func_0x0001400021d0();
              }
            }
            else {
              local_1b0 = pppppppuStack_110;
              local_1a0 = local_118;
              local_d4 = 1;
              auVar47 = func_0x000145457cb0();
              local_f8 = auVar47._8_8_;
              local_120 = auVar47._0_8_;
              local_118 = local_1b8;
              pppppppuStack_110 = (ulong *******)0x1400020c0;
              local_d4 = 1;
              func_0x000145728390();
              local_1b8 = uStack_180;
              auVar47 = func_0x000145457cb0();
              pppppppuVar16 = auVar47._8_8_;
              ppppppuVar21 = auVar47._0_8_;
              if (local_188 != (ulong *******)0x0) {
                func_0x0001400021d0();
              }
              local_210._0_8_ = ppppppuVar21;
              if (ppppppuVar21 == (ulong ******)0x0) {
                pppppppuVar16 = local_f0;
                local_210._0_8_ = local_1c0;
              }
              local_188 = (ulong *******)0x14673e109;
              uStack_180 = (ulong *******)0x4;
              local_178 = (ulong *******)local_210;
              uStack_170 = 0x14673e0e0;
              local_168 = 0x14673e104;
              local_160 = 5;
              local_158 = (int *)&local_200;
              local_150 = 0x14673e0e0;
              local_d4 = 1;
              local_210._8_8_ = pppppppuVar16;
              func_0x000145458060();
              func_0x000145728390();
              ppppppuVar21 = local_1c8;
              if (local_118 != (ulong *******)0x0) {
                func_0x0001400021d0();
              }
              local_f0 = local_1e8;
              local_f8 = local_1e0;
              func_0x00014545dc90();
              ppppppuVar17 = pppppppuVar30[0xae];
              if (ppppppuVar17 == pppppppuVar30[0xac]) {
                func_0x000145774710();
              }
              ppppppuVar32 = pppppppuVar30[0xad];
              ppppppuVar23 = ppppppuVar32 + (long)ppppppuVar17 * 4 + 2;
              *(undefined4 *)ppppppuVar23 = (undefined4)local_178;
              *(undefined4 *)((long)ppppppuVar23 + 4) = local_178._4_4_;
              *(undefined4 *)(ppppppuVar23 + 1) = (undefined4)uStack_170;
              *(undefined4 *)((long)ppppppuVar23 + 0xc) = uStack_170._4_4_;
              ppppppuVar32 = ppppppuVar32 + (long)ppppppuVar17 * 4;
              *(undefined4 *)ppppppuVar32 = (undefined4)local_188;
              *(undefined4 *)((long)ppppppuVar32 + 4) = local_188._4_4_;
              *(undefined4 *)(ppppppuVar32 + 1) = (undefined4)uStack_180;
              *(undefined4 *)((long)ppppppuVar32 + 0xc) = uStack_180._4_4_;
              pppppppuVar30[0xae] = (ulong ******)((long)ppppppuVar17 + 1);
              if (local_f0 != (ulong *******)0x0) {
                func_0x0001400021d0();
              }
              ppppppuVar17 = pppppppuVar30[0xb1];
              if (ppppppuVar17 == pppppppuVar30[0xaf]) {
                func_0x0001457745c0();
              }
              ppppppuVar32 = pppppppuVar30[0xb0];
              ppppppuVar32[(long)ppppppuVar17 * 3] = (ulong *****)local_1a0;
              ppppppuVar32[(long)ppppppuVar17 * 3 + 1] = (ulong *****)local_1b0;
              ppppppuVar32[(long)ppppppuVar17 * 3 + 2] = (ulong *****)((long)pppppppuVar12 + 1);
              pppppppuVar30[0xb1] = (ulong ******)((long)ppppppuVar17 + 1);
            }
          }
        }
      }
      ppppppuVar32 = pppppppuVar30[0x144];
      local_d1 = (char)local_e8;
      lVar29 = 0;
      ppppppuVar17 = ppppppuVar32;
      do {
        lVar34 = lVar29;
        if ((long)pppppppuVar30[0x145] * 0x38 - lVar34 == 0) goto LAB_14544babf;
        ppppppuVar23 = ppppppuVar17 + 3;
        ppppppuVar17 = ppppppuVar17 + 7;
        lVar29 = lVar34 + 0x38;
      } while ((ulong ******)*ppppppuVar23 != ppppppuVar21);
      piVar1 = (int *)((long)ppppppuVar32 + lVar34 + 0x28);
      *piVar1 = *piVar1 + 1;
      piVar1 = (int *)((long)ppppppuVar32 + lVar34 + 0x2c);
      *piVar1 = *piVar1 + (int)local_218;
LAB_14544babf:
      if (bVar36 != false) {
        ppppppuVar21 = (ulong ******)((long)pppppppuVar30[0x179] + 1);
        if (ppppppuVar21 == (ulong ******)0x0) {
          ppppppuVar21 = (ulong ******)0xffffffffffffffff;
        }
        pppppppuVar30[0x179] = ppppppuVar21;
        ppppppuVar21 = (ulong ******)(local_218 + (long)pppppppuVar30[0x17a]);
        if (CARRY8(local_218,(ulong)pppppppuVar30[0x17a])) {
          ppppppuVar21 = (ulong ******)0xffffffffffffffff;
        }
        pppppppuVar30[0x17a] = ppppppuVar21;
      }
      cVar22 = local_d1;
      func_0x0001454356a0();
    }
    else {
      local_d1 = (char)uVar9;
      cVar22 = local_d1;
      func_0x0001454356a0();
    }
    if ((cVar22 != '\0') && (local_238 != (ulong *******)0x0)) {
      func_0x0001400021d0();
    }
  }
  return;
}
