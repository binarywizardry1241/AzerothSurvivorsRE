/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long param_3,undefined8 *param_4)

{
  int *piVar1;
  char cVar2;
  int iVar3;
  bool bVar4;
  int iVar5;
  long *plVar6;
  long lVar7;
  long *plVar8;
  long *plVar9;
  long *plVar10;
  undefined4 uVar11;
  long lVar12;
  long *plVar13;
  long lVar14;
  float extraout_XMM0_Da;
  float fVar15;
  float fVar16;
  float fVar17;
  float fVar18;
  float fVar19;
  float fVar20;
  long local_c0;
  long local_b8;

  plVar9 = *(long **)(param_3 + 0xb8);
  plVar13 = *(long **)(param_3 + 0x318);
  plVar8 = plVar13 + *(long *)(param_3 + 800) * 0xd;
  plVar6 = plVar9 + *(long *)(param_3 + 0xc0) * 0xe;
  fVar17 = *(float *)(param_3 + 0x4a0);
  local_b8 = 1;
  lVar14 = 0;
  local_c0 = 0;
  bVar4 = false;
  fVar18 = _DAT_146066890;
  fVar19 = _DAT_146e78468;
  fVar20 = _DAT_145d6d650;
  do {
    if (local_b8 == 2) {
LAB_145924f6f:
      if (plVar9 == plVar6) {
        param_4[2] = local_c0;
        *param_4 = 0;
        param_4[1] = 4;
        return;
      }
      local_b8 = 2;
      plVar10 = plVar9;
      plVar9 = plVar9 + 0xe;
    }
    else if ((plVar13 == (long *)0x0) || (plVar13 == plVar8)) {
      plVar13 = (long *)0x0;
      if (bVar4) goto LAB_145924f6f;
      local_b8 = 1;
      plVar13 = (long *)0x0;
      bVar4 = true;
      plVar10 = (long *)(param_3 + 0x3f8);
    }
    else {
      local_b8 = 1;
      plVar10 = plVar13;
      plVar13 = plVar13 + 0xd;
    }
    lVar12 = *plVar10;
    iVar3 = *(int *)(lVar12 + 0x40);
    iVar5 = func_0x0001459614e0();
    if (iVar5 == 1) {
      lVar7 = 0;
      do {
        if (lVar14 == lVar7) {
          if (*(char *)(lVar12 + 0x75) == '\b') {
            fVar16 = *(float *)((long)plVar10 + 0x34) * *(float *)(plVar10 + 10) *
                     *(float *)(lVar12 + 0x4c);
          }
          else {
            fVar16 = *(float *)((long)plVar10 + 0x34) * *(float *)(plVar10 + 10) *
                     *(float *)(lVar12 + 0x50);
          }
          fVar16 = fVar16 * fVar17;
          fVar15 = extraout_XMM0_Da;
          if (fVar18 < fVar16) {
            fVar16 = (float)func_0x000145bc98dd((fVar16 + fVar19) / fVar20);
            fVar16 = fVar16 * fVar20 + fVar18;
          }
          cVar2 = *(char *)(lVar12 + 0x75);
          uVar11 = *(undefined4 *)(lVar12 + 0x40);
          if (local_c0 == 0) {
            func_0x000145bfafd0();
          }
          *(undefined4 *)(local_c0 * 0xc + 4) = uVar11;
          *(float *)(local_c0 * 0xc + 8) = fVar16 / fVar15;
          *(bool *)(local_c0 * 0xc + 0xc) = cVar2 == '\b';
          local_c0 = local_c0 + 1;
          lVar14 = lVar14 + 0xc;
          break;
        }
        piVar1 = (int *)(lVar7 + 4);
        lVar7 = lVar7 + 0xc;
      } while (*piVar1 != iVar3);
    }
  } while( true );
}
