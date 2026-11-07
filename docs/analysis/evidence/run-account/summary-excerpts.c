/* Original owner 0x1458b8620, Ghidra lines145..268. */
    if (fVar34 < 0.0) {
      ppppppuVar32 = ppppppuVar31;
    }
    if (_DAT_145dd2e40 < fVar34) {
      ppppppuVar32 = (ulong ******)0xffffffff;
    }
    uVar19 = (ulong)*(uint *)(in_RCX + 0xee);
    fVar34 = _DAT_145dd2e40;
    fVar42 = _DAT_145d9d2d0;
    local_1b0 = in_RCX;
    local_c8 = in_XMM6_Da;
    local_b8 = in_XMM7_Da;
    local_e0 = (ulong *******)func_0x00014588d0d0(ppppppuVar32,uVar9,local_1a0,local_1a8);
    fVar39 = (float)(long)ppppppuVar32 * _DAT_145dcd0d0;
    uVar10 = uVar19;
    fVar35 = (float)func_0x000145bfa10b(fVar39,uVar19);
    ppppppuVar32 = (ulong ******)(long)fVar35;
    if (_DAT_145ea3420 < fVar35) {
      ppppppuVar32 = (ulong ******)0x7fffffffffffffff;
    }
    if (NAN(fVar35)) {
      ppppppuVar32 = ppppppuVar31;
    }
    fVar40 = (fVar38 / _DAT_145df0540) * _DAT_145d9d380;
    fVar35 = _DAT_145ea3420;
    fVar36 = (float)func_0x000145bfa10b(fVar40);
    local_280 = (ulong ******)(long)fVar36;
    if (fVar35 < fVar36) {
      local_280 = (ulong ******)0x7fffffffffffffff;
    }
    if (NAN(fVar36)) {
      local_280 = ppppppuVar31;
    }
    lVar30 = -200;
    if (uVar9 == 0) {
      lVar30 = 0;
    }
    ppppppuVar31 = (ulong ******)0xc8;
    fVar36 = _DAT_145df0500;
    if (uVar9 == 0) {
      ppppppuVar31 = (ulong ******)0x0;
      fVar36 = 0.0;
    }
    local_218 = local_1b0 + 2;
    ppppppuVar23 = local_1b0;
    fVar37 = _DAT_145d9d2a0;
    local_220 = uVar9;
    fVar39 = (float)func_0x000145bfa10b((((float)(int)local_e0 * _DAT_145de2510) / _DAT_145f3db10 +
                                        _DAT_145d9d2a0) *
                                        ((float)(long)uVar10 * _DAT_145d9d714 + fVar40 + fVar39 +
                                        fVar36));
    uVar9 = (long)fVar39 & 0xffffffff;
    if (fVar39 < fVar41) {
      uVar9 = 0;
    }
    if (fVar34 < fVar39) {
      uVar9 = 0xffffffff;
    }
    local_260 = (ulong ******)
                ((lVar30 - ((long)(local_280 + uVar19 * 5) + (long)ppppppuVar32)) + uVar9);
    lVar30 = (long)(local_280 + uVar19 * 5) + (long)ppppppuVar32 + (long)ppppppuVar31 +
             (long)local_260;
    fVar39 = ((float)*(ushort *)((long)ppppppuVar23 + 0x2c6) + _DAT_14651785c) / fVar42;
    fVar37 = fVar39 + fVar39 +
             (((float)*(ushort *)((long)ppppppuVar23 + 0x2c4) + _DAT_14651785c) / fVar42) *
             _DAT_145dcd0fc +
             (((float)*(ushort *)((long)ppppppuVar23 + 0x2c2) + _DAT_14651785c) / fVar42) *
             _DAT_145de21f4 + ((fVar43 + _DAT_14651785c) / fVar42) * _DAT_145dcce88 + fVar37;
    if (_DAT_145dd4d08 <= fVar37) {
      fVar37 = _DAT_145dd4d08;
    }
    uStack_278 = ppppppuVar32;
    local_270 = (ulong ******)(uVar19 * 0x28);
    uStack_268 = ppppppuVar31;
    fVar43 = (float)func_0x000145bfa10b((fVar37 + _DAT_145dcd0c4) * (float)lVar30);
    ppppppuStack_258 = (ulong ******)(long)fVar43;
    ppppppuVar32 = (ulong ******)0x7fffffffffffffff;
    if (fVar35 < fVar43) {
      ppppppuStack_258 = (ulong ******)0x7fffffffffffffff;
    }
    if (NAN(fVar43)) {
      ppppppuStack_258 = (ulong ******)0x0;
    }
    uVar9 = (long)fVar38 & 0xffffffff;
    if (fVar38 < fVar41) {
      uVar9 = 0;
    }
    ppppppuVar31 = (ulong ******)0x0;
    if (fVar34 < fVar38) {
      uVar9 = 0xffffffff;
    }
    fVar38 = (float)func_0x000145bfa10b((float)((long)ppppppuStack_258 + lVar30) *
                                        *(float *)(ppppppuVar23 + 0x224));
    local_250 = (ulong ******)(long)fVar38;
    if (fVar35 < fVar38) {
      local_250 = ppppppuVar32;
    }
    if (NAN(fVar38)) {
      local_250 = ppppppuVar31;
    }
    pppppppuVar11 = (ulong *******)(ppppppuVar23 + 0x215);
    local_170 = (ulong *******)0x0;
    uStack_168 = 7;
    local_180 = (ulong *******)&local_280;
    uStack_178 = pppppppuVar11;
    func_0x0001459ca650();
    uVar28 = (undefined7)((ulong)in_R9 >> 8);
    pppppuVar13 = local_1b8;
    if (local_238 == 0) {
      local_11c = 0;
      pppppppuVar11[6] = local_250;
      pppppppuVar11[4] = local_260;
      pppppppuVar11[5] = ppppppuStack_258;
      pppppppuVar11[2] = local_270;
      pppppppuVar11[3] = uStack_268;
      *(undefined4 *)pppppppuVar11 = (undefined4)local_280;
      *(undefined4 *)((long)pppppppuVar11 + 4) = local_280._4_4_;
      *(undefined4 *)(pppppppuVar11 + 1) = (undefined4)uStack_278;
      *(undefined4 *)((long)pppppppuVar11 + 0xc) = uStack_278._4_4_;
      bVar33 = local_1b8 != (ulong *****)0xffffff;
      uVar7 = (undefined4)CONCAT71(uVar28,1);
    }
    else {
      if (local_238 < 5) {

/* Original owner 0x1458b8620, Ghidra lines318..337. */
      if ((bVar33) && (local_11c != 0)) {
        local_188 = local_240;
        lVar30 = 0;
        do {
          lVar16 = lVar30;
          if ((long)ppppppuVar23[0x172] << 5 == lVar16) {
            local_230 = 0;
            goto LAB_1458b8b96;
          }
          lVar30 = lVar16 + 0x20;
        } while (*(char *)((long)ppppppuVar23[0x171] + lVar16 + 4) != (char)local_f0);
        local_230 = (ulong)*(uint *)((long)ppppppuVar23[0x171] + lVar16);
LAB_1458b8b96:
        local_d1 = 1;
        local_228 = uVar9;
        uVar7 = func_0x00014589cea0();
        local_d1 = 1;
        func_0x0001458a33c0();
        uVar21 = 0;
        lVar30 = 0;

/* Original owner 0x1458b8620, Ghidra lines605..686. */
          func_0x0001400021d0();
        }
        bVar33 = true;
        uVar7 = 0;
      }
    }
    pppppuVar24 = ppppppuVar23[0x165];
    lVar30 = 0;
    pppppuVar17 = pppppuVar24;
    do {
      lVar16 = lVar30;
      if ((long)ppppppuVar23[0x166] * 0x38 - lVar16 == 0) {
        if ((ppppppuVar23[0x1dc] != (ulong *****)0xffffffffffffffff) &&
           (ppppppuVar23[0x1df] == pppppuVar13)) {
          uVar21 = *(uint *)(ppppppuVar23 + 0x1e0);
          if (*(uint *)(ppppppuVar23 + 0x1e0) < (uint)local_198) {
            uVar21 = (uint)local_198;
          }
          *(uint *)(ppppppuVar23 + 0x1e0) = uVar21;
        }
        goto LAB_1458b9758;
      }
      pppppuVar1 = pppppuVar17 + 3;
      pppppuVar17 = pppppuVar17 + 7;
      lVar30 = lVar16 + 0x38;
    } while ((ulong *****)*pppppuVar1 != pppppuVar13);
    uVar21 = *(uint *)((long)pppppuVar24 + lVar16 + 0x20);
    if (uVar21 < (uint)local_198) {
      uVar21 = (uint)local_198;
    }
    uVar8 = *(uint *)((long)pppppuVar24 + lVar16 + 0x24);
    *(uint *)((long)pppppuVar24 + lVar16 + 0x20) = uVar21;
    if (uVar8 < (uint)uVar9) {
      uVar8 = (uint)uVar9;
    }
    *(uint *)((long)pppppuVar24 + lVar16 + 0x24) = uVar8;
LAB_1458b9758:
    if (*(char *)((long)ppppppuVar23 + 0x1162) == '\0') {
      local_e0 = (ulong *******)CONCAT44(local_e0._4_4_,uVar7);
      *(undefined1 *)((long)ppppppuVar23 + 0x1162) = 1;
      if ((((byte)local_220 & bVar33) != 0) && (uVar9 = func_0x00014588d0d0(), uVar9 < 0xb)) {
        lVar16 = (uVar9 + 1) * 0xf0;
        pppppuVar17 = ppppppuVar23[0x168];
        pppppuVar24 = ppppppuVar23[0x169];
        lVar26 = (long)pppppuVar24 << 4;
        lVar30 = 0;
        do {
          lVar20 = lVar30;
          if (lVar26 == lVar20) goto LAB_1458b9823;
          lVar30 = lVar20 + 0x10;
        } while (*(char *)((long)pppppuVar17 + lVar20) != (char)local_f0);
        uVar10 = *(ulong *)((long)pppppuVar17 + lVar20 + 8);
        uVar19 = 0xc;
        if (uVar10 < 0xc) {
          uVar19 = uVar10;
        }
        if ((uVar10 == 0) || (uVar19 <= uVar9 + 1)) {
LAB_1458b9823:
          lVar30 = 0;
          do {
            lVar20 = lVar30;
            if (lVar26 == lVar20) {
              if (pppppuVar24 == ppppppuVar23[0x167]) {
                local_d1 = (char)local_e0;
                func_0x000145bfaef0();
                pppppuVar17 = ppppppuVar23[0x168];
              }
              *(char *)((long)pppppuVar17 + lVar26) = (char)local_f0;
              *(ulong *)((long)pppppuVar17 + lVar26 + 8) = uVar9 + 2;
              ppppppuVar23[0x169] = (ulong *****)((long)pppppuVar24 + 1);
              goto LAB_1458b989a;
            }
            lVar30 = lVar20 + 0x10;
          } while (*(char *)((long)pppppuVar17 + lVar20) != (char)local_f0);
          *(ulong *)((long)pppppuVar17 + lVar20 + 8) = uVar9 + 2;
LAB_1458b989a:
          local_d1 = (char)local_e0;
          func_0x0001458a33c0();
          bVar6 = (char)local_f0 - 2;
          if (bVar6 < 10) {
            lVar30 = *(long *)((ulong)bVar6 * 8 + 0x146bec4c0);
          }

/* Original owner 0x1458b8620, Ghidra lines831..878. */
            }
            local_d3 = 0;
            func_0x0001458eaee0();
            local_d3 = 0;
            func_0x00014594b0d0();
            pppppuVar13 = local_1b8;
          }
        }
      }
      pppppuVar24 = ppppppuVar23[0x165];
      local_d1 = (char)local_e0;
      lVar30 = 0;
      pppppuVar17 = pppppuVar24;
      do {
        lVar16 = lVar30;
        if ((long)ppppppuVar23[0x166] * 0x38 - lVar16 == 0) goto LAB_1458b9f0f;
        pppppuVar1 = pppppuVar17 + 3;
        pppppuVar17 = pppppuVar17 + 7;
        lVar30 = lVar16 + 0x38;
      } while ((ulong *****)*pppppuVar1 != pppppuVar13);
      piVar2 = (int *)((long)pppppuVar24 + lVar16 + 0x28);
      *piVar2 = *piVar2 + 1;
      piVar2 = (int *)((long)pppppuVar24 + lVar16 + 0x2c);
      *piVar2 = *piVar2 + (int)local_220;
LAB_1458b9f0f:
      if (bVar33 != false) {
        pppppuVar13 = (ulong *****)((long)ppppppuVar23[0x19a] + 1);
        if (pppppuVar13 == (ulong *****)0x0) {
          pppppuVar13 = (ulong *****)0xffffffffffffffff;
        }
        ppppppuVar23[0x19a] = pppppuVar13;
        pppppuVar13 = (ulong *****)(local_220 + (long)ppppppuVar23[0x19b]);
        if (CARRY8(local_220,(ulong)ppppppuVar23[0x19b])) {
          pppppuVar13 = (ulong *****)0xffffffffffffffff;
        }
        ppppppuVar23[0x19b] = pppppuVar13;
      }
      cVar22 = local_d1;
      func_0x0001458a33c0();
    }
    else {
      local_d1 = (char)uVar7;
      cVar22 = local_d1;
      func_0x0001458a33c0();
    }
    if ((cVar22 != '\0') && (local_248 != 0)) {
      func_0x0001400021d0();
    }
