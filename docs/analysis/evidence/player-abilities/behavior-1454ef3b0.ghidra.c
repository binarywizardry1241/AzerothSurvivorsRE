
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,int param_3,long param_4,undefined1 param_5,
          undefined8 *param_6)

{
  long *plVar1;
  ulong uVar2;
  undefined4 *puVar3;
  undefined8 *puVar4;
  undefined8 uVar5;
  undefined1 uVar6;
  long lVar7;
  ulong uVar8;
  ulong uVar9;
  undefined8 uVar10;
  ulong uVar11;
  long lVar12;
  long lVar13;
  ulong uVar14;
  float fVar15;
  float fVar16;
  undefined4 in_XMM6_Da;
  undefined4 in_XMM7_Da;
  undefined4 uVar17;
  undefined4 uVar18;
  undefined4 uVar19;
  undefined4 uVar20;
  float fVar21;
  float fVar22;
  long in_stack_00000028;
  float in_stack_00000030;
  float in_stack_00000038;
  undefined8 *in_stack_00000040;
  long local_130;
  long lStack_128;
  undefined8 local_120;
  long lStack_118;
  int local_d8;
  int local_d4;
  undefined4 local_c0;
  long local_b8;
  long local_b0;
  undefined8 *local_a8;
  undefined4 local_a0;
  undefined4 local_9c;
  undefined4 local_98;
  int local_94;
  undefined8 local_90;
  undefined4 local_88;
  undefined4 local_78;
  
  local_90 = 0xfffffffffffffffe;
  lVar7 = *(long *)(param_4 + 0x4c8);
  lVar12 = 0;
  lVar13 = lVar7;
  do {
    if (*(long *)(param_4 + 0x4d0) * 0x160 - lVar12 == 0) {
      return;
    }
    lVar12 = lVar12 + 0x160;
    plVar1 = (long *)(lVar13 + 0x88);
    lVar13 = lVar13 + 0x160;
  } while (*plVar1 != in_stack_00000028);
  fVar15 = *(float *)(lVar7 + -0x38 + lVar12);
  local_a8 = param_6;
  local_88 = in_XMM6_Da;
  local_78 = in_XMM7_Da;
  if (fVar15 <= 0.0) {
    uVar5 = *(undefined8 *)(lVar7 + -0x48 + lVar12);
    fVar15 = (float)uVar5;
    fVar21 = (float)((ulong)uVar5 >> 0x20);
    if (param_3 != 0xa53) goto LAB_1454ef4b5;
LAB_1454ef4ba:
    func_0x00014545a320(param_3,param_4,*(undefined4 *)(param_4 + 0x450),&local_130);
    lVar13 = lStack_118;
    if (local_130 == -1) {
      uVar17 = 0x176c;
    }
    else {
      if (local_130 != 0) {
        func_0x0001400021d0();
      }
      if (lVar13 != 0) {
        func_0x0001400021d0();
      }
      uVar17 = 0x176c;
      if (local_d4 == 3 && local_d8 == 2) {
        uVar17 = 0x176e;
      }
    }
LAB_1454ef5b8:
    local_98 = 0x18;
    local_a0 = 1;
    local_9c = uVar17;
  }
  else {
    fVar15 = (*(float *)(param_4 + 0x8e4) - *(float *)(lVar7 + -0x3c + lVar12)) / fVar15;
    fVar21 = 0.0;
    if (0.0 <= fVar15) {
      fVar21 = fVar15;
    }
    fVar16 = _DAT_1458eb480;
    if (fVar21 <= _DAT_1458eb480) {
      fVar16 = fVar21;
    }
    uVar5 = *(undefined8 *)(lVar7 + -0x54 + lVar12);
    fVar15 = (float)uVar5;
    fVar21 = (float)((ulong)uVar5 >> 0x20);
    uVar5 = *(undefined8 *)(lVar7 + -0x48 + lVar12);
    fVar15 = fVar16 * ((float)uVar5 - fVar15) + fVar15;
    fVar21 = fVar16 * ((float)((ulong)uVar5 >> 0x20) - fVar21) + fVar21;
    if (param_3 == 0xa53) goto LAB_1454ef4ba;
LAB_1454ef4b5:
    if (param_3 == 0x4b) goto LAB_1454ef4ba;
    func_0x00014545a320(param_3,param_4,*(undefined4 *)(param_4 + 0x450));
    lVar13 = lStack_118;
    if (local_130 != -1) {
      if (local_130 != 0) {
        func_0x0001400021d0();
      }
      if (lVar13 != 0) {
        func_0x0001400021d0();
      }
      uVar17 = 0x176c;
      if (local_d4 == 3 && local_d8 == 2) {
        uVar17 = 0x176e;
      }
      local_a0 = 0;
      if (param_3 != 0x4bea) goto LAB_1454ef5c7;
      goto LAB_1454ef5b8;
    }
    uVar17 = 0x176c;
    local_a0 = 0;
    if (param_3 == 0x4bea) goto LAB_1454ef5b8;
  }
LAB_1454ef5c7:
  local_b0 = in_stack_00000028;
  local_b8 = in_stack_00000028;
  local_c0 = 0;
  func_0x00014544b1a0();
  lVar13 = *(long *)(param_4 + 0x548);
  if (lVar13 == *(long *)(param_4 + 0x538)) {
    func_0x0001457580b0();
  }
  lVar7 = *(long *)(param_4 + 0x540);
  puVar4 = (undefined8 *)(lVar7 + 0x10 + lVar13 * 0x20);
  *puVar4 = local_120;
  puVar4[1] = lStack_118;
  plVar1 = (long *)(lVar7 + lVar13 * 0x20);
  *plVar1 = local_130;
  plVar1[1] = lStack_128;
  *(long *)(param_4 + 0x548) = lVar13 + 1;
  fVar22 = 0.0;
  fVar16 = _DAT_1458f6680;
  if (param_3 < 0xe16) {
    if (param_3 < 0x5e6) {
      if (param_3 < 0x85) {
        if ((param_3 != 0x4b) && (fVar16 = _DAT_145933c50, param_3 != 0x74)) goto LAB_1454ef7ff;
      }
      else {
        fVar16 = _DAT_14593e294;
        if ((param_3 != 0x85) && ((fVar16 = _DAT_1458f8fa0, param_3 != 0x193 && (param_3 != 0x2ae)))
           ) goto LAB_1454ef7ff;
      }
    }
    else {
      fVar16 = _DAT_1458f6600;
      if (param_3 < 0xa53) {
        if ((param_3 != 0x5e6) && (fVar16 = _DAT_1458f6680, param_3 != 0x7ba)) goto LAB_1454ef7ff;
      }
      else if ((param_3 != 0xa53) &&
              ((fVar16 = _DAT_1458f8fa0, param_3 != 0xafc &&
               (fVar16 = _DAT_1458f6680, param_3 != 0xbe4)))) goto LAB_1454ef7ff;
    }
  }
  else if (param_3 < 0x1b05) {
    if (param_3 < 0x1438) {
      fVar16 = _DAT_1459c7a20;
      if ((param_3 != 0xe16) && (fVar16 = _DAT_1458f6680, param_3 != 0x13fc)) goto LAB_1454ef7ff;
    }
    else {
      fVar16 = _DAT_1458f8fa0;
      if ((param_3 != 0x1438) &&
         ((fVar16 = _DAT_14593e294, param_3 != 0x18d1 && (param_3 != 0x1a85)))) goto LAB_1454ef7ff;
    }
  }
  else if (param_3 < 0x2c66) {
    if (((param_3 != 0x1b05) && (fVar16 = _DAT_1458f8fa0, param_3 != 0x1c65)) &&
       (fVar16 = _DAT_145933c50, param_3 != 0x27c5)) goto LAB_1454ef7ff;
  }
  else {
    fVar16 = _DAT_14593e294;
    if (((param_3 != 0x2c66) && (fVar16 = _DAT_1458f6680, param_3 != 0x4bea)) &&
       (fVar16 = _DAT_1459c79e8, param_3 != 0x5ed3)) goto LAB_1454ef7ff;
  }
  fVar15 = (float)*(undefined8 *)(param_4 + 1000) - fVar15;
  fVar21 = (float)((ulong)*(undefined8 *)(param_4 + 1000) >> 0x20) - fVar21;
  fVar22 = SQRT(fVar21 * fVar21 + fVar15 * fVar15) / fVar16;
LAB_1454ef7ff:
  uVar8 = *(ulong *)(param_4 + 0x880);
  uVar2 = *(ulong *)(param_4 + 0x898) + uVar8;
  uVar9 = *(ulong *)(param_4 + 0x888);
  uVar14 = *(ulong *)(param_4 + 0x890) ^ uVar8;
  uVar11 = *(ulong *)(param_4 + 0x898) ^ uVar9;
  *(ulong *)(param_4 + 0x888) = uVar9 ^ uVar14;
  *(ulong *)(param_4 + 0x880) = uVar8 ^ uVar11;
  *(ulong *)(param_4 + 0x890) = uVar14 ^ uVar9 << 0x11;
  *(ulong *)(param_4 + 0x898) = uVar11 << 0x2d | uVar11 >> 0x13;
  fVar21 = (float)(uint)((uVar2 * 0x800000 | uVar2 >> 0x29) + uVar8 >> 0x28) * _DAT_1459eb3c0;
  fVar15 = *(float *)(param_4 + 0x464);
  if (fVar21 < fVar15) {
    in_stack_00000030 = in_stack_00000030 * *(float *)(param_4 + 0x468);
  }
  fVar22 = fVar22 + in_stack_00000038 + *(float *)(param_4 + 0x8e4);
  uVar5 = *(undefined8 *)(param_4 + 0x3d0);
  uVar17 = *(undefined4 *)(param_4 + 0x40);
  uVar18 = *(undefined4 *)(param_4 + 0x44);
  uVar19 = *(undefined4 *)(param_4 + 0x48);
  uVar20 = *(undefined4 *)(param_4 + 0x4c);
  uVar6 = *(undefined1 *)(param_4 + 0x7ec);
  lVar13 = *(long *)(param_4 + 0x500);
  local_94 = param_3;
  if (lVar13 == *(long *)(param_4 + 0x4f0)) {
    func_0x0001457642b0();
  }
  lVar7 = *(long *)(param_4 + 0x4f8);
  lVar12 = lVar13 * 0x50;
  puVar3 = (undefined4 *)(lVar7 + lVar12);
  *puVar3 = uVar17;
  puVar3[1] = uVar18;
  puVar3[2] = uVar19;
  puVar3[3] = uVar20;
  uVar10 = in_stack_00000040[1];
  puVar4 = (undefined8 *)(lVar7 + 0x10 + lVar12);
  *puVar4 = *in_stack_00000040;
  puVar4[1] = uVar10;
  *(long *)(lVar7 + 0x20 + lVar12) = in_stack_00000028;
  *(undefined8 *)(lVar7 + 0x28 + lVar12) = uVar5;
  *(undefined8 *)(lVar7 + 0x30 + lVar12) = *local_a8;
  *(undefined4 *)(lVar7 + 0x38 + lVar12) = *(undefined4 *)(local_a8 + 1);
  *(float *)(lVar7 + 0x3c + lVar12) = fVar22;
  *(int *)(lVar7 + 0x40 + lVar12) = local_94;
  *(float *)(lVar7 + 0x44 + lVar12) = in_stack_00000030;
  *(bool *)(lVar7 + 0x48 + lVar12) = fVar21 < fVar15;
  *(undefined1 *)(lVar7 + 0x49 + lVar12) = 0;
  *(undefined1 *)(lVar7 + 0x4a + lVar12) = uVar6;
  *(undefined1 *)(lVar7 + 0x4b + lVar12) = param_5;
  *(long *)(param_4 + 0x500) = lVar13 + 1;
  return;
}

