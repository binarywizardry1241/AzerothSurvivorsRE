
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(void)

{
  long lVar1;
  undefined8 in_R8;
  long in_R9;
  undefined4 in_XMM6_Da;
  undefined4 uVar2;
  undefined4 in_XMM7_Da;
  undefined4 uVar3;
  undefined4 uVar4;
  undefined4 local_118;
  undefined4 uStack_114;
  undefined4 uStack_110;
  undefined4 uStack_10c;
  undefined4 local_108;
  undefined1 local_f8 [24];
  undefined4 local_e0;
  undefined4 local_dc;
  undefined4 local_d8;
  undefined4 local_d4;
  undefined8 local_d0;
  undefined4 local_c8;
  undefined4 local_c4;
  undefined4 local_c0;
  undefined8 local_bc;
  undefined4 local_b4;
  undefined4 local_b0;
  undefined4 local_ac;
  undefined8 local_a8;
  undefined4 local_a0;
  undefined4 local_9c;
  undefined4 local_98;
  undefined8 local_94;
  undefined4 local_8c;
  undefined4 uStack_88;
  undefined4 uStack_84;
  undefined4 uStack_80;
  undefined4 local_7c;
  undefined2 local_78;
  undefined1 local_76;
  undefined8 local_70;
  undefined4 local_68;
  undefined4 local_58;

  local_70 = 0xfffffffffffffffe;
  lVar1 = *(long *)(in_R9 + 0x48);
  uVar2 = _DAT_14593f930;
  uVar3 = _DAT_14593f930;
  uVar4 = _DAT_14593f930;
  if (lVar1 - 1U < 5) {
    uVar2 = *(undefined4 *)(lVar1 * 4 + 0x14594e3f4);
    uVar3 = *(undefined4 *)(lVar1 * 4 + 0x14594e408);
    uVar4 = *(undefined4 *)(lVar1 * 4 + 0x14594e41c);
  }
  local_118 = _DAT_14594cb40;
  uStack_114 = uRam000000014594cb44;
  uStack_110 = uRam000000014594cb48;
  uStack_10c = uRam000000014594cb4c;
  local_108 = 0x3f59999a;
  local_68 = in_XMM6_Da;
  local_58 = in_XMM7_Da;
  func_0x000144c8c290(in_R8,in_R9,&local_118,local_f8);
  func_0x00014265f6a0();
  local_e0 = 0;
  local_d0 = 0x3f4ccccd;
  local_bc = 0x3f4ccccd;
  local_a8 = 0x3f4ccccd;
  local_94 = 0x3f4ccccd;
  local_8c = _DAT_14593fcb0;
  uStack_88 = uRam000000014593fcb4;
  uStack_84 = uRam000000014593fcb8;
  uStack_80 = uRam000000014593fcbc;
  local_7c = 0x17a2;
  local_78 = 1;
  local_76 = 0;
  local_dc = uVar2;
  local_d8 = uVar3;
  local_d4 = uVar4;
  local_c8 = uVar2;
  local_c4 = uVar3;
  local_c0 = uVar4;
  local_b4 = uVar2;
  local_b0 = uVar3;
  local_ac = uVar4;
  local_a0 = uVar2;
  local_9c = uVar3;
  local_98 = uVar4;
  func_0x0001457731ed();
  func_0x0001457731ed();
  func_0x0001457731ed();
  func_0x0001400dff80();
  func_0x000140113b60();
  return;
}
