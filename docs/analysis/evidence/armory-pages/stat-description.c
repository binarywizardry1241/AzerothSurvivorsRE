/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,float param_3,undefined8 param_4,undefined8 param_5
          ,ulong param_6,undefined8 param_7)

{
  float fVar1;
  float fVar2;
  undefined4 in_XMM6_Da;
  undefined4 in_XMM7_Da;
  undefined4 local_c8 [13];
  float local_94;
  float *local_90;
  undefined8 local_88;
  undefined8 local_70;
  undefined4 local_68;
  undefined4 local_58;

  local_70 = 0xfffffffffffffffe;
  param_3 = _DAT_145d9d2d0 * param_3;
  fVar2 = _DAT_145d9d310;
  local_68 = in_XMM6_Da;
  local_58 = in_XMM7_Da;
  fVar1 = (float)func_0x000145bfa10b(param_3 * _DAT_145d9d310,param_4,param_7);
  fVar1 = fVar1 / fVar2;
  param_6 = param_6 & 0xff;
  local_94 = fVar1;
  if ((float)(_DAT_145d9d730 & (uint)param_3) < fVar2) {
    fVar2 = (float)func_0x000145bfa111();
    if ((fVar1 - fVar2 != 0.0) || (NAN(fVar1 - fVar2))) {
      local_90 = &local_94;
      local_88 = 0x145bddbe0;
      func_0x000145bcce30();
                    /* WARNING: Could not recover jumptable at 0x000145895fbc. Too many branches */
                    /* WARNING: Treating indirect jump as call */
      (*(code *)((long)*(int *)(param_6 * 4 + 0x146beb380) + 0x146beb380))();
      return;
    }
  }
  local_c8[0] = func_0x000145bfa10b(param_3);
  local_90 = (float *)local_c8;
  local_88 = 0x145bddbe0;
  func_0x000145bcce30();
                    /* WARNING: Could not recover jumptable at 0x000145895f19. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)((long)*(int *)(param_6 * 4 + 0x146beb380) + 0x146beb380))();
  return;
}
