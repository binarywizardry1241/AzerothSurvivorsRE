
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long *param_3,long param_4,long param_5)

{
  ulong uVar1;
  undefined1 uVar2;
  ulong uVar3;
  int iVar4;
  long lVar5;
  ulong uVar6;
  ulong uVar7;
  long *plVar8;
  ulong uVar9;
  long lVar10;
  ulong uVar11;
  long lVar12;
  float fVar13;
  float fVar14;
  undefined4 uVar15;
  float fVar16;
  undefined4 uVar17;
  undefined4 uVar18;
  undefined4 uVar19;
  undefined4 uVar20;
  undefined4 uVar21;
  undefined4 uVar22;
  undefined4 uVar23;
  long in_stack_00000028;
  long in_stack_00000030;
  float in_stack_00000038;
  long lStack_d0;
  long local_c8;
  long local_b8;
  
  lVar10 = *param_3;
  if (in_stack_00000030 != 0) {
    uVar9 = (ulong)*(byte *)(param_4 + 0x111);
    uVar15 = *(undefined4 *)(param_4 + 0x20);
    uVar17 = *(undefined4 *)(param_4 + 0x24);
    uVar18 = *(undefined4 *)(param_4 + 0x28);
    uVar19 = *(undefined4 *)(param_4 + 0x2c);
    uVar20 = *(undefined4 *)(param_4 + 0x40);
    uVar21 = *(undefined4 *)(param_4 + 0x44);
    uVar22 = *(undefined4 *)(param_4 + 0x48);
    uVar23 = *(undefined4 *)(param_4 + 0x4c);
    lVar12 = 0;
    fVar16 = _DAT_1459eb3c0;
    do {
      uVar3 = *(ulong *)(param_4 + 0x880);
      uVar1 = *(ulong *)(param_4 + 0x898) + uVar3;
      uVar7 = *(ulong *)(param_4 + 0x888);
      uVar11 = *(ulong *)(param_4 + 0x890) ^ uVar3;
      uVar6 = *(ulong *)(param_4 + 0x898) ^ uVar7;
      *(ulong *)(param_4 + 0x888) = uVar7 ^ uVar11;
      *(ulong *)(param_4 + 0x880) = uVar3 ^ uVar6;
      *(ulong *)(param_4 + 0x890) = uVar11 ^ uVar7 << 0x11;
      *(ulong *)(param_4 + 0x898) = uVar6 << 0x2d | uVar6 >> 0x13;
      fVar13 = (float)(uint)((uVar1 * 0x800000 | uVar1 >> 0x29) + uVar3 >> 0x28) * fVar16;
      *(undefined1 *)(param_4 + 0x111) = 3;
      *(undefined8 *)(param_4 + 0x20) = 0;
      *(undefined8 *)(param_4 + 0x40) = 0;
      fVar14 = *(float *)(param_4 + 0x468) * in_stack_00000038;
      if (*(float *)(param_4 + 0x464) <= fVar13) {
        fVar14 = in_stack_00000038;
      }
      func_0x0001454c2eb0(fVar13,*(float *)(param_4 + 0x464),fVar14);
      *(char *)(param_4 + 0x111) = (char)uVar9;
      *(undefined4 *)(param_4 + 0x20) = uVar15;
      *(undefined4 *)(param_4 + 0x24) = uVar17;
      *(undefined4 *)(param_4 + 0x28) = uVar18;
      *(undefined4 *)(param_4 + 0x2c) = uVar19;
      *(undefined4 *)(param_4 + 0x40) = uVar20;
      *(undefined4 *)(param_4 + 0x44) = uVar21;
      *(undefined4 *)(param_4 + 0x48) = uVar22;
      *(undefined4 *)(param_4 + 0x4c) = uVar23;
      lVar12 = lVar12 + 8;
    } while (in_stack_00000030 * 8 - lVar12 != 0);
  }
  lVar12 = *(long *)(param_4 + 0x700);
  if (lVar12 != 0) {
    lVar10 = *(long *)(lVar10 + 8);
    plVar8 = (long *)(*(long *)(param_4 + 0x6f8) + 0x10);
    fVar16 = _DAT_1458f667c;
    do {
      if ((((char)plVar8[-2] == '\r') && (*plVar8 == lVar10)) &&
         (iVar4 = func_0x000145756dd7(), iVar4 == 0)) {
        fVar16 = fVar16 + *(float *)((long)plVar8 + -0xc);
      }
      plVar8 = plVar8 + 8;
      lVar12 = lVar12 + -1;
    } while (lVar12 != 0);
    if (0.0 < fVar16) {
      lVar10 = param_4 + 0x4c0;
      func_0x0001455321e0();
      if (local_b8 != 0) {
        lVar12 = *(long *)(param_4 + 0x4c8);
        lVar5 = *(long *)(param_4 + 0x4d0) * 0x160;
        do {
          if (lVar5 == 0) {
            if (param_5 != *(long *)(param_4 + 0x3d0)) goto LAB_1454d46e7;
            break;
          }
          lVar5 = lVar5 + -0x160;
          plVar8 = (long *)(lVar12 + 0x88);
          lVar12 = lVar12 + 0x160;
        } while (*plVar8 != param_5);
        func_0x00014544b1a0();
        lVar12 = *(long *)(param_4 + 0x548);
        if (lVar12 == *(long *)(param_4 + 0x538)) {
          func_0x0001457580b0();
        }
        lVar5 = *(long *)(param_4 + 0x540);
        plVar8 = (long *)(lVar5 + 0x10 + lVar12 * 0x20);
        *plVar8 = lVar10;
        plVar8[1] = lStack_d0;
        plVar8 = (long *)(lVar5 + lVar12 * 0x20);
        *plVar8 = in_stack_00000028;
        plVar8[1] = in_stack_00000030 * 8 + in_stack_00000028;
        *(long *)(param_4 + 0x548) = lVar12 + 1;
LAB_1454d46e7:
        in_stack_00000038 = in_stack_00000038 * fVar16;
        uVar2 = *(undefined1 *)(param_4 + 0x111);
        uVar15 = *(undefined4 *)(param_4 + 0x20);
        uVar17 = *(undefined4 *)(param_4 + 0x24);
        uVar18 = *(undefined4 *)(param_4 + 0x28);
        uVar19 = *(undefined4 *)(param_4 + 0x2c);
        uVar20 = *(undefined4 *)(param_4 + 0x40);
        uVar21 = *(undefined4 *)(param_4 + 0x44);
        uVar22 = *(undefined4 *)(param_4 + 0x48);
        uVar23 = *(undefined4 *)(param_4 + 0x4c);
        lVar10 = 0;
        fVar16 = _DAT_1459eb3c0;
        do {
          uVar1 = *(ulong *)(param_4 + 0x880);
          uVar9 = *(ulong *)(param_4 + 0x898) + uVar1;
          uVar3 = *(ulong *)(param_4 + 0x888);
          uVar6 = *(ulong *)(param_4 + 0x890) ^ uVar1;
          uVar7 = *(ulong *)(param_4 + 0x898) ^ uVar3;
          *(ulong *)(param_4 + 0x888) = uVar3 ^ uVar6;
          *(ulong *)(param_4 + 0x880) = uVar1 ^ uVar7;
          *(ulong *)(param_4 + 0x890) = uVar6 ^ uVar3 << 0x11;
          *(ulong *)(param_4 + 0x898) = uVar7 << 0x2d | uVar7 >> 0x13;
          fVar13 = (float)(uint)((uVar9 * 0x800000 | uVar9 >> 0x29) + uVar1 >> 0x28) * fVar16;
          *(undefined1 *)(param_4 + 0x111) = 3;
          *(undefined8 *)(param_4 + 0x20) = 0;
          *(undefined8 *)(param_4 + 0x40) = 0;
          fVar14 = *(float *)(param_4 + 0x468) * in_stack_00000038;
          if (*(float *)(param_4 + 0x464) <= fVar13) {
            fVar14 = in_stack_00000038;
          }
          func_0x0001454c2eb0(fVar13,*(float *)(param_4 + 0x464),fVar14);
          *(undefined1 *)(param_4 + 0x111) = uVar2;
          *(undefined4 *)(param_4 + 0x20) = uVar15;
          *(undefined4 *)(param_4 + 0x24) = uVar17;
          *(undefined4 *)(param_4 + 0x28) = uVar18;
          *(undefined4 *)(param_4 + 0x2c) = uVar19;
          *(undefined4 *)(param_4 + 0x40) = uVar20;
          *(undefined4 *)(param_4 + 0x44) = uVar21;
          *(undefined4 *)(param_4 + 0x48) = uVar22;
          *(undefined4 *)(param_4 + 0x4c) = uVar23;
          lVar10 = lVar10 + 8;
        } while (local_b8 << 3 != lVar10);
      }
      if (local_c8 != 0) {
        func_0x0001400021d0();
      }
    }
  }
  return;
}

