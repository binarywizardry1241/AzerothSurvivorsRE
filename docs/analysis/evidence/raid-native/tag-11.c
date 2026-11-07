
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_14595a66c(undefined8 param_1,long param_2,undefined8 param_3,undefined4 *param_4)

{
  code *pcVar1;
  undefined1 auVar2 [16];
  float fVar3;
  ulong uVar4;
  float *unaff_RBP;
  float fVar5;
  float fVar6;
  undefined1 auVar7 [16];
  float fVar8;
  undefined4 uVar9;
  undefined4 uVar10;
  undefined4 uVar11;
  float fVar12;
  float fVar13;
  float fVar14;
  float in_XMM14_Da;
  float in_XMM15_Da;
  
  fVar5 = (float)param_4[1];
  fVar6 = (float)param_4[2];
  fVar8 = (float)param_4[3];
  uVar9 = 0;
  uVar10 = 0;
  uVar11 = 0;
  fVar12 = (float)param_4[4];
  fVar14 = (float)param_4[6];
  fVar13 = (float)param_4[7];
  func_0x0001459577f0(fVar5,param_2,*(undefined8 *)(unaff_RBP + 0x60),param_2,*param_4);
  fVar3 = 0.0;
  if (0.0 < fVar14) {
    *unaff_RBP = in_XMM15_Da + fVar12 + fVar14;
    unaff_RBP[1] = fVar13 * in_XMM14_Da;
    unaff_RBP[2] = fVar5;
    fVar3 = 2.8026e-45;
  }
  unaff_RBP[-1] = fVar3;
  unaff_RBP[0x45] = fVar6;
  unaff_RBP[0x44] = 0.0;
  uVar4 = func_0x0001459575e0();
  if (uVar4 < *(ulong *)(param_2 + 0x598)) {
    fVar6 = fVar8;
    if (fVar12 + _DAT_145de79f4 <= fVar8) {
      fVar6 = fVar12 + _DAT_145de79f4;
    }
    auVar7._0_4_ = -(uint)NAN(fVar6) & (uint)fVar8;
    auVar7._4_4_ = uVar9;
    auVar7._8_4_ = uVar10;
    auVar7._12_4_ = uVar11;
    auVar7 = auVar7 | ZEXT416(~-(uint)NAN(fVar6) & (uint)fVar6);
    if (auVar7._0_4_ <= 0.0) {
      auVar2._12_4_ = 0;
      auVar2._0_12_ = auVar7._4_12_;
      auVar7 = auVar2 << 0x20;
    }
    *(float *)(*(long *)(param_2 + 0x590) + 0x58 + uVar4 * 0x80) = in_XMM15_Da + auVar7._0_4_;
    return;
  }
  func_0x000145d99653();
                    /* WARNING: Does not return */
  pcVar1 = (code *)invalidInstructionException();
  (*pcVar1)();
}

