/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

ulong FUN_140811b40(undefined8 param_1,undefined8 param_2,undefined8 param_3)

{
  char cVar1;
  ulong uVar2;
  undefined8 extraout_RDX;
  undefined8 extraout_RDX_00;
  undefined8 extraout_RDX_01;
  undefined8 extraout_RDX_02;
  ulong *puVar3;
  bool bVar4;

  if (_DAT_148044208 == 0) {
    LOCK();
    bVar4 = DAT_1480441d8 == '\0';
    if (bVar4) {
      DAT_1480441d8 = '\x01';
    }
    UNLOCK();
  }
  else {
    func_0x000145c273e2();
    LOCK();
    bVar4 = DAT_1480441d8 == '\0';
    if (bVar4) {
      DAT_1480441d8 = '\x01';
    }
    UNLOCK();
    param_3 = extraout_RDX;
  }
  if (!bVar4) {
    func_0x000145d97960();
    param_3 = extraout_RDX_00;
  }
  puVar3 = _DAT_14808a9e8;
  if ((*_DAT_14808a9e8 & 0x7fffffffffffffff) == 0) {
    uVar2 = (ulong)_DAT_1480441dc;
  }
  else {
    cVar1 = func_0x000145d986f0();
    uVar2 = (ulong)_DAT_1480441dc;
    param_3 = extraout_RDX_01;
    if (cVar1 == '\0') goto LAB_140811b87;
  }
  if ((*puVar3 & 0x7fffffffffffffff) != 0) {
    cVar1 = func_0x000145d986f0(param_1,uVar2);
    if (cVar1 == '\0') {
      DAT_1480441d9 = 1;
    }
    uVar2 = uVar2 & 0xffffffff;
    param_3 = extraout_RDX_02;
  }
LAB_140811b87:
  cVar1 = DAT_1480441d8;
  LOCK();
  DAT_1480441d8 = 0;
  UNLOCK();
  if (cVar1 != '\x02') {
    return uVar2;
  }
  func_0x000145d97a20(param_1,uVar2,param_3,&DAT_1480441d8);
  return uVar2 & 0xffffffff;
}
