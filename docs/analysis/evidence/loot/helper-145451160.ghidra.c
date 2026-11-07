
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 entry(void)

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

  auVar2._0_4_ = (float)(*in_RCX & 0xffff) + _DAT_146720f90;
  auVar2._4_4_ = (float)(*in_RCX >> 0x10) + fRam0000000146720f94;
  auVar2._8_4_ = fRam0000000146720f98 + 0.0;
  auVar2._12_4_ = fRam0000000146720f9c + 0.0;
  auVar2 = divps(auVar2,_DAT_146627ee0);
  auVar6._0_4_ = (float)(in_RCX[1] & 0xffff) + _DAT_146720f90;
  auVar6._4_4_ = (float)(in_RCX[1] >> 0x10) + fRam0000000146720f94;
  auVar6._8_4_ = fRam0000000146720f98 + 0.0;
  auVar6._12_4_ = fRam0000000146720f9c + 0.0;
  auVar6 = divps(auVar6,_DAT_146627ee0);
  fVar7 = auVar6._4_4_ * fRam0000000146720fb4;
  fVar8 = auVar6._12_4_ * fRam0000000146720fbc;
  auVar3._4_4_ = fVar7;
  auVar3._0_4_ = fVar7;
  auVar3._8_4_ = fVar8;
  auVar3._12_4_ = fVar8;
  auVar4._4_12_ = auVar3._4_12_;
  auVar4._0_4_ = fVar7 + auVar2._4_4_ * fRam0000000146720fa4 + auVar2._0_4_ * _DAT_146720fa0 +
                         auVar6._0_4_ * _DAT_146720fb0 + _DAT_1458eb480;
  uVar1 = auVar4._0_8_;
  if (_DAT_1458f6624 <= auVar4._0_4_) {
    auVar5._4_12_ = auVar4._4_12_;
    auVar5._0_4_ = _DAT_1458f6624;
    uVar1 = auVar5._0_8_;
  }
  return uVar1;
}
