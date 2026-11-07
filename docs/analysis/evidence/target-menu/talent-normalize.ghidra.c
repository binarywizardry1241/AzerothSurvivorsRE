
undefined8 *
entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 *param_4,uint param_5,
     uint param_6)

{
  char *pcVar1;
  undefined8 uVar2;
  long lVar3;
  long lVar4;
  undefined4 uVar5;
  char cVar6;
  byte bVar7;
  int iVar8;
  int iVar9;
  uint uVar10;
  long *plVar11;
  ulong uVar12;
  long extraout_RDX;
  long lVar13;
  long lVar14;
  undefined8 *puVar15;
  long lVar16;
  long lVar17;
  long lVar18;
  ulong uVar19;
  byte *pbVar20;
  ulong uVar21;
  long local_118;
  long *local_110;
  ulong local_108;
  undefined8 local_100;
  undefined8 *local_f8;
  long local_f0;
  long *local_e8;
  long *local_e0;
  undefined8 *local_d8;
  ulong local_d0;
  long local_c8;
  long *local_c0;
  long local_b8;
  undefined4 local_b0;
  uint local_ac;
  long local_a8;
  undefined8 local_a0;
  undefined8 uStack_98;
  byte *local_90;
  undefined8 local_88;
  long *local_80;
  undefined1 local_71;
  uint local_70;
  uint local_6c;
  ulong local_68;
  ulong local_60;
  long local_58;
  char local_4c;
  undefined1 local_4b;
  byte local_4a;
  byte local_49;
  undefined8 local_48;

  local_48 = 0xfffffffffffffffe;
  local_4a = (byte)param_5;
  if ((local_4a < 0xc) && ((0xbbeU >> (param_5 & 0x1f) & 1) != 0)) {
    local_b8 = param_3[1];
    uStack_98 = param_3[2] * 0x10 + local_b8;
    local_90 = &local_4a;
    local_c0 = param_3;
    local_a0 = (undefined1 *)local_b8;
    func_0x00014553b8e0(param_4,param_2,&local_a0,&local_118);
    local_80 = local_110;
    local_a0 = &local_71;
    if (1 < local_108) {
      if (local_108 < 0x15) {
        func_0x000145507670();
      }
      else {
        local_4b = 1;
        func_0x000145481d00();
      }
    }
    local_a0 = (undefined1 *)0x0;
    uStack_98 = 8;
    local_90 = (byte *)0x0;
    local_a8 = local_118;
    local_d8 = param_4;
    if (local_108 != 0) {
      local_e0 = local_80 + local_108 * 3;
      plVar11 = local_80;
      local_ac = param_6;
      do {
        local_f8 = (undefined8 *)*plVar11;
        if (local_f8 == (undefined8 *)0x0) break;
        local_4c = (char)plVar11[2];
        local_e8 = plVar11;
        if (local_4c != '\0') {
          uVar5 = 0;
          do {
            local_b0 = uVar5;
            local_d0 = (ulong)local_4a;
            local_70 = local_4a - 1;
            if (((byte)local_70 < 0xb) &&
               (uVar12 = (ulong)(byte)local_70, (0x5dfU >> (local_70 & 0x1f) & 1) != 0)) {
              uVar2 = *local_f8;
              lVar3 = local_f8[1];
              lVar13 = *(long *)(uVar12 * 8 + 0x1469f5878);
              local_60 = uVar12;
              if (*(long *)(lVar13 + 0x38) != 0) {
                lVar17 = *(long *)(lVar13 + 0x30);
                lVar16 = *(long *)(lVar13 + 0x38) * 0x68;
                do {
                  if ((*(long *)(lVar17 + 8) == lVar3) &&
                     (iVar8 = func_0x0001457731e7(), iVar8 == 0)) {
                    iVar8 = 0;
                    uVar12 = local_60;
                    goto LAB_14548422c;
                  }
                  lVar17 = lVar17 + 0x68;
                  lVar16 = lVar16 + -0x68;
                } while (lVar16 != 0);
              }
              if (*(long *)(lVar13 + 0x78) != 0) {
                lVar17 = *(long *)(lVar13 + 0x70);
                lVar16 = *(long *)(lVar13 + 0x78) * 0x68;
                do {
                  if ((*(long *)(lVar17 + 8) == lVar3) &&
                     (iVar8 = func_0x0001457731e7(), iVar8 == 0)) {
                    iVar8 = 1;
                    uVar12 = local_60;
                    goto LAB_14548422c;
                  }
                  lVar17 = lVar17 + 0x68;
                  lVar16 = lVar16 + -0x68;
                } while (lVar16 != 0);
              }
              if (*(long *)(lVar13 + 0xb8) != 0) {
                lVar17 = *(long *)(lVar13 + 0xb0);
                lVar13 = *(long *)(lVar13 + 0xb8) * 0x68;
                uVar12 = local_60;
LAB_14548420e:
                if ((*(long *)(lVar17 + 8) != lVar3) || (iVar8 = func_0x0001457731e7(), iVar8 != 0))
                goto LAB_145484200;
                iVar8 = 2;
LAB_14548422c:
                local_58 = uStack_98;
                local_68 = (ulong)local_90;
                local_88 = uVar2;
                if (local_90 == (byte *)0x0) {
                  if ((param_6 != 0) && (*(char *)(lVar17 + 0x62) != '\0')) {
LAB_145484360:
                    bVar7 = *(byte *)(lVar17 + 0x60);
                    local_6c = 0;
                    if (((byte)local_70 < 0xb) &&
                       ((~(byte)(0x5df >> ((byte)local_70 & 0x1f)) & 1) == 0 && local_68 != 0)) {
                      lVar13 = (ulong)(uint)(iVar8 << 6) + *(long *)(uVar12 * 8 + 0x1469f5878);
                      uVar21 = 0;
                      local_6c = 0;
                      uVar19 = local_68;
                      local_c8 = lVar13;
                      local_49 = bVar7;
                      do {
                        puVar15 = *(undefined8 **)(local_58 + uVar21 * 0x10);
                        if ((*(byte *)(puVar15 + 0xc) < bVar7) &&
                           (lVar16 = *(long *)(lVar13 + 0x38), lVar16 != 0)) {
                          local_f0 = uVar21 * 0x10 + local_58;
                          lVar18 = *(long *)(lVar13 + 0x30);
                          local_100 = *puVar15;
                          lVar4 = puVar15[1];
                          lVar14 = 0;
                          do {
                            if ((*(long *)(lVar18 + 8 + lVar14) == lVar4) &&
                               (iVar8 = func_0x0001457731e7(), iVar8 == 0)) {
                              local_6c = local_6c + *(byte *)(local_f0 + 8);
                              lVar13 = local_c8;
                              uVar12 = local_60;
                              uVar19 = local_68;
                              bVar7 = local_49;
                              break;
                            }
                            lVar14 = lVar14 + 0x68;
                            lVar13 = local_c8;
                            uVar12 = local_60;
                            uVar19 = local_68;
                            bVar7 = local_49;
                          } while (lVar16 * 0x68 - lVar14 != 0);
                        }
                        uVar21 = uVar21 + 1;
                      } while (uVar21 != uVar19);
                    }
                    param_6 = local_ac;
                    if (((uint)bVar7 + (uint)bVar7 * 4 <= local_6c) &&
                       (lVar13 = func_0x0001454834e0(), lVar13 == 0)) {
                      if (*(long *)(lVar17 + 0x50) == 0) goto LAB_14548452c;
                      lVar13 = *(long *)(lVar17 + 0x58);
                      func_0x000145486f60();
                      if (extraout_RDX != 0) {
                        if (local_68 == 0) {
                          uVar12 = local_60;
                          if (*(char *)(extraout_RDX + 0x62) == '\0') goto LAB_14548452c;
                        }
                        else {
                          lVar17 = local_68 << 4;
                          lVar16 = 0;
                          do {
                            if ((*(long *)(*(long *)(local_58 + lVar16) + 8) == lVar13) &&
                               (iVar8 = func_0x0001457731e7(), iVar8 == 0)) {
                              bVar7 = *(byte *)(local_58 + 8 + lVar16);
                              goto LAB_145484506;
                            }
                            lVar16 = lVar16 + 0x10;
                          } while (lVar17 != lVar16);
                          bVar7 = 0;
LAB_145484506:
                          uVar12 = local_60;
                          if (*(byte *)(extraout_RDX + 0x62) <= bVar7) {
LAB_14548452c:
                            if (((byte)local_70 < 0xb) &&
                               ((0x5dfU >> ((uint)uVar12 & 0x1f) & 1) != 0)) {
                              lVar13 = *(long *)(uVar12 * 8 + 0x1469f5878);
                              if (*(long *)(lVar13 + 0x38) == 0) {
LAB_145484588:
                                if (*(long *)(lVar13 + 0x78) != 0) {
                                  puVar15 = *(undefined8 **)(lVar13 + 0x70);
                                  lVar17 = *(long *)(lVar13 + 0x78) * 0x68;
                                  do {
                                    if ((puVar15[1] == lVar3) &&
                                       (iVar8 = func_0x0001457731e7(lVar17,puVar15,local_88,*puVar15
                                                                    ,lVar3), iVar8 == 0))
                                    goto LAB_145484617;
                                    puVar15 = puVar15 + 0xd;
                                    lVar17 = lVar17 + -0x68;
                                  } while (lVar17 != 0);
                                }
                                if (*(long *)(lVar13 + 0xb8) != 0) {
                                  puVar15 = *(undefined8 **)(lVar13 + 0xb0);
                                  lVar13 = *(long *)(lVar13 + 0xb8) * 0x68;
                                  do {
                                    if ((puVar15[1] == lVar3) &&
                                       (iVar8 = func_0x0001457731e7(lVar13,puVar15,local_88,*puVar15
                                                                    ,lVar3), iVar8 == 0))
                                    goto LAB_145484617;
                                    puVar15 = puVar15 + 0xd;
                                    lVar13 = lVar13 + -0x68;
                                  } while (lVar13 != 0);
                                }
                              }
                              else {
                                puVar15 = *(undefined8 **)(lVar13 + 0x30);
                                lVar17 = *(long *)(lVar13 + 0x38) * 0x68;
                                while ((puVar15[1] != lVar3 ||
                                       (iVar8 = func_0x0001457731e7(lVar17,puVar15,local_88,*puVar15
                                                                    ,lVar3), iVar8 != 0))) {
                                  puVar15 = puVar15 + 0xd;
                                  lVar17 = lVar17 + -0x68;
                                  if (lVar17 == 0) goto LAB_145484588;
                                }
LAB_145484617:
                                lVar13 = local_68 * 0x10;
                                if (local_68 != 0) {
                                  lVar17 = 0;
                                  do {
                                    if ((*(long *)(*(long *)(local_58 + lVar17) + 8) == lVar3) &&
                                       (iVar8 = func_0x0001457731e7(), iVar8 == 0)) {
                                      pcVar1 = (char *)(local_58 + 8 + lVar17);
                                      *pcVar1 = *pcVar1 + '\x01';
                                      goto LAB_145484100;
                                    }
                                    lVar17 = lVar17 + 0x10;
                                  } while (lVar13 != lVar17);
                                }
                                uVar12 = local_68;
                                if ((undefined1 *)local_68 == local_a0) {
                                  func_0x000145774860();
                                  local_58 = uStack_98;
                                }
                                *(undefined8 **)(local_58 + lVar13) = puVar15;
                                *(undefined1 *)(local_58 + 8 + lVar13) = 1;
                                local_90 = (byte *)(uVar12 + 1);
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
                else {
                  if (local_90 < 4) {
                    uVar12 = 0;
                    uVar10 = 0;
LAB_1454842c1:
                    uVar19 = 0;
                    do {
                      uVar10 = uVar10 + *(byte *)(uVar12 * 0x10 + uStack_98 + 8 + uVar19);
                      uVar19 = uVar19 + 0x10;
                    } while (((uint)local_90 & 3) << 4 != uVar19);
                  }
                  else {
                    pbVar20 = (byte *)(uStack_98 + 0x38);
                    uVar12 = 0;
                    uVar10 = 0;
                    do {
                      uVar10 = (uint)*pbVar20 +
                               (uint)pbVar20[-0x10] + (uint)pbVar20[-0x20] + pbVar20[-0x30] + uVar10
                      ;
                      uVar12 = uVar12 + 4;
                      pbVar20 = pbVar20 + 0x40;
                    } while (((ulong)local_90 & 0xfffffffffffffffc) != uVar12);
                    if (((ulong)local_90 & 3) != 0) goto LAB_1454842c1;
                  }
                  if (uVar10 < param_6) {
                    lVar13 = (long)local_90 << 4;
                    lVar16 = 0;
                    while ((*(long *)(*(long *)(local_58 + lVar16) + 8) != lVar3 ||
                           (iVar9 = func_0x0001457731e7(), iVar9 != 0))) {
                      lVar16 = lVar16 + 0x10;
                      if (lVar13 == lVar16) {
                        bVar7 = 0;
LAB_145484346:
                        uVar12 = local_60;
                        if (bVar7 < *(byte *)(lVar17 + 0x62)) goto LAB_145484360;
                        goto LAB_145484100;
                      }
                    }
                    bVar7 = *(byte *)(local_58 + 8 + lVar16);
                    goto LAB_145484346;
                  }
                }
              }
            }
LAB_145484100:
            cVar6 = (char)local_b0 + '\x01';
            uVar5 = CONCAT31((int3)((uint)local_b0 >> 8),cVar6);
          } while (cVar6 != local_4c);
        }
        plVar11 = local_e8 + 3;
      } while (plVar11 != local_e0);
    }
    if (local_a8 != 0) {
      func_0x0001400021d0();
    }
    local_d8[2] = local_90;
    *(undefined4 *)local_d8 = (undefined4)local_a0;
    *(undefined4 *)((long)local_d8 + 4) = local_a0._4_4_;
    *(undefined4 *)(local_d8 + 1) = (undefined4)uStack_98;
    *(undefined4 *)((long)local_d8 + 0xc) = uStack_98._4_4_;
    lVar3 = *local_c0;
    param_4 = local_d8;
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
LAB_145484200:
  lVar17 = lVar17 + 0x68;
  lVar13 = lVar13 + -0x68;
  if (lVar13 == 0) goto LAB_145484100;
  goto LAB_14548420e;
}
