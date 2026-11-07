/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

float entry(undefined8 param_1,undefined8 param_2,ulong param_3,long param_4)

{
  ushort uVar1;
  code *pcVar2;
  long lVar3;
  long lVar4;
  long lVar5;
  ulong uVar6;
  uint uVar7;
  float fVar8;
  float fVar9;
  float fVar10;
  float fVar11;
  float fVar12;
  float fVar13;
  float fVar14;
  long local_d0;
  float *local_c8;
  ulong local_c0;

  lVar3 = func_0x000145898dc0(param_3,param_4,*(undefined8 *)(param_4 + 0x2b0),
                              *(undefined8 *)(param_4 + 0x2a8));
  lVar3 = lVar3 * 0xf0;
  fVar10 = *(float *)(param_4 + 0xa4c);
  fVar12 = fVar10 / _DAT_145db87e0;
  fVar9 = *(float *)(param_4 + 0xac0);
  fVar11 = *(float *)(lVar3 + 0x146bf2710);
  func_0x0001459cdd20();
  if (local_c0 == 1) {
    fVar13 = local_c8[1];
LAB_14596a554:
    uVar6 = *(ulong *)(lVar3 + 0x146bf26b0);
  }
  else {
    fVar13 = 0.0;
    if (local_c0 == 0) goto LAB_14596a554;
    fVar13 = *local_c8;
    if (fVar12 <= fVar13) {
      if (fVar13 <= _DAT_145dad524) {
        fVar13 = _DAT_145dad524;
      }
      fVar13 = ((_DAT_145dbab00 * fVar12) / fVar13 + _DAT_145db1730) * local_c8[1];
      uVar6 = *(ulong *)(lVar3 + 0x146bf26b0);
    }
    else {
      lVar4 = local_c0 * 8;
      lVar5 = 0;
      do {
        if (fVar12 <= local_c8[lVar5 * 2]) goto LAB_14596a4d9;
        lVar5 = lVar5 + 1;
        lVar4 = lVar4 + -8;
      } while (lVar4 != 0);
      lVar5 = local_c0 - 1;
LAB_14596a4d9:
      uVar6 = lVar5 + (ulong)(lVar5 == 0);
      if (local_c0 <= uVar6 - 1) {
        func_0x000145da9883();
        goto LAB_14596a73e;
      }
      if (local_c0 <= uVar6) {
        func_0x000145da9883();
        goto LAB_14596a73e;
      }
      fVar13 = local_c8[uVar6 * 2] - local_c8[uVar6 * 2 + -2];
      if (fVar13 <= _DAT_145dad524) {
        fVar13 = _DAT_145dad524;
      }
      fVar13 = ((fVar12 - local_c8[uVar6 * 2 + -2]) *
               (local_c8[uVar6 * 2 + 1] - local_c8[uVar6 * 2 + -1])) / fVar13 +
               local_c8[uVar6 * 2 + -1];
      uVar6 = *(ulong *)(lVar3 + 0x146bf26b0);
    }
  }
  if (param_3 < uVar6) {
    fVar14 = *(float *)(*(long *)(lVar3 + 0x146bf26a8) + 0x30 + param_3 * 0x50);
    fVar8 = _DAT_145dad260;
    if ((*(int *)(param_4 + 0x988) == 1) && (*(char *)(param_4 + 0xad0) != '\0')) {
      fVar10 = (fVar10 - *(float *)(param_4 + 0x98c)) / _DAT_145db87e0;
      if (fVar10 <= 0.0) {
        fVar10 = 0.0;
      }
      fVar8 = (float)func_0x000145c0a465(_DAT_146c08e04,fVar10);
    }
    uVar1 = *(ushort *)(param_4 + 0x2ca);
    uVar7 = (uint)uVar1;
    uVar6 = (ulong)*(uint *)(param_4 + 0x794);
    if (local_d0 != 0) {
      uVar7 = (uint)uVar1;
      func_0x0001400021d0(uVar1,uVar6,local_d0 << 3,local_c8,4);
    }
    fVar13 = fVar13 * _DAT_145db1730 * fVar11 * fVar9;
    fVar9 = (_DAT_145dbafd0 * fVar12 * fVar12 + _DAT_145db6b48 * fVar12 + _DAT_145dad260) *
            fVar11 * fVar9 * fVar14 * _DAT_145e069e0;
    fVar10 = fVar13;
    if (fVar13 <= fVar9) {
      fVar10 = fVar9;
    }
    return ((float)(uVar6 & 0xffffffff) * _DAT_145db1390 + _DAT_145dad260) *
           (float)(-(uint)NAN(fVar10) & (uint)fVar13 | ~-(uint)NAN(fVar10) & (uint)fVar10) *
           _DAT_145dad480 * fVar8 * ((float)(uVar7 & 0xffff) / _DAT_145dad488);
  }
  func_0x000145da9883();
LAB_14596a73e:
                    /* WARNING: Does not return */
  pcVar2 = (code *)invalidInstructionException();
  (*pcVar2)();
}
