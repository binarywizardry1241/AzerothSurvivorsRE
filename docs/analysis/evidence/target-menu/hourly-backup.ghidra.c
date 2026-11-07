
undefined8
entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,undefined8 param_4,ulong param_5)

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
  long *local_f40;
  ulong local_f38;
  ulong *local_f30;
  undefined8 local_f28;
  long *local_f20;
  undefined8 local_f18;
  ulong *local_f10;
  undefined8 local_f08;
  ulong *local_f00;
  undefined8 local_ef8;
  ulong *local_ef0;
  undefined8 local_ee8;
  undefined8 local_ce0;
  undefined8 local_a80;
  undefined8 local_810;
  long *local_5a0;
  ulong local_598;
  long local_330;
  long local_328;
  ulong local_320;
  long local_d0;
  undefined8 local_c8;
  long local_b8;
  undefined8 local_a8;
  ulong local_98;
  ulong local_90;
  long local_88;
  long local_80;
  long local_78;
  ulong local_70;
  undefined8 local_68;
  long local_60;
  long *local_50;
  undefined8 local_48;

  local_48 = 0xfffffffffffffffe;
  func_0x000145468d60(param_3,param_5,param_3,&local_f40);
  if (local_f40 != (long *)0xffffffffffffffff) {
    local_50 = local_f40;
    local_68 = local_f38;
    func_0x000145702c70();
    lVar3 = local_330;
    local_60 = local_328;
    if (local_50 != (long *)0x0) {
      func_0x0001400021d0();
    }
    if (lVar3 != -1) {
      local_50 = (long *)lVar3;
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
      local_78 = lVar7 + ((lVar4 >> 1) - (lVar4 >> 0x3f)) + 1;
      local_80 = lVar3 + -9;
      if (lVar7 < 0x132) {
        local_80 = lVar3 + 3;
      }
      local_80 = local_80 + lVar9;
      local_88 = (ulong)(local_80 < 3) + uVar2 * 400 + lVar8 / 0x16d;
      local_90 = uVar5 / 0xe10;
      uVar1 = (uint)(uVar5 / 0x3c);
      local_98 = (ulong)(uVar1 % 0x3c);
      local_70 = (ulong)((int)uVar5 + uVar1 * -0x3c);
      local_f40 = &local_88;
      local_f38 = 0x14573b410;
      local_f30 = (ulong *)&local_80;
      local_f28 = 0x14573b410;
      local_f20 = &local_78;
      local_f18 = 0x14573b410;
      local_f10 = &local_90;
      local_f08 = 0x14573b340;
      local_f00 = &local_98;
      local_ef8 = 0x14573b340;
      local_ee8 = 0x14573b340;
      local_ef0 = &local_70;
      func_0x000145728390();
      local_f40 = (long *)0x1469d19d8;
      local_f38 = 0x1400020c0;
      local_f28 = 0x1400020e0;
      local_f30 = (ulong *)&local_330;
      func_0x000145728390();
      if (local_330 != 0) {
        func_0x0001400021d0();
      }
      local_68 = local_c8;
      func_0x000145702c70();
      if (local_d0 != 0) {
        func_0x0001400021d0();
      }
      local_f40 = (long *)CONCAT71(local_f40._1_7_,1);
      uVar2 = func_0x000145709fb0();
      if ((uVar2 == 0) && (uVar2 = func_0x000145718cb0(), uVar2 == 0)) {
        func_0x000145712640();
        uVar2 = local_f38;
        plVar6 = local_f40;
        if (local_f40 == (long *)0x2) {
          if ((1 < ((uint)local_f38 & 3) - 2) && ((local_f38 & 3) != 0)) {
            uVar2 = local_f38 - 1;
            local_f40 = (long *)0x3;
            local_f38 = uVar2;
            func_0x00014573b330();
          }
        }
        else {
          func_0x0001457731ed();
        }
        func_0x0001457731ed();
        local_f40 = (long *)0x0;
        local_ce0 = 0;
        local_a80 = 2;
        local_810 = 2;
        local_5a0 = plVar6;
        local_598 = uVar2;
        func_0x000145538370();
        lVar3 = local_328;
        if (1 < local_320) {
          if (local_320 < 0x15) {
            lVar4 = local_328 + 0x20;
            do {
              func_0x000145502f00();
              lVar4 = lVar4 + 0x20;
            } while (lVar4 != local_320 * 0x20 + local_328);
          }
          else {
            func_0x000145480980();
            lVar3 = local_328;
          }
        }
        lVar4 = local_320 * 0x20 + lVar3;
        uVar2 = 5;
        bVar10 = false;
        do {
          if (bVar10) {
            if (lVar3 == lVar4) goto LAB_145469a9c;
          }
          else {
            if ((ulong)(lVar4 - lVar3) >> 5 <= uVar2) {
LAB_145469a9c:
              if (local_320 != 0) {
                lVar3 = lVar3 + 8;
                uVar2 = local_320;
                do {
                  if (*(long *)(lVar3 + -8) != 0) {
                    func_0x0001400021d0();
                  }
                  lVar3 = lVar3 + 0x20;
                  uVar2 = uVar2 - 1;
                } while (uVar2 != 0);
              }
              if (local_330 != 0) {
                func_0x0001400021d0();
              }
              if (local_b8 != 0) {
                func_0x0001400021d0();
              }
              if (local_50 == (long *)0x0) {
                return 1;
              }
              func_0x0001400021d0();
              return 1;
            }
            lVar4 = lVar4 + uVar2 * -0x20;
          }
          uVar5 = func_0x0001457121a0();
          lVar4 = lVar4 + -0x20;
          bVar10 = true;
          uVar2 = 0;
          if (uVar5 != 0) {
            if ((1 < ((uint)uVar5 & 3) - 2) && ((uVar5 & 3) != 0)) {
              local_f38 = uVar5 - 1;
              local_f40 = (long *)CONCAT71(local_f40._1_7_,3);
              func_0x00014573b330();
            }
            uVar2 = 0;
          }
        } while( true );
      }
      local_328 = local_a8;
      local_f38 = 0x14571b240;
      local_f28 = 0x145739600;
      local_f40 = &local_330;
      local_f30 = &local_70;
      local_70 = uVar2;
      func_0x000145711f90();
      if ((1 < ((uint)local_70 & 3) - 2) && ((local_70 & 3) != 0)) {
        local_f38 = local_70 - 1;
        local_f40 = (long *)CONCAT71(local_f40._1_7_,3);
        func_0x00014573b330();
      }
      if (local_b8 != 0) {
        func_0x0001400021d0();
      }
      if (local_50 != (long *)0x0) {
        func_0x0001400021d0();
      }
    }
  }
  return 0;
}
