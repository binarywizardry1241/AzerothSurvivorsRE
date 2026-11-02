
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

long * FUN_1458bd6f0(undefined8 param_1,undefined8 param_2,undefined8 param_3,long *param_4)

{
  ulong *puVar1;
  char cVar2;
  byte bVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  code *pcVar6;
  undefined1 auVar7 [16];
  undefined1 auVar8 [16];
  undefined1 auVar9 [16];
  uint uVar10;
  long lVar11;
  long lVar12;
  long *plVar13;
  int *piVar14;
  ulong uVar15;
  uint uVar16;
  undefined1 (*pauVar17) [16];
  int iVar18;
  undefined1 uVar19;
  uint uVar20;
  long lVar21;
  ulong uVar22;
  undefined8 uVar23;
  uint uVar24;
  undefined1 (*pauVar25) [16];
  int *piVar26;
  undefined1 auVar27 [16];
  undefined1 auVar28 [16];
  undefined1 auVar29 [12];
  undefined1 local_198 [16];
  ulong local_188;
  undefined8 local_180;
  undefined1 (*local_178) [16];
  long lStack_170;
  undefined1 (*local_168) [16];
  ulong *local_160;
  undefined8 local_158;
  long local_150;
  undefined1 (*local_148) [16];
  undefined1 (*local_140) [16];
  undefined1 (*local_138 [4]) [16];
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
  undefined1 local_b0 [16];
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

  local_48 = 0xfffffffffffffffe;
  uVar10 = (uint)param_3;
  uVar16 = uVar10 - 0x15f91;
  if (((byte)(0xfffc3f >> ((byte)uVar16 & 0x1f)) & uVar16 < 0x18) == 1) {
    lVar12 = *(long *)((ulong)uVar16 * 8 + 0x146bbef58);
    local_90 = (undefined1 (*) [16])(lVar12 + 0x30);
    uVar4 = *(undefined4 *)(lVar12 + 0x30);
    pauStack_88 = (undefined1 (*) [16])0x145badf80;
    func_0x000145b9c4d0(param_1,param_4,0x146bb9f80,local_138,&local_90);
    lVar11 = *(long *)(lVar12 + 8);
    local_58 = local_138[1];
    auVar27 = func_0x0001458da590();
    lVar21 = auVar27._8_8_;
    if (local_138[0] != (undefined1 (*) [16])0x0) {
      func_0x0001400021d0();
    }
    if (auVar27._0_8_ == 0) {
      lVar21 = lVar11;
    }
    if (-1 < lVar21) {
      if (lVar21 == 0) {
        lVar11 = 1;
      }
      else {
        func_0x000140002200();
        lVar11 = func_0x0001400021c0();
        if (lVar11 == 0) goto LAB_1458bd7cd;
        func_0x000145bc977b();
      }
      uVar5 = *(undefined4 *)(lVar12 + 0x34);
      lVar12 = *(long *)(lVar12 + 0x20);
      *param_4 = lVar21;
      param_4[1] = lVar11;
      param_4[2] = lVar21;
      param_4[3] = 0;
      param_4[4] = 4;
      param_4[5] = 0;
      param_4[6] = 2 - (ulong)(lVar12 == 0);
      param_4[7] = 0;
      param_4[9] = 0;
      *(undefined4 *)(param_4 + 10) = uVar4;
      *(undefined4 *)((long)param_4 + 0x54) = uVar5;
      lVar12 = lRam0000000146bb9358;
      param_4[0xb] = _DAT_146bb9350;
      param_4[0xc] = lVar12;
      *(undefined2 *)(param_4 + 0xd) = 0x12;
      return param_4;
    }
LAB_1458bd7cd:
    func_0x000145d6944b();
                    /* WARNING: Does not return */
    pcVar6 = (code *)invalidInstructionException();
    (*pcVar6)();
  }
  if (uVar10 - 1 < 99999) {
    FUN_1458bcca0();
    return param_4;
  }
  if (99999 < uVar10) {
    uVar10 = uVar10 - 100000;
    uVar16 = uVar10 / 100 + (uVar10 / 1000) * -10;
    uVar22 = (ulong)uVar16;
    if ((((uVar10 * -0x33333333 >> 1 | (uint)((uVar10 * -0x33333333 & 1) != 0) << 0x1f) < 0x1999999a
         ) && (uVar10 < 12000)) && (uVar24 = uVar10 / 10 + (uVar10 / 100) * -10, uVar24 < 7)) {
      uVar20 = uVar10 / 1000;
      uVar10 = uVar10 / 1000 - 1;
      if (((byte)uVar10 < 0xb) && ((0x5dfU >> (uVar10 & 0x1f) & 1) != 0)) {
        pauVar25 = *(undefined1 (**) [16])((ulong)(uVar10 & 0xff) * 8 + 0x146bbf2a8);
        local_78 = 5;
        if (uVar24 != 6) {
          local_78 = (ulong)uVar24;
        }
        local_188 = uVar22;
        if ((int)local_78 == 5) {
          lVar12 = FUN_1458bead0();
          if (lVar12 == 0) goto LAB_1458bd7f9;
          local_58 = (undefined1 (*) [16])(ulong)(uVar24 == 6);
        }
        else {
          lVar12 = 0;
        }
        local_178 = (undefined1 (*) [16])0x0;
        lStack_170 = 4;
        local_168 = (undefined1 (*) [16])0x0;
        local_180 = param_3;
        if (uVar16 < 8) {
          lVar11 = (ulong)(byte)(pauVar25[0x12][8] - 1) * 8;
          local_b0._0_8_ = *(ulong *)(lVar11 + 0x146bbf018);
          local_b0._8_8_ = *(ulong *)(lVar11 + 0x146bbf038);
          local_138[0] = &local_b0;
          local_138[1] = (undefined1 (*) [16])0x1400020c0;
          local_138[2] = (undefined1 (*) [16])&local_188;
          local_138[3] = (undefined1 (*) [16])0x145baee70;
          local_49 = 1;
          local_4a = 1;
          func_0x000145b9c4d0();
          local_68 = pauVar25;
          lVar11 = (ulong)(byte)(pauVar25[0x12][8] - 1) * 8;
          local_70 = *(undefined1 (**) [16])(lVar11 + 0x146bbf078);
          local_148 = *(undefined1 (**) [16])(lVar11 + 0x146bbf098);
          local_140 = *(undefined1 (**) [16])(lVar11 + 0x146bbf0b8);
          local_160 = *(ulong **)(lVar11 + 0x146bbf0d8);
          local_158 = *(undefined8 *)(lVar11 + 0x146bbf0f8);
          local_138[0] = *(undefined1 (**) [16])(lVar11 + 0x146bbf058);
          local_138[1] = *(undefined1 (**) [16])(lVar11 + 0x146bbf078);
          local_138[2] = local_148;
          local_138[3] = local_140;
          local_118 = local_160;
          local_110 = local_158;
          local_108 = *(undefined1 **)(lVar11 + 0x146bbf118);
          local_100 = *(undefined8 *)(lVar11 + 0x146bbf138);
          local_f8 = *(undefined8 *)(lVar11 + 0x146bbf158);
          local_f0 = *(undefined8 *)(lVar11 + 0x146bbf178);
          local_e8 = *(undefined8 *)(lVar11 + 0x146bbf198);
          local_e0 = *(undefined8 *)(lVar11 + 0x146bbf1b8);
          local_60 = local_90;
          local_d8 = *(undefined8 *)(lVar11 + 0x146bbf1d8);
          local_d0 = *(undefined8 *)(lVar11 + 0x146bbf1f8);
          local_c8 = *(undefined8 *)(lVar11 + 0x146bbf218);
          local_c0 = *(undefined8 *)(lVar11 + 0x146bbf238);
          auVar27._8_8_ = local_138[uVar22 * 2 + 1];
          auVar27._0_8_ = local_138[uVar22 * 2];
          local_70 = pauStack_88;
          local_150 = lVar12;
          local_198 = func_0x0001458da590();
          lVar12 = local_150;
          if (local_198._0_8_ == 0) {
            local_198 = auVar27;
          }
          if (local_60 != (undefined1 (*) [16])0x0) {
            func_0x0001400021d0();
          }
          pauVar25 = local_68;
          if (lVar12 == 0) {
            if (4 < local_78) {
              local_49 = 1;
              local_4a = 1;
              func_0x000145d697e3();
              goto LAB_1458be733;
            }
            if ((byte)(uVar20 - 2) < 10) {
              lVar12 = *(long *)((ulong)(uVar20 - 2 & 0xff) * 8 + 0x146bbf258);
            }
            else {
              lVar12 = 0x146bab7a8;
            }
            auVar8._8_8_ = *(undefined8 *)((long)local_68 + (local_78 * 3 + 1) * 8);
            auVar8._0_8_ = *(undefined8 *)((long)local_68 + local_78 * 0x18);
            cVar2 = *(char *)((long)local_68 + (local_78 * 3 + 2) * 8);
            local_138[0] = (undefined1 (*) [16])(lVar12 + 0x10);
            local_138[1] = (undefined1 (*) [16])0x1400020c0;
            local_138[2] = (undefined1 (*) [16])&local_78;
            local_138[3] = (undefined1 (*) [16])0x145baee70;
            local_49 = 1;
            local_4a = 1;
            func_0x000145b9c4d0();
            local_58 = local_90;
            local_60 = pauStack_88;
            local_b0 = func_0x0001458da590();
            if (local_b0._0_8_ == 0) {
              local_b0 = auVar8;
            }
            if (local_58 != (undefined1 (*) [16])0x0) {
              func_0x0001400021d0();
            }
            if (cVar2 == '\0') {
              local_138[0] = (undefined1 (*) [16])0x146bbdc28;
              local_138[1] = (undefined1 (*) [16])0x4;
              local_138[2] = &local_198;
              local_138[3] = (undefined1 (*) [16])0x146bbdc08;
              local_118 = (ulong *)0x146bbdc2c;
              local_110 = 3;
              local_108 = local_b0;
              local_100 = 0x146bbdc08;
              local_49 = 1;
              local_4a = 1;
              func_0x0001458da540();
            }
            else {
              local_138[0] = (undefined1 (*) [16])0x146bbdc28;
              local_138[1] = (undefined1 (*) [16])0x4;
              local_138[2] = &local_198;
              local_138[3] = (undefined1 (*) [16])0x146bbdc08;
              local_118 = (ulong *)0x146bbdc2c;
              local_110 = 3;
              local_108 = local_b0;
              local_100 = 0x146bbdc08;
              local_49 = 1;
              local_4a = 1;
              func_0x0001458da540();
            }
            pauVar17 = pauStack_88;
            local_70 = (undefined1 (*) [16])local_80;
            local_138[0] = (undefined1 (*) [16])&local_78;
            local_138[1] = (undefined1 (*) [16])0x0;
            local_138[2] = (undefined1 (*) [16])0x5;
            local_138[3] = pauVar25;
            local_118 = &local_188;
            local_98 = pauStack_88;
            local_58 = local_90;
            local_a0 = local_90;
            local_49 = 0;
            local_4a = 1;
            auVar29 = func_0x0001459b27c0();
            iVar18 = 0;
            if ((auVar29._0_8_ & 1) != 0) {
              iVar18 = auVar29._8_4_;
            }
          }
          else {
            pauVar25 = (undefined1 (*) [16])((long)local_58 * 0x10 + lVar12);
            pauStack_88 = (undefined1 (*) [16])0x1400020c0;
            local_49 = 1;
            local_4a = 1;
            local_90 = pauVar25;
            func_0x000145b9c4d0();
            local_60 = local_138[0];
            auVar27 = *pauVar25;
            local_70 = local_138[1];
            local_b0 = func_0x0001458da590();
            if (local_b0._0_8_ == 0) {
              local_b0 = auVar27;
            }
            if (local_60 != (undefined1 (*) [16])0x0) {
              func_0x0001400021d0();
            }
            local_138[0] = (undefined1 (*) [16])0x146bbdc28;
            local_138[1] = (undefined1 (*) [16])0x4;
            local_138[2] = &local_198;
            local_138[3] = (undefined1 (*) [16])0x146bbdc08;
            local_118 = (ulong *)0x146bbdc2c;
            local_110 = 3;
            local_108 = local_b0;
            local_100 = 0x146bbdc08;
            local_49 = 1;
            local_4a = 1;
            func_0x0001458da540();
            iVar18 = *(int *)(lVar12 + (long)local_58 * 0x20 + 0x30 + uVar22 * 4);
            if (iVar18 == 0) {
              iVar18 = *(int *)(local_68[0xe] + uVar22 * 4 + 8);
            }
            local_58 = local_90;
            local_70 = (undefined1 (*) [16])local_80;
            pauVar17 = pauStack_88;
            pauVar25 = local_68;
          }
          bVar3 = pauVar25[0x12][8];
          local_60 = (undefined1 (*) [16])CONCAT44(local_60._4_4_,iVar18);
          if ((uVar16 == 2) && (bVar3 == 1)) {
            local_148 = (undefined1 (*) [16])CONCAT71(local_148._1_7_,uRam0000000146bbdc86);
            lVar12 = 2;
            local_138[0] = (undefined1 (*) [16])0x146bbdcac;
            local_140 = (undefined1 (*) [16])CONCAT44(local_140._4_4_,0x14);
          }
          else {
            local_148 = (undefined1 (*) [16])
                        CONCAT71(local_148._1_7_,*(undefined1 *)(uVar22 + 0x146bbdc84));
            local_140 = (undefined1 (*) [16])
                        CONCAT44(local_140._4_4_,*(undefined4 *)(uVar22 * 4 + 0x146bbdc64));
            if (uVar16 < 7) {
                    /* WARNING: Could not emulate address calculation at 0x0001458be24b */
                    /* WARNING: Treating indirect jump as call */
              plVar13 = (long *)(*(code *)((long)*(int *)(uVar22 * 4 + 0x146bbf900) + 0x146bbf900))
                                          ();
              return plVar13;
            }
            lVar12 = 3;
            local_138[0] = (undefined1 (*) [16])0x146bbdcec;
          }
          local_138[1] = (undefined1 (*) [16])(*local_138[0] + lVar12 * 8);
          local_138[2] = (undefined1 (*) [16])&local_78;
          local_a0 = local_58;
          local_49 = 0;
          local_4a = 1;
          local_98 = pauVar17;
          local_68 = pauVar17;
          func_0x0001459963f0();
          local_160 = (ulong *)CONCAT44(local_160._4_4_,(uint)bVar3);
          iVar18 = 0;
          local_158 = CONCAT44(local_158._4_4_,4);
        }
        else {
          local_b0._0_8_ = uVar22 - 8;
          if (*(ulong *)pauVar25[8] <= (ulong)local_b0._0_8_) goto LAB_1458bd7f9;
          piVar26 = (int *)(local_b0._0_8_ * 0x90 + *(long *)(pauVar25[7] + 8));
          if (lVar12 == 0) {
            if ((byte)(uVar20 - 2) < 10) {
              lVar12 = *(long *)((ulong)(uVar20 - 2 & 0xff) * 8 + 0x146bbf258);
            }
            else {
              lVar12 = 0x146bab7a8;
            }
            local_138[0] = (undefined1 (*) [16])(lVar12 + 0x10);
            local_138[1] = (undefined1 (*) [16])0x1400020c0;
            local_138[2] = &local_b0;
            local_138[3] = (undefined1 (*) [16])0x145baee70;
            local_118 = &local_78;
            local_110 = 0x145baee70;
            local_49 = 1;
            local_4a = 1;
            func_0x000145b9c4d0();
            local_68 = local_90;
            local_60 = pauStack_88;
            if (4 < local_78) {
              func_0x000145d697e3();
LAB_1458be733:
                    /* WARNING: Does not return */
              pcVar6 = (code *)invalidInstructionException();
              (*pcVar6)();
            }
            auVar9._8_8_ = *(undefined8 *)(piVar26 + local_78 * 4 + 4);
            auVar9._0_8_ = *(undefined8 *)(piVar26 + local_78 * 4 + 2);
            auVar27 = func_0x0001458da590();
            if (auVar27._0_8_ == 0) {
              auVar27 = auVar9;
            }
            func_0x00014023ff50();
            pauVar25 = local_138[2];
            local_58 = local_138[1];
            if ((int)local_138[0] == 1) {
              func_0x000145d6944b();
              goto LAB_1458be733;
            }
            if (auVar27._8_8_ != 0) {
              func_0x000145bc977b();
            }
            if (local_68 != (undefined1 (*) [16])0x0) {
              func_0x0001400021d0();
            }
            if (4 < local_78) {
              local_98 = pauVar25;
              local_a0 = local_58;
              local_49 = 0;
              local_4a = 1;
              func_0x000145d697e3();
              goto LAB_1458be733;
            }
            local_60 = (undefined1 (*) [16])CONCAT44(local_60._4_4_,piVar26[local_78 + 0x1e]);
            local_138[2] = pauVar25;
          }
          else {
            if (*(ulong *)(lVar12 + 0x28) <= (ulong)local_b0._0_8_) goto LAB_1458bd7f9;
            lVar12 = local_b0._0_8_ * 0x30 + *(long *)(lVar12 + 0x20);
            local_60 = (undefined1 (*) [16])
                       CONCAT44(local_60._4_4_,*(undefined4 *)(lVar12 + (long)local_58 * 0x18));
            puVar1 = (ulong *)(lVar12 + 8 + (long)local_58 * 0x18);
            local_b0._0_8_ = *puVar1;
            local_b0._8_8_ = puVar1[1];
            local_90 = &local_b0;
            pauStack_88 = (undefined1 (*) [16])0x1400020c0;
            local_49 = 1;
            local_4a = 1;
            func_0x000145b9c4d0();
            auVar7._8_8_ = local_b0._8_8_;
            auVar7._0_8_ = local_b0._0_8_;
            local_68 = local_138[0];
            local_70 = local_138[1];
            auVar27 = func_0x0001458da590();
            if (auVar27._0_8_ == 0) {
              auVar27 = auVar7;
            }
            func_0x00014023ff50();
            local_58 = local_138[1];
            if ((int)local_138[0] == 1) {
              func_0x000145d6944b();
              goto LAB_1458be733;
            }
            if (auVar27._8_8_ != 0) {
              func_0x000145bc977b();
            }
            if (local_68 != (undefined1 (*) [16])0x0) {
              func_0x0001400021d0();
            }
          }
          local_70 = auVar27._8_8_;
          pauVar25 = auVar27._0_8_;
          if ((*piVar26 == 1) && (local_78 == 4)) {
            piVar14 = piVar26 + 1;
            iVar18 = 1;
          }
          else {
            piVar14 = piVar26 + 0x1b;
            iVar18 = piVar26[0x1d];
          }
          local_158 = CONCAT44(local_158._4_4_,piVar26[0x1a]);
          local_160 = (ulong *)CONCAT44(local_160._4_4_,*piVar14);
          local_140 = (undefined1 (*) [16])CONCAT44(local_140._4_4_,piVar26[0x1c]);
          local_148 = (undefined1 (*) [16])CONCAT71(local_148._1_7_,(char)piVar26[0x23]);
          local_138[0] = *(undefined1 (**) [16])(piVar26 + 0x16);
          local_138[1] = (undefined1 (*) [16])(*local_138[0] + *(long *)(piVar26 + 0x18) * 8);
          local_a0 = local_58;
          local_49 = 0;
          local_4a = 1;
          local_98 = local_138[2];
          local_138[2] = (undefined1 (*) [16])&local_78;
          local_68 = local_98;
          func_0x000145996470();
        }
        uVar19 = (undefined1)uVar20;
        if (local_78 == 0) {
          uVar15 = 0;
          auVar28._8_8_ = 0;
          auVar28._0_8_ = pauVar25;
          auVar28 = auVar28 << 0x40;
        }
        else {
          local_150 = CONCAT44(local_150._4_4_,iVar18);
          uVar15 = (ulong)((uVar20 * 3 + uVar16 & 7) << 4);
          local_138[0] = (undefined1 (*) [16])(uVar15 + 0x146bbdd04);
          local_138[1] = (undefined1 (*) [16])(uVar15 + 0x146bbdd14);
          local_138[2] = (undefined1 (*) [16])&local_78;
          local_98 = local_68;
          local_a0 = local_58;
          local_49 = 0;
          local_4a = 1;
          func_0x0001459964f0();
          local_98 = local_68;
          local_a0 = local_58;
          local_49 = 0;
          local_4a = 1;
          auVar28 = func_0x0001458bb9e0();
          pauVar25 = local_168;
          if (local_78 == 4) {
            uVar23 = 0x3d2c08310000000c;
            if (7 < uVar16) {
              uVar23 = 0x10000000b;
            }
            if (local_168 == local_178) {
              local_98 = local_68;
              local_a0 = local_58;
              local_49 = 0;
              local_4a = 1;
              func_0x000145bfb120();
            }
            *(undefined8 *)(lStack_170 + (long)pauVar25 * 8) = uVar23;
            local_168 = (undefined1 (*) [16])(*pauVar25 + 1);
          }
          uVar15 = local_78;
          iVar18 = (int)local_150;
        }
        local_138[2] = local_168;
        local_138[0] = local_178;
        local_138[1] = (undefined1 (*) [16])lStack_170;
        func_0x0001458b8e20();
        param_4[5] = local_80;
        param_4[3] = (long)local_90;
        param_4[4] = (long)pauStack_88;
        *param_4 = (long)local_58;
        param_4[1] = (long)local_68;
        param_4[2] = (long)local_70;
        param_4[6] = uVar15;
        *(undefined1 (*) [16])(param_4 + 7) = auVar28;
        param_4[9] = uVar22;
        *(int *)(param_4 + 10) = (int)local_180;
        *(undefined4 *)((long)param_4 + 0x54) = local_60._0_4_;
        *(undefined4 *)(param_4 + 0xb) = (undefined4)local_158;
        *(undefined4 *)((long)param_4 + 0x5c) = local_160._0_4_;
        *(undefined4 *)(param_4 + 0xc) = local_140._0_4_;
        *(int *)((long)param_4 + 100) = iVar18;
        *(undefined1 *)(param_4 + 0xd) = local_148._0_1_;
        *(undefined1 *)((long)param_4 + 0x69) = uVar19;
        return param_4;
      }
    }
  }
LAB_1458bd7f9:
  *param_4 = -1;
  return param_4;
}
