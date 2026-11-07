
void entry(undefined8 param_1,undefined8 param_2,ulong param_3,long param_4,undefined2 param_5,
          undefined8 param_6)

{
  ulong uVar1;
  code *pcVar2;
  long lVar3;
  ulong uVar4;
  undefined8 in_stack_00000028;
  undefined4 local_98;
  undefined4 uStack_94;
  undefined4 uStack_90;
  undefined4 uStack_8c;
  ulong local_88;
  undefined2 local_80;
  undefined8 local_68;
  undefined8 uStack_60;
  long local_58;
  undefined1 local_49;
  undefined8 local_48;
  
  local_48 = 0xfffffffffffffffe;
  if (*(int *)(param_4 + 0x10) == 2) {
    return;
  }
  if (*(char *)(param_4 + 0xd62) == '\0') {
    return;
  }
  func_0x000145ba2650(param_4,param_3,param_6,&local_98,in_stack_00000028);
  lVar3 = CONCAT44(uStack_94,local_98);
  if (lVar3 == -1) {
    return;
  }
  func_0x000145ae1070();
  local_68 = local_88 + 9;
  if (local_68 < 0) {
LAB_145c2bb0a:
    func_0x0001461add5b();
                    /* WARNING: Does not return */
    pcVar2 = (code *)invalidInstructionException();
    (*pcVar2)();
  }
  func_0x000140002200();
  uStack_60 = func_0x0001400021c0();
  if (uStack_60 == 0) goto LAB_145c2bb0a;
  local_58 = 0;
  local_49 = 1;
  func_0x000145aaeb70();
  if ((ulong)(local_68 - local_58) < local_88) {
    local_49 = 1;
    func_0x000146005df0();
  }
  else if (local_88 == 0) goto LAB_145c2bb89;
  func_0x00014600504b();
LAB_145c2bb89:
  local_88 = local_58 + local_88;
  local_98 = (undefined4)local_68;
  uStack_94 = local_68._4_4_;
  uStack_90 = (undefined4)uStack_60;
  uStack_8c = uStack_60._4_4_;
  uVar1 = *(ulong *)(param_4 + 0xa40);
  local_80 = param_5;
  local_58 = local_88;
  for (uVar4 = 0; uVar4 <= uVar1; uVar4 = uVar4 + 1) {
    if (param_3 != uVar4) {
      func_0x000145c2e150();
    }
  }
  if (CONCAT44(uStack_94,local_98) != 0) {
    func_0x0001400021d0();
  }
  if (lVar3 != 0) {
    func_0x0001400021d0();
  }
  return;
}

