undefined8
FUN_1458ef860(undefined8 param_1,undefined8 param_2,undefined8 param_3,undefined8 param_4,
             ulong param_5)

{
  uint uVar1;
  ulong uVar2;
  long lVar3;
  long lVar4;
  ulong uVar5;
  long *plVar6;
  long lVar7;
  long lVar8;
  long lVar9;
  bool bVar10;
  long *plStack_f40;
  ulong uStack_f38;
  ulong *puStack_f30;
  undefined1 *puStack_f28;
  long *plStack_f20;
  undefined8 uStack_f18;
  ulong *puStack_f10;
  undefined8 uStack_f08;
  ulong *puStack_f00;
  undefined8 uStack_ef8;
  ulong *puStack_ef0;
  undefined8 uStack_ee8;
  undefined8 uStack_ce0;
  undefined8 uStack_a80;
  undefined8 uStack_810;
  long *plStack_5a0;
  ulong uStack_598;
  long lStack_330;
  long lStack_328;
  ulong uStack_320;
  long lStack_d0;
  undefined8 uStack_c8;
  long lStack_b8;
  undefined8 uStack_a8;
  ulong uStack_98;
  ulong uStack_90;
  long lStack_88;
  long lStack_80;
  long lStack_78;
  ulong uStack_70;
  undefined8 uStack_68;
  long lStack_60;
  long *plStack_50;
  undefined8 uStack_48;

  uStack_48 = 0xfffffffffffffffe;
  FUN_1458ef170(param_3,param_5,param_3,&plStack_f40);
  if (plStack_f40 != (long *)0xffffffffffffffff) {
    plStack_50 = plStack_f40;
    uStack_68 = uStack_f38;
    func_0x000145ba6d40();
    lVar3 = lStack_330;
    lStack_60 = lStack_328;
    if (plStack_50 != (long *)0x0) {
      func_0x0001400021d0();
    }
    if (lVar3 != -1) {
      plStack_50 = (long *)lVar3;
      uVar5 = param_5 % 0x15180;
      uVar2 = (param_5 / 0x15180 + 0xafa6c) / 0x23ab1;
      lVar7 = param_5 / 0x15180 + uVar2 * -0x23ab1 + 0xafa6c;
      lVar3 = SUB168(SEXT816(lVar7) * SEXT816(-0x2ce33e6c02ce33e7),8);
      lVar4 = SUB168(SEXT816(lVar7) * SEXT816(0x1a537e05fff1a537),8) - lVar7;
      lVar8 = ((lVar4 >> 0x11) - (lVar4 >> 0x3f)) +
              lVar7 / 0x8eac + ((lVar3 >> 8) - (lVar3 >> 0x3f)) + lVar7;
      lVar3 = SUB168(SEXT816(lVar8) * SEXT816(-0x2ce33e6c02ce33e7),8);
      lVar7 = ((lVar3 >> 8) - (lVar3 >> 0x3f)) + lVar7 + lVar8 / 0x8e94 + (lVar8 / 0x16d) * -0x16d;
      lVar4 = lVar7 * 5 + 2;
      lVar3 = lVar4 >> 0x3f;
      lVar9 = -lVar3;
      lVar3 = lVar4 / 0x99 + lVar3;
      lVar4 = SUB168(SEXT816((lVar3 + lVar9) * 0x99 + 2) * SEXT816(-0x6666666666666667),8);
      lStack_78 = lVar7 + ((lVar4 >> 1) - (lVar4 >> 0x3f)) + 1;
      lStack_80 = lVar3 + -9;
      if (lVar7 < 0x132) {
        lStack_80 = lVar3 + 3;
      }
      lStack_80 = lStack_80 + lVar9;
      lStack_88 = (ulong)(lStack_80 < 3) + uVar2 * 400 + lVar8 / 0x16d;
      uStack_90 = uVar5 / 0xe10;
      uVar1 = (uint)(uVar5 / 0x3c);
      uStack_98 = (ulong)(uVar1 % 0x3c);
      uStack_70 = (ulong)((int)uVar5 + uVar1 * -0x3c);
      plStack_f40 = &lStack_88;
      uStack_f38 = 0x145bdf8a0;
      puStack_f30 = (ulong *)&lStack_80;
      puStack_f28 = (undefined1 *)0x145bdf8a0;
      plStack_f20 = &lStack_78;
      uStack_f18 = 0x145bdf8a0;
      puStack_f10 = &uStack_90;
      uStack_f08 = 0x145bdf7d0;
      puStack_f00 = &uStack_98;
      uStack_ef8 = 0x145bdf7d0;
      uStack_ee8 = 0x145bdf7d0;
      puStack_ef0 = &uStack_70;
      func_0x000145bcce30();
      plStack_f40 = (long *)0x146ed29d0;
      uStack_f38 = 0x1400020c0;
      puStack_f28 = &DAT_1400020e0;
      puStack_f30 = (ulong *)&lStack_330;
      func_0x000145bcce30();
      if (lStack_330 != 0) {
        func_0x0001400021d0();
      }
      uStack_68 = uStack_c8;
      func_0x000145ba6d40();
      if (lStack_d0 != 0) {
        func_0x0001400021d0();
      }
      plStack_f40 = (long *)CONCAT71(plStack_f40._1_7_,1);
      uVar2 = func_0x000145bae140();
      if ((uVar2 == 0) && (uVar2 = func_0x000145bbd750(), uVar2 == 0)) {
        func_0x000145bb6d30();
        uVar2 = uStack_f38;
        plVar6 = plStack_f40;
        if (plStack_f40 == (long *)0x2) {
          if ((1 < ((uint)uStack_f38 & 3) - 2) && ((uStack_f38 & 3) != 0)) {
            uVar2 = uStack_f38 - 1;
            plStack_f40 = (long *)0x3;
            uStack_f38 = uVar2;
            func_0x000145bdf7c0();
          }
        }
        else {
          func_0x000145bfa0e7();
        }
        func_0x000145bfa0e7();
        plStack_f40 = (long *)0x0;
        uStack_ce0 = 0;
        uStack_a80 = 2;
        uStack_810 = 2;
        plStack_5a0 = plVar6;
        uStack_598 = uVar2;
        func_0x0001459bc030();
        lVar3 = lStack_328;
        if (1 < uStack_320) {
          if (uStack_320 < 0x15) {
            lVar4 = lStack_328 + 0x20;
            do {
              func_0x0001459a9520();
              lVar4 = lVar4 + 0x20;
            } while (lVar4 != uStack_320 * 0x20 + lStack_328);
          }
          else {
            func_0x0001459dd810();
            lVar3 = lStack_328;
          }
        }
        lVar4 = uStack_320 * 0x20 + lVar3;
        uVar2 = 5;
        bVar10 = false;
        do {
          if (bVar10) {
            if (lVar3 == lVar4) goto LAB_1458efeac;
          }
          else {
            if ((ulong)(lVar4 - lVar3) >> 5 <= uVar2) {
LAB_1458efeac:
              if (uStack_320 != 0) {
                lVar3 = lVar3 + 8;
                uVar2 = uStack_320;
                do {
                  if (*(long *)(lVar3 + -8) != 0) {
                    func_0x0001400021d0();
                  }
                  lVar3 = lVar3 + 0x20;
                  uVar2 = uVar2 - 1;
                } while (uVar2 != 0);
              }
              if (lStack_330 != 0) {
                func_0x0001400021d0();
              }
              if (lStack_b8 != 0) {
                func_0x0001400021d0();
              }
              if (plStack_50 == (long *)0x0) {
                return 1;
              }
              func_0x0001400021d0();
              return 1;
            }
            lVar4 = lVar4 + uVar2 * -0x20;
          }
          uVar5 = func_0x000145bb67a0();
          lVar4 = lVar4 + -0x20;
          bVar10 = true;
          uVar2 = 0;
          if (uVar5 != 0) {
            if ((1 < ((uint)uVar5 & 3) - 2) && ((uVar5 & 3) != 0)) {
              uStack_f38 = uVar5 - 1;
              plStack_f40 = (long *)CONCAT71(plStack_f40._1_7_,3);
              func_0x000145bdf7c0();
            }
            uVar2 = 0;
          }
        } while( true );
      }
      lStack_328 = uStack_a8;
      uStack_f38 = 0x145bbfce0;
      puStack_f28 = (undefined1 *)0x145bddaf0;
      plStack_f40 = &lStack_330;
      puStack_f30 = &uStack_70;
      uStack_70 = uVar2;
      func_0x000145bb6590();
      if ((1 < ((uint)uStack_70 & 3) - 2) && ((uStack_70 & 3) != 0)) {
        uStack_f38 = uStack_70 - 1;
        plStack_f40 = (long *)CONCAT71(plStack_f40._1_7_,3);
        func_0x000145bdf7c0();
      }
      if (lStack_b8 != 0) {
        func_0x0001400021d0();
      }
      if (plStack_50 != (long *)0x0) {
        func_0x0001400021d0();
      }
    }
  }
  return 0;
}
