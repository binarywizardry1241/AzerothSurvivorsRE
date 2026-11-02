
/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,long param_2)

{
  float fVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  undefined8 unaff_RBX;
  undefined8 *unaff_RBP;
  undefined8 unaff_R12;
  long unaff_R13;
  undefined8 unaff_R15;
  float fVar5;
  float fVar6;
  float fVar7;
  undefined1 auVar8 [16];
  float in_XMM6_Da;
  undefined4 in_XMM7_Da;
  uint in_XMM8_Da;
  uint in_XMM8_Db;
  float in_XMM9_Da;
  float in_XMM10_Da;
  
  fVar1 = *(float *)(param_2 + 0xaa8);
  fVar2 = *(float *)(unaff_R13 + 0x58);
  fVar7 = in_XMM9_Da * _DAT_145dd4cc8 + _DAT_1460cf4c4;
  if (_DAT_145de79f0 <= fVar7) {
    fVar7 = _DAT_145de79f0;
  }
  auVar8._0_4_ = (float)(in_XMM8_Da & 0xffff);
  auVar8._4_4_ = (float)(in_XMM8_Da >> 0x10);
  auVar8._8_4_ = (float)(in_XMM8_Db & 0xffff);
  auVar8._12_4_ = (float)(in_XMM8_Db >> 0x10);
  fVar3 = *(float *)(param_2 + 0xa34);
  fVar6 = _DAT_145d9d2a0 + fVar3;
  fVar5 = _DAT_145dd4cc8 + fVar3;
  fVar4 = *(float *)(unaff_R13 + 0x5c);
  *(undefined1 (*) [16])(unaff_RBP + 0x21) = ZEXT416(0);
  *(undefined1 (*) [16])(unaff_RBP + 0x1f) = ZEXT416(0);
  *(undefined1 (*) [16])(unaff_RBP + 0x1d) = ZEXT416(0);
  *(undefined1 (*) [16])(unaff_RBP + 0x1b) = ZEXT416(0);
  unaff_RBP[0x16] = unaff_RBX;
  unaff_RBP[0x17] = 0;
  unaff_RBP[-2] = unaff_R13;
  unaff_RBP[-1] = unaff_R15;
  *unaff_RBP = unaff_R12;
  unaff_RBP[1] = 0;
  *(undefined1 *)(unaff_RBP + 2) = 0;
  *(undefined4 *)(unaff_RBP + 0x23) = in_XMM7_Da;
  *(undefined4 *)((long)unaff_RBP + 0x11c) = in_XMM7_Da;
  auVar8 = divps(auVar8,_DAT_146ae6cc0);
  unaff_RBP[0x24] =
       CONCAT44(auVar8._4_4_ * fVar4,auVar8._0_4_ * in_XMM6_Da * SQRT(in_XMM10_Da * fVar1) * fVar2);
  *(undefined4 *)(unaff_RBP + 0x25) = 0x40000000;
  *(float *)((long)unaff_RBP + 300) = fVar7;
  *(float *)(unaff_RBP + 0x26) = in_XMM9_Da;
  *(undefined4 *)((long)unaff_RBP + 0x13c) = *(undefined4 *)(unaff_RBP + 0x3b);
  *(undefined8 *)((long)unaff_RBP + 0x134) = unaff_RBP[0x3a];
  unaff_RBP[0x28] = unaff_RBP[0x3a];
  *(undefined4 *)(unaff_RBP + 0x29) = *(undefined4 *)(unaff_RBP + 0x3b);
  *(float *)((long)unaff_RBP + 0x14c) = fVar3;
  *(undefined4 *)(unaff_RBP + 0x2a) = 0;
  *(float *)((long)unaff_RBP + 0x154) = fVar6;
  *(undefined4 *)(unaff_RBP + 0x2b) = 0x40000000;
  *(undefined1 (*) [16])(unaff_RBP + 0x18) = ZEXT416(0);
  unaff_RBP[0x1a] = 0;
  *(undefined1 (*) [16])((long)unaff_RBP + 0x15c) = ZEXT416(0);
  *(float *)((long)unaff_RBP + 0x16c) = fVar5;
  *(float *)(unaff_RBP + 0x2e) = fVar3;
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}

