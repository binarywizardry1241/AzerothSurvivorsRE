
void entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 param_4,long *param_5)

{
  uint *puVar1;
  undefined4 *puVar2;
  long lVar3;
  code *pcVar4;
  uint uVar5;
  int iVar6;
  long lVar7;
  ulong uVar8;
  long lVar9;
  uint uVar10;
  long lVar11;
  long extraout_RDX;
  uint *puVar12;
  long *plVar13;
  long lVar14;
  long local_118 [3];
  long local_100;
  undefined4 *local_f8;
  undefined8 local_f0;
  long *local_e8;
  undefined8 local_e0;
  undefined8 local_d8;
  undefined8 local_d0;
  long *local_c8;
  undefined8 local_c0;
  undefined4 local_b8;
  undefined4 uStack_b4;
  undefined4 uStack_b0;
  undefined4 uStack_ac;
  long local_a8;
  long local_a0;
  long local_98;
  long local_90;
  undefined4 local_84;
  long local_80;
  undefined8 local_78;
  undefined8 uStack_70;
  long local_68;
  long local_58;
  char local_49;
  undefined8 local_48;
  
  local_48 = 0xfffffffffffffffe;
  uVar10 = *(int *)((long)param_3 + 0x1c) - (int)param_3[3];
  uVar5 = 0xc233b000;
  if (uVar10 < 0xc233b000) {
    uVar5 = uVar10;
  }
  if (uVar5 <= (uint)(*(int *)((long)param_3 + 0x1c) - *(int *)param_3[2])) {
    return;
  }
  lVar14 = *param_3;
  lVar7 = *param_5;
  lVar3 = param_5[1];
  local_84 = *(undefined4 *)((long)param_5 + 0x14);
  if (*(long *)(lVar14 + 0x50) == 0) {
    func_0x000145be8220(param_1,lVar14,0x11,0x1462782b8);
    if (extraout_RDX < 0) {
LAB_1402df302:
      func_0x00014620896b();
                    /* WARNING: Does not return */
      pcVar4 = (code *)invalidInstructionException();
      (*pcVar4)();
    }
    if (extraout_RDX == 0) {
      uStack_70 = 1;
      local_78 = extraout_RDX;
      local_68 = extraout_RDX;
    }
    else {
      lVar14 = extraout_RDX;
      func_0x000140002200();
      lVar9 = func_0x0001400021c0();
      if (lVar9 == 0) goto LAB_1402df302;
      func_0x00014606171b();
      local_78 = lVar14;
      uStack_70 = lVar9;
      local_68 = lVar14;
    }
  }
  else {
    local_a0 = *(long *)(lVar14 + 0x98) + (ulong)(*(long *)(lVar14 + 0x98) == 0);
    if (*(long *)(lVar14 + 0x68) == 0) {
      func_0x000145be8220(param_1,lVar14,0xc,0x1462782c9);
      local_f8 = (undefined4 *)0x1462782f8;
      local_f0 = 1;
      local_e8 = &local_a0;
      local_e0 = 0x1462782d8;
    }
    else {
      plVar13 = (long *)(lVar14 + 0x58);
      func_0x000145be8220(plVar13,lVar14,0x13,0x1462782f9);
      local_f8 = (undefined4 *)0x146278330;
      local_f0 = 4;
      local_e0 = 0x146278310;
      local_d8 = 0x1462782f8;
      local_d0 = 1;
      local_c8 = &local_a0;
      local_c0 = 0x1462782d8;
      local_e8 = plVar13;
    }
    func_0x000145be86b0();
    if (*(long *)(lVar14 + 0x1a0) == 0) {
      local_68 = local_a8;
      local_78 = CONCAT44(uStack_b4,local_b8);
      uStack_70 = CONCAT44(uStack_ac,uStack_b0);
    }
    else {
      local_100 = *(long *)(lVar14 + 0x1a0);
      func_0x000145be8220();
      plVar13 = local_118;
      func_0x000145be86b0();
      local_f8 = &local_b8;
      local_f0 = 0x1400020e0;
      local_e0 = 0x1400020e0;
      local_e8 = plVar13;
      func_0x000146034470();
      if (local_118[0] != 0) {
        func_0x0001400021d0();
      }
      if (CONCAT44(uStack_b4,local_b8) != 0) {
        func_0x0001400021d0();
      }
    }
  }
  puVar12 = *(uint **)(lVar7 + 0xf8);
  puVar1 = puVar12 + *(long *)(lVar7 + 0x100);
  local_49 = *(char *)(lVar7 + 0x108);
  lVar14 = 0;
  local_98 = 8;
  local_58 = 0;
  uVar8 = 0;
  local_90 = lVar7;
  do {
    if (local_49 == '\0') {
      if ((int)uVar8 == (int)lVar14) {
        do {
          if (puVar12 == puVar1) goto LAB_1402df665;
          uVar5 = *puVar12;
          puVar12 = puVar12 + 1;
          lVar14 = *(long *)(*(long *)(lVar3 + 0x108) + 0x58 + (ulong)uVar5 * 0xa0);
        } while (lVar14 == 0);
        lVar9 = *(long *)(lVar3 + 0x108) + (ulong)uVar5 * 0xa0;
        uVar8 = (ulong)*(uint *)(lVar9 + 0x94);
        lVar7 = *(long *)(*(long *)(lVar3 + 0x1a8) + 0x18 + uVar8 * 0x48);
        lVar11 = ~*(ulong *)(*(long *)(*(long *)(lVar3 + 0x1a8) + 0x38 + uVar8 * 0x48) +
                            *(long *)(local_90 + 0x110) * 8) * 0x30;
        local_58 = *(long *)(lVar7 + 0x10 + lVar11);
        local_80 = *(long *)(lVar7 + 0x28 + lVar11);
        local_98 = *(long *)(lVar9 + 0x50);
        uVar8 = 0;
      }
      iVar6 = (int)uVar8;
      uVar8 = (ulong)~*(uint *)(local_98 + 8 + (uVar8 & 0xffffffff) * 0x10);
    }
    else {
      if ((int)uVar8 == (int)lVar14) {
        do {
          if (puVar12 == puVar1) {
LAB_1402df665:
            if (local_78 == 0) {
              return;
            }
            func_0x0001400021d0();
            return;
          }
          uVar5 = *puVar12;
          puVar12 = puVar12 + 1;
          lVar14 = *(long *)(*(long *)(lVar3 + 0x1a8) + 0x10 + (ulong)uVar5 * 0x48);
        } while (lVar14 == 0);
        lVar7 = *(long *)(lVar3 + 0x1a8) + (ulong)uVar5 * 0x48;
        lVar9 = *(long *)(lVar7 + 0x18);
        lVar7 = ~*(ulong *)(*(long *)(lVar7 + 0x38) + *(long *)(local_90 + 0x110) * 8) * 0x30;
        local_58 = *(long *)(lVar9 + 0x10 + lVar7);
        local_80 = *(long *)(lVar9 + 0x28 + lVar7);
        uVar8 = 0;
      }
      iVar6 = (int)uVar8;
      uVar8 = uVar8 & 0xffffffff;
    }
    lVar7 = local_58 + uVar8 * 0x18;
    puVar2 = (undefined4 *)(local_80 + uVar8 * 4);
    uVar8 = (ulong)(iVar6 + 1);
    if ((*(long *)(lVar7 + 0x10) != local_68) ||
       (iVar6 = func_0x000146061721(lVar7,uVar8,uStack_70,*(undefined8 *)(lVar7 + 8)), iVar6 != 0))
    {
      *puVar2 = local_84;
      func_0x0001460348c0();
    }
  } while( true );
}

