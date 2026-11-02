
void entry(undefined8 param_1,undefined8 param_2,ulong param_3,long *param_4,ulong param_5)

{
  long lVar1;
  code *pcVar2;
  long *plVar3;
  long lVar4;
  long lVar5;
  long *plVar6;
  long lVar7;

  if (param_3 <= param_5 - 1) {
                    /* WARNING: Does not return */
    pcVar2 = (code *)invalidInstructionException();
    (*pcVar2)();
  }
  if (param_5 != param_3) {
    plVar3 = param_4 + param_5;
    lVar4 = param_5 << 3;
    do {
      lVar5 = plVar3[-1];
      lVar1 = *plVar3;
      lVar7 = lVar4;
      if ((long)((ulong)((long)*(ulong *)(lVar5 + 0x30) >> 0x3f) >> 1 ^ *(ulong *)(lVar5 + 0x30)) <
          (long)((ulong)((long)*(ulong *)(lVar1 + 0x30) >> 0x3f) >> 1 ^ *(ulong *)(lVar1 + 0x30))) {
        do {
          *(long *)((long)param_4 + lVar7) = lVar5;
          plVar6 = param_4;
          if (lVar7 == 8) goto LAB_1458a24e3;
          lVar5 = *(long *)((long)param_4 + lVar7 + -0x10);
          lVar7 = lVar7 + -8;
        } while ((long)((ulong)((long)*(ulong *)(lVar5 + 0x30) >> 0x3f) >> 1 ^
                       *(ulong *)(lVar5 + 0x30)) <
                 (long)((ulong)((long)*(ulong *)(lVar1 + 0x30) >> 0x3f) >> 1 ^
                       *(ulong *)(lVar1 + 0x30)));
        plVar6 = (long *)(lVar7 + (long)param_4);
LAB_1458a24e3:
        *plVar6 = lVar1;
      }
      plVar3 = plVar3 + 1;
      lVar4 = lVar4 + 8;
    } while (plVar3 != param_4 + param_3);
  }
  return;
}
