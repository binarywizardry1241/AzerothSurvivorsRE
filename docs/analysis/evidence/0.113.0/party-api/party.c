
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

long * FUN_1458d5c80(undefined8 param_1,undefined8 param_2,long param_3,long *param_4)

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
  ulong uVar11;
  long lVar12;
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
  fVar5 = *(float *)(param_3 + 0xb6c);
  if (*(float *)(param_3 + 0xb6c) <= _DAT_145ea0290) {
    fVar5 = _DAT_145ea0290;
  }
  local_88 = (double)fVar5;
  lVar2 = *(long *)(param_3 + 0x9d8);
  local_48 = lVar2 * 8;
  local_50 = lVar2;
  if (lVar2 == 0) {
    lStack_78 = 8;
    lVar10 = 8;
    local_90 = _DAT_145eaa520;
    goto LAB_1458d5e66;
  }
  lVar3 = *(long *)(param_3 + 0x9d0);
  func_0x000140002200();
  lVar10 = func_0x0001400021c0();
  lVar9 = lRam0000000147315368;
  lVar8 = _DAT_147315360;
  lVar7 = lRam0000000147315358;
  lVar6 = _DAT_147315350;
  if (lVar10 == 0) {
    func_0x000145e99f5b();
                    /* WARNING: Does not return */
    pcVar4 = (code *)invalidInstructionException();
    (*pcVar4)();
  }
  uVar14 = lVar2 * 0x40 - 0x40;
  if (uVar14 < 0xc0) {
    uVar14 = 0;
    lVar12 = lVar3;
LAB_1458d5d9e:
    do {
      uVar13 = uVar14;
      *(long *)(lVar10 + uVar13 * 8) = lVar12;
      uVar14 = uVar13 + 1;
      lVar12 = lVar12 + 0x40;
    } while (lVar12 != lVar3 + lVar2 * 0x40);
  }
  else {
    uVar13 = (uVar14 >> 6) + 1;
    uVar14 = uVar13 & 0xfffffffffffffffc;
    lVar12 = uVar14 * 0x40 + lVar3;
    uVar11 = 0;
    lVar16 = lVar3;
    do {
      auVar17._8_4_ = (int)lVar16;
      auVar17._0_8_ = lVar16;
      auVar17._12_4_ = (int)((ulong)lVar16 >> 0x20);
      plVar1 = (long *)(lVar10 + uVar11 * 8);
      *plVar1 = lVar16 + lVar6;
      plVar1[1] = auVar17._8_8_ + lVar7;
      plVar1 = (long *)(lVar10 + 0x10 + uVar11 * 8);
      *plVar1 = lVar16 + lVar8;
      plVar1[1] = auVar17._8_8_ + lVar9;
      uVar11 = uVar11 + 4;
      lVar16 = lVar16 + 0x100;
    } while (uVar14 != uVar11);
    if (uVar13 != uVar14) goto LAB_1458d5d9e;
    uVar13 = uVar14 - 1;
  }
  local_80 = &local_39;
  uVar11 = 1;
  if (uVar13 != 0) {
    uVar11 = uVar14;
    if (uVar13 < 0x14) {
      FUN_1459c84b0();
    }
    else {
      local_60 = lVar10;
      func_0x00014580b810();
    }
  }
  uVar14 = (ulong)((uint)uVar11 & 3);
  local_90 = _DAT_145eaa520;
  if (uVar11 - 1 < 3) {
    uVar13 = 0;
LAB_1458d5e49:
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
    } while ((uVar11 & 0xfffffffffffffffc) != uVar13);
    if (uVar14 != 0) goto LAB_1458d5e49;
  }
  lStack_78 = lVar10 + uVar11 * 8;
LAB_1458d5e66:
  local_70 = &local_88;
  local_68 = &local_90;
  local_80 = (undefined1 *)lVar10;
  local_60 = lVar10;
  FUN_14599d7f0();
  local_58 = lVar10;
  FUN_1459bdb80();
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
