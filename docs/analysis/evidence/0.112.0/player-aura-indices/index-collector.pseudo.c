
void FUN_1458e70c0(longlong *param_1,char *param_2,longlong param_3)

{
  char *pcVar1;
  char cVar2;
  longlong lVar3;
  char *pcVar4;
  longlong lVar5;
  undefined1 uVar6;
  longlong lVar7;
  longlong lVar8;
  longlong lVar9;
  longlong lStack_60;
  longlong *plStack_58;
  longlong lStack_50;
  undefined8 uStack_48;

  uStack_48 = 0xfffffffffffffffe;
  lStack_60 = 0;
  plStack_58 = (longlong *)&DAT_00000008;
  lStack_50 = 0;
  lVar7 = param_3 * 0x40;
  pcVar1 = param_2 + lVar7;
  lVar8 = 0;
  if (param_3 == 0) {
    lVar9 = 0;
  }
  else {
    lVar9 = 0;
    lVar5 = 0;
    do {
      if (((byte)param_2[lVar9] < 0x20) && ((0x80140000U >> ((byte)param_2[lVar9] & 0x1f) & 1) != 0)
         ) {
        FUN_145c0dcb0(&lStack_60);
        *plStack_58 = lVar5;
        *(undefined1 *)(plStack_58 + 1) = 0;
        lStack_50 = 1;
        lVar8 = 1;
        break;
      }
      lVar5 = lVar5 + 1;
      lVar9 = lVar9 + 0x40;
    } while (lVar7 != lVar9);
    lVar9 = 0;
    lVar3 = 0;
    lVar5 = 0;
    do {
      if (param_2[lVar3] == '\x13') {
        uVar6 = 2;
        if (lVar8 == lStack_60) {
          FUN_145c0dcb0(&lStack_60);
        }
        lVar9 = 0;
        goto LAB_1458e71a1;
      }
      lVar5 = lVar5 + 1;
      lVar3 = lVar3 + 0x40;
    } while (lVar7 != lVar3);
  }
  do {
    lVar7 = 0;
    pcVar4 = param_2;
    do {
      if (pcVar4 == pcVar1) {
        param_1[2] = lStack_50;
        *param_1 = lStack_60;
        param_1[1] = (longlong)plStack_58;
        return;
      }
      param_2 = pcVar4 + 0x40;
      lVar7 = lVar7 + -1;
      cVar2 = *pcVar4;
      pcVar4 = param_2;
    } while (cVar2 != '\x0f');
    lVar9 = lVar9 - lVar7;
    lVar5 = lVar9 + -1;
    uVar6 = 1;
    if (lVar8 == lStack_60) {
      FUN_145c0dcb0(&lStack_60);
    }
LAB_1458e71a1:
    plStack_58[lVar8 * 2] = lVar5;
    *(undefined1 *)(plStack_58 + lVar8 * 2 + 1) = uVar6;
    lVar8 = lVar8 + 1;
    lStack_50 = lVar8;
  } while( true );
}
