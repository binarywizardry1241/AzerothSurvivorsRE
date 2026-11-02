/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 FUN_140811980(undefined8 param_1,undefined8 param_2,undefined8 param_3)

{
  char cVar1;
  ulong uVar2;
  undefined8 extraout_RDX;
  undefined8 extraout_RDX_00;
  undefined8 extraout_RDX_01;
  undefined8 extraout_RDX_02;
  byte bVar3;
  ulong *puVar4;
  bool bVar5;

  if (_DAT_148044208 == 0) {
    LOCK();
    bVar5 = DAT_1480441d8 == '\0';
    if (bVar5) {
      DAT_1480441d8 = '\x01';
    }
    UNLOCK();
  }
  else {
    func_0x000145c273e2();
    LOCK();
    bVar5 = DAT_1480441d8 == '\0';
    if (bVar5) {
      DAT_1480441d8 = '\x01';
    }
    UNLOCK();
    param_3 = extraout_RDX;
  }
  if (!bVar5) {
    func_0x000145d97960();
    param_3 = extraout_RDX_00;
  }
  puVar4 = _DAT_14808a9e8;
  if ((*_DAT_14808a9e8 & 0x7fffffffffffffff) == 0) {
    uVar2 = (ulong)DAT_148044205;
  }
  else {
    cVar1 = func_0x000145d986f0();
    uVar2 = (ulong)DAT_148044205;
    bVar3 = DAT_148044204;
    param_3 = extraout_RDX_01;
    if (cVar1 == '\0') goto LAB_1408119d0;
  }
  bVar3 = DAT_148044204;
  if ((*puVar4 & 0x7fffffffffffffff) != 0) {
    cVar1 = func_0x000145d986f0(param_1,uVar2);
    if (cVar1 == '\0') {
      DAT_1480441d9 = 1;
    }
    uVar2 = uVar2 & 0xffffffff;
    param_3 = extraout_RDX_02;
  }
LAB_1408119d0:
  cVar1 = DAT_1480441d8;
  LOCK();
  DAT_1480441d8 = 0;
  UNLOCK();
  if (cVar1 == '\x02') {
    func_0x000145d97a20(param_1,uVar2,param_3,&DAT_1480441d8);
    uVar2 = uVar2 & 0xffffffff;
  }
  return CONCAT71((int7)(uVar2 >> 8),(byte)uVar2 & (bVar3 ^ 1));
}
