
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long param_3,long param_4)

{
  undefined4 *puVar1;
  ulong uVar2;
  float fVar3;
  ushort uVar4;
  ushort uVar5;
  ushort uVar6;
  ushort uVar7;
  undefined4 uVar8;
  ulong uVar9;
  ulong uVar10;
  long lVar11;
  ulong uVar12;
  undefined8 uVar13;
  ulong uVar14;
  float fVar15;
  float fVar16;
  long local_88;
  undefined4 *local_80;
  long local_78;

  lVar11 = func_0x0001458095e0(param_3,param_4,*(undefined8 *)(param_4 + 0x2b0),
                               *(undefined8 *)(param_4 + 0x2a8));
  lVar11 = *(long *)(lVar11 * 0xf0 + 0x146cc0d90);
  if (lVar11 == param_3) {
    uVar13 = 0;
  }
  else if (lVar11 + 0x68 == param_3) {
    uVar13 = 1;
  }
  else if (lVar11 + 0xd0 == param_3) {
    uVar13 = 2;
  }
  else if (lVar11 + 0x138 == param_3) {
    uVar13 = 3;
  }
  else {
    if (lVar11 + 0x1a0 != param_3) {
      return;
    }
    uVar13 = 4;
  }
  func_0x0001458095e0(uVar13);
  uVar4 = *(ushort *)(param_4 + 0x2c8);
  uVar5 = *(ushort *)(param_4 + 0x2ca);
  uVar6 = *(ushort *)(param_4 + 0x2cc);
  uVar7 = *(ushort *)(param_4 + 0x2ce);
  func_0x0001458ce450();
  if (local_78 != 0) {
    fVar15 = ((float)uVar7 + _DAT_1465f92f0) / _DAT_145ee03c0;
    fVar15 = fVar15 + fVar15 +
             (((float)uVar6 + _DAT_1465f92f0) / _DAT_145ee03c0) * _DAT_145ee0378 +
             (((float)uVar5 + _DAT_1465f92f0) / _DAT_145ee03c0) * _DAT_145ef0478 +
             (((float)uVar4 + _DAT_1465f92f0) / _DAT_145ee03c0) * _DAT_145ef0570 + _DAT_145edfeb0;
    if (_DAT_145ee02b0 <= fVar15) {
      fVar15 = _DAT_145ee02b0;
    }
    puVar1 = local_80 + local_78 * 2;
    fVar16 = _DAT_145f5eb84;
    do {
      uVar8 = *local_80;
      fVar3 = (float)local_80[1];
      uVar9 = *(ulong *)(param_4 + 0xae8);
      uVar10 = *(ulong *)(param_4 + 0xaf0);
      uVar2 = *(ulong *)(param_4 + 0xb00) + uVar9;
      uVar14 = *(ulong *)(param_4 + 0xaf8) ^ uVar9;
      uVar12 = *(ulong *)(param_4 + 0xb00) ^ uVar10;
      *(ulong *)(param_4 + 0xaf0) = uVar10 ^ uVar14;
      *(ulong *)(param_4 + 0xae8) = uVar9 ^ uVar12;
      *(ulong *)(param_4 + 0xaf8) = uVar14 ^ uVar10 << 0x11;
      *(ulong *)(param_4 + 0xb00) = uVar12 << 0x2d | uVar12 >> 0x13;
      if ((float)(uint)((uVar2 * 0x800000 | uVar2 >> 0x29) + uVar9 >> 0x28) * fVar16 <
          (fVar3 + *(float *)(param_4 + 0x2a0)) * fVar15) {
        lVar11 = *(long *)(param_4 + 0x6a0);
        if (lVar11 == *(long *)(param_4 + 0x690)) {
          func_0x000145d19840();
        }
        *(undefined4 *)(*(long *)(param_4 + 0x698) + lVar11 * 4) = uVar8;
        *(long *)(param_4 + 0x6a0) = lVar11 + 1;
      }
      local_80 = local_80 + 2;
    } while (local_80 != puVar1);
  }
  if (local_88 != 0) {
    func_0x0001400021d0();
  }
  return;
}
