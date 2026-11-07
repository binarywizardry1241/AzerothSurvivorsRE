/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8
FUN_14589e760(undefined8 param_1,undefined8 param_2,float param_3,undefined8 param_4,
             undefined8 param_5,long param_6,undefined8 param_7)

{
  byte bVar1;
  undefined8 uVar2;
  undefined4 uVar3;
  float fVar4;
  undefined4 local_b8;
  undefined4 uStack_b4;
  undefined4 uStack_b0;
  undefined4 uStack_ac;
  float local_9c;
  float *local_98;
  undefined8 local_90;
  long local_80;
  undefined8 local_78;
  undefined8 local_68;
  undefined8 local_60;
  undefined8 local_58;
  undefined8 uStack_50;
  float local_3c;
  undefined8 local_38;

  local_38 = 0xfffffffffffffffe;
  bVar1 = *(byte *)(param_6 + 0x44);
  local_3c = param_3;
  if (bVar1 - 5 < 0xe) {
                    /* WARNING: Could not emulate address calculation at 0x00014589e7a2 */
                    /* WARNING: Treating indirect jump as call */
    uVar2 = (*(code *)((long)*(int *)((ulong)(bVar1 - 5) * 4 + 0x146c05e98) + 0x146c05e98))();
    return uVar2;
  }
  local_98 = (float *)CONCAT44(local_98._4_4_,param_3 * _DAT_145dad488);
  local_58 = &local_98;
  uStack_50 = 0x145bedee0;
  uVar3 = func_0x000145bdd130(param_6,param_7,0x146bff11c,&local_80,&local_58);
  if (bVar1 == 6) {
    fVar4 = local_3c * _DAT_145dbad30;
    if (_DAT_145db6b48 <= local_3c * _DAT_145dbad30) {
      fVar4 = _DAT_145db6b48;
    }
    func_0x0001458aa2a0(uVar3,fVar4);
LAB_14589e91c:
    if (local_3c * _DAT_145dbad30 < _DAT_146bfedd8) goto LAB_14589e965;
  }
  else {
    local_9c = local_3c * _DAT_145db6b34 * _DAT_145dad488;
    local_98 = &local_9c;
    local_90 = 0x145bedee0;
    func_0x000145bdd130();
    local_b8 = (undefined4)local_58;
    uStack_b4 = local_58._4_4_;
    uStack_b0 = (undefined4)uStack_50;
    uStack_ac = uStack_50._4_4_;
    if (bVar1 == 6) goto LAB_14589e91c;
    if ((bVar1 != 5) || (local_3c < *(float *)(param_6 + 0x40) * _DAT_145dad480 + _DAT_146209850))
    goto LAB_14589e965;
  }
  func_0x00014598ddd0();
LAB_14589e965:
  func_0x00014598ddd0();
  local_68 = local_78;
  func_0x00014589a5f0();
  local_60 = CONCAT44(uStack_ac,uStack_b0);
  func_0x00014589a5f0();
  func_0x00014589a5f0();
  if (CONCAT44(uStack_b4,local_b8) != 0) {
    func_0x0001400021d0();
  }
  if (local_80 != 0) {
    func_0x0001400021d0();
  }
  if (local_98 != (float *)0x0) {
    func_0x0001400021d0();
  }
  if (local_58 != (float **)0x0) {
    func_0x0001400021d0();
  }
  return param_7;
}
