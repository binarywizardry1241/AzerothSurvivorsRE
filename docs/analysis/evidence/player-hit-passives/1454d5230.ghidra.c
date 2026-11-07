
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,long param_4,undefined8 *param_5
          ,undefined4 param_6)

{
  ulong uVar1;
  float fVar2;
  long lVar3;
  long *plVar4;
  ulong uVar5;
  ulong uVar6;
  ulong uVar7;
  ulong uVar8;
  long lVar9;
  ulong uVar10;
  float fVar11;
  float fVar12;
  float fVar13;
  
  if (*(long *)(param_4 + 0x2a0) != 0) {
    lVar3 = *(long *)(param_4 + 0x298);
    lVar9 = 0;
    do {
      plVar4 = *(long **)(lVar3 + lVar9);
      if ((plVar4[1] == 10) &&
         ((short)((long *)*plVar4)[1] == 0x6e6f && *(long *)*plVar4 == 0x6974706d65646572)) {
        uVar7 = *(ulong *)(param_4 + 0x760);
        if (3 < uVar7) {
          return;
        }
        fVar13 = *(float *)(lVar3 + 0x14 + lVar9);
        fVar11 = *(float *)(lVar3 + 0x3c + lVar9);
        fVar2 = *(float *)(lVar3 + 0x50 + lVar9);
        uVar5 = *(ulong *)(param_4 + 0x880);
        uVar6 = *(ulong *)(param_4 + 0x888);
        uVar1 = *(ulong *)(param_4 + 0x898) + uVar5;
        uVar10 = *(ulong *)(param_4 + 0x890) ^ uVar5;
        uVar8 = *(ulong *)(param_4 + 0x898) ^ uVar6;
        *(ulong *)(param_4 + 0x888) = uVar6 ^ uVar10;
        *(ulong *)(param_4 + 0x880) = uVar5 ^ uVar8;
        *(ulong *)(param_4 + 0x890) = uVar10 ^ uVar6 << 0x11;
        fVar12 = (float)(uint)((uVar1 * 0x800000 | uVar1 >> 0x29) + uVar5 >> 0x28) * _DAT_1459eb3c0;
        *(ulong *)(param_4 + 0x898) = uVar8 << 0x2d | uVar8 >> 0x13;
        fVar13 = *(float *)(plVar4 + 9) * _DAT_1458f8d40 * fVar13 * fVar11 *
                 *(float *)(param_4 + 0x460);
        if (fVar13 <= _DAT_1458ed010) {
          fVar13 = _DAT_1458ed010;
        }
        fVar13 = (_DAT_1458f6620 * *(float *)(plVar4 + 9) * _DAT_1458f8d40) / fVar13;
        if (_DAT_1458eb50c <= fVar13) {
          fVar13 = _DAT_1458eb50c;
        }
        if (fVar13 * fVar2 <= fVar12) {
          return;
        }
        fVar13 = *(float *)(param_4 + 0x8e4);
        fVar11 = fVar13;
        if (fVar13 <= *(float *)(param_4 + 0x7e0)) {
          fVar11 = *(float *)(param_4 + 0x7e0);
        }
        fVar13 = (float)(-(uint)NAN(fVar11) & (uint)fVar13 | ~-(uint)NAN(fVar11) & (uint)fVar11);
        *(float *)(param_4 + 0x7e0) = fVar13 + _DAT_1458eb488;
        if (uVar7 == *(ulong *)(param_4 + 0x750)) {
          func_0x0001457580b0();
        }
        lVar3 = *(long *)(param_4 + 0x758);
        lVar9 = uVar7 * 0x20;
        *(undefined8 *)(lVar3 + lVar9) = param_3;
        *(float *)(lVar3 + 8 + lVar9) = fVar13;
        *(undefined8 *)(lVar3 + 0xc + lVar9) = *param_5;
        *(undefined4 *)(lVar3 + 0x14 + lVar9) = *(undefined4 *)(param_5 + 1);
        *(undefined4 *)(lVar3 + 0x18 + lVar9) = param_6;
        *(ulong *)(param_4 + 0x760) = uVar7 + 1;
        return;
      }
      lVar9 = lVar9 + 0x58;
    } while (*(long *)(param_4 + 0x2a0) * 0x58 - lVar9 != 0);
  }
  return;
}

