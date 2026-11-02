void FUN_14597d600(undefined8 param_1,undefined8 param_2,long *param_3,long *param_4)

{
  long lVar1;
  bool bVar2;
  long *plVar3;
  long lVar4;
  byte bVar5;
  int *piVar6;
  byte bVar7;

  lVar4 = param_3[-1];
  lVar1 = *param_3;
  if (*(long *)(lVar1 + 0x18) == -1) {
    bVar5 = 2;
    if ((*(long *)(lVar1 + 0x40) == -1) && (bVar5 = 3, *(char *)(lVar1 + 0x15c) == '\x01')) {
      piVar6 = (int *)&DAT_1471b41b0;
      goto LAB_14597d62c;
    }
  }
  else {
    bVar5 = 1;
    if (*(char *)(*(long *)(lVar1 + 0x30) + 0x54) != '\0') {
      piVar6 = (int *)&DAT_1471b41b5;
LAB_14597d62c:
      bVar5 = ((char)piVar6[1] != 'l' || *piVar6 != 0x616e6966) * '\x03';
    }
  }
  if (*(long *)(lVar4 + 0x18) == -1) {
    bVar7 = 2;
    if ((*(long *)(lVar4 + 0x40) != -1) || (bVar7 = 3, *(char *)(lVar4 + 0x15c) != '\x01'))
    goto LAB_14597d6de;
    piVar6 = (int *)&DAT_1471b41b0;
  }
  else {
    bVar7 = 1;
    if (*(char *)(*(long *)(lVar4 + 0x30) + 0x54) == '\0') goto LAB_14597d6de;
    piVar6 = (int *)&DAT_1471b41b5;
  }
  bVar7 = ((char)piVar6[1] != 'l' || *piVar6 != 0x616e6966) * '\x03';
LAB_14597d6de:
  bVar2 = (uint)*(undefined8 *)(lVar1 + 0x88) < *(uint *)(lVar4 + 0x88);
  if (bVar5 != bVar7) {
    bVar2 = bVar5 < bVar7;
  }
  if (bVar2) {
    do {
      plVar3 = param_3 + -1;
      *param_3 = lVar4;
      if (plVar3 == param_4) break;
      if (*(long *)(lVar1 + 0x18) == -1) {
        bVar5 = 2;
        if ((*(long *)(lVar1 + 0x40) == -1) &&
           (bVar5 = 3, piVar6 = (int *)&DAT_1471b41b0, *(char *)(lVar1 + 0x15c) == '\x01'))
        goto LAB_14597d787;
      }
      else {
        bVar5 = 1;
        piVar6 = (int *)&DAT_1471b41b5;
        if (*(char *)(*(long *)(lVar1 + 0x30) + 0x54) != '\0') {
LAB_14597d787:
          bVar5 = ((char)piVar6[1] != 'l' || *piVar6 != 0x616e6966) * '\x03';
        }
      }
      lVar4 = param_3[-2];
      if (*(long *)(lVar4 + 0x18) == -1) {
        bVar7 = 2;
        if ((*(long *)(lVar4 + 0x40) == -1) &&
           (bVar7 = 3, piVar6 = (int *)&DAT_1471b41b0, *(char *)(lVar4 + 0x15c) == '\x01'))
        goto LAB_14597d7f5;
      }
      else {
        bVar7 = 1;
        piVar6 = (int *)&DAT_1471b41b5;
        if (*(char *)(*(long *)(lVar4 + 0x30) + 0x54) != '\0') {
LAB_14597d7f5:
          bVar7 = ((char)piVar6[1] != 'l' || *piVar6 != 0x616e6966) * '\x03';
        }
      }
      bVar2 = (uint)*(undefined8 *)(lVar1 + 0x88) < *(uint *)(lVar4 + 0x88);
      if (bVar5 != bVar7) {
        bVar2 = bVar5 < bVar7;
      }
      param_3 = plVar3;
    } while (bVar2);
    *plVar3 = lVar1;
  }
  return;
}
