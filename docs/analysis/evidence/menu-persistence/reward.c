
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 FUN_14582a000(void)

{
  uint *in_RCX;
  undefined1 auVar2 [16];
  undefined1 auVar3 [16];
  undefined1 auVar4 [16];
  undefined1 auVar5 [16];
  float fVar7;
  undefined1 auVar6 [16];
  float fVar8;
  undefined8 uVar1;
  
  auVar2._0_4_ = (float)(*in_RCX & 0xffff) + _DAT_146ccb220;
  auVar2._4_4_ = (float)(*in_RCX >> 0x10) + fRam0000000146ccb224;
  auVar2._8_4_ = fRam0000000146ccb228 + 0.0;
  auVar2._12_4_ = fRam0000000146ccb22c + 0.0;
  auVar2 = divps(auVar2,_DAT_146bc9400);
  auVar6._0_4_ = (float)(in_RCX[1] & 0xffff) + _DAT_146ccb220;
  auVar6._4_4_ = (float)(in_RCX[1] >> 0x10) + fRam0000000146ccb224;
  auVar6._8_4_ = fRam0000000146ccb228 + 0.0;
  auVar6._12_4_ = fRam0000000146ccb22c + 0.0;
  auVar6 = divps(auVar6,_DAT_146bc9400);
  fVar7 = auVar6._4_4_ * fRam0000000146ccb244;
  fVar8 = auVar6._12_4_ * fRam0000000146ccb24c;
  auVar3._4_4_ = fVar7;
  auVar3._0_4_ = fVar7;
  auVar3._8_4_ = fVar8;
  auVar3._12_4_ = fVar8;
  auVar4._4_12_ = auVar3._4_12_;
  auVar4._0_4_ = fVar7 + auVar2._4_4_ * fRam0000000146ccb234 + auVar2._0_4_ * _DAT_146ccb230 +
                         auVar6._0_4_ * _DAT_146ccb240 + _DAT_145edfeb0;
  uVar1 = auVar4._0_8_;
  if (_DAT_145ee02b0 <= auVar4._0_4_) {
    auVar5._4_12_ = auVar4._4_12_;
    auVar5._0_4_ = _DAT_145ee02b0;
    uVar1 = auVar5._0_8_;
  }
  return uVar1;
}

