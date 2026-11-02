long * entry(undefined8 param_1,undefined8 param_2,long param_3,long *param_4)

{
  code *pcVar1;
  int iVar2;
  undefined4 *puVar3;
  undefined4 extraout_EDX;
  undefined4 extraout_EDX_00;
  undefined4 uVar4;
  long lVar5;
  undefined1 auVar6 [12];
  int local_114;
  int local_cc;
  int local_84;
  undefined8 ***local_70;
  long *local_68;
  long local_60;
  undefined4 *puStack_58;
  long local_50;
  undefined8 local_48;

  local_48 = 0xfffffffffffffffe;
  local_68 = param_4;
  if (*(int *)(param_3 + 0x7c) != -1) {
    auVar6 = func_0x0001459b74e0();
    uVar4 = auVar6._8_4_;
    if ((auVar6._0_8_ & 1) != 0) goto LAB_1459c36da;
  }
  *(undefined4 *)(param_3 + 0x7c) = 0xffffffff;
  if (*(int *)(param_3 + 0x34) != -1) {
    auVar6 = func_0x0001459cca70();
    uVar4 = auVar6._8_4_;
    if ((auVar6._0_8_ & 1) != 0) goto LAB_1459c36da;
  }
  *(undefined4 *)(param_3 + 0x7c) = 0xffffffff;
  if ((*(int *)(param_3 + 0xc4) == -1) ||
     (iVar2 = func_0x0001459b74e0(), uVar4 = extraout_EDX, iVar2 != 1)) {
    *local_68 = 0;
    local_68[1] = 4;
    local_68[2] = 0;
    return local_68;
  }
LAB_1459c36da:
  func_0x000140002200();
  puVar3 = (undefined4 *)func_0x0001400021c0();
  if (puVar3 == (undefined4 *)0x0) {
    func_0x000145d992bb();
                    /* WARNING: Does not return */
    pcVar1 = (code *)invalidInstructionException();
    (*pcVar1)();
  }
  *puVar3 = uVar4;
  local_60 = 4;
  local_50 = 1;
  puStack_58 = puVar3;
  func_0x000145bfa0e7();
  lVar5 = 1;
  do {
    local_70 = &local_70;
    if (local_cc == -1) {
LAB_1459c3778:
      local_cc = -1;
      if (local_114 != -1) {
        auVar6 = func_0x0001459cca70();
        uVar4 = auVar6._8_4_;
        if ((auVar6._0_8_ & 1) != 0) goto LAB_1459c37b8;
      }
      local_cc = -1;
      if ((local_84 == -1) || (iVar2 = func_0x0001459b74e0(), uVar4 = extraout_EDX_00, iVar2 != 1))
      {
        local_68[2] = local_50;
        *local_68 = local_60;
        local_68[1] = (long)puStack_58;
        return local_68;
      }
    }
    else {
      auVar6 = func_0x0001459b74e0();
      uVar4 = auVar6._8_4_;
      if ((auVar6._0_8_ & 1) == 0) goto LAB_1459c3778;
    }
LAB_1459c37b8:
    if (lVar5 == local_60) {
      func_0x000145bfa970();
      puVar3 = puStack_58;
    }
    puVar3[lVar5] = uVar4;
    lVar5 = lVar5 + 1;
    local_50 = lVar5;
  } while( true );
}
