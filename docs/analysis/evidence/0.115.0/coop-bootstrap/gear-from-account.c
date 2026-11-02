undefined8 FUN_145832890(undefined8 param_1,longlong param_2,char param_3,undefined1 param_4)

{
  longlong lVar1;
  char *pcVar2;
  longlong lVar3;
  undefined4 auStack_130 [2];
  undefined4 uStack_128;
  undefined4 uStack_120;
  undefined4 uStack_118;
  undefined4 uStack_110;
  undefined4 uStack_108;
  undefined4 uStack_100;
  undefined4 uStack_f8;
  undefined4 uStack_f0;
  undefined4 uStack_e8;
  undefined4 uStack_e0;
  undefined4 uStack_d8;
  undefined4 uStack_d0;
  undefined4 uStack_c8;
  undefined4 uStack_c0;
  undefined4 uStack_b8;
  undefined4 uStack_b0;
  undefined4 uStack_a8;
  undefined4 uStack_a0;
  undefined8 uStack_98;
  undefined8 uStack_90;
  undefined8 uStack_88;
  undefined8 uStack_80;
  undefined8 uStack_78;
  undefined8 uStack_70;
  undefined8 uStack_68;
  undefined4 uStack_60;
  undefined4 uStack_5c;
  undefined4 uStack_58;
  undefined8 uStack_54;
  char cStack_4c;
  longlong lStack_48;
  undefined8 uStack_40;
  undefined8 uStack_38;
  undefined8 uStack_30;
  undefined8 uStack_28;

  uStack_28 = 0xfffffffffffffffe;
  lVar3 = 0;
  do {
    if (*(longlong *)(param_2 + 0x58) * 0xe8 - lVar3 == 0) {
      uStack_58 = 0;
      uStack_54 = 0;
      uStack_68 = 0;
      uStack_60 = 0;
      uStack_5c = 0;
      uStack_78 = 0;
      uStack_70 = 0;
      uStack_88 = 0;
      uStack_80 = 0;
      uStack_98 = 0;
      uStack_90 = 0;
      auStack_130[0] = 0;
      uStack_128 = 0;
      uStack_120 = 0;
      uStack_118 = 0;
      uStack_110 = 0;
      uStack_108 = 0;
      uStack_100 = 0;
      uStack_f8 = 0;
      uStack_f0 = 0;
      uStack_e8 = 0;
      uStack_e0 = 0;
      uStack_d8 = 0;
      uStack_d0 = 0;
      uStack_c8 = 0;
      uStack_c0 = 0;
      uStack_b8 = 0;
      uStack_b0 = 0;
      uStack_a8 = 0;
      uStack_a0 = 0;
      cStack_4c = param_3;
      goto LAB_1458329b2;
    }
    lVar1 = lVar3 + 0xe8;
    pcVar2 = (char *)(*(longlong *)(param_2 + 0x50) + 0xe4 + lVar3);
    lVar3 = lVar1;
  } while (*pcVar2 != param_3);
  func_0x000145d145fb(auStack_130,*(longlong *)(param_2 + 0x50) + lVar1 + -0xe8,0xe8);
LAB_1458329b2:
  FUN_14582ca90(&lStack_48,param_2);
  uStack_30 = uStack_40;
  FUN_14582a070(param_1,auStack_130,uStack_40,uStack_38,param_4);
  if (lStack_48 != 0) {
    func_0x0001400021d0(uStack_30,lStack_48 << 2,4);
  }
  return param_1;
}
