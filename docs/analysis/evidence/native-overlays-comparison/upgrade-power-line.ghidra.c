
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8
entry(undefined8 param_1,undefined8 param_2,float param_3,undefined8 param_4,undefined8 param_5,
     long param_6,undefined8 param_7)

{
  undefined4 in_XMM6_Da;
  float local_84;
  long local_80 [3];
  float local_64;
  float *local_60;
  undefined8 local_58;
  long *local_50;
  undefined8 local_48;
  undefined8 local_40;
  undefined4 local_38;

  local_40 = 0xfffffffffffffffe;
  local_64 = (SQRT(_DAT_1458eb480 + param_3) + _DAT_1458eb4fc) * _DAT_1458eb52c;
  local_38 = in_XMM6_Da;
  if (*(char *)(param_6 + 0x75) == '\t') {
    if (*(int *)(param_6 + 0x68) == 6) {
      func_0x000145452400(0x14671cee8,param_7,0xd,0x14671cee8);
      local_60 = &local_64;
      local_58 = 0x14571d2e0;
      func_0x00014570bf80();
      local_60 = (float *)0x14671cf20;
      local_58 = 1;
      local_48 = 0x14671cf00;
      local_50 = local_80;
      func_0x000145452790();
      goto LAB_14540f005;
    }
    if (*(int *)(param_6 + 0x68) == 7) {
      func_0x000145452400(0x14671cf21,param_7,0xc,0x14671cf21);
      local_60 = &local_64;
      local_58 = 0x14571d2e0;
      func_0x00014570bf80();
      local_60 = (float *)0x14671cf20;
      local_58 = 1;
      local_48 = 0x14671cf00;
      local_50 = local_80;
      func_0x000145452790();
      goto LAB_14540f005;
    }
  }
  func_0x000145452400(0x14671cf2d,param_7,0xc,0x14671cf2d);
  local_84 = param_3 * _DAT_1458eb52c;
  local_60 = &local_84;
  local_58 = 0x14571d2e0;
  func_0x00014570bf80();
  local_60 = (float *)0x14671cf20;
  local_58 = 1;
  local_48 = 0x14671cf00;
  local_50 = local_80;
  func_0x000145452790();
LAB_14540f005:
  if (local_80[0] != 0) {
    func_0x0001400021d0();
  }
  return param_7;
}
