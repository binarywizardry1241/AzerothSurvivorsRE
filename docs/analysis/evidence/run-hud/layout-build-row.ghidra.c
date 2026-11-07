/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long param_3,long param_4,undefined8 *param_5)

{
  long *plVar1;
  long lVar2;
  code *pcVar3;
  char *pcVar4;
  long lVar5;
  long lVar6;
  ulong uVar7;
  ulong uVar8;
  long lVar9;

  plVar1 = (long *)*param_5;
  lVar6 = param_5[1];
  if (param_4 != param_3) {
    lVar2 = param_5[2];
    uVar7 = (ulong)(param_3 - param_4) >> 5;
    uVar8 = 0;
    do {
      pcVar4 = (char *)func_0x000142ad39e0();
      if (pcVar4 == (char *)0x0) {
        pcVar4 = _DAT_147fda290;
      }
      if (*pcVar4 == '\x03') {
        lVar9 = *(long *)(pcVar4 + 0x18);
        if (lVar9 < 0) {
LAB_14014adf9:
          func_0x000145d6944b();
                    /* WARNING: Does not return */
          pcVar3 = (code *)invalidInstructionException();
          (*pcVar3)();
        }
        if (lVar9 == 0) goto LAB_14014adb0;
        func_0x000140002200();
        lVar5 = func_0x0001400021c0();
        if (lVar5 == 0) goto LAB_14014adf9;
        func_0x000145bc977b();
      }
      else {
LAB_14014adb0:
        lVar5 = 1;
        lVar9 = 0;
      }
      *(long *)(lVar2 + lVar6 * 0x18) = lVar9;
      *(long *)(lVar2 + 8 + lVar6 * 0x18) = lVar5;
      *(long *)(lVar2 + 0x10 + lVar6 * 0x18) = lVar9;
      lVar6 = lVar6 + 1;
      uVar8 = uVar8 + 1;
    } while (uVar8 != uVar7);
  }
  *plVar1 = lVar6;
  return;
}
