
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

ulong entry(undefined8 param_1,undefined8 param_2,int param_3,undefined8 *param_4)

{
  undefined8 *puVar1;
  undefined8 *puVar2;
  float *pfVar3;
  char cVar4;
  ulong uVar5;
  undefined8 *puVar6;
  ulong uVar7;
  float fVar8;
  float fVar9;
  float extraout_XMM0_Da;
  undefined4 in_XMM6_Da;
  undefined4 in_XMM7_Da;
  float fVar10;
  undefined4 uVar11;
  float fVar12;
  float fVar13;
  float fVar14;
  float fVar15;
  float fVar16;
  float fVar17;
  undefined8 local_c8;
  float local_c0;
  undefined8 local_b8;
  float local_b0;
  undefined8 local_a8;
  undefined4 local_a0;
  undefined4 local_98;
  undefined4 local_88;

  puVar1 = (undefined8 *)*param_4;
  uVar11 = 0;
  fVar10 = *(float *)param_4[1] +
           ((float)param_3 * (_DAT_145f4eac0 - **(float **)param_4[2])) / _DAT_145d6d650;
  puVar2 = (undefined8 *)*puVar1;
  puVar6 = *(undefined8 **)puVar1[1];
  fVar9 = *(float *)(puVar6 + 1);
  fVar15 = fVar9 * fVar9;
  local_98 = in_XMM6_Da;
  local_88 = in_XMM7_Da;
  fVar8 = (float)func_0x000145bc97c3(fVar10);
  pfVar3 = (float *)puVar1[2];
  fVar14 = *pfVar3;
  fVar12 = (float)*puVar2;
  fVar13 = (float)((ulong)*puVar2 >> 0x20);
  fVar16 = (float)*puVar6;
  fVar17 = (float)((ulong)*puVar6 >> 0x20);
  fVar15 = _DAT_145d6d36c / SQRT(fVar17 * fVar17 + fVar16 * fVar16 + fVar15);
  fVar16 = fVar8 * fVar15 * fVar16;
  fVar17 = fVar8 * fVar15 * fVar17;
  fVar8 = fVar15 * fVar9 * fVar8;
  fVar9 = (float)func_0x000145bc97bd(CONCAT44(uVar11,fVar10));
  fVar8 = (fVar9 * _DAT_145d6d300 + fVar8) * fVar14 + *(float *)(puVar2 + 1);
  fVar12 = fVar14 * (fVar16 + fVar9 * _DAT_145d6d300) + fVar12;
  fVar13 = fVar14 * (fVar17 + fVar9 * fRam0000000145d6d304) + fVar13;
  local_c8 = CONCAT44(fVar13,fVar12);
  puVar1 = (undefined8 *)puVar1[3];
  local_c0 = fVar8;
  local_b8 = local_c8;
  local_b0 = fVar8;
  func_0x0001418e5a00(*(undefined8 *)*puVar1,puVar1[1],*(undefined8 *)((undefined8 *)puVar1[2])[1],
                      **(undefined8 **)puVar1[2],&local_c8);
  cVar4 = func_0x000140acaca0();
  if (cVar4 == '\0') {
    uVar7 = 0;
  }
  else {
    local_a0 = *(undefined4 *)(puVar2 + 1);
    local_a8 = *puVar2;
    local_c0 = fVar8 - *(float *)(puVar2 + 1);
    local_c8 = CONCAT44(fVar13 - (float)((ulong)*puVar2 >> 0x20),fVar12 - (float)*puVar2);
    uVar7 = 0;
    uVar5 = func_0x000141898ff0();
    if (((uVar5 & 1) == 0) || (*pfVar3 * _DAT_145f4eac4 <= extraout_XMM0_Da)) {
      uVar7 = 1;
    }
  }
  return uVar7 & 0xffffffff;
}
