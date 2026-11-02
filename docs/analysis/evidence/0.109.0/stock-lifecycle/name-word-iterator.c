void entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 *param_4)

{
  char cVar1;
  ulong uVar2;
  ulong uVar3;
  code *pcVar4;
  undefined1 auVar5 [16];
  int iVar6;
  undefined8 uVar7;
  ulong uVar8;
  ulong uVar9;
  long lVar10;
  ulong uVar11;
  ulong uVar12;
  undefined1 auVar13 [16];

  uVar2 = param_3[1];
  uVar3 = param_3[3];
  uVar12 = param_3[2];
  if (uVar12 <= uVar3 && uVar3 <= uVar2) {
    lVar10 = *param_3;
    uVar9 = (ulong)*(byte *)(param_3 + 5);
    cVar1 = *(char *)((long)param_3 + uVar9 + 0x1f);
    if (4 < uVar9) {
      do {
        uVar11 = uVar3 - uVar12;
        if (uVar11 < 0x10) {
          uVar8 = 0;
          if (uVar11 == 0) {
            auVar13 = ZEXT816(0);
          }
          else {
            do {
              if (*(char *)(lVar10 + uVar12 + uVar8) == cVar1) {
                auVar13._8_8_ = uVar8;
                auVar13._0_8_ = 1;
                goto LAB_1458aac3f;
              }
              uVar8 = uVar8 + 1;
            } while (uVar11 != uVar8);
            auVar5._8_8_ = 0;
            auVar5._0_8_ = uVar11;
            auVar13 = auVar5 << 0x40;
          }
        }
        else {
          auVar13 = func_0x000145bd5860();
        }
LAB_1458aac3f:
        if (auVar13._0_8_ != 1) goto LAB_1458aad29;
        uVar12 = uVar12 + auVar13._8_8_ + 1;
        param_3[2] = uVar12;
        if (uVar12 <= uVar2 && uVar9 <= uVar12) {
          func_0x000145d99860();
                    /* WARNING: Does not return */
          pcVar4 = (code *)invalidInstructionException();
          (*pcVar4)();
        }
        uVar7 = 0;
      } while (uVar12 <= uVar3);
      goto LAB_1458aad3d;
    }
    do {
      if (uVar3 - uVar12 < 0x10) {
        uVar11 = 0;
        if (uVar3 == uVar12) goto LAB_1458aad29;
        while (*(char *)(lVar10 + uVar12 + uVar11) != cVar1) {
          uVar11 = uVar11 + 1;
          if (uVar3 - uVar12 == uVar11) goto LAB_1458aad29;
        }
      }
      else {
        auVar13 = func_0x000145bd5860();
        uVar11 = auVar13._8_8_;
        if (auVar13._0_8_ != 1) goto LAB_1458aad29;
      }
      uVar12 = uVar12 + uVar11 + 1;
      param_3[2] = uVar12;
      if ((uVar12 <= uVar2 && uVar9 <= uVar12) && (iVar6 = func_0x000145bfa0e1(), iVar6 == 0)) {
        param_4[1] = uVar12 - uVar9;
        param_4[2] = uVar12;
        uVar7 = 1;
        goto LAB_1458aad3d;
      }
    } while (uVar12 <= uVar3);
  }
  uVar7 = 0;
  goto LAB_1458aad3d;
LAB_1458aad29:
  param_3[2] = uVar3;
  uVar7 = 0;
LAB_1458aad3d:
  *param_4 = uVar7;
  return;
}
