
void FUN_1459592f4(undefined8 param_1,long param_2,undefined8 param_3,long *param_4)

{
  undefined4 *puVar1;
  undefined8 *puVar2;
  long lVar3;
  long lVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  undefined4 uVar8;
  undefined4 uVar9;
  undefined4 uVar10;
  undefined4 uVar11;
  undefined4 uVar12;
  undefined4 uVar13;
  undefined4 uVar14;
  undefined4 uVar15;
  undefined8 uVar16;
  undefined8 uVar17;
  undefined8 uVar18;
  undefined8 uVar19;
  undefined8 uVar20;
  long lVar21;
  long unaff_RBP;
  undefined4 *puVar22;
  undefined4 *puVar23;
  long lVar24;
  ulong uVar25;
  long lVar26;
  float fVar27;
  float fVar28;
  
  lVar3 = param_4[1];
  if (lVar3 != 0) {
    puVar22 = (undefined4 *)*param_4;
    fVar27 = *(float *)(param_4 + 2);
    uVar5 = *puVar22;
    uVar6 = puVar22[1];
    uVar7 = puVar22[2];
    uVar8 = puVar22[3];
    uVar9 = puVar22[4];
    uVar10 = puVar22[5];
    uVar11 = puVar22[6];
    uVar12 = puVar22[7];
    uVar13 = puVar22[9];
    uVar14 = puVar22[10];
    uVar15 = puVar22[0xb];
    *(undefined4 *)(unaff_RBP + 0x130) = puVar22[8];
    *(undefined4 *)(unaff_RBP + 0x134) = uVar13;
    *(undefined4 *)(unaff_RBP + 0x138) = uVar14;
    *(undefined4 *)(unaff_RBP + 0x13c) = uVar15;
    *(undefined4 *)(unaff_RBP + 0x120) = uVar9;
    *(undefined4 *)(unaff_RBP + 0x124) = uVar10;
    *(undefined4 *)(unaff_RBP + 0x128) = uVar11;
    *(undefined4 *)(unaff_RBP + 300) = uVar12;
    *(undefined4 *)(unaff_RBP + 0x110) = uVar5;
    *(undefined4 *)(unaff_RBP + 0x114) = uVar6;
    *(undefined4 *)(unaff_RBP + 0x118) = uVar7;
    *(undefined4 *)(unaff_RBP + 0x11c) = uVar8;
    entry(puVar22,param_2,*(undefined8 *)(unaff_RBP + 0xf0),param_2,unaff_RBP + 0x110);
    if (lVar3 != 1) {
      puVar23 = (undefined4 *)(unaff_RBP + 0x114);
      lVar24 = *(long *)(param_2 + 0x5b0);
      uVar25 = lVar24 << 6 | 0xc;
      lVar21 = 1;
      lVar26 = 0x30;
      *(undefined4 **)(unaff_RBP + 0x178) = puVar22;
      do {
        fVar28 = *(float *)(param_2 + 0xa34);
        puVar1 = (undefined4 *)((long)puVar22 + lVar26);
        uVar5 = *puVar1;
        uVar6 = puVar1[1];
        uVar7 = puVar1[2];
        uVar8 = puVar1[3];
        puVar1 = (undefined4 *)((long)puVar22 + lVar26 + 0x10);
        uVar9 = *puVar1;
        uVar10 = puVar1[1];
        uVar11 = puVar1[2];
        uVar12 = puVar1[3];
        puVar1 = (undefined4 *)((long)puVar22 + lVar26 + 0x20);
        uVar13 = puVar1[1];
        uVar14 = puVar1[2];
        uVar15 = puVar1[3];
        puVar23[8] = *puVar1;
        puVar23[9] = uVar13;
        puVar23[10] = uVar14;
        puVar23[0xb] = uVar15;
        puVar23[4] = uVar9;
        puVar23[5] = uVar10;
        puVar23[6] = uVar11;
        puVar23[7] = uVar12;
        *puVar23 = uVar5;
        puVar23[1] = uVar6;
        puVar23[2] = uVar7;
        puVar23[3] = uVar8;
        if (lVar24 == *(long *)(param_2 + 0x5a0)) {
          func_0x000145c26670();
          puVar22 = *(undefined4 **)(unaff_RBP + 0x178);
        }
        lVar4 = *(long *)(param_2 + 0x5a8);
        *(undefined8 *)(lVar4 + -0xc + uVar25) = *(undefined8 *)(unaff_RBP + 0x180);
        *(float *)(lVar4 + -4 + uVar25) = (float)lVar21 * fVar27 + fVar28;
        uVar16 = *(undefined8 *)(unaff_RBP + 0x118);
        uVar17 = *(undefined8 *)(unaff_RBP + 0x120);
        uVar18 = *(undefined8 *)(unaff_RBP + 0x128);
        uVar19 = *(undefined8 *)(unaff_RBP + 0x130);
        uVar20 = *(undefined8 *)(unaff_RBP + 0x138);
        *(undefined8 *)(lVar4 + uVar25) = *(undefined8 *)(unaff_RBP + 0x110);
        ((undefined8 *)(lVar4 + uVar25))[1] = uVar16;
        puVar2 = (undefined8 *)(lVar4 + 0x10 + uVar25);
        *puVar2 = uVar17;
        puVar2[1] = uVar18;
        puVar2 = (undefined8 *)(lVar4 + 0x20 + uVar25);
        *puVar2 = uVar19;
        puVar2[1] = uVar20;
        *(undefined4 *)(lVar4 + 0x30 + uVar25) = *(undefined4 *)(unaff_RBP + 0x140);
        lVar24 = lVar24 + 1;
        *(long *)(param_2 + 0x5b0) = lVar24;
        uVar25 = uVar25 + 0x40;
        lVar26 = lVar26 + 0x30;
        lVar21 = lVar21 + 1;
      } while (lVar3 * 0x30 != lVar26);
    }
  }
  return;
}

