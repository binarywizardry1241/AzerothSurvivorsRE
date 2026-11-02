/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long *param_3,long param_4)

{
  undefined4 *puVar1;
  long lVar2;
  long lVar3;
  long local_70;
  undefined4 local_58;
  undefined4 uStack_54;
  undefined4 uStack_50;
  undefined4 uStack_4c;
  undefined4 local_48;
  undefined4 uStack_44;
  undefined4 uStack_40;
  undefined4 uStack_3c;

  LOCK();
  _DAT_14804f5c8 = _DAT_14804f5c8 + 1;
  UNLOCK();
  func_0x0001458e3d30();
  lVar3 = *(long *)(param_4 + 0x640);
  if (lVar3 == *(long *)(param_4 + 0x630)) {
    func_0x000145bf4cb0();
  }
  lVar2 = *(long *)(param_4 + 0x638);
  *(ulong *)(lVar2 + 0x10 + lVar3 * 0x18) = CONCAT44(uStack_44,local_48);
  puVar1 = (undefined4 *)(lVar2 + lVar3 * 0x18);
  *puVar1 = local_58;
  puVar1[1] = uStack_54;
  puVar1[2] = uStack_50;
  puVar1[3] = uStack_4c;
  *(long *)(param_4 + 0x640) = lVar3 + 1;
  func_0x0001458e3300();
  func_0x0001458bc860();
  lVar3 = *(long *)(param_4 + 0x628);
  if (lVar3 == *(long *)(param_4 + 0x618)) {
    func_0x000145bf4ee0();
  }
  lVar2 = *(long *)(param_4 + 0x620);
  puVar1 = (undefined4 *)(lVar2 + 0x10 + lVar3 * 0x20);
  *puVar1 = local_48;
  puVar1[1] = uStack_44;
  puVar1[2] = uStack_40;
  puVar1[3] = uStack_3c;
  puVar1 = (undefined4 *)(lVar2 + lVar3 * 0x20);
  *puVar1 = local_58;
  puVar1[1] = uStack_54;
  puVar1[2] = uStack_50;
  puVar1[3] = uStack_4c;
  *(long *)(param_4 + 0x628) = lVar3 + 1;
  if (local_70 != 0) {
    func_0x0001400021d0();
  }
  if (*param_3 != 0) {
    func_0x0001400021d0();
  }
  if (param_3[3] != 0) {
    func_0x0001400021d0();
  }
  return;
}
