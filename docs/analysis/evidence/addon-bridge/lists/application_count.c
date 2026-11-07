uint FUN_1458df730(ulong param_1,ulong param_2,long param_3,long param_4)

{
  int iVar1;
  long lVar2;
  code *pcVar3;
  ulong uVar4;
  ulong uVar5;
  ulong uVar6;
  ulong uVar7;
  ulong uVar8;
  long lVar9;
  int iVar10;
  uint uVar11;
  ulong uVar12;
  ulong uVar13;
  int *piVar14;
  ulong uVar15;

  uVar7 = param_3 * 4;
  uVar6 = *(ulong *)(param_4 + 0x10);
  if (uVar6 == 0) {
    uVar11 = 0;
    uVar6 = 0;
    do {
      do {
        do {
          do {
            uVar15 = uVar6;
            if (3 < uVar15) {
              return 0;
            }
            if (0xf < (uVar15 | uVar7)) goto LAB_1458dfaaf;
            uVar6 = uVar15 + 1;
          } while (*(int *)(param_4 + 0xb0 + (uVar15 | uVar7) * 4) != 0);
          if (uVar15 == 3) {
            return 0;
          }
          uVar5 = uVar15 + 1 | uVar7;
          if (0xf < uVar5) goto LAB_1458dfaaf;
          uVar6 = uVar15 + 2;
        } while (*(int *)(param_4 + 0xb0 + uVar5 * 4) != 0);
        if (1 < uVar15) {
          return 0;
        }
        uVar5 = uVar15 + 2 | uVar7;
        if (0xf < uVar5) goto LAB_1458dfaaf;
        uVar6 = uVar15 + 3;
      } while (*(int *)(param_4 + 0xb0 + uVar5 * 4) != 0);
      if (uVar15 != 0) {
        return 0;
      }
      if (0xf < uVar7) goto LAB_1458dfaaf;
      uVar6 = 4;
    } while (*(int *)(param_4 + 0xbc + param_3 * 0x10) != 0);
  }
  else {
    lVar2 = *(long *)(param_4 + 8);
    param_2 = uVar6 & 0xfffffffffffffffe;
    uVar11 = 0;
    uVar15 = 0;
    while (uVar15 < 4) {
      param_1 = uVar15 | uVar7;
      if (0xf < param_1) {
LAB_1458dfaaf:
        uVar6 = 0x10;
        if (0x10 < (uVar15 | uVar7)) {
          uVar6 = uVar15 | uVar7;
        }
        func_0x000145d697e3(param_1,param_2,0x10,uVar6,0x146e5ace0);
                    /* WARNING: Does not return */
        pcVar3 = (code *)invalidInstructionException();
        (*pcVar3)();
      }
      uVar5 = uVar15 + 1;
      iVar10 = *(int *)(param_4 + 0xb0 + param_1 * 4);
      uVar4 = uVar15;
      if (iVar10 == 0) {
        if (uVar15 == 3) {
          return uVar11;
        }
        if (0xf < (uVar5 | uVar7)) goto LAB_1458dfaaf;
        param_1 = uVar15 + 2;
        iVar10 = *(int *)(param_4 + 0xb0 + (uVar5 | uVar7) * 4);
        uVar4 = uVar5;
        uVar5 = param_1;
        if (iVar10 == 0) {
          if (1 < uVar15) {
            return uVar11;
          }
          if (0xf < (param_1 | uVar7)) goto LAB_1458dfaaf;
          iVar10 = *(int *)(param_4 + 0xb0 + (param_1 | uVar7) * 4);
          uVar4 = param_1;
          uVar5 = uVar15 + 3;
          if (iVar10 == 0) {
            if (uVar15 != 0) {
              return uVar11;
            }
            if (0xf < uVar7) goto LAB_1458dfaaf;
            iVar10 = *(int *)(param_4 + 0xbc + param_3 * 0x10);
            uVar4 = uVar15 + 3;
            uVar5 = 4;
            if (iVar10 == 0) {
              return uVar11;
            }
          }
        }
      }
      if (uVar6 == 1) {
        uVar15 = 0;
        lVar9 = 0;
        iVar1 = *(int *)(lVar2 + 0x10);
joined_r0x0001458df913:
        if ((iVar1 == iVar10) && (*(char *)(lVar9 + lVar2) == '\0')) {
          uVar15 = uVar15 + (*(int *)((char *)(lVar9 + lVar2) + 0x20) != 0);
        }
      }
      else {
        piVar14 = (int *)(lVar2 + 0x50);
        uVar13 = 0;
        uVar15 = 0;
        do {
          if ((piVar14[-0x10] == iVar10) && ((char)piVar14[-0x14] == '\0')) {
            uVar12 = (ulong)(piVar14[-0xc] != 0);
            if (piVar14[-4] != iVar10) goto LAB_1458df890;
LAB_1458df8ba:
            if ((char)piVar14[-8] != '\0') goto LAB_1458df890;
            uVar8 = (ulong)(*piVar14 != 0);
          }
          else {
            uVar12 = 0;
            if (piVar14[-4] == iVar10) goto LAB_1458df8ba;
LAB_1458df890:
            uVar8 = 0;
          }
          uVar15 = uVar15 + uVar12 + uVar8;
          uVar13 = uVar13 + 2;
          piVar14 = piVar14 + 0x18;
        } while (param_2 != uVar13);
        if ((uVar6 & 1) != 0) {
          lVar9 = uVar13 * 0x30;
          iVar1 = *(int *)(lVar2 + 0x10 + lVar9);
          goto joined_r0x0001458df913;
        }
      }
      if (uVar15 == 0) {
        if (uVar6 == 1) {
          uVar15 = 0;
          lVar9 = 0;
          if (*(int *)(lVar2 + 0x10) == iVar10) {
LAB_1458df9e0:
            if (*(long *)(lVar9 + lVar2) == 0) goto LAB_1458df9f5;
            uVar13 = (ulong)((int)((long *)(lVar9 + lVar2))[4] != 0);
          }
          else {
LAB_1458df9f5:
            uVar13 = 0;
          }
          uVar15 = uVar15 + uVar13;
        }
        else {
          piVar14 = (int *)(lVar2 + 0x50);
          uVar13 = 0;
          uVar15 = 0;
          do {
            if ((piVar14[-0x10] == iVar10) && (*(long *)(piVar14 + -0x14) != 0)) {
              uVar12 = (ulong)(piVar14[-0xc] != 0);
              if (piVar14[-4] != iVar10) goto LAB_1458df950;
LAB_1458df998:
              if (*(long *)(piVar14 + -8) == 0) goto LAB_1458df950;
              uVar8 = (ulong)(*piVar14 != 0);
            }
            else {
              uVar12 = 0;
              if (piVar14[-4] == iVar10) goto LAB_1458df998;
LAB_1458df950:
              uVar8 = 0;
            }
            uVar15 = uVar15 + uVar12 + uVar8;
            uVar13 = uVar13 + 2;
            piVar14 = piVar14 + 0x18;
          } while (param_2 != uVar13);
          if ((uVar6 & 1) != 0) {
            lVar9 = uVar13 * 0x30;
            if (*(int *)(lVar2 + 0x10 + lVar9) == iVar10) goto LAB_1458df9e0;
            goto LAB_1458df9f5;
          }
        }
      }
      iVar10 = 0xff;
      if (uVar15 < 0xff) {
        iVar10 = (int)uVar15;
      }
      iVar10 = iVar10 + -1;
      if (uVar15 == 0) {
        iVar10 = 0;
      }
      uVar11 = iVar10 << ((byte)((int)uVar4 << 3) & 0x1f) | uVar11;
      uVar15 = uVar5;
    }
  }
  return uVar11;
}
