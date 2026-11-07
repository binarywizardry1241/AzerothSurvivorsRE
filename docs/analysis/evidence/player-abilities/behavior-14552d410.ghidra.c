
undefined8 * entry(long param_1,undefined8 param_2,undefined8 *param_3,undefined8 *param_4)

{
  long *plVar1;
  int iVar2;
  long *plVar3;
  long lVar4;
  long lVar5;
  long lVar6;
  ulong *puVar7;
  code *pcVar8;
  long *plVar9;
  ulong uVar10;
  long lVar11;
  ulong uVar12;
  long lVar13;
  long lVar14;
  ulong uVar15;
  long lVar16;
  char *pcVar17;
  uint uVar18;
  ulong uVar19;
  int *piVar20;
  long *plVar21;
  ulong uVar22;
  long local_68;
  long local_58;
  
  plVar21 = (long *)param_3[1];
  plVar3 = (long *)param_3[3];
  if (plVar21 != plVar3) {
    lVar4 = param_3[4];
    lVar5 = param_3[5];
    lVar6 = *(long *)(lVar4 + 8);
    puVar7 = (ulong *)param_3[6];
    do {
      param_1 = *plVar21;
      plVar21 = plVar21 + 1;
      lVar11 = 0;
      lVar13 = lVar6;
      do {
        if (*(long *)(lVar4 + 0x10) * 0x160 - lVar11 == 0) goto LAB_14552d487;
        lVar11 = lVar11 + 0x160;
        plVar9 = (long *)(lVar13 + 0x88);
        lVar13 = lVar13 + 0x160;
      } while (*plVar9 != param_1);
      uVar10 = *(ulong *)(lVar6 + -0x150 + lVar11);
      if (uVar10 == 0) {
        uVar15 = 0;
      }
      else {
        iVar2 = *(int *)(lVar5 + 0x40);
        lVar13 = *(long *)(lVar6 + -0x158 + lVar11);
        if (uVar10 == 1) {
          uVar19 = 0;
          uVar15 = 0;
        }
        else {
          piVar20 = (int *)(lVar13 + 0x50);
          uVar19 = 0;
          uVar15 = 0;
          do {
            if ((piVar20[-0x10] == iVar2) && ((char)piVar20[-0x14] == '\0')) {
              uVar12 = (ulong)(piVar20[-0xc] != 0);
              if (piVar20[-4] != iVar2) goto LAB_14552d500;
LAB_14552d52b:
              if ((char)piVar20[-8] != '\0') goto LAB_14552d500;
              uVar22 = (ulong)(*piVar20 != 0);
            }
            else {
              uVar12 = 0;
              if (piVar20[-4] == iVar2) goto LAB_14552d52b;
LAB_14552d500:
              uVar22 = 0;
            }
            uVar15 = uVar15 + uVar12 + uVar22;
            uVar19 = uVar19 + 2;
            piVar20 = piVar20 + 0x18;
          } while ((uVar10 & 0xfffffffffffffffe) != uVar19);
          if ((uVar10 & 1) == 0) goto LAB_14552d47d;
        }
        if ((*(int *)(lVar13 + 0x10 + uVar19 * 0x30) == iVar2) &&
           (pcVar17 = (char *)(lVar13 + uVar19 * 0x30), *pcVar17 == '\0')) {
          uVar18 = (uint)(*(int *)(pcVar17 + 0x20) != 0);
        }
        else {
          uVar18 = 0;
        }
        uVar15 = uVar15 + uVar18;
      }
LAB_14552d47d:
      if (uVar15 < *puVar7) {
        param_3[1] = plVar21;
        if (*(long *)(lVar6 + -0x148 + lVar11) == -1) {
          lVar13 = 0;
          if (*(char *)(lVar6 + -8 + lVar11) == '\0') {
            lVar13 = uVar15 + 1;
          }
        }
        else {
          lVar13 = 0;
        }
        func_0x000140002200();
        plVar9 = (long *)func_0x0001400021c0();
        if (plVar9 == (long *)0x0) {
          func_0x0001458e721b();
                    /* WARNING: Does not return */
          pcVar8 = (code *)invalidInstructionException();
          (*pcVar8)();
        }
        *plVar9 = lVar13;
        plVar9[1] = param_1;
        local_68 = 1;
        lVar6 = param_3[2];
        if (plVar21 == plVar3) goto LAB_14552d81c;
        local_58 = 1;
        goto LAB_14552d666;
      }
LAB_14552d487:
    } while (plVar21 != plVar3);
  }
  *param_4 = 0;
  param_4[1] = 8;
  param_4[2] = 0;
  if (param_3[2] != 0) {
    func_0x0001400021d0(param_1,param_4,param_3[2] << 3,*param_3,8);
  }
  return param_4;
LAB_14552d666:
  lVar13 = *(long *)(lVar4 + 8);
  do {
    lVar14 = *plVar21;
    plVar21 = plVar21 + 1;
    lVar16 = 0;
    lVar11 = lVar13;
    do {
      if (*(long *)(lVar4 + 0x10) * 0x160 - lVar16 == 0) goto LAB_14552d685;
      lVar16 = lVar16 + 0x160;
      plVar1 = (long *)(lVar11 + 0x88);
      lVar11 = lVar11 + 0x160;
    } while (*plVar1 != lVar14);
    uVar10 = *(ulong *)(lVar13 + -0x150 + lVar16);
    if (uVar10 == 0) {
      uVar15 = 0;
    }
    else {
      iVar2 = *(int *)(lVar5 + 0x40);
      lVar11 = *(long *)(lVar13 + -0x158 + lVar16);
      if (uVar10 == 1) {
        uVar19 = 0;
        uVar15 = 0;
      }
      else {
        piVar20 = (int *)(lVar11 + 0x50);
        uVar19 = 0;
        uVar15 = 0;
        do {
          if ((piVar20[-0x10] == iVar2) && ((char)piVar20[-0x14] == '\0')) {
            uVar12 = (ulong)(piVar20[-0xc] != 0);
            if (piVar20[-4] != iVar2) goto LAB_14552d700;
LAB_14552d72b:
            if ((char)piVar20[-8] != '\0') goto LAB_14552d700;
            uVar22 = (ulong)(*piVar20 != 0);
          }
          else {
            uVar12 = 0;
            if (piVar20[-4] == iVar2) goto LAB_14552d72b;
LAB_14552d700:
            uVar22 = 0;
          }
          uVar15 = uVar15 + uVar12 + uVar22;
          uVar19 = uVar19 + 2;
          piVar20 = piVar20 + 0x18;
        } while ((uVar10 & 0xfffffffffffffffe) != uVar19);
        if ((uVar10 & 1) == 0) goto LAB_14552d67b;
      }
      if ((*(int *)(lVar11 + 0x10 + uVar19 * 0x30) == iVar2) &&
         (pcVar17 = (char *)(lVar11 + uVar19 * 0x30), *pcVar17 == '\0')) {
        uVar10 = (ulong)(*(int *)(pcVar17 + 0x20) != 0);
      }
      else {
        uVar10 = 0;
      }
      uVar15 = uVar15 + uVar10;
    }
LAB_14552d67b:
    if (uVar15 < *puVar7) break;
LAB_14552d685:
    local_68 = local_58;
    if (plVar21 == plVar3) goto LAB_14552d81c;
  } while( true );
  if (*(long *)(lVar13 + -0x148 + lVar16) == -1) {
    lVar11 = 0;
    if (*(char *)(lVar13 + -8 + lVar16) == '\0') {
      lVar11 = uVar15 + 1;
    }
  }
  else {
    lVar11 = 0;
  }
  if (local_58 == 4) {
    func_0x000145757d40();
  }
  plVar9[local_58 * 2] = lVar11;
  plVar9[local_58 * 2 + 1] = lVar14;
  local_68 = local_58 + 1;
  local_58 = local_68;
  if (plVar21 == plVar3) {
LAB_14552d81c:
    if (lVar6 != 0) {
      func_0x0001400021d0();
    }
    param_4[2] = local_68;
    *param_4 = 4;
    param_4[1] = plVar9;
    return param_4;
  }
  goto LAB_14552d666;
}

