
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

int * entry(undefined8 param_1,undefined8 param_2,float param_3,float param_4,undefined8 param_5,
           undefined8 param_6,long param_7,int *param_8)

{
  ulong uVar1;
  long lVar2;
  ulong uVar3;
  code *pcVar4;
  bool bVar5;
  int iVar6;
  int iVar7;
  ulong uVar8;
  ulong uVar9;
  ulong uVar10;
  ulong uVar11;
  long lVar12;
  ulong uVar13;
  int iVar14;
  ulong uVar15;
  ulong uVar16;
  int iVar17;
  int iVar18;
  bool bVar19;
  float fVar20;
  float fVar21;
  float fVar22;
  float fVar23;
  float fVar24;
  float in_XMM12_Da;
  float fVar25;
  float fVar26;
  float in_stack_00000028;
  undefined8 local_f8;

  fVar20 = (float)func_0x00014577327d(in_stack_00000028);
  iVar17 = 0x7fffffff;
  if (fVar20 <= _DAT_1459e51e0) {
    iVar17 = (int)fVar20;
  }
  iVar6 = 0;
  if (NAN(fVar20)) {
    iVar17 = iVar6;
  }
  iVar14 = -iVar17;
  if (SBORROW4(iVar17,iVar14) == iVar17 * 2 < 0) {
    uVar1 = *(ulong *)(param_7 + 0x18);
    fVar20 = (float)((ulong)*(undefined8 *)(param_7 + 0x20) >> 0x20);
    iVar7 = iVar14;
    if (uVar1 == 0) {
      do {
        iVar18 = iVar14;
        if (0.0 <= ((float)iVar7 + param_4) - fVar20) {
          do {
            if (iVar17 <= iVar18) break;
            iVar18 = iVar18 + (uint)(iVar18 < iVar17);
          } while (iVar18 <= iVar17);
        }
        else {
          do {
            if (iVar17 <= iVar18) break;
            iVar18 = iVar18 + (uint)(iVar18 < iVar17);
          } while (iVar18 <= iVar17);
        }
      } while ((iVar7 < iVar17) && (iVar7 = iVar7 + (uint)(iVar7 < iVar17), iVar7 <= iVar17));
    }
    else {
      lVar2 = *(long *)(param_7 + 8);
      uVar3 = *(ulong *)(param_7 + 0x10);
      uVar16 = 0;
      iVar6 = iVar14;
      do {
        fVar21 = ((float)iVar6 + param_4) - fVar20;
        uVar13 = 0;
        if (0.0 <= fVar21) {
          uVar13 = (long)(fVar21 - _DAT_1459071e0) & (long)fVar21 >> 0x3f | (long)fVar21;
        }
        if (_DAT_1459071e4 < fVar21) {
          uVar13 = 0xffffffffffffffff;
        }
        iVar7 = iVar14;
        if (0.0 <= fVar21) {
          if (uVar13 < uVar1) {
            do {
              iVar18 = (uint)(iVar7 < iVar17) + iVar7;
              fVar21 = (float)*(undefined8 *)(param_7 + 0x20);
              fVar22 = ((float)iVar7 + param_3) - fVar21;
              if (0.0 <= fVar22) {
                uVar8 = 0;
                if (0.0 <= fVar22) {
                  uVar8 = (long)(fVar22 - _DAT_1459071e0) & (long)fVar22 >> 0x3f | (long)fVar22;
                }
                if (_DAT_1459071e4 < fVar22) {
                  uVar8 = 0xffffffffffffffff;
                }
                if (uVar8 < uVar1) {
                  uVar8 = uVar8 + uVar13 * uVar1;
                  if ((uVar8 | uVar1) >> 0x20 == 0) {
                    uVar9 = (uVar8 & 0xffffffff) / (uVar1 & 0xffffffff);
                    uVar8 = (uVar8 & 0xffffffff) % (uVar1 & 0xffffffff);
LAB_145525df1:
                    fVar22 = (float)(long)uVar9;
                    if ((long)uVar8 < 0) goto LAB_145525dff;
LAB_145525e44:
                    fVar25 = (float)(long)uVar8;
                  }
                  else {
                    uVar9 = uVar8 / uVar1;
                    uVar8 = uVar8 % uVar1;
                    if (-1 < (long)uVar9) goto LAB_145525df1;
                    fVar22 = (float)uVar9;
                    if (-1 < (long)uVar8) goto LAB_145525e44;
LAB_145525dff:
                    fVar25 = (float)uVar8;
                  }
                  fVar25 = fVar25 + _DAT_14594e600 + fVar21;
                  fVar22 = fVar22 + fRam000000014594e604 + fVar20;
                  fVar26 = (fVar22 - param_4) * (fVar22 - param_4) +
                           (fVar25 - param_3) * (fVar25 - param_3);
                  if ((fVar26 <= in_stack_00000028 * in_stack_00000028) &&
                     ((in_XMM12_Da <= fVar26 & (byte)uVar16) == 0)) {
                    fVar23 = (fVar25 + _DAT_14590750c) - fVar21;
                    uVar8 = (long)(fVar23 - _DAT_1459071e0) & (long)fVar23 >> 0x3f | (long)fVar23;
                    if (fVar23 < 0.0) {
                      uVar8 = 0;
                    }
                    if (_DAT_1459071e4 < fVar23) {
                      uVar8 = 0xffffffffffffffff;
                    }
                    fVar24 = fVar25 - fVar21;
                    uVar9 = (long)(fVar24 - _DAT_1459071e0) & (long)fVar24 >> 0x3f | (long)fVar24;
                    if (fVar24 < 0.0) {
                      uVar9 = 0;
                    }
                    if (_DAT_1459071e4 < fVar24) {
                      uVar9 = 0xffffffffffffffff;
                    }
                    fVar21 = (fVar25 + _DAT_145907490) - fVar21;
                    uVar15 = (long)(fVar21 - _DAT_1459071e0) & (long)fVar21 >> 0x3f | (long)fVar21;
                    if (fVar21 < 0.0) {
                      uVar15 = 0;
                    }
                    if (_DAT_1459071e4 < fVar21) {
                      uVar15 = 0xffffffffffffffff;
                    }
                    if (0.0 <= fVar23 && uVar8 < uVar1) {
                      fVar23 = (fVar22 + _DAT_14590750c) - fVar20;
                      bVar5 = 0.0 <= fVar23;
                      uVar10 = 0;
                      if (0.0 <= fVar23) {
                        uVar10 = (long)(fVar23 - _DAT_1459071e0) & (long)fVar23 >> 0x3f |
                                 (long)fVar23;
                      }
                      if (_DAT_1459071e4 < fVar23) {
                        uVar10 = 0xffffffffffffffff;
                      }
                      bVar19 = uVar10 < uVar1;
                      if (0.0 <= fVar24) {
                        if (uVar9 < uVar1) {
                          if ((fVar21 < 0.0) || (uVar1 <= uVar15)) {
                            if (bVar19 && bVar5) {
                              uVar11 = uVar8 + uVar10 * uVar1;
                              uVar15 = uVar16;
                              if (uVar3 <= uVar11) goto LAB_1455264ac;
                              if (*(char *)(lVar2 + uVar11) == '\0') {
                                uVar11 = uVar10 * uVar1 + uVar9;
                                goto joined_r0x000145526292;
                              }
                            }
                          }
                          else if (bVar19 && bVar5) {
                            lVar12 = uVar10 * uVar1;
                            uVar11 = lVar12 + uVar8;
                            if (uVar3 <= uVar11) goto LAB_1455264ac;
                            if (*(char *)(lVar2 + uVar11) == '\0') {
                              uVar11 = lVar12 + uVar9;
                              if (uVar3 <= uVar11) goto LAB_1455264ac;
                              if (*(char *)(lVar2 + uVar11) == '\0') {
                                uVar11 = lVar12 + uVar15;
                                if (uVar3 <= uVar11) goto LAB_1455264ac;
                                if (*(char *)(lVar2 + uVar11) == '\0') {
                                  fVar21 = fVar22 - fVar20;
                                  uVar10 = 0;
                                  if (0.0 <= fVar21) {
                                    uVar10 = (long)(fVar21 - _DAT_1459071e0) & (long)fVar21 >> 0x3f
                                             | (long)fVar21;
                                  }
                                  if (_DAT_1459071e4 < fVar21) {
                                    uVar10 = 0xffffffffffffffff;
                                  }
                                  if (uVar10 < uVar1 && 0.0 <= fVar21) {
                                    lVar12 = uVar10 * uVar1;
                                    uVar11 = lVar12 + uVar8;
                                    if (uVar3 <= uVar11) goto LAB_1455264ac;
                                    if (*(char *)(lVar2 + uVar11) == '\0') {
                                      uVar11 = uVar9 + lVar12;
                                      if (uVar3 <= uVar11) goto LAB_1455264ac;
                                      if (*(char *)(lVar2 + uVar11) == '\0') {
                                        uVar11 = lVar12 + uVar15;
                                        if (uVar3 <= uVar11) goto LAB_1455264ac;
                                        if (*(char *)(lVar2 + uVar11) == '\0') {
                                          fVar21 = (fVar22 + _DAT_145907490) - fVar20;
                                          uVar10 = 0;
                                          if (0.0 <= fVar21) {
                                            uVar10 = (long)(fVar21 - _DAT_1459071e0) &
                                                     (long)fVar21 >> 0x3f | (long)fVar21;
                                          }
                                          if (_DAT_1459071e4 < fVar21) {
                                            uVar10 = 0xffffffffffffffff;
                                          }
                                          if (0.0 <= fVar21 && uVar10 < uVar1) {
                                            lVar12 = uVar10 * uVar1;
                                            uVar8 = uVar8 + lVar12;
                                            if (uVar3 <= uVar8) {
LAB_1455264c2:
                                              func_0x000145903b33(uVar15,iVar14,uVar3,uVar8,
                                                                  0x146d34af8);
                    /* WARNING: Does not return */
                                              pcVar4 = (code *)invalidInstructionException();
                                              (*pcVar4)();
                                            }
                                            if (*(char *)(lVar2 + uVar8) == '\0') {
                                              uVar8 = uVar9 + lVar12;
                                              if (uVar3 <= uVar8) goto LAB_1455264c2;
                                              if (*(char *)(lVar2 + uVar8) == '\0') {
                                                uVar8 = lVar12 + uVar15;
                                                if (uVar3 <= uVar8) {
                                                  func_0x000145903b33(uVar15,iVar14,uVar3,uVar8,
                                                                      0x146d34af8);
                    /* WARNING: Does not return */
                                                  pcVar4 = (code *)invalidInstructionException();
                                                  (*pcVar4)();
                                                }
                                                if (*(char *)(lVar2 + uVar8) == '\0') {
                                                  local_f8 = CONCAT44(fVar22,fVar25);
                                                  uVar16 = 1;
                                                  in_XMM12_Da = fVar26;
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                        else if (bVar19 && bVar5) {
                          uVar11 = uVar10 * uVar1 + uVar8;
                          goto joined_r0x000145526292;
                        }
                      }
                      else if (bVar19 && bVar5) {
                        uVar11 = uVar10 * uVar1 + uVar8;
joined_r0x000145526292:
                        uVar15 = uVar16;
                        if (uVar3 <= uVar11) {
LAB_1455264ac:
                          func_0x000145903b33(uVar15,iVar14,uVar3,uVar11,0x146d34af8);
                    /* WARNING: Does not return */
                          pcVar4 = (code *)invalidInstructionException();
                          (*pcVar4)();
                        }
                      }
                    }
                  }
                }
              }
            } while ((iVar7 < iVar17) && (iVar7 = iVar18, iVar18 <= iVar17));
          }
          else {
            do {
              if (iVar17 <= iVar7) break;
              iVar7 = iVar7 + (uint)(iVar7 < iVar17);
            } while (iVar7 <= iVar17);
          }
        }
        else {
          do {
            if (iVar17 <= iVar7) break;
            iVar7 = iVar7 + (uint)(iVar7 < iVar17);
          } while (iVar7 <= iVar17);
        }
      } while ((iVar6 < iVar17) && (iVar6 = iVar6 + (uint)(iVar6 < iVar17), iVar6 <= iVar17));
      iVar6 = 0;
      if ((int)uVar16 == 1) {
        *(undefined8 *)(param_8 + 1) = local_f8;
        iVar6 = 1;
      }
    }
  }
  *param_8 = iVar6;
  return param_8;
}
