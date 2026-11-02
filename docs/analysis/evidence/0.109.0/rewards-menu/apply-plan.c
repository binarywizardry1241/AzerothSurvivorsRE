undefined4 FUN_1458d8080(undefined8 param_1,undefined8 param_2,long param_3,long *param_4)

{
  uint uVar1;
  uint *puVar2;
  long lVar3;
  undefined4 uVar4;
  long lVar5;
  uint *puVar6;
  ulong uVar7;
  long lVar8;
  long lVar9;
  long *plVar10;
  ulong uVar11;
  int iVar12;
  uint *puVar13;
  uint uVar14;
  long lVar15;
  long lVar16;

  uVar11 = param_4[5];
  if (1 < uVar11) {
    puVar2 = (uint *)param_4[4];
    if (uVar11 < 0x15) {
      puVar6 = puVar2 + 1;
      lVar9 = 4;
      do {
        uVar14 = puVar6[-1];
        uVar1 = *puVar6;
        lVar15 = lVar9;
        if (uVar1 < uVar14) {
          do {
            *(uint *)((long)puVar2 + lVar15) = uVar14;
            puVar13 = puVar2;
            if (lVar15 == 4) goto LAB_1458d8248;
            uVar14 = *(uint *)((long)puVar2 + lVar15 + -8);
            lVar15 = lVar15 + -4;
          } while (uVar1 < uVar14);
          puVar13 = (uint *)(lVar15 + (long)puVar2);
LAB_1458d8248:
          *puVar13 = uVar1;
        }
        puVar6 = puVar6 + 1;
        lVar9 = lVar9 + 4;
      } while (puVar6 != puVar2 + uVar11);
      uVar11 = param_4[5];
      if (uVar11 < 2) goto LAB_1458d80b2;
    }
    else {
      func_0x000145b199b0(uVar11,param_3,uVar11);
    }
    lVar9 = param_4[4];
    lVar15 = 0;
    do {
      if (*(int *)(lVar9 + 4 + lVar15 * 4) == *(int *)(lVar9 + lVar15 * 4)) {
        uVar7 = lVar15 + 2;
        lVar5 = lVar15 + 1;
        if (uVar11 <= uVar7) goto LAB_1458d82f7;
        if (((int)uVar11 - (int)lVar15 & 1U) != 0) {
          iVar12 = *(int *)(lVar9 + 8 + lVar15 * 4);
          if (iVar12 != *(int *)(lVar9 + lVar15 * 4)) {
            *(int *)(lVar9 + 4 + lVar15 * 4) = iVar12;
            lVar5 = lVar15 + 2;
          }
          uVar7 = lVar15 + 3;
        }
        if (uVar11 - 3 != lVar15) goto LAB_1458d8309;
        goto LAB_1458d82f7;
      }
      lVar15 = lVar15 + 1;
    } while (uVar11 - 1 != lVar15);
  }
  goto LAB_1458d80b2;
LAB_1458d8309:
  do {
    iVar12 = *(int *)(lVar9 + uVar7 * 4);
    if (iVar12 == *(int *)(lVar9 + -4 + lVar5 * 4)) {
      iVar12 = *(int *)(lVar9 + 4 + uVar7 * 4);
      if (iVar12 != *(int *)(lVar9 + -4 + lVar5 * 4)) {
LAB_1458d8335:
        *(int *)(lVar9 + lVar5 * 4) = iVar12;
        lVar5 = lVar5 + 1;
      }
    }
    else {
      *(int *)(lVar9 + lVar5 * 4) = iVar12;
      lVar5 = lVar5 + 1;
      iVar12 = *(int *)(lVar9 + 4 + uVar7 * 4);
      if (iVar12 != *(int *)(lVar9 + -4 + lVar5 * 4)) goto LAB_1458d8335;
    }
    uVar7 = uVar7 + 2;
  } while (uVar11 != uVar7);
LAB_1458d82f7:
  param_4[5] = lVar5;
LAB_1458d80b2:
  uVar4 = FUN_1458d7780();
  if ((char)uVar4 == '\0') {
    lVar9 = param_4[2];
    if (lVar9 != 0) {
      lVar15 = param_4[1] + 8;
      do {
        if (*(long *)(lVar15 + -8) != 0) {
          func_0x0001400021d0();
        }
        lVar15 = lVar15 + 0x20;
        lVar9 = lVar9 + -1;
      } while (lVar9 != 0);
    }
    if (*param_4 != 0) {
      func_0x0001400021d0();
    }
    if (param_4[3] != 0) {
      func_0x0001400021d0();
    }
  }
  else {
    lVar9 = param_4[2];
    lVar5 = *param_4;
    lVar3 = param_4[1];
    lVar15 = *(long *)(param_3 + 0x100);
    lVar8 = param_3;
    if (lVar15 != 0) {
      lVar16 = *(long *)(param_3 + 0xf8) + 8;
      do {
        if (*(long *)(lVar16 + -8) != 0) {
          func_0x0001400021d0();
        }
        lVar16 = lVar16 + 0x20;
        lVar15 = lVar15 + -1;
      } while (lVar15 != 0);
    }
    if (*(long *)(param_3 + 0xf0) != 0) {
      func_0x0001400021d0();
    }
    *(long *)(param_3 + 0x100) = lVar9;
    *(long *)(param_3 + 0xf0) = lVar5;
    *(long *)(param_3 + 0xf8) = lVar3;
    lVar9 = param_4[5];
    lVar15 = param_4[3];
    lVar5 = param_4[4];
    plVar10 = (long *)(lVar8 + 0x108);
    if (*(long *)(lVar8 + 0x108) != 0) {
      func_0x0001400021d0();
    }
    plVar10[2] = lVar9;
    *plVar10 = lVar15;
    plVar10[1] = lVar5;
  }
  return uVar4;
}
