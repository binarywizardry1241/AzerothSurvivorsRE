longlong *
FUN_1459b5590(longlong *param_1,undefined8 param_2,undefined8 param_3,ulonglong param_4,byte param_5
             ,byte param_6,byte param_7)

{
  code *pcVar1;
  undefined8 *puVar2;
  longlong lVar3;
  longlong lVar4;
  undefined4 uStack_88;
  undefined4 uStack_84;
  undefined4 uStack_80;
  undefined4 uStack_7c;
  longlong lStack_78;
  longlong lStack_70;
  undefined8 uStack_68;
  undefined8 uStack_60;
  longlong lStack_58;
  longlong lStack_50;
  undefined8 uStack_40;

  uStack_40 = 0xfffffffffffffffe;
  func_0x000140002200();
  puVar2 = (undefined8 *)func_0x0001400021c0(0x20,1);
  if (puVar2 == (undefined8 *)0x0) {
    FUN_145eb6fcb(1,0x20);
                    /* WARNING: Does not return */
    pcVar1 = (code *)invalidInstructionException();
    (*pcVar1)();
  }
  *puVar2 = param_2;
  uStack_68 = 0x20;
  lStack_58 = 8;
  lStack_50 = CONCAT62(lStack_50._2_6_,0x51);
  uStack_60 = puVar2;
  if (param_4 < 0x19) {
    lVar4 = 8;
    lVar3 = 0x20;
    if (param_4 == 0) goto LAB_1459b5624;
  }
  else {
    FUN_145d14a10(&uStack_68,8,param_4,1,1);
  }
  lVar4 = lStack_58;
  puVar2 = uStack_60;
  lVar3 = uStack_68;
  func_0x000145d145fb((longlong)uStack_60 + lStack_58,param_3,param_4);
LAB_1459b5624:
  lVar4 = lVar4 + param_4;
  if (lVar4 == lVar3) {
    lStack_58 = lVar4;
    FUN_145eb6ec0(&uStack_68);
    puVar2 = uStack_60;
  }
  *(undefined1 *)((longlong)puVar2 + lVar4) = 0;
  lVar3 = lVar4 + 1;
  uStack_88 = (undefined4)uStack_68;
  uStack_84 = uStack_68._4_4_;
  uStack_80 = (undefined4)uStack_60;
  uStack_7c = uStack_60._4_4_;
  lStack_70 = lStack_50;
  if (lVar3 == uStack_68) {
    lStack_78 = lVar3;
    lStack_58 = lVar3;
    FUN_145eb6ec0(&uStack_88);
  }
  *(undefined1 *)(CONCAT44(uStack_7c,uStack_80) + lVar3) = 0;
  lStack_58 = lVar4 + 2;
  uStack_68 = CONCAT44(uStack_84,uStack_88);
  uStack_60 = (undefined8 *)CONCAT44(uStack_7c,uStack_80);
  lStack_50 = lStack_70;
  if ((ulonglong)(uStack_68 - lStack_58) < 4) {
    lStack_78 = lStack_58;
    FUN_145d14a10(&uStack_68,lStack_58,4,1,1);
  }
  *(uint *)((longlong)uStack_60 + lStack_58) = (uint)param_5;
  lStack_78 = lStack_58 + 4;
  uStack_88 = (undefined4)uStack_68;
  uStack_84 = uStack_68._4_4_;
  uStack_80 = (undefined4)uStack_60;
  uStack_7c = uStack_60._4_4_;
  lStack_70 = lStack_50;
  if ((ulonglong)(uStack_68 - lStack_78) < 4) {
    lStack_58 = lStack_78;
    FUN_145d14a10(&uStack_88,lStack_78,4,1,1);
  }
  *(uint *)(CONCAT44(uStack_7c,uStack_80) + lStack_78) = (uint)param_6;
  lStack_58 = lStack_78 + 4;
  uStack_68 = CONCAT44(uStack_84,uStack_88);
  uStack_60 = (undefined8 *)CONCAT44(uStack_7c,uStack_80);
  lStack_50 = lStack_70;
  if ((ulonglong)(uStack_68 - lStack_58) < 4) {
    lStack_78 = lStack_58;
    FUN_145d14a10(&uStack_68,lStack_58,4,1,1);
  }
  *(uint *)((longlong)uStack_60 + lStack_58) = (uint)param_7;
  *param_1 = uStack_68;
  param_1[1] = (longlong)uStack_60;
  param_1[2] = lStack_58 + 4;
  param_1[3] = lStack_50;
  return param_1;
}
