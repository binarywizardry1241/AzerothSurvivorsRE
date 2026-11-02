void entry(void)

{
  long *plVar1;
  long *plVar2;
  long lVar3;
  long lVar4;
  code *pcVar5;
  long lVar6;
  long lVar7;
  long lVar8;
  long lVar9;
  undefined8 *in_RCX;

  in_RCX = (undefined8 *)*in_RCX;
  plVar1 = (long *)*in_RCX;
  plVar2 = (long *)in_RCX[1];
  *in_RCX = 0;
  if (plVar1 == (long *)0x0) {
    func_0x000145d69740();
                    /* WARNING: Does not return */
    pcVar5 = (code *)invalidInstructionException();
    (*pcVar5)();
  }
  lVar3 = *plVar1;
  *plVar1 = 0;
  if (lVar3 != 0) {
    lVar4 = plVar1[5];
    lVar6 = plVar1[1];
    lVar7 = plVar1[2];
    lVar8 = plVar1[3];
    lVar9 = plVar1[4];
    *plVar2 = lVar3;
    plVar2[1] = lVar6;
    plVar2[2] = lVar7;
    plVar2[3] = lVar8;
    plVar2[4] = lVar9;
    plVar2[5] = lVar4;
    return;
  }
  func_0x000145d69740();
                    /* WARNING: Does not return */
  pcVar5 = (code *)invalidInstructionException();
  (*pcVar5)();
}
