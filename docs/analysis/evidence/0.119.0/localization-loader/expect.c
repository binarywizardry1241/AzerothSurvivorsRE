/* Ghidra raw-binary import; external memory/callees absent; inferred ABI.
 * Original PE instructions govern Windows-x64 arguments and globals. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 *param_4,byte param_5)

{
  byte bVar1;
  undefined2 uVar2;
  ulong uVar3;
  ulong uVar4;
  long lVar5;
  ulong uVar6;
  long lVar7;
  long lVar8;
  long lVar9;
  long lVar10;
  char cVar14;
  char cVar15;
  undefined1 auVar11 [16];
  undefined1 auVar12 [16];
  undefined1 auVar13 [16];
  undefined1 auVar16 [16];
  undefined8 local_a0;
  undefined8 local_98;
  long local_90;
  undefined8 local_88;
  undefined8 local_80;
  uint local_78;
  undefined4 uStack_74;
  undefined8 uStack_70;
  undefined8 local_68;
  uint *local_60;
  undefined8 local_58;
  undefined8 *local_50;
  undefined8 local_48;
  long local_40;
  undefined8 local_38;
  undefined8 local_30;

  local_30 = 0xfffffffffffffffe;
  uVar3 = param_3[1];
  uVar6 = param_3[2];
  if (uVar6 < uVar3) {
    lVar5 = *param_3;
    bVar1 = *(byte *)(lVar5 + uVar6);
    param_3[2] = uVar6 + 1;
    if (bVar1 == param_5) {
      *param_4 = 0xffffffffffffffff;
      return;
    }
  }
  else {
    param_3[2] = uVar6 + 1;
    lVar5 = *param_3;
  }
  uVar6 = uVar6 + 1;
  local_78 = (uint)param_5;
  local_60 = &local_78;
  local_58 = 0x145f7a600;
  func_0x000145f66f30(uVar6,param_4,0x1472ddf3d,&local_90,&local_60);
  local_a0 = local_88;
  local_98 = local_80;
  if (uVar3 < uVar6) {
    uVar6 = uVar3;
  }
  local_38 = local_88;
  if (uVar6 == 0) {
    local_40 = 0;
  }
  else {
    if (3 < uVar6) {
      uVar3 = uVar6 & 0xfffffffffffffffc;
      lVar7 = 0;
      lVar8 = 0;
      uVar4 = 0;
      lVar9 = 0;
      lVar10 = 0;
      do {
        uVar2 = *(undefined2 *)(lVar5 + 2 + uVar4);
        auVar11[0] = -((char)*(undefined2 *)(lVar5 + uVar4) == DAT_1463e2fc0);
        cVar14 = -((char)((ushort)*(undefined2 *)(lVar5 + uVar4) >> 8) == cRam00000001463e2fc1);
        cVar15 = -(cRam00000001463e2fc7 == '\0');
        auVar11._8_8_ =
             (undefined8)
             (CONCAT72(CONCAT61(CONCAT51(CONCAT41(CONCAT31(CONCAT21(CONCAT11(cVar15,cVar15),
                                                                    -(cRam00000001463e2fc6 == '\0'))
                                                           ,-(cRam00000001463e2fc6 == '\0')),
                                                  -(cRam00000001463e2fc5 == '\0')),
                                         -(cRam00000001463e2fc5 == '\0')),
                                -(cRam00000001463e2fc4 == '\0')),
                       CONCAT11(-(cRam00000001463e2fc4 == '\0'),cVar15)) >> 8);
        auVar11[7] = -(cRam00000001463e2fc3 == '\0');
        auVar11[6] = -(cRam00000001463e2fc3 == '\0');
        auVar11[5] = -(cRam00000001463e2fc2 == '\0');
        auVar11[4] = -(cRam00000001463e2fc2 == '\0');
        auVar11[3] = cVar14;
        auVar11[2] = cVar14;
        auVar11[1] = auVar11[0];
        auVar11 = pshuflw(auVar11,auVar11,0xd4);
        auVar12._12_4_ = auVar11._12_4_;
        auVar12._0_8_ = auVar11._0_8_;
        auVar12._8_4_ = auVar11._4_4_;
        auVar12 = auVar12 & _DAT_146163e10;
        lVar9 = lVar9 + auVar12._0_8_;
        lVar10 = lVar10 + auVar12._8_8_;
        auVar16[0] = -((char)uVar2 == DAT_1463e2fc0);
        cVar14 = -((char)((ushort)uVar2 >> 8) == cRam00000001463e2fc1);
        cVar15 = -(cRam00000001463e2fc7 == '\0');
        auVar16._8_8_ =
             (undefined8)
             (CONCAT72(CONCAT61(CONCAT51(CONCAT41(CONCAT31(CONCAT21(CONCAT11(cVar15,cVar15),
                                                                    -(cRam00000001463e2fc6 == '\0'))
                                                           ,-(cRam00000001463e2fc6 == '\0')),
                                                  -(cRam00000001463e2fc5 == '\0')),
                                         -(cRam00000001463e2fc5 == '\0')),
                                -(cRam00000001463e2fc4 == '\0')),
                       CONCAT11(-(cRam00000001463e2fc4 == '\0'),cVar15)) >> 8);
        auVar16[7] = -(cRam00000001463e2fc3 == '\0');
        auVar16[6] = -(cRam00000001463e2fc3 == '\0');
        auVar16[5] = -(cRam00000001463e2fc2 == '\0');
        auVar16[4] = -(cRam00000001463e2fc2 == '\0');
        auVar16[3] = cVar14;
        auVar16[2] = cVar14;
        auVar16[1] = auVar16[0];
        auVar11 = pshuflw(auVar12,auVar16,0xd4);
        auVar13._12_4_ = auVar11._12_4_;
        auVar13._0_8_ = auVar11._0_8_;
        auVar13._8_4_ = auVar11._4_4_;
        lVar7 = lVar7 + SUB168(auVar13 & _DAT_146163e10,0);
        lVar8 = lVar8 + SUB168(auVar13 & _DAT_146163e10,8);
        uVar4 = uVar4 + 4;
      } while (uVar3 != uVar4);
      local_40 = lVar8 + lVar10 + lVar7 + lVar9;
      goto LAB_145b27501;
    }
    uVar3 = 0;
    local_40 = 0;
    do {
      local_40 = local_40 + (ulong)(*(char *)(lVar5 + uVar3) == '\n');
      uVar3 = uVar3 + 1;
LAB_145b27501:
    } while (uVar6 != uVar3);
  }
  local_40 = local_40 + 1;
  local_60 = (uint *)&local_40;
  local_58 = 0x145f798d0;
  local_50 = &local_a0;
  local_48 = 0x1400020c0;
  func_0x000145f66f30();
  param_4[2] = local_68;
  *param_4 = CONCAT44(uStack_74,local_78);
  param_4[1] = uStack_70;
  if (local_90 != 0) {
    func_0x0001400021d0();
  }
  return;
}
