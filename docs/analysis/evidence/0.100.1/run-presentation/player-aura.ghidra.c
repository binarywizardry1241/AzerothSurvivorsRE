
/* WARNING: Removing unreachable block (ram,0x00014549f150) */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,long param_4)

{
  long *plVar1;
  ushort uVar2;
  char *pcVar3;
  long lVar4;
  long lVar5;
  code *pcVar6;
  bool bVar7;
  char *pcVar8;
  ushort uVar9;
  undefined4 uVar10;
  int iVar11;
  int iVar12;
  long lVar13;
  ulong uVar14;
  undefined4 *puVar15;
  ulong *puVar16;
  uint uVar17;
  char *pcVar18;
  long lVar19;
  ulong *puVar20;
  ulong *puVar21;
  int *extraout_RDX;
  int *extraout_RDX_00;
  int *piVar22;
  int *extraout_RDX_01;
  int *extraout_RDX_02;
  int *extraout_RDX_03;
  int *extraout_RDX_04;
  int *piVar23;
  int *extraout_RDX_05;
  int *piVar24;
  long lVar25;
  long lVar26;
  long *plVar27;
  ulong uVar28;
  int *piVar29;
  uint uVar30;
  uint uVar31;
  uint uVar32;
  ulong uVar33;
  char cVar34;
  long *plVar35;
  int *piVar36;
  undefined4 in_XMM6_Da;
  float fVar37;
  undefined4 in_XMM7_Da;
  float fVar38;
  float fVar39;
  undefined1 auVar40 [16];
  long local_110;
  ulong local_e8;
  long local_e0;
  ulong local_d8;
  ulong *local_d0;
  ulong *local_c8;
  float local_bc;
  long local_b8;
  ulong *local_b0;
  ulong *local_a8;
  float *pfStack_a0;
  int *local_98;
  ulong local_90;
  undefined1 local_82;
  undefined1 local_81;
  undefined8 local_80;
  undefined4 local_78;
  undefined4 local_68;

  local_80 = 0xfffffffffffffffe;
  local_bc = *(float *)(param_4 + 0x934);
  puVar21 = *(ulong **)(param_4 + 0x310);
  lVar19 = *(long *)(param_4 + 0x318);
  local_a8 = puVar21 + lVar19 * 3;
  pfStack_a0 = &local_bc;
  local_b8 = param_4;
  local_b0 = puVar21;
  local_78 = in_XMM6_Da;
  local_68 = in_XMM7_Da;
  func_0x000145538730(puVar21,param_2,&local_b0,&local_e8);
  local_110 = 0;
  lVar19 = lVar19 * 0x18;
  do {
    puVar20 = puVar21;
    lVar25 = lVar19;
    if (lVar25 == 0) break;
    lVar19 = lVar25 + -0x18;
    puVar21 = puVar20 + 3;
  } while ((*(float *)(puVar20 + 2) <= local_bc) || ((int)*puVar20 != 7));
  pcVar3 = *(char **)(local_b8 + 0x710);
  lVar19 = *(long *)(local_b8 + 0x718);
  func_0x00014549b830();
  puVar21 = local_b0;
  if (pfStack_a0 != (float *)0x0) {
    local_c8 = local_a8 + (long)pfStack_a0 * 2;
    local_d0 = *(ulong **)(local_b8 + 0x730);
    fVar37 = *(float *)(local_b8 + 0x118);
    lVar4 = *(long *)(local_b8 + 0x58);
    lVar5 = *(long *)(local_b8 + 0x60);
    lVar26 = lVar5 << 4;
    fVar38 = *(float *)(local_b8 + 0x41c);
    puVar20 = local_a8;
    do {
      uVar28 = *puVar20;
      uVar33 = puVar20[1];
      uVar10 = func_0x000145487350();
      uVar14 = local_d8;
      if ((char)uVar33 == '\0') {
        if (0.0 < fVar38 && lVar25 == 0) {
          if (local_d8 == local_e8) {
            func_0x000145780030();
          }
          *(undefined4 *)(local_e0 + uVar14 * 0xc) = uVar10;
          *(undefined8 *)(local_e0 + 4 + uVar14 * 0xc) = 0x17f800000;
LAB_14549e8e9:
          local_d8 = uVar14 + 1;
        }
      }
      else if ((char)uVar33 == '\x01') {
        if (lVar5 != 0) {
          lVar13 = 0;
          do {
            if (((*(ulong *)(lVar4 + lVar13) == uVar28) &&
                (iVar11 = *(int *)(lVar4 + 8 + lVar13), iVar11 != 0)) &&
               (fVar39 = *(float *)(lVar4 + 0xc + lVar13), local_bc < fVar39)) {
              if (local_d8 == local_e8) {
                func_0x000145780030();
              }
              *(undefined4 *)(local_e0 + uVar14 * 0xc) = uVar10;
              *(float *)(local_e0 + 4 + uVar14 * 0xc) = fVar39;
              *(int *)(local_e0 + 8 + uVar14 * 0xc) = iVar11;
              goto LAB_14549e8e9;
            }
            lVar13 = lVar13 + 0x10;
          } while (lVar26 != lVar13);
        }
      }
      else if (local_bc < fVar37) {
        if (local_110 == 0) {
          func_0x000145780030();
        }
        *(undefined4 *)(local_110 * 0xc + 4) = uVar10;
        *(float *)(local_110 * 0xc + 8) = fVar37;
        *(undefined4 *)(local_110 * 0xc + 0xc) = 1;
        local_110 = local_110 + 1;
      }
      puVar20 = puVar20 + 2;
    } while (puVar20 != local_c8);
  }
  if (puVar21 != (ulong *)0x0) {
    func_0x0001400021d0();
  }
  lVar25 = local_b8;
  plVar35 = *(long **)(local_b8 + 0x2b0);
  plVar27 = plVar35 + *(long *)(local_b8 + 0x2b8) * 0xb;
  plVar1 = (long *)(local_b8 + 0x390);
  bVar7 = false;
  fVar37 = _DAT_145907498;
  fVar38 = _DAT_14593fd40;
  while( true ) {
    if (plVar35 != (long *)0x0) {
      for (; plVar35 != plVar27; plVar35 = plVar35 + 0xb) {
        if (*(int *)(*plVar35 + 0x68) == 0xb) {
          uVar10 = 0x64ab;
          fVar39 = *(float *)((long)plVar35 + 0xc);
          plVar35 = plVar35 + 0xb;
          goto joined_r0x00014549ea14;
        }
      }
    }
    if ((bVar7) || (*(int *)(*plVar1 + 0x68) != 0xb)) break;
    uVar10 = 0x1a84;
    bVar7 = true;
    plVar35 = (long *)0x0;
    fVar39 = *(float *)(lVar25 + 0x39c);
joined_r0x00014549ea14:
    if ((fVar37 < fVar39) && (fVar39 != fVar38)) {
      fVar39 = fVar39 + local_bc;
      if (local_110 == 0) {
        func_0x000145780030();
      }
      *(undefined4 *)(local_110 * 0xc + 4) = uVar10;
      *(float *)(local_110 * 0xc + 8) = fVar39;
      *(undefined4 *)(local_110 * 0xc + 0xc) = 1;
      local_110 = local_110 + 1;
    }
  }
  puVar21 = &local_e8;
  pcVar8 = pcVar3;
  while (pcVar18 = pcVar8, uVar28 = local_e8, pcVar18 != pcVar3 + lVar19 * 0x40) {
    pcVar8 = pcVar18 + 0x40;
    if (*pcVar18 == '\x19') {
      uVar10 = *(undefined4 *)(pcVar18 + 4);
      if (local_d8 == local_e8) {
        func_0x000145780030();
      }
      *(undefined4 *)(local_e0 + local_d8 * 0xc) = uVar10;
      *(undefined8 *)(local_e0 + 4 + local_d8 * 0xc) = 0x17f800000;
      local_d8 = local_d8 + 1;
    }
  }
  uVar33 = local_d8;
  func_0x000140002200();
  auVar40 = func_0x0001400021c0();
  piVar22 = auVar40._8_8_;
  puVar20 = auVar40._0_8_;
  local_c8 = puVar20;
  if (puVar20 != (ulong *)0x0) {
    uVar14 = 0x20;
    if (uVar33 < 0x20) {
      uVar14 = uVar33;
    }
    *(int *)puVar20 = 0;
    *(int *)(puVar20 + 2) = 0;
    *(int *)(puVar20 + 4) = 0;
    *(int *)(puVar20 + 6) = 0;
    *(int *)(puVar20 + 8) = 0;
    *(int *)(puVar20 + 10) = 0;
    *(int *)(puVar20 + 0xc) = 0;
    *(int *)(puVar20 + 0xe) = 0;
    *(int *)(puVar20 + 0x10) = 0;
    *(int *)(puVar20 + 0x12) = 0;
    *(int *)(puVar20 + 0x14) = 0;
    *(int *)(puVar20 + 0x16) = 0;
    *(int *)(puVar20 + 0x18) = 0;
    *(int *)(puVar20 + 0x1a) = 0;
    *(int *)(puVar20 + 0x1c) = 0;
    *(int *)(puVar20 + 0x1e) = 0;
    *(int *)(puVar20 + 0x20) = 0;
    *(int *)(puVar20 + 0x22) = 0;
    *(int *)(puVar20 + 0x24) = 0;
    *(int *)(puVar20 + 0x26) = 0;
    *(int *)(puVar20 + 0x28) = 0;
    *(int *)(puVar20 + 0x2a) = 0;
    *(int *)(puVar20 + 0x2c) = 0;
    *(int *)(puVar20 + 0x2e) = 0;
    *(int *)(puVar20 + 0x30) = 0;
    *(int *)(puVar20 + 0x32) = 0;
    *(int *)(puVar20 + 0x34) = 0;
    *(int *)(puVar20 + 0x36) = 0;
    *(int *)(puVar20 + 0x38) = 0;
    *(int *)(puVar20 + 0x3a) = 0;
    *(int *)(puVar20 + 0x3c) = 0;
    *(int *)(puVar20 + 0x3e) = 0;
    *(int *)(puVar20 + 0x40) = 0;
    *(int *)(puVar20 + 0x42) = 0;
    *(int *)(puVar20 + 0x44) = 0;
    *(int *)(puVar20 + 0x46) = 0;
    *(int *)(puVar20 + 0x48) = 0;
    *(int *)(puVar20 + 0x4a) = 0;
    *(int *)(puVar20 + 0x4c) = 0;
    *(int *)(puVar20 + 0x4e) = 0;
    *(int *)(puVar20 + 0x50) = 0;
    *(int *)(puVar20 + 0x52) = 0;
    *(int *)(puVar20 + 0x54) = 0;
    *(int *)(puVar20 + 0x56) = 0;
    *(int *)(puVar20 + 0x58) = 0;
    *(int *)(puVar20 + 0x5a) = 0;
    *(int *)(puVar20 + 0x5c) = 0;
    *(int *)(puVar20 + 0x5e) = 0;
    if (uVar33 != 0) {
      piVar22 = (int *)((long)puVar20 + 4);
      lVar19 = 0;
      do {
        iVar11 = *(int *)(local_e0 + 8 + lVar19);
        local_a8 = (ulong *)CONCAT44(local_a8._4_4_,iVar11);
        local_b0 = *(ulong **)(local_e0 + lVar19);
        lVar19 = lVar19 + 0xc;
        if (lVar19 == 0x24c) {
          func_0x000145903b33();
          goto LAB_14549fa39;
        }
        piVar22[-1] = 1;
        *(ulong **)piVar22 = local_b0;
        piVar22[2] = iVar11;
        piVar22 = piVar22 + 4;
      } while ((ulong)(uint)((int)uVar14 << 2) * 3 != lVar19);
    }
    lVar19 = local_b8;
    if (uVar28 != 0) {
      func_0x0001400021d0();
      piVar22 = extraout_RDX;
    }
    iVar11 = _DAT_0000000c;
    puVar16 = _DAT_00000004;
    if (local_110 != 0) {
      local_a8 = (ulong *)CONCAT44(local_a8._4_4_,_DAT_0000000c);
      local_b0 = _DAT_00000004;
      *(int *)(puVar20 + 0x40) = 1;
      *(ulong **)((long)puVar20 + 0x204) = puVar16;
      *(int *)((long)puVar20 + 0x20c) = iVar11;
      iVar11 = _DAT_00000018;
      puVar16 = _DAT_00000010;
      if (local_110 != 1) {
        local_a8 = (ulong *)CONCAT44(local_a8._4_4_,_DAT_00000018);
        local_b0 = _DAT_00000010;
        *(int *)(puVar20 + 0x42) = 1;
        *(ulong **)((long)puVar20 + 0x214) = puVar16;
        *(int *)((long)puVar20 + 0x21c) = iVar11;
        iVar11 = _DAT_00000024;
        puVar16 = _DAT_0000001c;
        if (local_110 != 2) {
          local_a8 = (ulong *)CONCAT44(local_a8._4_4_,_DAT_00000024);
          local_b0 = _DAT_0000001c;
          *(int *)(puVar20 + 0x44) = 1;
          *(ulong **)((long)puVar20 + 0x224) = puVar16;
          *(int *)((long)puVar20 + 0x22c) = iVar11;
          iVar11 = _DAT_00000030;
          puVar16 = _DAT_00000028;
          if (local_110 != 3) {
            local_a8 = (ulong *)CONCAT44(local_a8._4_4_,_DAT_00000030);
            local_b0 = _DAT_00000028;
            *(int *)(puVar20 + 0x46) = 1;
            *(ulong **)((long)puVar20 + 0x234) = puVar16;
            *(int *)((long)puVar20 + 0x23c) = iVar11;
            iVar11 = _DAT_0000003c;
            puVar16 = _DAT_00000034;
            if (local_110 != 4) {
              local_a8 = (ulong *)CONCAT44(local_a8._4_4_,_DAT_0000003c);
              local_b0 = _DAT_00000034;
              *(int *)(puVar20 + 0x48) = 1;
              *(ulong **)((long)puVar20 + 0x244) = puVar16;
              *(int *)((long)puVar20 + 0x24c) = iVar11;
              iVar11 = _DAT_00000048;
              puVar16 = _DAT_00000040;
              if (local_110 != 5) {
                local_a8 = (ulong *)CONCAT44(local_a8._4_4_,_DAT_00000048);
                local_b0 = _DAT_00000040;
                *(int *)(puVar20 + 0x4a) = 1;
                *(ulong **)((long)puVar20 + 0x254) = puVar16;
                *(int *)((long)puVar20 + 0x25c) = iVar11;
                iVar11 = _DAT_00000054;
                puVar16 = _DAT_0000004c;
                if (local_110 != 6) {
                  local_a8 = (ulong *)CONCAT44(local_a8._4_4_,_DAT_00000054);
                  local_b0 = _DAT_0000004c;
                  *(int *)(puVar20 + 0x4c) = 1;
                  *(ulong **)((long)puVar20 + 0x264) = puVar16;
                  *(int *)((long)puVar20 + 0x26c) = iVar11;
                  iVar11 = _DAT_00000060;
                  puVar16 = _DAT_00000058;
                  if (local_110 != 7) {
                    local_a8 = (ulong *)CONCAT44(local_a8._4_4_,_DAT_00000060);
                    local_b0 = _DAT_00000058;
                    *(int *)(puVar20 + 0x4e) = 1;
                    *(ulong **)((long)puVar20 + 0x274) = puVar16;
                    *(int *)((long)puVar20 + 0x27c) = iVar11;
                    iVar11 = _DAT_0000006c;
                    puVar16 = _DAT_00000064;
                    if (local_110 != 8) {
                      local_a8 = (ulong *)CONCAT44(local_a8._4_4_,_DAT_0000006c);
                      local_b0 = _DAT_00000064;
                      *(int *)(puVar20 + 0x50) = 1;
                      *(ulong **)((long)puVar20 + 0x284) = puVar16;
                      *(int *)((long)puVar20 + 0x28c) = iVar11;
                      iVar11 = _DAT_00000078;
                      puVar16 = _DAT_00000070;
                      if (local_110 != 9) {
                        local_a8 = (ulong *)CONCAT44(local_a8._4_4_,_DAT_00000078);
                        local_b0 = _DAT_00000070;
                        *(int *)(puVar20 + 0x52) = 1;
                        *(ulong **)((long)puVar20 + 0x294) = puVar16;
                        *(int *)((long)puVar20 + 0x29c) = iVar11;
                        iVar11 = _DAT_00000084;
                        puVar16 = _DAT_0000007c;
                        if (local_110 != 10) {
                          local_a8 = (ulong *)CONCAT44(local_a8._4_4_,_DAT_00000084);
                          local_b0 = _DAT_0000007c;
                          *(int *)(puVar20 + 0x54) = 1;
                          *(ulong **)((long)puVar20 + 0x2a4) = puVar16;
                          *(int *)((long)puVar20 + 0x2ac) = iVar11;
                          iVar11 = _DAT_00000090;
                          puVar16 = _DAT_00000088;
                          if (local_110 != 0xb) {
                            local_a8 = (ulong *)CONCAT44(local_a8._4_4_,_DAT_00000090);
                            local_b0 = _DAT_00000088;
                            *(int *)(puVar20 + 0x56) = 1;
                            *(ulong **)((long)puVar20 + 0x2b4) = puVar16;
                            *(int *)((long)puVar20 + 700) = iVar11;
                            iVar11 = _DAT_0000009c;
                            puVar16 = _DAT_00000094;
                            if (local_110 != 0xc) {
                              local_a8 = (ulong *)CONCAT44(local_a8._4_4_,_DAT_0000009c);
                              local_b0 = _DAT_00000094;
                              *(int *)(puVar20 + 0x58) = 1;
                              *(ulong **)((long)puVar20 + 0x2c4) = puVar16;
                              *(int *)((long)puVar20 + 0x2cc) = iVar11;
                              iVar11 = _DAT_000000a8;
                              puVar16 = _DAT_000000a0;
                              if (local_110 != 0xd) {
                                local_a8 = (ulong *)CONCAT44(local_a8._4_4_,_DAT_000000a8);
                                local_b0 = _DAT_000000a0;
                                *(int *)(puVar20 + 0x5a) = 1;
                                *(ulong **)((long)puVar20 + 0x2d4) = puVar16;
                                *(int *)((long)puVar20 + 0x2dc) = iVar11;
                                iVar11 = _DAT_000000b4;
                                puVar16 = _DAT_000000ac;
                                if (local_110 != 0xe) {
                                  local_a8 = (ulong *)CONCAT44(local_a8._4_4_,_DAT_000000b4);
                                  local_b0 = _DAT_000000ac;
                                  *(int *)(puVar20 + 0x5c) = 1;
                                  *(ulong **)((long)puVar20 + 0x2e4) = puVar16;
                                  *(int *)((long)puVar20 + 0x2ec) = iVar11;
                                  iVar11 = _DAT_000000c0;
                                  puVar16 = _DAT_000000b8;
                                  if (local_110 != 0xf) {
                                    local_a8 = (ulong *)CONCAT44(local_a8._4_4_,_DAT_000000c0);
                                    local_b0 = _DAT_000000b8;
                                    *(int *)(puVar20 + 0x5e) = 1;
                                    *(ulong **)((long)puVar20 + 0x2f4) = puVar16;
                                    *(int *)((long)puVar20 + 0x2fc) = iVar11;
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    if (*(long *)(lVar19 + 0x6b8) == 0x30) {
      cVar34 = *(char *)(lVar19 + 0x9ab);
    }
    else {
      func_0x000140002200();
      puVar15 = (undefined4 *)func_0x0001400021c0();
      if (puVar15 == (undefined4 *)0x0) {
        local_81 = 0;
        func_0x00014590379b();
        goto LAB_14549fa39;
      }
      *puVar15 = 0;
      puVar15[4] = 0;
      puVar15[8] = 0;
      puVar15[0xc] = 0;
      puVar15[0x10] = 0;
      puVar15[0x14] = 0;
      puVar15[0x18] = 0;
      puVar15[0x1c] = 0;
      puVar15[0x20] = 0;
      puVar15[0x24] = 0;
      puVar15[0x28] = 0;
      puVar15[0x2c] = 0;
      puVar15[0x30] = 0;
      puVar15[0x34] = 0;
      puVar15[0x38] = 0;
      puVar15[0x3c] = 0;
      puVar15[0x40] = 0;
      puVar15[0x44] = 0;
      puVar15[0x48] = 0;
      puVar15[0x4c] = 0;
      puVar15[0x50] = 0;
      puVar15[0x54] = 0;
      puVar15[0x58] = 0;
      puVar15[0x5c] = 0;
      puVar15[0x60] = 0;
      puVar15[100] = 0;
      puVar15[0x68] = 0;
      puVar15[0x6c] = 0;
      puVar15[0x70] = 0;
      puVar15[0x74] = 0;
      puVar15[0x78] = 0;
      puVar15[0x7c] = 0;
      puVar15[0x80] = 0;
      puVar15[0x84] = 0;
      puVar15[0x88] = 0;
      puVar15[0x8c] = 0;
      puVar15[0x90] = 0;
      puVar15[0x94] = 0;
      puVar15[0x98] = 0;
      puVar15[0x9c] = 0;
      puVar15[0xa0] = 0;
      puVar15[0xa4] = 0;
      puVar15[0xa8] = 0;
      puVar15[0xac] = 0;
      puVar15[0xb0] = 0;
      puVar15[0xb4] = 0;
      puVar15[0xb8] = 0;
      puVar15[0xbc] = 0;
      piVar22 = (int *)0x0;
      if (*(long *)(lVar19 + 0x6a8) != 0) {
        func_0x0001400021d0();
        piVar22 = extraout_RDX_00;
      }
      *(undefined8 *)(lVar19 + 0x6a8) = 0x30;
      *(undefined4 **)(lVar19 + 0x6b0) = puVar15;
      *(undefined8 *)(lVar19 + 0x6b8) = 0x30;
      *(undefined1 *)(lVar19 + 0x9ab) = 0;
      cVar34 = '\0';
    }
    local_d0 = (ulong *)(lVar19 + 0x8d8);
    uVar28 = 0;
LAB_14549f3d5:
    uVar33 = uVar28;
    if (uVar33 < 0x30) {
      uVar28 = uVar33 + 1;
      if (cVar34 == '\0') {
        iVar11 = 0;
        if ((puVar20[uVar33 * 2] & 1) != 0) {
          iVar11 = *(int *)((long)puVar20 + (uVar33 * 4 + 1) * 4);
        }
        goto LAB_14549f480;
      }
      if (*(ulong *)(local_b8 + 0x6b8) <= uVar33) {
        local_81 = 0;
        func_0x000145903b33();
        goto LAB_14549fa39;
      }
      piVar22 = (int *)(uVar33 * 0x10);
      iVar11 = 0;
      if ((puVar20[uVar33 * 2] & 1) == 0) {
        lVar19 = *(long *)(local_b8 + 0x6b0);
        if ((*(byte *)(lVar19 + (long)piVar22) & 1) == 0) goto LAB_14549f427;
LAB_14549f467:
        if (iVar11 != *(int *)(lVar19 + 4 + (long)piVar22)) {
LAB_14549f480:
          uVar17 = (int)uVar33 + 0x2f;
          puVar16 = (ulong *)*local_d0;
          if (puVar16 != (ulong *)0x0) {
            lVar19 = *(long *)(local_b8 + 0x8e0);
            do {
              uVar33 = (ulong)((uint)*(ushort *)((long)puVar16 + 0x36) * 2);
              piVar22 = (int *)0xffffffffffffffff;
              do {
                piVar23 = piVar22;
                piVar22 = (int *)(ulong)*(ushort *)((long)puVar16 + 0x36);
                if (uVar33 == 0) goto joined_r0x00014549f4f7;
                uVar2 = *(ushort *)((long)puVar16 + (long)piVar23 * 2 + 0x3a);
                uVar9 = (ushort)uVar17;
                piVar22 = (int *)((long)piVar23 + 1);
                uVar33 = uVar33 - 2;
              } while ((char)((uVar2 < uVar9) - (uVar9 < uVar2)) == '\x01');
              if (uVar2 < uVar9 == uVar9 < uVar2) {
                *(int *)((long)puVar16 + ((long)piVar23 + 3) * 4) = iVar11;
                goto LAB_14549f3d5;
              }
joined_r0x00014549f4f7:
              if (lVar19 == 0) goto LAB_14549f502;
              lVar19 = lVar19 + -1;
              puVar16 = (ulong *)puVar16[(long)piVar22 + 10];
            } while( true );
          }
          puVar16 = (ulong *)0x0;
LAB_14549f502:
          local_90 = (ulong)(uVar17 & 0xffff);
          local_b0 = local_d0;
          pfStack_a0 = (float *)0x0;
          local_81 = 0;
          local_a8 = puVar16;
          local_98 = piVar22;
          func_0x00014552a730();
          piVar22 = extraout_RDX_01;
          puVar20 = local_c8;
        }
      }
      else {
        iVar11 = ((int *)((long)puVar20 + 4))[uVar33 * 4];
        lVar19 = *(long *)(local_b8 + 0x6b0);
        if ((*(byte *)(lVar19 + (long)piVar22) & 1) != 0) goto LAB_14549f467;
LAB_14549f427:
        if (iVar11 != 0) goto LAB_14549f480;
      }
      goto LAB_14549f3d5;
    }
    for (uVar28 = 0; uVar28 < 6; uVar28 = uVar28 + 1) {
      pfStack_a0 = (float *)&DAT_00000030;
      local_81 = 0;
      local_e8 = uVar28;
      local_b0 = puVar21;
      local_a8 = puVar20;
      iVar11 = func_0x000145497900();
      piVar22 = extraout_RDX_02;
      if (cVar34 == '\0') {
LAB_14549f5b4:
        puVar20 = (ulong *)*local_d0;
        if (puVar20 != (ulong *)0x0) {
          lVar19 = *(long *)(local_b8 + 0x8e0);
          do {
            uVar33 = (ulong)((uint)*(ushort *)((long)puVar20 + 0x36) * 2);
            piVar22 = (int *)0xffffffffffffffff;
            do {
              piVar23 = piVar22;
              piVar22 = (int *)(ulong)*(ushort *)((long)puVar20 + 0x36);
              if (uVar33 == 0) goto joined_r0x00014549f637;
              uVar2 = *(ushort *)((long)puVar20 + (long)piVar23 * 2 + 0x3a);
              uVar9 = (ushort)((int)local_e8 + 0x5fU);
              piVar22 = (int *)((long)piVar23 + 1);
              uVar33 = uVar33 - 2;
            } while ((char)((uVar2 < uVar9) - (uVar9 < uVar2)) == '\x01');
            if (uVar2 < uVar9 == uVar9 < uVar2) {
              *(int *)((long)puVar20 + ((long)piVar23 + 3) * 4) = iVar11;
              goto LAB_14549f555;
            }
joined_r0x00014549f637:
            if (lVar19 == 0) goto LAB_14549f642;
            lVar19 = lVar19 + -1;
            puVar20 = (ulong *)puVar20[(long)piVar22 + 10];
          } while( true );
        }
        puVar20 = (ulong *)0x0;
LAB_14549f642:
        local_90 = (ulong)((int)local_e8 + 0x5fU & 0xffff);
        local_b0 = local_d0;
        pfStack_a0 = (float *)0x0;
        local_81 = 0;
        local_a8 = puVar20;
        local_98 = piVar22;
        func_0x00014552a730();
        piVar22 = extraout_RDX_04;
      }
      else {
        local_a8 = *(ulong **)(local_b8 + 0x6b0);
        pfStack_a0 = *(float **)(local_b8 + 0x6b8);
        local_81 = 0;
        local_b0 = puVar21;
        iVar12 = func_0x000145497900();
        piVar22 = extraout_RDX_03;
        if (iVar11 != iVar12) goto LAB_14549f5b4;
      }
LAB_14549f555:
      puVar20 = local_c8;
    }
    uVar28 = 0;
LAB_14549f685:
    do {
      uVar33 = uVar28;
      if (0xb < uVar33) {
        if (*(long *)(local_b8 + 0x6a8) != 0) {
          func_0x0001400021d0();
        }
        *(undefined8 *)(local_b8 + 0x6a8) = 0x30;
        *(ulong **)(local_b8 + 0x6b0) = puVar20;
        *(undefined8 *)(local_b8 + 0x6b8) = 0x30;
        *(undefined1 *)(local_b8 + 0x9ab) = 1;
        return;
      }
      uVar17 = 0;
      if ((int)puVar20[uVar33 * 8] == 1) {
        uVar30 = *(uint *)((long)puVar20 + (uVar33 * 0x10 + 3) * 4);
        uVar17 = 0xff;
        if (uVar30 < 0xff) {
          uVar17 = uVar30;
        }
        uVar17 = uVar17 - 1;
        if (uVar30 == 0) {
          uVar17 = 0;
        }
      }
      piVar23 = (int *)(uVar33 * 4);
      piVar36 = (int *)((ulong)piVar23 | 1);
      if ((int)puVar20[(long)piVar36 * 2] == 1) {
        uVar30 = *(uint *)((long)puVar20 + ((long)piVar36 * 4 + 3) * 4);
        piVar22 = (int *)(ulong)uVar30;
        uVar31 = 0xff;
        if (uVar30 < 0xff) {
          uVar31 = uVar30;
        }
        uVar31 = uVar31 * 0x100 - 0x100;
        if (uVar30 == 0) {
          uVar31 = 0;
        }
        uVar17 = uVar17 | uVar31;
      }
      piVar24 = (int *)((ulong)piVar23 | 2);
      if ((int)puVar20[(long)piVar24 * 2] == 1) {
        uVar30 = *(uint *)((long)puVar20 + ((long)piVar24 * 4 + 3) * 4);
        piVar22 = (int *)(ulong)uVar30;
        uVar31 = 0xff;
        if (uVar30 < 0xff) {
          uVar31 = uVar30;
        }
        uVar31 = uVar31 * 0x10000 - 0x10000;
        if (uVar30 == 0) {
          uVar31 = 0;
        }
        uVar17 = uVar17 | uVar31;
      }
      piVar29 = (int *)((ulong)piVar23 | 3);
      if ((int)puVar20[(long)piVar29 * 2] == 1) {
        uVar30 = *(uint *)((long)puVar20 + ((long)piVar29 * 4 + 3) * 4);
        piVar22 = (int *)(ulong)uVar30;
        uVar31 = 0xff;
        if (uVar30 < 0xff) {
          uVar31 = uVar30;
        }
        uVar31 = uVar31 * 0x1000000 - 0x1000000;
        if (uVar30 == 0) {
          uVar31 = 0;
        }
        uVar17 = uVar17 | uVar31;
      }
      uVar28 = uVar33 + 1;
      if (cVar34 == '\0') goto LAB_14549f89b;
      piVar22 = *(int **)(local_b8 + 0x6b8);
      if (piVar22 <= piVar23) {
LAB_14549f9f9:
        local_81 = 0;
        func_0x000145903b33();
        goto LAB_14549fa39;
      }
      lVar19 = *(long *)(local_b8 + 0x6b0);
      uVar30 = 0;
      if (*(char *)(lVar19 + uVar33 * 0x40) != '\0') {
        uVar31 = *(uint *)(uVar33 * 0x40 + lVar19 + 0xc);
        uVar30 = 0xff;
        if (uVar31 < 0xff) {
          uVar30 = uVar31;
        }
        uVar30 = uVar30 - 1;
        if (uVar31 == 0) {
          uVar30 = 0;
        }
      }
      if (piVar22 <= piVar36) goto LAB_14549f9f9;
      if (*(int *)(lVar19 + (long)piVar36 * 0x10) == 1) {
        uVar31 = *(uint *)((long)piVar36 * 0x10 + lVar19 + 0xc);
        uVar32 = 0xff;
        if (uVar31 < 0xff) {
          uVar32 = uVar31;
        }
        uVar32 = uVar32 * 0x100 - 0x100;
        if (uVar31 == 0) {
          uVar32 = 0;
        }
        uVar30 = uVar30 | uVar32;
      }
      if (piVar22 <= piVar24) goto LAB_14549f9f9;
      if (*(int *)(lVar19 + (long)piVar24 * 0x10) == 1) {
        uVar31 = *(uint *)((long)piVar24 * 0x10 + lVar19 + 0xc);
        uVar32 = 0xff;
        if (uVar31 < 0xff) {
          uVar32 = uVar31;
        }
        uVar32 = uVar32 * 0x10000 - 0x10000;
        if (uVar31 == 0) {
          uVar32 = 0;
        }
        uVar30 = uVar30 | uVar32;
      }
      if (piVar22 <= piVar29) goto LAB_14549f9f9;
      if (*(int *)(lVar19 + (long)piVar29 * 0x10) == 1) {
        uVar31 = *(uint *)(lVar19 + (long)piVar29 * 0x10 + 0xc);
        uVar32 = 0xff;
        if (uVar31 < 0xff) {
          uVar32 = uVar31;
        }
        uVar32 = uVar32 * 0x1000000 - 0x1000000;
        if (uVar31 == 0) {
          uVar32 = 0;
        }
        piVar22 = (int *)(ulong)uVar32;
        uVar30 = uVar30 | uVar32;
      }
      puVar20 = local_c8;
      if (uVar17 != uVar30) {
LAB_14549f89b:
        uVar30 = (int)uVar33 + 0x71;
        puVar21 = (ulong *)*local_d0;
        if (puVar21 != (ulong *)0x0) {
          lVar19 = *(long *)(local_b8 + 0x8e0);
          do {
            uVar33 = (ulong)((uint)*(ushort *)((long)puVar21 + 0x36) * 2);
            piVar22 = (int *)0xffffffffffffffff;
            do {
              piVar23 = piVar22;
              piVar22 = (int *)(ulong)*(ushort *)((long)puVar21 + 0x36);
              if (uVar33 == 0) goto joined_r0x00014549f917;
              uVar2 = *(ushort *)((long)puVar21 + (long)piVar23 * 2 + 0x3a);
              uVar9 = (ushort)uVar30;
              piVar22 = (int *)((long)piVar23 + 1);
              uVar33 = uVar33 - 2;
            } while ((char)((uVar2 < uVar9) - (uVar9 < uVar2)) == '\x01');
            if (uVar2 < uVar9 == uVar9 < uVar2) {
              *(uint *)((long)puVar21 + ((long)piVar23 + 3) * 4) = uVar17;
              goto LAB_14549f685;
            }
joined_r0x00014549f917:
            if (lVar19 == 0) goto LAB_14549f922;
            lVar19 = lVar19 + -1;
            puVar21 = (ulong *)puVar21[(long)piVar22 + 10];
          } while( true );
        }
        puVar21 = (ulong *)0x0;
LAB_14549f922:
        local_90 = (ulong)(uVar30 & 0xffff);
        local_b0 = local_d0;
        pfStack_a0 = (float *)0x0;
        local_81 = 0;
        local_a8 = puVar21;
        local_98 = piVar22;
        func_0x00014552a730();
        piVar22 = extraout_RDX_05;
        puVar20 = local_c8;
      }
    } while( true );
  }
  local_82 = 1;
  func_0x00014590379b();
LAB_14549fa39:
                    /* WARNING: Does not return */
  pcVar6 = (code *)invalidInstructionException();
  (*pcVar6)();
}
