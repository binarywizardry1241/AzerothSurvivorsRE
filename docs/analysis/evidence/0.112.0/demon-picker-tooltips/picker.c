
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

long * entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,long *param_4,
            undefined8 param_5,undefined8 param_6)

{
  code *pcVar1;
  long *plVar2;
  undefined8 *puVar3;
  long lVar4;
  long extraout_RDX;
  long lVar5;
  float fVar6;
  float fVar7;
  float fVar8;
  undefined8 in_XMM6_Qa;
  undefined1 auVar9 [16];
  long in_stack_00000028;
  long in_stack_00000030;
  float local_188;
  long local_e8;
  long lStack_e0;
  long *local_d8;
  long local_d0;
  long lStack_c8;
  long *local_c0;
  undefined8 local_b8;
  uint *local_b0;
  long local_a8;
  ulong local_a0;
  uint local_94;
  long local_90;
  long local_88;
  long local_80;
  long local_78;
  long local_70;
  undefined1 local_61;
  undefined8 local_60;
  undefined8 local_58;

  local_60 = 0xfffffffffffffffe;
  local_58 = in_XMM6_Qa;
  puVar3 = (undefined8 *)func_0x0001458994a0(param_1,param_4,param_6,param_5);
  func_0x00014593a1d0();
  func_0x00014597a5d0();
  if (extraout_RDX < 0) {
LAB_140040e46:
    func_0x000145da94eb();
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
    if (lVar4 == 0) goto LAB_140040e46;
    func_0x000145c0a3db();
  }
  lVar5 = extraout_RDX;
  local_88 = extraout_RDX;
  local_80 = lVar4;
  local_78 = extraout_RDX;
  if (0.0 < *(float *)(puVar3 + 9)) {
    fVar7 = _DAT_145db1390;
    if ((puVar3[1] == 8) && (*(long *)*puVar3 == 0x657269666c6c6568)) {
      fVar7 = _DAT_145dad264;
    }
    fVar6 = *(float *)(puVar3 + 9) * _DAT_145db1394 * local_188;
    fVar8 = fVar6;
    if (fVar6 <= fVar7) {
      fVar8 = fVar7;
    }
    local_94 = ~-(uint)NAN(fVar8) & (uint)fVar8 | (uint)fVar6 & -(uint)NAN(fVar8);
    auVar9 = ZEXT416(local_94);
    fVar7 = (float)func_0x000145c0a40b(local_94);
    local_b0 = &local_94;
    if (_DAT_145db1398 <= auVar9._0_4_ - fVar7) {
      local_a8 = 0x145bedee0;
      local_61 = 1;
      func_0x000145bdd130();
    }
    else {
      local_a8 = 0x145bedee0;
      local_61 = 1;
      func_0x000145bdd130();
    }
    local_e8 = local_d0;
    lStack_e0 = lStack_c8;
    local_d8 = local_c0;
    func_0x000145c0d470();
    *(undefined4 *)(local_80 + local_78) = 0x20b7c220;
    lVar5 = local_78 + 4;
    local_d0 = 0x145db2658;
    lStack_c8 = 1;
    local_c0 = &local_e8;
    local_b8 = 0x145db2638;
    local_78 = lVar5;
    func_0x00014598dd80();
    if ((ulong)(local_88 - lVar5) < local_a0) {
      local_70 = local_a8;
      func_0x000145c0d470();
      lVar5 = local_78;
LAB_140041064:
      func_0x000145c0a3db();
    }
    else if (local_a0 != 0) goto LAB_140041064;
    lVar5 = lVar5 + local_a0;
    local_78 = lVar5;
    if (local_b0 != (uint *)0x0) {
      func_0x0001400021d0();
    }
    if (local_e8 != 0) {
      func_0x0001400021d0();
    }
  }
  if (in_stack_00000028 == 0) goto LAB_140041154;
  local_e8 = in_stack_00000028;
  lStack_e0 = in_stack_00000030;
  local_b0 = (uint *)&local_e8;
  local_a8 = 0x1400020c0;
  local_61 = 1;
  func_0x000145bdd130();
  plVar2 = local_c0;
  if ((long *)(local_88 - lVar5) < local_c0) {
    local_90 = lStack_c8;
    local_70 = local_d0;
    func_0x000145c0d470();
    lVar5 = local_78;
    lVar4 = local_70;
LAB_14004112a:
    func_0x000145c0a3db();
  }
  else {
    lVar4 = local_d0;
    if (local_c0 != (long *)0x0) goto LAB_14004112a;
  }
  if (lVar4 != 0) {
    func_0x0001400021d0();
  }
  lVar5 = lVar5 + (long)plVar2;
LAB_140041154:
  local_61 = 1;
  auVar9 = func_0x000145897400();
  lVar4 = auVar9._0_8_;
  local_70 = local_88;
  local_90 = local_80;
  func_0x000145993690();
  param_4[6] = lVar4;
  param_4[7] = auVar9._8_8_;
  *param_4 = local_70;
  param_4[1] = local_90;
  param_4[2] = lVar5;
  param_4[3] = local_d0;
  param_4[4] = lStack_c8;
  param_4[5] = (long)local_c0;
  return param_4;
}
