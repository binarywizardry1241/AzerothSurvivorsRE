/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

float entry(undefined8 param_1,undefined8 param_2,ulong param_3,long param_4)

{
  code *pcVar1;
  long lVar2;
  float fVar3;
  float fVar4;
  float fVar5;
  float fVar6;
  float fVar7;
  float fVar8;

  lVar2 = func_0x000145898dc0(param_3,param_4,*(undefined8 *)(param_4 + 0x2b0),
                              *(undefined8 *)(param_4 + 0x2a8));
  lVar2 = lVar2 * 0xf0;
  if (param_3 < *(ulong *)(lVar2 + 0x146bf26b0)) {
    fVar4 = *(float *)(*(long *)(lVar2 + 0x146bf26a8) + 0x34 + param_3 * 0x50);
    fVar8 = *(float *)(param_4 + 0xa4c);
    fVar6 = *(float *)(lVar2 + 0x146bf2710);
    fVar7 = *(float *)(param_4 + 0xac0);
    fVar3 = _DAT_145dad260;
    fVar5 = _DAT_145dad260;
    if ((*(int *)(param_4 + 0x988) == 1) && (*(char *)(param_4 + 0xad0) != '\0')) {
      fVar3 = (fVar8 - *(float *)(param_4 + 0x98c)) / _DAT_145db87e0;
      if (fVar3 <= 0.0) {
        fVar3 = 0.0;
      }
      fVar3 = (float)func_0x000145c0a465(_DAT_146c08e00,fVar3);
    }
    fVar8 = fVar8 / _DAT_145db87e0;
    return ((float)*(ushort *)(param_4 + 0x2cc) / _DAT_145dad488) *
           ((float)*(uint *)(param_4 + 0x794) * _DAT_145db1398 + fVar5) *
           fVar4 * SQRT(fVar6 * fVar7) *
                   (_DAT_146c08eec * fVar8 * fVar8 + _DAT_145dad484 * fVar8 + fVar5) *
           _DAT_145db1394 * fVar3;
  }
  func_0x000145da9883();
                    /* WARNING: Does not return */
  pcVar1 = (code *)invalidInstructionException();
  (*pcVar1)();
}
