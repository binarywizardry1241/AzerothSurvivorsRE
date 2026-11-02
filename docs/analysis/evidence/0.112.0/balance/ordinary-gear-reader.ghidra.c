long * entry(undefined8 param_1,undefined8 param_2,uint param_3,long *param_4)

{
  ulong *puVar1;
  char cVar2;
  byte bVar3;
  code *pcVar4;
  undefined1 auVar5 [16];
  undefined1 auVar6 [16];
  undefined1 auVar7 [16];
  uint uVar8;
  long *plVar9;
  ulong uVar10;
  undefined1 (*pauVar11) [16];
  long lVar12;
  int *piVar13;
  int iVar14;
  undefined1 uVar15;
  int iVar16;
  ulong uVar17;
  uint uVar18;
  undefined8 uVar20;
  uint uVar21;
  int *piVar22;
  undefined1 auVar23 [16];
  undefined1 auVar24 [16];
  undefined1 auVar25 [12];
  undefined1 local_188 [16];
  ulong local_178;
  undefined1 (*local_170) [16];
  long lStack_168;
  undefined1 (*local_160) [16];
  ulong *local_158;
  ulong local_150;
  ulong local_148;
  ulong local_140;
  undefined1 (*local_138 [3]) [16];
  ulong local_120;
  ulong *local_118;
  undefined8 local_110;
  undefined1 *local_108;
  undefined8 local_100;
  undefined8 local_f8;
  undefined8 local_f0;
  undefined8 local_e8;
  undefined8 local_e0;
  undefined8 local_d8;
  undefined8 local_d0;
  undefined8 local_c8;
  undefined8 local_c0;
  undefined1 local_b8 [16];
  undefined1 (*local_a8) [16];
  undefined1 (*local_a0) [16];
  undefined1 (*local_98) [16];
  undefined1 (*local_90) [16];
  undefined1 (*pauStack_88) [16];
  long local_80;
  ulong local_78;
  undefined1 (*local_70) [16];
  undefined1 (*local_68) [16];
  undefined1 (*local_60) [16];
  undefined1 (*local_58) [16];
  undefined1 local_4a;
  undefined1 local_49;
  undefined8 local_48;
  ulong uVar19;

  local_48 = 0xfffffffffffffffe;
  if (param_3 - 0x15f91 < 0x6b) {
                    /* WARNING: Could not emulate address calculation at 0x0001459963ff */
                    /* WARNING: Treating indirect jump as call */
    plVar9 = (long *)(*(code *)((long)*(int *)((ulong)(param_3 - 0x15f91) * 4 + 0x147220d7c) +
                               0x147220d7c))();
    return plVar9;
  }
  if (param_3 - 1 < 99999) {
    func_0x000145995970();
    return param_4;
  }
  if (99999 < param_3) {
    uVar8 = param_3 - 100000;
    uVar18 = uVar8 / 100 + (uVar8 / 1000) * -10;
    uVar19 = (ulong)uVar18;
    if ((((uVar8 * -0x33333333 >> 1 | (uint)((uVar8 * -0x33333333 & 1) != 0) << 0x1f) < 0x1999999a)
        && (uVar8 < 12000)) && (uVar21 = uVar8 / 10 + (uVar8 / 100) * -10, uVar21 < 7)) {
      uVar17 = (ulong)uVar8 / 1000;
      local_178 = uVar19;
      uVar10 = func_0x000145997ed0();
      if (uVar10 != 0) {
        local_78 = 5;
        if (uVar21 != 6) {
          local_78 = (ulong)uVar21;
        }
        if ((int)local_78 == 5) {
          pauVar11 = (undefined1 (*) [16])func_0x000145997a10();
          if (pauVar11 == (undefined1 (*) [16])0x0) goto LAB_1459967ad;
          local_60 = (undefined1 (*) [16])(ulong)(uVar21 == 6);
        }
        else {
          pauVar11 = (undefined1 (*) [16])0x0;
        }
        local_170 = (undefined1 (*) [16])0x0;
        lStack_168 = 4;
        local_160 = (undefined1 (*) [16])0x0;
        if (uVar18 < 8) {
          lVar12 = (ulong)(byte)(*(char *)(uVar10 + 0x128) - 1) * 8;
          local_b8._0_8_ = *(ulong *)(lVar12 + 0x147220468);
          local_b8._8_8_ = *(ulong *)(lVar12 + 0x147220488);
          local_138[0] = &local_b8;
          local_138[1] = (undefined1 (*) [16])0x1400020c0;
          local_138[2] = (undefined1 (*) [16])&local_178;
          local_120 = 0x145befad0;
          local_49 = 1;
          local_4a = 1;
          func_0x000145bdd130();
          local_58 = pauVar11;
          lVar12 = (ulong)(byte)(*(char *)(uVar10 + 0x128) - 1) * 8;
          local_68 = *(undefined1 (**) [16])(lVar12 + 0x1472204c8);
          local_98 = *(undefined1 (**) [16])(lVar12 + 0x1472204e8);
          local_140 = *(ulong *)(lVar12 + 0x147220508);
          local_158 = *(ulong **)(lVar12 + 0x147220528);
          local_138[0] = *(undefined1 (**) [16])(lVar12 + 0x1472204a8);
          local_138[1] = *(undefined1 (**) [16])(lVar12 + 0x1472204c8);
          local_138[2] = *(undefined1 (**) [16])(lVar12 + 0x1472204e8);
          local_120 = local_140;
          local_118 = local_158;
          local_110 = *(undefined8 *)(lVar12 + 0x147220548);
          local_108 = *(undefined1 **)(lVar12 + 0x147220568);
          local_100 = *(undefined8 *)(lVar12 + 0x147220588);
          local_f8 = *(undefined8 *)(lVar12 + 0x1472205a8);
          local_f0 = *(undefined8 *)(lVar12 + 0x1472205c8);
          local_e8 = *(undefined8 *)(lVar12 + 0x1472205e8);
          local_e0 = *(undefined8 *)(lVar12 + 0x147220608);
          local_70 = local_90;
          local_d8 = *(undefined8 *)(lVar12 + 0x147220628);
          local_d0 = *(undefined8 *)(lVar12 + 0x147220648);
          local_c8 = *(undefined8 *)(lVar12 + 0x147220668);
          local_c0 = *(undefined8 *)(lVar12 + 0x147220688);
          auVar23._8_8_ = local_138[uVar19 * 2 + 1];
          auVar23._0_8_ = local_138[uVar19 * 2];
          local_68 = pauStack_88;
          local_150 = uVar10;
          local_148 = uVar17;
          local_188 = func_0x00014598ddd0();
          if (local_188._0_8_ == 0) {
            local_188 = auVar23;
          }
          if (local_70 != (undefined1 (*) [16])0x0) {
            func_0x0001400021d0();
          }
          uVar10 = local_150;
          if (local_58 == (undefined1 (*) [16])0x0) {
            if (4 < local_78) {
              local_49 = 1;
              local_4a = 1;
              func_0x000145da9883();
              goto LAB_145997620;
            }
            uVar8 = (int)local_148 - 2;
            if ((byte)uVar8 < 10) {
              lVar12 = *(long *)((ulong)(uVar8 & 0xff) * 8 + 0x1472206a8);
            }
            else {
              lVar12 = 0x146bf4988;
            }
            auVar6._8_8_ = *(undefined8 *)(local_150 + 8 + local_78 * 0x18);
            auVar6._0_8_ = *(undefined8 *)(local_150 + local_78 * 0x18);
            cVar2 = *(char *)(local_150 + 0x10 + local_78 * 0x18);
            local_138[0] = (undefined1 (*) [16])(lVar12 + 0x10);
            local_138[1] = (undefined1 (*) [16])0x1400020c0;
            local_138[2] = (undefined1 (*) [16])&local_78;
            local_120 = 0x145befad0;
            local_49 = 1;
            local_4a = 1;
            uVar17 = local_148;
            func_0x000145bdd130();
            iVar16 = (int)uVar17;
            local_58 = local_90;
            local_60 = pauStack_88;
            local_b8 = func_0x00014598ddd0();
            if (local_b8._0_8_ == 0) {
              local_b8 = auVar6;
            }
            if (local_58 != (undefined1 (*) [16])0x0) {
              func_0x0001400021d0();
            }
            if (cVar2 == '\0') {
              local_138[0] = (undefined1 (*) [16])0x14721f108;
              local_138[1] = (undefined1 (*) [16])0x4;
              local_138[2] = &local_188;
              local_120 = 0x14721f0e8;
              local_118 = (ulong *)0x14721f10c;
              local_110 = 3;
              local_108 = local_b8;
              local_100 = 0x14721f0e8;
              local_49 = 1;
              local_4a = 1;
              func_0x00014598dd80();
            }
            else {
              local_138[0] = (undefined1 (*) [16])0x14721f108;
              local_138[1] = (undefined1 (*) [16])0x4;
              local_138[2] = &local_188;
              local_120 = 0x14721f0e8;
              local_118 = (ulong *)0x14721f10c;
              local_110 = 3;
              local_108 = local_b8;
              local_100 = 0x14721f0e8;
              local_49 = 1;
              local_4a = 1;
              func_0x00014598dd80();
            }
            local_68 = (undefined1 (*) [16])local_80;
            local_138[0] = (undefined1 (*) [16])&local_78;
            local_138[1] = (undefined1 (*) [16])0x0;
            local_138[2] = (undefined1 (*) [16])0x5;
            local_120 = uVar10;
            local_118 = &local_178;
            local_58 = pauStack_88;
            local_a0 = pauStack_88;
            local_60 = local_90;
            local_a8 = local_90;
            local_49 = 0;
            local_4a = 1;
            auVar25 = func_0x0001459f2700();
            iVar14 = 0;
            if ((auVar25._0_8_ & 1) != 0) {
              iVar14 = auVar25._8_4_;
            }
          }
          else {
            pauVar11 = local_58 + (long)local_60;
            pauStack_88 = (undefined1 (*) [16])0x1400020c0;
            local_49 = 1;
            local_4a = 1;
            uVar17 = local_148;
            local_90 = pauVar11;
            func_0x000145bdd130();
            iVar16 = (int)uVar17;
            local_70 = local_138[0];
            auVar23 = *pauVar11;
            local_68 = local_138[1];
            local_b8 = func_0x00014598ddd0();
            if (local_b8._0_8_ == 0) {
              local_b8 = auVar23;
            }
            if (local_70 != (undefined1 (*) [16])0x0) {
              func_0x0001400021d0();
            }
            local_138[0] = (undefined1 (*) [16])0x14721f108;
            local_138[1] = (undefined1 (*) [16])0x4;
            local_138[2] = &local_188;
            local_120 = 0x14721f0e8;
            local_118 = (ulong *)0x14721f10c;
            local_110 = 3;
            local_108 = local_b8;
            local_100 = 0x14721f0e8;
            local_49 = 1;
            local_4a = 1;
            func_0x00014598dd80();
            iVar14 = *(int *)(local_58[(long)local_60 * 2 + 3] + uVar19 * 4);
            if (iVar14 == 0) {
              iVar14 = *(int *)(uVar10 + 0xe8 + uVar19 * 4);
            }
            local_60 = local_90;
            local_58 = pauStack_88;
            local_68 = (undefined1 (*) [16])local_80;
          }
          bVar3 = *(byte *)(uVar10 + 0x128);
          local_70 = (undefined1 (*) [16])CONCAT44(local_70._4_4_,iVar14);
          if ((uVar18 == 2) && (bVar3 == 1)) {
            local_98 = (undefined1 (*) [16])CONCAT71(local_98._1_7_,uRam000000014721f166);
            lVar12 = 2;
            local_138[0] = (undefined1 (*) [16])0x14721f18c;
            local_140 = CONCAT44(local_140._4_4_,0x14);
          }
          else {
            local_98 = (undefined1 (*) [16])
                       CONCAT71(local_98._1_7_,*(undefined1 *)(uVar19 + 0x14721f164));
            local_140 = CONCAT44(local_140._4_4_,*(undefined4 *)(uVar19 * 4 + 0x14721f144));
            if (uVar18 < 7) {
                    /* WARNING: Could not emulate address calculation at 0x000145997122 */
                    /* WARNING: Treating indirect jump as call */
              plVar9 = (long *)(*(code *)((long)*(int *)(uVar19 * 4 + 0x147220f28) + 0x147220f28))()
              ;
              return plVar9;
            }
            lVar12 = 3;
            local_138[0] = (undefined1 (*) [16])0x14721f1cc;
          }
          local_138[1] = (undefined1 (*) [16])(*local_138[0] + lVar12 * 8);
          local_138[2] = (undefined1 (*) [16])&local_78;
          local_a0 = local_58;
          local_a8 = local_60;
          local_49 = 0;
          local_4a = 1;
          func_0x0001459c58c0();
          local_158 = (ulong *)CONCAT44(local_158._4_4_,(uint)bVar3);
          iVar14 = 0;
          local_150 = CONCAT44(local_150._4_4_,4);
        }
        else {
          local_b8._0_8_ = uVar19 - 8;
          if (*(ulong *)(uVar10 + 0x80) <= (ulong)local_b8._0_8_) goto LAB_1459967ad;
          piVar22 = (int *)(local_b8._0_8_ * 0x90 + *(long *)(uVar10 + 0x78));
          if (pauVar11 == (undefined1 (*) [16])0x0) {
            uVar8 = (int)uVar17 - 2;
            if ((byte)uVar8 < 10) {
              lVar12 = *(long *)((ulong)(uVar8 & 0xff) * 8 + 0x1472206a8);
            }
            else {
              lVar12 = 0x146bf4988;
            }
            local_138[0] = (undefined1 (*) [16])(lVar12 + 0x10);
            local_138[1] = (undefined1 (*) [16])0x1400020c0;
            local_138[2] = &local_b8;
            local_120 = 0x145befad0;
            local_118 = &local_78;
            local_110 = 0x145befad0;
            local_49 = 1;
            local_4a = 1;
            func_0x000145bdd130();
            iVar16 = (int)uVar17;
            local_70 = local_90;
            local_68 = pauStack_88;
            if (4 < local_78) {
              func_0x000145da9883();
LAB_145997620:
                    /* WARNING: Does not return */
              pcVar4 = (code *)invalidInstructionException();
              (*pcVar4)();
            }
            auVar7._8_8_ = *(undefined8 *)(piVar22 + local_78 * 4 + 4);
            auVar7._0_8_ = *(undefined8 *)(piVar22 + local_78 * 4 + 2);
            auVar23 = func_0x00014598ddd0();
            if (auVar23._0_8_ == 0) {
              auVar23 = auVar7;
            }
            func_0x0001401aa700();
            local_60 = local_138[1];
            if ((int)local_138[0] == 1) {
              func_0x000145da94eb();
              goto LAB_145997620;
            }
            local_58 = local_138[2];
            if (auVar23._8_8_ != 0) {
              func_0x000145c0a3db();
            }
            if (local_70 != (undefined1 (*) [16])0x0) {
              func_0x0001400021d0();
            }
            if (4 < local_78) {
              local_a0 = local_58;
              local_a8 = local_60;
              local_49 = 0;
              local_4a = 1;
              func_0x000145da9883();
              goto LAB_145997620;
            }
            local_70 = (undefined1 (*) [16])CONCAT44(local_70._4_4_,piVar22[local_78 + 0x1e]);
          }
          else {
            if (*(ulong *)(pauVar11[2] + 8) <= (ulong)local_b8._0_8_) goto LAB_1459967ad;
            lVar12 = local_b8._0_8_ * 0x30 + *(long *)pauVar11[2];
            local_70 = (undefined1 (*) [16])
                       CONCAT44(local_70._4_4_,*(undefined4 *)(lVar12 + (long)local_60 * 0x18));
            puVar1 = (ulong *)(lVar12 + 8 + (long)local_60 * 0x18);
            local_b8._0_8_ = *puVar1;
            local_b8._8_8_ = puVar1[1];
            local_90 = &local_b8;
            pauStack_88 = (undefined1 (*) [16])0x1400020c0;
            local_49 = 1;
            local_4a = 1;
            func_0x000145bdd130();
            auVar5._8_8_ = local_b8._8_8_;
            auVar5._0_8_ = local_b8._0_8_;
            iVar16 = (int)uVar17;
            local_68 = local_138[0];
            local_98 = local_138[1];
            auVar23 = func_0x00014598ddd0();
            if (auVar23._0_8_ == 0) {
              auVar23 = auVar5;
            }
            func_0x0001401aa700();
            local_60 = local_138[1];
            if ((int)local_138[0] == 1) {
              func_0x000145da94eb();
              goto LAB_145997620;
            }
            local_58 = local_138[2];
            if (auVar23._8_8_ != 0) {
              func_0x000145c0a3db();
            }
            if (local_68 != (undefined1 (*) [16])0x0) {
              func_0x0001400021d0();
            }
          }
          local_68 = auVar23._8_8_;
          uVar10 = auVar23._0_8_;
          if ((*piVar22 == 1) && (local_78 == 4)) {
            piVar13 = piVar22 + 1;
            iVar14 = 1;
          }
          else {
            piVar13 = piVar22 + 0x1b;
            iVar14 = piVar22[0x1d];
          }
          local_150 = CONCAT44(local_150._4_4_,piVar22[0x1a]);
          local_158 = (ulong *)CONCAT44(local_158._4_4_,*piVar13);
          local_140 = CONCAT44(local_140._4_4_,piVar22[0x1c]);
          local_98 = (undefined1 (*) [16])CONCAT71(local_98._1_7_,(char)piVar22[0x23]);
          local_138[0] = *(undefined1 (**) [16])(piVar22 + 0x16);
          local_138[1] = (undefined1 (*) [16])(*local_138[0] + *(long *)(piVar22 + 0x18) * 8);
          local_138[2] = (undefined1 (*) [16])&local_78;
          local_a0 = local_58;
          local_a8 = local_60;
          local_49 = 0;
          local_4a = 1;
          func_0x0001459c5940();
        }
        uVar15 = (undefined1)iVar16;
        if (local_78 == 0) {
          uVar17 = 0;
          auVar24._8_8_ = 0;
          auVar24._0_8_ = uVar10;
          auVar24 = auVar24 << 0x40;
        }
        else {
          local_148 = CONCAT44(local_148._4_4_,iVar14);
          uVar10 = (ulong)((iVar16 * 3 + uVar18 & 7) << 4);
          local_138[0] = (undefined1 (*) [16])(uVar10 + 0x14721f1e4);
          local_138[1] = (undefined1 (*) [16])(uVar10 + 0x14721f1f4);
          local_138[2] = (undefined1 (*) [16])&local_78;
          local_a0 = local_58;
          local_a8 = local_60;
          local_49 = 0;
          local_4a = 1;
          func_0x0001459c59c0();
          local_a0 = local_58;
          local_a8 = local_60;
          local_49 = 0;
          local_4a = 1;
          auVar24 = func_0x000145994640();
          pauVar11 = local_160;
          if (local_78 == 4) {
            uVar20 = 0x3d2c08310000000c;
            if (7 < uVar18) {
              uVar20 = 0x10000000b;
            }
            if (local_160 == local_170) {
              local_a0 = local_58;
              local_a8 = local_60;
              local_49 = 0;
              local_4a = 1;
              func_0x000145c16470();
            }
            *(undefined8 *)(lStack_168 + (long)pauVar11 * 8) = uVar20;
            local_160 = (undefined1 (*) [16])(*pauVar11 + 1);
          }
          uVar17 = local_78;
          iVar14 = (int)local_148;
        }
        local_138[2] = local_160;
        local_138[0] = local_170;
        local_138[1] = (undefined1 (*) [16])lStack_168;
        func_0x000145992010();
        param_4[5] = local_80;
        param_4[3] = (long)local_90;
        param_4[4] = (long)pauStack_88;
        *param_4 = (long)local_60;
        param_4[1] = (long)local_58;
        param_4[2] = (long)local_68;
        param_4[6] = uVar17;
        *(undefined1 (*) [16])(param_4 + 7) = auVar24;
        param_4[9] = uVar19;
        *(uint *)(param_4 + 10) = param_3;
        *(undefined4 *)((long)param_4 + 0x54) = local_70._0_4_;
        *(undefined4 *)(param_4 + 0xb) = (undefined4)local_150;
        *(undefined4 *)((long)param_4 + 0x5c) = local_158._0_4_;
        *(undefined4 *)(param_4 + 0xc) = (undefined4)local_140;
        *(int *)((long)param_4 + 100) = iVar14;
        *(undefined1 *)(param_4 + 0xd) = local_98._0_1_;
        *(undefined1 *)((long)param_4 + 0x69) = uVar15;
        return param_4;
      }
    }
  }
LAB_1459967ad:
  *param_4 = -1;
  return param_4;
}
