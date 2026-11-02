long * entry(undefined8 param_1,undefined8 param_2,long *param_3,long *param_4)

{
  undefined4 *puVar1;
  int iVar2;
  int *piVar3;
  code *pcVar4;
  int *piVar5;
  undefined4 *puVar6;
  long lVar7;
  long lVar8;
  int *piVar9;
  undefined4 local_d0;
  undefined4 uStack_cc;
  undefined4 uStack_c8;
  undefined4 uStack_c4;
  undefined8 local_c0;
  long local_b8;
  undefined8 local_b0;
  undefined4 uStack_a8;
  undefined4 uStack_a4;
  undefined8 local_a0;
  long *local_98;
  undefined8 local_90;
  long *local_88;
  undefined8 local_80;
  int local_74;
  long local_70;
  undefined4 *puStack_68;
  long local_60;
  long local_50;
  undefined8 local_48;

  local_48 = 0xfffffffffffffffe;
  piVar3 = (int *)param_3[1];
  piVar5 = (int *)*param_3;
  lVar8 = param_3[2];
  do {
    local_b0 = lVar8;
    if (piVar5 == piVar3) goto LAB_1459b84dd;
    piVar9 = piVar5 + 1;
    *param_3 = (long)piVar9;
    iVar2 = *piVar5;
    lVar8 = local_b0 + 1;
    param_3[2] = lVar8;
    piVar5 = piVar9;
  } while (iVar2 == 0);
  local_70 = CONCAT44(local_70._4_4_,iVar2);
  local_98 = &local_b0;
  local_90 = 0x145bdf7d0;
  local_88 = &local_70;
  local_80 = 0x145bde8e0;
  func_0x000145bcce30(param_1,param_4,0x147236c48,&local_d0,&local_98);
  if (CONCAT44(uStack_cc,local_d0) == -1) {
LAB_1459b84dd:
    *param_4 = 0;
    param_4[1] = 8;
    param_4[2] = 0;
  }
  else {
    func_0x000140002200();
    puVar6 = (undefined4 *)func_0x0001400021c0();
    if (puVar6 == (undefined4 *)0x0) {
      func_0x000145d992bb();
                    /* WARNING: Does not return */
      pcVar4 = (code *)invalidInstructionException();
      (*pcVar4)();
    }
    *(undefined8 *)(puVar6 + 4) = local_c0;
    *puVar6 = local_d0;
    puVar6[1] = uStack_cc;
    puVar6[2] = uStack_c8;
    puVar6[3] = uStack_c4;
    local_70 = 4;
    local_60 = 1;
    puStack_68 = puVar6;
    while( true ) {
      lVar7 = 0;
      do {
        if (piVar9 == piVar3) goto LAB_1459b84f6;
        local_74 = *piVar9;
        piVar9 = piVar9 + 1;
        lVar7 = lVar7 + -1;
      } while (local_74 == 0);
      lVar8 = lVar8 - lVar7;
      local_b8 = lVar8 + -1;
      local_98 = &local_b8;
      local_90 = 0x145bdf7d0;
      local_88 = (long *)&local_74;
      local_80 = 0x145bde8e0;
      lVar7 = local_60;
      func_0x000145bcce30();
      local_50 = local_b0;
      if (local_b0 == -1) break;
      if (lVar7 == local_70) {
        func_0x000145bfa970();
        puVar6 = puStack_68;
      }
      *(undefined8 *)(puVar6 + lVar7 * 6 + 4) = local_a0;
      puVar1 = puVar6 + lVar7 * 6;
      *puVar1 = (undefined4)local_b0;
      puVar1[1] = local_b0._4_4_;
      puVar1[2] = uStack_a8;
      puVar1[3] = uStack_a4;
      local_60 = lVar7 + 1;
    }
LAB_1459b84f6:
    param_4[2] = local_60;
    *param_4 = local_70;
    param_4[1] = (long)puStack_68;
  }
  return param_4;
}
