/* WARNING: Control flow encountered bad instruction data */

void entry(undefined8 param_1,float param_2,undefined8 param_3,undefined8 param_4,undefined8 param_5
          ,undefined8 param_6,int param_7,ulong *param_8)

{
  ulong extraout_RDX;
  ulong uVar1;
  undefined4 uVar2;
  undefined4 extraout_XMM0_Da;
  undefined4 in_XMM6_Da;
  ulong local_58;
  ulong local_50;
  ulong uStack_48;
  ulong local_40;
  ulong uStack_38;
  ulong local_30;
  undefined4 local_28;

  uVar1 = *param_8;
  if (param_2 <= 0.0) {
    if ((uVar1 < 0xfffffffffffffffe) && (uVar1 != 0)) {
                    /* WARNING: Bad instruction - Truncating control flow here */
      halt_baddata();
    }
  }
  else {
    local_28 = in_XMM6_Da;
    if (uVar1 == 0xfffffffffffffffe) {
      if (param_7 == 0) {
        uVar1 = 0x146e792f0;
        local_50 = func_0x0001458da590(param_6,0x146e792f0,5,0x146e792f0);
        uStack_48 = extraout_RDX;
        if (local_50 == 0) {
          uStack_48 = 5;
          local_50 = uVar1;
        }
        local_58 = 0xffffffffffffffff;
        local_40 = 0x146e792f5;
        uStack_38 = 0x18;
        local_30 = local_30 & 0xffffffffffffff00;
        uVar2 = extraout_XMM0_Da;
      }
      else {
        uVar2 = func_0x0001458f2ee0(param_6,param_4,param_6,&local_58);
      }
    }
    else {
      uVar2 = (undefined4)param_8[1];
      local_50 = param_8[1];
      uStack_48 = param_8[2];
      local_40 = param_8[3];
      uStack_38 = param_8[4];
      local_30 = param_8[5];
      local_58 = uVar1;
    }
    func_0x00014595f3c0(uVar2,param_2,SUB84((double)param_2,0));
  }
  return;
}
