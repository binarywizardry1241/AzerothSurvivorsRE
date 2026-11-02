/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8
FUN_14595c200(undefined8 param_1,undefined8 param_2,ulong param_3,long param_4,undefined8 param_5,
             long param_6)

{
  long *plVar1;
  char *pcVar2;
  char cVar3;
  byte bVar4;
  ulong uVar5;
  code *pcVar6;
  undefined8 uVar7;
  ulong uVar8;
  ulong uVar9;
  long lVar10;
  long lVar11;
  long lVar12;
  uint uVar13;
  long lVar14;
  ulong uVar15;
  ulong uVar16;
  float fVar17;
  float fVar18;

  if (*(ulong *)(param_4 + 0xd8) <= param_3) {
    func_0x000145da9883(param_1,param_2,*(ulong *)(param_4 + 0xd8),param_3,0x146c0b8a8);
                    /* WARNING: Does not return */
    pcVar6 = (code *)invalidInstructionException();
    (*pcVar6)();
  }
  lVar11 = *(long *)(param_4 + 0x7f8);
  uVar5 = *(ulong *)(param_4 + 0x800);
  if ((uVar5 != 0) && (uVar5 != 1)) {
    uVar15 = 0;
    do {
      uVar15 = uVar15 + 2;
    } while ((uVar5 & 0xfffffffffffffffe) != uVar15);
  }
  uVar15 = *(ulong *)(param_4 + 0x398);
  if ((uVar15 != 0) && (uVar15 != 1)) {
    uVar9 = 0;
    do {
      uVar9 = uVar9 + 2;
    } while ((uVar15 & 0xfffffffffffffffe) != uVar9);
  }
  fVar17 = _DAT_145dad4e0;
  if (uVar5 != 0) {
    if (uVar5 == 1) {
      uVar15 = 0;
    }
    else {
      uVar15 = 0;
      do {
        if (*(char *)(lVar11 + uVar15 * 8) == '\x1d') {
          fVar17 = fVar17 + *(float *)(lVar11 + 4 + uVar15 * 8);
          cVar3 = *(char *)(lVar11 + 8 + uVar15 * 8);
        }
        else {
          cVar3 = *(char *)(lVar11 + 8 + uVar15 * 8);
        }
        if (cVar3 == '\x1d') {
          fVar17 = fVar17 + *(float *)(lVar11 + 0xc + uVar15 * 8);
        }
        uVar15 = uVar15 + 2;
      } while ((uVar5 & 0xfffffffffffffffe) != uVar15);
      if ((uVar5 & 1) == 0) goto LAB_14595c43c;
    }
    if (*(char *)(lVar11 + uVar15 * 8) == '\x1d') {
      fVar17 = fVar17 + *(float *)(lVar11 + 4 + uVar15 * 8);
    }
  }
LAB_14595c43c:
  lVar12 = *(long *)(*(long *)(param_4 + 0xd0) + 0x18 + param_3 * 0x80);
  lVar10 = *(long *)(param_4 + 0x570) * 0x1d8;
  lVar14 = 0;
  lVar11 = *(long *)(param_4 + 0x568);
  do {
    if (lVar10 - lVar14 == 0) {
      cVar3 = *(char *)(lVar12 + 0x39);
      if ((cVar3 == '\x01') || (cVar3 != '\x02')) goto LAB_14595c716;
      lVar12 = 0;
      goto LAB_14595c5a0;
    }
    lVar14 = lVar14 + 0x1d8;
    plVar1 = (long *)(lVar11 + 0xf0);
    lVar11 = lVar11 + 0x1d8;
  } while (*plVar1 != param_6);
  uVar13 = (uint)*(byte *)(lVar12 + 0x39);
  if (*(long *)(*(long *)(param_4 + 0x568) + -0x1c0 + lVar14) == -1) {
    uVar13 = uVar13 - 1;
    if (uVar13 < 7) {
                    /* WARNING: Could not emulate address calculation at 0x00014595c56f */
                    /* WARNING: Treating indirect jump as call */
      uVar7 = (*(code *)((long)*(int *)((ulong)uVar13 * 4 + 0x146c0c6d0) + 0x146c0c6d0))();
      return uVar7;
    }
  }
  else {
    uVar13 = uVar13 - 1;
    if (uVar13 < 7) {
                    /* WARNING: Could not emulate address calculation at 0x00014595c4eb */
                    /* WARNING: Treating indirect jump as call */
      uVar7 = (*(code *)((long)*(int *)((ulong)uVar13 * 4 + 0x146c0c6b4) + 0x146c0c6b4))();
      return uVar7;
    }
  }
LAB_14595c716:
  fVar17 = *(float *)(param_4 + 0x48c) + fVar17;
  uVar15 = *(ulong *)(param_4 + 0x9b8);
  uVar9 = *(ulong *)(param_4 + 0x9c0);
  uVar5 = *(ulong *)(param_4 + 0x9d0) + uVar15;
  uVar16 = *(ulong *)(param_4 + 0x9c8) ^ uVar15;
  uVar8 = *(ulong *)(param_4 + 0x9d0) ^ uVar9;
  *(ulong *)(param_4 + 0x9c0) = uVar9 ^ uVar16;
  *(ulong *)(param_4 + 0x9b8) = uVar15 ^ uVar8;
  *(ulong *)(param_4 + 0x9c8) = uVar16 ^ uVar9 << 0x11;
  uVar9 = uVar8 << 0x2d | uVar8 >> 0x13;
  fVar18 = (float)(uint)((uVar5 * 0x800000 | uVar5 >> 0x29) + uVar15 >> 0x28) * _DAT_145ec2a40;
  if (_DAT_145dad260 <= fVar17) {
    fVar17 = _DAT_145dad260;
  }
  *(ulong *)(param_4 + 0x9d0) = uVar9;
  return CONCAT71((int7)(uVar9 >> 8),fVar18 < fVar17);
  while (lVar14 = lVar12 + 0x40, pcVar2 = (char *)(*(long *)(param_4 + 0x828) + lVar12),
        lVar12 = lVar14, *pcVar2 != '\x1e') {
LAB_14595c5a0:
    if (*(long *)(param_4 + 0x830) << 6 == lVar12) goto LAB_14595c716;
  }
  bVar4 = *(byte *)(*(long *)(param_4 + 0x828) + -0x3f + lVar14);
  if (((ulong)bVar4 != 0) && (3 < bVar4)) {
    func_0x000145da9883(lVar11,lVar10,3,(ulong)bVar4 - 1,0x146c0b8d0);
                    /* WARNING: Does not return */
    pcVar6 = (code *)invalidInstructionException();
    (*pcVar6)();
  }
  goto LAB_14595c716;
}
