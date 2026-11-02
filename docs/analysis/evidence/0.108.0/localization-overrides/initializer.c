void entry(undefined8 param_1,undefined8 param_2,long param_3,long param_4,undefined8 *param_5)

{
  undefined4 *puVar1;
  long lVar2;
  long **pplVar3;
  long *plVar4;
  code *pcVar5;
  long **pplVar6;
  ulong uVar7;
  long ***ppplVar8;
  long *plVar9;
  long lVar10;
  long *plVar11;
  long **pplVar12;
  long **pplVar13;
  undefined8 local_128;
  undefined8 uStack_120;
  undefined8 local_118;
  undefined8 uStack_110;
  undefined4 local_108;
  undefined4 uStack_104;
  undefined4 uStack_100;
  undefined4 uStack_fc;
  undefined4 local_d8;
  undefined4 uStack_d4;
  undefined4 uStack_d0;
  undefined4 uStack_cc;
  long local_c8;
  long local_b8;
  long *local_b0;
  long **local_a8;
  undefined8 uStack_a0;
  undefined8 uStack_98;
  long **pplStack_90;
  long **local_78;
  long **local_70;
  undefined4 uStack_68;
  undefined4 uStack_64;
  long **local_60;
  long **local_58;
  undefined1 local_49;
  undefined8 local_48;

  local_48 = 0xfffffffffffffffe;
  local_b0 = (long *)*param_5;
  local_b8 = param_5[1];
  if (param_4 != param_3) {
    lVar2 = param_5[2];
    pplVar12 = (long **)0x0;
    do {
      ppplVar8 = &local_78;
      lVar10 = (long)pplVar12 * 0x38;
      func_0x0001458e6a10(lVar10,ppplVar8,*(undefined8 *)(param_4 + 0x20 + lVar10),&local_a8,
                          *(undefined8 *)(param_4 + 0x28 + lVar10));
      if ((int)local_a8 == 1) {
        local_c8 = (long)pplStack_90;
        local_d8 = (undefined4)uStack_a0;
        uStack_d4 = uStack_a0._4_4_;
        uStack_d0 = (undefined4)uStack_98;
        uStack_cc = uStack_98._4_4_;
        local_118 = (long **)&local_d8;
        uStack_110 = 0x1400020e0;
        func_0x000145bc5690();
        local_58 = local_78;
        local_60 = local_70;
        local_78 = local_70;
        uStack_120 = 0x1400020c0;
        local_70 = (long **)CONCAT44(uStack_64,uStack_68);
        func_0x000145baedf0();
        if (local_58 != (long **)0x0) {
          func_0x0001400021d0();
        }
        if (CONCAT44(uStack_d4,local_d8) != 0) {
          func_0x0001400021d0();
        }
        uStack_98 = (long **)&DAT_00000008;
        pplStack_90 = (long **)0x0;
        uStack_a0 = (long **)0x0;
        local_128 = ppplVar8;
      }
      pplStack_90 = uStack_98 + (long)pplStack_90 * 6;
      local_a8 = uStack_98;
      lVar10 = (long)uStack_a0;
      uStack_a0 = uStack_98;
      uStack_98 = (long **)lVar10;
      func_0x000145999230();
      local_58 = pplVar12;
      func_0x0001458e4b30();
      lVar10 = (long)uStack_98;
      local_60 = local_a8;
      pplVar13 = uStack_a0 + (long)uStack_98 * 6;
      local_a8 = uStack_a0;
      uStack_98 = local_60;
      pplVar6 = uStack_a0;
      pplVar12 = uStack_a0;
      pplStack_90 = pplVar13;
      if (lVar10 == 0) {
LAB_1459cb1a0:
        uStack_a0 = pplVar12;
        if (pplVar13 != pplVar12) {
          uVar7 = (ulong)((long)pplVar13 - (long)pplVar12) / 0x30;
          pplVar12 = pplVar12 + 4;
          do {
            if (pplVar12[-4] != (long *)0x0) {
              func_0x0001400021d0();
            }
            if (pplVar12[-1] != (long *)0x0) {
              func_0x0001400021d0();
            }
            pplVar12 = pplVar12 + 6;
            uVar7 = uVar7 - 1;
          } while (uVar7 != 0);
        }
      }
      else {
        do {
          pplVar12 = pplVar6 + 6;
          pplVar3 = (long **)*pplVar6;
          if (pplVar3 == (long **)0xffffffffffffffff) goto LAB_1459cb1a0;
          local_70 = (long **)pplVar6[1];
          uStack_68 = *(undefined4 *)(pplVar6 + 2);
          uStack_64 = *(undefined4 *)((long)pplVar6 + 0x14);
          plVar11 = pplVar6[3];
          plVar9 = pplVar6[4];
          plVar4 = pplVar6[5];
          uStack_a0 = pplVar12;
          local_78 = pplVar3;
          if (plVar4 < plVar11) {
            if (plVar4 == (long *)0x0) {
              func_0x0001400021d0();
            }
            else {
              lVar10 = func_0x0001400021e0(plVar11,plVar9,plVar11,plVar9,1,plVar4);
              if (lVar10 == 0) {
                local_60 = (long **)plVar9;
                local_58 = (long **)plVar11;
                func_0x000145d934fb();
                    /* WARNING: Does not return */
                pcVar5 = (code *)invalidInstructionException();
                (*pcVar5)();
              }
            }
          }
          local_49 = 0;
          func_0x00014599a6d0();
          pplVar6 = pplVar12;
        } while (pplVar12 != pplVar13);
      }
      if (local_60 != (long **)0x0) {
        func_0x0001400021d0();
      }
      local_a8 = (long **)local_128;
      uStack_a0 = (long **)uStack_120;
      uStack_98 = local_118;
      pplStack_90 = (long **)uStack_110;
      lVar10 = local_b8 * 0x30;
      puVar1 = (undefined4 *)(lVar2 + 0x20 + lVar10);
      *puVar1 = local_108;
      puVar1[1] = uStack_104;
      puVar1[2] = uStack_100;
      puVar1[3] = uStack_fc;
      puVar1 = (undefined4 *)(lVar2 + 0x10 + lVar10);
      *puVar1 = (undefined4)local_118;
      puVar1[1] = local_118._4_4_;
      puVar1[2] = (undefined4)uStack_110;
      puVar1[3] = uStack_110._4_4_;
      puVar1 = (undefined4 *)(lVar2 + lVar10);
      *puVar1 = (undefined4)local_128;
      puVar1[1] = local_128._4_4_;
      puVar1[2] = (undefined4)uStack_120;
      puVar1[3] = uStack_120._4_4_;
      local_b8 = local_b8 + 1;
      pplVar12 = (long **)((long)local_58 + 1);
    } while (pplVar12 != (long **)(((ulong)(param_3 - param_4) >> 3) * 0x6db6db6db6db6db7));
  }
  *local_b0 = local_b8;
  return;
}
