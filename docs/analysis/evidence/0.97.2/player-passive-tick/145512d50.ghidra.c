
void entry(undefined8 param_1,undefined8 param_2,byte param_3,long *param_4)

{
  long *plVar1;
  long lVar2;
  long lVar3;
  byte bVar4;
  long lVar5;
  long lVar6;
  ulong uVar7;
  
  lVar2 = *param_4;
  if (lVar2 != param_4[1]) {
    lVar3 = *(long *)(param_4[2] + 0x4c8);
    uVar7 = 0;
    do {
      lVar6 = 0;
      lVar5 = lVar3;
      do {
        if (*(long *)(param_4[2] + 0x4d0) * 0x160 - lVar6 == 0) {
          bVar4 = 0;
          goto LAB_145512d92;
        }
        lVar6 = lVar6 + 0x160;
        plVar1 = (long *)(lVar5 + 0x88);
        lVar5 = lVar5 + 0x160;
      } while (*plVar1 != *(long *)(lVar2 + uVar7 * 0x10));
      bVar4 = (*(long *)(lVar3 + -0x148 + lVar6) != -1) * '\x02' | *(byte *)(lVar3 + -8 + lVar6);
LAB_145512d92:
      if (param_3 < bVar4) {
        bVar4 = param_3;
      }
      param_3 = bVar4;
      uVar7 = uVar7 + 1;
    } while (uVar7 != (ulong)(param_4[1] - lVar2) >> 4);
  }
  return;
}

