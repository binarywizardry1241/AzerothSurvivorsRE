/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long *param_3,long *param_4)

{
  undefined8 *puVar1;
  long *plVar2;
  long lVar3;
  long lVar4;
  long lVar5;
  long *plVar6;
  float fVar7;
  undefined4 in_XMM6_Da;
  float fVar8;
  float local_98;
  float local_94;
  long *local_90;
  undefined8 local_88;
  long *local_80;
  undefined8 local_78;
  long *local_70;
  undefined8 local_68;
  float *local_60;
  undefined8 local_58;
  float *local_50;
  undefined8 local_48;
  undefined8 local_40;
  undefined8 uStack_38;
  undefined8 local_30;
  undefined4 local_28;

  lVar5 = *param_4;
  plVar6 = (long *)*param_3;
  local_28 = in_XMM6_Da;
  if (*(char *)((long)plVar6 + 0x75) != '\v') {
    local_98 = *(float *)(plVar6 + 9) * _DAT_145d73d40 * *(float *)((long)param_3 + 0x2c) *
               *(float *)(param_3 + 9) * *(float *)(*(long *)(lVar5 + 0x18) + 0x170) *
               *(float *)((long)param_3 + 100);
    if (local_98 <= _DAT_145d73d44) {
      local_98 = _DAT_145d73d44;
    }
    goto LAB_1459bf5e0;
  }
  plVar2 = (long *)*plVar6;
  lVar3 = plVar6[1];
  if (lVar3 == 0xb) {
    if (*(long *)((long)plVar2 + 3) == CONCAT35(uRam0000000146bb36b0,_DAT_146bb36ab) &&
        *plVar2 == CONCAT53(_DAT_146bb36ab,_DAT_146bb36a8)) goto LAB_1459bf6c1;
  }
  else if ((lVar3 == 10) && ((short)plVar2[1] == _DAT_146bb36a6 && *plVar2 == _DAT_146bb369e)) {
LAB_1459bf6c1:
    local_98 = 0.0;
    goto LAB_1459bf5e0;
  }
  fVar8 = *(float *)(plVar6 + 9) * _DAT_145d73d40 * *(float *)((long)param_3 + 0x2c) *
          *(float *)(param_3 + 9) * *(float *)(*(long *)(lVar5 + 0x18) + 0x170) *
          *(float *)((long)param_3 + 100);
  if (fVar8 <= _DAT_145d73d44) {
    fVar8 = _DAT_145d73d44;
  }
  fVar7 = (float)func_0x000145882c60(plVar6,lVar5,lVar3);
  if (fVar7 <= fVar8) {
    fVar7 = fVar8;
  }
  fVar8 = *(float *)((long)param_3 + 0x5c);
  if (*(float *)((long)param_3 + 0x5c) <= _DAT_145d70c34) {
    fVar8 = _DAT_145d70c34;
  }
  local_98 = fVar7 / fVar8;
LAB_1459bf5e0:
  local_94 = *(float *)((long)param_3 + 0x24);
  local_70 = param_3 + 4;
  if (local_94 <= 0.0) {
    local_94 = 0.0;
  }
  local_80 = plVar6 + 8;
  local_88 = 0x1400020c0;
  local_78 = 0x145badf80;
  local_68 = 0x145badf80;
  local_60 = &local_94;
  local_58 = 0x145bad280;
  local_50 = &local_98;
  local_48 = 0x145bad280;
  local_90 = plVar6;
  func_0x000145b9c4d0();
  lVar3 = *(long *)(lVar5 + 8);
  lVar4 = *(long *)(lVar5 + 0x10);
  *(undefined8 *)(lVar4 + 0x10 + lVar3 * 0x18) = local_30;
  puVar1 = (undefined8 *)(lVar4 + lVar3 * 0x18);
  *puVar1 = local_40;
  puVar1[1] = uStack_38;
  *(long *)(lVar5 + 8) = lVar3 + 1;
  return;
}
