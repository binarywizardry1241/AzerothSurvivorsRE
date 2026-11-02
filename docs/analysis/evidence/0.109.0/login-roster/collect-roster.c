void FUN_1459c9650(undefined8 param_1,undefined8 param_2,long *param_3,ulong *param_4)

{
  undefined8 *puVar1;
  undefined4 *puVar2;
  long lVar3;
  undefined8 uVar4;
  code *pcVar5;
  undefined8 uVar6;
  undefined8 uVar7;
  ulong uVar8;
  ulong uVar9;
  long lVar10;
  ulong uVar11;
  char cVar12;
  long lVar13;
  undefined8 uStack_b0;
  undefined8 uStack_a8;
  undefined8 uStack_a0;
  undefined4 uStack_90;
  undefined4 uStack_8c;
  undefined4 uStack_88;
  undefined4 uStack_84;
  ulong uStack_58;

  lVar3 = *param_3;
  lVar10 = param_3[2];
  if (lVar3 == 1) {
    uVar9 = (ulong)(param_3[1] != 0);
    if (lVar10 != 0) {
      uVar9 = uVar9 + ((ulong)(param_3[3] - lVar10) >> 3) * 0x6db6db6db6db6db7;
      lVar13 = uVar9 * 0x38;
      goto joined_r0x0001459c9720;
    }
LAB_1459c9734:
    if (uVar9 * 0x38 == 0) goto LAB_1459c9741;
LAB_1459c96cf:
    func_0x000140002200();
    uVar8 = func_0x0001400021c0();
    if (uVar8 == 0) {
LAB_1459c9725:
      func_0x000145d992bb();
                    /* WARNING: Does not return */
      pcVar5 = (code *)invalidInstructionException();
      (*pcVar5)();
    }
  }
  else {
    if (lVar10 == 0) {
      uVar9 = 0;
      goto LAB_1459c9734;
    }
    uVar8 = (ulong)(param_3[3] - lVar10) >> 3;
    uVar9 = uVar8 * 0x6db6db6db6db6db7;
    lVar13 = uVar8 * 8;
joined_r0x0001459c9720:
    if (0x249249249249249 < uVar9) goto LAB_1459c9725;
    if (lVar13 != 0) goto LAB_1459c96cf;
LAB_1459c9741:
    uVar8 = 8;
    uVar9 = 0;
  }
  uStack_58 = 0;
  cVar12 = (char)lVar3;
  if (cVar12 == '\0') {
    if (lVar10 == 0) {
      uVar11 = 0;
      goto LAB_1459c9871;
    }
    uVar11 = ((ulong)(param_3[3] - lVar10) >> 3) * 0x6db6db6db6db6db7;
  }
  else {
    uVar11 = (ulong)(param_3[1] != 0);
    if (lVar10 != 0) {
      uVar11 = uVar11 + ((ulong)(param_3[3] - lVar10) >> 3) * 0x6db6db6db6db6db7;
    }
  }
  if (uVar9 < uVar11) {
    func_0x000145bfa970();
  }
  uVar11 = 0;
  if ((cVar12 != '\0') && (lVar3 = param_3[1], uVar11 = uStack_58, lVar3 != 0)) {
    uVar4 = *(undefined8 *)(lVar3 + 0x18);
    func_0x000145bcd2f0();
    uVar6 = *(undefined8 *)(lVar3 + 0x20);
    uVar7 = *(undefined8 *)(lVar3 + 0x28);
    lVar13 = uVar11 * 0x38;
    *(undefined8 *)(uVar8 + 0x30 + lVar13) = *(undefined8 *)(lVar3 + 0x30);
    puVar1 = (undefined8 *)(uVar8 + 0x10 + lVar13);
    *puVar1 = uStack_a0;
    puVar1[1] = uVar4;
    *(undefined8 *)(uVar8 + lVar13) = uStack_b0;
    ((undefined8 *)(uVar8 + lVar13))[1] = uStack_a8;
    uStack_90 = (undefined4)uVar6;
    uStack_8c = (undefined4)((ulong)uVar6 >> 0x20);
    uStack_88 = (undefined4)uVar7;
    uStack_84 = (undefined4)((ulong)uVar7 >> 0x20);
    puVar2 = (undefined4 *)(uVar8 + 0x20 + lVar13);
    *puVar2 = uStack_90;
    puVar2[1] = uStack_8c;
    puVar2[2] = uStack_88;
    puVar2[3] = uStack_84;
    uVar11 = uVar11 + 1;
  }
  if (lVar10 != 0) {
    entry();
    uVar11 = uStack_58;
  }
LAB_1459c9871:
  uStack_58 = uVar11;
  param_4[2] = uStack_58;
  *param_4 = uVar9;
  param_4[1] = uVar8;
  return;
}
