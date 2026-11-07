
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

ulong entry(undefined8 param_1,undefined8 param_2,ulong param_3,long param_4,char *param_5)

{
  byte bVar1;
  uint uVar2;
  float fVar3;
  ulong uVar4;
  float fVar5;
  float fVar6;
  float fVar7;
  float fVar8;

  bVar1 = *(byte *)(param_4 + 0x44);
  if (bVar1 == 0xf) {
    return (ulong)*(uint *)((ulong)(2 < param_3) * 4 + 0x145a2a560);
  }
  if (*param_5 == '\0') {
    fVar6 = 0.0;
    fVar5 = _DAT_1458fcc38;
  }
  else {
    fVar6 = *(float *)(param_5 + 4);
    fVar5 = _DAT_1458eb480;
  }
  uVar4 = 4;
  if (param_3 < 4) {
    uVar4 = param_3;
  }
  fVar7 = *(float *)(param_4 + 0x40);
  fVar5 = *(float *)((uVar4 & 0xffffffff) * 4 + 0x14671d4f8) * fVar7 * fVar5;
  if (bVar1 < 0x13) {
                    /* WARNING: Could not emulate address calculation at 0x000145412c3f */
                    /* WARNING: Treating indirect jump as call */
    uVar4 = (*(code *)((long)*(int *)((ulong)bVar1 * 4 + 0x1467205a0) + 0x1467205a0))();
    return uVar4;
  }
  fVar3 = _DAT_1458f8de4 * fVar7 - fVar6;
  if (fVar3 <= 0.0) {
    fVar3 = 0.0;
  }
  uVar2 = (uint)bVar1;
  if (bVar1 < 9) {
    if ((0x19bU >> (uVar2 & 0x1f) & 1) != 0) {
      fVar6 = _DAT_1458eb480;
      if (*param_5 != '\0') {
        fVar6 = _DAT_1458eb480 + (float)*(uint *)(param_5 + 8) * _DAT_1458f6630;
      }
      fVar5 = fVar5 / fVar6;
      goto LAB_145412cc7;
    }
    if ((0x24U >> (uVar2 & 0x1f) & 1) != 0) {
      fVar7 = fVar7 * _DAT_1458f662c;
      fVar5 = fVar5 * _DAT_145bfc384;
      if (fVar6 <= fVar7) {
        fVar3 = (_DAT_1459c7f90 * fVar6) / fVar7 + _DAT_1458eb480;
      }
      else {
        fVar3 = (fVar7 / fVar6) * (fVar7 / fVar6) * _DAT_1458ed010;
      }
      fVar3 = fVar3 * fVar5 + fVar6;
      if (fVar7 < fVar3) {
        fVar8 = (fVar7 / fVar3) * (fVar7 / fVar3) * _DAT_1458ed010;
      }
      else {
        fVar8 = (_DAT_1459c7f90 * fVar3) / fVar7 + _DAT_1458eb480;
      }
      fVar3 = fVar3 + fVar8 * fVar5;
      if (fVar7 < fVar3) {
        fVar8 = (fVar7 / fVar3) * (fVar7 / fVar3) * _DAT_1458ed010;
      }
      else {
        fVar8 = (_DAT_1459c7f90 * fVar3) / fVar7 + _DAT_1458eb480;
      }
      fVar3 = fVar3 + fVar8 * fVar5;
      if (fVar7 < fVar3) {
        fVar8 = (fVar7 / fVar3) * (fVar7 / fVar3) * _DAT_1458ed010;
      }
      else {
        fVar8 = (_DAT_1459c7f90 * fVar3) / fVar7 + _DAT_1458eb480;
      }
      fVar3 = fVar3 + fVar8 * fVar5;
      if (fVar7 < fVar3) {
        fVar8 = (fVar7 / fVar3) * (fVar7 / fVar3) * _DAT_1458ed010;
      }
      else {
        fVar8 = (_DAT_1459c7f90 * fVar3) / fVar7 + _DAT_1458eb480;
      }
      fVar3 = fVar3 + fVar8 * fVar5;
      if (fVar7 < fVar3) {
        fVar8 = (fVar7 / fVar3) * (fVar7 / fVar3) * _DAT_1458ed010;
      }
      else {
        fVar8 = (_DAT_1459c7f90 * fVar3) / fVar7 + _DAT_1458eb480;
      }
      fVar3 = fVar3 + fVar8 * fVar5;
      if (fVar7 < fVar3) {
        fVar8 = (fVar7 / fVar3) * (fVar7 / fVar3) * _DAT_1458ed010;
      }
      else {
        fVar8 = (_DAT_1459c7f90 * fVar3) / fVar7 + _DAT_1458eb480;
      }
      fVar3 = fVar3 + fVar8 * fVar5;
      if (fVar7 < fVar3) {
        fVar8 = (fVar7 / fVar3) * (fVar7 / fVar3) * _DAT_1458ed010;
      }
      else {
        fVar8 = (_DAT_1459c7f90 * fVar3) / fVar7 + _DAT_1458eb480;
      }
      fVar3 = fVar3 + fVar8 * fVar5;
      if (fVar7 < fVar3) {
        fVar8 = (fVar7 / fVar3) * (fVar7 / fVar3) * _DAT_1458ed010;
      }
      else {
        fVar8 = (_DAT_1459c7f90 * fVar3) / fVar7 + _DAT_1458eb480;
      }
      fVar3 = fVar3 + fVar8 * fVar5;
      if (fVar7 < fVar3) {
        fVar8 = (fVar7 / fVar3) * (fVar7 / fVar3) * _DAT_1458ed010;
      }
      else {
        fVar8 = (_DAT_1459c7f90 * fVar3) / fVar7 + _DAT_1458eb480;
      }
      fVar3 = fVar3 + fVar8 * fVar5;
      if (fVar7 < fVar3) {
        fVar8 = (fVar7 / fVar3) * (fVar7 / fVar3) * _DAT_1458ed010;
      }
      else {
        fVar8 = (_DAT_1459c7f90 * fVar3) / fVar7 + _DAT_1458eb480;
      }
      fVar3 = fVar3 + fVar8 * fVar5;
      if (fVar7 < fVar3) {
        fVar8 = (fVar7 / fVar3) * (fVar7 / fVar3) * _DAT_1458ed010;
      }
      else {
        fVar8 = (_DAT_1459c7f90 * fVar3) / fVar7 + _DAT_1458eb480;
      }
      fVar3 = fVar3 + fVar8 * fVar5;
      if (fVar7 < fVar3) {
        fVar8 = (fVar7 / fVar3) * (fVar7 / fVar3) * _DAT_1458ed010;
      }
      else {
        fVar8 = (_DAT_1459c7f90 * fVar3) / fVar7 + _DAT_1458eb480;
      }
      fVar3 = fVar3 + fVar8 * fVar5;
      if (fVar3 <= fVar7) {
        fVar8 = (_DAT_1459c7f90 * fVar3) / fVar7 + _DAT_1458eb480;
      }
      else {
        fVar8 = (fVar7 / fVar3) * (fVar7 / fVar3) * _DAT_1458ed010;
      }
      fVar3 = fVar3 + fVar8 * fVar5;
      if (fVar7 < fVar3) {
        fVar8 = (fVar7 / fVar3) * (fVar7 / fVar3) * _DAT_1458ed010;
      }
      else {
        fVar8 = (_DAT_1459c7f90 * fVar3) / fVar7 + _DAT_1458eb480;
      }
      fVar3 = fVar3 + fVar8 * fVar5;
      if (fVar3 <= fVar7) {
        return (ulong)(uint)((fVar3 + fVar5 * ((_DAT_1459c7f90 * fVar3) / fVar7 + _DAT_1458eb480)) -
                            fVar6);
      }
      return (ulong)(uint)((fVar3 + fVar5 * (fVar7 / fVar3) * (fVar7 / fVar3) * _DAT_1458ed010) -
                          fVar6);
    }
  }
  if (uVar2 - 6 < 0xd) {
                    /* WARNING: Could not emulate address calculation at 0x0001454131ea */
                    /* WARNING: Treating indirect jump as call */
    uVar4 = (*(code *)((long)*(int *)((ulong)(uVar2 - 6) * 4 + 0x1467205ec) + 0x1467205ec))();
    return uVar4;
  }
  fVar5 = (fVar5 * fVar3) / (fVar7 * _DAT_1458f8de4);
LAB_145412cc7:
  fVar6 = fVar5;
  if (fVar3 <= fVar5) {
    fVar6 = fVar3;
  }
  return (ulong)(~-(uint)NAN(fVar6) & (uint)fVar6 | (uint)fVar5 & -(uint)NAN(fVar6));
}
