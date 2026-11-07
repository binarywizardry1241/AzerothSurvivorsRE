
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,char *param_3,undefined8 param_4,long param_5)

{
  ulong uVar1;
  byte *pbVar2;
  undefined4 *puVar3;
  byte bVar4;
  long *plVar5;
  code *pcVar6;
  undefined1 *puVar7;
  long lVar8;
  long lVar9;
  uint uVar10;
  short *psVar11;
  short *psVar12;
  undefined1 *puVar13;
  uint uVar14;
  byte *pbVar15;
  undefined1 *puVar16;
  ulong uVar17;
  undefined1 *puVar18;
  bool bVar19;
  undefined4 in_XMM6_Da;
  undefined4 uVar20;
  undefined4 uVar21;
  undefined4 uVar22;
  undefined4 uVar23;
  undefined1 auVar24 [16];
  undefined8 local_328;
  undefined8 uStack_320;
  undefined4 uStack_318;
  undefined8 local_118;
  undefined8 uStack_110;
  undefined8 local_108;
  undefined8 uStack_100;
  undefined8 uStack_f8;
  undefined8 uStack_f0;
  undefined8 local_e8;
  undefined8 uStack_e0;
  undefined8 local_d8;
  undefined8 uStack_d0;
  undefined8 uStack_c8;
  undefined8 local_c0;
  undefined4 local_b8;
  undefined4 uStack_b4;
  undefined4 uStack_b0;
  undefined4 uStack_ac;
  undefined4 local_9c;
  undefined4 uStack_98;
  undefined3 uStack_94;
  undefined1 *local_90;
  long local_88;
  long lStack_80;
  long local_78;
  undefined1 *local_70;
  undefined1 local_63;
  undefined1 local_62;
  undefined1 local_61;
  undefined8 local_60;
  undefined4 local_58;

  local_60 = 0xfffffffffffffffe;
  local_58 = in_XMM6_Da;
  func_0x00014570c440(param_4,param_3,param_5,&local_118);
  if (*(long *)(param_5 + 0x48) != -1) {
    local_62 = 1;
    func_0x00014570c440();
  }
  local_328 = local_118;
  uStack_320 = uStack_110;
  uStack_318 = (undefined4)local_108;
  local_62 = 0;
  func_0x0001400bd120();
  if (*(long *)(param_5 + 0x60) != -1) {
    func_0x00014570c440();
    uStack_320 = uStack_110;
    uStack_318 = (undefined4)local_108;
    local_328 = local_118;
    func_0x0001400bd120();
  }
  uVar17 = *(ulong *)(param_5 + 0x90);
  if ((*(ulong *)(param_5 + 0x78) & uVar17) != 0xffffffffffffffff) {
    if (*(ulong *)(param_5 + 0x78) == 0xffffffffffffffff) {
      local_118 = 0xffffffffffffffff;
    }
    else {
      func_0x00014570c440();
    }
    if (uVar17 != 0xffffffffffffffff) {
      local_63 = 1;
      func_0x00014570c440();
    }
    local_328 = local_118;
    uStack_320 = uStack_110;
    uStack_318 = (undefined4)local_108;
    local_63 = 0;
    func_0x0001400bd120();
  }
  puVar16 = *(undefined1 **)(param_5 + 0x28);
  if (puVar16 != (undefined1 *)0x0) {
    local_9c = 0x41500000;
    local_88 = 0;
    lStack_80 = 8;
    local_78 = 0;
    local_b8 = _DAT_1458fdfe4;
    uStack_b4 = uRam00000001458fdfe8;
    uStack_b0 = uRam00000001458fdfec;
    uStack_ac = uRam00000001458fdff0;
    psVar12 = *(short **)(param_5 + 0x20);
    uVar20 = _DAT_1458fdfe4;
    uVar21 = uRam00000001458fdfe8;
    uVar22 = uRam00000001458fdfec;
    uVar23 = uRam00000001458fdff0;
LAB_1400c09c7:
    if (puVar16 != (undefined1 *)0x0) {
      puVar13 = (undefined1 *)0x0;
      do {
        while( true ) {
          puVar18 = puVar16;
          if ((ulong)((long)puVar16 - (long)puVar13) < 0x10) {
            uVar17 = 0;
            if (puVar16 == puVar13) goto LAB_1400c0aa3;
            while (((char *)((long)psVar12 + (long)puVar13))[uVar17] != '|') {
              uVar17 = uVar17 + 1;
              if ((long)puVar16 - (long)puVar13 == uVar17) goto LAB_1400c0aa3;
            }
          }
          else {
            local_61 = 1;
            auVar24 = func_0x000145714db0();
            uVar17 = auVar24._8_8_;
            if (auVar24._0_8_ != 1) goto LAB_1400c0aa3;
          }
          puVar7 = puVar13 + uVar17 + 1;
          puVar18 = puVar13 + uVar17;
          puVar13 = puVar7;
          if (puVar18 < puVar16) break;
          puVar18 = puVar16;
          if (puVar16 < puVar7) goto LAB_1400c0aa3;
        }
      } while ((puVar7 <= puVar16) && (*(char *)((long)psVar12 + (long)puVar18) != '|'));
      if (*(char *)((long)psVar12 + (long)puVar18) == '|') {
LAB_1400c0aa3:
        if (puVar18 == (undefined1 *)0x0) {
          puVar13 = (undefined1 *)0x0;
          goto LAB_1400c0bd0;
        }
        local_328 = CONCAT44(uStack_b4,local_b8);
        uStack_320 = CONCAT44(uStack_ac,uStack_b0);
        if (puVar18 < puVar16) {
          bVar19 = true;
          if (-0x41 < *(char *)((long)psVar12 + (long)puVar18)) goto joined_r0x0001400c0ac9;
        }
        else if (puVar18 == puVar16) goto LAB_1400c0af6;
        local_61 = 1;
        func_0x0001458e7430();
        goto LAB_1400c132c;
      }
      local_328 = CONCAT44(uStack_b4,local_b8);
      uStack_320 = CONCAT44(uStack_ac,uStack_b0);
LAB_1400c0af6:
      bVar19 = false;
      puVar18 = puVar16;
joined_r0x0001400c0ac9:
      puVar13 = local_90;
      if (-1 < (long)puVar18) {
        func_0x000140002200();
        local_90 = (undefined1 *)func_0x0001400021c0();
        puVar13 = puVar18;
        if (local_90 != (undefined1 *)0x0) {
          local_70 = puVar18;
          func_0x000145756ddd();
          lVar8 = local_78;
          local_118 = local_328;
          uStack_110 = uStack_320;
          if (local_78 == local_88) {
            func_0x000145758190();
          }
          lVar9 = lVar8 * 0x30;
          *(undefined4 *)(lStack_80 + lVar9) = 0;
          puVar3 = (undefined4 *)(lStack_80 + 4 + lVar9);
          *puVar3 = (undefined4)local_118;
          puVar3[1] = local_118._4_4_;
          puVar3[2] = (undefined4)uStack_110;
          puVar3[3] = uStack_110._4_4_;
          *(undefined1 **)(lStack_80 + 0x18 + lVar9) = local_70;
          *(undefined1 **)(lStack_80 + 0x20 + lVar9) = local_90;
          *(undefined1 **)(lStack_80 + 0x28 + lVar9) = local_70;
          local_78 = lVar8 + 1;
          if (bVar19) {
            puVar13 = local_70;
            if (*(char *)((long)psVar12 + (long)local_70) < -0x40) {
LAB_1400c1291:
              local_61 = 1;
              func_0x0001458e7430();
              goto LAB_1400c132c;
            }
          }
          else {
            puVar13 = puVar16;
            if (local_70 != puVar16) goto LAB_1400c1291;
          }
LAB_1400c0bd0:
          uVar17 = (long)puVar16 - (long)puVar13;
          psVar11 = (short *)((long)psVar12 + (long)puVar13);
          if (1 < uVar17) {
            if (*psVar11 == 0x727c) {
              puVar16 = (undefined1 *)(uVar17 - 2);
              psVar12 = psVar11 + 1;
              local_b8 = uVar20;
              uStack_b4 = uVar21;
              uStack_b0 = uVar22;
              uStack_ac = uVar23;
              goto LAB_1400c09c7;
            }
            if (*psVar11 == 0x637c) {
              uVar1 = uVar17 - 2;
              if (uVar1 < 9) {
                if (uVar1 == 8) goto LAB_1400c0ce3;
              }
              else if (-0x41 < (char)psVar11[5]) {
LAB_1400c0ce3:
                lVar8 = 0;
                do {
                  if (lVar8 == 8) {
                    if (((uVar1 < 8) || ((char)psVar11[2] < -0x40)) ||
                       ((uVar1 != 8 && ((char)psVar11[5] < -0x40)))) {
                      local_61 = 1;
                      func_0x0001458e7430();
                      goto LAB_1400c132c;
                    }
                    psVar12 = psVar11 + 5;
                    pbVar15 = (byte *)0x0;
                    goto LAB_1400c0e15;
                  }
                  bVar4 = *(byte *)((long)psVar11 + lVar8 + 2);
                  if ((char)bVar4 < '\0') {
                    uVar10 = bVar4 & 0x1f;
                    uVar14 = *(byte *)((long)psVar11 + lVar8 + 3) & 0x3f;
                    if (bVar4 < 0xe0) {
                      lVar8 = lVar8 + 2;
                      uVar14 = uVar10 << 6 | uVar14;
                    }
                    else {
                      uVar14 = *(byte *)((long)psVar11 + lVar8 + 4) & 0x3f | uVar14 << 6;
                      if (bVar4 < 0xf0) {
                        lVar8 = lVar8 + 3;
                        uVar14 = uVar14 | uVar10 << 0xc;
                      }
                      else {
                        lVar9 = lVar8 + 5;
                        lVar8 = lVar8 + 4;
                        uVar14 = *(byte *)((long)psVar11 + lVar9) & 0x3f | uVar14 << 6 |
                                 (bVar4 & 7) << 0x12;
                      }
                    }
                  }
                  else {
                    lVar8 = lVar8 + 1;
                    uVar14 = (uint)bVar4;
                  }
                } while ((0xfffffff5 < uVar14 - 0x3a) || (0xfffffff9 < (uVar14 & 0xffffffdf) - 0x47)
                        );
              }
            }
          }
          bVar19 = puVar16 != puVar13;
          puVar16 = (undefined1 *)0x0;
          psVar12 = psVar11;
          if (bVar19) {
            func_0x000140002200();
            puVar16 = (undefined1 *)func_0x0001400021c0();
            lVar8 = local_78;
            if (puVar16 == (undefined1 *)0x0) {
              local_61 = 1;
              func_0x0001458e721b();
              goto LAB_1400c132c;
            }
            *puVar16 = 0x7c;
            local_70 = puVar16;
            if (local_78 == local_88) {
              func_0x000145758190();
            }
            lVar9 = lVar8 * 0x30;
            *(undefined4 *)(lStack_80 + lVar9) = 0;
            puVar3 = (undefined4 *)(lStack_80 + 4 + lVar9);
            *puVar3 = local_b8;
            puVar3[1] = uStack_b4;
            puVar3[2] = uStack_b0;
            puVar3[3] = uStack_ac;
            *(undefined8 *)(lStack_80 + 0x18 + lVar9) = 1;
            *(undefined1 **)(lStack_80 + 0x20 + lVar9) = local_70;
            *(undefined8 *)(lStack_80 + 0x28 + lVar9) = 1;
            local_78 = lVar8 + 1;
            if ((1 < uVar17) && (*(char *)((long)psVar11 + 1) < -0x40)) {
              local_61 = 1;
              func_0x0001458e7430();
              goto LAB_1400c132c;
            }
            puVar16 = (undefined1 *)(uVar17 - 1);
            psVar12 = (short *)((long)psVar11 + 1);
          }
          goto LAB_1400c09c7;
        }
      }
      local_90 = puVar13;
      local_61 = 1;
      func_0x0001458e721b();
      goto LAB_1400c132c;
    }
    if (*param_3 == '\x01') {
      uStack_98 = *(undefined4 *)(param_3 + 1);
      uStack_94 = (undefined3)((uint)*(undefined4 *)(param_3 + 4) >> 8);
    }
    else {
      plVar5 = *(long **)(param_3 + 8);
      LOCK();
      lVar8 = *plVar5;
      *plVar5 = *plVar5 + 1;
      UNLOCK();
      if (*plVar5 == 0 || SCARRY8(lVar8,1) != *plVar5 < 0) {
LAB_1400c132c:
                    /* WARNING: Does not return */
        pcVar6 = (code *)invalidInstructionException();
        (*pcVar6)();
      }
    }
    local_118 = _DAT_1458fdab0;
    uStack_110 = uRam00000001458fdab8;
    local_108 = 0;
    uStack_100 = _DAT_1458fdac8;
    uStack_f8 = uRam00000001458fdad0;
    uStack_f0 = 0;
    local_e8 = _DAT_1458fdae0;
    uStack_e0 = uRam00000001458fdae8;
    local_d8 = 0;
    uStack_d0 = _DAT_1458fdaf8;
    uStack_c8 = uRam00000001458fdb00;
    local_c0 = 0;
    local_61 = 1;
    func_0x0001401f8500();
    local_61 = 0;
    func_0x00014021ae10();
  }
  return;
  while( true ) {
    bVar4 = *pbVar2;
    uVar14 = (uint)bVar4;
    if ((char)bVar4 < '\0') {
      if (bVar4 < 0xe0) {
        pbVar15 = pbVar2 + 2;
        uVar14 = (uVar14 & 0x1f) << 6 | pbVar2[1] & 0x3f;
      }
      else {
        uVar10 = pbVar2[2] & 0x3f | (pbVar2[1] & 0x3f) << 6;
        if (bVar4 < 0xf0) {
          pbVar15 = pbVar2 + 3;
          uVar14 = uVar10 | (uVar14 & 0x1f) << 0xc;
        }
        else {
          pbVar15 = pbVar2 + 4;
          uVar14 = pbVar2[3] & 0x3f | uVar10 << 6 | (uVar14 & 7) << 0x12;
        }
      }
    }
    else {
      pbVar15 = pbVar2 + 1;
    }
    pbVar15 = pbVar15 + (6 - (long)psVar12);
    if (uVar14 != 0x23) break;
LAB_1400c0e15:
    pbVar2 = (byte *)((long)psVar11 + (long)(pbVar15 + 4));
    if (pbVar15 == (byte *)0x6) break;
  }
  local_61 = 1;
  func_0x00014018cda0();
  local_b8 = uVar20;
  uStack_b4 = uVar21;
  uStack_b0 = uVar22;
  uStack_ac = uVar23;
  if ((int)local_328 != 1) {
    local_b8 = local_328._4_4_;
    uStack_b4 = (undefined4)uStack_320;
    uStack_b0 = uStack_320._4_4_;
    uStack_ac = uStack_318;
  }
  if ((uVar1 != 8) && ((char)*psVar12 < -0x40)) {
    local_61 = 1;
    func_0x0001458e7430();
    goto LAB_1400c132c;
  }
  puVar16 = (undefined1 *)(uVar17 - 10);
  goto LAB_1400c09c7;
}
