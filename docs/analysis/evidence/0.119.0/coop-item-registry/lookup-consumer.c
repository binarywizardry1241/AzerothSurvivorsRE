void FUN_140c7cc00(longlong *param_1,longlong param_2,undefined4 param_3,undefined8 param_4,
                  undefined8 param_5,undefined4 param_6,undefined4 param_7,undefined8 param_8,
                  undefined8 param_9,undefined8 param_10,undefined8 param_11,undefined8 param_12)

{
  longlong lVar1;
  longlong lStack_108;
  undefined4 *puStack_100;
  longlong lStack_f8;
  longlong lStack_f0;
  longlong lStack_e8;
  longlong lStack_e0;
  longlong lStack_d8;
  undefined8 uStack_d0;
  undefined8 uStack_c8;
  longlong *plStack_c0;
  undefined *puStack_b8;
  undefined8 uStack_b0;
  undefined8 uStack_a8;
  undefined4 **ppuStack_a0;
  undefined *puStack_98;
  undefined8 uStack_90;
  undefined8 uStack_88;
  undefined8 uStack_80;
  undefined *puStack_78;
  longlong lStack_70;
  undefined8 uStack_68;
  undefined *puStack_60;
  undefined1 uStack_58;
  undefined4 auStack_50 [2];
  undefined4 uStack_48;

  auStack_50[0] = param_6;
  uStack_48 = param_7;
  if ((DAT_1484cf7a8 != 0) || ((*DAT_1484cf7a0)(param_1,param_3), *param_1 == -1)) {
    if ((param_2 != 0) &&
       (((lVar1 = FUN_145e18150(param_2,param_3), lVar1 != 0 && (*(longlong *)(lVar1 + 0x78) != -1))
        && (*(longlong *)(lVar1 + 0x88) != 0)))) {
      lStack_e0 = param_2 + 0x1b0;
      lStack_d8 = param_2 + 0x1e0;
      lStack_70 = param_2 + 0x150;
      puStack_100 = auStack_50;
      uStack_c8 = param_5;
      plStack_c0 = &lStack_108;
      puStack_b8 = &DAT_146275e00;
      uStack_68 = param_10;
      puStack_60 = &DAT_146275e30;
      uStack_58 = 0;
      uStack_b0 = param_8;
      uStack_a8 = param_9;
      ppuStack_a0 = &puStack_100;
      puStack_98 = &DAT_146275e60;
      uStack_90 = param_11;
      uStack_88 = param_12;
      uStack_80 = 1;
      puStack_78 = &DAT_146275e90;
      lStack_108 = param_2;
      uStack_d0 = param_4;
      FUN_145e724b0(&lStack_f8,*(undefined8 *)(lVar1 + 0x80),*(longlong *)(lVar1 + 0x88),lVar1,
                    &lStack_e0);
      if (lStack_f8 != -1) {
        if (lStack_e8 != 0) {
          *param_1 = lStack_f8;
          param_1[1] = lStack_f0;
          param_1[2] = lStack_e8;
          return;
        }
        if (lStack_f8 != 0) {
          func_0x0001400021d0(lStack_f0,lStack_f8,1);
        }
      }
    }
    *param_1 = -1;
  }
  return;
}
