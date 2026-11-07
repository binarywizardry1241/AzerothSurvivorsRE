int FUN_145b78be0(undefined8 param_1,longlong param_2)

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
  bVar9 = DAT_1485c6758 == '\0';
  if (bVar9) {
    DAT_1485c6758 = '\x01';
  }
  UNLOCK();
  if (!bVar9) {
    FUN_146192760(&DAT_1485c6758);
  }
  if ((*DAT_1485c6b78 & 0x7fffffffffffffff) == 0) {
    bStack_4c = 0;
    lVar2 = DAT_1485c6768;
    lVar6 = DAT_1485c6770;
  }
  else {
    bStack_4c = func_0x0001461934f0();
    bStack_4c = bStack_4c ^ 1;
    lVar2 = DAT_1485c6768;
    lVar6 = DAT_1485c6770;
  }
  DAT_1485c6768 = lVar2;
  DAT_1485c6770 = lVar6;
  if (lVar6 != 0) {
    lVar8 = 0;
    lVar7 = 0;
    do {
      if ((*(longlong *)(lVar2 + 0x10 + lVar7) == param_2) &&
         (iVar4 = func_0x000145febc27(*(undefined8 *)(lVar2 + 8 + lVar7),param_1,param_2),
         iVar4 == 0)) {
        if (bStack_4c != 0) goto LAB_145b78d9d;
        goto LAB_145b78d8b;
      }
      lVar8 = lVar8 + 1;
      lVar7 = lVar7 + 0x18;
    } while (lVar6 * 0x18 != lVar7);
  }
  if (param_2 < 0) {
    uVar5 = 0;
LAB_145b78ce2:
    FUN_1461940bb(uVar5,param_2);
                    /* WARNING: Does not return */
    pcVar1 = (code *)invalidInstructionException();
    (*pcVar1)();
  }
  if (param_2 == 0) {
    lStack_60 = 1;
    lVar8 = lVar6;
    if (lVar6 != DAT_1485c6760) goto LAB_145b78d59;
  }
  else {
    func_0x000140002200();
    uVar5 = 1;
    lStack_60 = func_0x0001400021c0(param_2,1);
    if (lStack_60 == 0) goto LAB_145b78ce2;
    func_0x000145febc1b(lStack_60,param_1,param_2);
    lVar6 = DAT_1485c6770;
    lVar8 = DAT_1485c6770;
    if (DAT_1485c6770 != DAT_1485c6760) goto LAB_145b78d59;
  }
  FUN_145fec430(&DAT_1485c6760);
  lVar8 = lVar6;
LAB_145b78d59:
  lVar2 = DAT_1485c6768;
  *(longlong *)(DAT_1485c6768 + lVar8 * 0x18) = param_2;
  *(longlong *)(lVar2 + 8 + lVar8 * 0x18) = lStack_60;
  *(longlong *)(lVar2 + 0x10 + lVar8 * 0x18) = param_2;
  DAT_1485c6770 = lVar8 + 1;
  if (bStack_4c == 0) {
LAB_145b78d8b:
    if (((*DAT_1485c6b78 & 0x7fffffffffffffff) != 0) &&
       (cVar3 = func_0x0001461934f0(), cVar3 == '\0')) {
      DAT_1485c6759 = 1;
    }
  }
LAB_145b78d9d:
  cVar3 = DAT_1485c6758;
  LOCK();
  DAT_1485c6758 = 0;
  UNLOCK();
  if (cVar3 == '\x02') {
    func_0x000146192820(&DAT_1485c6758);
  }
  return (int)lVar8 + 0xf00000;
}
