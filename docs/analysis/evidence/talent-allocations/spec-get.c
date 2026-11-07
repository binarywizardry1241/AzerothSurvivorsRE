ulong * entry(undefined8 param_1,undefined8 param_2,long param_3,ulong *param_4,char param_5,
             ulong param_6)

{
  char *pcVar1;
  code *pcVar2;
  ulong uVar3;
  ulong uVar4;
  long lVar5;
  uint uVar6;
  uint uVar7;
  uint uVar8;
  long lVar9;
  long lVar10;
  uint uVar11;
  ulong uVar12;
  long lVar13;

  lVar5 = *(long *)(param_3 + 0x80);
  lVar9 = *(long *)(param_3 + 0x88) * 0x50;
  uVar12 = 0;
  lVar10 = 0;
  do {
    if (lVar9 == lVar10) goto LAB_1458d2388;
    lVar13 = lVar10 + 0x50;
    pcVar1 = (char *)(lVar5 + lVar10);
    lVar10 = lVar13;
  } while (*pcVar1 != param_5);
  uVar12 = (ulong)*(byte *)(lVar5 + -0x4f + lVar13);
LAB_1458d2388:
  if (param_6 == uVar12) {
    lVar9 = 0;
    lVar5 = *(long *)(param_3 + 0x68);
    do {
      if (*(long *)(param_3 + 0x70) << 5 == lVar9) goto LAB_1458d24e1;
      lVar9 = lVar9 + 0x20;
      pcVar1 = (char *)(lVar5 + 4);
      lVar5 = lVar5 + 0x20;
    } while (*pcVar1 != param_5);
    uVar12 = *(ulong *)(*(long *)(param_3 + 0x68) + -8 + lVar9);
    if (0x7ffffffffffffff8 < uVar12 << 4 || uVar12 >> 0x3c != 0) {
LAB_1458d23eb:
      func_0x000145da94eb();
                    /* WARNING: Does not return */
      pcVar2 = (code *)invalidInstructionException();
      (*pcVar2)();
    }
    if (uVar12 << 4 == 0) {
      uVar4 = 8;
      uVar3 = 0;
    }
    else {
      func_0x000140002200();
      uVar4 = func_0x0001400021c0();
      uVar3 = uVar12;
      if (uVar4 == 0) goto LAB_1458d23eb;
    }
    if (uVar12 != 0) {
      func_0x000145c0a3db();
    }
    *param_4 = uVar3;
    param_4[1] = uVar4;
    param_4[2] = uVar12;
  }
  else {
    uVar8 = 0;
    lVar10 = 0;
    do {
      if (*(long *)(param_3 + 0x70) << 5 == lVar10) goto LAB_1458d2428;
      lVar13 = lVar10 + 0x20;
      pcVar1 = (char *)(*(long *)(param_3 + 0x68) + 4 + lVar10);
      lVar10 = lVar13;
    } while (*pcVar1 != param_5);
    uVar8 = *(uint *)(*(long *)(param_3 + 0x68) + -0x20 + lVar13);
LAB_1458d2428:
    uVar11 = 0x6e;
    do {
      uVar6 = uVar8 - (uVar11 - 0x1e);
      if (((uVar8 < uVar11 - 0x1e) || (uVar7 = uVar6 - (uVar11 - 0xf), uVar6 < uVar11 - 0xf)) ||
         (uVar8 = uVar7 - uVar11, uVar7 < uVar11)) break;
      uVar11 = uVar11 + 0x2d;
    } while (uVar11 != 0x36b);
    lVar10 = 0;
    do {
      lVar13 = lVar10;
      if (lVar9 == lVar13) goto LAB_1458d24e1;
      lVar10 = lVar13 + 0x50;
    } while (*(char *)(lVar5 + lVar13) != param_5);
    if (param_6 < 3) {
      uVar12 = *(ulong *)(lVar13 + 0x18 + lVar5 + param_6 * 0x18);
      if (0x7ffffffffffffff8 < uVar12 << 4 || uVar12 >> 0x3c != 0) {
LAB_1458d24d4:
        func_0x000145da94eb();
                    /* WARNING: Does not return */
        pcVar2 = (code *)invalidInstructionException();
        (*pcVar2)();
      }
      if (uVar12 << 4 != 0) {
        func_0x000140002200();
        lVar5 = func_0x0001400021c0();
        if (lVar5 == 0) goto LAB_1458d24d4;
      }
      if (uVar12 != 0) {
        func_0x000145c0a3db();
      }
      FUN_14599fe20(param_4);
    }
    else {
LAB_1458d24e1:
      *param_4 = 0;
      param_4[1] = 8;
      param_4[2] = 0;
    }
  }
  return param_4;
}
