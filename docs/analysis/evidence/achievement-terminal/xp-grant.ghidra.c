int entry(undefined8 param_1,undefined8 param_2,char param_3,long param_4,uint param_5)

{
  long lVar1;
  char *pcVar2;
  uint *puVar3;
  int iVar4;
  long lVar5;
  int iVar6;
  long lVar7;
  long lVar8;
  long lVar9;
  uint uVar10;
  uint uVar11;
  uint uVar12;
  uint uVar13;

  lVar9 = *(long *)(param_4 + 0x68);
  lVar7 = *(long *)(param_4 + 0x70);
  lVar8 = lVar7 << 5;
  uVar12 = 0;
  lVar5 = 0;
  do {
    if (lVar8 == lVar5) goto LAB_1458d3018;
    lVar1 = lVar5 + 0x20;
    pcVar2 = (char *)(lVar9 + 4 + lVar5);
    lVar5 = lVar1;
  } while (*pcVar2 != param_3);
  uVar12 = *(uint *)(lVar9 + -0x20 + lVar1);
LAB_1458d3018:
  uVar13 = 0x6e;
  iVar4 = 2;
  do {
    uVar10 = uVar12 - (uVar13 - 0x1e);
    if (uVar12 < uVar13 - 0x1e) {
      iVar4 = iVar4 + -2;
      goto LAB_1458d3065;
    }
    uVar11 = uVar10 - (uVar13 - 0xf);
    if (uVar10 < uVar13 - 0xf) {
      iVar4 = iVar4 + -1;
      goto LAB_1458d3065;
    }
    uVar12 = uVar11 - uVar13;
    if (uVar11 < uVar13) goto LAB_1458d3065;
    uVar13 = uVar13 + 0x2d;
    iVar4 = iVar4 + 3;
  } while (uVar13 != 0x36b);
  iVar4 = 0x33;
LAB_1458d3065:
  lVar5 = 0;
  do {
    if (lVar8 == lVar5) {
      if (lVar7 == *(long *)(param_4 + 0x60)) {
        func_0x000145c0dbd0();
        lVar9 = *(long *)(param_4 + 0x68);
      }
      *(uint *)(lVar9 + lVar8) = param_5;
      *(char *)(lVar9 + 4 + lVar8) = param_3;
      *(undefined8 *)(lVar9 + 8 + lVar8) = 0;
      *(undefined8 *)(lVar9 + 0x10 + lVar8) = 8;
      *(undefined8 *)(lVar9 + 0x18 + lVar8) = 0;
      lVar7 = lVar7 + 1;
      *(long *)(param_4 + 0x70) = lVar7;
      lVar9 = *(long *)(param_4 + 0x68);
      goto LAB_1458d30f3;
    }
    lVar1 = lVar5 + 0x20;
    pcVar2 = (char *)(lVar9 + 4 + lVar5);
    lVar5 = lVar1;
  } while (*pcVar2 != param_3);
  puVar3 = (uint *)(lVar9 + -0x20 + lVar1);
  iVar6 = -1;
  if (!CARRY4(param_5,*puVar3)) {
    iVar6 = param_5 + *puVar3;
  }
  *(int *)(lVar9 + -0x20 + lVar1) = iVar6;
LAB_1458d30f3:
  uVar12 = 0;
  lVar5 = 0;
  do {
    if (lVar7 * 0x20 == lVar5) goto LAB_1458d3118;
    lVar8 = lVar5 + 0x20;
    pcVar2 = (char *)(lVar9 + 4 + lVar5);
    lVar5 = lVar8;
  } while (*pcVar2 != param_3);
  uVar12 = *(uint *)(lVar9 + -0x20 + lVar8);
LAB_1458d3118:
  uVar13 = 0x6e;
  do {
    uVar10 = uVar12 - (uVar13 - 0x1e);
    if (uVar12 < uVar13 - 0x1e) {
      return iVar4;
    }
    uVar11 = uVar10 - (uVar13 - 0xf);
    if (uVar10 < uVar13 - 0xf) {
      return iVar4;
    }
    uVar12 = uVar11 - uVar13;
    if (uVar11 < uVar13) {
      return iVar4;
    }
    uVar13 = uVar13 + 0x2d;
  } while (uVar13 != 0x36b);
  return iVar4;
}
