
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

long * entry(long param_1,undefined8 param_2,undefined8 *param_3,long *param_4)

{
  long *plVar1;
  float *pfVar2;
  long *plVar3;
  long lVar4;
  long lVar5;
  code *pcVar6;
  float *pfVar7;
  long lVar8;
  long lVar9;
  char cVar10;
  long lVar11;
  long lVar12;
  long lVar13;
  long *plVar14;
  undefined4 in_XMM6_Da;
  float fVar15;
  undefined4 in_XMM7_Da;
  float fVar16;
  float fVar17;
  long local_a0;
  float *pfStack_98;
  long local_90;
  long local_88;
  undefined8 local_80;
  undefined4 local_78;
  undefined4 local_68;
  
  local_80 = 0xfffffffffffffffe;
  plVar14 = (long *)param_3[1];
  plVar3 = (long *)param_3[3];
  local_78 = in_XMM6_Da;
  local_68 = in_XMM7_Da;
  if (plVar14 != plVar3) {
    lVar4 = param_3[4];
    lVar11 = *(long *)(lVar4 + 0x4c8);
    do {
      param_1 = *plVar14;
      plVar14 = plVar14 + 1;
      lVar8 = 0;
      lVar12 = lVar11;
      while (*(long *)(lVar4 + 0x4d0) * 0x160 - lVar8 != 0) {
        lVar8 = lVar8 + 0x160;
        plVar1 = (long *)(lVar12 + 0x88);
        lVar12 = lVar12 + 0x160;
        if (*plVar1 == param_1) {
          param_3[1] = plVar14;
          lVar12 = param_3[5];
          fVar15 = *(float *)(lVar11 + -0x20 + lVar8);
          cVar10 = '\x03';
          pfVar7 = (float *)(lVar12 + 0x8e4);
          if (fVar15 < *pfVar7 || fVar15 == *pfVar7) {
            if (*(long *)(lVar11 + -0x148 + lVar8) == -1) {
              cVar10 = '\x02' - *(char *)(lVar11 + -8 + lVar8);
            }
            else {
              cVar10 = '\0';
            }
          }
          fVar15 = *(float *)(lVar11 + -0x70 + lVar8);
          fVar16 = *(float *)(lVar11 + -0x6c + lVar8);
          func_0x000140002200();
          pfVar7 = (float *)func_0x0001400021c0();
          if (pfVar7 == (float *)0x0) {
            func_0x0001458e721b();
                    /* WARNING: Does not return */
            pcVar6 = (code *)invalidInstructionException();
            (*pcVar6)();
          }
          if (fVar16 <= _DAT_1458eb480) {
            fVar16 = _DAT_1458eb480;
          }
          *pfVar7 = fVar15 / fVar16;
          *(char *)(pfVar7 + 1) = cVar10;
          *(long *)(pfVar7 + 2) = param_1;
          local_a0 = 4;
          local_90 = 1;
          local_88 = param_3[2];
          pfStack_98 = pfVar7;
          lVar11 = local_90;
          fVar15 = _DAT_1458eb480;
joined_r0x00014552c191:
          local_90 = lVar11;
          if (plVar14 != plVar3) {
            lVar8 = *(long *)(lVar4 + 0x4c8);
            do {
              lVar5 = *plVar14;
              plVar14 = plVar14 + 1;
              lVar9 = 0;
              lVar13 = lVar8;
              while (*(long *)(lVar4 + 0x4d0) * 0x160 - lVar9 != 0) {
                lVar9 = lVar9 + 0x160;
                plVar1 = (long *)(lVar13 + 0x88);
                lVar13 = lVar13 + 0x160;
                if (*plVar1 == lVar5) {
                  fVar16 = *(float *)(lVar8 + -0x20 + lVar9);
                  cVar10 = '\x03';
                  pfVar2 = (float *)(lVar12 + 0x8e4);
                  if (fVar16 < *pfVar2 || fVar16 == *pfVar2) {
                    if (*(long *)(lVar8 + -0x148 + lVar9) == -1) {
                      cVar10 = '\x02' - *(char *)(lVar8 + -8 + lVar9);
                    }
                    else {
                      cVar10 = '\0';
                    }
                  }
                  fVar16 = *(float *)(lVar8 + -0x70 + lVar9);
                  fVar17 = *(float *)(lVar8 + -0x6c + lVar9);
                  if (fVar17 <= fVar15) {
                    fVar17 = fVar15;
                  }
                  if (lVar11 == local_a0) {
                    func_0x000145757d40(lVar11,cVar10,lVar11,&local_a0,1,8);
                    pfVar7 = pfStack_98;
                  }
                  pfVar7[lVar11 * 4] = fVar16 / fVar17;
                  *(char *)(pfVar7 + lVar11 * 4 + 1) = cVar10;
                  *(long *)(pfVar7 + lVar11 * 4 + 2) = lVar5;
                  lVar11 = lVar11 + 1;
                  goto joined_r0x00014552c191;
                }
              }
            } while (plVar14 != plVar3);
          }
          if (local_88 != 0) {
            func_0x0001400021d0();
          }
          param_4[2] = local_90;
          *param_4 = local_a0;
          param_4[1] = (long)pfStack_98;
          return param_4;
        }
      }
    } while (plVar14 != plVar3);
  }
  *param_4 = 0;
  param_4[1] = 8;
  param_4[2] = 0;
  if (param_3[2] != 0) {
    func_0x0001400021d0(param_1,param_4,param_3[2] << 3,*param_3,8);
  }
  return param_4;
}

