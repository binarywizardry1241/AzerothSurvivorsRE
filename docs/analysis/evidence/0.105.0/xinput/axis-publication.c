/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,undefined1 param_3,undefined8 *param_4,
          short param_5,short param_6)

{
  long *plVar1;
  undefined8 *puVar2;
  long lVar3;
  undefined8 uVar4;
  long lVar5;
  long lVar6;
  long lVar7;
  undefined8 uVar8;
  float fVar9;
  float fVar10;

  if ((param_5 != param_6) || (*(int *)*param_4 == 0)) {
    plVar1 = (long *)param_4[1];
    puVar2 = (undefined8 *)param_4[2];
    uVar8 = *puVar2;
    *(undefined4 *)plVar1[2] = *(undefined4 *)((long)plVar1 + 0x1c);
    lVar7 = *plVar1;
    lVar3 = *(long *)(lVar7 + 0x30);
    uVar4 = *(undefined8 *)(lVar7 + 0x40);
    if (lVar3 == *(long *)(lVar7 + 0x20)) {
      func_0x000145bcb610();
    }
    fVar9 = _DAT_145d73d14;
    if (_DAT_145d73d14 <= (float)(int)param_5 / _DAT_145d73d10) {
      fVar9 = (float)(int)param_5 / _DAT_145d73d10;
    }
    fVar10 = _DAT_145d6d36c;
    if (fVar9 <= _DAT_145d6d36c) {
      fVar10 = fVar9;
    }
    lVar5 = *(long *)(lVar7 + 0x28);
    lVar6 = lVar3 * 0x30;
    *(undefined8 *)(lVar5 + lVar6) = 0x8000000000000001;
    *(undefined8 *)(lVar5 + 8 + lVar6) = uVar8;
    *(float *)(lVar5 + 0x10 + lVar6) = fVar10;
    *(undefined1 *)(lVar5 + 0x14 + lVar6) = param_3;
    *(undefined8 *)(lVar5 + 0x28 + lVar6) = uVar4;
    *(long *)(lVar7 + 0x30) = lVar3 + 1;
    *(long *)(lVar7 + 0x40) = *(long *)(lVar7 + 0x40) + 1;
    plVar1 = (long *)param_4[3];
    uVar8 = *puVar2;
    *(undefined4 *)plVar1[2] = *(undefined4 *)((long)plVar1 + 0x1c);
    lVar7 = *plVar1;
    lVar3 = *(long *)(lVar7 + 0x30);
    uVar4 = *(undefined8 *)(lVar7 + 0x40);
    if (lVar3 == *(long *)(lVar7 + 0x20)) {
      func_0x000145bcb3e0();
    }
    lVar5 = *(long *)(lVar7 + 0x28);
    *(undefined8 *)(lVar5 + lVar3 * 0x18) = uVar4;
    *(undefined8 *)(lVar5 + 8 + lVar3 * 0x18) = uVar8;
    *(float *)(lVar5 + 0x10 + lVar3 * 0x18) = fVar10;
    *(undefined1 *)(lVar5 + 0x14 + lVar3 * 0x18) = param_3;
    *(long *)(lVar7 + 0x30) = lVar3 + 1;
    *(long *)(lVar7 + 0x40) = *(long *)(lVar7 + 0x40) + 1;
  }
  return;
}
