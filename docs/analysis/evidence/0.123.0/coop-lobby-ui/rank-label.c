
long * FUN_145be05e0(undefined8 param_1,undefined8 param_2,byte param_3,long *param_4)

{
  code *pcVar1;
  ulong uVar2;
  long lVar3;
  undefined8 uVar4;
  long lVar5;
  undefined1 auVar6 [16];
  undefined1 auStack_a8 [16];
  undefined8 uStack_98;
  undefined8 uStack_90;
  undefined4 *puStack_88;
  undefined8 uStack_80;
  undefined8 uStack_78;
  undefined8 uStack_70;
  undefined8 uStack_68;
  undefined8 uStack_60;
  undefined8 uStack_58;
  undefined8 uStack_50;
  undefined8 uStack_48;
  undefined8 uStack_40;
  undefined4 uStack_38;
  undefined4 uStack_34;
  undefined4 uStack_30;
  undefined4 uStack_2c;
  
  if (param_3 == 0) {
    auVar6 = func_0x000145bbff50(0x1476a15c6,param_4,6,0x1476a15c6);
    lVar5 = auVar6._8_8_;
    if (auVar6._0_8_ == 0) {
      lVar5 = 6;
    }
    if (lVar5 < 0) {
LAB_145be0725:
      func_0x0001461add5b();
                    /* WARNING: Does not return */
      pcVar1 = (code *)invalidInstructionException();
      (*pcVar1)();
    }
    if (lVar5 == 0) {
      lVar3 = 1;
    }
    else {
      func_0x000140002200();
      lVar3 = func_0x0001400021c0();
      if (lVar3 == 0) goto LAB_145be0725;
      func_0x00014600504b();
    }
    *param_4 = lVar5;
    param_4[1] = lVar3;
    param_4[2] = lVar5;
  }
  else {
    uVar4 = 0x1476a15cc;
    auStack_a8 = func_0x000145bbff50(0x1476a15cc,param_4,6,0x1476a15cc);
    if (auStack_a8._0_8_ == 0) {
      auStack_a8._8_8_ = 6;
      auStack_a8._0_8_ = uVar4;
    }
    puStack_88 = (undefined4 *)0x1476a15d2;
    uStack_80 = 1;
    uStack_78 = 0x1476a15d3;
    uStack_70 = 2;
    uStack_68 = 0x1476a15d5;
    uStack_60 = 3;
    uStack_58 = 0x1476a15d8;
    uStack_50 = 2;
    uStack_48 = 0x1476a15da;
    uStack_40 = 1;
    if (5 < param_3) {
      func_0x0001461ae0f3();
                    /* WARNING: Does not return */
      pcVar1 = (code *)invalidInstructionException();
      (*pcVar1)();
    }
    uVar2 = (ulong)param_3;
    uStack_38 = *(undefined4 *)(&uStack_98 + uVar2 * 2);
    uStack_34 = *(undefined4 *)((long)&uStack_98 + uVar2 * 0x10 + 4);
    uStack_30 = *(undefined4 *)(&uStack_90 + uVar2 * 2);
    uStack_2c = *(undefined4 *)((long)&uStack_90 + uVar2 * 0x10 + 4);
    uStack_98 = auStack_a8;
    uStack_90 = 0x1400020c0;
    puStack_88 = &uStack_38;
    uStack_80 = 0x1400020c0;
    func_0x000145fd7da0();
  }
  return param_4;
}

