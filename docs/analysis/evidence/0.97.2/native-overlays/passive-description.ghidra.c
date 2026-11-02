
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

long * entry(undefined8 param_1,undefined8 param_2,long *param_3,long *param_4,float *param_5)

{
  long *plVar1;
  long lVar2;
  byte bVar3;
  long *plVar4;
  float fVar5;
  float fVar6;
  long local_238;
  long local_208;
  long local_1e8;

  plVar4 = (long *)*param_3;
  bVar3 = *(char *)((long)plVar4 + 0x75) - 2;
  fVar5 = _DAT_1458eb480;
  if (bVar3 < 7) {
    fVar5 = *(float *)((ulong)bVar3 * 4 + 0x1469aca9c);
  }
  fVar5 = *(float *)((long)plVar4 + 0x44) * _DAT_1458f8d40 * *(float *)(param_3 + 2) *
          *(float *)(param_3 + 7) * fVar5 +
          (float)(-(uint)(0.0 < *(float *)((long)plVar4 + 0x44)) &
                 (uint)(*param_5 * *(float *)((long)param_3 + 0x4c)));
  func_0x00014547ccf0(fVar5,param_5[1] * fVar5);
  fVar5 = *(float *)((long)param_3 + 0x1c) * *(float *)((long)param_3 + 0x44) *
          *(float *)(plVar4 + 10) * param_5[10];
  if (_DAT_145bfc414 < fVar5) {
    fVar6 = _DAT_1458f8de0;
    fVar5 = (float)func_0x000145756f57((fVar5 + _DAT_14698ebd0) / _DAT_1458f8de0);
    fVar5 = fVar5 * fVar6 + _DAT_145bfc414;
  }
  func_0x00014547ccf0(fVar5,fVar5);
  plVar1 = (long *)*plVar4;
  lVar2 = plVar4[1];
  if (lVar2 == 0xb) {
    if (*(long *)((long)plVar1 + 3) == CONCAT35(uRam000000014671d79e,_DAT_14671d799) &&
        *plVar1 == CONCAT53(_DAT_14671d799,_DAT_14671d796)) goto LAB_1454d7dc8;
  }
  else if ((lVar2 == 10) && ((short)plVar1[1] == _DAT_14671d794 && *plVar1 == _DAT_14671d78c)) {
LAB_1454d7dc8:
    *param_4 = 0;
    param_4[1] = 1;
    param_4[2] = 0;
    local_208 = *param_4;
    goto joined_r0x0001454d7dfe;
  }
  fVar5 = *(float *)(plVar4 + 9) * _DAT_1458f8d40 * *(float *)((long)param_3 + 0x14) *
          *(float *)((long)param_3 + 0x3c) * param_5[2];
  if (fVar5 <= _DAT_1458ed010) {
    fVar5 = _DAT_1458ed010;
  }
  fVar6 = (float)func_0x00014541b8b0();
  if (fVar6 <= fVar5) {
    fVar6 = fVar5;
  }
  fVar5 = *(float *)(param_3 + 10);
  if (*(float *)(param_3 + 10) <= _DAT_1458f6620) {
    fVar5 = _DAT_1458f6620;
  }
  *param_4 = 0;
  param_4[1] = 1;
  param_4[2] = 0;
  func_0x00014547ccf0(fVar6 / fVar5,fVar6 / fVar5);
  lVar2 = plVar4[1];
joined_r0x0001454d7dfe:
  if (4 < lVar2 - 9U) {
    if (local_208 != 0) {
      func_0x0001400021d0();
    }
    if (local_238 != 0) {
      func_0x0001400021d0();
    }
    if (local_1e8 != 0) {
      func_0x0001400021d0();
    }
    return param_4;
  }
                    /* WARNING: Could not emulate address calculation at 0x0001454d7e0b */
                    /* WARNING: Treating indirect jump as call */
  plVar4 = (long *)(*(code *)((long)*(int *)((lVar2 - 9U) * 4 + 0x1469acde4) + 0x1469acde4))();
  return plVar4;
}
