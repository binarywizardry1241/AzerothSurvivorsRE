undefined8 * entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 *param_4)

{
  byte bVar1;
  long lVar2;
  code *pcVar3;
  long *plVar4;
  long lVar5;
  byte bVar6;
  long lVar7;
  long lVar8;
  long *plVar9;
  undefined1 auVar10 [16];

  lVar8 = *param_3;
  lVar2 = param_3[1];
  do {
    if (lVar8 == lVar2) {
      *param_4 = 0;
      param_4[1] = 8;
      param_4[2] = 0;
      return param_4;
    }
    lVar8 = lVar8 + 0x10;
    *param_3 = lVar8;
    auVar10 = func_0x0001458e6190();
    lVar7 = auVar10._8_8_;
  } while (lVar7 == 0);
  bVar6 = *(byte *)(lVar8 + -8);
  bVar1 = *(byte *)(lVar7 + 0x72);
  func_0x000140002200();
  plVar4 = (long *)func_0x0001400021c0();
  if (plVar4 != (long *)0x0) {
    if (bVar1 < bVar6) {
      bVar6 = bVar1;
    }
    *plVar4 = lVar7;
    plVar4[1] = auVar10._0_8_;
    *(byte *)(plVar4 + 2) = bVar6;
    lVar7 = 1;
    plVar9 = plVar4;
    while (lVar8 != lVar2) {
      lVar8 = lVar8 + 0x10;
      auVar10 = func_0x0001458e6190();
      lVar5 = auVar10._8_8_;
      if (lVar5 != 0) {
        bVar6 = (byte)*(undefined4 *)(lVar8 + -8);
        if (*(byte *)(lVar5 + 0x72) < bVar6) {
          bVar6 = *(byte *)(lVar5 + 0x72);
        }
        if (lVar7 == 4) {
          func_0x000145bcb2d0();
          plVar9 = plVar4;
        }
        plVar9[lVar7 * 3] = lVar5;
        plVar9[lVar7 * 3 + 1] = auVar10._0_8_;
        *(byte *)(plVar9 + lVar7 * 3 + 2) = bVar6;
        lVar7 = lVar7 + 1;
      }
    }
    param_4[2] = lVar7;
    *param_4 = 4;
    param_4[1] = plVar4;
    return param_4;
  }
  func_0x000145d6944b();
                    /* WARNING: Does not return */
  pcVar3 = (code *)invalidInstructionException();
  (*pcVar3)();
}
