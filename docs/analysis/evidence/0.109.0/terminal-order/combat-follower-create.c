/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,long param_2)

{
  undefined8 *puVar1;
  float *pfVar2;
  long lVar3;
  long lVar4;
  undefined8 uVar5;
  long lVar6;
  undefined8 *unaff_RBX;
  long unaff_RBP;
  undefined8 unaff_R14;
  float fVar7;
  float fVar8;
  float fVar9;
  undefined4 in_XMM6_Da;
  undefined8 in_XMM7_Qa;
  undefined4 in_XMM8_Da;
  float in_XMM9_Da;

  lVar3 = *(long *)(param_2 + 0xd8);
  if (lVar3 == *(long *)(param_2 + 200)) {
    *(undefined1 *)(unaff_RBP + 0x67) = 0;
    func_0x000145c26600();
  }
  lVar4 = *(long *)(param_2 + 0xd0);
  lVar6 = lVar3 * 0x78;
  *(undefined8 *)(lVar4 + 0x10 + lVar6) = unaff_RBX[2];
  uVar5 = unaff_RBX[1];
  *(undefined8 *)(lVar4 + lVar6) = *unaff_RBX;
  ((undefined8 *)(lVar4 + lVar6))[1] = uVar5;
  *(undefined8 *)(lVar4 + 0x18 + lVar6) = param_1;
  *(undefined8 *)(lVar4 + 0x20 + lVar6) = unaff_R14;
  puVar1 = (undefined8 *)(lVar4 + 0x28 + lVar6);
  *puVar1 = 0;
  puVar1[1] = 0;
  *(undefined4 *)(lVar4 + 0x38 + lVar6) = 0;
  *(undefined8 *)(lVar4 + 0x40 + lVar6) = in_XMM7_Qa;
  *(undefined4 *)(lVar4 + 0x48 + lVar6) = in_XMM8_Da;
  *(undefined8 *)(lVar4 + 0x4c + lVar6) = in_XMM7_Qa;
  *(undefined4 *)(lVar4 + 0x54 + lVar6) = in_XMM8_Da;
  fVar7 = fRam000000014606ff04 + fRam00000001472299c4;
  fVar8 = in_XMM9_Da + fRam00000001472299c8;
  fVar9 = in_XMM9_Da + fRam00000001472299cc;
  pfVar2 = (float *)(lVar4 + 0x58 + lVar6);
  *pfVar2 = in_XMM9_Da + _DAT_1472299c0;
  pfVar2[1] = fVar7;
  pfVar2[2] = fVar8;
  pfVar2[3] = fVar9;
  *(undefined4 *)(lVar4 + 0x68 + lVar6) = in_XMM6_Da;
  *(undefined8 *)(lVar4 + 0x6c + lVar6) = 0x3f800000;
  *(undefined4 *)(lVar4 + 0x74 + lVar6) = 0;
  *(long *)(param_2 + 0xd8) = lVar3 + 1;
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}
