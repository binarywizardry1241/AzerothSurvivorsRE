/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,undefined8 *param_3,undefined8 param_4,
          undefined8 *param_5,ulong *param_6)

{
  code *pcVar1;
  float *pfVar2;
  int iVar3;
  uint uVar4;
  int iVar5;
  uint uVar6;
  float fVar7;
  float fVar8;
  float fVar9;
  float fVar10;
  float fVar11;
  undefined8 in_XMM6_Qa;
  undefined4 in_XMM7_Da;
  undefined8 *in_stack_00000028;
  char local_2b8 [8];
  long local_2b0;
  undefined4 local_1f4;
  undefined8 local_1d8;
  undefined8 uStack_1d0;
  ulong local_1c8;
  undefined1 local_1c0;
  uint local_1a8;
  uint local_1a4;
  undefined8 local_f8;
  undefined8 uStack_f0;
  undefined8 local_e8;
  undefined8 uStack_e0;
  undefined8 local_d8;
  undefined8 local_d0;
  undefined8 uStack_c8;
  undefined4 *local_c0;
  undefined8 uStack_b8;
  ulong local_b0;
  ulong uStack_a8;
  ulong local_a0;
  float *local_98;
  undefined8 uStack_90;
  undefined4 local_88;
  undefined4 uStack_84;
  undefined4 uStack_80;
  undefined4 uStack_7c;
  uint local_74;
  uint uStack_70;
  undefined4 uStack_6c;
  undefined4 uStack_68;
  undefined1 local_61;
  undefined8 local_60;
  undefined8 local_58;
  undefined4 local_48;

  local_60 = 0xfffffffffffffffe;
  local_d8 = param_3[4];
  local_f8 = *param_3;
  uStack_f0 = param_3[1];
  local_e8 = param_3[2];
  uStack_e0 = param_3[3];
  local_d0 = *param_5;
  uStack_c8 = param_5[1];
  local_c0 = (undefined4 *)param_5[2];
  uStack_b8 = param_5[3];
  local_1c8 = param_6[2];
  local_1d8 = *param_6;
  uStack_1d0 = param_6[1];
  pfVar2 = (float *)*in_stack_00000028;
  uStack_90 = in_stack_00000028[1];
  local_88 = *(undefined4 *)(in_stack_00000028 + 2);
  uStack_84 = *(undefined4 *)((long)in_stack_00000028 + 0x14);
  uStack_80 = *(undefined4 *)(in_stack_00000028 + 3);
  uStack_7c = *(undefined4 *)((long)in_stack_00000028 + 0x1c);
  local_b0 = local_1d8;
  uStack_a8 = uStack_1d0;
  local_a0 = local_1c8;
  local_98 = pfVar2;
  local_58 = in_XMM6_Qa;
  local_48 = in_XMM7_Da;
  func_0x0001400bfb90(pfVar2,&local_1d8,&local_1d8,local_2b8);
  if (local_2b8[0] == '\0') {
    fVar8 = _DAT_145dcce84;
    if (_DAT_145dcce84 <= *pfVar2) {
      fVar8 = *pfVar2;
    }
    fVar9 = _DAT_145d9d4c8;
    if (fVar8 <= _DAT_145d9d4c8) {
      fVar9 = fVar8;
    }
    fVar7 = (float)(*(int *)(local_2b0 + 0xc0) + (uint)(*(int *)(local_2b0 + 0xc0) == 0));
    fVar10 = _DAT_145f3dea0 / fVar7;
    fVar8 = fVar9;
    if (fVar10 <= fVar9) {
      fVar8 = fVar10;
    }
    fVar11 = (float)(*(int *)(local_2b0 + 0xc4) + (uint)(*(int *)(local_2b0 + 0xc4) == 0));
    fVar8 = (float)(-(uint)NAN(fVar8) & (uint)fVar9 | ~-(uint)NAN(fVar8) & (uint)fVar8);
    fVar10 = _DAT_145f3dea0 / fVar11;
    fVar9 = fVar8;
    if (fVar10 <= fVar8) {
      fVar9 = fVar10;
    }
    fVar8 = (float)(~-(uint)NAN(fVar9) & (uint)fVar9 | (uint)fVar8 & -(uint)NAN(fVar9));
    fVar11 = fVar8 * fVar11;
    fVar8 = (float)func_0x000145bfa10b(fVar7 * fVar8);
    fVar9 = (float)func_0x000145bfa10b(fVar11);
    iVar5 = (int)(long)fVar8;
    if (fVar8 < 0.0) {
      iVar5 = 0;
    }
    if (_DAT_145dd2e40 < fVar8) {
      iVar5 = -1;
    }
    iVar3 = (int)(long)fVar9;
    if (fVar9 < 0.0) {
      iVar3 = 0;
    }
    if (_DAT_145dd2e40 < fVar9) {
      iVar3 = -1;
    }
    uVar6 = iVar5 + (uint)(iVar5 == 0);
    uVar4 = iVar3 + (uint)(iVar3 == 0);
    if (0x1fff < uVar6) {
      uVar6 = 0x2000;
    }
    if (0x1fff < uVar4) {
      uVar4 = 0x2000;
    }
  }
  else {
    uVar6 = 0x500;
    uVar4 = 0x2d0;
  }
  *local_c0 = uStack_b8._4_4_;
  uStack_6c = 1;
  local_1d8 = local_1d8 & 0xffffffff00000000;
  local_74 = uVar6;
  uStack_70 = uVar4;
  func_0x0001448c6780();
  local_1f4 = 0x10;
  local_61 = 1;
  func_0x000144962cc0();
  func_0x000145bfa0e7();
  local_61 = 0;
  func_0x000140a24af0();
  if (local_74 == 2) {
    local_1d8 = 0xffffffffffffffff;
    local_61 = 0;
    uStack_1d0 = func_0x000144975840();
    local_1d8 = local_1d8 & 0xffffffffffffff00;
    local_1c0 = 2;
    local_1a8 = uVar6;
    local_1a4 = uVar4;
    func_0x0001408e4c80();
    return;
  }
  local_1d8 = CONCAT44(uStack_70,local_74);
  uStack_1d0 = CONCAT44(uStack_68,uStack_6c);
  local_61 = 0;
  func_0x000145d995d0();
                    /* WARNING: Does not return */
  pcVar1 = (code *)invalidInstructionException();
  (*pcVar1)();
}
