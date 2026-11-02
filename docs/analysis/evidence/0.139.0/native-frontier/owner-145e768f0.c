void entry(undefined8 param_1,undefined8 param_2,ulong param_3,long param_4,long *param_5,
          ulong param_6)

{
  long *plVar1;
  undefined8 uVar2;
  undefined1 auVar3 [16];
  undefined1 auVar4 [16];
  bool bVar5;
  bool bVar6;
  long lVar7;
  ulong uVar8;
  ulong uVar9;
  long *plVar10;
  ulong uVar11;
  ulong uVar12;
  long *plVar13;
  byte bVar14;
  undefined8 *puVar15;
  long *plVar16;
  long *plVar17;
  ulong uVar18;
  ulong uVar19;
  ulong uVar20;
  long lVar21;
  ulong uVar22;
  byte bVar23;
  undefined1 (*pauVar24) [16];
  long lVar25;
  int *piVar26;
  byte bVar27;
  long *plVar28;
  ulong uVar29;
  long *plVar30;
  ulong uVar31;
  undefined1 auVar32 [16];
  undefined1 auVar33 [16];
  undefined1 auVar34 [16];
  undefined1 auVar35 [16];
  char in_stack_00000028;
  ulong local_2d8;
  byte abStack_293 [67];
  ulong auStack_250 [66];

  if (param_3 < 2) {
    return;
  }
  auVar3._8_8_ = 0;
  auVar3._0_8_ = param_3;
  auVar4 = ZEXT816(0) << 0x40 | ZEXT816(0x4000000000000000);
  lVar7 = (SUB168(auVar4 / auVar3,0) + 1) - (ulong)(SUB168(auVar4 % auVar3,0) == 0);
  if (param_3 < 0x1001) {
    uVar11 = param_3 - (param_3 >> 1);
    uVar8 = 0x40;
    if (uVar11 < 0x40) {
      uVar8 = uVar11;
    }
  }
  else {
    uVar8 = func_0x000146302ed0();
  }
  uVar29 = 0;
  uVar22 = 0;
  uVar19 = param_3;
  uVar20 = param_6;
  uVar11 = 1;
  do {
    plVar1 = (long *)(param_4 + uVar29 * 8);
    local_2d8 = uVar19 - uVar29;
    if (uVar19 < uVar29 || local_2d8 == 0) {
      bVar14 = 0;
      local_2d8 = 1;
    }
    else {
      if (local_2d8 < uVar8) {
LAB_145e769d4:
        if (in_stack_00000028 != '\0') {
          if (0x1f < local_2d8) {
            local_2d8 = 0x20;
          }
          func_0x000145fc52b0();
          uVar9 = local_2d8 & 0xffffffff;
          goto LAB_145e76f00;
        }
        if (uVar8 <= local_2d8) {
          local_2d8 = uVar8;
        }
        local_2d8 = local_2d8 * 2;
      }
      else {
        uVar9 = local_2d8;
        if (1 < local_2d8) {
          lVar21 = plVar1[1];
          if (*(long *)(lVar21 + 0x18) == -1) {
            bVar14 = 2;
            if (*(long *)(lVar21 + 0x58) == -1) {
              bVar14 = 3;
              piVar26 = (int *)&DAT_1476a2808;
              if (*(char *)(lVar21 + 0x200) == '\x01') goto LAB_145e76a9e;
            }
          }
          else {
            bVar14 = 1;
            piVar26 = (int *)&DAT_1476a280d;
            if (*(char *)(*(long *)(lVar21 + 0x30) + 100) != '\0') {
LAB_145e76a9e:
              bVar14 = ((char)piVar26[1] != 'l' || *piVar26 != 0x616e6966) * '\x03';
            }
          }
          lVar25 = *plVar1;
          if (*(long *)(lVar25 + 0x18) == -1) {
            bVar23 = 2;
            if (*(long *)(lVar25 + 0x58) == -1) {
              bVar23 = 3;
              piVar26 = (int *)&DAT_1476a2808;
              if (*(char *)(lVar25 + 0x200) == '\x01') goto LAB_145e76aff;
            }
          }
          else {
            bVar23 = 1;
            piVar26 = (int *)&DAT_1476a280d;
            if (*(char *)(*(long *)(lVar25 + 0x30) + 100) != '\0') {
LAB_145e76aff:
              bVar23 = ((char)piVar26[1] != 'l' || *piVar26 != 0x616e6966) * '\x03';
            }
          }
          bVar6 = (uint)*(undefined8 *)(lVar21 + 0xf0) < *(uint *)(lVar25 + 0xf0);
          if (bVar14 != bVar23) {
            bVar6 = bVar14 < bVar23;
          }
          uVar9 = 2;
          if (bVar6) {
            if (local_2d8 == 2) {
              uVar12 = 1;
            }
            else {
              do {
                lVar25 = plVar1[uVar9];
                if (*(long *)(lVar25 + 0x18) == -1) {
                  bVar14 = 2;
                  if (*(long *)(lVar25 + 0x58) == -1) {
                    bVar14 = 3;
                    piVar26 = (int *)&DAT_1476a2808;
                    if (*(char *)(lVar25 + 0x200) == '\x01') goto LAB_145e76ba8;
                  }
                }
                else {
                  bVar14 = 1;
                  piVar26 = (int *)&DAT_1476a280d;
                  if (*(char *)(*(long *)(lVar25 + 0x30) + 100) != '\0') {
LAB_145e76ba8:
                    bVar14 = ((char)piVar26[1] != 'l' || *piVar26 != 0x616e6966) * '\x03';
                  }
                }
                if (*(long *)(lVar21 + 0x18) == -1) {
                  bVar23 = 2;
                  if (*(long *)(lVar21 + 0x58) == -1) {
                    bVar23 = 3;
                    piVar26 = (int *)&DAT_1476a2808;
                    if (*(char *)(lVar21 + 0x200) == '\x01') goto LAB_145e76c1f;
                  }
                }
                else {
                  bVar23 = 1;
                  piVar26 = (int *)&DAT_1476a280d;
                  if (*(char *)(*(long *)(lVar21 + 0x30) + 100) != '\0') {
LAB_145e76c1f:
                    bVar23 = ((char)piVar26[1] != 'l' || *piVar26 != 0x616e6966) * '\x03';
                  }
                }
                bVar5 = (uint)*(undefined8 *)(lVar25 + 0xf0) < *(uint *)(lVar21 + 0xf0);
                if (bVar14 != bVar23) {
                  bVar5 = bVar14 < bVar23;
                }
                uVar19 = uVar9;
              } while ((bVar5) &&
                      (uVar9 = uVar9 + 1, lVar21 = lVar25, uVar19 = local_2d8, local_2d8 != uVar9));
joined_r0x000145e76e08:
              uVar9 = uVar19;
              uVar19 = param_3;
              if (uVar9 < uVar8) goto LAB_145e769d4;
              if ((!bVar6) || (uVar12 = uVar9 >> 1, uVar12 == 0)) goto LAB_145e76f00;
            }
            if (uVar12 < 4) {
              uVar18 = 0;
            }
            else {
              uVar18 = uVar12 & 0xfffffffffffffffc;
              pauVar24 = (undefined1 (*) [16])(param_4 + 0x10 + uVar29 * 8);
              lVar21 = uVar9 * 8 + uVar29 * 8 + param_4 + -0x10;
              lVar25 = 0;
              do {
                auVar3 = pauVar24[-1];
                auVar4 = *pauVar24;
                auVar32 = *(undefined1 (*) [16])(lVar21 + -0x10 + lVar25 * 8);
                auVar33 = *(undefined1 (*) [16])(lVar21 + lVar25 * 8);
                auVar35._0_8_ = auVar33._8_8_;
                auVar35._8_4_ = auVar33._0_4_;
                auVar35._12_4_ = auVar33._4_4_;
                auVar34._0_8_ = auVar32._8_8_;
                auVar34._8_4_ = auVar32._0_4_;
                auVar34._12_4_ = auVar32._4_4_;
                pauVar24[-1] = auVar35;
                *pauVar24 = auVar34;
                auVar32._0_8_ = auVar3._8_8_;
                auVar32._8_4_ = auVar3._0_4_;
                auVar32._12_4_ = auVar3._4_4_;
                auVar33._0_8_ = auVar4._8_8_;
                auVar33._8_4_ = auVar4._0_4_;
                auVar33._12_4_ = auVar4._4_4_;
                *(undefined1 (*) [16])(lVar21 + lVar25 * 8) = auVar32;
                *(undefined1 (*) [16])(lVar21 + -0x10 + lVar25 * 8) = auVar33;
                lVar25 = lVar25 + -4;
                pauVar24 = pauVar24 + 2;
              } while (-lVar25 != uVar18);
              if (uVar12 == uVar18) goto LAB_145e76f00;
            }
            lVar21 = -uVar18;
            puVar15 = (undefined8 *)(uVar18 * 8 + uVar29 * 8 + param_4);
            lVar25 = uVar29 * 8 + uVar9 * 8 + param_4 + -8;
            do {
              uVar2 = *puVar15;
              *puVar15 = *(undefined8 *)(lVar25 + lVar21 * 8);
              *(undefined8 *)(lVar25 + lVar21 * 8) = uVar2;
              lVar21 = lVar21 + -1;
              puVar15 = puVar15 + 1;
            } while (-lVar21 != uVar12);
          }
          else if (local_2d8 != 2) {
            do {
              lVar25 = plVar1[uVar9];
              if (*(long *)(lVar25 + 0x18) == -1) {
                bVar14 = 2;
                if (*(long *)(lVar25 + 0x58) == -1) {
                  bVar14 = 3;
                  piVar26 = (int *)&DAT_1476a2808;
                  if (*(char *)(lVar25 + 0x200) == '\x01') goto LAB_145e76ce8;
                }
              }
              else {
                bVar14 = 1;
                piVar26 = (int *)&DAT_1476a280d;
                if (*(char *)(*(long *)(lVar25 + 0x30) + 100) != '\0') {
LAB_145e76ce8:
                  bVar14 = ((char)piVar26[1] != 'l' || *piVar26 != 0x616e6966) * '\x03';
                }
              }
              if (*(long *)(lVar21 + 0x18) == -1) {
                bVar23 = 2;
                if (*(long *)(lVar21 + 0x58) == -1) {
                  bVar23 = 3;
                  piVar26 = (int *)&DAT_1476a2808;
                  if (*(char *)(lVar21 + 0x200) == '\x01') goto LAB_145e76d5f;
                }
              }
              else {
                bVar23 = 1;
                piVar26 = (int *)&DAT_1476a280d;
                if (*(char *)(*(long *)(lVar21 + 0x30) + 100) != '\0') {
LAB_145e76d5f:
                  bVar23 = ((char)piVar26[1] != 'l' || *piVar26 != 0x616e6966) * '\x03';
                }
              }
              bVar5 = (uint)*(undefined8 *)(lVar25 + 0xf0) < *(uint *)(lVar21 + 0xf0);
              if (bVar14 != bVar23) {
                bVar5 = bVar14 < bVar23;
              }
              uVar19 = uVar9;
            } while ((!bVar5) &&
                    (uVar9 = uVar9 + 1, lVar21 = lVar25, uVar19 = local_2d8, local_2d8 != uVar9));
            goto joined_r0x000145e76e08;
          }
        }
LAB_145e76f00:
        local_2d8 = uVar9 * 2 + 1;
      }
      uVar9 = ((local_2d8 >> 1) + uVar29 * 2) * lVar7 ^ (uVar29 * 2 - (uVar11 >> 1)) * lVar7;
      lVar21 = 0x3f;
      if (uVar9 != 0) {
        for (; uVar9 >> lVar21 == 0; lVar21 = lVar21 + -1) {
        }
      }
      bVar14 = (byte)lVar21 ^ 0x3f;
    }
    if (1 < uVar22) {
      do {
        while( true ) {
          if (abStack_293[uVar22] < bVar14) goto LAB_145e77426;
          uVar22 = uVar22 - 1;
          uVar12 = auStack_250[uVar22];
          uVar31 = uVar12 >> 1;
          uVar18 = uVar11 >> 1;
          uVar9 = uVar31 + uVar18;
          if ((uVar20 < uVar9) || ((((uint)uVar12 | (uint)uVar11) & 1) != 0)) break;
          uVar11 = uVar9 * 2;
          if (uVar22 < 2) goto LAB_145e77420;
        }
        plVar28 = (long *)(param_4 + (uVar29 - uVar9) * 8);
        if ((uVar12 & 1) == 0) {
          lVar21 = 0x3f;
          if ((uVar31 | 1) != 0) {
            for (; (uVar31 | 1) >> lVar21 == 0; lVar21 = lVar21 + -1) {
            }
          }
          func_0x000145fc52b0();
        }
        if ((uVar11 & 1) == 0) {
          lVar21 = 0x3f;
          if ((uVar18 | 1) != 0) {
            for (; (uVar18 | 1) >> lVar21 == 0; lVar21 = lVar21 + -1) {
            }
          }
          func_0x000145fc52b0();
        }
        if ((uVar18 != 0) && (uVar31 != 0)) {
          uVar11 = uVar31;
          if (uVar18 < uVar31) {
            uVar11 = uVar18;
          }
          if (uVar11 <= param_6) {
            plVar30 = plVar28 + uVar31;
            plVar16 = plVar28;
            if (uVar18 < uVar31) {
              plVar16 = plVar30;
            }
            plVar17 = param_5;
            func_0x000146325eeb(uVar11,param_5,plVar16,param_5,uVar11 * 8);
            plVar16 = param_5 + uVar11;
            plVar10 = (long *)(param_4 + -8 + uVar29 * 8);
            if (uVar18 < uVar31) {
              do {
                lVar21 = plVar16[-1];
                if (*(long *)(lVar21 + 0x18) == -1) {
                  bVar23 = 2;
                  if (*(long *)(lVar21 + 0x58) == -1) {
                    bVar23 = 3;
                    piVar26 = (int *)&DAT_1476a2808;
                    if (*(char *)(lVar21 + 0x200) == '\x01') goto LAB_145e7716e;
                  }
                }
                else {
                  bVar23 = 1;
                  piVar26 = (int *)&DAT_1476a280d;
                  if (*(char *)(*(long *)(lVar21 + 0x30) + 100) != '\0') {
LAB_145e7716e:
                    bVar23 = ((char)piVar26[1] != 'l' || *piVar26 != 0x616e6966) * '\x03';
                  }
                }
                lVar25 = plVar30[-1];
                if (*(long *)(lVar25 + 0x18) == -1) {
                  bVar27 = 2;
                  if (*(long *)(lVar25 + 0x58) == -1) {
                    bVar27 = 3;
                    piVar26 = (int *)&DAT_1476a2808;
                    if (*(char *)(lVar25 + 0x200) == '\x01') goto LAB_145e771df;
                  }
                }
                else {
                  bVar27 = 1;
                  piVar26 = (int *)&DAT_1476a280d;
                  if (*(char *)(*(long *)(lVar25 + 0x30) + 100) != '\0') {
LAB_145e771df:
                    bVar27 = ((char)piVar26[1] != 'l' || *piVar26 != 0x616e6966) * '\x03';
                  }
                }
                bVar6 = (uint)*(undefined8 *)(lVar21 + 0xf0) < *(uint *)(lVar25 + 0xf0);
                if (bVar23 != bVar27) {
                  bVar6 = bVar23 < bVar27;
                }
                plVar13 = plVar16 + -1;
                if (bVar6) {
                  plVar13 = plVar30 + -1;
                }
                *plVar10 = *plVar13;
                plVar30 = plVar30 + -1 + ((ulong)bVar6 ^ 1);
                plVar16 = plVar16 + -1 + bVar6;
              } while ((plVar30 != plVar28) && (plVar10 = plVar10 + -1, plVar16 != plVar17));
            }
            else {
              do {
                lVar21 = *plVar30;
                if (*(long *)(lVar21 + 0x18) == -1) {
                  bVar23 = 2;
                  if (*(long *)(lVar21 + 0x58) == -1) {
                    bVar23 = 3;
                    piVar26 = (int *)&DAT_1476a2808;
                    if (*(char *)(lVar21 + 0x200) == '\x01') goto LAB_145e772dd;
                  }
                }
                else {
                  bVar23 = 1;
                  piVar26 = (int *)&DAT_1476a280d;
                  if (*(char *)(*(long *)(lVar21 + 0x30) + 100) != '\0') {
LAB_145e772dd:
                    bVar23 = ((char)piVar26[1] != 'l' || *piVar26 != 0x616e6966) * '\x03';
                  }
                }
                lVar25 = *plVar17;
                if (*(long *)(lVar25 + 0x18) == -1) {
                  bVar27 = 2;
                  if (*(long *)(lVar25 + 0x58) == -1) {
                    bVar27 = 3;
                    piVar26 = (int *)&DAT_1476a2808;
                    if (*(char *)(lVar25 + 0x200) == '\x01') goto LAB_145e7734e;
                  }
                }
                else {
                  bVar27 = 1;
                  piVar26 = (int *)&DAT_1476a280d;
                  if (*(char *)(*(long *)(lVar25 + 0x30) + 100) != '\0') {
LAB_145e7734e:
                    bVar27 = ((char)piVar26[1] != 'l' || *piVar26 != 0x616e6966) * '\x03';
                  }
                }
                bVar6 = (uint)*(undefined8 *)(lVar21 + 0xf0) < *(uint *)(lVar25 + 0xf0);
                if (bVar23 != bVar27) {
                  bVar6 = bVar23 < bVar27;
                }
                plVar10 = plVar17;
                if (bVar6 != false) {
                  plVar10 = plVar30;
                }
                *plVar28 = *plVar10;
                plVar17 = plVar17 + (bVar6 ^ 1);
                plVar28 = plVar28 + 1;
              } while ((plVar17 != plVar16) && (plVar30 = plVar30 + bVar6, plVar30 != plVar1));
            }
            uVar19 = param_3;
            func_0x000146325eeb();
          }
        }
        uVar11 = uVar9 * 2 + 1;
        uVar20 = param_6;
      } while (1 < uVar22);
LAB_145e77420:
      uVar22 = 1;
    }
LAB_145e77426:
    auStack_250[uVar22] = uVar11;
    abStack_293[uVar22 + 1] = bVar14;
    if (uVar19 <= uVar29) {
      if ((uVar11 & 1) != 0) {
        return;
      }
      lVar7 = 0x3f;
      if ((uVar19 | 1) != 0) {
        for (; (uVar19 | 1) >> lVar7 == 0; lVar7 = lVar7 + -1) {
        }
      }
      func_0x000145fc52b0();
      return;
    }
    uVar22 = uVar22 + 1;
    uVar29 = uVar29 + (local_2d8 >> 1);
    uVar11 = local_2d8;
  } while( true );
}
