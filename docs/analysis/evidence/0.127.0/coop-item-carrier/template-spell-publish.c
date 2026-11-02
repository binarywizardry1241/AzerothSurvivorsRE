
undefined8 * entry(undefined8 param_1,undefined8 param_2,undefined8 *param_3,undefined8 *param_4)

{
  undefined8 uVar1;
  short sVar2;
  uint local_40;
  undefined4 uStack_3c;
  undefined4 uStack_38;
  undefined4 uStack_34;
  undefined4 uStack_30;
  undefined4 uStack_2c;
  undefined8 *local_28;
  undefined8 local_20;
  undefined8 uStack_18;
  undefined8 uStack_10;
  
  local_20 = 0xfffffffffffffffe;
  sVar2 = *(short *)(param_3 + 3);
  if (sVar2 == 0x58) {
    local_28 = param_3;
    uStack_18 = param_1;
    uStack_10 = param_2;
    func_0x000145afbe60(0x58,param_4,param_3[1],&local_40,param_3[2]);
    param_3 = local_28;
    if ((local_40 & 1) != 0) {
      func_0x000145d032d0();
      param_4[3] = local_28[2];
      uVar1 = local_28[1];
      param_4[1] = *local_28;
      param_4[2] = uVar1;
      param_4[4] = CONCAT44(uStack_3c,local_40);
      param_4[5] = CONCAT44(uStack_34,uStack_38);
      param_4[6] = CONCAT44(uStack_2c,uStack_30);
      uVar1 = 0x8000000000000018;
      goto LAB_145b91bdc;
    }
  }
  param_4[3] = param_3[2];
  uVar1 = param_3[1];
  param_4[1] = *param_3;
  param_4[2] = uVar1;
  *(short *)(param_4 + 4) = sVar2;
  uVar1 = 0x8000000000000006;
LAB_145b91bdc:
  *param_4 = uVar1;
  return param_4;
}

