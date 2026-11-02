
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 param_4,
          undefined8 *param_5,undefined8 *param_6)

{
  uint *puVar1;
  undefined4 uVar2;
  int *piVar3;
  long lVar4;
  undefined4 *puVar5;
  undefined4 *puVar6;
  long lVar7;
  bool bVar8;
  long *plVar9;
  uint uVar10;
  long lVar11;
  long lVar12;
  ulong uVar13;
  byte *pbVar14;
  ulong uVar15;
  int iVar16;
  undefined8 *puVar17;
  uint *puVar18;
  long lVar19;
  uint uVar20;
  undefined8 uVar21;
  undefined4 in_XMM6_Da;
  float fVar22;
  undefined8 *in_stack_00000028;
  undefined8 *in_stack_00000030;
  undefined8 *in_stack_00000040;
  long *in_stack_00000060;
  long local_2f8;
  undefined4 uStack_2f0;
  undefined4 uStack_2ec;
  long local_2e8;
  long local_118;
  undefined1 local_f8 [28];
  undefined4 local_dc;
  long local_d8;
  undefined8 local_d0;
  undefined8 local_c8;
  undefined8 local_c0;
  undefined4 local_b4;
  long *local_b0;
  long local_a8;
  long local_a0;
  uint local_94;
  undefined4 local_90;
  int local_8c;
  long *local_70;
  char local_61;
  undefined8 local_60;
  undefined4 local_58;

  local_60 = 0xfffffffffffffffe;
  lVar19 = *param_3;
  piVar3 = (int *)*in_stack_00000028;
  iVar16 = *(int *)((long)param_3 + 0x14);
  local_70 = (long *)*param_5;
  local_c8 = *in_stack_00000040;
  bVar8 = false;
  if (*piVar3 == 1) {
    bVar8 = _DAT_14590750c == (float)piVar3[1];
  }
  uVar20 = iVar16 - (int)param_3[2];
  uVar10 = 0xc233b000;
  if (uVar20 < 0xc233b000) {
    uVar10 = uVar20;
  }
  lVar4 = param_3[1];
  puVar5 = (undefined4 *)param_5[2];
  local_90 = *(undefined4 *)((long)param_5 + 0x1c);
  local_c0 = *param_6;
  local_dc = *(undefined4 *)((long)param_6 + 0x1c);
  puVar6 = (undefined4 *)in_stack_00000028[2];
  uVar2 = *(undefined4 *)((long)in_stack_00000028 + 0x1c);
  local_d0 = *in_stack_00000030;
  local_b4 = *(undefined4 *)((long)in_stack_00000030 + 0x1c);
  lVar7 = *in_stack_00000060;
  puVar18 = *(uint **)(lVar19 + 0xf8);
  puVar1 = puVar18 + *(long *)(lVar19 + 0x100);
  fVar22 = 0.0;
  local_61 = *(char *)(lVar19 + 0x108);
  local_b0 = local_70 + 3;
  local_d8 = (long)local_70 + 0x3b;
  local_118 = 8;
  local_a8 = 0;
  local_a0 = 0;
  lVar11 = 0;
  uVar21 = 0;
  uVar15 = 0;
  local_94 = uVar10;
  local_8c = iVar16;
  local_58 = in_XMM6_Da;
  if (local_61 == '\0') {
    do {
      do {
        if ((int)uVar15 == (int)uVar21) {
          if (puVar18 == puVar1) goto LAB_1400c537c;
          uVar10 = *puVar18;
          puVar18 = puVar18 + 1;
          if (*(long *)(*(long *)(lVar4 + 0x108) + 0x58 + (ulong)uVar10 * 0xa0) == 0) {
            do {
              if (puVar18 == puVar1) goto LAB_1400c537c;
              uVar10 = *puVar18;
              puVar18 = puVar18 + 1;
            } while (*(long *)(*(long *)(lVar4 + 0x108) + 0x58 + (ulong)uVar10 * 0xa0) == 0);
            lVar12 = *(long *)(lVar4 + 0x108) + (ulong)uVar10 * 0xa0;
          }
          else {
            lVar12 = *(long *)(lVar4 + 0x108) + (ulong)uVar10 * 0xa0;
          }
          lVar11 = *(long *)(lVar4 + 0x1a8) + (ulong)*(uint *)(lVar12 + 0x94) * 0x48;
          uVar15 = *(ulong *)(*(long *)(lVar4 + 0x1a8) + 0x40 +
                             (ulong)*(uint *)(lVar12 + 0x94) * 0x48);
          if ((*(ulong *)(lVar19 + 0x110) < uVar15) &&
             (uVar13 = *(ulong *)(*(long *)(lVar11 + 0x38) + *(ulong *)(lVar19 + 0x110) * 8),
             uVar13 != 0)) {
            local_a8 = *(long *)(*(long *)(lVar11 + 0x18) + 0x10 + ~uVar13 * 0x30);
            uVar13 = *(ulong *)(lVar19 + 0x118);
            if (uVar15 <= uVar13) goto LAB_1400c4960;
LAB_1400c4a9b:
            uVar15 = *(ulong *)(*(long *)(lVar11 + 0x38) + uVar13 * 8);
            if (uVar15 == 0) goto LAB_1400c4960;
            local_a0 = *(long *)(*(long *)(lVar11 + 0x18) + 0x10 + ~uVar15 * 0x30);
          }
          else {
            local_a8 = 0;
            uVar13 = *(ulong *)(lVar19 + 0x118);
            if (uVar13 < uVar15) goto LAB_1400c4a9b;
LAB_1400c4960:
            local_a0 = 0;
          }
          lVar11 = func_0x000144e5d7b0();
          local_118 = *(long *)(lVar12 + 0x50);
          uVar21 = *(undefined8 *)(lVar12 + 0x58);
          uVar15 = 0;
          iVar16 = local_8c;
          uVar10 = local_94;
        }
        lVar12 = uVar15 * 0x10;
        uVar15 = (ulong)((int)uVar15 + 1);
        uVar13 = (ulong)~*(uint *)(local_118 + 8 + lVar12);
      } while (uVar10 <= (uint)(iVar16 - *(int *)(lVar11 + uVar13 * 4)));
      pbVar14 = (byte *)(local_a0 + uVar13 * 0x18);
      if ((char *)(local_a8 + uVar13) == (char *)0x0) goto LAB_1400c537c;
    } while ((*(char *)(local_a8 + uVar13) != '\0') ||
            ((*piVar3 == 1 && (fVar22 <= (float)piVar3[1]))));
  }
  else {
    do {
      do {
        uVar13 = uVar15;
        if ((int)uVar13 == (int)uVar21) {
          if (puVar18 == puVar1) {
LAB_1400c537c:
            plVar9 = local_70;
            if (bVar8) {
              func_0x00014543aaa0();
              if (local_2f8 == -1) {
                func_0x0001400b7f50();
                *puVar5 = local_90;
                if (*plVar9 != 0) {
                  func_0x0001400021d0();
                }
                plVar9[2] = local_2e8;
                *(undefined4 *)plVar9 = 0xffffffff;
                *(undefined4 *)((long)plVar9 + 4) = 0xffffffff;
                *(undefined4 *)(plVar9 + 1) = uStack_2f0;
                *(undefined4 *)((long)plVar9 + 0xc) = uStack_2ec;
              }
              else if (local_2f8 != 0) {
                func_0x0001400021d0();
              }
              func_0x000145728850(*(undefined1 *)((long)plVar9 + 0x3a),
                                  *(undefined1 *)((long)plVar9 + 0x39),plVar9,local_f8);
              func_0x000145728850();
              func_0x00014543a2a0();
              func_0x00014542e3f0();
              func_0x000140044cc0();
              *puVar6 = uVar2;
              *(undefined1 *)((long)piVar3 + 0xf) = 0;
              iVar16 = *(int *)(lVar7 + 0x5c);
              *puVar6 = uVar2;
              *piVar3 = 1;
              piVar3[1] = iVar16;
            }
            return;
          }
          uVar15 = (ulong)*puVar18;
          puVar18 = puVar18 + 1;
          lVar11 = *(long *)(lVar4 + 0x1a8);
          if (*(long *)(lVar11 + 0x10 + uVar15 * 0x48) == 0) {
            do {
              if (puVar18 == puVar1) goto LAB_1400c537c;
              uVar10 = *puVar18;
              puVar18 = puVar18 + 1;
            } while (*(long *)(*(long *)(lVar4 + 0x1a8) + 0x10 + (ulong)uVar10 * 0x48) == 0);
            lVar12 = *(long *)(lVar4 + 0x1a8) + (ulong)uVar10 * 0x48;
            puVar17 = (undefined8 *)(lVar12 + 0x10);
            uVar15 = *(ulong *)(lVar19 + 0x110);
            uVar13 = *(ulong *)(lVar12 + 0x40);
            if (uVar15 < uVar13) goto LAB_1400c484b;
LAB_1400c4890:
            local_a8 = 0;
            uVar15 = *(ulong *)(lVar19 + 0x118);
            if (uVar13 <= uVar15) goto LAB_1400c4780;
LAB_1400c48ab:
            uVar15 = *(ulong *)(*(long *)(lVar12 + 0x38) + uVar15 * 8);
            if (uVar15 == 0) goto LAB_1400c4780;
            local_a0 = *(long *)(*(long *)(lVar12 + 0x18) + 0x10 + ~uVar15 * 0x30);
          }
          else {
            lVar12 = lVar11 + uVar15 * 0x48;
            puVar17 = (undefined8 *)(lVar11 + uVar15 * 0x48 + 0x10);
            uVar15 = *(ulong *)(lVar19 + 0x110);
            uVar13 = *(ulong *)(lVar12 + 0x40);
            if (uVar13 <= uVar15) goto LAB_1400c4890;
LAB_1400c484b:
            uVar15 = *(ulong *)(*(long *)(lVar12 + 0x38) + uVar15 * 8);
            if (uVar15 == 0) goto LAB_1400c4890;
            local_a8 = *(long *)(*(long *)(lVar12 + 0x18) + 0x10 + ~uVar15 * 0x30);
            uVar15 = *(ulong *)(lVar19 + 0x118);
            if (uVar15 < uVar13) goto LAB_1400c48ab;
LAB_1400c4780:
            local_a0 = 0;
          }
          lVar11 = func_0x000144e5d7b0();
          uVar21 = *puVar17;
          uVar13 = 0;
          iVar16 = local_8c;
          uVar10 = local_94;
        }
        uVar15 = (ulong)((int)uVar13 + 1);
      } while (uVar10 <= (uint)(iVar16 - *(int *)(lVar11 + uVar13 * 4)));
      pbVar14 = (byte *)(local_a0 + uVar13 * 0x18);
      if ((char *)(local_a8 + uVar13) == (char *)0x0) goto LAB_1400c537c;
    } while ((*(char *)(local_a8 + uVar13) != '\0') ||
            ((*piVar3 == 1 && (fVar22 <= (float)piVar3[1]))));
  }
                    /* WARNING: Could not emulate address calculation at 0x0001400c4b46 */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)((long)*(int *)((ulong)*pbVar14 * 4 + 0x14593f6c0) + 0x14593f6c0))();
  return;
}
