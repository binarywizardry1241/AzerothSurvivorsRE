/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,undefined8 param_4)

{
  undefined1 local_21;
  undefined8 *local_20;
  undefined8 local_18;
  undefined8 local_10;
  undefined1 *local_8;

  if (_DAT_148004638 != 0) {
    local_20 = &local_18;
    local_10 = 0x148004608;
    local_8 = &local_21;
    local_18 = param_4;
    func_0x000145d67f70(param_1,param_2,1,&DAT_148004638,&local_20,0x146bb9588);
  }
  return;
}
