undefined8 *
FUN_14599fe20(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 *param_4,uint param_5,
             uint param_6)

{
  char *pcVar1;
  undefined8 uVar2;
  long lVar3;
  undefined4 uVar4;
  byte bVar5;
  char cVar6;
  int iVar7;
  int iVar8;
  uint uVar9;
  long *plVar10;
  ulong uVar11;
  long lVar12;
  long lVar13;
  long lVar14;
  long lVar15;
  ulong uVar16;
  byte *pbVar17;
  ulong uVar18;
  long lVar19;
  long lStack_150;
  long *plStack_148;
  ulong uStack_140;
  undefined8 uStack_138;
  long lStack_130;
  long lStack_128;
  long *plStack_120;
  long *plStack_118;
  undefined8 *puStack_110;
  undefined1 *puStack_108;
  undefined1 *puStack_100;
  byte *pbStack_f8;
  undefined8 uStack_f0;
  undefined4 uStack_e8;
  undefined4 uStack_e4;
  undefined4 uStack_e0;
  undefined4 uStack_dc;
  ulong uStack_d8;
  long lStack_d0;
  undefined8 uStack_c8;
  long *plStack_c0;
  undefined1 *puStack_b8;
  undefined4 uStack_ac;
  long lStack_a8;
  ulong uStack_a0;
  undefined8 uStack_98;
  undefined8 uStack_90;
  ulong uStack_88;
  uint uStack_7c;
  long lStack_78;
  long *plStack_70;
  undefined1 uStack_61;
  uint uStack_60;
  uint uStack_5c;
  ulong uStack_58;
  undefined1 uStack_4d;
  char cStack_4c;
  undefined1 uStack_4b;
  byte bStack_4a;
  byte bStack_49;
  undefined8 uStack_48;

  uStack_48 = 0xfffffffffffffffe;
  bStack_4a = (byte)param_5;
  uStack_7c = param_6;
  if ((bStack_4a < 0xc) && ((0xbbeU >> (param_5 & 0x1f) & 1) != 0)) {
    puStack_108 = (undefined1 *)param_3[1];
    puStack_100 = puStack_108 + param_3[2] * 0x10;
    pbStack_f8 = &bStack_4a;
    plStack_c0 = param_3;
    puStack_b8 = puStack_108;
    FUN_1459cf2a0(param_1,param_4,&puStack_108,&lStack_150);
    plStack_70 = plStack_148;
    puStack_108 = &uStack_61;
    if (1 < uStack_140) {
      if (uStack_140 < 0x15) {
        FUN_1459be380();
      }
      else {
        uStack_4b = 1;
        FUN_1459a7b60();
      }
    }
    uStack_98 = 0;
    uStack_90 = 8;
    uStack_88 = 0;
    lStack_a8 = lStack_150;
    puStack_110 = param_4;
    if (uStack_140 != 0) {
      plStack_118 = plStack_70 + uStack_140 * 3;
      plVar10 = plStack_70;
      do {
        lStack_130 = *plVar10;
        if (lStack_130 == 0) break;
        cStack_4c = (char)plVar10[2];
        plStack_120 = plVar10;
        if (cStack_4c != '\0') {
          uVar4 = 0;
          do {
            uStack_ac = uVar4;
            uStack_d8 = (ulong)bStack_4a;
            uStack_60 = bStack_4a - 1;
            if (((byte)uStack_60 < 0xb) &&
               (uVar11 = (ulong)(byte)uStack_60, (0x5dfU >> (uStack_60 & 0x1f) & 1) != 0)) {
              uVar2 = *(undefined8 *)(lStack_130 + 0x30);
              lVar3 = *(long *)(lStack_130 + 0x38);
              lVar13 = *(long *)(uVar11 * 8 + 0x14723f158);
              uStack_58 = uVar11;
              if (*(long *)(lVar13 + 0x38) != 0) {
                plVar10 = *(long **)(lVar13 + 0x30);
                lVar14 = *(long *)(lVar13 + 0x38) * 0xa0;
                do {
                  if ((plVar10[7] == lVar3) && (iVar7 = func_0x000145c0a3e7(), iVar7 == 0)) {
                    iVar7 = 0;
                    uVar11 = uStack_58;
                    goto LAB_1459a00c2;
                  }
                  plVar10 = plVar10 + 0x14;
                  lVar14 = lVar14 + -0xa0;
                } while (lVar14 != 0);
              }
              if (*(long *)(lVar13 + 0x78) != 0) {
                plVar10 = *(long **)(lVar13 + 0x70);
                lVar14 = *(long *)(lVar13 + 0x78) * 0xa0;
                do {
                  if ((plVar10[7] == lVar3) && (iVar7 = func_0x000145c0a3e7(), iVar7 == 0)) {
                    iVar7 = 1;
                    uVar11 = uStack_58;
                    goto LAB_1459a00c2;
                  }
                  plVar10 = plVar10 + 0x14;
                  lVar14 = lVar14 + -0xa0;
                } while (lVar14 != 0);
              }
              if (*(long *)(lVar13 + 0xb8) != 0) {
                plVar10 = *(long **)(lVar13 + 0xb0);
                lVar13 = *(long *)(lVar13 + 0xb8) * 0xa0;
                uVar11 = uStack_58;
LAB_1459a00a4:
                if ((plVar10[7] != lVar3) || (iVar7 = func_0x000145c0a3e7(), iVar7 != 0))
                goto LAB_1459a0090;
                iVar7 = 2;
LAB_1459a00c2:
                lStack_78 = uStack_90;
                uStack_a0 = uStack_88;
                if (uStack_88 == 0) {
                  if ((uStack_7c != 0) && (*(char *)((long)plVar10 + 0x9a) != '\0')) {
LAB_1459a01f4:
                    bVar5 = *(byte *)(plVar10 + 0x13);
                    uStack_5c = 0;
                    uStack_c8 = uVar2;
                    if (((byte)uStack_60 < 0xb) &&
                       ((~(byte)(0x5df >> ((byte)uStack_60 & 0x1f)) & 1) == 0 && uStack_a0 != 0)) {
                      lVar13 = (ulong)(uint)(iVar7 << 6) + *(long *)(uVar11 * 8 + 0x14723f158);
                      uVar18 = 0;
                      uStack_5c = 0;
                      uVar16 = uStack_a0;
                      lStack_d0 = lVar13;
                      bStack_49 = bVar5;
                      do {
                        lVar14 = *(long *)(lStack_78 + uVar18 * 0x10);
                        if ((*(byte *)(lVar14 + 0x98) < bVar5) &&
                           (lVar19 = *(long *)(lVar13 + 0x38), lVar19 != 0)) {
                          lStack_128 = uVar18 * 0x10 + lStack_78;
                          lVar15 = *(long *)(lVar13 + 0x30);
                          uStack_138 = *(undefined8 *)(lVar14 + 0x30);
                          lVar14 = *(long *)(lVar14 + 0x38);
                          lVar12 = 0;
                          do {
                            if ((*(long *)(lVar15 + 0x38 + lVar12) == lVar14) &&
                               (iVar7 = func_0x000145c0a3e7(), iVar7 == 0)) {
                              uStack_5c = uStack_5c + *(byte *)(lStack_128 + 8);
                              lVar13 = lStack_d0;
                              uVar11 = uStack_58;
                              uVar16 = uStack_a0;
                              bVar5 = bStack_49;
                              break;
                            }
                            lVar12 = lVar12 + 0xa0;
                            lVar13 = lStack_d0;
                            uVar11 = uStack_58;
                            uVar16 = uStack_a0;
                            bVar5 = bStack_49;
                          } while (lVar19 * 0xa0 != lVar12);
                        }
                        uVar18 = uVar18 + 1;
                      } while (uVar18 != uVar16);
                    }
                    uVar2 = uStack_c8;
                    if (((uint)bVar5 + (uint)bVar5 * 4 <= uStack_5c) &&
                       (lVar13 = FUN_14599f210(), lVar13 == 0)) {
                      uStack_4d = (undefined1)uStack_d8;
                      if ((undefined1 *)*plVar10 != (undefined1 *)0x0) {
                        pbStack_f8 = (byte *)plVar10[1];
                        uStack_e8 = (undefined4)plVar10[2];
                        uStack_e4 = *(undefined4 *)((long)plVar10 + 0x14);
                        uStack_e0 = (undefined4)plVar10[3];
                        uStack_dc = *(undefined4 *)((long)plVar10 + 0x1c);
                        puStack_108 = (undefined1 *)0x1;
                        uStack_f0 = 1;
                        puStack_100 = (undefined1 *)*plVar10;
                        cVar6 = FUN_1459924d0();
                        if (cVar6 == '\0') goto LAB_14599ff70;
                      }
                      if (((byte)uStack_60 < 0xb) && ((0x5dfU >> ((uint)uVar11 & 0x1f) & 1) != 0)) {
                        lVar13 = *(long *)(uVar11 * 8 + 0x14723f158);
                        if (*(long *)(lVar13 + 0x38) == 0) {
LAB_1459a041f:
                          if (*(long *)(lVar13 + 0x78) != 0) {
                            lVar14 = *(long *)(lVar13 + 0x70);
                            lVar19 = *(long *)(lVar13 + 0x78) * 0xa0;
                            do {
                              if ((*(long *)(lVar14 + 0x38) == lVar3) &&
                                 (iVar7 = func_0x000145c0a3e7(lVar19,lVar14,uVar2,
                                                              *(undefined8 *)(lVar14 + 0x30),lVar3),
                                 iVar7 == 0)) goto LAB_1459a04bd;
                              lVar14 = lVar14 + 0xa0;
                              lVar19 = lVar19 + -0xa0;
                            } while (lVar19 != 0);
                          }
                          if (*(long *)(lVar13 + 0xb8) != 0) {
                            lVar14 = *(long *)(lVar13 + 0xb0);
                            lVar13 = *(long *)(lVar13 + 0xb8) * 0xa0;
                            do {
                              if ((*(long *)(lVar14 + 0x38) == lVar3) &&
                                 (iVar7 = func_0x000145c0a3e7(lVar13,lVar14,uVar2,
                                                              *(undefined8 *)(lVar14 + 0x30),lVar3),
                                 iVar7 == 0)) goto LAB_1459a04bd;
                              lVar14 = lVar14 + 0xa0;
                              lVar13 = lVar13 + -0xa0;
                            } while (lVar13 != 0);
                          }
                        }
                        else {
                          lVar14 = *(long *)(lVar13 + 0x30);
                          lVar19 = *(long *)(lVar13 + 0x38) * 0xa0;
                          while ((*(long *)(lVar14 + 0x38) != lVar3 ||
                                 (iVar7 = func_0x000145c0a3e7(lVar19,lVar14,uVar2,
                                                              *(undefined8 *)(lVar14 + 0x30),lVar3),
                                 iVar7 != 0))) {
                            lVar14 = lVar14 + 0xa0;
                            lVar19 = lVar19 + -0xa0;
                            if (lVar19 == 0) goto LAB_1459a041f;
                          }
LAB_1459a04bd:
                          uVar11 = uStack_88;
                          lVar13 = uStack_90;
                          lVar19 = uStack_88 * 0x10;
                          if (uStack_88 != 0) {
                            lVar15 = 0;
                            do {
                              if ((*(long *)(*(long *)(lVar13 + lVar15) + 0x38) == lVar3) &&
                                 (iVar7 = func_0x000145c0a3e7(), iVar7 == 0)) {
                                pcVar1 = (char *)(lVar13 + 8 + lVar15);
                                *pcVar1 = *pcVar1 + '\x01';
                                goto LAB_14599ff70;
                              }
                              lVar15 = lVar15 + 0x10;
                            } while (lVar19 != lVar15);
                          }
                          if (uVar11 == uStack_98) {
                            func_0x000145c0dcb0();
                            lVar13 = uStack_90;
                          }
                          *(long *)(lVar13 + lVar19) = lVar14;
                          *(undefined1 *)(lVar13 + 8 + lVar19) = 1;
                          uStack_88 = uVar11 + 1;
                        }
                      }
                    }
                  }
                }
                else {
                  if (uStack_88 < 4) {
                    uVar11 = 0;
                    uVar9 = 0;
LAB_1459a0151:
                    uVar16 = 0;
                    do {
                      uVar9 = uVar9 + *(byte *)(uVar11 * 0x10 + uStack_90 + 8 + uVar16);
                      uVar16 = uVar16 + 0x10;
                    } while (((uint)uStack_88 & 3) << 4 != uVar16);
                  }
                  else {
                    pbVar17 = (byte *)(uStack_90 + 0x38);
                    uVar11 = 0;
                    uVar9 = 0;
                    do {
                      uVar9 = (uint)*pbVar17 +
                              (uint)pbVar17[-0x10] + (uint)pbVar17[-0x20] + pbVar17[-0x30] + uVar9;
                      uVar11 = uVar11 + 4;
                      pbVar17 = pbVar17 + 0x40;
                    } while ((uStack_88 & 0xfffffffffffffffc) != uVar11);
                    if ((uStack_88 & 3) != 0) goto LAB_1459a0151;
                  }
                  if (uVar9 < uStack_7c) {
                    lVar13 = uStack_88 << 4;
                    lVar14 = 0;
                    while ((*(long *)(*(long *)(lStack_78 + lVar14) + 0x38) != lVar3 ||
                           (iVar8 = func_0x000145c0a3e7(), iVar8 != 0))) {
                      lVar14 = lVar14 + 0x10;
                      if (lVar13 == lVar14) {
                        bVar5 = 0;
LAB_1459a01dd:
                        uVar11 = uStack_58;
                        if (bVar5 < *(byte *)((long)plVar10 + 0x9a)) goto LAB_1459a01f4;
                        goto LAB_14599ff70;
                      }
                    }
                    bVar5 = *(byte *)(lStack_78 + 8 + lVar14);
                    goto LAB_1459a01dd;
                  }
                }
              }
            }
LAB_14599ff70:
            cVar6 = (char)uStack_ac + '\x01';
            uVar4 = CONCAT31((int3)((uint)uStack_ac >> 8),cVar6);
          } while (cVar6 != cStack_4c);
        }
        plVar10 = plStack_120 + 3;
      } while (plVar10 != plStack_118);
    }
    if (lStack_a8 != 0) {
      func_0x0001400021d0();
    }
    puStack_110[2] = uStack_88;
    *(undefined4 *)puStack_110 = (undefined4)uStack_98;
    *(undefined4 *)((long)puStack_110 + 4) = uStack_98._4_4_;
    *(undefined4 *)(puStack_110 + 1) = (undefined4)uStack_90;
    *(undefined4 *)((long)puStack_110 + 0xc) = uStack_90._4_4_;
    lVar3 = *plStack_c0;
    param_4 = puStack_110;
  }
  else {
    *param_4 = 0;
    param_4[1] = 8;
    param_4[2] = 0;
    lVar3 = *param_3;
  }
  if (lVar3 != 0) {
    func_0x0001400021d0();
  }
  return param_4;
LAB_1459a0090:
  plVar10 = plVar10 + 0x14;
  lVar13 = lVar13 + -0xa0;
  if (lVar13 == 0) goto LAB_14599ff70;
  goto LAB_1459a00a4;
}
