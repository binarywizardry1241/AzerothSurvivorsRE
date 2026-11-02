/* WARNING: Removing unreachable block (ram,0x0001458ab5f7) */

undefined4 *
entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,undefined4 *param_4,
     undefined8 param_5,undefined8 param_6)

{
  code *pcVar1;
  undefined4 *puVar2;
  long lVar3;
  long lVar4;
  undefined4 in_stack_00000028;
  undefined4 in_stack_00000030;
  undefined4 local_d0 [2];
  undefined4 uStack_c8;
  undefined8 local_c0;
  undefined8 local_b8;
  long local_b0 [2];
  ulong local_a0;
  undefined4 local_98;
  undefined4 uStack_94;
  undefined4 uStack_90;
  undefined4 uStack_8c;
  long local_88;
  undefined8 local_80;
  long local_78;
  undefined1 *puStack_70;
  long local_68;
  undefined2 local_60;
  undefined4 local_5e;
  undefined2 local_5a;
  undefined8 local_58;
  undefined8 uStack_50;
  undefined4 *local_48;
  undefined8 local_40;
  undefined8 local_38;

  local_38 = 0xfffffffffffffffe;
  local_d0[0] = in_stack_00000028;
  uStack_c8 = in_stack_00000030;
  local_58 = &local_c0;
  uStack_50 = (undefined1 *)0x1400020c0;
  local_48 = local_d0;
  local_40 = 0x1400020c0;
  local_c0 = param_5;
  local_b8 = param_6;
  func_0x000145b9c4d0(param_3,param_4,0x146bb7910,local_b0,&local_58);
  func_0x000140002200();
  puStack_70 = (undefined1 *)func_0x0001400021c0();
  if (puStack_70 == (undefined1 *)0x0) {
    func_0x000145d6944b();
                    /* WARNING: Does not return */
    pcVar1 = (code *)invalidInstructionException();
    (*pcVar1)();
  }
  *puStack_70 = 6;
  *(undefined4 *)(puStack_70 + 1) = 0xffffffff;
  *(undefined8 *)(puStack_70 + 5) = param_3;
  local_60 = 0x96;
  local_78 = 0x20;
  *(int *)(puStack_70 + 0xd) = (int)local_a0 + 1;
  puVar2 = (undefined4 *)0x11;
  local_40 = CONCAT26(local_5a,CONCAT42(local_5e,0x96));
  local_58 = (undefined8 *)0x20;
  local_68 = (long)puVar2;
  uStack_50 = puStack_70;
  local_48 = puVar2;
  if (local_a0 < 0x10) {
    lVar4 = local_78;
    if (local_a0 == 0) goto LAB_1458ab555;
  }
  else {
    func_0x000145bcb2d0();
  }
  puVar2 = local_48;
  lVar4 = (long)local_58;
  func_0x000145bc977b();
LAB_1458ab555:
  lVar3 = (long)puVar2 + local_a0;
  if (lVar3 == lVar4) {
    local_48 = (undefined4 *)lVar3;
    func_0x000145d69340();
  }
  uStack_50[lVar3] = 0;
  lVar4 = lVar3 + 1;
  local_98 = (undefined4)local_58;
  uStack_94 = local_58._4_4_;
  uStack_90 = (undefined4)uStack_50;
  uStack_8c = uStack_50._4_4_;
  local_80 = local_40;
  local_48 = (undefined4 *)lVar4;
  if ((undefined8 *)lVar4 == local_58) {
    local_88 = lVar4;
    func_0x000145d69340();
  }
  *(undefined1 *)(CONCAT44(uStack_8c,uStack_90) + lVar4) = 0;
  local_88 = lVar3 + 2;
  *param_4 = local_98;
  param_4[1] = uStack_94;
  param_4[2] = uStack_90;
  param_4[3] = uStack_8c;
  *(long *)(param_4 + 4) = local_88;
  *(undefined8 *)(param_4 + 6) = local_80;
  if (local_b0[0] != 0) {
    func_0x0001400021d0();
  }
  return param_4;
}
