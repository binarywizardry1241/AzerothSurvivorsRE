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
  bVar9 = DAT_148516728 == '\0';
  if (bVar9) {
    DAT_148516728 = '\x01';
  }
  UNLOCK();
  if (!bVar9) {
    func_0x0001461393e0();
  }
  if ((*_DAT_148516b70 & 0x7fffffffffffffff) == 0) {
    local_4c = 0;
    lVar3 = _DAT_148516738;
    lVar6 = _DAT_148516740;
  }
  else {
    local_4c = func_0x00014613a170();
    local_4c = local_4c ^ 1;
    lVar3 = _DAT_148516738;
    lVar6 = _DAT_148516740;
  }
  _DAT_148516738 = lVar3;
  _DAT_148516740 = lVar6;
  if (lVar6 != 0) {
    lVar2 = lVar6 * 0x18;
    lVar8 = 0;
    lVar7 = 0;
    do {
      if ((*(long *)(lVar3 + 0x10 + lVar7) == param_3) &&
         (iVar5 = func_0x000145f93d67(), iVar5 == 0)) {
        if (local_4c != 0) goto LAB_145b5cc2d;
        goto LAB_145b5cc1b;
      }
      lVar8 = lVar8 + 1;
      lVar7 = lVar7 + 0x18;
    } while (lVar2 != lVar7);
  }
  if (param_3 < 0) {
LAB_145b5cb72:
    func_0x00014613ad3b();
                    /* WARNING: Does not return */
    pcVar1 = (code *)invalidInstructionException();
    (*pcVar1)();
  }
  if (param_3 == 0) {
    local_60 = 1;
    lVar8 = lVar6;
    if (lVar6 != _DAT_148516730) goto LAB_145b5cbe9;
  }
  else {
    func_0x000140002200();
    local_60 = func_0x0001400021c0();
    if (local_60 == 0) goto LAB_145b5cb72;
    func_0x000145f93d5b();
    lVar6 = _DAT_148516740;
    lVar8 = _DAT_148516740;
    if (_DAT_148516740 != _DAT_148516730) goto LAB_145b5cbe9;
  }
  func_0x000145f94210();
  lVar8 = lVar6;
LAB_145b5cbe9:
  lVar3 = _DAT_148516738;
  *(long *)(_DAT_148516738 + lVar8 * 0x18) = param_3;
  *(long *)(lVar3 + 8 + lVar8 * 0x18) = local_60;
  *(long *)(lVar3 + 0x10 + lVar8 * 0x18) = param_3;
  _DAT_148516740 = lVar8 + 1;
  if (local_4c == 0) {
LAB_145b5cc1b:
    if (((*_DAT_148516b70 & 0x7fffffffffffffff) != 0) &&
       (cVar4 = func_0x00014613a170(), cVar4 == '\0')) {
      DAT_148516729 = 1;
    }
  }
LAB_145b5cc2d:
  cVar4 = DAT_148516728;
  iVar5 = (int)lVar8;
  LOCK();
  DAT_148516728 = 0;
  UNLOCK();
  if (cVar4 == '\x02') {
    func_0x0001461394a0();
  }
  return iVar5 + 0xf00000;
}
