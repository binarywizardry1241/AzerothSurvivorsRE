undefined8 * FUN_1458576c0(undefined8 *param_1,longlong *param_2,uint param_3,uint param_4)

{
  char *pcVar1;
  undefined8 uVar2;
  longlong lVar3;
  undefined4 uVar4;
  byte bVar5;
  char cVar6;
  int iVar7;
  int iVar8;
  uint uVar9;
  longlong *plVar10;
  undefined1 *puVar11;
  ulonglong uVar12;
  longlong lVar13;
  longlong lVar14;
  longlong lVar15;
  longlong lVar16;
  ulonglong uVar17;
  byte *pbVar18;
  ulonglong uVar19;
  longlong lVar20;
  longlong lStack_150;
  longlong *plStack_148;
  ulonglong uStack_140;
  undefined8 uStack_138;
  longlong lStack_130;
  longlong lStack_128;
  longlong *plStack_120;
  longlong *plStack_118;
  undefined8 *puStack_110;
  undefined1 *puStack_108;
  undefined1 *puStack_100;
  byte *pbStack_f8;
  undefined8 uStack_f0;
  undefined4 uStack_e8;
  undefined4 uStack_e4;
  undefined4 uStack_e0;
  undefined4 uStack_dc;
  ulonglong uStack_d8;
  longlong lStack_d0;
  undefined8 uStack_c8;
  longlong *plStack_c0;
  undefined1 *puStack_b8;
  undefined4 uStack_ac;
  longlong lStack_a8;
  ulonglong uStack_a0;
  undefined8 uStack_98;
  undefined8 uStack_90;
  ulonglong uStack_88;
  uint uStack_7c;
  longlong lStack_78;
  longlong *plStack_70;
  undefined1 uStack_61;
  uint uStack_60;
  uint uStack_5c;
  ulonglong uStack_58;
  undefined1 uStack_4d;
  char cStack_4c;
  undefined1 uStack_4b;
  byte bStack_4a;
  byte bStack_49;
  undefined8 uStack_48;

  uStack_48 = 0xfffffffffffffffe;
  bStack_4a = (byte)param_3;
  uStack_7c = param_4;
  if ((bStack_4a < 0xc) && ((0xbbeU >> (param_3 & 0x1f) & 1) != 0)) {
    puStack_108 = (undefined1 *)param_2[1];
    puStack_100 = puStack_108 + param_2[2] * 0x10;
    pbStack_f8 = &bStack_4a;
    plStack_c0 = param_2;
    puStack_b8 = puStack_108;
    FUN_1459c9200(&lStack_150,&puStack_108);
    plStack_70 = plStack_148;
    puStack_108 = &uStack_61;
    if (1 < uStack_140) {
      if (uStack_140 < 0x15) {
        FUN_1458a2a90(plStack_148,uStack_140,1,&puStack_108);
      }
      else {
        uStack_4b = 1;
        FUN_1458b3480(plStack_148,uStack_140,&puStack_108);
      }
    }
    uStack_98 = 0;
    uStack_90 = 8;
    uStack_88 = 0;
    lStack_a8 = lStack_150;
    puStack_110 = param_1;
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
            uStack_d8 = (ulonglong)bStack_4a;
            uStack_60 = bStack_4a - 1;
            if (((byte)uStack_60 < 0xb) &&
               (uVar12 = (ulonglong)(byte)uStack_60, (0x5dfU >> (uStack_60 & 0x1f) & 1) != 0)) {
              uVar2 = *(undefined8 *)(lStack_130 + 0x30);
              lVar3 = *(longlong *)(lStack_130 + 0x38);
              lVar14 = *(longlong *)(&DAT_14702be30 + uVar12 * 8);
              uStack_58 = uVar12;
              if (*(longlong *)(lVar14 + 0x38) != 0) {
                plVar10 = *(longlong **)(lVar14 + 0x30);
                lVar15 = *(longlong *)(lVar14 + 0x38) * 0xa0;
                do {
                  if ((plVar10[7] == lVar3) &&
                     (iVar7 = func_0x000145d14601(plVar10[6],uVar2,lVar3), iVar7 == 0)) {
                    iVar7 = 0;
                    uVar12 = uStack_58;
                    goto LAB_145857962;
                  }
                  plVar10 = plVar10 + 0x14;
                  lVar15 = lVar15 + -0xa0;
                } while (lVar15 != 0);
              }
              if (*(longlong *)(lVar14 + 0x78) != 0) {
                plVar10 = *(longlong **)(lVar14 + 0x70);
                lVar15 = *(longlong *)(lVar14 + 0x78) * 0xa0;
                do {
                  if ((plVar10[7] == lVar3) &&
                     (iVar7 = func_0x000145d14601(plVar10[6],uVar2,lVar3), iVar7 == 0)) {
                    iVar7 = 1;
                    uVar12 = uStack_58;
                    goto LAB_145857962;
                  }
                  plVar10 = plVar10 + 0x14;
                  lVar15 = lVar15 + -0xa0;
                } while (lVar15 != 0);
              }
              uVar12 = uStack_58;
              if (*(longlong *)(lVar14 + 0xb8) != 0) {
                plVar10 = *(longlong **)(lVar14 + 0xb0);
                lVar14 = *(longlong *)(lVar14 + 0xb8) * 0xa0;
LAB_145857944:
                if ((plVar10[7] != lVar3) ||
                   (iVar7 = func_0x000145d14601(plVar10[6],uVar2,lVar3), iVar7 != 0))
                goto LAB_145857930;
                iVar7 = 2;
LAB_145857962:
                lStack_78 = uStack_90;
                uStack_a0 = uStack_88;
                if (uStack_88 == 0) {
                  if ((uStack_7c != 0) && (*(char *)((longlong)plVar10 + 0x9a) != '\0')) {
LAB_145857a94:
                    bVar5 = *(byte *)(plVar10 + 0x13);
                    uStack_5c = 0;
                    uStack_c8 = uVar2;
                    if (((byte)uStack_60 < 0xb) &&
                       ((~(byte)(0x5df >> ((byte)uStack_60 & 0x1f)) & 1) == 0 && uStack_a0 != 0)) {
                      lVar14 = (ulonglong)(uint)(iVar7 << 6) +
                               *(longlong *)(&DAT_14702be30 + uVar12 * 8);
                      uVar19 = 0;
                      uStack_5c = 0;
                      uVar17 = uStack_a0;
                      lStack_d0 = lVar14;
                      bStack_49 = bVar5;
                      do {
                        lVar15 = *(longlong *)(lStack_78 + uVar19 * 0x10);
                        if ((*(byte *)(lVar15 + 0x98) < bVar5) &&
                           (lVar20 = *(longlong *)(lVar14 + 0x38), lVar20 != 0)) {
                          lStack_128 = uVar19 * 0x10 + lStack_78;
                          lVar16 = *(longlong *)(lVar14 + 0x30);
                          uStack_138 = *(undefined8 *)(lVar15 + 0x30);
                          lVar15 = *(longlong *)(lVar15 + 0x38);
                          lVar13 = 0;
                          do {
                            if ((*(longlong *)(lVar16 + 0x38 + lVar13) == lVar15) &&
                               (iVar7 = func_0x000145d14601(*(undefined8 *)(lVar16 + 0x30 + lVar13),
                                                            uStack_138,lVar15), iVar7 == 0)) {
                              uStack_5c = uStack_5c + *(byte *)(lStack_128 + 8);
                              lVar14 = lStack_d0;
                              uVar12 = uStack_58;
                              uVar17 = uStack_a0;
                              bVar5 = bStack_49;
                              break;
                            }
                            lVar13 = lVar13 + 0xa0;
                            lVar14 = lStack_d0;
                            uVar12 = uStack_58;
                            uVar17 = uStack_a0;
                            bVar5 = bStack_49;
                          } while (lVar20 * 0xa0 != lVar13);
                        }
                        uVar19 = uVar19 + 1;
                      } while (uVar19 != uVar17);
                    }
                    uVar2 = uStack_c8;
                    if (((uint)bVar5 + (uint)bVar5 * 4 <= uStack_5c) &&
                       (lVar14 = FUN_145856ab0(&uStack_98,uStack_d8,uStack_c8,lVar3), lVar14 == 0))
                    {
                      uStack_4d = (undefined1)uStack_d8;
                      if ((undefined1 *)*plVar10 != (undefined1 *)0x0) {
                        pbStack_f8 = (byte *)plVar10[1];
                        uStack_e8 = (undefined4)plVar10[2];
                        uStack_e4 = *(undefined4 *)((longlong)plVar10 + 0x14);
                        uStack_e0 = (undefined4)plVar10[3];
                        uStack_dc = *(undefined4 *)((longlong)plVar10 + 0x1c);
                        puStack_108 = (undefined1 *)0x1;
                        uStack_f0 = 1;
                        puStack_100 = (undefined1 *)*plVar10;
                        cVar6 = FUN_1458074a0(&puStack_108,&uStack_4d,&uStack_98);
                        if (cVar6 == '\0') goto LAB_145857810;
                      }
                      if (((byte)uStack_60 < 0xb) && ((0x5dfU >> ((uint)uVar12 & 0x1f) & 1) != 0)) {
                        lVar14 = *(longlong *)(&DAT_14702be30 + uVar12 * 8);
                        if (*(longlong *)(lVar14 + 0x38) == 0) {
LAB_145857cbf:
                          if (*(longlong *)(lVar14 + 0x78) != 0) {
                            lVar15 = *(longlong *)(lVar14 + 0x70);
                            lVar20 = *(longlong *)(lVar14 + 0x78) * 0xa0;
                            do {
                              if ((*(longlong *)(lVar15 + 0x38) == lVar3) &&
                                 (iVar7 = func_0x000145d14601(*(undefined8 *)(lVar15 + 0x30),uVar2,
                                                              lVar3), iVar7 == 0))
                              goto LAB_145857d5d;
                              lVar15 = lVar15 + 0xa0;
                              lVar20 = lVar20 + -0xa0;
                            } while (lVar20 != 0);
                          }
                          if (*(longlong *)(lVar14 + 0xb8) != 0) {
                            lVar15 = *(longlong *)(lVar14 + 0xb0);
                            lVar14 = *(longlong *)(lVar14 + 0xb8) * 0xa0;
                            do {
                              if ((*(longlong *)(lVar15 + 0x38) == lVar3) &&
                                 (iVar7 = func_0x000145d14601(*(undefined8 *)(lVar15 + 0x30),uVar2,
                                                              lVar3), iVar7 == 0))
                              goto LAB_145857d5d;
                              lVar15 = lVar15 + 0xa0;
                              lVar14 = lVar14 + -0xa0;
                            } while (lVar14 != 0);
                          }
                        }
                        else {
                          lVar15 = *(longlong *)(lVar14 + 0x30);
                          lVar20 = *(longlong *)(lVar14 + 0x38) * 0xa0;
                          while ((*(longlong *)(lVar15 + 0x38) != lVar3 ||
                                 (iVar7 = func_0x000145d14601(*(undefined8 *)(lVar15 + 0x30),uVar2,
                                                              lVar3), iVar7 != 0))) {
                            lVar15 = lVar15 + 0xa0;
                            lVar20 = lVar20 + -0xa0;
                            if (lVar20 == 0) goto LAB_145857cbf;
                          }
LAB_145857d5d:
                          uVar12 = uStack_88;
                          lVar14 = uStack_90;
                          lVar20 = uStack_88 * 0x10;
                          if (uStack_88 != 0) {
                            lVar16 = 0;
                            do {
                              if ((*(longlong *)(*(longlong *)(lVar14 + lVar16) + 0x38) == lVar3) &&
                                 (iVar7 = func_0x000145d14601(*(undefined8 *)
                                                               (*(longlong *)(lVar14 + lVar16) +
                                                               0x30),uStack_c8,lVar3), iVar7 == 0))
                              {
                                pcVar1 = (char *)(lVar14 + 8 + lVar16);
                                *pcVar1 = *pcVar1 + '\x01';
                                goto LAB_145857810;
                              }
                              lVar16 = lVar16 + 0x10;
                            } while (lVar20 != lVar16);
                          }
                          if (uVar12 == uStack_98) {
                            FUN_145d151d0(&uStack_98);
                            lVar14 = uStack_90;
                          }
                          *(longlong *)(lVar14 + lVar20) = lVar15;
                          *(undefined1 *)(lVar14 + 8 + lVar20) = 1;
                          uStack_88 = uVar12 + 1;
                        }
                      }
                    }
                  }
                }
                else {
                  if (uStack_88 < 4) {
                    uVar12 = 0;
                    uVar9 = 0;
LAB_1458579f1:
                    uVar17 = 0;
                    do {
                      uVar9 = uVar9 + *(byte *)(uVar12 * 0x10 + uStack_90 + 8 + uVar17);
                      uVar17 = uVar17 + 0x10;
                    } while (((uint)uStack_88 & 3) << 4 != uVar17);
                  }
                  else {
                    pbVar18 = (byte *)(uStack_90 + 0x38);
                    uVar12 = 0;
                    uVar9 = 0;
                    do {
                      uVar9 = (uint)*pbVar18 +
                              (uint)pbVar18[-0x10] + (uint)pbVar18[-0x20] + pbVar18[-0x30] + uVar9;
                      uVar12 = uVar12 + 4;
                      pbVar18 = pbVar18 + 0x40;
                    } while ((uStack_88 & 0xfffffffffffffffc) != uVar12);
                    if ((uStack_88 & 3) != 0) goto LAB_1458579f1;
                  }
                  if (uVar9 < uStack_7c) {
                    lVar14 = uStack_88 << 4;
                    lVar15 = 0;
                    while ((*(longlong *)(*(longlong *)(lStack_78 + lVar15) + 0x38) != lVar3 ||
                           (iVar8 = func_0x000145d14601(*(undefined8 *)
                                                         (*(longlong *)(lStack_78 + lVar15) + 0x30),
                                                        uVar2,lVar3), iVar8 != 0))) {
                      lVar15 = lVar15 + 0x10;
                      if (lVar14 == lVar15) {
                        bVar5 = 0;
LAB_145857a7d:
                        uVar12 = uStack_58;
                        if (bVar5 < *(byte *)((longlong)plVar10 + 0x9a)) goto LAB_145857a94;
                        goto LAB_145857810;
                      }
                    }
                    bVar5 = *(byte *)(lStack_78 + 8 + lVar15);
                    goto LAB_145857a7d;
                  }
                }
              }
            }
LAB_145857810:
            cVar6 = (char)uStack_ac + '\x01';
            uVar4 = CONCAT31((int3)((uint)uStack_ac >> 8),cVar6);
          } while (cVar6 != cStack_4c);
        }
        plVar10 = plStack_120 + 3;
      } while (plVar10 != plStack_118);
    }
    if (lStack_a8 != 0) {
      func_0x0001400021d0(plStack_70,lStack_a8 * 0x18,8);
    }
    puStack_110[2] = uStack_88;
    *(undefined4 *)puStack_110 = (undefined4)uStack_98;
    *(undefined4 *)((longlong)puStack_110 + 4) = uStack_98._4_4_;
    *(undefined4 *)(puStack_110 + 1) = (undefined4)uStack_90;
    *(undefined4 *)((longlong)puStack_110 + 0xc) = uStack_90._4_4_;
    lVar3 = *plStack_c0;
    puVar11 = puStack_b8;
    param_1 = puStack_110;
    if (lVar3 == 0) {
      return puStack_110;
    }
  }
  else {
    *param_1 = 0;
    param_1[1] = 8;
    param_1[2] = 0;
    lVar3 = *param_2;
    if (lVar3 == 0) {
      return param_1;
    }
    puVar11 = (undefined1 *)param_2[1];
  }
  func_0x0001400021d0(puVar11,lVar3 << 4,8);
  return param_1;
LAB_145857930:
  plVar10 = plVar10 + 0x14;
  lVar14 = lVar14 + -0xa0;
  if (lVar14 == 0) goto LAB_145857810;
  goto LAB_145857944;
}
