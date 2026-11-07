/* WARNING: Removing unreachable block (ram,0x0001458e25bf) */
/* WARNING: Removing unreachable block (ram,0x0001458e23e2) */
/* WARNING: Removing unreachable block (ram,0x0001458e264f) */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 *param_4)

{
  byte bVar1;
  undefined2 uVar2;
  byte *pbVar3;
  ulong uVar4;
  ulong uVar5;
  ulong uVar6;
  long lVar7;
  ulong uVar8;
  uint uVar9;
  uint uVar10;
  uint uVar11;
  long lVar12;
  long lVar13;
  long lVar14;
  long lVar15;
  char cVar19;
  char cVar20;
  undefined1 auVar16 [16];
  undefined1 auVar17 [16];
  undefined1 auVar18 [16];
  undefined1 auVar21 [16];
  long *local_88;
  char *local_80;
  undefined8 *local_78;
  undefined8 local_70;
  long local_68;
  undefined8 local_60;
  undefined4 local_58;
  undefined8 local_54;
  undefined4 local_4c;
  undefined8 local_48;
  undefined8 local_40;

  lVar7 = *param_3;
  uVar6 = param_3[2];
  if (uVar6 < 0xfffffffffffffffc) {
    uVar4 = param_3[1];
    if (((uVar6 + 4 <= uVar4) &&
        (func_0x000145bcdeb0(lVar7,param_4,lVar7 + uVar6,&local_88,4), (int)local_88 != 1)) &&
       (local_78 != (undefined8 *)0x0)) {
      if (local_78 == (undefined8 *)0x1) {
        cVar19 = *local_80;
        if ((cVar19 == '+') || (cVar19 == '-')) goto LAB_1458e2452;
      }
      else {
        cVar19 = *local_80;
      }
      uVar5 = (ulong)(cVar19 == '+');
      uVar8 = (long)local_78 - uVar5;
      pbVar3 = (byte *)(local_80 + uVar5);
      if (uVar8 < 9) {
        if (local_78 == (undefined8 *)uVar5) {
          uVar10 = 0;
        }
        else {
          bVar1 = *pbVar3;
          uVar10 = bVar1 - 0x30;
          if (0x39 < bVar1) {
            uVar10 = (bVar1 - 0x41 & 0xffffffdf) + 10;
          }
          if (0xf < uVar10) goto LAB_1458e2452;
          if (uVar8 != 1) {
            bVar1 = pbVar3[1];
            uVar9 = bVar1 - 0x30;
            if (0x39 < bVar1) {
              uVar9 = (bVar1 - 0x41 & 0xffffffdf) + 10;
            }
            if (0xf < uVar9) goto LAB_1458e2452;
            uVar10 = uVar9 | uVar10 << 4;
            if (uVar8 != 2) {
              bVar1 = pbVar3[2];
              uVar9 = bVar1 - 0x30;
              if (0x39 < bVar1) {
                uVar9 = (bVar1 - 0x41 & 0xffffffdf) + 10;
              }
              if (0xf < uVar9) goto LAB_1458e2452;
              uVar10 = uVar9 | uVar10 << 4;
              if (uVar8 != 3) {
                bVar1 = pbVar3[3];
                uVar9 = bVar1 - 0x30;
                if (0x39 < bVar1) {
                  uVar9 = (bVar1 - 0x41 & 0xffffffdf) + 10;
                }
                if (0xf < uVar9) goto LAB_1458e2452;
                uVar10 = uVar9 | uVar10 << 4;
                if (uVar8 != 4) {
                  bVar1 = pbVar3[4];
                  uVar9 = bVar1 - 0x30;
                  if (0x39 < bVar1) {
                    uVar9 = (bVar1 - 0x41 & 0xffffffdf) + 10;
                  }
                  if (0xf < uVar9) goto LAB_1458e2452;
                  uVar10 = uVar9 | uVar10 << 4;
                  if (uVar8 != 5) {
                    bVar1 = pbVar3[5];
                    uVar9 = bVar1 - 0x30;
                    if (0x39 < bVar1) {
                      uVar9 = (bVar1 - 0x41 & 0xffffffdf) + 10;
                    }
                    if (0xf < uVar9) goto LAB_1458e2452;
                    uVar10 = uVar9 | uVar10 << 4;
                    if (uVar8 != 6) {
                      bVar1 = pbVar3[6];
                      uVar9 = bVar1 - 0x30;
                      if (0x39 < bVar1) {
                        uVar9 = (bVar1 - 0x41 & 0xffffffdf) + 10;
                      }
                      if (0xf < uVar9) goto LAB_1458e2452;
                      uVar10 = uVar9 | uVar10 << 4;
                      if (uVar8 != 7) {
                        bVar1 = pbVar3[7];
                        uVar9 = bVar1 - 0x30;
                        if (0x39 < bVar1) {
                          uVar9 = (bVar1 - 0x41 & 0xffffffdf) + 10;
                        }
                        if (0xf < uVar9) goto LAB_1458e2452;
                        uVar10 = uVar9 | uVar10 << 4;
                      }
                    }
                  }
                }
              }
            }
          }
        }
LAB_1458e25f9:
        param_3[2] = uVar6 + 4;
        *(uint *)(param_4 + 1) = uVar10;
        *param_4 = 0xffffffffffffffff;
        return;
      }
      uVar10 = 0;
      lVar12 = 0;
      do {
        if (lVar12 == (long)local_78 - uVar5) goto LAB_1458e25f9;
        if (0xfffffff < uVar10) break;
        uVar11 = uVar10 * 0x10;
        bVar1 = pbVar3[lVar12];
        uVar9 = bVar1 - 0x30;
        if (0x39 < bVar1) {
          uVar9 = (bVar1 - 0x41 & 0xffffffdf) + 10;
        }
        uVar10 = uVar9 + uVar11;
        lVar12 = lVar12 + 1;
      } while (!CARRY4(uVar9,uVar11) && uVar9 < 0x10);
    }
  }
  else {
    uVar4 = param_3[1];
  }
LAB_1458e2452:
  local_48 = 0x146beaec2;
  local_40 = 0xd;
  if (uVar4 < uVar6) {
    uVar6 = uVar4;
  }
  if (uVar6 == 0) {
    local_68 = 0;
  }
  else {
    if (3 < uVar6) {
      uVar4 = uVar6 & 0xfffffffffffffffc;
      lVar12 = 0;
      lVar13 = 0;
      uVar5 = 0;
      lVar14 = 0;
      lVar15 = 0;
      do {
        uVar2 = *(undefined2 *)(lVar7 + 2 + uVar5);
        auVar16[0] = -((char)*(undefined2 *)(lVar7 + uVar5) == DAT_14605b690);
        cVar19 = -((char)((ushort)*(undefined2 *)(lVar7 + uVar5) >> 8) == cRam000000014605b691);
        cVar20 = -(cRam000000014605b697 == '\0');
        auVar16._8_8_ =
             (undefined8)
             (CONCAT72(CONCAT61(CONCAT51(CONCAT41(CONCAT31(CONCAT21(CONCAT11(cVar20,cVar20),
                                                                    -(cRam000000014605b696 == '\0'))
                                                           ,-(cRam000000014605b696 == '\0')),
                                                  -(cRam000000014605b695 == '\0')),
                                         -(cRam000000014605b695 == '\0')),
                                -(cRam000000014605b694 == '\0')),
                       CONCAT11(-(cRam000000014605b694 == '\0'),cVar20)) >> 8);
        auVar16[7] = -(cRam000000014605b693 == '\0');
        auVar16[6] = -(cRam000000014605b693 == '\0');
        auVar16[5] = -(cRam000000014605b692 == '\0');
        auVar16[4] = -(cRam000000014605b692 == '\0');
        auVar16[3] = cVar19;
        auVar16[2] = cVar19;
        auVar16[1] = auVar16[0];
        auVar16 = pshuflw(auVar16,auVar16,0xd4);
        auVar17._12_4_ = auVar16._12_4_;
        auVar17._0_8_ = auVar16._0_8_;
        auVar17._8_4_ = auVar16._4_4_;
        auVar17 = auVar17 & _DAT_145d977d0;
        lVar14 = lVar14 + auVar17._0_8_;
        lVar15 = lVar15 + auVar17._8_8_;
        auVar21[0] = -((char)uVar2 == DAT_14605b690);
        cVar19 = -((char)((ushort)uVar2 >> 8) == cRam000000014605b691);
        cVar20 = -(cRam000000014605b697 == '\0');
        auVar21._8_8_ =
             (undefined8)
             (CONCAT72(CONCAT61(CONCAT51(CONCAT41(CONCAT31(CONCAT21(CONCAT11(cVar20,cVar20),
                                                                    -(cRam000000014605b696 == '\0'))
                                                           ,-(cRam000000014605b696 == '\0')),
                                                  -(cRam000000014605b695 == '\0')),
                                         -(cRam000000014605b695 == '\0')),
                                -(cRam000000014605b694 == '\0')),
                       CONCAT11(-(cRam000000014605b694 == '\0'),cVar20)) >> 8);
        auVar21[7] = -(cRam000000014605b693 == '\0');
        auVar21[6] = -(cRam000000014605b693 == '\0');
        auVar21[5] = -(cRam000000014605b692 == '\0');
        auVar21[4] = -(cRam000000014605b692 == '\0');
        auVar21[3] = cVar19;
        auVar21[2] = cVar19;
        auVar21[1] = auVar21[0];
        auVar16 = pshuflw(auVar17,auVar21,0xd4);
        auVar18._12_4_ = auVar16._12_4_;
        auVar18._0_8_ = auVar16._0_8_;
        auVar18._8_4_ = auVar16._4_4_;
        lVar12 = lVar12 + SUB168(auVar18 & _DAT_145d977d0,0);
        lVar13 = lVar13 + SUB168(auVar18 & _DAT_145d977d0,8);
        uVar5 = uVar5 + 4;
      } while (uVar4 != uVar5);
      local_68 = lVar13 + lVar15 + lVar12 + lVar14;
      goto LAB_1458e26d7;
    }
    uVar4 = 0;
    local_68 = 0;
    do {
      local_68 = local_68 + (ulong)(*(char *)(lVar7 + uVar4) == '\n');
      uVar4 = uVar4 + 1;
LAB_1458e26d7:
    } while (uVar6 != uVar4);
  }
  local_68 = local_68 + 1;
  local_88 = &local_68;
  local_80 = (char *)0x145bd8030;
  local_78 = &local_48;
  local_70 = 0x1400020c0;
  func_0x000145bc5690();
  *(undefined4 *)((long)param_4 + 0x14) = local_4c;
  *(undefined8 *)((long)param_4 + 0xc) = local_54;
  *param_4 = local_60;
  *(undefined4 *)(param_4 + 1) = local_58;
  return;
}
