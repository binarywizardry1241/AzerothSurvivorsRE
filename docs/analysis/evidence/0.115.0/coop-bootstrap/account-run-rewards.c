/* WARNING: Removing unreachable block (ram,0x0001458c3b72) */
/* WARNING: Removing unreachable block (ram,0x0001458c3afa) */
/* WARNING: Removing unreachable block (ram,0x0001458c3b0e) */
/* WARNING: Type propagation algorithm not settling */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

long * entry(undefined8 param_1,undefined8 param_2,ulong param_3,long *param_4)

{
  int *piVar1;
  long *plVar2;
  code *pcVar3;
  undefined1 uVar4;
  int iVar5;
  long lVar6;
  long lVar7;
  undefined1 uVar8;
  uint uVar9;
  uint uVar10;
  ulong uVar11;
  long lVar12;
  long *plVar13;
  ulong uVar14;
  byte bVar15;
  byte bVar16;
  ulong uVar17;
  long lVar18;
  char cVar19;
  uint uVar20;
  long lVar21;
  long lVar22;
  long lVar23;
  undefined4 in_XMM6_Da;
  float fVar24;
  long local_128;
  byte *local_120;
  ulong local_118;
  undefined8 local_110;
  undefined8 uStack_108;
  undefined4 *local_100;
  undefined4 local_f8;
  undefined4 uStack_f4;
  undefined4 uStack_f0;
  undefined4 uStack_ec;
  long local_e8;
  ulong local_e0;
  long local_d8;
  ulong local_d0;
  long local_c8;
  uint local_bc;
  long local_b8;
  long local_b0;
  ulong local_a8;
  long local_a0;
  long *local_98;
  ulong local_90;
  ulong local_88;
  uint local_7c;
  ulong local_78;
  ulong local_70;
  uint local_68;
  uint local_64;
  undefined8 local_60;
  undefined4 local_58;

  local_60 = 0xfffffffffffffffe;
  local_58 = in_XMM6_Da;
  func_0x0001459d92d0();
  uVar17 = *(ulong *)(param_3 + 0x118);
  if (0x7ffffffffffffffc < uVar17 * 4 || uVar17 >> 0x3e != 0) {
LAB_1458c338d:
    func_0x000145eb6fcb();
                    /* WARNING: Does not return */
    pcVar3 = (code *)invalidInstructionException();
    (*pcVar3)();
  }
  local_98 = param_4;
  if (uVar17 * 4 == 0) {
    lVar6 = 4;
    uVar11 = 0;
  }
  else {
    func_0x000140002200();
    lVar6 = func_0x0001400021c0();
    uVar11 = uVar17;
    if (lVar6 == 0) goto LAB_1458c338d;
  }
  if (uVar17 != 0) {
    func_0x000145d145fb();
  }
  local_e8 = (long)local_100;
  local_f8 = (undefined4)local_110;
  uStack_f4 = local_110._4_4_;
  uStack_f0 = (undefined4)uStack_108;
  uStack_ec = uStack_108._4_4_;
  fVar24 = 0.0;
  if (local_100 == (undefined4 *)0x0) {
    local_7c = 0;
    uVar10 = 0;
    uVar14 = 0;
    uVar20 = 0;
  }
  else {
    lVar7 = (long)local_100 << 5;
    lVar18 = 0;
    do {
      if ((*(long *)(uStack_108 + 0x10 + lVar18) == 7) &&
         (piVar1 = *(int **)(uStack_108 + 8 + lVar18),
         *(int *)((long)piVar1 + 3) == 0x736c6c6f && *piVar1 == 0x6f726572)) {
        uVar14 = (ulong)*(byte *)(uStack_108 + 0x18 + lVar18);
        goto LAB_1458c3463;
      }
      lVar18 = lVar18 + 0x20;
    } while (lVar7 != lVar18);
    uVar14 = 0;
LAB_1458c3463:
    lVar18 = 0;
    do {
      if ((*(long *)(uStack_108 + 0x10 + lVar18) == 6) &&
         (piVar1 = *(int **)(uStack_108 + 8 + lVar18),
         (short)piVar1[1] == 0x6873 && *piVar1 == 0x696e6162)) {
        uVar10 = (uint)*(byte *)(uStack_108 + 0x18 + lVar18);
        goto LAB_1458c34a6;
      }
      lVar18 = lVar18 + 0x20;
    } while (lVar7 != lVar18);
    uVar10 = 0;
LAB_1458c34a6:
    lVar18 = 0;
    do {
      if ((*(long *)(uStack_108 + 0x10 + lVar18) == 4) &&
         (**(int **)(uStack_108 + 8 + lVar18) == 0x70696b73)) {
        uVar20 = (uint)*(byte *)(uStack_108 + 0x18 + lVar18);
        goto LAB_1458c34da;
      }
      lVar18 = lVar18 + 0x20;
    } while (lVar7 != lVar18);
    uVar20 = 0;
LAB_1458c34da:
    lVar18 = 0;
    do {
      if ((*(long *)(uStack_108 + 0x10 + lVar18) == 7) &&
         (piVar1 = *(int **)(uStack_108 + 8 + lVar18),
         *(int *)((long)piVar1 + 3) == 0x676e696e && *piVar1 == 0x6e65706f)) {
        local_7c = (uint)*(byte *)(uStack_108 + 0x18 + lVar18);
        goto LAB_1458c3529;
      }
      lVar18 = lVar18 + 0x20;
    } while (lVar7 != lVar18);
    local_7c = 0;
LAB_1458c3529:
    lVar18 = 0;
    do {
      if ((*(long *)(uStack_108 + 0x10 + lVar18) == 4) &&
         (**(int **)(uStack_108 + 8 + lVar18) == 0x6e65656b)) {
        fVar24 = (float)*(byte *)(uStack_108 + 0x18 + lVar18) * _DAT_145ef0570;
        break;
      }
      lVar18 = lVar18 + 0x20;
    } while (lVar7 != lVar18);
  }
  local_110 = 0x147034d18;
  uStack_108 = 0x147034d60;
  local_100 = &local_f8;
  plVar13 = local_98;
  local_e0 = uVar11;
  local_d8 = lVar6;
  local_d0 = uVar17;
  local_90 = param_3;
  func_0x0001459c30d0(local_98,uVar10,&local_110);
  lVar18 = local_e8;
  lVar6 = CONCAT44(uStack_ec,uStack_f0);
  lVar7 = local_e8 << 5;
  uVar17 = 0;
  local_bc = (uint)uVar14;
  if (local_e8 == 0) {
LAB_1458c37c0:
    bVar16 = 0xff;
  }
  else {
    lVar12 = 0;
    do {
      if ((*(long *)(lVar6 + 0x10 + lVar12) == 9) &&
         (plVar2 = *(long **)(lVar6 + 8 + lVar12),
         (char)plVar2[1] == 'n' && *plVar2 == 0x6f696e61706d6f63)) {
        uVar17 = (ulong)(*(char *)(lVar6 + 0x18 + lVar12) != '\0');
        break;
      }
      lVar12 = lVar12 + 0x20;
    } while (lVar7 != lVar12);
    uVar11 = 0;
    lVar12 = 0;
    do {
      if ((*(long *)(lVar6 + 0x10 + lVar12) == 6) &&
         (piVar1 = *(int **)(lVar6 + 8 + lVar12),
         (short)piVar1[1] == 0x646e && *piVar1 == 0x6f636573)) {
        uVar11 = (ulong)(*(char *)(lVar6 + 0x18 + lVar12) != '\0');
        break;
      }
      lVar12 = lVar12 + 0x20;
    } while (lVar7 != lVar12);
    uVar17 = uVar17 + uVar11;
    if (uVar17 == 0) goto LAB_1458c37c0;
    local_88 = *(ulong *)(local_90 + 0x130);
    if (local_88 == 0) {
      local_b8 = 0;
    }
    else {
      local_78 = *(ulong *)(local_90 + 0x128);
      local_70 = uVar17;
      local_b8 = func_0x00014583ed80();
      uVar17 = local_70;
      if (local_b8 == 0) {
        local_b8 = 0;
      }
      else if (*(long *)(local_b8 + 0x40) != 0) {
        uVar11 = *(ulong *)(local_90 + 0xb8);
        lVar12 = 0;
        local_68 = uVar10;
        local_64 = uVar20;
        if (uVar11 == 0) {
          local_b8 = 0;
        }
        else {
          lVar22 = *(long *)(local_90 + 0xb0);
          uVar17 = *(ulong *)(local_b8 + 0x48);
          local_c8 = lVar7;
          if (uVar11 != 1) {
            lVar12 = 0;
            local_b0 = *(long *)(local_b8 + 0x40);
            local_a8 = *(ulong *)(local_b8 + 0x48);
            do {
              uVar14 = uVar11 >> 1;
              lVar21 = lVar12 + uVar14;
              uVar17 = *(ulong *)(lVar22 + 0x10 + lVar21 * 0x18);
              lVar7 = uVar17 - local_a8;
              if (local_a8 <= uVar17) {
                uVar17 = local_a8;
              }
              local_a0 = lVar12;
              iVar5 = func_0x000145d14601(uVar14,uVar11,local_b0,
                                          *(undefined8 *)(lVar22 + 8 + lVar21 * 0x18),uVar17);
              if (iVar5 != 0) {
                lVar7 = (long)iVar5;
              }
              lVar12 = lVar21;
              if (0 < lVar7) {
                lVar12 = local_a0;
              }
              uVar11 = uVar11 - uVar14;
              uVar17 = local_a8;
            } while (1 < uVar11);
          }
          lVar12 = *(long *)(lVar22 + 0x10 + lVar12 * 0x18) - uVar17;
          iVar5 = func_0x000145d14601();
          if (iVar5 != 0) {
            lVar12 = (long)iVar5;
          }
          lVar7 = local_c8;
          plVar13 = local_98;
          uVar17 = local_70;
          uVar20 = local_64;
          uVar10 = local_68;
          if (lVar12 != 0) {
            local_b8 = 0;
          }
        }
      }
    }
    uVar14 = 0x14703aac8;
    if (local_b8 == 0) {
      local_b8 = 0x14703aac8;
    }
    if (local_118 == 0) {
      uVar9 = 0;
      bVar16 = 0;
    }
    else {
      bVar16 = *local_120;
      uVar9 = (uint)bVar16;
    }
    if (uVar17 != 1) {
      if (local_88 < 2) {
joined_r0x0001458c3b16:
        bVar16 = (byte)uVar9;
joined_r0x0001458c3b7a:
        cVar19 = (char)uVar20;
        uVar14 = 0x14703aac8;
      }
      else {
        local_70 = local_118;
        local_88 = CONCAT44(local_88._4_4_,uVar9);
        uVar17 = func_0x00014583ed80();
        if (uVar17 == 0) {
          uVar17 = 0;
        }
        else {
          lVar12 = *(long *)(uVar17 + 0x40);
          if (lVar12 != 0) {
            uVar11 = *(ulong *)(local_90 + 0xb8);
            lVar22 = 0;
            local_64 = uVar20;
            local_68 = uVar10;
            bVar16 = (byte)local_88;
            local_118 = local_70;
            if (uVar11 == 0) goto joined_r0x0001458c3b7a;
            lVar21 = *(long *)(local_90 + 0xb0);
            uVar14 = *(ulong *)(uVar17 + 0x48);
            local_78 = uVar17;
            if (uVar11 != 1) {
              lVar22 = 0;
              local_a8 = *(ulong *)(uVar17 + 0x48);
              local_a0 = *(long *)(local_90 + 0xb0);
              do {
                local_90 = uVar11 >> 1;
                lVar23 = lVar22 + local_90;
                uVar17 = *(ulong *)(local_a0 + 0x10 + lVar23 * 0x18);
                lVar21 = uVar17 - local_a8;
                if (local_a8 <= uVar17) {
                  uVar17 = local_a8;
                }
                local_b0 = lVar22;
                iVar5 = func_0x000145d14601(lVar12,uVar11,lVar12,
                                            *(undefined8 *)(local_a0 + 8 + lVar23 * 0x18),uVar17);
                if (iVar5 != 0) {
                  lVar21 = (long)iVar5;
                }
                lVar22 = lVar23;
                if (0 < lVar21) {
                  lVar22 = local_b0;
                }
                uVar11 = uVar11 - local_90;
                lVar21 = local_a0;
                uVar14 = local_a8;
              } while (1 < uVar11);
            }
            lVar12 = *(long *)(lVar21 + 0x10 + lVar22 * 0x18) - uVar14;
            iVar5 = func_0x000145d14601();
            if (iVar5 != 0) {
              lVar12 = (long)iVar5;
            }
            uVar9 = (uint)local_88;
            uVar17 = local_78;
            plVar13 = local_98;
            uVar20 = local_64;
            uVar10 = local_68;
            local_118 = local_70;
            if (lVar12 != 0) goto joined_r0x0001458c3b16;
          }
        }
        cVar19 = (char)uVar20;
        uVar14 = 0x14703aac8;
        bVar16 = (byte)local_88;
        local_118 = local_70;
        if (uVar17 != 0) {
          uVar14 = uVar17;
        }
      }
      if (local_118 < 2) {
        bVar15 = 0;
      }
      else {
        bVar15 = local_120[1];
      }
      goto joined_r0x0001458c3b5b;
    }
  }
  cVar19 = (char)uVar20;
  bVar15 = 0xff;
joined_r0x0001458c3b5b:
  if (local_128 != 0) {
    func_0x0001400021d0();
    lVar6 = CONCAT44(uStack_ec,uStack_f0);
    lVar7 = local_e8 << 5;
    lVar18 = local_e8;
  }
  if (lVar18 == 0) {
    uVar4 = 0;
  }
  else {
    lVar12 = 0;
    do {
      if ((*(long *)(lVar6 + 0x10 + lVar12) == 5) &&
         (piVar1 = *(int **)(lVar6 + 8 + lVar12), (char)piVar1[1] == 'h' && *piVar1 == 0x7361656c))
      {
        uVar4 = *(undefined1 *)(lVar6 + 0x18 + lVar12);
        goto LAB_1458c3842;
      }
      lVar12 = lVar12 + 0x20;
    } while (lVar7 != lVar12);
    uVar4 = 0;
LAB_1458c3842:
    lVar12 = 0;
    do {
      if ((*(long *)(lVar6 + 0x10 + lVar12) == 4) && (**(int **)(lVar6 + 8 + lVar12) == 0x73776170))
      {
        uVar8 = *(undefined1 *)(lVar6 + 0x18 + lVar12);
        goto LAB_1458c387a;
      }
      lVar12 = lVar12 + 0x20;
    } while (lVar7 != lVar12);
  }
  uVar8 = 0;
LAB_1458c387a:
  *(bool *)((long)plVar13 + 0x2e) = cVar19 != '\0';
  *(bool *)((long)plVar13 + 0x2f) = (char)local_7c != '\0';
  *(uint *)(plVar13 + 4) = local_bc & 0xff;
  *(uint *)((long)plVar13 + 0x24) = uVar10 & 0xff;
  *(float *)(plVar13 + 5) = fVar24;
  *plVar13 = local_b8;
  *(byte *)(plVar13 + 1) = bVar16;
  plVar13[2] = uVar14;
  *(byte *)(plVar13 + 3) = bVar15;
  *(undefined1 *)((long)plVar13 + 0x2c) = uVar4;
  *(undefined1 *)((long)plVar13 + 0x2d) = uVar8;
  if (lVar18 != 0) {
    lVar6 = lVar6 + 8;
    do {
      if (*(long *)(lVar6 + -8) != 0) {
        func_0x0001400021d0();
      }
      lVar6 = lVar6 + 0x20;
      lVar18 = lVar18 + -1;
    } while (lVar18 != 0);
  }
  if (CONCAT44(uStack_f4,local_f8) != 0) {
    func_0x0001400021d0();
  }
  if (local_e0 != 0) {
    func_0x0001400021d0();
  }
  return plVar13;
}
