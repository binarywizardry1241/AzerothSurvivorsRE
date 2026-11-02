undefined8 *
entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 *param_4,uint param_5,
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
  long local_150;
  long *local_148;
  ulong local_140;
  undefined8 local_138;
  long local_130;
  long local_128;
  long *local_120;
  long *local_118;
  undefined8 *local_110;
  undefined1 *local_108;
  undefined1 *local_100;
  byte *local_f8;
  undefined8 local_f0;
  undefined4 local_e8;
  undefined4 uStack_e4;
  undefined4 uStack_e0;
  undefined4 uStack_dc;
  ulong local_d8;
  long local_d0;
  undefined8 local_c8;
  long *local_c0;
  undefined1 *local_b8;
  undefined4 local_ac;
  long local_a8;
  ulong local_a0;
  undefined8 local_98;
  undefined8 uStack_90;
  ulong local_88;
  uint local_7c;
  long local_78;
  long *local_70;
  undefined1 local_61;
  uint local_60;
  uint local_5c;
  ulong local_58;
  undefined1 local_4d;
  char local_4c;
  undefined1 local_4b;
  byte local_4a;
  byte local_49;
  undefined8 local_48;

  local_48 = 0xfffffffffffffffe;
  local_4a = (byte)param_5;
  local_7c = param_6;
  if ((local_4a < 0xc) && ((0xbbeU >> (param_5 & 0x1f) & 1) != 0)) {
    local_108 = (undefined1 *)param_3[1];
    local_100 = local_108 + param_3[2] * 0x10;
    local_f8 = &local_4a;
    local_c0 = param_3;
    local_b8 = local_108;
    func_0x00014599f9f0(param_1,param_4,&local_108,&local_150);
    local_70 = local_148;
    local_108 = &local_61;
    if (1 < local_140) {
      if (local_140 < 0x15) {
        func_0x0001459822f0();
      }
      else {
        local_4b = 1;
        func_0x000145988a30();
      }
    }
    local_98 = 0;
    uStack_90 = 8;
    local_88 = 0;
    local_a8 = local_150;
    local_110 = param_4;
    if (local_140 != 0) {
      local_118 = local_70 + local_140 * 3;
      plVar10 = local_70;
      do {
        local_130 = *plVar10;
        if (local_130 == 0) break;
        local_4c = (char)plVar10[2];
        local_120 = plVar10;
        if (local_4c != '\0') {
          uVar4 = 0;
          do {
            local_ac = uVar4;
            local_d8 = (ulong)local_4a;
            local_60 = local_4a - 1;
            if (((byte)local_60 < 0xb) &&
               (uVar11 = (ulong)(byte)local_60, (0x5dfU >> (local_60 & 0x1f) & 1) != 0)) {
              uVar2 = *(undefined8 *)(local_130 + 0x20);
              lVar3 = *(long *)(local_130 + 0x28);
              lVar13 = *(long *)(uVar11 * 8 + 0x146e77fc0);
              local_58 = uVar11;
              if (*(long *)(lVar13 + 0x38) != 0) {
                plVar10 = *(long **)(lVar13 + 0x30);
                lVar14 = *(long *)(lVar13 + 0x38) * 0x78;
                do {
                  if ((plVar10[5] == lVar3) && (iVar7 = func_0x000145bc9787(), iVar7 == 0)) {
                    iVar7 = 0;
                    uVar11 = local_58;
                    goto LAB_1458e2eec;
                  }
                  plVar10 = plVar10 + 0xf;
                  lVar14 = lVar14 + -0x78;
                } while (lVar14 != 0);
              }
              if (*(long *)(lVar13 + 0x78) != 0) {
                plVar10 = *(long **)(lVar13 + 0x70);
                lVar14 = *(long *)(lVar13 + 0x78) * 0x78;
                do {
                  if ((plVar10[5] == lVar3) && (iVar7 = func_0x000145bc9787(), iVar7 == 0)) {
                    iVar7 = 1;
                    uVar11 = local_58;
                    goto LAB_1458e2eec;
                  }
                  plVar10 = plVar10 + 0xf;
                  lVar14 = lVar14 + -0x78;
                } while (lVar14 != 0);
              }
              if (*(long *)(lVar13 + 0xb8) != 0) {
                plVar10 = *(long **)(lVar13 + 0xb0);
                lVar13 = *(long *)(lVar13 + 0xb8) * 0x78;
                uVar11 = local_58;
LAB_1458e2ece:
                if ((plVar10[5] != lVar3) || (iVar7 = func_0x000145bc9787(), iVar7 != 0))
                goto LAB_1458e2ec0;
                iVar7 = 2;
LAB_1458e2eec:
                local_78 = uStack_90;
                local_a0 = local_88;
                if (local_88 == 0) {
                  if ((local_7c != 0) && (*(char *)((long)plVar10 + 0x72) != '\0')) {
LAB_1458e3021:
                    bVar5 = *(byte *)(plVar10 + 0xe);
                    local_5c = 0;
                    local_c8 = uVar2;
                    if (((byte)local_60 < 0xb) &&
                       ((~(byte)(0x5df >> ((byte)local_60 & 0x1f)) & 1) == 0 && local_a0 != 0)) {
                      lVar13 = (ulong)(uint)(iVar7 << 6) + *(long *)(uVar11 * 8 + 0x146e77fc0);
                      uVar19 = 0;
                      local_5c = 0;
                      uVar17 = local_a0;
                      local_d0 = lVar13;
                      local_49 = bVar5;
                      do {
                        lVar14 = *(long *)(local_78 + uVar19 * 0x10);
                        if ((*(byte *)(lVar14 + 0x70) < bVar5) &&
                           (lVar15 = *(long *)(lVar13 + 0x38), lVar15 != 0)) {
                          local_128 = uVar19 * 0x10 + local_78;
                          lVar16 = *(long *)(lVar13 + 0x30);
                          local_138 = *(undefined8 *)(lVar14 + 0x20);
                          lVar14 = *(long *)(lVar14 + 0x28);
                          lVar12 = 0;
                          do {
                            if ((*(long *)(lVar16 + 0x28 + lVar12) == lVar14) &&
                               (iVar7 = func_0x000145bc9787(), iVar7 == 0)) {
                              local_5c = local_5c + *(byte *)(local_128 + 8);
                              lVar13 = local_d0;
                              uVar11 = local_58;
                              uVar17 = local_a0;
                              bVar5 = local_49;
                              break;
                            }
                            lVar12 = lVar12 + 0x78;
                            lVar13 = local_d0;
                            uVar11 = local_58;
                            uVar17 = local_a0;
                            bVar5 = local_49;
                          } while (lVar15 * 0x78 - lVar12 != 0);
                        }
                        uVar19 = uVar19 + 1;
                      } while (uVar19 != uVar17);
                    }
                    uVar2 = local_c8;
                    if (((uint)bVar5 + (uint)bVar5 * 4 <= local_5c) &&
                       (lVar13 = func_0x0001458e2070(), lVar13 == 0)) {
                      local_4d = (undefined1)local_d8;
                      if ((undefined1 *)*plVar10 != (undefined1 *)0x0) {
                        local_f8 = (byte *)plVar10[1];
                        local_e8 = (undefined4)plVar10[2];
                        uStack_e4 = *(undefined4 *)((long)plVar10 + 0x14);
                        uStack_e0 = (undefined4)plVar10[3];
                        uStack_dc = *(undefined4 *)((long)plVar10 + 0x1c);
                        local_108 = (undefined1 *)0x1;
                        local_f0 = 1;
                        local_100 = (undefined1 *)*plVar10;
                        cVar6 = func_0x0001458b9220();
                        if (cVar6 == '\0') goto LAB_1458e2da0;
                      }
                      if (((byte)local_60 < 0xb) && ((0x5dfU >> ((uint)uVar11 & 0x1f) & 1) != 0)) {
                        lVar13 = *(long *)(uVar11 * 8 + 0x146e77fc0);
                        if (*(long *)(lVar13 + 0x38) == 0) {
LAB_1458e3228:
                          if (*(long *)(lVar13 + 0x78) != 0) {
                            lVar14 = *(long *)(lVar13 + 0x70);
                            lVar15 = *(long *)(lVar13 + 0x78) * 0x78;
                            do {
                              if ((*(long *)(lVar14 + 0x28) == lVar3) &&
                                 (iVar7 = func_0x000145bc9787(lVar15,lVar14,uVar2,
                                                              *(undefined8 *)(lVar14 + 0x20),lVar3),
                                 iVar7 == 0)) goto LAB_1458e32b7;
                              lVar14 = lVar14 + 0x78;
                              lVar15 = lVar15 + -0x78;
                            } while (lVar15 != 0);
                          }
                          if (*(long *)(lVar13 + 0xb8) != 0) {
                            lVar14 = *(long *)(lVar13 + 0xb0);
                            lVar13 = *(long *)(lVar13 + 0xb8) * 0x78;
                            do {
                              if ((*(long *)(lVar14 + 0x28) == lVar3) &&
                                 (iVar7 = func_0x000145bc9787(lVar13,lVar14,uVar2,
                                                              *(undefined8 *)(lVar14 + 0x20),lVar3),
                                 iVar7 == 0)) goto LAB_1458e32b7;
                              lVar14 = lVar14 + 0x78;
                              lVar13 = lVar13 + -0x78;
                            } while (lVar13 != 0);
                          }
                        }
                        else {
                          lVar14 = *(long *)(lVar13 + 0x30);
                          lVar15 = *(long *)(lVar13 + 0x38) * 0x78;
                          while ((*(long *)(lVar14 + 0x28) != lVar3 ||
                                 (iVar7 = func_0x000145bc9787(lVar15,lVar14,uVar2,
                                                              *(undefined8 *)(lVar14 + 0x20),lVar3),
                                 iVar7 != 0))) {
                            lVar14 = lVar14 + 0x78;
                            lVar15 = lVar15 + -0x78;
                            if (lVar15 == 0) goto LAB_1458e3228;
                          }
LAB_1458e32b7:
                          uVar11 = local_88;
                          lVar13 = uStack_90;
                          lVar15 = local_88 * 0x10;
                          if (local_88 != 0) {
                            lVar16 = 0;
                            do {
                              if ((*(long *)(*(long *)(lVar13 + lVar16) + 0x28) == lVar3) &&
                                 (iVar7 = func_0x000145bc9787(), iVar7 == 0)) {
                                pcVar1 = (char *)(lVar13 + 8 + lVar16);
                                *pcVar1 = *pcVar1 + '\x01';
                                goto LAB_1458e2da0;
                              }
                              lVar16 = lVar16 + 0x10;
                            } while (lVar15 != lVar16);
                          }
                          if (uVar11 == local_98) {
                            func_0x000145bcb680();
                            lVar13 = uStack_90;
                          }
                          *(long *)(lVar13 + lVar15) = lVar14;
                          *(undefined1 *)(lVar13 + 8 + lVar15) = 1;
                          local_88 = uVar11 + 1;
                        }
                      }
                    }
                  }
                }
                else {
                  if (local_88 < 4) {
                    uVar11 = 0;
                    uVar9 = 0;
LAB_1458e2f81:
                    uVar17 = 0;
                    do {
                      uVar9 = uVar9 + *(byte *)(uVar11 * 0x10 + uStack_90 + 8 + uVar17);
                      uVar17 = uVar17 + 0x10;
                    } while (((uint)local_88 & 3) << 4 != uVar17);
                  }
                  else {
                    pbVar18 = (byte *)(uStack_90 + 0x38);
                    uVar11 = 0;
                    uVar9 = 0;
                    do {
                      uVar9 = (uint)*pbVar18 +
                              (uint)pbVar18[-0x10] + (uint)pbVar18[-0x20] + pbVar18[-0x30] + uVar9;
                      uVar11 = uVar11 + 4;
                      pbVar18 = pbVar18 + 0x40;
                    } while ((local_88 & 0xfffffffffffffffc) != uVar11);
                    if ((local_88 & 3) != 0) goto LAB_1458e2f81;
                  }
                  if (uVar9 < local_7c) {
                    lVar13 = local_88 << 4;
                    lVar14 = 0;
                    while ((*(long *)(*(long *)(local_78 + lVar14) + 0x28) != lVar3 ||
                           (iVar8 = func_0x000145bc9787(), iVar8 != 0))) {
                      lVar14 = lVar14 + 0x10;
                      if (lVar13 == lVar14) {
                        bVar5 = 0;
LAB_1458e300d:
                        uVar11 = local_58;
                        if (bVar5 < *(byte *)((long)plVar10 + 0x72)) goto LAB_1458e3021;
                        goto LAB_1458e2da0;
                      }
                    }
                    bVar5 = *(byte *)(local_78 + 8 + lVar14);
                    goto LAB_1458e300d;
                  }
                }
              }
            }
LAB_1458e2da0:
            cVar6 = (char)local_ac + '\x01';
            uVar4 = CONCAT31((int3)((uint)local_ac >> 8),cVar6);
          } while (cVar6 != local_4c);
        }
        plVar10 = local_120 + 3;
      } while (plVar10 != local_118);
    }
    if (local_a8 != 0) {
      func_0x0001400021d0();
    }
    local_110[2] = local_88;
    *(undefined4 *)local_110 = (undefined4)local_98;
    *(undefined4 *)((long)local_110 + 4) = local_98._4_4_;
    *(undefined4 *)(local_110 + 1) = (undefined4)uStack_90;
    *(undefined4 *)((long)local_110 + 0xc) = uStack_90._4_4_;
    lVar3 = *local_c0;
    param_4 = local_110;
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
LAB_1458e2ec0:
  plVar10 = plVar10 + 0xf;
  lVar13 = lVar13 + -0x78;
  if (lVar13 == 0) goto LAB_1458e2da0;
  goto LAB_1458e2ece;
}
