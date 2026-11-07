/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_1408116a0(void)

{
  char cVar1;
  undefined1 in_CL;
  ulong *puVar2;
  bool bVar3;

  if (_DAT_148044208 == 0) {
    LOCK();
    bVar3 = DAT_1480441d8 == '\0';
    if (bVar3) {
      DAT_1480441d8 = '\x01';
    }
    UNLOCK();
  }
  else {
    func_0x000145c273e2();
    LOCK();
    bVar3 = DAT_1480441d8 == '\0';
    if (bVar3) {
      DAT_1480441d8 = '\x01';
    }
    UNLOCK();
  }
  if (!bVar3) {
    func_0x000145d97960();
  }
  puVar2 = _DAT_14808a9e8;
  if (((((*_DAT_14808a9e8 & 0x7fffffffffffffff) == 0) ||
       (cVar1 = func_0x000145d986f0(), DAT_148044204 = in_CL, cVar1 != '\0')) &&
      (DAT_148044204 = in_CL, (*puVar2 & 0x7fffffffffffffff) != 0)) &&
     (cVar1 = func_0x000145d986f0(), cVar1 == '\0')) {
    DAT_1480441d9 = 1;
  }
  cVar1 = DAT_1480441d8;
  LOCK();
  DAT_1480441d8 = 0;
  UNLOCK();
  if (cVar1 != '\x02') {
    return;
  }
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}
