/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 * entry(void)

{
  byte bVar1;
  char cVar2;
  undefined4 *in_RCX;
  ulong *puVar3;
  bool bVar4;

  if (_DAT_148041258 == 0) {
    LOCK();
    bVar4 = DAT_148041180 == '\0';
    if (bVar4) {
      DAT_148041180 = '\x01';
    }
    UNLOCK();
  }
  else {
    func_0x000145c2742b();
    LOCK();
    bVar4 = DAT_148041180 == '\0';
    if (bVar4) {
      DAT_148041180 = '\x01';
    }
    UNLOCK();
  }
  if (!bVar4) {
    func_0x000145d97960();
  }
  bVar1 = 0;
  puVar3 = _DAT_14808a9e8;
  if ((*_DAT_14808a9e8 & 0x7fffffffffffffff) != 0) {
    bVar1 = func_0x000145d986f0();
    bVar1 = bVar1 ^ 1;
  }
  if ((DAT_1480411a8 & 1) == 0) {
    *in_RCX = 0;
  }
  else {
    *(undefined8 *)(in_RCX + 1) = _DAT_1480411a0;
    *(undefined8 *)(in_RCX + 3) = _DAT_14804124c;
    *in_RCX = 1;
  }
  if (((bVar1 == 0) && ((*puVar3 & 0x7fffffffffffffff) != 0)) &&
     (cVar2 = func_0x000145d986f0(), cVar2 == '\0')) {
    DAT_148041181 = 1;
  }
  cVar2 = DAT_148041180;
  LOCK();
  DAT_148041180 = 0;
  UNLOCK();
  if (cVar2 == '\x02') {
    func_0x000145d97a20();
  }
  return in_RCX;
}
