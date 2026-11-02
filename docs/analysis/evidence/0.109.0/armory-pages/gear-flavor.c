undefined8 entry(undefined8 param_1,undefined8 param_2,long param_3,int param_4,ulong param_5)

{
  undefined1 auVar1 [16];
  uint uVar2;
  ulong uVar3;
  long lVar4;
  char cVar5;
  long *plVar6;
  undefined8 uVar7;
  long *plVar8;
  undefined1 auVar9 [16];
  long *local_f0;
  undefined8 local_e8;
  long *local_d8 [16];
  long local_58;
  long *local_50;
  undefined8 local_48;

  local_48 = 0xfffffffffffffffe;
  local_58 = param_3;
  if (param_5 < 3) {
    local_d8[0] = (long *)0x1472304bc;
    local_d8[1] = (long *)0x34;
    local_d8[2] = (long *)0x1472304f0;
    local_d8[3] = (long *)0x23;
    local_d8[4] = (long *)0x147230513;
    local_d8[5] = (long *)0x31;
    local_d8[6] = (long *)0x147230544;
    local_d8[7] = (long *)0x2c;
    local_d8[8] = (long *)0x147230570;
    local_d8[9] = (long *)0x29;
    local_d8[10] = (long *)0x147230599;
    local_d8[0xb] = (long *)0x2f;
    local_d8[0xc] = (long *)0x1472305c8;
    local_d8[0xd] = (long *)0x28;
    local_d8[0xe] = (long *)0x1472305f0;
    local_d8[0xf] = (long *)0x31;
    plVar6 = local_d8[param_3 * 2];
    plVar8 = local_d8[param_3 * 2 + 1];
    local_f0 = &local_58;
    local_e8 = 0x145bdf7d0;
    func_0x000145bcce30(plVar8,plVar6,0x14722e1b5,local_d8,&local_f0);
    local_50 = local_d8[1];
    auVar9 = func_0x0001458ec500();
    auVar1._8_8_ = plVar8;
    auVar1._0_8_ = plVar6;
    if (auVar9._0_8_ != 0) {
      auVar1 = auVar9;
    }
    uVar7 = auVar1._0_8_;
    plVar6 = local_d8[0];
    goto joined_r0x0001459a3190;
  }
  uVar2 = param_4 - 1;
  plVar6 = (long *)0x1;
  cVar5 = (char)param_4;
  if (((byte)uVar2 < 0xb) && ((0x5dfU >> (uVar2 & 0x1f) & 1) != 0)) {
    uVar3 = (ulong)((uVar2 & 0xff) << 3);
    local_50 = *(long **)(uVar3 + 0x147234e38);
    local_d8[0] = *(long **)(uVar3 + 0x147234e38);
    local_d8[1] = (long *)*(undefined8 *)(uVar3 + 0x147234e90);
    local_d8[2] = (long *)*(undefined8 *)(uVar3 + 0x147234ee8);
    local_d8[3] = (long *)*(undefined8 *)(uVar3 + 0x147234f40);
    local_d8[4] = (long *)*(undefined8 *)(uVar3 + 0x147234f98);
    local_d8[5] = (long *)*(undefined8 *)(uVar3 + 0x147234ff0);
    local_d8[6] = (long *)*(undefined8 *)(uVar3 + 0x147235048);
    local_d8[7] = (long *)*(undefined8 *)(uVar3 + 0x1472350a0);
    local_d8[8] = (long *)*(undefined8 *)(uVar3 + 0x1472350f8);
    local_d8[9] = (long *)*(undefined8 *)(uVar3 + 0x147235150);
    local_d8[10] = (long *)*(undefined8 *)(uVar3 + 0x1472351a8);
    local_d8[0xb] = (long *)*(undefined8 *)(uVar3 + 0x147235200);
    local_d8[0xc] = (long *)*(undefined8 *)(uVar3 + 0x147235258);
    local_d8[0xd] = (long *)*(undefined8 *)(uVar3 + 0x1472352b0);
    local_d8[0xe] = (long *)*(undefined8 *)(uVar3 + 0x147235308);
    local_d8[0xf] = (long *)*(undefined8 *)(uVar3 + 0x147235360);
    plVar6 = local_d8[param_3 * 2];
    plVar8 = local_d8[param_3 * 2 + 1];
    if ((byte)(cVar5 - 2U) < 10) goto LAB_1459a3124;
LAB_1459a3111:
    lVar4 = 0x146be06e8;
  }
  else {
    plVar8 = (long *)0x0;
    if (9 < (byte)(cVar5 - 2U)) goto LAB_1459a3111;
LAB_1459a3124:
    lVar4 = *(long *)((ulong)(byte)(cVar5 - 2) * 8 + 0x147235b30);
  }
  local_d8[0] = (long *)(lVar4 + 0x10);
  local_d8[1] = (long *)0x1400020c0;
  local_d8[2] = &local_58;
  local_d8[3] = (long *)0x145bdf7d0;
  func_0x000145bcce30(plVar8,plVar6,0x14722e1aa,&local_f0,local_d8);
  local_50 = (long *)local_e8;
  auVar9 = func_0x0001458ec500();
  auVar1._8_8_ = plVar8;
  auVar1._0_8_ = plVar6;
  if (auVar9._0_8_ != 0) {
    auVar1 = auVar9;
  }
  uVar7 = auVar1._0_8_;
  plVar6 = local_f0;
joined_r0x0001459a3190:
  if (plVar6 != (long *)0x0) {
    uVar7 = auVar1._0_8_;
    func_0x0001400021d0(auVar1._8_8_);
  }
  return uVar7;
}
