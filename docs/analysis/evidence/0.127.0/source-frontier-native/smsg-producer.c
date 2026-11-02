
void entry(undefined8 param_1,undefined8 param_2,int *param_3,undefined4 *param_4,ulong param_5)

{
  undefined1 uVar1;
  code *pcVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  undefined3 uVar5;
  undefined4 uVar6;
  undefined1 *puVar7;
  long lVar8;
  ulong uVar9;
  ulong uVar10;
  long lVar11;
  
  uVar6 = 0;
  if ((((3 < param_5) && (-1 < *param_3)) && (0xb < param_5)) && (param_5 != 0xc)) {
    lVar8 = 0;
    do {
      if (*(char *)((long)param_3 + lVar8 + 0xc) == '\0') {
        uVar6 = 0;
        if (param_5 - 0xd == lVar8) goto LAB_145afbea2;
        goto LAB_145afbec0;
      }
      lVar8 = lVar8 + 1;
    } while (param_5 - 0xc != lVar8);
    uVar6 = 0;
  }
  goto LAB_145afbea2;
  while (lVar8 = lVar8 + 1, param_5 - 0xd != lVar8) {
LAB_145afbec0:
    if (*(char *)((long)param_3 + lVar8 + 0xd) == '\0') {
      goto joined_r0x000145afbed9;
    }
  }
  goto LAB_145afbea2;
joined_r0x000145afbed9:
  if (param_5 - 0xe == lVar8) goto LAB_145afbea2;
  if (*(char *)((long)param_3 + lVar8 + 0xe) == '\0') {
    if (param_5 - 0xf != lVar8) {
      lVar11 = (param_5 - lVar8) + -0xf;
      puVar7 = (undefined1 *)((long)param_3 + lVar8 + 0x177);
      uVar9 = lVar8 + 0x15c;
      goto LAB_145afbf11;
    }
    goto LAB_145afbea2;
  }
  lVar8 = lVar8 + 1;
  goto joined_r0x000145afbed9;
  while( true ) {
    puVar7 = puVar7 + 1;
    uVar9 = uVar9 + 1;
    lVar11 = lVar11 + -1;
    if (lVar11 == 0) break;
LAB_145afbf11:
    if (puVar7[-0x168] == '\0') {
      if (param_5 < uVar9 + 0x30) break;
      uVar10 = uVar9 - 0x48;
      if (param_5 <= uVar9 - 0x48) {
LAB_145afc146:
        func_0x000146208d03(param_1,param_2,param_5,uVar10,0x14702e358);
                    /* WARNING: Does not return */
        pcVar2 = (code *)invalidInstructionException();
        (*pcVar2)();
      }
      uVar10 = uVar9 - 0x47;
      if (param_5 <= uVar10) {
LAB_145afc107:
        func_0x000146208d03(param_1,param_2,param_5,uVar10,0x14702e370);
                    /* WARNING: Does not return */
        pcVar2 = (code *)invalidInstructionException();
        (*pcVar2)();
      }
      uVar10 = uVar9 - 0x46;
      if (param_5 <= uVar10) {
LAB_145afc11b:
        func_0x000146208d03(param_1,param_2,param_5,uVar10,0x14702e388);
                    /* WARNING: Does not return */
        pcVar2 = (code *)invalidInstructionException();
        (*pcVar2)();
      }
      uVar10 = uVar9 - 0x45;
      if (uVar10 < param_5) {
        uVar10 = uVar9 - 0x30;
        if (param_5 <= uVar9 - 0x30) goto LAB_145afc146;
        uVar10 = uVar9 - 0x2f;
        if (param_5 <= uVar10) goto LAB_145afc107;
        uVar10 = uVar9 - 0x2e;
        if (param_5 <= uVar10) goto LAB_145afc11b;
        uVar10 = uVar9 - 0x2d;
        if (uVar10 < param_5) {
          uVar10 = uVar9 - 0x18;
          if (param_5 <= uVar9 - 0x18) goto LAB_145afc146;
          uVar10 = uVar9 - 0x17;
          if (param_5 <= uVar10) goto LAB_145afc107;
          uVar10 = uVar9 - 0x16;
          if (param_5 <= uVar10) goto LAB_145afc11b;
          uVar10 = uVar9 - 0x15;
          if (uVar10 < param_5) {
            uVar10 = uVar9;
            if (param_5 <= uVar9) goto LAB_145afc146;
            uVar10 = uVar9 + 1;
            if (param_5 <= uVar10) goto LAB_145afc107;
            uVar10 = uVar9 + 2;
            if (param_5 <= uVar10) goto LAB_145afc11b;
            uVar10 = uVar9 + 3;
            if (uVar10 < param_5) {
              uVar10 = uVar9 + 0x18;
              if (param_5 <= uVar9 + 0x18) goto LAB_145afc146;
              uVar10 = uVar9 + 0x19;
              if (param_5 <= uVar10) goto LAB_145afc107;
              uVar10 = uVar9 + 0x1a;
              if (param_5 <= uVar10) goto LAB_145afc11b;
              uVar10 = uVar9 + 0x1b;
              if (uVar10 < param_5) {
                uVar6 = *(undefined4 *)(puVar7 + -0x1b);
                uVar3 = *(undefined4 *)(puVar7 + -0x33);
                uVar4 = *(undefined4 *)(puVar7 + -0x4b);
                uVar5 = *(undefined3 *)(puVar7 + -3);
                uVar1 = *puVar7;
                param_4[1] = *(undefined4 *)(puVar7 + -99);
                param_4[2] = uVar4;
                param_4[3] = uVar3;
                param_4[4] = uVar6;
                param_4[5] = CONCAT13(uVar1,uVar5);
                uVar6 = 1;
                break;
              }
            }
          }
        }
      }
      func_0x000146208d03(param_1,param_2,param_5,uVar10,0x14702e3a0);
                    /* WARNING: Does not return */
      pcVar2 = (code *)invalidInstructionException();
      (*pcVar2)();
    }
  }
LAB_145afbea2:
  *param_4 = uVar6;
  return;
}

