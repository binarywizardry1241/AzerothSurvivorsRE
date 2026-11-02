/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2)

{
  undefined1 local_19;
  undefined8 *local_18;
  undefined8 local_10;
  undefined1 *local_8;

  if (_DAT_14804f5c0 != 0) {
    local_18 = &local_10;
    local_10 = 0x14804f5a8;
    local_8 = &local_19;
    func_0x000145d92020(param_1,param_2,1,&DAT_14804f5c0,&local_18,0x146bea988);
  }
  return;
}
