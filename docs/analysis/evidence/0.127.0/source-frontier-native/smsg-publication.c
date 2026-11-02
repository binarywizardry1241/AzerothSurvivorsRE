
long * entry(undefined8 param_1,undefined8 param_2,long *param_3,long *param_4,undefined4 *param_5)

{
  int *piVar1;
  ulong uVar2;
  code *pcVar3;
  long lVar4;
  ulong uVar5;
  long lVar6;
  ulong uVar7;
  ulong uVar8;
  undefined4 *puVar9;
  
  piVar1 = (int *)param_3[1];
  uVar2 = param_3[2];
  if ((((3 < uVar2) && (-1 < *piVar1)) && (0xb < uVar2)) && (uVar2 != 0xc)) {
    lVar6 = 0;
    do {
      if (*(char *)((long)piVar1 + lVar6 + 0xc) == '\0') {
        goto joined_r0x000145b00de9;
      }
      lVar6 = lVar6 + 1;
    } while (uVar2 - 0xc != lVar6);
  }
  goto LAB_145b00e1b;
joined_r0x000145b00de9:
  if (uVar2 - 0xd == lVar6) goto LAB_145b00e1b;
  if (*(char *)((long)piVar1 + lVar6 + 0xd) == '\0') {
    goto joined_r0x000145b00e09;
  }
  lVar6 = lVar6 + 1;
  goto joined_r0x000145b00de9;
joined_r0x000145b00e09:
  if (uVar2 - 0xe == lVar6) goto LAB_145b00e1b;
  if (*(char *)((long)piVar1 + lVar6 + 0xe) == '\0') {
    if (uVar2 - 0xf != lVar6) {
      lVar4 = (uVar2 - lVar6) + -0xf;
      puVar9 = (undefined4 *)((long)piVar1 + lVar6 + 0x174);
      uVar7 = lVar6 + 0x15c;
      goto LAB_145b00e68;
    }
    goto LAB_145b00e1b;
  }
  lVar6 = lVar6 + 1;
  goto joined_r0x000145b00e09;
  while( true ) {
    uVar7 = uVar7 + 1;
    puVar9 = (undefined4 *)((long)puVar9 + 1);
    lVar4 = lVar4 + -1;
    if (lVar4 == 0) break;
LAB_145b00e68:
    if (*(char *)((long)puVar9 + -0x165) == '\0') {
      if (uVar7 + 0x30 <= uVar2) {
        uVar5 = uVar7 - 0x48;
        uVar8 = uVar7 - 0x44;
        if ((uVar5 < 0xfffffffffffffffc) && (uVar8 <= uVar2)) {
          puVar9[-0x18] = *param_5;
          uVar5 = uVar7 - 0x30;
          uVar8 = uVar7 - 0x2c;
          if ((uVar5 < 0xfffffffffffffffc) && (uVar8 <= uVar2)) {
            puVar9[-0x12] = param_5[1];
            uVar5 = uVar7 - 0x18;
            uVar8 = uVar7 - 0x14;
            if ((uVar5 < 0xfffffffffffffffc) && (uVar8 <= uVar2)) {
              puVar9[-0xc] = param_5[2];
              uVar8 = uVar7 + 4;
              uVar5 = uVar7;
              if ((uVar7 < 0xfffffffffffffffc) && (uVar8 <= uVar2)) {
                puVar9[-6] = param_5[3];
                uVar5 = uVar7 + 0x18;
                uVar8 = uVar7 + 0x1c;
                if ((uVar5 < 0xfffffffffffffffc) && (uVar8 <= uVar2)) {
                  *puVar9 = param_5[4];
                  param_4[2] = param_3[2];
                  lVar6 = param_3[1];
                  *param_4 = *param_3;
                  param_4[1] = lVar6;
                  return param_4;
                }
              }
            }
          }
        }
        func_0x000146208f10(param_3,param_4,uVar8,uVar5,uVar2,0x14702e7f0);
                    /* WARNING: Does not return */
        pcVar3 = (code *)invalidInstructionException();
        (*pcVar3)();
      }
      break;
    }
  }
LAB_145b00e1b:
  *param_4 = -1;
  if (*param_3 != 0) {
    func_0x0001400021d0();
  }
  return param_4;
}

