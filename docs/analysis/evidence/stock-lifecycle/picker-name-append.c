void entry(undefined8 param_1,undefined8 param_2,int param_3,ulong *param_4)

{
  ulong uVar1;
  long lVar2;
  ulong uVar3;
  ulong uVar4;
  ulong uVar5;
  bool bVar6;

  uVar4 = param_4[1];
  uVar5 = param_4[2];
  if (uVar5 < 0x20) {
    uVar1 = func_0x000145bd5590();
    if (param_3 - 0x61U < 0x1a) goto LAB_140067f10;
LAB_140067ec1:
    if ((0x19 < param_3 - 0x41U) || (0x13 < uVar1)) {
      if (param_3 != 0x20) {
        return;
      }
      if (uVar1 == 0) {
        return;
      }
      if (uVar5 < 0x10) {
        if (uVar5 != 0) {
          uVar3 = 0;
          do {
            if (*(char *)(uVar4 + uVar3) == ' ') {
              return;
            }
            uVar3 = uVar3 + 1;
          } while (uVar5 != uVar3);
        }
        bVar6 = false;
      }
      else {
        lVar2 = func_0x000145bd5860();
        bVar6 = lVar2 == 1;
      }
      if (uVar1 - 0x13 < 0xffffffffffffffec) {
        return;
      }
      if (bVar6) {
        return;
      }
      if (*param_4 == uVar5) {
        func_0x000145bfa970();
        uVar4 = param_4[1];
      }
      *(undefined1 *)(uVar4 + uVar5) = 0x20;
      goto LAB_140067f1f;
    }
  }
  else {
    uVar1 = func_0x000145bd4f70(uVar5,param_4,uVar5,uVar4);
    if (0x19 < param_3 - 0x61U) goto LAB_140067ec1;
LAB_140067f10:
    if (0x13 < uVar1) {
      return;
    }
  }
  if (*param_4 == uVar5) {
    func_0x000145bfa970();
    uVar4 = param_4[1];
  }
  *(char *)(uVar4 + uVar5) = (char)param_3;
LAB_140067f1f:
  param_4[2] = uVar5 + 1;
  return;
}
