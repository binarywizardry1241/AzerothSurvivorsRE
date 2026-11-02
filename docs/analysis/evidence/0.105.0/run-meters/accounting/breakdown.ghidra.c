/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,undefined8 param_4,
          undefined8 param_5,long param_6,undefined8 *param_7)

{
  long lVar1;
  undefined8 uVar2;
  code *pcVar3;
  undefined8 *puVar4;
  undefined8 uVar5;
  undefined8 uVar6;
  double dVar7;
  double dVar8;
  undefined4 uVar9;
  undefined4 uVar10;
  float fVar11;

  uVar5 = 0;
  puVar4 = (undefined8 *)0x8;
  if ((*(char *)(param_6 + 0x168) != '\x02') && (*(char *)(param_6 + 0x195) == '\x02')) {
    uVar9 = (undefined4)param_3;
    uVar10 = (undefined4)((ulong)param_3 >> 0x20);
    uVar5 = *(undefined8 *)(param_6 + 0x140);
    uVar6 = *(undefined8 *)(param_6 + 0x148);
    lVar1 = *(long *)(param_6 + 0x150);
    uVar2 = *(undefined8 *)(param_6 + 0x158);
    fVar11 = *(float *)(param_6 + 0x160);
    func_0x000140002200();
    if ((lVar1 == 0) || (fVar11 <= 0.0)) {
      puVar4 = (undefined8 *)func_0x0001400021c0();
      if (puVar4 == (undefined8 *)0x0) {
        func_0x000145d69431();
                    /* WARNING: Does not return */
        pcVar3 = (code *)invalidInstructionException();
        (*pcVar3)();
      }
      *puVar4 = uVar5;
      puVar4[1] = uVar6;
      puVar4[2] = CONCAT44(uVar10,uVar9);
      uVar5 = 1;
    }
    else {
      puVar4 = (undefined8 *)func_0x0001400021c0();
      if (puVar4 == (undefined8 *)0x0) {
        func_0x000145d69431();
                    /* WARNING: Does not return */
        pcVar3 = (code *)invalidInstructionException();
        (*pcVar3)();
      }
      dVar7 = (double)fVar11 / ((double)fVar11 + _DAT_145d9ddb0);
      dVar8 = _DAT_145d9ddb0 - dVar7;
      *puVar4 = uVar5;
      puVar4[1] = uVar6;
      puVar4[2] = dVar8 * (double)CONCAT44(uVar10,uVar9);
      puVar4[3] = lVar1;
      puVar4[4] = uVar2;
      puVar4[5] = dVar7 * (double)CONCAT44(uVar10,uVar9);
      uVar5 = 2;
    }
  }
  *param_7 = uVar5;
  param_7[1] = puVar4;
  param_7[2] = uVar5;
  return;
}
