
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 entry(long param_1,long param_2,undefined8 param_3,uint param_4)

{
  long lVar1;
  undefined8 uVar2;
  uint uVar3;
  ulong uVar4;
  long unaff_RBP;
  undefined8 *puVar5;
  ulong uVar6;
  long lVar7;
  long lVar8;
  uint uVar9;
  undefined8 *unaff_R14;
  ulong uVar10;
  float fVar11;
  float fVar12;
  float in_XMM7_Da;
  float fVar13;
  float in_XMM10_Da;
  float fVar14;
  float fVar15;
  float fVar16;
  undefined8 uStack0000000000000020;
  ulong uStack0000000000000028;
  
  uVar3 = 3;
  if (param_4 < 3) {
    uVar3 = param_4;
  }
  *(ulong *)(unaff_RBP + 0x18) = (ulong)(uVar3 + 1);
  *(undefined4 *)(unaff_RBP + 0x98) = *(undefined4 *)(unaff_R14 + 1);
  *(undefined8 *)(unaff_RBP + 0x90) = *unaff_R14;
  uStack0000000000000028 = 0;
  uStack0000000000000020 = 8;
  func_0x0001454ee0d0(param_1,param_2,param_1,unaff_RBP + 0xe0);
  uVar2 = *(undefined8 *)(unaff_RBP + 0xe0);
  lVar8 = *(long *)(unaff_RBP + 0xe8);
  lVar1 = *(long *)(unaff_RBP + 0xf0);
  *(long *)(unaff_RBP + 0xe0) = lVar8;
  *(long *)(unaff_RBP + 0xe8) = lVar8;
  *(undefined8 *)(unaff_RBP + 0xf0) = uVar2;
  *(long *)(unaff_RBP + 0xf8) = lVar8 + lVar1 * 8;
  *(long *)(unaff_RBP + 0x100) = param_1;
  *(long *)(unaff_RBP + 0x108) = param_1;
  func_0x00014552c020();
  lVar8 = *(long *)(unaff_RBP + 0xc0);
  uVar10 = *(ulong *)(unaff_RBP + 200);
  *(long *)(unaff_RBP + 0xe0) = unaff_RBP + 0x3f;
  if (uVar10 < 2) {
    lVar1 = *(long *)(unaff_RBP + 0xb8);
    if (uVar10 != 0) goto LAB_1454e91e6;
  }
  else {
    *(long *)(unaff_RBP + 0x118) = lVar8;
    if (uVar10 < 0x15) {
      func_0x0001454f4dd0();
    }
    else {
      func_0x000145539b90();
    }
    lVar1 = *(long *)(unaff_RBP + 0xb8);
    param_2 = *(long *)(unaff_RBP + 0x88);
    lVar8 = *(long *)(unaff_RBP + 0x118);
LAB_1454e91e6:
    if (uVar10 - 1 < 3) {
      uVar4 = 0;
    }
    else {
      puVar5 = (undefined8 *)(lVar8 + 0x38);
      uVar4 = 0;
      do {
        *(undefined8 *)(lVar8 + uVar4 * 8) = puVar5[-6];
        *(undefined8 *)(lVar8 + 8 + uVar4 * 8) = puVar5[-4];
        *(undefined8 *)(lVar8 + 0x10 + uVar4 * 8) = puVar5[-2];
        *(undefined8 *)(lVar8 + 0x18 + uVar4 * 8) = *puVar5;
        uVar4 = uVar4 + 4;
        puVar5 = puVar5 + 8;
      } while ((uVar10 & 0xfffffffffffffffc) != uVar4);
      if ((uVar10 & 3) == 0) goto LAB_1454e95a1;
    }
    uVar6 = 0;
    do {
      *(undefined8 *)(lVar8 + uVar4 * 8 + uVar6) =
           *(undefined8 *)(uVar4 * 0x10 + lVar8 + 8 + uVar6 * 2);
      uVar6 = uVar6 + 8;
    } while (((uint)uVar10 & 3) << 3 != uVar6);
  }
LAB_1454e95a1:
  *(long *)(unaff_RBP + 0xe0) = lVar8;
  *(long *)(unaff_RBP + 0xe8) = lVar8;
  *(long *)(unaff_RBP + 0xf0) = lVar1 * 2;
  *(ulong *)(unaff_RBP + 0xf8) = lVar8 + uVar10 * 8;
  *(long *)(unaff_RBP + 0x100) = param_1 + 0x4c0;
  *(long *)(unaff_RBP + 0x108) = param_2;
  *(long *)(unaff_RBP + 0x110) = unaff_RBP + 0x18;
  func_0x00014552d410();
  uVar10 = *(ulong *)(unaff_RBP + 0x60);
  if (uVar10 == 0) {
    if (*(long *)(unaff_RBP + 0x50) != 0) {
      func_0x0001400021d0();
    }
    return 0;
  }
  *(undefined8 *)(unaff_RBP + 0x118) = *(undefined8 *)(unaff_RBP + 0x58);
  *(long *)(unaff_RBP + 0xe0) = unaff_RBP + 0x3f;
  if (uVar10 != 1) {
    if (uVar10 < 0x15) {
      func_0x0001421b8170();
      param_2 = *(long *)(unaff_RBP + 0x88);
    }
    else {
      *(undefined1 *)(unaff_RBP + 0x87) = 1;
      func_0x000145539ed0();
      param_2 = *(long *)(unaff_RBP + 0x88);
    }
  }
  lVar8 = *(long *)(unaff_RBP + 0x50);
  lVar1 = *(long *)(unaff_RBP + 0x78);
  if (uVar10 < 4) {
    uVar4 = 0;
    lVar7 = *(long *)(unaff_RBP + 0x118);
  }
  else {
    lVar7 = *(long *)(unaff_RBP + 0x118);
    puVar5 = (undefined8 *)(lVar7 + 0x38);
    uVar4 = 0;
    do {
      *(undefined8 *)(lVar7 + uVar4 * 8) = puVar5[-6];
      *(undefined8 *)(lVar7 + 8 + uVar4 * 8) = puVar5[-4];
      *(undefined8 *)(lVar7 + 0x10 + uVar4 * 8) = puVar5[-2];
      *(undefined8 *)(lVar7 + 0x18 + uVar4 * 8) = *puVar5;
      uVar4 = uVar4 + 4;
      puVar5 = puVar5 + 8;
    } while ((uVar10 & 0x7fffffffffffffc) != uVar4);
    if ((uVar10 & 3) == 0) goto LAB_1454e96d1;
  }
  uVar6 = 0;
  do {
    *(undefined8 *)(lVar7 + uVar4 * 8 + uVar6) =
         *(undefined8 *)(uVar4 * 0x10 + lVar7 + 8 + uVar6 * 2);
    uVar6 = uVar6 + 8;
  } while (((uint)uVar10 & 3) << 3 != uVar6);
LAB_1454e96d1:
  *(long *)(unaff_RBP + 0x88) = lVar8;
  *(long *)(unaff_RBP + 0x48) = lVar8 << 4;
  if (1 < uVar10) {
    uVar10 = 1;
  }
  fVar13 = *(float *)(param_2 + 0x58);
  fVar14 = _DAT_1458f8d40 * fVar13 * *(float *)(lVar1 + 0x20) * *(float *)(lVar1 + 0x48);
  in_XMM7_Da = in_XMM7_Da + _DAT_1458eb480;
  fVar15 = fVar13 / (float)(*(int *)(param_2 + 0x5c) + (uint)(*(int *)(param_2 + 0x5c) == 0));
  fVar11 = fVar15;
  if (fVar15 <= _DAT_14594f310) {
    fVar11 = _DAT_14594f310;
  }
  fVar12 = _DAT_1458eb480;
  fVar16 = _DAT_14594f310;
  fVar11 = (float)func_0x000145756e1f(fVar14 / fVar11);
  if (fVar11 <= fVar12) {
    fVar11 = fVar12;
  }
  if (fVar13 <= fVar16) {
    fVar13 = fVar16;
  }
  fVar12 = (float)func_0x000145756e1f(in_XMM7_Da * fVar11);
  lVar8 = 0;
  uVar3 = (uint)(long)fVar12;
  if (fVar12 < 0.0) {
    uVar3 = 0;
  }
  uVar9 = 0xffffffff;
  if (fVar12 <= _DAT_1458eb51c) {
    uVar9 = uVar3;
  }
  in_XMM7_Da = in_XMM7_Da * in_XMM10_Da * (fVar14 / fVar13);
  fVar13 = (float)uVar9 * ((fVar11 * fVar15) / fVar12);
  do {
    uVar2 = *(undefined8 *)(*(long *)(unaff_RBP + 0x118) + lVar8);
    uVar3 = *(int *)(param_2 + 0x68) - 1;
    if (uVar3 < 10) {
                    /* WARNING: Could not emulate address calculation at 0x0001454e97e5 */
                    /* WARNING: Treating indirect jump as call */
      uVar2 = (*(code *)((long)*(int *)((ulong)uVar3 * 4 + 0x1469acf74) + 0x1469acf74))();
      return uVar2;
    }
    *(undefined4 *)(unaff_RBP + 0xc0) = *(undefined4 *)(param_2 + 0x70);
    *(undefined8 *)(unaff_RBP + 0xb8) = *(undefined8 *)(param_2 + 0x68);
    *(ulong *)(unaff_RBP + 0xe4) = CONCAT44(fVar13,in_XMM7_Da);
    *(uint *)(unaff_RBP + 0xec) = uVar9;
    *(undefined4 *)(unaff_RBP + 0xe0) = 1;
    uStack0000000000000028 = uStack0000000000000028 & 0xffffffff00000000;
    uStack0000000000000020 = uVar2;
    func_0x0001454ef3b0();
    lVar8 = lVar8 + 8;
  } while (uVar10 * 8 != lVar8);
  if (*(long *)(unaff_RBP + 0x88) != 0) {
    func_0x0001400021d0();
  }
  return 1;
}

