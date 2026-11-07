/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 param_4,long *param_5,
          long *param_6)

{
  float fVar1;
  char cVar2;
  long lVar3;
  long lVar4;
  long lVar5;
  long lVar6;
  uint *puVar7;
  code *pcVar8;
  char cVar9;
  bool bVar10;
  long lVar11;
  undefined8 uVar12;
  byte bVar13;
  uint uVar14;
  int iVar15;
  char *pcVar16;
  undefined8 *puVar17;
  uint *puVar18;
  long extraout_RDX;
  float *pfVar19;
  ulong uVar20;
  long *plVar21;
  undefined8 *puVar22;
  long lVar23;
  long lVar24;
  long lVar25;
  long lVar26;
  int iVar27;
  long lVar28;
  long lVar29;
  ulong uVar30;
  undefined8 *puVar31;
  float fVar32;
  float fVar33;
  undefined4 uVar34;
  undefined4 uVar35;
  undefined4 uVar36;
  undefined4 uVar37;
  undefined8 *in_stack_00000028;
  long *in_stack_00000030;
  uint *local_218;
  uint *puStack_210;
  undefined4 uStack_204;
  undefined4 uStack_200;
  undefined4 uStack_1f8;
  undefined4 uStack_1f4;
  undefined4 *puStack_1e8;
  undefined4 uStack_1d8;
  undefined4 uStack_1d4;
  undefined4 local_1cc;
  long local_1c8;
  long local_1b8;
  undefined4 local_1ac;
  undefined4 *local_1a8;
  undefined4 *local_198;
  undefined4 local_18c;
  undefined4 *local_188;
  undefined4 *local_178;
  undefined4 local_16c;
  char *local_168;
  long local_160;
  long local_150;
  undefined4 local_144;
  uint local_140;
  uint local_13c;
  byte local_138;
  undefined4 local_110;
  undefined4 uStack_10c;
  undefined4 uStack_108;
  undefined4 uStack_104;
  long local_100;
  undefined8 local_f8;
  undefined4 uStack_f0;
  undefined4 uStack_ec;
  undefined4 local_e8;
  long *local_d0;
  long local_c8;
  long local_c0;
  undefined4 local_a4;
  undefined4 *local_a0;
  undefined4 *local_90;
  char *local_80;

  lVar28 = *param_3;
  lVar26 = *param_6;
  puVar31 = (undefined8 *)*in_stack_00000028;
  lVar29 = in_stack_00000028[1];
  lVar3 = *in_stack_00000030;
  lVar4 = in_stack_00000030[1];
  lVar11 = in_stack_00000030[3];
  puVar22 = (undefined8 *)(lVar28 + 0x60);
  cVar2 = *(char *)(lVar28 + 0x60);
  if (cVar2 == -1) {
LAB_14027b503:
    bVar13 = 0;
  }
  else {
    lVar25 = *param_5;
    pcVar16 = (char *)func_0x000142ad39e0(lVar28,*(undefined4 *)((long)in_stack_00000028 + 0x14),0xc
                                          ,0x145dc06a0,puVar22);
    if (pcVar16 == (char *)0x0) {
      pcVar16 = _DAT_147fda290;
    }
    if (((((*pcVar16 != '\x02') || (*(long *)(pcVar16 + 8) != 0)) ||
         (*(long *)(pcVar16 + 0x10) == 0)) ||
        ((*(char *)(lVar25 + 7) == '\0' || (*(char *)(lVar28 + 0x80) != -1)))) ||
       (*(char *)(lVar28 + 0xa0) != -1)) goto LAB_14027b503;
    bVar13 = *(byte *)(lVar28 + 0xea) ^ 1;
  }
  func_0x00014003e900();
  local_90 = puStack_1e8;
  local_a0 = (undefined4 *)CONCAT44(uStack_1d4,uStack_1d8);
  local_c0 = local_1c8;
  local_c8 = local_1b8;
  uVar20 = (ulong)local_138;
  local_80 = local_168;
  if ((local_138 & 1) == 0) {
    local_a4 = local_144;
    if (local_13c == local_140) {
      do {
        if (local_218 == puStack_210) goto LAB_14027b71b;
        uVar14 = *local_218;
        local_218 = local_218 + 1;
        uVar20 = *(ulong *)(lVar29 + 0x108);
        lVar25 = *(long *)(uVar20 + 0x58 + (ulong)uVar14 * 0xa0);
      } while (lVar25 == 0);
      lVar23 = uVar20 + (ulong)uVar14 * 0xa0;
      uVar20 = (ulong)*(uint *)(lVar23 + 0x94);
      lVar28 = *(long *)(lVar29 + 0x1a8);
      lVar5 = *(long *)(lVar28 + 0x18 + uVar20 * 0x48);
      lVar6 = *(long *)(lVar28 + 0x38 + uVar20 * 0x48);
      lVar24 = ~*(ulong *)(lVar6 + puVar31[0x22] * 8) * 0x30;
      local_13c = 0;
      if (((ulong)puVar31[0x23] < *(ulong *)(lVar28 + 0x40 + uVar20 * 0x48)) &&
         (uVar20 = *(ulong *)(lVar6 + puVar31[0x23] * 8), uVar20 != 0)) {
        local_80 = *(char **)(lVar5 + 0x10 + ~uVar20 * 0x30);
      }
      else {
        local_80 = (char *)0x0;
      }
      local_90 = *(undefined4 **)(lVar5 + 0x10 + lVar24);
      local_a0 = *(undefined4 **)(lVar5 + 0x28 + lVar24);
      lVar28 = ~*(ulong *)(lVar6 + puVar31[0x24] * 8) * 0x30;
      local_c0 = *(long *)(lVar5 + 0x10 + lVar28);
      local_c8 = *(long *)(lVar5 + 0x28 + lVar28);
      lVar28 = ~*(ulong *)(lVar6 + puVar31[0x25] * 8) * 0x30;
      local_1a8 = *(undefined4 **)(lVar5 + 0x10 + lVar28);
      local_198 = *(undefined4 **)(lVar5 + 0x28 + lVar28);
      lVar28 = ~*(ulong *)(lVar6 + puVar31[0x26] * 8) * 0x30;
      local_188 = *(undefined4 **)(lVar5 + 0x10 + lVar28);
      local_178 = *(undefined4 **)(lVar5 + 0x28 + lVar28);
      lVar28 = ~*(ulong *)(lVar6 + puVar31[0x27] * 8) * 0x30;
      local_160 = *(long *)(lVar5 + 0x10 + lVar28);
      local_150 = *(long *)(lVar5 + 0x28 + lVar28);
      lVar28 = *(long *)(lVar23 + 0x50);
      local_140 = (uint)lVar25;
    }
    else {
      lVar28 = CONCAT44(uStack_1f4,uStack_1f8);
    }
    uVar30 = (ulong)~*(uint *)(lVar28 + 8 + (ulong)local_13c * 0x10);
  }
  else if (local_13c == local_140) {
    do {
      if (local_218 == puStack_210) goto LAB_14027b71b;
      uVar14 = *local_218;
      local_218 = local_218 + 1;
      lVar28 = *(long *)(*(long *)(lVar29 + 0x1a8) + 0x10 + (ulong)uVar14 * 0x48);
      uVar20 = 0;
    } while (lVar28 == 0);
    lVar25 = *(long *)(lVar29 + 0x1a8) + (ulong)uVar14 * 0x48;
    lVar5 = *(long *)(lVar25 + 0x18);
    lVar6 = *(long *)(lVar25 + 0x38);
    lVar23 = ~*(ulong *)(lVar6 + puVar31[0x22] * 8) * 0x30;
    local_13c = 0;
    if (((ulong)puVar31[0x23] < *(ulong *)(lVar25 + 0x40)) &&
       (uVar20 = *(ulong *)(lVar6 + puVar31[0x23] * 8), uVar20 != 0)) {
      local_80 = *(char **)(lVar5 + 0x10 + ~uVar20 * 0x30);
    }
    else {
      local_80 = (char *)0x0;
    }
    local_90 = *(undefined4 **)(lVar5 + 0x10 + lVar23);
    local_a0 = *(undefined4 **)(lVar5 + 0x28 + lVar23);
    lVar25 = ~*(ulong *)(lVar6 + puVar31[0x24] * 8) * 0x30;
    local_c0 = *(long *)(lVar5 + 0x10 + lVar25);
    local_c8 = *(long *)(lVar5 + 0x28 + lVar25);
    lVar25 = ~*(ulong *)(lVar6 + puVar31[0x25] * 8) * 0x30;
    local_1a8 = *(undefined4 **)(lVar5 + 0x10 + lVar25);
    local_198 = *(undefined4 **)(lVar5 + 0x28 + lVar25);
    lVar25 = ~*(ulong *)(lVar6 + puVar31[0x26] * 8) * 0x30;
    local_188 = *(undefined4 **)(lVar5 + 0x10 + lVar25);
    local_178 = *(undefined4 **)(lVar5 + 0x28 + lVar25);
    lVar25 = ~*(ulong *)(lVar6 + puVar31[0x27] * 8) * 0x30;
    local_160 = *(long *)(lVar5 + 0x10 + lVar25);
    local_150 = *(long *)(lVar5 + 0x28 + lVar25);
    local_140 = (uint)lVar28;
    uVar30 = 0;
  }
  else {
    uVar30 = (ulong)local_13c;
  }
  local_d0 = (long *)(local_188 + uVar30 * 6);
  uVar20 = uVar30 * 0x180 + local_c0;
  local_188 = local_1a8 + uVar30 * 0x14;
  pfVar19 = (float *)(local_90 + uVar30);
  puStack_1e8 = local_a0 + uVar30;
  local_168 = local_80 + uVar30;
  local_1a8 = (undefined4 *)(local_c8 + uVar30 * 4);
  local_198 = local_198 + uVar30;
  local_a0 = local_178 + uVar30;
  local_178 = (undefined4 *)(local_150 + uVar30 * 4);
  puVar31 = (undefined8 *)(uVar30 * 0x20 + local_160);
  uVar14 = local_13c + 1;
  local_a4 = local_144;
  goto joined_r0x00014027b727;
LAB_14027bebb:
  iVar15 = 0;
  iVar27 = 0;
  plVar21 = (long *)0x0;
  goto LAB_14027bec3;
LAB_14027bf3a:
  bVar10 = true;
  if ((plVar21 != (long *)0x0) &&
     ((plVar21[2] != extraout_RDX || (iVar15 = func_0x000145bc9787(), iVar15 != 0)))) {
    *(int *)puVar17 = (int)lVar11;
    if (*plVar21 != 0) {
      func_0x0001400021d0();
      puVar17 = puVar22;
    }
    *plVar21 = extraout_RDX;
    plVar21[1] = (long)local_90;
    plVar21[2] = extraout_RDX;
    bVar10 = false;
  }
  goto LAB_14027bfb1;
LAB_14027c19b:
  iVar15 = 0;
  iVar27 = 0;
  plVar21 = (long *)0x0;
  goto LAB_14027c1a3;
LAB_14027c20b:
  if ((plVar21 != (long *)0x0) &&
     ((plVar21[2] != local_100 || (iVar15 = func_0x000145bc9787(), iVar15 != 0)))) {
    *(int *)puVar17 = (int)lVar11;
    if (*plVar21 != 0) {
      func_0x0001400021d0();
    }
    plVar21[2] = local_100;
    *(undefined4 *)plVar21 = local_110;
    *(undefined4 *)((long)plVar21 + 4) = uStack_10c;
    *(undefined4 *)(plVar21 + 1) = uStack_108;
    *(undefined4 *)((long)plVar21 + 0xc) = uStack_104;
    goto LAB_14027c293;
  }
  goto LAB_14027c26e;
LAB_14027b71b:
  pfVar19 = (float *)0x0;
  uVar14 = local_140;
joined_r0x00014027b727:
  if ((local_138 & 1) == 0) {
    if (uVar14 != local_140) {
      return;
    }
    while (local_218 != puStack_210) {
      uVar14 = *local_218;
      local_218 = local_218 + 1;
      if (*(long *)(*(long *)(lVar29 + 0x108) + 0x58 + (ulong)uVar14 * 0xa0) != 0) {
        return;
      }
    }
  }
  else {
    if (uVar14 != local_140) {
      return;
    }
    while (local_218 != puStack_210) {
      uVar14 = *local_218;
      local_218 = local_218 + 1;
      if (*(long *)(*(long *)(lVar29 + 0x1a8) + 0x10 + (ulong)uVar14 * 0x48) != 0) {
        return;
      }
    }
  }
  if (pfVar19 == (float *)0x0) {
    return;
  }
  cVar9 = (bVar13 == 0) * '\x03';
  if (*(char *)(uVar20 + 0x175) != cVar9) {
    *local_1a8 = local_1ac;
    *(char *)(uVar20 + 0x175) = cVar9;
  }
  if (bVar13 == 0) {
    return;
  }
  fVar32 = 0.0;
  if (*local_168 != '\x02') {
    fVar32 = _DAT_145d6d36c;
  }
  fVar1 = *pfVar19;
  fVar33 = *(float *)(lVar26 + 0x58) * _DAT_145d6d320;
  if (_DAT_145d6d36c <= fVar33) {
    fVar33 = _DAT_145d6d36c;
  }
  *puStack_1e8 = local_1cc;
  *pfVar19 = fVar33 * (fVar32 - fVar1) + *pfVar19;
  func_0x000145bc97bd(*(float *)(lVar26 + 0x5c) * _DAT_145d9ae98);
  func_0x000144c6e0b0();
  uStack_204 = (undefined4)local_f8;
  uStack_200 = (undefined4)((ulong)local_f8 >> 0x20);
  *local_198 = local_18c;
  *(ulong *)(local_188 + 0x10) = CONCAT44(uStack_f0,uStack_200);
  *(ulong *)(local_188 + 0x12) = CONCAT44(local_e8,uStack_ec);
  *(ulong *)(local_188 + 0xc) = CONCAT44(uStack_ec,uStack_f0);
  *(ulong *)(local_188 + 0xe) = CONCAT44(uStack_204,local_e8);
  local_188[8] = uStack_ec;
  local_188[9] = local_e8;
  local_188[10] = uStack_204;
  local_188[0xb] = uStack_200;
  local_188[4] = local_e8;
  local_188[5] = uStack_204;
  local_188[6] = uStack_200;
  local_188[7] = uStack_f0;
  *local_188 = uStack_204;
  local_188[1] = uStack_200;
  local_188[2] = uStack_f0;
  local_188[3] = uStack_ec;
  func_0x000140002200();
  puVar17 = (undefined8 *)func_0x0001400021c0();
  if (puVar17 == (undefined8 *)0x0) {
    func_0x000145d69431();
                    /* WARNING: Does not return */
    pcVar8 = (code *)invalidInstructionException();
    (*pcVar8)();
  }
  func_0x000144c67100();
  uVar34 = uStack_204;
  uVar35 = uStack_200;
  uVar36 = uStack_f0;
  uVar37 = uStack_ec;
  func_0x000144c67100();
  uVar12 = uRam0000000145da8e68;
  fVar32 = *pfVar19 * _DAT_145d6d5c0 + _DAT_145d6d890;
  *puVar17 = _DAT_145da8e60;
  puVar17[1] = uVar12;
  uVar12 = uRam0000000145dbf598;
  puVar17[2] = _DAT_145dbf590;
  puVar17[3] = uVar12;
  *(undefined4 *)(puVar17 + 4) = 1;
  *(undefined4 *)((long)puVar17 + 0x24) = uVar34;
  *(undefined4 *)(puVar17 + 5) = uVar35;
  *(undefined4 *)((long)puVar17 + 0x2c) = uVar36;
  *(undefined4 *)(puVar17 + 6) = uVar37;
  uVar36 = uRam0000000145d6d31c;
  uVar35 = uRam0000000145d6d318;
  uVar34 = uRam0000000145d6d314;
  *(undefined4 *)((long)puVar17 + 0x34) = _DAT_145d6d310;
  *(undefined4 *)(puVar17 + 7) = uVar34;
  *(undefined4 *)((long)puVar17 + 0x3c) = uVar35;
  *(undefined4 *)(puVar17 + 8) = uVar36;
  *(undefined8 *)((long)puVar17 + 0x44) = 0x3f80000000000001;
  *(undefined4 *)((long)puVar17 + 0x4c) = 1;
  *(float *)(puVar17 + 10) = fVar32;
  *(undefined4 *)((long)puVar17 + 0x54) = 1;
  *(undefined4 *)(puVar17 + 0xb) = uStack_204;
  *(undefined4 *)((long)puVar17 + 0x5c) = uStack_200;
  *(undefined4 *)(puVar17 + 0xc) = uStack_f0;
  *(undefined4 *)((long)puVar17 + 100) = uStack_ec;
  *local_a0 = local_16c;
  if (*local_d0 != 0) {
    func_0x0001400021d0();
  }
  *local_d0 = 2;
  local_d0[1] = (long)puVar17;
  local_d0[2] = 2;
  fVar32 = *pfVar19 * _DAT_145d9ae94;
  *local_178 = local_a4;
  *puVar31 = 1;
  *(undefined4 *)(puVar31 + 1) = 1;
  *(float *)((long)puVar31 + 0xc) = fVar32;
  fVar32 = *pfVar19 * _DAT_145dbf5a0 + _DAT_145d6d36c;
  *local_178 = local_a4;
  *(float *)(puVar31 + 2) = fVar32;
  *(float *)((long)puVar31 + 0x14) = fVar32;
  func_0x000145ba3640();
  if (-1 < extraout_RDX) {
    if (extraout_RDX == 0) {
      local_90 = (undefined4 *)0x1;
    }
    else {
      func_0x000140002200();
      local_90 = (undefined4 *)func_0x0001400021c0();
      if (local_90 == (undefined4 *)0x0) goto LAB_14027bd22;
      func_0x000145bc977b();
    }
    func_0x000140376e00();
    puVar7 = *(uint **)(lVar3 + 0xf8);
    lVar28 = *(long *)(lVar3 + 0x100) * 4;
    puVar18 = puVar7;
    if (*(char *)(lVar3 + 0x108) == '\0') {
      do {
        if (lVar28 == 0) goto LAB_14027bebb;
        uVar14 = *puVar18;
        puVar18 = puVar18 + 1;
        lVar26 = *(long *)(*(long *)(lVar4 + 0x108) + 0x58 + (ulong)uVar14 * 0xa0);
        lVar28 = lVar28 + -4;
      } while (lVar26 == 0);
      lVar25 = *(long *)(lVar4 + 0x108) + (ulong)uVar14 * 0xa0;
      uVar20 = (ulong)*(uint *)(lVar25 + 0x94);
      lVar28 = *(long *)(*(long *)(lVar4 + 0x1a8) + 0x18 + uVar20 * 0x48);
      lVar29 = ~*(ulong *)(*(long *)(*(long *)(lVar4 + 0x1a8) + 0x38 + uVar20 * 0x48) +
                          *(long *)(lVar3 + 0x110) * 8) * 0x30;
      uVar20 = (ulong)~*(uint *)(*(long *)(lVar25 + 0x50) + 8);
      plVar21 = (long *)(uVar20 * 0x18 + *(long *)(lVar28 + 0x10 + lVar29));
      puVar17 = (undefined8 *)(uVar20 * 4 + *(long *)(lVar28 + 0x28 + lVar29));
    }
    else {
      do {
        if (lVar28 == 0) goto LAB_14027bebb;
        uVar14 = *puVar18;
        puVar18 = puVar18 + 1;
        lVar26 = *(long *)(*(long *)(lVar4 + 0x1a8) + 0x10 + (ulong)uVar14 * 0x48);
        lVar28 = lVar28 + -4;
      } while (lVar26 == 0);
      lVar28 = *(long *)(lVar4 + 0x1a8) + (ulong)uVar14 * 0x48;
      lVar29 = *(long *)(lVar28 + 0x18);
      lVar28 = ~*(ulong *)(*(long *)(lVar28 + 0x38) + *(long *)(lVar3 + 0x110) * 8) * 0x30;
      plVar21 = *(long **)(lVar29 + 0x10 + lVar28);
      puVar17 = *(undefined8 **)(lVar29 + 0x28 + lVar28);
    }
    iVar15 = (int)lVar26;
    iVar27 = 1;
LAB_14027bec3:
    bVar10 = true;
    if (*(char *)(lVar3 + 0x108) == '\0') {
      if (iVar27 == iVar15) {
        do {
          if (puVar18 == puVar7 + *(long *)(lVar3 + 0x100)) goto LAB_14027bf3a;
          uVar14 = *puVar18;
          puVar18 = puVar18 + 1;
        } while (*(long *)(*(long *)(lVar4 + 0x108) + 0x58 + (ulong)uVar14 * 0xa0) == 0);
      }
    }
    else if (iVar27 == iVar15) {
      do {
        if (puVar18 == puVar7 + *(long *)(lVar3 + 0x100)) goto LAB_14027bf3a;
        uVar14 = *puVar18;
        puVar18 = puVar18 + 1;
      } while (*(long *)(*(long *)(lVar4 + 0x1a8) + 0x10 + (ulong)uVar14 * 0x48) == 0);
    }
LAB_14027bfb1:
    if (cVar2 != -1) {
      func_0x000142ad39e0();
    }
    func_0x0001458da4e0();
    func_0x0001458da940();
    func_0x000140376e00();
    puVar7 = *(uint **)(lVar3 + 0x218);
    lVar28 = *(long *)(lVar3 + 0x220) * 4;
    puVar18 = puVar7;
    if (*(char *)(lVar3 + 0x228) == '\0') {
      do {
        if (lVar28 == 0) goto LAB_14027c19b;
        uVar14 = *puVar18;
        puVar18 = puVar18 + 1;
        lVar26 = *(long *)(*(long *)(lVar4 + 0x108) + 0x58 + (ulong)uVar14 * 0xa0);
        lVar28 = lVar28 + -4;
      } while (lVar26 == 0);
      lVar25 = *(long *)(lVar4 + 0x108) + (ulong)uVar14 * 0xa0;
      uVar20 = (ulong)*(uint *)(lVar25 + 0x94);
      lVar28 = *(long *)(*(long *)(lVar4 + 0x1a8) + 0x18 + uVar20 * 0x48);
      lVar29 = ~*(ulong *)(*(long *)(*(long *)(lVar4 + 0x1a8) + 0x38 + uVar20 * 0x48) +
                          *(long *)(lVar3 + 0x230) * 8) * 0x30;
      uVar20 = (ulong)~*(uint *)(*(long *)(lVar25 + 0x50) + 8);
      plVar21 = (long *)(uVar20 * 0x18 + *(long *)(lVar28 + 0x10 + lVar29));
      puVar17 = (undefined8 *)(uVar20 * 4 + *(long *)(lVar28 + 0x28 + lVar29));
    }
    else {
      do {
        if (lVar28 == 0) goto LAB_14027c19b;
        uVar14 = *puVar18;
        puVar18 = puVar18 + 1;
        lVar26 = *(long *)(*(long *)(lVar4 + 0x1a8) + 0x10 + (ulong)uVar14 * 0x48);
        lVar28 = lVar28 + -4;
      } while (lVar26 == 0);
      lVar28 = *(long *)(lVar4 + 0x1a8) + (ulong)uVar14 * 0x48;
      lVar29 = *(long *)(lVar28 + 0x18);
      lVar28 = ~*(ulong *)(*(long *)(lVar28 + 0x38) + *(long *)(lVar3 + 0x230) * 8) * 0x30;
      plVar21 = *(long **)(lVar29 + 0x10 + lVar28);
      puVar17 = *(undefined8 **)(lVar29 + 0x28 + lVar28);
    }
    iVar15 = (int)lVar26;
    iVar27 = 1;
LAB_14027c1a3:
    lVar28 = extraout_RDX;
    if (*(char *)(lVar3 + 0x228) == '\0') {
      if (iVar27 == iVar15) {
        do {
          if (puVar18 == puVar7 + *(long *)(lVar3 + 0x220)) goto LAB_14027c20b;
          uVar14 = *puVar18;
          puVar18 = puVar18 + 1;
        } while (*(long *)(*(long *)(lVar4 + 0x108) + 0x58 + (ulong)uVar14 * 0xa0) == 0);
      }
    }
    else if (iVar27 == iVar15) {
      do {
        if (puVar18 == puVar7 + *(long *)(lVar3 + 0x220)) goto LAB_14027c20b;
        uVar14 = *puVar18;
        puVar18 = puVar18 + 1;
      } while (*(long *)(*(long *)(lVar4 + 0x1a8) + 0x10 + (ulong)uVar14 * 0x48) == 0);
    }
LAB_14027c26e:
    if (CONCAT44(uStack_10c,local_110) != 0) {
      func_0x0001400021d0();
    }
LAB_14027c293:
    if (lVar28 != 0 && bVar10) {
      func_0x0001400021d0();
    }
    return;
  }
LAB_14027bd22:
  func_0x000145d6944b();
                    /* WARNING: Does not return */
  pcVar8 = (code *)invalidInstructionException();
  (*pcVar8)();
}
