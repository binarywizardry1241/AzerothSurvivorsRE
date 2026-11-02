undefined8
FUN_145af0c40(undefined8 param_1,short *param_2,longlong param_3,undefined8 *param_4,
             undefined8 param_5)

{
  longlong lVar1;
  undefined8 uVar2;
  undefined8 uVar3;
  ulonglong uVar4;
  undefined8 uVar5;
  longlong unaff_GS_OFFSET;
  undefined1 auStack_718 [800];
  undefined8 uStack_3f8;
  undefined8 uStack_3f0;
  undefined8 uStack_3e8;
  undefined8 uStack_3e0;
  undefined8 uStack_3d8;
  undefined8 uStack_3d0;
  undefined4 uStack_3c8;
  undefined4 uStack_3c4;
  undefined4 uStack_3c0;
  undefined4 uStack_3bc;
  undefined8 uStack_3b8;
  undefined1 auStack_3b0 [808];
  undefined4 uStack_88;
  undefined4 uStack_84;
  undefined4 uStack_80;
  undefined4 uStack_7c;
  undefined8 uStack_78;
  undefined8 uStack_70;
  undefined8 uStack_68;
  undefined8 uStack_60;
  undefined8 uStack_58;
  undefined8 uStack_50;
  undefined8 uStack_48;
  undefined8 uStack_40;
  
  uStack_40 = 0xfffffffffffffffe;
  uVar5 = CONCAT71((int7)((ulonglong)param_1 >> 8),param_3 == 2 && param_2 != (short *)0x0);
  if (param_3 == 2 && param_2 != (short *)0x0) {
    if (*param_2 == 0x6e65) {
      uVar4 = 1;
      uVar5 = 0;
    }
    else {
      uVar4 = 1;
      if (*param_2 == 0x6c70) {
        uVar5 = 1;
      }
      else if (*param_2 == 0x7363) {
        uVar5 = 2;
      }
      else if (*param_2 == 0x6564) {
        uVar5 = 3;
      }
      else if (*param_2 == 0x7470) {
        uVar5 = 4;
      }
      else if (*param_2 == 0x7365) {
        uVar5 = 5;
      }
      else if (*param_2 == 0x7266) {
        uVar5 = 6;
      }
      else if (*param_2 == 0x6f72) {
        uVar5 = 7;
      }
      else if (*param_2 == 0x7274) {
        uVar5 = 8;
      }
      else if (*param_2 == 0x7572) {
        uVar5 = 9;
      }
      else if (*param_2 == 0x6b75) {
        uVar5 = 10;
      }
      else if (*param_2 == 0x687a) {
        uVar5 = 0xb;
      }
      else if (*param_2 == 0x616a) {
        uVar5 = 0xc;
      }
      else {
        uVar4 = (ulonglong)(*param_2 == 0x6f6b);
        uVar5 = 0xd;
      }
    }
  }
  else {
    uVar4 = 0;
  }
  lVar1 = *(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)_tls_index * 8);
  uVar2 = *(undefined8 *)(lVar1 + 0x360);
  uVar3 = *(undefined8 *)(lVar1 + 0x368);
  *(ulonglong *)(lVar1 + 0x360) = uVar4;
  *(undefined8 *)(lVar1 + 0x368) = uVar5;
  uVar5 = *param_4;
  FUN_145c254c0(&uStack_58,param_5);
  FUN_145c6d020(&uStack_70,param_5);
  FUN_145c195a0(&uStack_88,param_5);
  FUN_145b25f20(auStack_718,param_5,uVar5);
  uStack_3e8 = uStack_48;
  uStack_3f8 = uStack_58;
  uStack_3f0 = uStack_50;
  uStack_3e0 = uStack_70;
  uStack_3d8 = uStack_68;
  uStack_3d0 = uStack_60;
  uStack_3c8 = uStack_88;
  uStack_3c4 = uStack_84;
  uStack_3c0 = uStack_80;
  uStack_3bc = uStack_7c;
  uStack_3b8 = uStack_78;
  func_0x000146011e1b(auStack_3b0,auStack_718,800);
  *(undefined8 *)(lVar1 + 0x360) = uVar2;
  *(undefined8 *)(lVar1 + 0x368) = uVar3;
  func_0x000146011e1b(param_1,&uStack_3f8,0x368);
  return param_1;
}
