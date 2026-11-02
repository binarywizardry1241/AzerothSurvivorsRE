
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

ulong * entry(undefined8 param_1,undefined8 param_2,uint param_3,ulong *param_4,ulong param_5,
             ulong param_6)

{
  ulong uVar1;
  int *piVar2;
  code *pcVar3;
  int iVar4;
  int iVar5;
  uint uVar6;
  ulong uVar7;
  int iVar8;
  ulong uVar9;
  int iVar10;
  int iVar11;
  long *plVar12;
  ulong *puVar13;
  long lVar14;
  int iVar15;
  ulong uVar16;
  ulong uVar17;
  long lVar18;
  ulong uVar19;
  int iVar20;
  int iVar21;
  int iVar22;
  int iVar23;
  undefined4 in_XMM6_Da;
  int iVar24;
  undefined8 in_XMM7_Qa;
  long *local_100;
  long *local_f8;
  undefined8 local_f0;
  ulong *local_e8;
  undefined1 *local_e0;
  ulong *local_d8;
  int *local_d0;
  undefined8 local_c0;
  long local_a0;
  ulong local_98;
  long local_90;
  ulong *local_88;
  long local_80;
  int local_78;
  undefined1 local_71;
  undefined8 local_70;
  undefined4 local_68;
  undefined8 local_58;

  local_70 = 0xfffffffffffffffe;
  local_71 = (undefined1)param_3;
  if (0xb < param_5 || 4 < param_6) {
    *param_4 = 0;
    param_4[1] = 4;
    param_4[2] = 0;
    return param_4;
  }
  uVar9 = *(ulong *)(param_5 * 8 + 0x146985910);
  iVar24 = *(int *)(uVar9 * 4 + 0x146986238);
  local_98 = uVar9;
  local_78 = iVar24;
  local_68 = in_XMM6_Da;
  local_58 = in_XMM7_Qa;
  if (*(char *)(*(long *)(param_5 * 0xf0 + 0x1467164c0) + 0x54 + param_6 * 0x58) == '\0') {
    local_100 = (long *)0x146716438;
    local_f8 = (long *)0x146716f78;
    local_f0 = 0;
    local_e0 = (undefined1 *)0x0;
    local_c0 = 0;
    plVar12 = &local_90;
    local_e8 = &local_98;
    func_0x00014552cb40(plVar12,param_4,&local_100,plVar12);
    if (local_80 != 0) {
      puVar13 = local_88 + local_80 * 2;
      lVar14 = 0;
      do {
        if ((*local_88 == param_5) && (local_88[1] == param_6)) {
          local_f8 = &local_a0;
          local_f0 = 0;
          local_e8 = (ulong *)&DAT_00000008;
          local_e0 = &local_71;
          local_d0 = &local_78;
          local_100 = plVar12;
          local_d8 = &local_98;
          local_a0 = lVar14;
          func_0x0001455287e0();
          goto joined_r0x000145458ba3;
        }
        local_88 = local_88 + 2;
        lVar14 = lVar14 + 1;
      } while (local_88 != puVar13);
    }
    *param_4 = 0;
    param_4[1] = 4;
    param_4[2] = 0;
joined_r0x000145458ba3:
    if (local_90 == 0) {
      return param_4;
    }
    func_0x0001400021d0();
    return param_4;
  }
  uVar6 = param_3 - 1;
  if (((byte)uVar6 < 0xb) && ((0x5dfU >> (uVar6 & 0x1f) & 1) != 0)) {
    uVar17 = *(long *)(*(long *)((ulong)(uVar6 & 0xff) * 8 + 0x14698b3a8) + 0x80) + 8;
  }
  else {
    uVar17 = 0;
  }
  uVar19 = uVar17 - 8;
  if (uVar17 < 8) {
    uVar19 = 0;
  }
  if (0x7ffffffffffffffc < uVar19 * 8 || uVar19 >> 0x3d != 0) {
LAB_145458be5:
    func_0x0001458e721b();
                    /* WARNING: Does not return */
    pcVar3 = (code *)invalidInstructionException();
    (*pcVar3)();
  }
  if (uVar19 * 8 == 0) {
    uVar7 = 4;
    uVar19 = 0;
    iVar11 = _DAT_145d3ced0;
    iVar4 = iRam0000000145d3ced4;
    iVar22 = _DAT_146985620;
    iVar23 = iRam0000000146985624;
    iVar5 = _DAT_146985630;
  }
  else {
    func_0x000140002200();
    uVar7 = func_0x0001400021c0();
    iVar11 = _DAT_145d3ced0;
    iVar4 = iRam0000000145d3ced4;
    iVar22 = _DAT_146985620;
    iVar23 = iRam0000000146985624;
    iVar5 = _DAT_146985630;
    if (uVar7 == 0) goto LAB_145458be5;
  }
  _DAT_145d3ced0 = iVar11;
  iRam0000000145d3ced4 = iVar4;
  _DAT_146985620 = iVar22;
  iRam0000000146985624 = iVar23;
  _DAT_146985630 = iVar5;
  if (uVar17 < 9) {
    uVar9 = 0;
  }
  else {
    iVar10 = (param_3 & 0xff) * 1000;
    iVar8 = 5;
    if (uVar9 < 5) {
      iVar8 = (int)uVar9;
    }
    uVar1 = uVar17 - 8;
    if (uVar1 < 4) {
      lVar14 = 8;
      uVar9 = 0;
    }
    else {
      iVar15 = iVar10 + iVar8 * 10 + 100000;
      uVar9 = uVar1 & 0xfffffffffffffffc;
      lVar14 = uVar9 + 8;
      iVar20 = _DAT_146985610 + iVar15;
      iVar21 = iRam0000000146985614 + iVar15;
      uVar16 = 0;
      do {
        piVar2 = (int *)(uVar7 + uVar16 * 8);
        *piVar2 = iVar22 * iVar5 + iVar15;
        piVar2[1] = iVar24;
        piVar2[2] = iVar23 * iVar5 + iVar15;
        piVar2[3] = iVar24;
        piVar2 = (int *)(uVar7 + 0x10 + uVar16 * 8);
        *piVar2 = iVar22 * iVar5 + iVar20;
        piVar2[1] = iVar24;
        piVar2[2] = iVar23 * iVar5 + iVar21;
        piVar2[3] = iVar24;
        uVar16 = uVar16 + 4;
        iVar22 = iVar22 + iVar11;
        iVar23 = iVar23 + iVar4;
      } while (uVar9 != uVar16);
      if (uVar1 == uVar9) goto LAB_145458d74;
    }
    lVar18 = uVar17 - lVar14;
    iVar11 = iVar10 + (int)lVar14 * 100 + iVar8 * 10 + 100000;
    do {
      *(int *)(uVar7 + uVar9 * 8) = iVar11;
      *(int *)(uVar7 + 4 + uVar9 * 8) = iVar24;
      uVar9 = uVar9 + 1;
      iVar11 = iVar11 + 100;
      lVar18 = lVar18 + -1;
    } while (lVar18 != 0);
  }
LAB_145458d74:
  *param_4 = uVar19;
  param_4[1] = uVar7;
  param_4[2] = uVar9;
  return param_4;
}
