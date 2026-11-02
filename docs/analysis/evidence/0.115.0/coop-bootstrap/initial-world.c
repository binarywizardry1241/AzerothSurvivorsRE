void FUN_145892220(longlong param_1,ulonglong param_2)

{
  longlong *plVar1;
  longlong lVar2;
  undefined4 *puVar3;
  ulonglong uVar4;
  longlong *plVar5;
  longlong lVar6;
  longlong lVar7;
  code *pcVar8;
  ulonglong uVar9;
  longlong *plVar10;
  ulonglong uVar11;
  ulonglong uVar12;
  longlong *plVar13;
  bool bVar14;
  undefined8 uStack_328;
  undefined8 uStack_320;
  undefined4 auStack_318 [4];
  undefined4 uStack_308;
  undefined4 uStack_304;
  undefined4 uStack_300;
  undefined4 uStack_2fc;
  undefined4 uStack_2f8;
  undefined4 uStack_2f4;
  undefined4 uStack_2f0;
  undefined4 uStack_2ec;
  undefined4 uStack_2e8;
  undefined4 uStack_2e4;
  undefined4 uStack_2e0;
  undefined4 uStack_2dc;
  undefined4 uStack_138;
  undefined4 uStack_134;
  undefined4 uStack_130;
  undefined4 uStack_12c;
  undefined4 uStack_128;
  undefined4 uStack_124;
  undefined4 uStack_120;
  undefined4 uStack_11c;
  undefined4 uStack_118;
  undefined4 uStack_114;
  undefined4 uStack_110;
  undefined4 uStack_10c;
  undefined4 uStack_108;
  undefined4 uStack_104;
  undefined4 uStack_100;
  undefined4 uStack_fc;
  undefined4 uStack_f8;
  undefined4 uStack_f4;
  undefined4 uStack_f0;
  undefined4 uStack_ec;
  longlong *plStack_e8;
  longlong *plStack_e0;
  undefined4 uStack_d8;
  undefined4 uStack_d4;
  undefined8 uStack_d0;
  undefined4 uStack_c8;
  undefined4 uStack_c4;
  undefined4 uStack_c0;
  undefined4 uStack_bc;
  undefined4 uStack_b8;
  undefined4 uStack_b4;
  undefined4 uStack_b0;
  undefined4 uStack_ac;
  undefined4 uStack_a8;
  undefined4 uStack_a4;
  undefined4 uStack_a0;
  undefined4 uStack_9c;
  longlong lStack_98;
  longlong *plStack_90;
  ulonglong uStack_88;
  longlong lStack_80;
  longlong lStack_78;
  longlong *plStack_70;
  longlong lStack_68;
  longlong *plStack_60;
  longlong lStack_58;
  undefined1 uStack_49;
  undefined8 uStack_48;

  uStack_48 = 0xfffffffffffffffe;
  if ((*(int *)(param_1 + 0xc58) == 3) && (param_2 < *(ulonglong *)(param_1 + 0xc98))) {
    lStack_58 = param_2 * 0x478;
    if ((*(int *)(*(longlong *)(param_1 + 0xc90) + lStack_58) == 1) &&
       (*(int *)(param_1 + 0x10) != 2)) {
      uVar9 = *(ulonglong *)(*(longlong *)(param_1 + 0xc90) + 8 + lStack_58);
      plStack_60 = (longlong *)(param_1 + 0x10);
      uStack_88 = param_2;
      FUN_1458e9a60(&lStack_78,plStack_60,uVar9);
      uVar4 = *(ulonglong *)(param_1 + 0x998);
      uVar11 = 0;
      lStack_80 = param_1;
      while (uVar11 <= uVar4) {
        uVar12 = uVar11 + 1;
        bVar14 = uVar11 != uVar9;
        uVar11 = uVar12;
        if (bVar14) {
          uStack_49 = 1;
          FUN_1458e8b60(&uStack_128,plStack_60);
          uStack_a8 = uStack_f8;
          uStack_a4 = uStack_f4;
          uStack_a0 = uStack_f0;
          uStack_9c = uStack_ec;
          uStack_b8 = uStack_108;
          uStack_b4 = uStack_104;
          uStack_b0 = uStack_100;
          uStack_ac = uStack_fc;
          uStack_c8 = uStack_118;
          uStack_c4 = uStack_114;
          uStack_c0 = uStack_110;
          uStack_bc = uStack_10c;
          uStack_d8 = uStack_128;
          uStack_d4 = uStack_124;
          uStack_d0._0_4_ = uStack_120;
          uStack_d0._4_4_ = uStack_11c;
          plStack_e8 = (longlong *)0x0;
          plStack_e0 = (longlong *)0x2;
          if ((ulonglong)(lStack_78 - lStack_68) < 2) {
            FUN_145d14a10(&lStack_78,lStack_68,2,8,0x20);
          }
          lVar2 = lStack_68;
          plVar10 = plStack_e0;
          plVar13 = plStack_e8;
          uStack_328 = (longlong)plStack_e8;
          uStack_320 = plStack_e0;
          auStack_318[0] = uStack_d8;
          auStack_318[1] = uStack_d4;
          auStack_318[2] = (undefined4)uStack_d0;
          auStack_318[3] = uStack_d0._4_4_;
          uStack_308 = uStack_c8;
          uStack_304 = uStack_c4;
          uStack_300 = uStack_c0;
          uStack_2fc = uStack_bc;
          uStack_2f8 = uStack_b8;
          uStack_2f4 = uStack_b4;
          uStack_2f0 = uStack_b0;
          uStack_2ec = uStack_ac;
          uStack_2e8 = uStack_a8;
          uStack_2e4 = uStack_a4;
          uStack_2e0 = uStack_a0;
          uStack_2dc = uStack_9c;
          param_1 = lStack_80;
          if ((longlong)plStack_e0 - (longlong)plStack_e8 != 0) {
            func_0x000145d145fb(plStack_70 + lStack_68 * 4,auStack_318 + (longlong)plStack_e8 * 8,
                                ((longlong)plStack_e0 - (longlong)plStack_e8) * 0x20);
            lStack_68 = (longlong)plVar10 + (lVar2 - (longlong)plVar13);
            param_1 = lStack_80;
          }
        }
      }
      uStack_49 = 1;
      FUN_1458ecfd0(plStack_60,uVar9);
      uStack_49 = 1;
      FUN_1459ac910(&uStack_328,param_1 + 0x1750);
      lVar2 = lStack_68;
      if (lStack_68 == lStack_78) {
        FUN_145d150f0(&lStack_78);
      }
      uVar9 = lVar2 * 0x20;
      plStack_70[lVar2 * 4 + 2] = CONCAT44(auStack_318[1],auStack_318[0]);
      (plStack_70 + lVar2 * 4 + 2)[1] = CONCAT44(auStack_318[3],auStack_318[2]);
      plVar13 = plStack_70 + lVar2 * 4;
      *(undefined4 *)plVar13 = (undefined4)uStack_328;
      *(undefined4 *)((longlong)plVar13 + 4) = uStack_328._4_4_;
      *(undefined4 *)(plVar13 + 1) = (undefined4)uStack_320;
      *(undefined4 *)((longlong)plVar13 + 0xc) = uStack_320._4_4_;
      lStack_68 = lVar2 + 1;
      plVar10 = plStack_70 + lStack_68 * 4;
      plStack_e8 = plStack_70;
      plVar13 = plStack_70 + 5;
      plStack_90 = plStack_70;
      uStack_d0 = plVar10;
      lStack_98 = lStack_78;
      plStack_60 = plVar10;
      if (plStack_70 != plVar10) {
        do {
          plVar1 = plStack_70 + 4;
          plVar5 = (longlong *)*plStack_70;
          plStack_e0 = plVar1;
          if (plVar5 == (longlong *)0xffffffffffffffff) {
            if (plVar10 != plVar1) {
              uVar9 = uVar9 >> 5;
              do {
                if (plVar13[-1] != 0) {
                  func_0x0001400021d0(*plVar13,plVar13[-1],1);
                }
                plVar13 = plVar13 + 4;
                uVar9 = uVar9 - 1;
              } while (uVar9 != 0);
            }
            break;
          }
          auStack_318[0] = (undefined4)plStack_70[1];
          auStack_318[1] = *(undefined4 *)((longlong)plStack_70 + 0xc);
          auStack_318[2] = (undefined4)plStack_70[2];
          auStack_318[3] = *(undefined4 *)((longlong)plStack_70 + 0x14);
          uStack_308 = CONCAT22(uStack_308._2_2_,(short)plStack_70[3]);
          uStack_328 = -0x7ffffffffffffffa;
          uStack_320 = plVar5;
          uStack_138 = auStack_318[0];
          uStack_134 = auStack_318[1];
          uStack_130 = auStack_318[2];
          uStack_12c = auStack_318[3];
          if ((*(int *)(param_1 + 0xc58) == 3) && (uStack_88 < *(ulonglong *)(param_1 + 0xc98))) {
            lVar6 = *(longlong *)(param_1 + 0xc90);
            FUN_14581c690(&uStack_128,&uStack_328);
            lVar2 = lVar6 + lStack_58;
            lVar7 = *(longlong *)(lVar2 + 0x270);
            if (lVar7 == *(longlong *)(lVar2 + 0x260)) {
              FUN_145d14e50(lVar6 + lStack_58 + 0x260);
            }
            lVar6 = *(longlong *)(lVar2 + 0x268);
            *(ulonglong *)(lVar6 + 0x10 + lVar7 * 0x18) = CONCAT44(uStack_114,uStack_118);
            puVar3 = (undefined4 *)(lVar6 + lVar7 * 0x18);
            *puVar3 = uStack_128;
            puVar3[1] = uStack_124;
            puVar3[2] = uStack_120;
            puVar3[3] = uStack_11c;
            *(longlong *)(lVar2 + 0x270) = lVar7 + 1;
            param_1 = lStack_80;
            plVar10 = plStack_60;
          }
          FUN_1458712e0(&uStack_328);
          uVar9 = uVar9 - 0x20;
          plVar13 = plVar13 + 4;
          plStack_70 = plVar1;
        } while (plVar1 != plVar10);
      }
      if (lStack_98 != 0) {
        func_0x0001400021d0(plStack_90,lStack_98 << 5,8);
      }
      if (*(int *)(param_1 + 0xc58) == 3) {
        if (*(ulonglong *)(param_1 + 0xc98) <= uStack_88) {
          uStack_49 = 0;
          FUN_145eb7363(uStack_88,*(ulonglong *)(param_1 + 0xc98),&DAT_14702cea0);
                    /* WARNING: Does not return */
          pcVar8 = (code *)invalidInstructionException();
          (*pcVar8)();
        }
        *(undefined1 *)(*(longlong *)(param_1 + 0xc90) + 0x471 + lStack_58) = 1;
      }
      uStack_49 = 0;
      FUN_145892b40(param_1);
    }
  }
  return;
}
