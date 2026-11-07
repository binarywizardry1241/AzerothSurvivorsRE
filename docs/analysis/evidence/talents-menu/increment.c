undefined8 FUN_14590f950(void)

{
  char *pcVar1;
  long lVar2;
  char cVar3;
  int iVar4;
  long *in_RCX;
  long lVar5;
  long in_R9;
  long lVar6;
  long lVar7;
  undefined1 auVar8 [16];

  cVar3 = FUN_145910250();
  if (cVar3 != '\0') {
    auVar8 = FUN_145912d90();
    if (auVar8._8_8_ != 0) {
      lVar7 = in_RCX[1];
      lVar2 = in_RCX[2];
      lVar6 = lVar2 * 0x10;
      if (lVar2 != 0) {
        lVar5 = 0;
        do {
          if ((*(long *)(*(long *)(lVar7 + lVar5) + 0x28) == in_R9) &&
             (iVar4 = func_0x000145bfa0e1(), iVar4 == 0)) {
            pcVar1 = (char *)(lVar7 + 8 + lVar5);
            *pcVar1 = *pcVar1 + '\x01';
            return 1;
          }
          lVar5 = lVar5 + 0x10;
        } while (lVar6 != lVar5);
      }
      if (lVar2 == *in_RCX) {
        func_0x000145bfaef0();
        lVar7 = in_RCX[1];
      }
      *(long *)(lVar7 + lVar6) = auVar8._8_8_;
      *(undefined1 *)(lVar7 + 8 + lVar6) = 1;
      in_RCX[2] = lVar2 + 1;
      return 1;
    }
  }
  return 0;
}
