/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

long * entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,long *param_4,
            undefined8 param_5,undefined8 param_6)

{
  code *pcVar1;
  long *plVar2;
  long lVar3;
  long lVar4;
  long extraout_RDX;
  long lVar5;
  float fVar6;
  undefined4 in_XMM6_Da;
  float fVar7;
  undefined1 auVar8 [16];
  long in_stack_00000028;
  long in_stack_00000030;
  float local_198;
  long local_e8;
  long lStack_e0;
  long *local_d8;
  long local_d0;
  long lStack_c8;
  long *local_c0;
  undefined8 local_b8;
  float *local_b0;
  long local_a8;
  ulong local_a0;
  float local_94;
  long local_90;
  long local_88;
  long local_80;
  long local_78;
  long local_70;
  undefined1 local_61;
  undefined8 local_60;
  undefined4 local_58;

  local_60 = 0xfffffffffffffffe;
  local_58 = in_XMM6_Da;
  lVar3 = func_0x000145875720(param_1,param_4,param_6,param_5);
  func_0x00014592f0d0((int)_DAT_145d70ca0,_DAT_145d73d30,0);
  func_0x00014596e450();
  if (extraout_RDX < 0) {
LAB_14007e933:
    func_0x000145d6944b();
                    /* WARNING: Does not return */
    pcVar1 = (code *)invalidInstructionException();
    (*pcVar1)();
  }
  if (extraout_RDX == 0) {
    lVar4 = 1;
  }
  else {
    func_0x000140002200();
    lVar4 = func_0x0001400021c0();
    if (lVar4 == 0) goto LAB_14007e933;
    func_0x000145bc977b();
  }
  lVar5 = extraout_RDX;
  local_88 = extraout_RDX;
  local_80 = lVar4;
  local_78 = extraout_RDX;
  if (0.0 < *(float *)(lVar3 + 0x48)) {
    fVar7 = *(float *)(lVar3 + 0x48) * _DAT_145d73d40 * local_198;
    if (fVar7 <= _DAT_145d73d44) {
      fVar7 = _DAT_145d73d44;
    }
    local_94 = fVar7;
    fVar6 = (float)func_0x000145bc97b7(fVar7);
    local_b0 = &local_94;
    if (_DAT_145d73d48 <= fVar7 - fVar6) {
      local_a8 = 0x145bad280;
      local_61 = 1;
      func_0x000145b9c4d0();
    }
    else {
      local_a8 = 0x145bad280;
      local_61 = 1;
      func_0x000145b9c4d0();
    }
    local_e8 = local_d0;
    lStack_e0 = lStack_c8;
    local_d8 = local_c0;
    func_0x000145bcb2d0();
    *(undefined4 *)(local_80 + local_78) = 0x20b7c220;
    lVar5 = local_78 + 4;
    local_d0 = 0x145d983d8;
    lStack_c8 = 1;
    local_c0 = &local_e8;
    local_b8 = 0x145d983b8;
    local_78 = lVar5;
    func_0x0001458da540();
    if ((ulong)(local_88 - lVar5) < local_a0) {
      local_70 = local_a8;
      func_0x000145bcb2d0();
      lVar5 = local_78;
LAB_14007eb1d:
      func_0x000145bc977b();
    }
    else if (local_a0 != 0) goto LAB_14007eb1d;
    lVar5 = lVar5 + local_a0;
    local_78 = lVar5;
    if (local_b0 != (float *)0x0) {
      func_0x0001400021d0();
    }
    if (local_e8 != 0) {
      func_0x0001400021d0();
    }
  }
  if (in_stack_00000028 == 0) goto LAB_14007ec13;
  local_e8 = in_stack_00000028;
  lStack_e0 = in_stack_00000030;
  local_b0 = (float *)&local_e8;
  local_a8 = 0x1400020c0;
  local_61 = 1;
  func_0x000145b9c4d0();
  plVar2 = local_c0;
  if ((long *)(local_88 - lVar5) < local_c0) {
    local_90 = lStack_c8;
    local_70 = local_d0;
    func_0x000145bcb2d0();
    lVar5 = local_78;
    lVar3 = local_70;
LAB_14007ebe9:
    func_0x000145bc977b();
  }
  else {
    lVar3 = local_d0;
    if (local_c0 != (long *)0x0) goto LAB_14007ebe9;
  }
  if (lVar3 != 0) {
    func_0x0001400021d0();
  }
  lVar5 = lVar5 + (long)plVar2;
LAB_14007ec13:
  local_61 = 1;
  auVar8 = func_0x0001458744e0();
  lVar3 = auVar8._0_8_;
  local_70 = local_88;
  local_90 = local_80;
  func_0x000145987260();
  param_4[6] = lVar3;
  param_4[7] = auVar8._8_8_;
  *param_4 = local_70;
  param_4[1] = local_90;
  param_4[2] = lVar5;
  param_4[3] = local_d0;
  param_4[4] = lStack_c8;
  param_4[5] = (long)local_c0;
  return param_4;
}
