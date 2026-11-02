
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

long * entry(undefined8 param_1,undefined8 param_2,long *param_3,long *param_4,ulong param_5)

{
  char *pcVar1;
  long lVar2;
  code *pcVar3;
  long lVar4;
  long lVar5;
  long lVar6;
  long lVar7;
  long lVar8;
  undefined8 uVar9;
  long lVar10;
  undefined4 in_XMM6_Da;
  float fVar11;
  long local_a8;
  long lStack_a0;
  long local_98;
  long local_90 [3];
  float *local_78;
  undefined8 local_70;
  long *local_68;
  undefined8 local_60;
  float local_54 [9];
  
  local_54[1] = -NAN;
  local_54[2] = -NAN;
  if (param_5 == 0) {
    param_4[10] = param_3[10];
    lVar2 = param_3[9];
    param_4[8] = param_3[8];
    param_4[9] = lVar2;
    lVar2 = *param_3;
    lVar10 = param_3[1];
    lVar4 = param_3[2];
    lVar5 = param_3[3];
    lVar6 = param_3[4];
    lVar7 = param_3[5];
    lVar8 = param_3[7];
    param_4[6] = param_3[6];
    param_4[7] = lVar8;
    param_4[4] = lVar6;
    param_4[5] = lVar7;
    param_4[2] = lVar4;
    param_4[3] = lVar5;
    *param_4 = lVar2;
    param_4[1] = lVar10;
    param_4[0xb] = -1;
    return param_4;
  }
  lVar2 = *param_3;
  local_54[3] = (float)in_XMM6_Da;
  if (*(char *)(lVar2 + 0x75) == '\t') {
    if ((0xc < *(uint *)(lVar2 + 0x68)) || ((0x10c0U >> (*(uint *)(lVar2 + 0x68) & 0x1f) & 1) == 0))
    {
LAB_14540f2bc:
      if (5 < param_5) {
        uVar9 = 0x14671cf80;
        goto LAB_14540f408;
      }
      fVar11 = *(float *)(param_5 * 4 + 0x14671cf38);
      *(float *)((long)param_3 + 0x14) =
           (_DAT_1458eb480 - fVar11) * *(float *)((long)param_3 + 0x14);
      func_0x000145452400(param_3,param_4,0xe,0x14671cf98);
      local_54[0] = fVar11 * _DAT_1458eb52c;
      local_78 = local_54;
      local_70 = 0x14571d2e0;
      func_0x00014570bf80();
      local_78 = (float *)0x14671cf20;
      local_70 = 1;
      local_60 = 0x14671cf00;
      local_68 = local_90;
      func_0x000145452790();
      if (local_90[0] != 0) {
        func_0x0001400021d0();
      }
      goto LAB_14540f39d;
    }
  }
  else if (*(char *)(lVar2 + 0x75) == '\v') {
    lVar10 = 0;
    do {
      if (*(long *)(lVar2 + 0x38) == lVar10) goto LAB_14540f2bc;
      pcVar1 = (char *)(*(long *)(lVar2 + 0x30) + lVar10);
      lVar10 = lVar10 + 1;
    } while (*pcVar1 != '\0');
  }
  else if (*(float *)(lVar2 + 0x44) <= 0.0) goto LAB_14540f2bc;
  if (5 < param_5) {
    uVar9 = 0x14671cfc0;
LAB_14540f408:
    func_0x0001458e75b3(param_3,param_4,5,param_5 - 1,uVar9);
                    /* WARNING: Does not return */
    pcVar3 = (code *)invalidInstructionException();
    (*pcVar3)();
  }
  *(float *)(param_3 + 2) =
       (_DAT_1458eb480 + *(float *)(param_5 * 4 + 0x14671cfa4)) * *(float *)(param_3 + 2);
  func_0x00014540ee70();
LAB_14540f39d:
  param_4[0xd] = local_98;
  param_4[0xb] = local_a8;
  param_4[0xc] = lStack_a0;
  lVar2 = param_3[1];
  lVar10 = param_3[2];
  lVar4 = param_3[3];
  lVar5 = param_3[4];
  lVar6 = param_3[5];
  lVar7 = param_3[6];
  lVar8 = param_3[7];
  *param_4 = *param_3;
  param_4[1] = lVar2;
  param_4[2] = lVar10;
  param_4[3] = lVar4;
  param_4[4] = lVar5;
  param_4[5] = lVar6;
  param_4[6] = lVar7;
  param_4[7] = lVar8;
  lVar2 = param_3[9];
  param_4[8] = param_3[8];
  param_4[9] = lVar2;
  param_4[10] = param_3[10];
  return param_4;
}

