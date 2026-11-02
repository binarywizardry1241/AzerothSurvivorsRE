
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_14595a082(undefined4 param_1,undefined4 param_2,undefined8 param_3,long param_4,
                  undefined8 param_5,undefined4 *param_6,undefined8 param_7)

{
  undefined4 *puVar1;
  undefined8 *puVar2;
  long lVar3;
  undefined4 uVar4;
  long lVar5;
  long unaff_RBP;
  int iVar6;
  long lVar7;
  long lVar8;
  undefined4 uVar9;
  undefined4 uVar10;
  float fVar11;
  undefined8 uVar12;
  float fVar13;
  undefined4 uVar14;
  undefined4 uVar15;
  undefined4 uVar16;
  float fVar17;
  float fVar18;
  undefined4 uVar19;
  undefined4 in_XMM10_Da;
  float in_XMM14_Da;
  float fVar20;
  
  uVar10 = *param_6;
  uVar12 = *(undefined8 *)(param_6 + 1);
  fVar11 = (float)param_6[3];
  fVar20 = in_XMM14_Da * (float)param_6[4];
  func_0x000145957320(param_1,param_2,fVar11,param_3,param_4,*(undefined8 *)(unaff_RBP + 0xf0),
                      param_4,param_7,0);
  uVar9 = func_0x0001459577f0();
  fVar13 = *(float *)(unaff_RBP + 0x178) + 0.0;
  iVar6 = *(int *)(param_4 + 0xa38) + 1;
  *(int *)(param_4 + 0xa38) = iVar6;
  fVar17 = *(float *)(param_4 + 0xa34);
  uVar9 = func_0x0001458d3d80(uVar9,*(undefined4 *)(unaff_RBP + 0x150),in_XMM10_Da);
  lVar3 = *(long *)(param_4 + 0x598);
  if (lVar3 == *(long *)(param_4 + 0x588)) {
    func_0x000145bfad30();
  }
  lVar8 = *(long *)(param_4 + 0x590);
  lVar5 = lVar3 * 0x80;
  *(undefined8 *)(lVar8 + lVar5) = 0;
  *(undefined4 *)(lVar8 + 0x10 + lVar5) = 0;
  *(undefined8 *)(lVar8 + 0x20 + lVar5) = *(undefined8 *)(unaff_RBP + 0x180);
  *(undefined8 *)(lVar8 + 0x28 + lVar5) = 0;
  *(undefined4 *)(lVar8 + 0x30 + lVar5) = 2;
  *(undefined8 *)(lVar8 + 0x34 + lVar5) = uVar12;
  *(int *)(lVar8 + 0x3c + lVar5) = iVar6;
  uVar19 = *(undefined4 *)(unaff_RBP + 0x150);
  uVar14 = *(undefined4 *)(unaff_RBP + 0x154);
  puVar1 = (undefined4 *)(lVar8 + 0x40 + lVar5);
  *puVar1 = uVar19;
  puVar1[1] = uVar14;
  *(undefined4 *)(lVar8 + 0x48 + lVar5) = uVar9;
  *(float *)(lVar8 + 0x4c + lVar5) = fVar13;
  *(float *)(lVar8 + 0x50 + lVar5) = fVar17;
  *(float *)(lVar8 + 0x54 + lVar5) = fVar11 + fVar17;
  *(undefined4 *)(lVar8 + 0x58 + lVar5) = 0;
  *(undefined4 *)(lVar8 + 0x5c + lVar5) = uVar10;
  *(float *)(lVar8 + 0x60 + lVar5) = fVar20;
  *(undefined4 *)(lVar8 + 100 + lVar5) = 0x7f800000;
  lVar7 = lVar3 + 1;
  uVar9 = 0;
  uVar14 = 0;
  uVar15 = 0;
  uVar16 = 0;
  puVar2 = (undefined8 *)(lVar8 + 0x68 + lVar5);
  *puVar2 = 0;
  puVar2[1] = 0;
  *(undefined8 *)(lVar8 + 0x77 + lVar5) = 0;
  *(long *)(param_4 + 0x598) = lVar7;
  fVar18 = _DAT_145de22b8 + *(float *)(unaff_RBP + 0x178);
  iVar6 = *(int *)(param_4 + 0xa38) + 1;
  *(int *)(param_4 + 0xa38) = iVar6;
  fVar13 = *(float *)(param_4 + 0xa34);
  uVar10 = func_0x0001458d3d80(fVar11 + fVar17,uVar19,in_XMM10_Da);
  if (lVar7 == *(long *)(param_4 + 0x588)) {
    func_0x000145bfad30();
  }
  lVar5 = *(long *)(param_4 + 0x590);
  lVar7 = lVar7 * 0x80;
  *(undefined8 *)(lVar5 + lVar7) = 0;
  *(undefined4 *)(lVar5 + 0x10 + lVar7) = 0;
  *(undefined8 *)(lVar5 + 0x20 + lVar7) = *(undefined8 *)(unaff_RBP + 0x180);
  *(undefined8 *)(lVar5 + 0x28 + lVar7) = 0;
  *(undefined4 *)(lVar5 + 0x30 + lVar7) = 2;
  *(undefined8 *)(lVar5 + 0x34 + lVar7) = uVar12;
  *(int *)(lVar5 + 0x3c + lVar7) = iVar6;
  uVar19 = *(undefined4 *)(unaff_RBP + 0x150);
  uVar4 = *(undefined4 *)(unaff_RBP + 0x154);
  puVar1 = (undefined4 *)(lVar5 + 0x40 + lVar7);
  *puVar1 = uVar19;
  puVar1[1] = uVar4;
  *(undefined4 *)(lVar5 + 0x48 + lVar7) = uVar10;
  *(float *)(lVar5 + 0x4c + lVar7) = fVar18;
  *(float *)(lVar5 + 0x50 + lVar7) = fVar13;
  *(float *)(lVar5 + 0x54 + lVar7) = fVar11 + fVar13;
  *(undefined8 *)(lVar5 + 0x58 + lVar7) = 0;
  *(float *)(lVar5 + 0x60 + lVar7) = fVar20;
  *(undefined4 *)(lVar5 + 100 + lVar7) = 0x7f800000;
  lVar8 = lVar3 + 2;
  puVar1 = (undefined4 *)(lVar5 + 0x68 + lVar7);
  *puVar1 = uVar9;
  puVar1[1] = uVar14;
  puVar1[2] = uVar15;
  puVar1[3] = uVar16;
  *(undefined8 *)(lVar5 + 0x77 + lVar7) = 0;
  *(long *)(param_4 + 0x598) = lVar8;
  fVar18 = _DAT_145de23a0 + *(float *)(unaff_RBP + 0x178);
  iVar6 = *(int *)(param_4 + 0xa38) + 1;
  *(int *)(param_4 + 0xa38) = iVar6;
  fVar17 = *(float *)(param_4 + 0xa34);
  uVar10 = func_0x0001458d3d80(fVar11 + fVar13,uVar19,in_XMM10_Da);
  if (lVar8 == *(long *)(param_4 + 0x588)) {
    func_0x000145bfad30();
  }
  lVar5 = *(long *)(param_4 + 0x590);
  lVar8 = lVar8 * 0x80;
  *(undefined8 *)(lVar5 + lVar8) = 0;
  *(undefined4 *)(lVar5 + 0x10 + lVar8) = 0;
  *(undefined8 *)(lVar5 + 0x20 + lVar8) = *(undefined8 *)(unaff_RBP + 0x180);
  *(undefined8 *)(lVar5 + 0x28 + lVar8) = 0;
  *(undefined4 *)(lVar5 + 0x30 + lVar8) = 2;
  *(undefined8 *)(lVar5 + 0x34 + lVar8) = uVar12;
  *(int *)(lVar5 + 0x3c + lVar8) = iVar6;
  uVar9 = *(undefined4 *)(unaff_RBP + 0x150);
  uVar19 = *(undefined4 *)(unaff_RBP + 0x154);
  puVar1 = (undefined4 *)(lVar5 + 0x40 + lVar8);
  *puVar1 = uVar9;
  puVar1[1] = uVar19;
  *(undefined4 *)(lVar5 + 0x48 + lVar8) = uVar10;
  *(float *)(lVar5 + 0x4c + lVar8) = fVar18;
  *(float *)(lVar5 + 0x50 + lVar8) = fVar17;
  *(float *)(lVar5 + 0x54 + lVar8) = fVar11 + fVar17;
  *(undefined8 *)(lVar5 + 0x58 + lVar8) = 0;
  *(float *)(lVar5 + 0x60 + lVar8) = fVar20;
  *(undefined4 *)(lVar5 + 100 + lVar8) = 0x7f800000;
  lVar7 = lVar3 + 3;
  uVar19 = 0;
  uVar14 = 0;
  uVar15 = 0;
  uVar16 = 0;
  puVar2 = (undefined8 *)(lVar5 + 0x68 + lVar8);
  *puVar2 = 0;
  puVar2[1] = 0;
  *(undefined8 *)(lVar5 + 0x77 + lVar8) = 0;
  *(long *)(param_4 + 0x598) = lVar7;
  fVar13 = *(float *)(unaff_RBP + 0x178) + _DAT_147229980;
  *(float *)(unaff_RBP + 0x178) = fVar13;
  iVar6 = *(int *)(param_4 + 0xa38) + 1;
  *(int *)(param_4 + 0xa38) = iVar6;
  fVar17 = *(float *)(param_4 + 0xa34);
  uVar10 = func_0x0001458d3d80(fVar13,uVar9,in_XMM10_Da);
  if (lVar7 == *(long *)(param_4 + 0x588)) {
    func_0x000145bfad30();
  }
  lVar8 = *(long *)(param_4 + 0x590);
  lVar7 = lVar7 * 0x80;
  *(undefined8 *)(lVar8 + lVar7) = 0;
  *(undefined4 *)(lVar8 + 0x10 + lVar7) = 0;
  *(undefined8 *)(lVar8 + 0x20 + lVar7) = *(undefined8 *)(unaff_RBP + 0x180);
  *(undefined8 *)(lVar8 + 0x28 + lVar7) = 0;
  *(undefined4 *)(lVar8 + 0x30 + lVar7) = 2;
  *(undefined8 *)(lVar8 + 0x34 + lVar7) = uVar12;
  *(int *)(lVar8 + 0x3c + lVar7) = iVar6;
  *(undefined8 *)(lVar8 + 0x40 + lVar7) = *(undefined8 *)(unaff_RBP + 0x150);
  *(undefined4 *)(lVar8 + 0x48 + lVar7) = uVar10;
  *(undefined4 *)(lVar8 + 0x4c + lVar7) = *(undefined4 *)(unaff_RBP + 0x178);
  *(float *)(lVar8 + 0x50 + lVar7) = fVar17;
  *(float *)(lVar8 + 0x54 + lVar7) = fVar11 + fVar17;
  *(undefined8 *)(lVar8 + 0x58 + lVar7) = 0;
  *(float *)(lVar8 + 0x60 + lVar7) = fVar20;
  *(undefined4 *)(lVar8 + 100 + lVar7) = 0x7f800000;
  puVar1 = (undefined4 *)(lVar8 + 0x68 + lVar7);
  *puVar1 = uVar19;
  puVar1[1] = uVar14;
  puVar1[2] = uVar15;
  puVar1[3] = uVar16;
  *(undefined8 *)(lVar8 + 0x77 + lVar7) = 0;
  *(long *)(param_4 + 0x598) = lVar3 + 4;
  return;
}

