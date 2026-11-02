undefined8
FUN_145910250(undefined8 param_1,undefined8 param_2,undefined4 param_3,long param_4,
             undefined8 param_5,long param_6)

{
  char cVar1;
  ulong uVar2;
  int iVar3;
  long lVar4;
  undefined8 uVar5;
  uint uVar6;
  long *extraout_RDX;
  long *plVar7;
  ulong uVar8;
  ulong uVar9;
  byte *pbVar10;
  long lVar11;
  uint in_stack_00000028;

  FUN_145912d90(param_1,param_4,param_5,param_3,param_6);
  if (extraout_RDX == (long *)0x0) {
    return 0;
  }
  uVar2 = *(ulong *)(param_4 + 0x10);
  plVar7 = extraout_RDX;
  if (uVar2 == 0) {
    if (in_stack_00000028 == 0) {
      return 0;
    }
    cVar1 = *(char *)((long)extraout_RDX + 0x72);
    goto joined_r0x0001459102c0;
  }
  lVar4 = *(long *)(param_4 + 8);
  if (uVar2 < 4) {
    uVar8 = 0;
    uVar6 = 0;
LAB_145910311:
    uVar9 = 0;
    do {
      uVar6 = uVar6 + *(byte *)(uVar8 * 0x10 + lVar4 + 8 + uVar9);
      uVar9 = uVar9 + 0x10;
    } while (((uint)uVar2 & 3) << 4 != uVar9);
  }
  else {
    pbVar10 = (byte *)(lVar4 + 0x38);
    uVar8 = 0;
    uVar6 = 0;
    do {
      uVar6 = (uint)*pbVar10 + (uint)pbVar10[-0x10] + (uint)pbVar10[-0x20] + pbVar10[-0x30] + uVar6;
      uVar8 = uVar8 + 4;
      pbVar10 = pbVar10 + 0x40;
    } while ((uVar2 & 0xfffffffffffffffc) != uVar8);
    if ((uVar2 & 3) != 0) goto LAB_145910311;
  }
  if (in_stack_00000028 <= uVar6) {
    return 0;
  }
  lVar11 = 0;
  do {
    if ((*(long *)(*(long *)(lVar4 + lVar11) + 0x28) == param_6) &&
       (iVar3 = func_0x000145bfa0e1(), iVar3 == 0)) {
      if (*(byte *)((long)plVar7 + 0x72) <= *(byte *)(lVar4 + 8 + lVar11)) {
        return 0;
      }
      goto LAB_145910395;
    }
    lVar11 = lVar11 + 0x10;
  } while (uVar2 << 4 != lVar11);
  cVar1 = *(char *)((long)plVar7 + 0x72);
joined_r0x0001459102c0:
  if (cVar1 != '\0') {
LAB_145910395:
    uVar6 = FUN_145910430();
    if (((uint)*(byte *)(plVar7 + 0xe) + (uint)*(byte *)(plVar7 + 0xe) * 4 <= uVar6) &&
       (lVar4 = FUN_14590fb00(), lVar4 == 0)) {
      if (*plVar7 != 0) {
        uVar5 = FUN_1459a00c0();
        return uVar5;
      }
      return 1;
    }
  }
  return 0;
}
