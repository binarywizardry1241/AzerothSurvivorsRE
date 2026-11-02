
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,char *param_3,undefined8 param_4,long param_5)

{
  ulong uVar1;
  byte *pbVar2;
  undefined4 *puVar3;
  byte bVar4;
  long *plVar5;
  code *pcVar6;
  undefined8 uVar7;
  undefined1 *puVar8;
  long lVar9;
  long lVar10;
  uint uVar11;
  short *psVar12;
  short *psVar13;
  undefined1 *puVar14;
  uint uVar15;
  byte *pbVar16;
  undefined1 *puVar17;
  ulong uVar18;
  undefined1 *puVar19;
  bool bVar20;
  undefined4 in_XMM6_Da;
  undefined4 uVar21;
  undefined4 uVar22;
  undefined4 uVar23;
  undefined4 uVar24;
  undefined1 auVar25 [16];
  undefined8 local_308;
  undefined8 uStack_300;
  undefined8 uStack_2f8;
  undefined8 local_e8;
  undefined4 uStack_e0;
  undefined4 uStack_dc;
  uint local_d8;
  undefined4 uStack_d4;
  undefined4 local_b8;
  undefined4 uStack_b4;
  undefined4 uStack_b0;
  undefined4 uStack_ac;
  undefined4 local_a4;
  undefined4 uStack_a0;
  undefined3 uStack_9c;
  undefined1 *local_98;
  undefined1 *local_90;
  long local_88;
  ulong uStack_80;
  long local_78;
  undefined1 local_63;
  undefined1 local_62;
  undefined1 local_61;
  undefined8 local_60;
  undefined4 local_58;

  local_60 = 0xfffffffffffffffe;
  local_58 = in_XMM6_Da;
  func_0x000145728850(param_4,param_3,param_5,&local_e8);
  if (*(long *)(param_5 + 0x48) != -1) {
    local_62 = 1;
    func_0x000145728850();
    local_88 = uStack_300;
    uStack_80 = uStack_2f8;
  }
  uStack_300 = CONCAT44(uStack_dc,uStack_e0);
  local_308 = local_e8;
  uStack_2f8 = CONCAT44(uStack_d4,local_d8);
  local_62 = 0;
  func_0x0001401f10b0();
  if (*(long *)(param_5 + 0x60) != -1) {
    func_0x000145728850();
    uStack_300 = CONCAT44(uStack_dc,uStack_e0);
    uStack_2f8 = CONCAT44(uStack_d4,local_d8);
    local_308 = local_e8;
    func_0x0001401f10b0();
  }
  uVar18 = *(ulong *)(param_5 + 0x90);
  if ((*(ulong *)(param_5 + 0x78) & uVar18) != 0xffffffffffffffff) {
    if (*(ulong *)(param_5 + 0x78) == 0xffffffffffffffff) {
      local_e8 = 0xffffffffffffffff;
    }
    else {
      func_0x000145728850();
    }
    if (uVar18 != 0xffffffffffffffff) {
      local_63 = 1;
      func_0x000145728850();
      local_88 = uStack_300;
      uStack_80 = uStack_2f8;
    }
    uStack_300 = CONCAT44(uStack_dc,uStack_e0);
    local_308 = local_e8;
    uStack_2f8 = (ulong)local_d8;
    local_63 = 0;
    func_0x0001401f10b0();
  }
  puVar17 = *(undefined1 **)(param_5 + 0x28);
  if (puVar17 != (undefined1 *)0x0) {
    local_a4 = 0x41500000;
    local_88 = 0;
    uStack_80 = 8;
    local_78 = 0;
    local_b8 = _DAT_14594c6f4;
    uStack_b4 = uRam000000014594c6f8;
    uStack_b0 = uRam000000014594c6fc;
    uStack_ac = uRam000000014594c700;
    psVar13 = *(short **)(param_5 + 0x20);
    uVar21 = _DAT_14594c6f4;
    uVar22 = uRam000000014594c6f8;
    uVar23 = uRam000000014594c6fc;
    uVar24 = uRam000000014594c700;
LAB_1401f3453:
    if (puVar17 != (undefined1 *)0x0) {
      puVar14 = (undefined1 *)0x0;
      do {
        while( true ) {
          puVar19 = puVar17;
          if ((ulong)((long)puVar17 - (long)puVar14) < 0x10) {
            uVar18 = 0;
            if (puVar17 == puVar14) goto LAB_1401f3533;
            while (((char *)((long)psVar13 + (long)puVar14))[uVar18] != '|') {
              uVar18 = uVar18 + 1;
              if ((long)puVar17 - (long)puVar14 == uVar18) goto LAB_1401f3533;
            }
          }
          else {
            local_61 = 1;
            auVar25 = func_0x0001457311c0();
            uVar18 = auVar25._8_8_;
            if (auVar25._0_8_ != 1) goto LAB_1401f3533;
          }
          puVar8 = puVar14 + uVar18 + 1;
          puVar19 = puVar14 + uVar18;
          puVar14 = puVar8;
          if (puVar19 < puVar17) break;
          puVar19 = puVar17;
          if (puVar17 < puVar8) goto LAB_1401f3533;
        }
      } while ((puVar8 <= puVar17) && (*(char *)((long)psVar13 + (long)puVar19) != '|'));
      if (*(char *)((long)psVar13 + (long)puVar19) == '|') {
LAB_1401f3533:
        if (puVar19 == (undefined1 *)0x0) {
          puVar14 = (undefined1 *)0x0;
          goto LAB_1401f3660;
        }
        local_308 = CONCAT44(uStack_b4,local_b8);
        uStack_300 = CONCAT44(uStack_ac,uStack_b0);
        if (puVar19 < puVar17) {
          bVar20 = true;
          uVar7 = uStack_300;
          if (-0x41 < *(char *)((long)psVar13 + (long)puVar19)) goto joined_r0x0001401f3559;
        }
        else if (puVar19 == puVar17) goto LAB_1401f3586;
        local_61 = 1;
        func_0x0001459039b0();
        goto LAB_1401f3dc9;
      }
      local_308 = CONCAT44(uStack_b4,local_b8);
      uStack_300 = CONCAT44(uStack_ac,uStack_b0);
LAB_1401f3586:
      bVar20 = false;
      puVar19 = puVar17;
      uVar7 = uStack_300;
joined_r0x0001401f3559:
      puVar14 = local_98;
      if (-1 < (long)puVar19) {
        func_0x000140002200();
        local_98 = (undefined1 *)func_0x0001400021c0();
        puVar14 = puVar19;
        if (local_98 != (undefined1 *)0x0) {
          local_90 = puVar19;
          func_0x0001457731ed();
          lVar9 = local_78;
          uStack_300._0_4_ = (undefined4)uVar7;
          uStack_300._4_4_ = (undefined4)((ulong)uVar7 >> 0x20);
          uStack_e0 = (undefined4)uStack_300;
          uStack_dc = uStack_300._4_4_;
          local_e8 = local_308;
          if (local_78 == local_88) {
            func_0x0001457747f0();
          }
          lVar10 = lVar9 * 0x30;
          *(undefined4 *)(uStack_80 + lVar10) = 0;
          puVar3 = (undefined4 *)(uStack_80 + 4 + lVar10);
          *puVar3 = (undefined4)local_e8;
          puVar3[1] = local_e8._4_4_;
          puVar3[2] = uStack_e0;
          puVar3[3] = uStack_dc;
          *(undefined1 **)(uStack_80 + 0x18 + lVar10) = local_90;
          *(undefined1 **)(uStack_80 + 0x20 + lVar10) = local_98;
          *(undefined1 **)(uStack_80 + 0x28 + lVar10) = local_90;
          local_78 = lVar9 + 1;
          uStack_300 = uVar7;
          if (bVar20) {
            puVar14 = local_90;
            if (*(char *)((long)psVar13 + (long)local_90) < -0x40) {
LAB_1401f3d2e:
              local_61 = 1;
              func_0x0001459039b0();
              goto LAB_1401f3dc9;
            }
          }
          else {
            puVar14 = puVar17;
            if (local_90 != puVar17) goto LAB_1401f3d2e;
          }
LAB_1401f3660:
          uVar18 = (long)puVar17 - (long)puVar14;
          psVar12 = (short *)((long)psVar13 + (long)puVar14);
          if (1 < uVar18) {
            if (*psVar12 == 0x727c) {
              puVar17 = (undefined1 *)(uVar18 - 2);
              psVar13 = psVar12 + 1;
              local_b8 = uVar21;
              uStack_b4 = uVar22;
              uStack_b0 = uVar23;
              uStack_ac = uVar24;
              goto LAB_1401f3453;
            }
            if (*psVar12 == 0x637c) {
              uVar1 = uVar18 - 2;
              if (uVar1 < 9) {
                if (uVar1 == 8) goto LAB_1401f3773;
              }
              else if (-0x41 < (char)psVar12[5]) {
LAB_1401f3773:
                lVar9 = 0;
                do {
                  if (lVar9 == 8) {
                    if (((uVar1 < 8) || ((char)psVar12[2] < -0x40)) ||
                       ((uVar1 != 8 && ((char)psVar12[5] < -0x40)))) {
                      local_61 = 1;
                      func_0x0001459039b0();
                      goto LAB_1401f3dc9;
                    }
                    psVar13 = psVar12 + 5;
                    pbVar16 = (byte *)0x0;
                    goto LAB_1401f38a5;
                  }
                  bVar4 = *(byte *)((long)psVar12 + lVar9 + 2);
                  if ((char)bVar4 < '\0') {
                    uVar11 = bVar4 & 0x1f;
                    uVar15 = *(byte *)((long)psVar12 + lVar9 + 3) & 0x3f;
                    if (bVar4 < 0xe0) {
                      lVar9 = lVar9 + 2;
                      uVar15 = uVar11 << 6 | uVar15;
                    }
                    else {
                      uVar15 = *(byte *)((long)psVar12 + lVar9 + 4) & 0x3f | uVar15 << 6;
                      if (bVar4 < 0xf0) {
                        lVar9 = lVar9 + 3;
                        uVar15 = uVar15 | uVar11 << 0xc;
                      }
                      else {
                        lVar10 = lVar9 + 5;
                        lVar9 = lVar9 + 4;
                        uVar15 = *(byte *)((long)psVar12 + lVar10) & 0x3f | uVar15 << 6 |
                                 (bVar4 & 7) << 0x12;
                      }
                    }
                  }
                  else {
                    lVar9 = lVar9 + 1;
                    uVar15 = (uint)bVar4;
                  }
                } while ((0xfffffff5 < uVar15 - 0x3a) || (0xfffffff9 < (uVar15 & 0xffffffdf) - 0x47)
                        );
              }
            }
          }
          bVar20 = puVar17 != puVar14;
          puVar17 = (undefined1 *)0x0;
          psVar13 = psVar12;
          if (bVar20) {
            func_0x000140002200();
            puVar17 = (undefined1 *)func_0x0001400021c0();
            lVar9 = local_78;
            if (puVar17 == (undefined1 *)0x0) {
              local_61 = 1;
              func_0x00014590379b();
              goto LAB_1401f3dc9;
            }
            *puVar17 = 0x7c;
            local_90 = puVar17;
            if (local_78 == local_88) {
              func_0x0001457747f0();
            }
            lVar10 = lVar9 * 0x30;
            *(undefined4 *)(uStack_80 + lVar10) = 0;
            puVar3 = (undefined4 *)(uStack_80 + 4 + lVar10);
            *puVar3 = local_b8;
            puVar3[1] = uStack_b4;
            puVar3[2] = uStack_b0;
            puVar3[3] = uStack_ac;
            *(undefined8 *)(uStack_80 + 0x18 + lVar10) = 1;
            *(undefined1 **)(uStack_80 + 0x20 + lVar10) = local_90;
            *(undefined8 *)(uStack_80 + 0x28 + lVar10) = 1;
            local_78 = lVar9 + 1;
            if ((1 < uVar18) && (*(char *)((long)psVar12 + 1) < -0x40)) {
              local_61 = 1;
              func_0x0001459039b0();
              goto LAB_1401f3dc9;
            }
            puVar17 = (undefined1 *)(uVar18 - 1);
            psVar13 = (short *)((long)psVar12 + 1);
          }
          goto LAB_1401f3453;
        }
      }
      local_98 = puVar14;
      local_61 = 1;
      func_0x00014590379b();
      goto LAB_1401f3dc9;
    }
    if (*param_3 == '\x01') {
      uStack_a0 = *(undefined4 *)(param_3 + 1);
      uStack_9c = (undefined3)((uint)*(undefined4 *)(param_3 + 4) >> 8);
    }
    else {
      plVar5 = *(long **)(param_3 + 8);
      LOCK();
      lVar9 = *plVar5;
      *plVar5 = *plVar5 + 1;
      UNLOCK();
      if (*plVar5 == 0 || SCARRY8(lVar9,1) != *plVar5 < 0) {
LAB_1401f3dc9:
                    /* WARNING: Does not return */
        pcVar6 = (code *)invalidInstructionException();
        (*pcVar6)();
      }
    }
    local_61 = 1;
    func_0x0001400ebe50();
    local_61 = 0;
    func_0x000140110890();
  }
  return;
  while( true ) {
    bVar4 = *pbVar2;
    uVar15 = (uint)bVar4;
    if ((char)bVar4 < '\0') {
      if (bVar4 < 0xe0) {
        pbVar16 = pbVar2 + 2;
        uVar15 = (uVar15 & 0x1f) << 6 | pbVar2[1] & 0x3f;
      }
      else {
        uVar11 = pbVar2[2] & 0x3f | (pbVar2[1] & 0x3f) << 6;
        if (bVar4 < 0xf0) {
          pbVar16 = pbVar2 + 3;
          uVar15 = uVar11 | (uVar15 & 0x1f) << 0xc;
        }
        else {
          pbVar16 = pbVar2 + 4;
          uVar15 = pbVar2[3] & 0x3f | uVar11 << 6 | (uVar15 & 7) << 0x12;
        }
      }
    }
    else {
      pbVar16 = pbVar2 + 1;
    }
    pbVar16 = pbVar16 + (6 - (long)psVar13);
    if (uVar15 != 0x23) break;
LAB_1401f38a5:
    pbVar2 = (byte *)((long)psVar12 + (long)(pbVar16 + 4));
    if (pbVar16 == (byte *)0x6) break;
  }
  local_61 = 1;
  func_0x000140195aa0();
  local_b8 = _DAT_14593cfec;
  uStack_b4 = uRam000000014593cff0;
  uStack_b0 = uRam000000014593cff4;
  uStack_ac = uRam000000014593cff8;
  if ((int)local_308 != 1) {
    local_b8 = local_308._4_4_;
    uStack_b4 = (undefined4)uStack_300;
    uStack_b0 = uStack_300._4_4_;
    uStack_ac = (undefined4)uStack_2f8;
  }
  if ((uVar1 != 8) && ((char)*psVar13 < -0x40)) {
    local_61 = 1;
    func_0x0001459039b0();
    goto LAB_1401f3dc9;
  }
  puVar17 = (undefined1 *)(uVar18 - 10);
  goto LAB_1401f3453;
}
