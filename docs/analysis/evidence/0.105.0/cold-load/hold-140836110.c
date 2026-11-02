/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 param_4,long *param_5,
          long *param_6)

{
  float fVar1;
  float fVar2;
  undefined4 uVar3;
  int iVar4;
  undefined8 *puVar5;
  undefined4 *puVar6;
  long lVar7;
  long lVar8;
  undefined8 uVar9;
  undefined8 uVar10;
  long lVar11;
  undefined8 uVar12;
  long lVar13;
  char cVar14;
  int iVar15;
  int iVar16;
  int extraout_EDX;
  long lVar17;
  long lVar18;
  bool bVar19;
  bool bVar20;
  uint extraout_XMM0_Da;
  uint uVar21;
  uint *in_stack_00000028;
  long *in_stack_00000030;

  puVar5 = (undefined8 *)*param_5;
  if (puVar5 == (undefined8 *)0x0) {
    return;
  }
  lVar18 = *param_3;
  puVar6 = (undefined4 *)param_3[2];
  uVar3 = *(undefined4 *)((long)param_3 + 0x1c);
  lVar7 = *param_6;
  lVar8 = *in_stack_00000030;
  if ((*(byte *)(puVar5 + 6) & 1) == 0) {
LAB_140836197:
    bVar19 = false;
    cVar14 = *(char *)((long)puVar5 + 0x3c);
  }
  else {
    iVar16 = *(int *)(puVar5 + 7);
    iVar4 = *(int *)((long)puVar5 + 0x34);
    iVar15 = func_0x000145b4cb10(*(uint *)(lVar18 + 0x78) ^ _DAT_145d6d7e0,
                                 *(uint *)(lVar18 + 0x70) ^ _DAT_145d6d7e0);
    if (iVar4 != iVar15) goto LAB_140836197;
    bVar19 = iVar16 == extraout_EDX;
    cVar14 = *(char *)((long)puVar5 + 0x3c);
  }
  if ((cVar14 != '\0') && ((puVar5[1] != 0 & bVar19) == 1)) {
    *puVar6 = uVar3;
    *(undefined1 *)(lVar18 + 0xec) = 0;
  }
  uVar9 = *puVar5;
  uVar10 = puVar5[1];
  lVar17 = puVar5[2];
  lVar11 = puVar5[3];
  uVar12 = puVar5[4];
  lVar13 = puVar5[5];
  uVar21 = *in_stack_00000028;
  in_stack_00000028[0] = 1;
  in_stack_00000028[1] = 0;
  *(undefined8 *)(in_stack_00000028 + 2) = uVar9;
  *(undefined8 *)(in_stack_00000028 + 4) = uVar10;
  *(long *)(in_stack_00000028 + 6) = lVar17;
  *(long *)(in_stack_00000028 + 8) = lVar11;
  *(undefined8 *)(in_stack_00000028 + 10) = uVar12;
  *(long *)(in_stack_00000028 + 0xc) = lVar13;
  bVar20 = true;
  if ((uVar21 & 1) != 0) {
    iVar16 = func_0x000145bc9787();
    bVar20 = iVar16 != 0;
    uVar21 = extraout_XMM0_Da;
  }
  if (*(char *)(lVar18 + 0xeb) != '\x01') {
    return;
  }
  fVar1 = *(float *)(lVar7 + 0x5c);
  if (((*(byte *)(lVar18 + 0xec) ^ 1) &
       ((lVar11 == 0 && lVar17 == 0) && lVar13 == 0) & *(byte *)((long)puVar5 + 0x3d) & bVar19) == 0
     ) {
    if ((*(byte *)(lVar18 + 0xec) & 1) != 0 || bVar20) {
      *puVar6 = uVar3;
      *(float *)(lVar18 + 0xa0) = fVar1 + _DAT_145d6d428;
      goto LAB_140836313;
    }
    if (fVar1 < *(float *)(lVar18 + 0xa0)) goto LAB_140836313;
    *puVar6 = uVar3;
    *(undefined1 *)(lVar18 + 0xeb) = 0;
    fVar2 = *(float *)(lVar18 + 0xa4);
  }
  else {
    *puVar6 = uVar3;
    *(undefined1 *)(lVar18 + 0xeb) = 0;
    fVar2 = *(float *)(lVar18 + 0xa4);
  }
  func_0x0001409bd600(uVar21,fVar1 - fVar2);
LAB_140836313:
  if ((*(char *)(lVar18 + 0xeb) == '\0') && ((lVar8 != 0 & *(byte *)(lVar18 + 0xee)) == 1)) {
    *puVar6 = uVar3;
    *(undefined1 *)(lVar18 + 0xee) = 0;
    func_0x000140ec6530();
    func_0x0001407b0df0();
    if ((*_DAT_147ff6fa8 < 3) &&
       (((DAT_147fbd1d8 - 1 < 2 ||
         ((DAT_147fbd1d8 != 0 && (cVar14 = func_0x000145d15470(), cVar14 != '\0')))) &&
        (cVar14 = func_0x000144c46ce0(), cVar14 != '\0')))) {
      func_0x000144c48500();
    }
  }
  return;
}
