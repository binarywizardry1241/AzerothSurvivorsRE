/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

int entry(undefined8 param_1,undefined8 param_2,long param_3)

{
  code *pcVar1;
  long lVar2;
  long lVar3;
  char cVar4;
  int iVar5;
  long lVar6;
  long lVar7;
  long lVar8;
  bool bVar9;
  long local_60;
  byte local_4c;

  LOCK();
  bVar9 = DAT_1482147d8 == '\0';
  if (bVar9) {
    DAT_1482147d8 = '\x01';
  }
  UNLOCK();
  if (!bVar9) {
    func_0x000145eb5670();
  }
  if ((*_DAT_148214a38 & 0x7fffffffffffffff) == 0) {
    local_4c = 0;
    lVar3 = _DAT_1482147e8;
    lVar6 = _DAT_1482147f0;
  }
  else {
    local_4c = func_0x000145eb6400();
    local_4c = local_4c ^ 1;
    lVar3 = _DAT_1482147e8;
    lVar6 = _DAT_1482147f0;
  }
  _DAT_1482147e8 = lVar3;
  _DAT_1482147f0 = lVar6;
  if (lVar6 != 0) {
    lVar2 = lVar6 * 0x18;
    lVar8 = 0;
    lVar7 = 0;
    do {
      if ((*(long *)(lVar3 + 0x10 + lVar7) == param_3) &&
         (iVar5 = func_0x000145d14601(), iVar5 == 0)) {
        if (local_4c != 0) goto LAB_1459a910d;
        goto LAB_1459a90fb;
      }
      lVar8 = lVar8 + 1;
      lVar7 = lVar7 + 0x18;
    } while (lVar2 != lVar7);
  }
  if (param_3 < 0) {
LAB_1459a9052:
    func_0x000145eb6fcb();
                    /* WARNING: Does not return */
    pcVar1 = (code *)invalidInstructionException();
    (*pcVar1)();
  }
  if (param_3 == 0) {
    local_60 = 1;
    lVar8 = lVar6;
    if (lVar6 != _DAT_1482147e0) goto LAB_1459a90c9;
  }
  else {
    func_0x000140002200();
    local_60 = func_0x0001400021c0();
    if (local_60 == 0) goto LAB_1459a9052;
    func_0x000145d145fb();
    lVar6 = _DAT_1482147f0;
    lVar8 = _DAT_1482147f0;
    if (_DAT_1482147f0 != _DAT_1482147e0) goto LAB_1459a90c9;
  }
  func_0x000145d14e50();
  lVar8 = lVar6;
LAB_1459a90c9:
  lVar3 = _DAT_1482147e8;
  *(long *)(_DAT_1482147e8 + lVar8 * 0x18) = param_3;
  *(long *)(lVar3 + 8 + lVar8 * 0x18) = local_60;
  *(long *)(lVar3 + 0x10 + lVar8 * 0x18) = param_3;
  _DAT_1482147f0 = lVar8 + 1;
  if (local_4c == 0) {
LAB_1459a90fb:
    if (((*_DAT_148214a38 & 0x7fffffffffffffff) != 0) &&
       (cVar4 = func_0x000145eb6400(), cVar4 == '\0')) {
      DAT_1482147d9 = 1;
    }
  }
LAB_1459a910d:
  cVar4 = DAT_1482147d8;
  iVar5 = (int)lVar8;
  LOCK();
  DAT_1482147d8 = 0;
  UNLOCK();
  if (cVar4 == '\x02') {
    func_0x000145eb5730();
  }
  return iVar5 + 0xf00000;
}
