void FUN_14590e290(undefined8 param_1,longlong param_2,undefined1 param_3)

{
  undefined8 unaff_RBX;
  undefined4 uStack_b8;
  undefined4 uStack_b4;
  undefined4 uStack_b0;
  undefined4 uStack_ac;
  undefined4 uStack_a8;
  undefined4 uStack_a4;
  undefined4 uStack_a0;
  undefined4 uStack_9c;
  undefined1 auStack_90 [24];
  undefined4 uStack_78;
  float fStack_74;
  undefined8 uStack_70;
  undefined8 uStack_68;
  undefined8 uStack_58;
  undefined8 uStack_50;
  undefined8 uStack_48;
  undefined4 uStack_40;
  undefined4 uStack_3c;
  undefined1 uStack_31;
  undefined8 uStack_30;

  uStack_30 = 0xfffffffffffffffe;
  FUN_14590aa70(auStack_90);
  uStack_40 = 0;
  uStack_58 = 0;
  uStack_50 = 1;
  uStack_48 = 0;
  uStack_68 = 0x40490fdb40200000;
  uStack_70 = 0x40971c7140900000;
  _uStack_78 = CONCAT44(*(float *)(param_2 + 0x4a4) * 7.0,0x40200000);
  uStack_31 = 1;
  FUN_145990f40(&uStack_58,*(undefined8 *)(param_2 + 0x478),4,
                CONCAT71((int7)((ulonglong)unaff_RBX >> 8),param_3) & 0xffffffff,param_2 + 0x4e0,
                *(undefined4 *)(param_2 + 0x4ec),&uStack_78,auStack_90);
  uStack_a8 = (undefined4)uStack_48;
  uStack_a4 = uStack_48._4_4_;
  uStack_a0 = uStack_40;
  uStack_9c = uStack_3c;
  uStack_b8 = (undefined4)uStack_58;
  uStack_b4 = uStack_58._4_4_;
  uStack_b0 = (undefined4)uStack_50;
  uStack_ac = uStack_50._4_4_;
  uStack_31 = 0;
  FUN_145991710(param_1,&uStack_b8);
  FUN_14580c380(auStack_90);
  return;
}
