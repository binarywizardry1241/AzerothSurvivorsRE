
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 FUN_145829f20(void)

{
  uint *in_RCX;
  undefined1 auVar1 [16];
  undefined1 auVar2 [16];
  undefined1 auVar3 [16];
  float fVar5;
  undefined1 auVar4 [16];
  float fVar6;
  
  auVar1._0_4_ = (float)(*in_RCX & 0xffff) + _DAT_146ccb220;
  auVar1._4_4_ = (float)(*in_RCX >> 0x10) + fRam0000000146ccb224;
  auVar1._8_4_ = fRam0000000146ccb228 + 0.0;
  auVar1._12_4_ = fRam0000000146ccb22c + 0.0;
  auVar1 = divps(auVar1,_DAT_146bc9400);
  auVar4._0_4_ = (float)(in_RCX[1] & 0xffff) + _DAT_146ccb220;
  auVar4._4_4_ = (float)(in_RCX[1] >> 0x10) + fRam0000000146ccb224;
  auVar4._8_4_ = fRam0000000146ccb228 + 0.0;
  auVar4._12_4_ = fRam0000000146ccb22c + 0.0;
  auVar4 = divps(auVar4,_DAT_146bc9400);
  fVar5 = auVar4._4_4_ * fRam0000000146ccb244;
  fVar6 = auVar4._12_4_ * fRam0000000146ccb24c;
  auVar2._4_4_ = fVar5;
  auVar2._0_4_ = fVar5;
  auVar2._8_4_ = fVar6;
  auVar2._12_4_ = fVar6;
  auVar3._4_12_ = auVar2._4_12_;
  auVar3._0_4_ = fVar5 + auVar1._4_4_ * fRam0000000146ccb234 + auVar1._0_4_ * _DAT_146ccb230 +
                         auVar4._0_4_ * _DAT_146ccb240 + _DAT_145edfeb0;
  return auVar3._0_8_;
}

