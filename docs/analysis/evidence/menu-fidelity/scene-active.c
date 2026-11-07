/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined1 FUN_140811780(void)

{
  undefined1 uVar1;
  char cVar2;
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
  }
  if (!bVar4) {
    func_0x000145d97960();
  }
  puVar3 = _DAT_14808a9e8;
  if (((((*_DAT_14808a9e8 & 0x7fffffffffffffff) == 0) ||
       (cVar2 = func_0x000145d986f0(), uVar1 = DAT_148044205, cVar2 != '\0')) &&
      (uVar1 = DAT_148044205, (*puVar3 & 0x7fffffffffffffff) != 0)) &&
     (cVar2 = func_0x000145d986f0(), cVar2 == '\0')) {
    DAT_1480441d9 = 1;
  }
  cVar2 = DAT_1480441d8;
  LOCK();
  DAT_1480441d8 = 0;
  UNLOCK();
  if (cVar2 != '\x02') {
    return uVar1;
  }
  func_0x000145d97a20();
  return uVar1;
}
