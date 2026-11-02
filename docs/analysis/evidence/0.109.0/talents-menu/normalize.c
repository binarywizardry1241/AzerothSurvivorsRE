undefined8 *
FUN_1459106e0(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 *param_4,uint param_5,
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
  long lVar16;
  ulong uVar17;
  byte *pbVar18;
  ulong uVar19;
  long local_148;
  long *local_140;
  ulong local_138;
  undefined8 local_130;
  long local_128;
  long local_120;
  long *local_118;
  long *local_110;
  undefined8 *local_108;
  undefined1 *local_100;
  undefined1 *local_f8;
  byte *local_f0;
  undefined8 local_e8;
  undefined4 local_e0;
  undefined4 uStack_dc;
  undefined4 uStack_d8;
  undefined4 uStack_d4;
  ulong local_d0;
  long local_c8;
  long *local_c0;
  undefined1 *local_b8;
  undefined4 local_b0;
  uint local_ac;
  long local_a8;
  undefined8 local_a0;
  undefined8 uStack_98;
  ulong local_90;
  undefined8 local_88;
  long *local_80;
  undefined1 local_71;
  uint local_70;
  uint local_6c;
  ulong local_68;
  ulong local_60;
  long local_58;
  undefined1 local_4d;
  char local_4c;
  undefined1 local_4b;
  byte local_4a;
  byte local_49;
  undefined8 local_48;

  local_48 = 0xfffffffffffffffe;
  local_4a = (byte)param_5;
  if ((local_4a < 0xc) && ((0xbbeU >> (param_5 & 0x1f) & 1) != 0)) {
    local_100 = (undefined1 *)param_3[1];
    local_f8 = local_100 + param_3[2] * 0x10;
    local_f0 = &local_4a;
    local_c0 = param_3;
    local_b8 = local_100;
    FUN_1459bfb40(param_1,param_4,&local_100,&local_148);
    local_80 = local_140;
    local_100 = &local_71;
    if (1 < local_138) {
      if (local_138 < 0x15) {
        FUN_1459af300();
      }
      else {
        local_4b = 1;
        func_0x0001459ded30();
      }
    }
    local_a0 = 0;
    uStack_98 = 8;
    local_90 = 0;
    local_a8 = local_148;
    local_108 = param_4;
    if (local_138 != 0) {
      local_110 = local_80 + local_138 * 3;
      plVar10 = local_80;
      local_ac = param_6;
      do {
        local_128 = *plVar10;
        if (local_128 == 0) break;
        local_4c = (char)plVar10[2];
        local_118 = plVar10;
        if (local_4c != '\0') {
          uVar4 = 0;
          do {
            local_b0 = uVar4;
            local_d0 = (ulong)local_4a;
            local_70 = local_4a - 1;
            if (((byte)local_70 < 0xb) &&
               (uVar11 = (ulong)(byte)local_70, (0x5dfU >> (local_70 & 0x1f) & 1) != 0)) {
              uVar2 = *(undefined8 *)(local_128 + 0x20);
              lVar3 = *(long *)(local_128 + 0x28);
              lVar13 = *(long *)(uVar11 * 8 + 0x1472293d8);
              local_68 = uVar11;
              if (*(long *)(lVar13 + 0x38) != 0) {
                plVar10 = *(long **)(lVar13 + 0x30);
                lVar14 = *(long *)(lVar13 + 0x38) * 0x78;
                do {
                  if ((plVar10[5] == lVar3) && (iVar7 = func_0x000145bfa0e1(), iVar7 == 0)) {
                    iVar7 = 0;
                    uVar11 = local_68;
                    goto LAB_14591095c;
                  }
                  plVar10 = plVar10 + 0xf;
                  lVar14 = lVar14 + -0x78;
                } while (lVar14 != 0);
              }
              if (*(long *)(lVar13 + 0x78) != 0) {
                plVar10 = *(long **)(lVar13 + 0x70);
                lVar14 = *(long *)(lVar13 + 0x78) * 0x78;
                do {
                  if ((plVar10[5] == lVar3) && (iVar7 = func_0x000145bfa0e1(), iVar7 == 0)) {
                    iVar7 = 1;
                    uVar11 = local_68;
                    goto LAB_14591095c;
                  }
                  plVar10 = plVar10 + 0xf;
                  lVar14 = lVar14 + -0x78;
                } while (lVar14 != 0);
              }
              if (*(long *)(lVar13 + 0xb8) != 0) {
                plVar10 = *(long **)(lVar13 + 0xb0);
                lVar13 = *(long *)(lVar13 + 0xb8) * 0x78;
                uVar11 = local_68;
LAB_14591093e:
                if ((plVar10[5] != lVar3) || (iVar7 = func_0x000145bfa0e1(), iVar7 != 0))
                goto LAB_145910930;
                iVar7 = 2;
LAB_14591095c:
                local_58 = uStack_98;
                local_60 = local_90;
                local_88 = uVar2;
                if (local_90 == 0) {
                  if ((param_6 != 0) && (*(char *)((long)plVar10 + 0x72) != '\0')) {
LAB_145910aaa:
                    bVar5 = *(byte *)(plVar10 + 0xe);
                    local_6c = 0;
                    if (((byte)local_70 < 0xb) &&
                       ((~(byte)(0x5df >> ((byte)local_70 & 0x1f)) & 1) == 0 && local_60 != 0)) {
                      lVar13 = (ulong)(uint)(iVar7 << 6) + *(long *)(uVar11 * 8 + 0x1472293d8);
                      uVar19 = 0;
                      local_6c = 0;
                      uVar17 = local_60;
                      local_c8 = lVar13;
                      local_49 = bVar5;
                      do {
                        lVar14 = *(long *)(local_58 + uVar19 * 0x10);
                        if ((*(byte *)(lVar14 + 0x70) < bVar5) &&
                           (lVar15 = *(long *)(lVar13 + 0x38), lVar15 != 0)) {
                          local_120 = uVar19 * 0x10 + local_58;
                          lVar16 = *(long *)(lVar13 + 0x30);
                          local_130 = *(undefined8 *)(lVar14 + 0x20);
                          lVar14 = *(long *)(lVar14 + 0x28);
                          lVar12 = 0;
                          do {
                            if ((*(long *)(lVar16 + 0x28 + lVar12) == lVar14) &&
                               (iVar7 = func_0x000145bfa0e1(), iVar7 == 0)) {
                              local_6c = local_6c + *(byte *)(local_120 + 8);
                              lVar13 = local_c8;
                              uVar11 = local_68;
                              uVar17 = local_60;
                              bVar5 = local_49;
                              break;
                            }
                            lVar12 = lVar12 + 0x78;
                            lVar13 = local_c8;
                            uVar11 = local_68;
                            uVar17 = local_60;
                            bVar5 = local_49;
                          } while (lVar15 * 0x78 - lVar12 != 0);
                        }
                        uVar19 = uVar19 + 1;
                      } while (uVar19 != uVar17);
                    }
                    param_6 = local_ac;
                    if (((uint)bVar5 + (uint)bVar5 * 4 <= local_6c) &&
                       (lVar13 = FUN_14590fb00(), lVar13 == 0)) {
                      local_4d = (undefined1)local_d0;
                      if ((undefined1 *)*plVar10 != (undefined1 *)0x0) {
                        local_f0 = (byte *)plVar10[1];
                        local_e0 = (undefined4)plVar10[2];
                        uStack_dc = *(undefined4 *)((long)plVar10 + 0x14);
                        uStack_d8 = (undefined4)plVar10[3];
                        uStack_d4 = *(undefined4 *)((long)plVar10 + 0x1c);
                        local_100 = (undefined1 *)0x1;
                        local_e8 = 1;
                        local_f8 = (undefined1 *)*plVar10;
                        cVar6 = FUN_1459a00c0();
                        if (cVar6 == '\0') goto LAB_145910820;
                      }
                      if (((byte)local_70 < 0xb) && ((0x5dfU >> ((uint)uVar11 & 0x1f) & 1) != 0)) {
                        lVar13 = *(long *)(uVar11 * 8 + 0x1472293d8);
                        if (*(long *)(lVar13 + 0x38) == 0) {
LAB_145910ca5:
                          if (*(long *)(lVar13 + 0x78) != 0) {
                            lVar14 = *(long *)(lVar13 + 0x70);
                            lVar15 = *(long *)(lVar13 + 0x78) * 0x78;
                            do {
                              if ((*(long *)(lVar14 + 0x28) == lVar3) &&
                                 (iVar7 = func_0x000145bfa0e1(lVar15,lVar14,local_88,
                                                              *(undefined8 *)(lVar14 + 0x20),lVar3),
                                 iVar7 == 0)) goto LAB_145910d38;
                              lVar14 = lVar14 + 0x78;
                              lVar15 = lVar15 + -0x78;
                            } while (lVar15 != 0);
                          }
                          if (*(long *)(lVar13 + 0xb8) != 0) {
                            lVar14 = *(long *)(lVar13 + 0xb0);
                            lVar13 = *(long *)(lVar13 + 0xb8) * 0x78;
                            do {
                              if ((*(long *)(lVar14 + 0x28) == lVar3) &&
                                 (iVar7 = func_0x000145bfa0e1(lVar13,lVar14,local_88,
                                                              *(undefined8 *)(lVar14 + 0x20),lVar3),
                                 iVar7 == 0)) goto LAB_145910d38;
                              lVar14 = lVar14 + 0x78;
                              lVar13 = lVar13 + -0x78;
                            } while (lVar13 != 0);
                          }
                        }
                        else {
                          lVar14 = *(long *)(lVar13 + 0x30);
                          lVar15 = *(long *)(lVar13 + 0x38) * 0x78;
                          while ((*(long *)(lVar14 + 0x28) != lVar3 ||
                                 (iVar7 = func_0x000145bfa0e1(lVar15,lVar14,local_88,
                                                              *(undefined8 *)(lVar14 + 0x20),lVar3),
                                 iVar7 != 0))) {
                            lVar14 = lVar14 + 0x78;
                            lVar15 = lVar15 + -0x78;
                            if (lVar15 == 0) goto LAB_145910ca5;
                          }
LAB_145910d38:
                          lVar13 = local_60 * 0x10;
                          if (local_60 != 0) {
                            lVar15 = 0;
                            do {
                              if ((*(long *)(*(long *)(local_58 + lVar15) + 0x28) == lVar3) &&
                                 (iVar7 = func_0x000145bfa0e1(), iVar7 == 0)) {
                                pcVar1 = (char *)(local_58 + 8 + lVar15);
                                *pcVar1 = *pcVar1 + '\x01';
                                goto LAB_145910820;
                              }
                              lVar15 = lVar15 + 0x10;
                            } while (lVar13 != lVar15);
                          }
                          if (local_60 == local_a0) {
                            func_0x000145bfaef0();
                            local_58 = uStack_98;
                          }
                          *(long *)(local_58 + lVar13) = lVar14;
                          *(undefined1 *)(local_58 + 8 + lVar13) = 1;
                          local_90 = local_60 + 1;
                        }
                      }
                    }
                  }
                }
                else {
                  if (local_90 < 4) {
                    uVar11 = 0;
                    uVar9 = 0;
LAB_1459109f1:
                    uVar17 = 0;
                    do {
                      uVar9 = uVar9 + *(byte *)(uVar11 * 0x10 + uStack_98 + 8 + uVar17);
                      uVar17 = uVar17 + 0x10;
                    } while (((uint)local_90 & 3) << 4 != uVar17);
                  }
                  else {
                    pbVar18 = (byte *)(uStack_98 + 0x38);
                    uVar11 = 0;
                    uVar9 = 0;
                    do {
                      uVar9 = (uint)*pbVar18 +
                              (uint)pbVar18[-0x10] + (uint)pbVar18[-0x20] + pbVar18[-0x30] + uVar9;
                      uVar11 = uVar11 + 4;
                      pbVar18 = pbVar18 + 0x40;
                    } while ((local_90 & 0xfffffffffffffffc) != uVar11);
                    if ((local_90 & 3) != 0) goto LAB_1459109f1;
                  }
                  if (uVar9 < param_6) {
                    lVar13 = local_90 << 4;
                    lVar14 = 0;
                    while ((*(long *)(*(long *)(local_58 + lVar14) + 0x28) != lVar3 ||
                           (iVar8 = func_0x000145bfa0e1(), iVar8 != 0))) {
                      lVar14 = lVar14 + 0x10;
                      if (lVar13 == lVar14) {
                        bVar5 = 0;
LAB_145910a8d:
                        uVar11 = local_68;
                        if (bVar5 < *(byte *)((long)plVar10 + 0x72)) goto LAB_145910aaa;
                        goto LAB_145910820;
                      }
                    }
                    bVar5 = *(byte *)(local_58 + 8 + lVar14);
                    goto LAB_145910a8d;
                  }
                }
              }
            }
LAB_145910820:
            cVar6 = (char)local_b0 + '\x01';
            uVar4 = CONCAT31((int3)((uint)local_b0 >> 8),cVar6);
          } while (cVar6 != local_4c);
        }
        plVar10 = local_118 + 3;
      } while (plVar10 != local_110);
    }
    if (local_a8 != 0) {
      func_0x0001400021d0();
    }
    local_108[2] = local_90;
    *(undefined4 *)local_108 = (undefined4)local_a0;
    *(undefined4 *)((long)local_108 + 4) = local_a0._4_4_;
    *(undefined4 *)(local_108 + 1) = (undefined4)uStack_98;
    *(undefined4 *)((long)local_108 + 0xc) = uStack_98._4_4_;
    lVar3 = *local_c0;
    param_4 = local_108;
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
LAB_145910930:
  plVar10 = plVar10 + 0xf;
  lVar13 = lVar13 + -0x78;
  if (lVar13 == 0) goto LAB_145910820;
  goto LAB_14591093e;
}
