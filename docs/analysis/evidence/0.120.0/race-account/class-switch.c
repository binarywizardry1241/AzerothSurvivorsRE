undefined8
entry(undefined8 param_1,undefined8 param_2,long param_3,undefined8 param_4,long param_5,
     undefined4 param_6)

{
  long lVar1;
  char *pcVar2;
  ulong uVar3;
  undefined1 uVar4;
  ulong uVar5;
  long lVar6;

  *(char *)(param_5 + 0x38) = (char)param_6;
  lVar6 = 0;
  do {
    if (*(long *)(param_3 + 0x178) << 3 == lVar6) {
      uVar4 = func_0x000145a8bf80(param_1,param_4,param_6,param_3,*(undefined1 *)(param_5 + 0x39));
      *(undefined1 *)(param_5 + 0x39) = uVar4;
      lVar6 = func_0x000145a801a0(*(undefined1 *)(param_5 + 0x3a));
      if (lVar6 == 0) {
        uVar5 = 0;
      }
      else {
        func_0x000145e29ba0();
        uVar5 = 0;
      }
      goto LAB_145a8c1b2;
    }
    lVar1 = lVar6 + 8;
    pcVar2 = (char *)(*(long *)(param_3 + 0x170) + lVar6);
    lVar6 = lVar1;
  } while (*pcVar2 != (char)param_6);
  uVar3 = *(ulong *)(*(long *)(param_3 + 0x170) + -8 + lVar1);
  uVar5 = uVar3 >> 0x18;
  *(short *)(param_5 + 0x39) = (short)(uVar3 >> 8);
LAB_145a8c1b2:
  *(int *)(param_5 + 0x3b) = (int)uVar5;
  *(char *)(param_5 + 0x3f) = (char)(uVar5 >> 0x20);
  func_0x000145a8b4c0();
  return param_4;
}
