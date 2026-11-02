/* WARNING: Control flow encountered bad instruction data */

void entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,undefined8 param_4,
          undefined8 param_5,long *param_6,ulong *param_7,undefined8 param_8,
          undefined1 (*param_9) [16])

{
  undefined4 *puVar1;
  undefined1 (*pauVar2) [16];
  undefined8 *puVar3;
  long lVar4;
  long lVar5;
  code *pcVar6;
  byte bVar7;
  undefined1 auVar8 [16];
  int iVar9;
  long lVar10;
  long lVar11;
  ulong uVar12;
  ulong uVar13;
  ulong uVar14;
  long lVar15;
  long lVar16;
  long *plVar17;
  long lVar18;
  long lVar19;
  undefined4 uVar20;
  undefined4 uVar21;
  undefined1 auVar22 [16];
  long in_stack_00000028;
  undefined7 uStack_af;

  uVar20 = (undefined4)param_3;
  uVar21 = (undefined4)((ulong)param_3 >> 0x20);
  lVar4 = *param_6;
  lVar11 = param_6[3];
  lVar5 = param_6[4];
  lVar19 = param_6[5];
  uVar12 = param_7[1];
  uVar14 = param_7[2];
  if (uVar14 != 0) {
    lVar15 = param_6[2];
    lVar16 = uVar14 * 0x50;
    uVar13 = 0;
    lVar18 = 0;
    do {
      if (((*(long *)(uVar12 + 0x28 + lVar18) == lVar15) &&
          (iVar9 = func_0x000145bc9787(), iVar9 == 0)) &&
         (*(char *)(uVar12 + 0x48 + lVar18) == (char)lVar19)) {
        bVar7 = 1;
        uVar12 = uVar14;
        uVar14 = uVar13;
        goto LAB_14595f540;
      }
      uVar13 = uVar13 + 1;
      lVar18 = lVar18 + 0x50;
    } while (lVar16 != lVar18);
  }
  lVar15 = param_6[2];
  lVar16 = *param_6;
  lVar18 = param_6[1];
  if (uVar14 == *param_7) {
    func_0x000145bfb510();
    uVar12 = param_7[1];
  }
  lVar10 = uVar14 * 0x50;
  puVar3 = (undefined8 *)(uVar12 + 0x40 + lVar10);
  *puVar3 = 0;
  puVar3[1] = CONCAT71(uStack_af,(char)lVar19);
  plVar17 = (long *)(uVar12 + 0x30 + lVar10);
  *plVar17 = lVar11;
  plVar17[1] = lVar5;
  plVar17 = (long *)(uVar12 + 0x20 + lVar10);
  *plVar17 = lVar18;
  plVar17[1] = lVar15;
  puVar3 = (undefined8 *)(uVar12 + 0x10 + lVar10);
  *puVar3 = 0;
  puVar3[1] = lVar16;
  puVar1 = (undefined4 *)(uVar12 + lVar10);
  *puVar1 = 0;
  puVar1[1] = 0;
  puVar1[2] = 8;
  puVar1[3] = 0;
  uVar12 = uVar14 + 1;
  param_7[2] = uVar12;
  bVar7 = 0;
LAB_14595f540:
  if (uVar12 <= uVar14) {
    func_0x000145d697e3();
                    /* WARNING: Does not return */
    pcVar6 = (code *)invalidInstructionException();
    (*pcVar6)();
  }
  uVar12 = param_7[1];
  lVar11 = uVar14 * 0x50;
  plVar17 = (long *)(uVar12 + lVar11);
  *(double *)(uVar12 + 0x40 + lVar11) =
       (double)CONCAT44(uVar21,uVar20) + *(double *)(uVar12 + 0x40 + lVar11);
  pauVar2 = (undefined1 (*) [16])((long)param_9 + in_stack_00000028 * 0x18);
  while (param_9 != pauVar2) {
    while( true ) {
      auVar8 = *param_9;
      uVar20 = (undefined4)*(undefined8 *)param_9[1];
      uVar21 = (undefined4)((ulong)*(undefined8 *)param_9[1] >> 0x20);
      auVar22 = func_0x0001458da590();
      param_9 = (undefined1 (*) [16])(param_9[1] + 8);
      if (auVar22._0_8_ == 0) {
        auVar22 = auVar8;
      }
      lVar11 = plVar17[1];
      lVar5 = plVar17[2];
      lVar19 = lVar5 * 0x20;
      if (lVar5 == 0) break;
      lVar15 = 0;
      while ((*(long *)(lVar11 + 0x10 + lVar15) != auVar22._8_8_ ||
             (iVar9 = func_0x000145bc9787(), iVar9 != 0))) {
        lVar15 = lVar15 + 0x20;
        if (lVar19 == lVar15) goto LAB_14595f690;
      }
      *(double *)(lVar11 + 0x18 + lVar15) =
           (double)CONCAT44(uVar21,uVar20) + *(double *)(lVar11 + 0x18 + lVar15);
      if (param_9 == pauVar2) goto LAB_14595f57b;
    }
LAB_14595f690:
    if (lVar5 == *plVar17) {
      func_0x000145bcb530();
      lVar11 = plVar17[1];
    }
    *(undefined8 *)(lVar11 + lVar19) = 0xffffffffffffffff;
    *(long *)(lVar11 + 8 + lVar19) = auVar22._0_8_;
    *(long *)(lVar11 + 0x10 + lVar19) = auVar22._8_8_;
    *(ulong *)(lVar11 + 0x18 + lVar19) = CONCAT44(uVar21,uVar20);
    plVar17[2] = lVar5 + 1;
  }
LAB_14595f57b:
  if (!(bool)(bVar7 & lVar4 - 1U < 0xfffffffffffffffe)) {
    return;
  }
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}
