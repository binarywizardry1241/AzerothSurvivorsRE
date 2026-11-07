
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 *
entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 *param_4,long param_5)

{
  long *plVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  float in_XMM3_Da;
  float fVar5;
  float fVar6;
  float fVar7;
  float fVar8;
  float fVar9;
  float fVar10;
  undefined4 local_158;
  undefined4 uStack_154;
  undefined4 uStack_150;
  undefined4 uStack_14c;
  undefined8 local_148;
  long local_100;
  long local_e8;

  plVar1 = (long *)*param_3;
  if ((plVar1[1] == 10) &&
     ((short)((long *)*plVar1)[1] == 0x6e6f && *(long *)*plVar1 == 0x6974706d65646572)) {
    fVar2 = *(float *)((long)param_3 + 0x14);
    fVar7 = *(float *)((long)param_3 + 0x3c);
    fVar6 = *(float *)(param_3 + 10);
    in_XMM3_Da = fVar2 - in_XMM3_Da;
    func_0x000145452400(0x146720489,param_4,0x22,0x146720489);
    fVar3 = *(float *)(param_5 + 8);
    fVar2 = *(float *)(plVar1 + 9) * _DAT_1458f8d40 * fVar2 * fVar7 * fVar3;
    if (fVar2 <= _DAT_1458ed010) {
      fVar2 = _DAT_1458ed010;
    }
    fVar4 = (*(float *)(plVar1 + 9) * _DAT_1458f6620 * _DAT_1458f8d40) / fVar2;
    if (_DAT_1458eb50c <= fVar4) {
      fVar4 = _DAT_1458eb50c;
    }
    fVar5 = _DAT_1458f6620;
    fVar8 = _DAT_1458f8d40;
    fVar9 = _DAT_1458ed010;
    fVar10 = _DAT_1458eb50c;
    func_0x0001454116e0(fVar2,fVar4 * fVar6);
    fVar3 = *(float *)(plVar1 + 9) * fVar8 * in_XMM3_Da * fVar7 * fVar3;
    if (fVar3 <= fVar9) {
      fVar3 = fVar9;
    }
    fVar2 = (fVar5 * *(float *)(plVar1 + 9) * fVar8) / fVar3;
    if (fVar10 <= fVar2) {
      fVar2 = fVar10;
    }
    func_0x0001454116e0(fVar3,fVar2 * fVar6);
    func_0x000145452790();
    param_4[2] = local_148;
    *(undefined4 *)param_4 = local_158;
    *(undefined4 *)((long)param_4 + 4) = uStack_154;
    *(undefined4 *)(param_4 + 1) = uStack_150;
    *(undefined4 *)((long)param_4 + 0xc) = uStack_14c;
    if (local_100 != 0) {
      func_0x0001400021d0();
    }
    if (local_e8 != 0) {
      func_0x0001400021d0();
    }
  }
  else {
    *param_4 = 0xffffffffffffffff;
  }
  return param_4;
}
