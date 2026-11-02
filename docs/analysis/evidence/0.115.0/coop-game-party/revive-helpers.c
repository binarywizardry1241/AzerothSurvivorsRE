
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 * entry(undefined8 param_1,undefined8 param_2,undefined8 *param_3,undefined8 *param_4)

{
  undefined8 uVar1;
  undefined8 *puVar2;
  long *plVar3;
  undefined8 *puVar4;
  long lVar5;
  code *pcVar6;
  long *plVar7;
  long lVar8;
  long lVar9;
  undefined8 *puVar10;
  float fVar11;
  float fVar12;
  float fVar13;
  long local_68;

  fVar13 = _DAT_145f6dad8;
  puVar10 = (undefined8 *)*param_3;
  puVar2 = (undefined8 *)param_3[1];
  if (puVar10 != puVar2) {
    lVar9 = param_3[2];
    plVar3 = (long *)param_3[3];
    puVar4 = (undefined8 *)param_3[4];
    lVar5 = *plVar3;
    do {
      if ((lVar5 == lVar9) || (*(char *)((long)puVar10 + 0xc) != '\x01')) {
        param_3[2] = lVar9 + 1;
      }
      else {
        uVar1 = *puVar4;
        fVar11 = (float)*puVar10 - (float)uVar1;
        fVar12 = (float)((ulong)*puVar10 >> 0x20) - (float)((ulong)uVar1 >> 0x20);
        lVar8 = lVar9 + 1;
        param_3[2] = lVar8;
        if (fVar12 * fVar12 + fVar11 * fVar11 <= fVar13) {
          puVar10 = puVar10 + 2;
          *param_3 = puVar10;
          func_0x000140002200();
          plVar7 = (long *)func_0x0001400021c0();
          if (plVar7 == (long *)0x0) {
            func_0x000145eb6fcb();
                    /* WARNING: Does not return */
            pcVar6 = (code *)invalidInstructionException();
            (*pcVar6)();
          }
          *plVar7 = lVar9;
          local_68 = 1;
          for (; puVar10 != puVar2; puVar10 = puVar10 + 2) {
            while (((*plVar3 == lVar8 || (*(char *)((long)puVar10 + 0xc) != '\x01')) ||
                   (uVar1 = *puVar4, fVar11 = (float)*puVar10 - (float)uVar1,
                   fVar12 = (float)((ulong)*puVar10 >> 0x20) - (float)((ulong)uVar1 >> 0x20),
                   fVar13 < fVar12 * fVar12 + fVar11 * fVar11))) {
              puVar10 = puVar10 + 2;
              lVar8 = lVar8 + 1;
              if (puVar10 == puVar2) goto LAB_1459cca8d;
            }
            if (local_68 == 4) {
              func_0x000145d14a10();
            }
            plVar7[local_68] = lVar8;
            lVar8 = lVar8 + 1;
            local_68 = local_68 + 1;
          }
LAB_1459cca8d:
          param_4[2] = local_68;
          *param_4 = 4;
          param_4[1] = plVar7;
          return param_4;
        }
      }
      puVar10 = puVar10 + 2;
      lVar9 = lVar9 + 1;
    } while (puVar10 != puVar2);
  }
  *param_4 = 0;
  param_4[1] = 8;
  param_4[2] = 0;
  return param_4;
}
