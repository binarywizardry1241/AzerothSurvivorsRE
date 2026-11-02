/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_140811850(void)

{
  char cVar1;
  undefined4 *in_RCX;
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
  if ((*_DAT_14808a9e8 & 0x7fffffffffffffff) == 0) {
    _DAT_1480441fc = *(undefined8 *)(in_RCX + 8);
    _DAT_1480441dc = *in_RCX;
    uRam00000001480441e0 = in_RCX[1];
    uRam00000001480441e4 = in_RCX[2];
    uRam00000001480441e8 = in_RCX[3];
    _DAT_1480441ec = in_RCX[4];
    uRam00000001480441f0 = in_RCX[5];
    uRam00000001480441f4 = in_RCX[6];
    uRam00000001480441f8 = in_RCX[7];
  }
  else {
    cVar1 = func_0x000145d986f0();
    _DAT_1480441fc = *(undefined8 *)(in_RCX + 8);
    _DAT_1480441dc = *in_RCX;
    uRam00000001480441e0 = in_RCX[1];
    uRam00000001480441e4 = in_RCX[2];
    uRam00000001480441e8 = in_RCX[3];
    _DAT_1480441ec = in_RCX[4];
    uRam00000001480441f0 = in_RCX[5];
    uRam00000001480441f4 = in_RCX[6];
    uRam00000001480441f8 = in_RCX[7];
    if (cVar1 == '\0') goto LAB_1408118be;
  }
  if (((*puVar2 & 0x7fffffffffffffff) != 0) && (cVar1 = func_0x000145d986f0(), cVar1 == '\0')) {
    DAT_1480441d9 = 1;
  }
LAB_1408118be:
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
