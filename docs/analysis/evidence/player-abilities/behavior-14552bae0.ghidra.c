
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

long * entry(long param_1,undefined8 param_2,undefined8 *param_3,long *param_4)

{
  long *plVar1;
  undefined8 uVar2;
  undefined8 uVar3;
  long *plVar4;
  long lVar5;
  long lVar6;
  float *pfVar7;
  code *pcVar8;
  undefined4 *puVar9;
  long lVar10;
  long lVar11;
  char cVar12;
  long lVar13;
  long *plVar14;
  float fVar15;
  float fVar16;
  float fVar17;
  undefined4 in_XMM6_Da;
  float fVar18;
  undefined4 in_XMM7_Da;
  float fVar19;
  undefined4 uVar20;
  float fVar21;
  long local_c0;
  undefined4 *puStack_b8;
  long local_b0;
  long local_a8;
  undefined8 local_a0;
  undefined4 local_98;
  undefined4 local_88;
  
  local_a0 = 0xfffffffffffffffe;
  plVar14 = (long *)param_3[1];
  plVar4 = (long *)param_3[3];
  local_98 = in_XMM6_Da;
  local_88 = in_XMM7_Da;
  if (plVar14 != plVar4) {
    lVar5 = param_3[4];
    lVar6 = *(long *)(lVar5 + 0x4c8);
    do {
      param_1 = *plVar14;
      plVar14 = plVar14 + 1;
      lVar10 = 0;
      lVar13 = lVar6;
      while (*(long *)(lVar5 + 0x4d0) * 0x160 - lVar10 != 0) {
        lVar10 = lVar10 + 0x160;
        plVar1 = (long *)(lVar13 + 0x88);
        lVar13 = lVar13 + 0x160;
        if (*plVar1 == param_1) {
          param_3[1] = plVar14;
          pfVar7 = (float *)param_3[5];
          fVar19 = *pfVar7;
          cVar12 = '\x03';
          if (*(float *)(lVar6 + -0x20 + lVar10) <= fVar19) {
            if (*(long *)(lVar6 + -0x148 + lVar10) == -1) {
              cVar12 = '\x02' - *(char *)(lVar6 + -8 + lVar10);
              fVar15 = *(float *)(lVar6 + -0x38 + lVar10);
              goto joined_r0x00014552bbf9;
            }
            cVar12 = '\0';
          }
          fVar15 = *(float *)(lVar6 + -0x38 + lVar10);
joined_r0x00014552bbf9:
          if (fVar15 <= 0.0) {
            uVar2 = *(undefined8 *)(lVar6 + -0x48 + lVar10);
            fVar15 = (float)uVar2;
            fVar18 = (float)((ulong)uVar2 >> 0x20);
            fVar19 = *(float *)(lVar6 + -0x40 + lVar10);
          }
          else {
            fVar15 = (fVar19 - *(float *)(lVar6 + -0x3c + lVar10)) / fVar15;
            fVar19 = 0.0;
            if (0.0 <= fVar15) {
              fVar19 = fVar15;
            }
            fVar16 = _DAT_1458eb480;
            if (fVar19 <= _DAT_1458eb480) {
              fVar16 = fVar19;
            }
            uVar2 = *(undefined8 *)(lVar6 + -0x54 + lVar10);
            uVar3 = *(undefined8 *)(lVar6 + -0x48 + lVar10);
            fVar15 = (float)uVar2;
            fVar18 = (float)((ulong)uVar2 >> 0x20);
            fVar15 = fVar16 * ((float)uVar3 - fVar15) + fVar15;
            fVar18 = fVar16 * ((float)((ulong)uVar3 >> 0x20) - fVar18) + fVar18;
            fVar19 = *(float *)(lVar6 + -0x4c + lVar10);
            fVar19 = (*(float *)(lVar6 + -0x40 + lVar10) - fVar19) * fVar16 + fVar19;
          }
          uVar20 = *(undefined4 *)(lVar6 + -0x70 + lVar10);
          func_0x000140002200();
          puVar9 = (undefined4 *)func_0x0001400021c0();
          if (puVar9 == (undefined4 *)0x0) {
            func_0x0001458e721b();
                    /* WARNING: Does not return */
            pcVar8 = (code *)invalidInstructionException();
            (*pcVar8)();
          }
          *puVar9 = uVar20;
          *(ulong *)(puVar9 + 1) = CONCAT44(fVar18,fVar15);
          puVar9[3] = fVar19;
          *(char *)(puVar9 + 4) = cVar12;
          *(long *)(puVar9 + 6) = param_1;
          local_c0 = 4;
          local_b0 = 1;
          local_a8 = param_3[2];
          puStack_b8 = puVar9;
          if (plVar14 != plVar4) {
            fVar15 = 0.0;
            fVar19 = _DAT_1458eb480;
LAB_14552bd24:
            lVar6 = *(long *)(lVar5 + 0x4c8);
            do {
              lVar10 = *plVar14;
              plVar14 = plVar14 + 1;
              lVar11 = 0;
              lVar13 = lVar6;
              while (*(long *)(lVar5 + 0x4d0) * 0x160 - lVar11 != 0) {
                lVar11 = lVar11 + 0x160;
                plVar1 = (long *)(lVar13 + 0x88);
                lVar13 = lVar13 + 0x160;
                if (*plVar1 == lVar10) {
                  fVar18 = *pfVar7;
                  cVar12 = '\x03';
                  if (fVar18 < *(float *)(lVar6 + -0x20 + lVar11)) {
LAB_14552bda1:
                    fVar16 = *(float *)(lVar6 + -0x38 + lVar11);
                    if (fVar15 < fVar16) goto LAB_14552bdb0;
LAB_14552be30:
                    uVar2 = *(undefined8 *)(lVar6 + -0x48 + lVar11);
                    fVar16 = (float)uVar2;
                    fVar21 = (float)((ulong)uVar2 >> 0x20);
                    fVar18 = *(float *)(lVar6 + -0x40 + lVar11);
                    uVar20 = *(undefined4 *)(lVar6 + -0x70 + lVar11);
                  }
                  else {
                    if (*(long *)(lVar6 + -0x148 + lVar11) != -1) {
                      cVar12 = '\0';
                      goto LAB_14552bda1;
                    }
                    cVar12 = '\x02' - *(char *)(lVar6 + -8 + lVar11);
                    fVar16 = *(float *)(lVar6 + -0x38 + lVar11);
                    if (fVar16 <= fVar15) goto LAB_14552be30;
LAB_14552bdb0:
                    fVar16 = (fVar18 - *(float *)(lVar6 + -0x3c + lVar11)) / fVar16;
                    fVar18 = 0.0;
                    if (0.0 <= fVar16) {
                      fVar18 = fVar16;
                    }
                    fVar17 = fVar19;
                    if (fVar18 <= fVar19) {
                      fVar17 = fVar18;
                    }
                    uVar2 = *(undefined8 *)(lVar6 + -0x54 + lVar11);
                    uVar3 = *(undefined8 *)(lVar6 + -0x48 + lVar11);
                    fVar16 = (float)uVar2;
                    fVar21 = (float)((ulong)uVar2 >> 0x20);
                    fVar16 = fVar17 * ((float)uVar3 - fVar16) + fVar16;
                    fVar21 = fVar17 * ((float)((ulong)uVar3 >> 0x20) - fVar21) + fVar21;
                    fVar18 = *(float *)(lVar6 + -0x4c + lVar11);
                    fVar18 = (*(float *)(lVar6 + -0x40 + lVar11) - fVar18) * fVar17 + fVar18;
                    uVar20 = *(undefined4 *)(lVar6 + -0x70 + lVar11);
                  }
                  if (local_b0 == local_c0) {
                    func_0x000145757d40(local_b0,cVar12,local_b0,&local_c0,1,8);
                    puVar9 = puStack_b8;
                  }
                  puVar9[local_b0 * 8] = uVar20;
                  *(ulong *)(puVar9 + local_b0 * 8 + 1) = CONCAT44(fVar21,fVar16);
                  puVar9[local_b0 * 8 + 3] = fVar18;
                  *(char *)(puVar9 + local_b0 * 8 + 4) = cVar12;
                  *(long *)(puVar9 + local_b0 * 8 + 6) = lVar10;
                  local_b0 = local_b0 + 1;
                  if (plVar14 != plVar4) goto LAB_14552bd24;
                  goto LAB_14552be7a;
                }
              }
            } while (plVar14 != plVar4);
          }
LAB_14552be7a:
          if (local_a8 != 0) {
            func_0x0001400021d0();
          }
          param_4[2] = local_b0;
          *param_4 = local_c0;
          param_4[1] = (long)puStack_b8;
          return param_4;
        }
      }
    } while (plVar14 != plVar4);
  }
  *param_4 = 0;
  param_4[1] = 8;
  param_4[2] = 0;
  if (param_3[2] != 0) {
    func_0x0001400021d0(param_1,param_4,param_3[2] << 3,*param_3,8);
  }
  return param_4;
}

