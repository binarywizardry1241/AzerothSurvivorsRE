
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined1  [16]
entry(undefined8 param_1,undefined8 param_2,ulong param_3,long *param_4,ulong param_5)

{
  undefined8 uVar1;
  undefined8 uVar2;
  int iVar3;
  uint uVar4;
  long lVar5;
  int *piVar6;
  ulong uVar7;
  ulong uVar8;
  long lVar9;
  ulong uVar10;
  ulong uVar11;
  ulong uVar12;
  long lVar13;
  undefined1 auVar14 [16];
  undefined1 auVar15 [16];
  long lVar16;
  undefined1 auVar17 [16];
  long lVar18;
  undefined1 auVar19 [16];
  long lVar20;
  undefined1 auVar21 [16];
  int iVar22;
  undefined8 in_XMM6_Qa;
  undefined1 auVar23 [16];
  undefined1 local_e9;
  long local_e8;
  long local_e0;
  ulong local_d8;
  long local_d0;
  long local_c8;
  long local_c0;
  long local_b8;
  long local_b0;
  long local_a8;
  undefined8 local_98;
  undefined8 local_70;
  undefined8 local_68;
  undefined1 *local_60;
  undefined8 local_58;

  lVar5 = *param_4;
  if (lVar5 != param_4[1]) {
    local_c8 = param_4[2];
    local_d0 = ((ulong)(param_4[1] - lVar5) >> 4) * -0x71c71c71c71c71c7;
    lVar9 = 0;
    auVar23 = _DAT_145db8840;
    local_58 = in_XMM6_Qa;
    do {
      lVar13 = local_c8;
      local_e9 = *(undefined1 *)(lVar5 + 0x8c + lVar9 * 0x90);
      local_c0 = 0;
      local_98 = 0;
      local_70 = 0x14721f9b0;
      local_68 = 0x14721f9e0;
      local_60 = &local_e9;
      func_0x0001459d3570();
      local_a8 = local_e0 + local_d8 * 4;
      local_c0 = local_e0;
      local_b8 = local_e0;
      local_b0 = local_e8;
      func_0x0001459ebde0();
      uVar7 = local_d8;
      if (local_d8 == 0) {
        uVar12 = 0;
      }
      else {
        uVar8 = *(ulong *)(lVar13 + 0x40);
        if (uVar8 == 0) {
          uVar12 = 0;
        }
        else {
          piVar6 = *(int **)(lVar13 + 0x38);
          if (uVar8 == 1) {
            iVar3 = *piVar6;
            if (3 < local_d8) {
              uVar8 = local_d8 & 0xfffffffffffffffc;
              lVar13 = 0;
              lVar16 = 0;
              uVar12 = 0;
              lVar18 = 0;
              lVar20 = 0;
              do {
                uVar1 = *(undefined8 *)(local_e0 + uVar12 * 4);
                uVar2 = *(undefined8 *)(local_e0 + 8 + uVar12 * 4);
                auVar15._0_4_ = -(uint)((int)uVar1 == iVar3);
                auVar15._4_4_ = -(uint)((int)((ulong)uVar1 >> 0x20) == iVar3);
                auVar15._12_4_ = -(uint)(iVar3 == 0);
                auVar15._8_4_ = auVar15._4_4_;
                lVar18 = lVar18 + SUB168(auVar15 & auVar23,0);
                lVar20 = lVar20 + SUB168(auVar15 & auVar23,8);
                iVar22 = -(uint)((int)((ulong)uVar2 >> 0x20) == iVar3);
                auVar21._4_4_ = iVar22;
                auVar21._0_4_ = -(uint)((int)uVar2 == iVar3);
                auVar21._8_4_ = iVar22;
                auVar21._12_4_ = -(uint)(iVar3 == 0);
                lVar13 = lVar13 + SUB168(auVar21 & auVar23,0);
                lVar16 = lVar16 + SUB168(auVar21 & auVar23,8);
                uVar12 = uVar12 + 4;
              } while (uVar8 != uVar12);
              uVar12 = lVar16 + lVar20 + lVar13 + lVar18;
              goto LAB_1459f5230;
            }
            uVar8 = 0;
            uVar12 = 0;
            do {
              uVar12 = uVar12 + (iVar3 == *(int *)(local_e0 + uVar8 * 4));
              uVar8 = uVar8 + 1;
LAB_1459f5230:
            } while (local_d8 != uVar8);
          }
          else {
            uVar10 = 0;
            uVar12 = 0;
            do {
              uVar4 = *(uint *)(local_e0 + uVar10 * 4);
              uVar11 = uVar8;
              lVar13 = 0;
              do {
                lVar16 = lVar13 + (uVar11 >> 1);
                if (uVar4 < (uint)piVar6[lVar16]) {
                  lVar16 = lVar13;
                }
                uVar11 = uVar11 - (uVar11 >> 1);
                lVar13 = lVar16;
              } while (1 < uVar11);
              uVar12 = uVar12 + (piVar6[lVar16] == uVar4);
              uVar10 = uVar10 + 1;
            } while (uVar10 != local_d8);
          }
        }
      }
      if (local_e8 != 0) {
        func_0x0001400021d0();
      }
      auVar14._0_4_ = (float)param_3;
      auVar19._0_4_ = (float)(param_5 + (param_5 == 0));
      auVar19._4_4_ = (float)(long)(uVar7 + (uVar7 == 0));
      auVar19._8_8_ = 0;
      auVar14._4_4_ = (float)uVar12;
      auVar14._8_8_ = 0;
      auVar15 = divps(auVar14,auVar19);
      auVar17._0_4_ = (uint)(auVar15._0_4_ >> 0x1f) >> 1;
      auVar17._4_4_ = (uint)(auVar15._4_4_ >> 0x1f) >> 1;
      auVar17._8_4_ = (uint)(auVar15._8_4_ >> 0x1f) >> 1;
      auVar17._12_4_ = (uint)(auVar15._12_4_ >> 0x1f) >> 1;
      if (SUB164(auVar17 ^ auVar15,0) <= SUB164(auVar17 ^ auVar15,4)) {
        param_3 = uVar12;
        param_5 = uVar7;
      }
      lVar9 = lVar9 + 1;
    } while (lVar9 != local_d0);
  }
  auVar23._8_8_ = param_5;
  auVar23._0_8_ = param_3;
  return auVar23;
}
