
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8
entry(undefined8 param_1,undefined8 param_2,float param_3,undefined8 param_4,undefined8 param_5,
     long param_6,undefined8 param_7)

{
  byte bVar1;
  uint uVar2;
  undefined8 uVar3;
  float local_bc;
  undefined8 local_b8;
  undefined8 local_b0;
  long local_a8;
  undefined8 local_a0;
  float *local_88;
  undefined8 local_80;
  float **local_70;
  float local_64;
  float **local_60;
  undefined8 local_58;
  undefined8 local_48;

  local_60 = &local_88;
  local_48 = 0xfffffffffffffffe;
  bVar1 = *(byte *)(param_6 + 0x44);
  uVar2 = bVar1 - 5;
  local_64 = param_3;
  if (0xc < uVar2) {
    local_88 = (float *)CONCAT44(local_88._4_4_,param_3 * _DAT_1458eb52c);
    local_58 = 0x14571d2e0;
    func_0x00014570bf80(param_6,param_7,0x14671d50c,&local_a8,&local_60);
    local_bc = local_64 * _DAT_1458eb4f8 * _DAT_1458eb52c;
    local_88 = &local_bc;
    local_80 = 0x14571d2e0;
    func_0x00014570bf80();
    local_70 = local_60;
    local_b0 = local_58;
    if ((bVar1 == 5) && (*(float *)(param_6 + 0x40) * _DAT_1458f662c + _DAT_145d39080 <= local_64))
    {
      func_0x000145452400();
    }
    func_0x000145452400();
    local_b8 = local_a0;
    func_0x00014540f4f0();
    func_0x00014540f4f0();
    func_0x00014540f4f0();
    if (local_70 != (float **)0x0) {
      func_0x0001400021d0();
    }
    if (local_a8 != 0) {
      func_0x0001400021d0();
    }
    if (local_88 != (float *)0x0) {
      func_0x0001400021d0();
    }
    if (local_60 != (float **)0x0) {
      func_0x0001400021d0();
    }
    return param_7;
  }
                    /* WARNING: Could not emulate address calculation at 0x000145413263 */
                    /* WARNING: Treating indirect jump as call */
  uVar3 = (*(code *)((long)*(int *)((ulong)uVar2 * 4 + 0x146720620) + 0x146720620))();
  return uVar3;
}
