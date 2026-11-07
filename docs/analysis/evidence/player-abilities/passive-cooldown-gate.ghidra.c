
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

bool entry(undefined8 param_1,undefined8 param_2,long param_3,long *param_4)

{
  long *plVar1;
  long *plVar2;
  long lVar3;
  float fVar4;
  float extraout_XMM0_Da;
  
  plVar1 = (long *)*param_4;
  plVar2 = (long *)*plVar1;
  lVar3 = plVar1[1];
  if (lVar3 == 0xb) {
    if (*(long *)((long)plVar2 + 3) == 0x657269665f656972 && *plVar2 == 0x665f656972656166) {
      return false;
    }
  }
  else if ((lVar3 == 10) && ((short)plVar2[1] == 0x6e6f && *plVar2 == 0x6974706d65646572)) {
    fVar4 = *(float *)(plVar1 + 9) * _DAT_1458f8d40 * *(float *)((long)param_4 + 0x14) *
            *(float *)((long)param_4 + 0x3c) * *(float *)(param_3 + 8);
    if (fVar4 <= _DAT_1458ed010) {
      fVar4 = _DAT_1458ed010;
    }
    fVar4 = (_DAT_1458f6620 * *(float *)(plVar1 + 9) * _DAT_1458f8d40) / fVar4;
    if (_DAT_1458eb50c <= fVar4) {
      fVar4 = _DAT_1458eb50c;
    }
    return fVar4 * *(float *)(param_4 + 10) < _DAT_14671d270;
  }
  fVar4 = *(float *)(plVar1 + 9) * _DAT_1458f8d40 * *(float *)((long)param_4 + 0x14) *
          *(float *)((long)param_4 + 0x3c) * *(float *)(param_3 + 8);
  if (fVar4 <= _DAT_1458ed010) {
    fVar4 = _DAT_1458ed010;
  }
  func_0x00014541b8b0(param_1,param_2,lVar3,plVar2);
  return extraout_XMM0_Da * _DAT_14671d274 < fVar4;
}

