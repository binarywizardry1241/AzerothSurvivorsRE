int FUN_145b5cb20(undefined8 param_1,longlong param_2)

{
  code *pcVar1;
  longlong lVar2;
  char cVar3;
  int iVar4;
  undefined8 uVar5;
  longlong lVar6;
  longlong lVar7;
  longlong lVar8;
  bool bVar9;
  longlong lStack_60;
  byte bStack_4c;

  LOCK();
  bVar9 = DAT_148516728 == '\0';
  if (bVar9) {
    DAT_148516728 = '\x01';
  }
  UNLOCK();
  if (!bVar9) {
    FUN_146139860(&DAT_148516728);
  }
  if ((*DAT_148516b70 & 0x7fffffffffffffff) == 0) {
    bStack_4c = 0;
    lVar2 = DAT_148516738;
    lVar6 = DAT_148516740;
  }
  else {
    bStack_4c = func_0x00014613a5f0();
    bStack_4c = bStack_4c ^ 1;
    lVar2 = DAT_148516738;
    lVar6 = DAT_148516740;
  }
  DAT_148516738 = lVar2;
  DAT_148516740 = lVar6;
  if (lVar6 != 0) {
    lVar8 = 0;
    lVar7 = 0;
    do {
      if ((*(longlong *)(lVar2 + 0x10 + lVar7) == param_2) &&
         (iVar4 = func_0x000145f941e7(*(undefined8 *)(lVar2 + 8 + lVar7),param_1,param_2),
         iVar4 == 0)) {
        if (bStack_4c != 0) goto LAB_145b5ccdd;
        goto LAB_145b5cccb;
      }
      lVar8 = lVar8 + 1;
      lVar7 = lVar7 + 0x18;
    } while (lVar6 * 0x18 != lVar7);
  }
  if (param_2 < 0) {
    uVar5 = 0;
LAB_145b5cc22:
    FUN_14613b1bb(uVar5,param_2);
                    /* WARNING: Does not return */
    pcVar1 = (code *)invalidInstructionException();
    (*pcVar1)();
  }
  if (param_2 == 0) {
    lStack_60 = 1;
    lVar8 = lVar6;
    if (lVar6 != DAT_148516730) goto LAB_145b5cc99;
  }
  else {
    func_0x000140002200();
    uVar5 = 1;
    lStack_60 = func_0x0001400021c0(param_2,1);
    if (lStack_60 == 0) goto LAB_145b5cc22;
    func_0x000145f941db(lStack_60,param_1,param_2);
    lVar6 = DAT_148516740;
    lVar8 = DAT_148516740;
    if (DAT_148516740 != DAT_148516730) goto LAB_145b5cc99;
  }
  FUN_145f94690(&DAT_148516730);
  lVar8 = lVar6;
LAB_145b5cc99:
  lVar2 = DAT_148516738;
  *(longlong *)(DAT_148516738 + lVar8 * 0x18) = param_2;
  *(longlong *)(lVar2 + 8 + lVar8 * 0x18) = lStack_60;
  *(longlong *)(lVar2 + 0x10 + lVar8 * 0x18) = param_2;
  DAT_148516740 = lVar8 + 1;
  if (bStack_4c == 0) {
LAB_145b5cccb:
    if (((*DAT_148516b70 & 0x7fffffffffffffff) != 0) &&
       (cVar3 = func_0x00014613a5f0(), cVar3 == '\0')) {
      DAT_148516729 = 1;
    }
  }
LAB_145b5ccdd:
  cVar3 = DAT_148516728;
  LOCK();
  DAT_148516728 = 0;
  UNLOCK();
  if (cVar3 == '\x02') {
    func_0x000146139920(&DAT_148516728);
  }
  return (int)lVar8 + 0xf00000;
}
