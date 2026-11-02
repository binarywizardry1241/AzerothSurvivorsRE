long * entry(undefined8 param_1,undefined8 param_2,long *param_3,long *param_4)

{
  undefined4 *puVar1;
  undefined4 uVar2;
  char *pcVar3;
  code *pcVar4;
  char *pcVar5;
  undefined4 *puVar6;
  char *pcVar7;
  long lVar8;
  long lVar9;
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
  undefined4 local_74;
  long local_70;
  undefined4 *puStack_68;
  long local_60;
  long local_50;
  undefined8 local_48;

  local_48 = 0xfffffffffffffffe;
  pcVar5 = (char *)*param_3;
  pcVar3 = (char *)param_3[1];
  if (pcVar5 != pcVar3) {
    local_b0 = param_3[2];
    do {
      if (*pcVar5 != '\0') {
        pcVar7 = pcVar5 + 8;
        *param_3 = (long)pcVar7;
        uVar2 = *(undefined4 *)(pcVar5 + 4);
        lVar9 = local_b0 + 1;
        param_3[2] = lVar9;
        local_70 = CONCAT44(local_70._4_4_,uVar2);
        local_98 = &local_b0;
        local_90 = 0x145bdf7d0;
        local_88 = &local_70;
        local_80 = 0x145bde8e0;
        func_0x000145bcce30(param_1,param_4,0x147236c48,&local_d0,&local_98);
        if (CONCAT44(uStack_cc,local_d0) != -1) {
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
          lVar8 = 1;
          puStack_68 = puVar6;
          goto LAB_1459b8110;
        }
        break;
      }
      pcVar5 = pcVar5 + 8;
      local_b0 = local_b0 + 1;
      param_3[2] = local_b0;
    } while (pcVar5 != pcVar3);
  }
  *param_4 = 0;
  param_4[1] = 8;
  param_4[2] = 0;
  return param_4;
LAB_1459b8110:
  if (pcVar7 == pcVar3) {
LAB_1459b8202:
    param_4[2] = local_60;
    *param_4 = local_70;
    param_4[1] = (long)puStack_68;
    return param_4;
  }
  if (*pcVar7 == '\0') {
    pcVar7 = pcVar7 + 8;
    lVar9 = lVar9 + 1;
  }
  else {
    local_74 = *(undefined4 *)(pcVar7 + 4);
    local_98 = &local_b8;
    local_90 = 0x145bdf7d0;
    local_88 = (long *)&local_74;
    local_80 = 0x145bde8e0;
    local_b8 = lVar9;
    func_0x000145bcce30();
    local_50 = local_b0;
    if (local_b0 == -1) goto LAB_1459b8202;
    if (lVar8 == local_70) {
      func_0x000145bfa970();
      puVar6 = puStack_68;
    }
    lVar9 = lVar9 + 1;
    pcVar7 = pcVar7 + 8;
    *(undefined8 *)(puVar6 + lVar8 * 6 + 4) = local_a0;
    puVar1 = puVar6 + lVar8 * 6;
    *puVar1 = (undefined4)local_b0;
    puVar1[1] = local_b0._4_4_;
    puVar1[2] = uStack_a8;
    puVar1[3] = uStack_a4;
    lVar8 = lVar8 + 1;
    local_60 = lVar8;
  }
  goto LAB_1459b8110;
}
