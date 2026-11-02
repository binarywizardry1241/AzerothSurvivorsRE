
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 * entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 *param_4)

{
  float *pfVar1;
  undefined8 *puVar2;
  float *pfVar3;
  float *pfVar4;
  code *pcVar5;
  undefined8 *puVar6;
  long lVar7;
  float *pfVar8;
  float fVar9;
  float fVar10;
  long local_68;

  pfVar1 = (float *)param_3[1];
  if ((float *)*param_3 != pfVar1) {
    puVar2 = (undefined8 *)param_3[2];
    pfVar8 = (float *)*param_3;
    fVar10 = _DAT_1458f8fa0;
    do {
      pfVar4 = pfVar8 + 2;
      *param_3 = (long)pfVar4;
      pfVar3 = (float *)*puVar2;
      fVar9 = (float)func_0x000145756e67(*pfVar8 - *pfVar3,pfVar8[1] - pfVar3[1]);
      if (fVar10 <= fVar9) {
        func_0x000140002200();
        puVar6 = (undefined8 *)func_0x0001400021c0();
        if (puVar6 == (undefined8 *)0x0) {
          func_0x0001458e721b();
                    /* WARNING: Does not return */
          pcVar5 = (code *)invalidInstructionException();
          (*pcVar5)();
        }
        *puVar6 = pfVar8;
        pfVar8 = pfVar8 + 2;
        local_68 = 1;
        if (pfVar8 != pfVar1) {
          lVar7 = 1;
          do {
            pfVar4 = (float *)*puVar2;
            fVar9 = (float)func_0x000145756e67(*pfVar8 - *pfVar4,pfVar8[1] - pfVar4[1]);
            if (fVar10 <= fVar9) {
              if (lVar7 == 4) {
                func_0x000145757d40();
              }
              puVar6[lVar7] = pfVar8;
              lVar7 = lVar7 + 1;
              local_68 = lVar7;
            }
            pfVar8 = pfVar8 + 2;
          } while (pfVar8 != pfVar1);
        }
        param_4[2] = local_68;
        *param_4 = 4;
        param_4[1] = puVar6;
        return param_4;
      }
      pfVar8 = pfVar4;
    } while (pfVar4 != pfVar1);
  }
  *param_4 = 0;
  param_4[1] = 8;
  param_4[2] = 0;
  return param_4;
}
