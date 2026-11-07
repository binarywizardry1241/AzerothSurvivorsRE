/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,undefined8 *param_3,char *param_4)

{
  undefined8 *puVar1;
  long *plVar2;
  long *plVar3;
  long *plVar4;
  long lVar5;
  long lVar6;
  long lVar7;
  undefined8 local_e0;
  undefined8 uStack_d8;
  undefined8 local_d0;

  lVar6 = *(long *)(param_4 + 0x10);
  if ((lVar6 != 0) && (lVar5 = *(long *)(param_4 + 0x18), lVar6 != lVar5)) {
    lVar7 = 0;
    do {
      func_0x0001459bf500();
      lVar7 = lVar7 + 1;
    } while (lVar7 != ((ulong)(lVar5 - lVar6) >> 3) * 0x4ec4ec4ec4ec4ec5);
  }
  if (*param_4 == '\0') {
    *(undefined8 *)*param_3 = param_3[1];
    return;
  }
  plVar2 = (long *)*param_3;
  lVar6 = param_3[1];
  if (*(long **)(param_4 + 8) == (long *)0x0) goto LAB_1458b95b0;
  lVar5 = param_3[2];
  plVar3 = (long *)**(long **)(param_4 + 8);
  if (*(char *)((long)plVar3 + 0x75) == '\v') {
    plVar4 = (long *)*plVar3;
    if (plVar3[1] == 0xb) {
      if (*(long *)((long)plVar4 + 3) != CONCAT35(uRam0000000146bb36b0,_DAT_146bb36ab) ||
          *plVar4 != CONCAT53(_DAT_146bb36ab,_DAT_146bb36a8)) goto code_r0x0001458b94c1;
    }
    else if ((plVar3[1] != 10) || ((short)plVar4[1] != _DAT_146bb36a6 || *plVar4 != _DAT_146bb369e))
    {
code_r0x0001458b94c1:
      func_0x000145882c60();
    }
  }
  func_0x000145b9c4d0();
  *(undefined8 *)(lVar5 + 0x10 + lVar6 * 0x18) = local_d0;
  puVar1 = (undefined8 *)(lVar5 + lVar6 * 0x18);
  *puVar1 = local_e0;
  puVar1[1] = uStack_d8;
  lVar6 = lVar6 + 1;
LAB_1458b95b0:
  *plVar2 = lVar6;
  return;
}
