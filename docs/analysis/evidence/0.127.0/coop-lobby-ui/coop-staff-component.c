
void entry(undefined8 param_1,undefined8 param_2,long param_3,undefined4 *param_4,long *param_5)

{
  undefined4 local_18;
  undefined4 uStack_14;
  undefined4 uStack_10;
  undefined4 uStack_c;
  undefined8 uStack_8;
  
  *param_5 = *param_5 + 0x10;
  if (param_3 != 0) {
    local_18 = *param_4;
    uStack_14 = param_4[1];
    uStack_10 = param_4[2];
    uStack_c = param_4[3];
    uStack_8 = param_2;
    func_0x000140177bd0(param_1,param_3,param_3,&local_18);
    func_0x0001450a6fb0();
    func_0x0001450a6f60();
  }
  return;
}

