
void entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 *param_4)

{
  ulong uVar1;
  code *pcVar2;
  ulong uVar3;
  ulong uVar4;
  ulong uVar5;
  long lVar6;
  long lVar7;
  undefined8 uVar8;
  undefined4 uVar9;
  undefined8 uVar10;
  undefined8 local_80;
  undefined8 uStack_78;
  undefined8 local_70;
  undefined8 local_68;
  undefined8 uStack_60;
  undefined8 local_58;

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
    uVar8 = 0;
    uVar3 = uVar1;
  }
  else {
    param_3[2] = uVar3;
    if (uVar5 - uVar4 == 8) {
      uVar8 = *(undefined8 *)(*param_3 + uVar4);
    }
    else {
      uVar8 = 0;
    }
  }
  uVar4 = 0xffffffffffffffff;
  if (uVar3 < 0xfffffffffffffffc) {
    uVar4 = uVar3 + 4;
  }
  if (uVar1 < uVar4) {
    *(undefined1 *)(param_3 + 3) = 0;
    param_3[2] = uVar1;
    uVar9 = 0;
  }
  else {
    uVar9 = 0;
    param_3[2] = uVar3 + 4;
    if (uVar4 - uVar3 == 4) {
      uVar9 = *(undefined4 *)(*param_3 + uVar3);
    }
  }
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
    uVar10 = 0;
    uVar3 = uVar1;
  }
  else {
    param_3[2] = uVar3;
    if (uVar5 - uVar4 == 8) {
      uVar10 = *(undefined8 *)(*param_3 + uVar4);
    }
    else {
      uVar10 = 0;
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
LAB_145b7a186:
      func_0x000145eb6fcb();
                    /* WARNING: Does not return */
      pcVar2 = (code *)invalidInstructionException();
      (*pcVar2)();
    }
    if (lVar6 != 0) {
      func_0x000140002200();
      lVar7 = func_0x0001400021c0();
      if (lVar7 == 0) goto LAB_145b7a186;
      func_0x000145d145fb();
      goto LAB_145b7a136;
    }
  }
  lVar7 = 1;
  lVar6 = 0;
LAB_145b7a136:
  param_4[2] = local_58;
  *param_4 = local_68;
  param_4[1] = uStack_60;
  param_4[9] = uVar8;
  *(undefined4 *)(param_4 + 0xb) = uVar9;
  param_4[3] = local_80;
  param_4[4] = uStack_78;
  param_4[5] = local_70;
  param_4[10] = uVar10;
  param_4[6] = lVar6;
  param_4[7] = lVar7;
  param_4[8] = lVar6;
  return;
}
