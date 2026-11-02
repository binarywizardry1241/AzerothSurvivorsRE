
undefined8 * entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 *param_4)

{
  ulong uVar1;
  code *pcVar2;
  ulong uVar3;
  ulong uVar4;
  ulong uVar5;
  long lVar6;
  long lVar7;
  undefined8 uVar8;
  undefined8 uVar9;
  undefined8 local_90;
  undefined8 uStack_88;
  undefined8 local_80;
  undefined8 local_78;
  undefined8 uStack_70;
  undefined8 local_68;
  undefined8 local_60;
  undefined8 uStack_58;
  undefined8 local_50;

  func_0x000145b7c600();
  uVar1 = param_3[2];
  uVar4 = 0xffffffffffffffff;
  if (uVar1 < 0xfffffffffffffff8) {
    uVar4 = uVar1 + 8;
  }
  if ((ulong)param_3[1] < uVar4) {
    *(undefined1 *)(param_3 + 3) = 0;
    param_3[2] = param_3[1];
LAB_145b7bffb:
    uVar8 = 0;
  }
  else {
    param_3[2] = uVar1 + 8;
    if (uVar4 - uVar1 != 8) goto LAB_145b7bffb;
    uVar8 = *(undefined8 *)(*param_3 + uVar1);
  }
  func_0x000145b7c600();
  func_0x000145b7c600();
  uVar1 = param_3[1];
  uVar4 = param_3[2];
  uVar3 = uVar4 + 8;
  uVar5 = 0xffffffffffffffff;
  if (uVar4 < 0xfffffffffffffff8) {
    uVar5 = uVar3;
  }
  if (uVar1 < uVar5) {
    *(undefined1 *)(param_3 + 3) = 0;
    param_3[2] = uVar1;
    uVar9 = 0;
    uVar3 = uVar1;
  }
  else {
    param_3[2] = uVar3;
    if (uVar5 - uVar4 == 8) {
      uVar9 = *(undefined8 *)(*param_3 + uVar4);
    }
    else {
      uVar9 = 0;
    }
  }
  uVar4 = uVar3 + 4;
  uVar5 = 0xffffffffffffffff;
  if (uVar3 < 0xfffffffffffffffc) {
    uVar5 = uVar4;
  }
  if (uVar1 < uVar5) {
    *(undefined1 *)(param_3 + 3) = 0;
    uVar3 = 0;
    uVar4 = uVar1;
  }
  else if (uVar5 - uVar3 == 4) {
    uVar3 = (ulong)*(uint *)(*param_3 + uVar3);
  }
  else {
    uVar3 = 0;
  }
  uVar5 = 0xffffffffffffffff;
  if (!CARRY8(uVar3,uVar4)) {
    uVar5 = uVar3 + uVar4;
  }
  if (uVar1 < uVar5) {
    *(undefined1 *)(param_3 + 3) = 0;
    param_3[2] = uVar1;
  }
  else {
    lVar6 = uVar5 - uVar4;
    param_3[2] = uVar3 + uVar4;
    if (lVar6 < 0) {
LAB_145b7c159:
      func_0x000145eb6fcb();
                    /* WARNING: Does not return */
      pcVar2 = (code *)invalidInstructionException();
      (*pcVar2)();
    }
    if (lVar6 != 0) {
      func_0x000140002200();
      lVar7 = func_0x0001400021c0();
      if (lVar7 == 0) goto LAB_145b7c159;
      func_0x000145d145fb();
      goto LAB_145b7c0ff;
    }
  }
  lVar7 = 1;
  lVar6 = 0;
LAB_145b7c0ff:
  param_4[2] = local_50;
  *param_4 = local_60;
  param_4[1] = uStack_58;
  param_4[0xc] = uVar8;
  param_4[3] = local_78;
  param_4[4] = uStack_70;
  param_4[5] = local_68;
  param_4[6] = local_90;
  param_4[7] = uStack_88;
  param_4[8] = local_80;
  param_4[0xd] = uVar9;
  param_4[9] = lVar6;
  param_4[10] = lVar7;
  param_4[0xb] = lVar6;
  return param_4;
}
