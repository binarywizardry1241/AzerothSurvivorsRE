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
  if (bVar1 == 0x10) {
    return (ulong)*(uint *)((ulong)(2 < param_3) * 4 + 0x145f4ba50);
  }
  if (*param_5 == '\0') {
    fVar6 = 0.0;
    fVar5 = _DAT_145dbb098;
  }
  else {
    fVar6 = *(float *)(param_5 + 4);
    fVar5 = _DAT_145dad260;
  }
  uVar4 = 4;
  if (param_3 < 4) {
    uVar4 = param_3;
  }
  fVar7 = *(float *)(param_4 + 0x40);
  fVar5 = *(float *)((uVar4 & 0xffffffff) * 4 + 0x146bff100) * fVar7 * fVar5;
  if (bVar1 < 0x14) {
                    /* WARNING: Could not emulate address calculation at 0x00014589e16f */
                    /* WARNING: Treating indirect jump as call */
    uVar4 = (*(code *)((long)*(int *)((ulong)bVar1 * 4 + 0x146c05e14) + 0x146c05e14))();
    return uVar4;
  }
  fVar3 = _DAT_145db14c8 * fVar7 - fVar6;
  if (fVar3 <= 0.0) {
    fVar3 = 0.0;
  }
  uVar2 = (uint)bVar1;
  if (bVar1 < 10) {
    if ((0x31bU >> (uVar2 & 0x1f) & 1) != 0) {
      fVar6 = _DAT_145dad260;
      if (*param_5 != '\0') {
        fVar6 = _DAT_145dad260 + (float)*(uint *)(param_5 + 8) * _DAT_145dad484;
      }
      fVar5 = fVar5 / fVar6;
      goto LAB_14589e1e2;
    }
    if ((100U >> (uVar2 & 0x1f) & 1) != 0) {
      fVar7 = fVar7 * _DAT_145dad480;
      fVar5 = fVar5 * _DAT_1460b3e54;
      if (fVar6 <= fVar7) {
        fVar3 = (_DAT_145f39ecc * fVar6) / fVar7 + _DAT_145dad260;
      }
      else {
        fVar3 = (fVar7 / fVar6) * (fVar7 / fVar6) * _DAT_145db1390;
      }
      fVar3 = fVar3 * fVar5 + fVar6;
      if (fVar7 < fVar3) {
        fVar8 = (fVar7 / fVar3) * (fVar7 / fVar3) * _DAT_145db1390;
      }
      else {
        fVar8 = (_DAT_145f39ecc * fVar3) / fVar7 + _DAT_145dad260;
      }
      fVar3 = fVar3 + fVar8 * fVar5;
      if (fVar7 < fVar3) {
        fVar8 = (fVar7 / fVar3) * (fVar7 / fVar3) * _DAT_145db1390;
      }
      else {
        fVar8 = (_DAT_145f39ecc * fVar3) / fVar7 + _DAT_145dad260;
      }
      fVar3 = fVar3 + fVar8 * fVar5;
      if (fVar7 < fVar3) {
        fVar8 = (fVar7 / fVar3) * (fVar7 / fVar3) * _DAT_145db1390;
      }
      else {
        fVar8 = (_DAT_145f39ecc * fVar3) / fVar7 + _DAT_145dad260;
      }
      fVar3 = fVar3 + fVar8 * fVar5;
      if (fVar7 < fVar3) {
        fVar8 = (fVar7 / fVar3) * (fVar7 / fVar3) * _DAT_145db1390;
      }
      else {
        fVar8 = (_DAT_145f39ecc * fVar3) / fVar7 + _DAT_145dad260;
      }
      fVar3 = fVar3 + fVar8 * fVar5;
      if (fVar7 < fVar3) {
        fVar8 = (fVar7 / fVar3) * (fVar7 / fVar3) * _DAT_145db1390;
      }
      else {
        fVar8 = (_DAT_145f39ecc * fVar3) / fVar7 + _DAT_145dad260;
      }
      fVar3 = fVar3 + fVar8 * fVar5;
      if (fVar7 < fVar3) {
        fVar8 = (fVar7 / fVar3) * (fVar7 / fVar3) * _DAT_145db1390;
      }
      else {
        fVar8 = (_DAT_145f39ecc * fVar3) / fVar7 + _DAT_145dad260;
      }
      fVar3 = fVar3 + fVar8 * fVar5;
      if (fVar7 < fVar3) {
        fVar8 = (fVar7 / fVar3) * (fVar7 / fVar3) * _DAT_145db1390;
      }
      else {
        fVar8 = (_DAT_145f39ecc * fVar3) / fVar7 + _DAT_145dad260;
      }
      fVar3 = fVar3 + fVar8 * fVar5;
      if (fVar7 < fVar3) {
        fVar8 = (fVar7 / fVar3) * (fVar7 / fVar3) * _DAT_145db1390;
      }
      else {
        fVar8 = (_DAT_145f39ecc * fVar3) / fVar7 + _DAT_145dad260;
      }
      fVar3 = fVar3 + fVar8 * fVar5;
      if (fVar7 < fVar3) {
        fVar8 = (fVar7 / fVar3) * (fVar7 / fVar3) * _DAT_145db1390;
      }
      else {
        fVar8 = (_DAT_145f39ecc * fVar3) / fVar7 + _DAT_145dad260;
      }
      fVar3 = fVar3 + fVar8 * fVar5;
      if (fVar7 < fVar3) {
        fVar8 = (fVar7 / fVar3) * (fVar7 / fVar3) * _DAT_145db1390;
      }
      else {
        fVar8 = (_DAT_145f39ecc * fVar3) / fVar7 + _DAT_145dad260;
      }
      fVar3 = fVar3 + fVar8 * fVar5;
      if (fVar7 < fVar3) {
        fVar8 = (fVar7 / fVar3) * (fVar7 / fVar3) * _DAT_145db1390;
      }
      else {
        fVar8 = (_DAT_145f39ecc * fVar3) / fVar7 + _DAT_145dad260;
      }
      fVar3 = fVar3 + fVar8 * fVar5;
      if (fVar7 < fVar3) {
        fVar8 = (fVar7 / fVar3) * (fVar7 / fVar3) * _DAT_145db1390;
      }
      else {
        fVar8 = (_DAT_145f39ecc * fVar3) / fVar7 + _DAT_145dad260;
      }
      fVar3 = fVar3 + fVar8 * fVar5;
      if (fVar3 <= fVar7) {
        fVar8 = (_DAT_145f39ecc * fVar3) / fVar7 + _DAT_145dad260;
      }
      else {
        fVar8 = (fVar7 / fVar3) * (fVar7 / fVar3) * _DAT_145db1390;
      }
      fVar3 = fVar3 + fVar8 * fVar5;
      if (fVar7 < fVar3) {
        fVar8 = (fVar7 / fVar3) * (fVar7 / fVar3) * _DAT_145db1390;
      }
      else {
        fVar8 = (_DAT_145f39ecc * fVar3) / fVar7 + _DAT_145dad260;
      }
      fVar3 = fVar3 + fVar8 * fVar5;
      if (fVar3 <= fVar7) {
        return (ulong)(uint)((fVar3 + fVar5 * ((_DAT_145f39ecc * fVar3) / fVar7 + _DAT_145dad260)) -
                            fVar6);
      }
      return (ulong)(uint)((fVar3 + fVar5 * (fVar7 / fVar3) * (fVar7 / fVar3) * _DAT_145db1390) -
                          fVar6);
    }
  }
  if (uVar2 - 7 < 0xd) {
                    /* WARNING: Could not emulate address calculation at 0x00014589e705 */
                    /* WARNING: Treating indirect jump as call */
    uVar4 = (*(code *)((long)*(int *)((ulong)(uVar2 - 7) * 4 + 0x146c05e64) + 0x146c05e64))();
    return uVar4;
  }
  fVar5 = (fVar5 * fVar3) / (fVar7 * _DAT_145db14c8);
LAB_14589e1e2:
  fVar6 = fVar5;
  if (fVar3 <= fVar5) {
    fVar6 = fVar3;
  }
  return (ulong)(~-(uint)NAN(fVar6) & (uint)fVar6 | (uint)fVar5 & -(uint)NAN(fVar6));
}
