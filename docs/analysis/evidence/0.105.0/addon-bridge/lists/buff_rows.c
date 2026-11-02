long * FUN_14599a240(undefined8 param_1,undefined8 param_2,long *param_3,long *param_4)

{
  long lVar1;
  float *pfVar2;
  float *pfVar3;
  code *pcVar4;
  long *plVar5;
  long lVar6;
  long lVar7;
  long lVar8;
  long local_c8;
  long lStack_c0;
  long local_b8;
  float local_b0;
  undefined4 uStack_ac;
  long lStack_a8;
  long local_a0;
  long local_98 [2];
  float *local_88;
  undefined8 local_80;
  long local_78;
  long *local_70;
  long local_68;
  float local_5c;
  long local_58;
  long local_50;
  undefined8 local_48;

  local_48 = 0xfffffffffffffffe;
  local_98[0] = *param_3;
  lVar1 = param_3[1];
  if (local_98[0] != lVar1) {
    pfVar2 = (float *)param_3[2];
    do {
      local_b0 = *(float *)(local_98[0] + 0x10);
      if (*pfVar2 < local_b0) {
        lVar8 = local_98[0] + 0x18;
        *param_3 = lVar8;
        pfVar3 = (float *)param_3[3];
        local_98[0] = local_98[0] + 0xc;
        local_b0 = local_b0 - *pfVar3;
        local_98[1] = 0x145badf80;
        local_88 = &local_b0;
        local_80 = 0x145bad280;
        func_0x000145b9c4d0(param_1,param_4,0x1471b4ff5,&local_c8,local_98);
        if (local_c8 != -1) {
          local_58 = lStack_c0;
          func_0x000140002200();
          plVar5 = (long *)func_0x0001400021c0();
          if (plVar5 == (long *)0x0) {
            func_0x000145d6944b();
                    /* WARNING: Does not return */
            pcVar4 = (code *)invalidInstructionException();
            (*pcVar4)();
          }
          plVar5[2] = local_b8;
          *plVar5 = local_c8;
          plVar5[1] = lStack_c0;
          local_78 = 4;
          local_68 = 1;
          local_70 = plVar5;
          lVar6 = local_68;
          goto joined_r0x00014599a344;
        }
        break;
      }
      local_98[0] = local_98[0] + 0x18;
    } while (local_98[0] != lVar1);
  }
  *param_4 = 0;
  param_4[1] = 8;
  param_4[2] = 0;
  return param_4;
joined_r0x00014599a344:
  local_68 = lVar6;
  if (lVar8 == lVar1) {
LAB_14599a42c:
    param_4[2] = local_68;
    *param_4 = local_78;
    param_4[1] = (long)local_70;
    return param_4;
  }
  lVar8 = lVar8 + 0xc;
  while (*(float *)(lVar8 + 4) <= *pfVar2) {
    lVar7 = lVar8 + 0xc;
    lVar8 = lVar8 + 0x18;
    if (lVar7 == lVar1) goto LAB_14599a42c;
  }
  local_5c = *(float *)(lVar8 + 4) - *pfVar3;
  local_98[1] = 0x145badf80;
  local_88 = &local_5c;
  local_80 = 0x145bad280;
  local_98[0] = lVar8;
  func_0x000145b9c4d0();
  local_58 = CONCAT44(uStack_ac,local_b0);
  if (local_58 == -1) goto LAB_14599a42c;
  if (lVar6 == local_78) {
    local_50 = lStack_a8;
    func_0x000145bcb2d0();
    plVar5 = local_70;
  }
  lVar8 = lVar8 + 0xc;
  plVar5[lVar6 * 3 + 2] = local_a0;
  plVar5[lVar6 * 3] = CONCAT44(uStack_ac,local_b0);
  (plVar5 + lVar6 * 3)[1] = lStack_a8;
  lVar6 = lVar6 + 1;
  goto joined_r0x00014599a344;
}
