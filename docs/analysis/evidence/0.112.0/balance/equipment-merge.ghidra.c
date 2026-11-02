void entry(void)

{
  ulong uVar1;
  undefined8 *in_RCX;
  undefined8 *puVar2;
  int iVar3;
  long lVar4;
  undefined8 uVar5;
  long lVar6;
  undefined8 *unaff_R12;
  undefined8 *puVar7;
  long lVar8;
  long local_140;
  long local_128;
  undefined8 *local_120;
  long local_118;
  undefined8 *local_80;
  long local_60;
  long local_58;
  undefined8 *local_50;

  local_60 = 0;
  puVar2 = (undefined8 *)0x0;
  lVar8 = 0;
LAB_145997ac0:
  puVar7 = puVar2;
  if (puVar2 == (undefined8 *)0x0) goto LAB_145997b40;
  do {
    if (unaff_R12 == local_80) {
      uVar5 = 0xffffffff;
      local_50 = unaff_R12;
    }
    else {
      local_50 = unaff_R12 + 1;
      uVar5 = *unaff_R12;
      if ((int)uVar5 != -1) break;
    }
    if (local_58 != 0) {
      func_0x0001400021d0();
    }
    puVar7 = (undefined8 *)0x0;
    puVar2 = (undefined8 *)0x0;
    if ((int)uVar5 != -1) break;
LAB_145997b40:
    do {
      puVar2 = puVar7;
      if (lVar8 == 0x4c) goto LAB_145997e1c;
      func_0x0001459963c0();
      lVar8 = lVar8 + 4;
    } while (local_140 == -1);
    if (local_140 != 0) {
      func_0x0001400021d0();
    }
    if (local_128 == -1) goto LAB_145997e1c;
    lVar4 = local_128;
    if ((puVar7 != (undefined8 *)0x0) && (local_58 != 0)) {
      func_0x0001400021d0();
    }
    local_80 = local_120 + local_118;
    unaff_R12 = local_120;
    puVar2 = local_120;
    local_58 = lVar4;
  } while( true );
  iVar3 = (int)uVar5;
  if (iVar3 == -1) {
LAB_145997e1c:
    if ((puVar2 != (undefined8 *)0x0) && (local_58 != 0)) {
      func_0x0001400021d0();
    }
    in_RCX[2] = local_60;
    *in_RCX = 0;
    in_RCX[1] = 4;
    return;
  }
  lVar4 = 0;
  do {
    lVar6 = lVar4;
    unaff_R12 = local_50;
    if (local_60 * 8 - lVar6 == 0) {
      if (local_60 == 0) {
        func_0x000145c16470();
      }
      *(undefined8 *)(local_60 * 8 + 4) = uVar5;
      local_60 = local_60 + 1;
      goto LAB_145997ac0;
    }
    lVar4 = lVar6 + 8;
  } while (*(int *)(lVar6 + 4) != iVar3);
  uVar1 = *(ulong *)(lVar6 + 4);
  if (iVar3 == (int)uVar1) {
                    /* WARNING: Could not recover jumptable at 0x000145997cce. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*(code *)((long)*(int *)((uVar1 & 0xffffffff) * 4 + 0x147220f44) + 0x147220f44))();
    return;
  }
  *(ulong *)(lVar6 + 4) = uVar1;
  goto LAB_145997ac0;
}
