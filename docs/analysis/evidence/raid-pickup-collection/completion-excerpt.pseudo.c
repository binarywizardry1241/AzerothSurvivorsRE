uVar9 = *(ulong *)(param_4 + 0x618);
  if (uVar9 != 0) {
    fVar21 = (float)*(undefined8 *)(param_4 + 0x4d0);
    fVar23 = (float)((ulong)*(undefined8 *)(param_4 + 0x4d0) >> 0x20);
    fVar22 = *(float *)(param_4 + 0x498);
    uVar13 = 0;
    uVar14 = 0;
    do {
      while ((*(int *)(*(long *)(param_4 + 0x610) + 0x20 + uVar13 * 0x48) != 0 ||
             ((lVar15 = *(long *)(param_4 + 0x610) + uVar13 * 0x48, *(int *)(lVar15 + 0x18) == 0 &&
              (fVar19 = (float)*(undefined8 *)(lVar15 + 0x34) - fVar21,
              fVar20 = (float)((ulong)*(undefined8 *)(lVar15 + 0x34) >> 0x20) - fVar23,
              fVar22 < SQRT(fVar20 * fVar20 + fVar19 * fVar19)))))) {
        uVar13 = uVar13 + 1;
        if (uVar9 <= uVar13) goto LAB_14595e52d;
      }
      uVar14 = uVar14 + *(int *)(lVar15 + 0x24);
      func_0x00014594d9e0();
      uVar9 = *(ulong *)(param_4 + 0x618);
    } while (uVar13 < uVar9);
LAB_14595e52d:
    if (uVar14 != 0) {
      func_0x000145c0a41d((float)uVar14 * *(float *)(param_4 + 0x49c));
      func_0x000145911e80();
    }
  }
