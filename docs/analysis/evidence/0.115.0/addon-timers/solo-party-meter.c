
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

long * entry(undefined8 param_1,undefined8 param_2,long param_3,long *param_4)

{
  long *plVar1;
  long lVar2;
  long lVar3;
  code *pcVar4;
  float fVar5;
  long lVar6;
  long lVar7;
  long lVar8;
  long lVar9;
  long lVar10;
  long lVar11;
  ulong uVar12;
  ulong uVar13;
  ulong uVar14;
  ulong uVar15;
  long lVar16;
  undefined1 auVar17 [16];
  long local_a8;
  long local_a0;
  long local_98;
  double local_90;
  double local_88;
  undefined1 *local_80;
  long lStack_78;
  double *local_70;
  double *local_68;
  long local_60;
  long local_58;
  long local_50;
  long local_48;
  undefined1 local_39;
  undefined8 local_38;

  local_38 = 0xfffffffffffffffe;
  fVar5 = *(float *)(param_3 + 0xb9c);
  if (*(float *)(param_3 + 0xb9c) <= _DAT_145edfeb0) {
    fVar5 = _DAT_145edfeb0;
  }
  local_88 = (double)fVar5;
  lVar2 = *(long *)(param_3 + 0x9e8);
  local_48 = lVar2 * 8;
  local_50 = lVar2;
  if (lVar2 == 0) {
    lStack_78 = 8;
    lVar10 = 8;
    local_90 = _DAT_145ee3c60;
    goto LAB_1458f4aa6;
  }
  lVar3 = *(long *)(param_3 + 0x9e0);
  func_0x000140002200();
  lVar10 = func_0x0001400021c0();
  lVar9 = lRam000000014732f298;
  lVar8 = _DAT_14732f290;
  lVar7 = lRam000000014732f288;
  lVar6 = _DAT_14732f280;
  if (lVar10 == 0) {
    func_0x000145eb6fcb();
                    /* WARNING: Does not return */
    pcVar4 = (code *)invalidInstructionException();
    (*pcVar4)();
  }
  uVar14 = lVar2 * 0x50 - 0x50;
  if (uVar14 < 0xf0) {
    uVar14 = 0;
    lVar11 = lVar3;
LAB_1458f49de:
    do {
      uVar13 = uVar14;
      *(long *)(lVar10 + uVar13 * 8) = lVar11;
      uVar14 = uVar13 + 1;
      lVar11 = lVar11 + 0x50;
    } while (lVar11 != lVar3 + lVar2 * 0x50);
  }
  else {
    uVar12 = uVar14 / 0x50 + 1;
    uVar14 = uVar12 & 0xfffffffffffffffc;
    lVar11 = uVar14 * 0x50 + lVar3;
    uVar13 = 0;
    lVar16 = lVar3;
    do {
      auVar17._8_4_ = (int)lVar16;
      auVar17._0_8_ = lVar16;
      auVar17._12_4_ = (int)((ulong)lVar16 >> 0x20);
      plVar1 = (long *)(lVar10 + uVar13 * 8);
      *plVar1 = lVar16 + lVar6;
      plVar1[1] = auVar17._8_8_ + lVar7;
      plVar1 = (long *)(lVar10 + 0x10 + uVar13 * 8);
      *plVar1 = lVar16 + lVar8;
      plVar1[1] = auVar17._8_8_ + lVar9;
      uVar13 = uVar13 + 4;
      lVar16 = lVar16 + 0x140;
    } while (uVar14 != uVar13);
    if (uVar12 != uVar14) goto LAB_1458f49de;
    uVar13 = uVar14 - 1;
  }
  local_80 = &local_39;
  uVar12 = 1;
  if (uVar13 != 0) {
    uVar12 = uVar14;
    if (uVar13 < 0x14) {
      func_0x0001458a24b0();
    }
    else {
      local_60 = lVar10;
      func_0x0001458b2440();
    }
  }
  uVar14 = (ulong)((uint)uVar12 & 3);
  local_90 = _DAT_145ee3c60;
  if (uVar12 - 1 < 3) {
    uVar13 = 0;
LAB_1458f4a89:
    uVar15 = 0;
    do {
      local_90 = local_90 + *(double *)(*(long *)(lVar10 + uVar13 * 8 + uVar15 * 8) + 0x30);
      uVar15 = uVar15 + 1;
    } while (uVar14 != uVar15);
  }
  else {
    uVar13 = 0;
    do {
      local_90 = local_90 + *(double *)(*(long *)(lVar10 + uVar13 * 8) + 0x30) +
                 *(double *)(*(long *)(lVar10 + 8 + uVar13 * 8) + 0x30) +
                 *(double *)(*(long *)(lVar10 + 0x10 + uVar13 * 8) + 0x30) +
                 *(double *)(*(long *)(lVar10 + 0x18 + uVar13 * 8) + 0x30);
      uVar13 = uVar13 + 4;
    } while ((uVar12 & 0xfffffffffffffffc) != uVar13);
    if (uVar14 != 0) goto LAB_1458f4a89;
  }
  lStack_78 = lVar10 + uVar12 * 8;
LAB_1458f4aa6:
  local_70 = &local_88;
  local_68 = &local_90;
  local_80 = (undefined1 *)lVar10;
  local_60 = lVar10;
  func_0x0001459d3620();
  local_58 = lVar10;
  func_0x0001458c01f0();
  param_4[2] = (long)local_70;
  *param_4 = (long)local_80;
  param_4[1] = lStack_78;
  if (local_50 != 0) {
    func_0x0001400021d0();
  }
  if (local_98 != 0) {
    local_a0 = local_a0 + 8;
    do {
      if (*(long *)(local_a0 + -8) != 0) {
        func_0x0001400021d0();
      }
      local_a0 = local_a0 + 0x18;
      local_98 = local_98 + -1;
    } while (local_98 != 0);
  }
  if (local_a8 != 0) {
    func_0x0001400021d0();
  }
  return param_4;
}
