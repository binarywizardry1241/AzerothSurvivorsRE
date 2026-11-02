
/* WARNING: Removing unreachable block (ram,0x0001454d60ad) */
/* WARNING: Removing unreachable block (ram,0x0001454d6470) */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(void)

{
  long *plVar1;
  float fVar2;
  undefined8 uVar3;
  int iVar4;
  long *plVar5;
  undefined8 uVar6;
  code *pcVar7;
  undefined8 uVar8;
  byte bVar9;
  uint uVar10;
  long lVar11;
  long in_RCX;
  long lVar12;
  undefined8 *puVar13;
  ulong uVar14;
  uint uVar15;
  ulong uVar16;
  ulong uVar17;
  long lVar18;
  ulong uVar19;
  ulong uVar20;
  float extraout_XMM0_Da;
  float fVar21;
  float fVar22;
  float fVar23;
  float fVar24;
  float fVar25;
  float fVar26;
  float fVar27;
  float fVar28;
  float fVar29;
  float fVar30;
  undefined1 auVar31 [16];
  undefined8 local_1c0;
  undefined8 uStack_1b8;
  undefined8 local_1b0;
  undefined8 uStack_1a8;
  float local_168;
  int local_160;
  float fStack_154;
  undefined8 *local_118;
  ulong local_110;
  
  if (*(uint *)(in_RCX + 0x7d8) < 5) {
    return;
  }
  fVar23 = _DAT_1459eb2d0;
  if (*(long *)(in_RCX + 0x730) != 0) {
    lVar11 = *(long *)(in_RCX + 0x728);
    lVar12 = 0;
    do {
      if ((*(long *)(lVar11 + 8 + lVar12) == 9) &&
         ((char)(*(long **)(lVar11 + lVar12))[1] == 'e' &&
          **(long **)(lVar11 + lVar12) == 0x7269665f6c756f73)) {
        fVar23 = *(float *)(lVar11 + 0x10 + lVar12);
        break;
      }
      lVar12 = lVar12 + 0x18;
    } while (*(long *)(in_RCX + 0x730) * 0x18 != lVar12);
  }
  if (*(float *)(in_RCX + 0x8e4) < fVar23) {
    return;
  }
  if (*(long *)(in_RCX + 0x2a0) == 0) {
    return;
  }
  lVar11 = *(long *)(in_RCX + 0x298);
  lVar12 = 0;
  while ((plVar5 = *(long **)(lVar11 + lVar12), plVar5[1] != 9 ||
         ((char)((long *)*plVar5)[1] != 'e' || *(long *)*plVar5 != 0x7269665f6c756f73))) {
    lVar12 = lVar12 + 0x58;
    if (*(long *)(in_RCX + 0x2a0) * 0x58 - lVar12 == 0) {
      return;
    }
  }
  puVar13 = (undefined8 *)(lVar11 + 0x38 + lVar12);
  uVar6 = *puVar13;
  uVar8 = *(undefined8 *)(lVar11 + lVar12 + 0x4c);
  local_160 = (int)puVar13[1];
  fVar23 = *(float *)(lVar11 + 0x10 + lVar12);
  fVar22 = (float)*(undefined8 *)(lVar11 + 0x1c + lVar12);
  fVar25 = *(float *)(in_RCX + 0x458);
  uVar15 = *(int *)(lVar11 + 0x18 + lVar12) + *(int *)(in_RCX + 0x48c) +
           *(int *)((long)plVar5 + 0x54) + local_160;
  fVar26 = *(float *)(in_RCX + 0x45c);
  if (*(int *)((long)plVar5 + 0x54) == 0) {
    uVar15 = 0;
  }
  uVar10 = 3;
  if (uVar15 < 3) {
    uVar10 = uVar15;
  }
  uVar20 = 1;
  if (uVar15 != 0) {
    uVar20 = (ulong)uVar10;
  }
  local_118 = (undefined8 *)&DAT_00000008;
  local_110 = 0;
  if ((int)uVar20 == 0) {
    return;
  }
  fVar30 = 0.0;
  do {
    uVar16 = local_110;
    if (local_110 != 0) {
      func_0x000140002200();
      lVar11 = func_0x0001400021c0();
      if (lVar11 == 0) {
        func_0x0001458e721b();
                    /* WARNING: Does not return */
        pcVar7 = (code *)invalidInstructionException();
        (*pcVar7)();
      }
      uVar19 = (ulong)((uint)uVar16 & 3);
      fVar22 = extraout_XMM0_Da;
      if (uVar16 < 4) {
        uVar14 = 0;
      }
      else {
        uVar14 = 0;
        puVar13 = local_118;
        do {
          *(undefined8 *)(lVar11 + uVar14 * 8) = *puVar13;
          *(undefined8 *)(lVar11 + 8 + uVar14 * 8) = puVar13[3];
          *(undefined8 *)(lVar11 + 0x10 + uVar14 * 8) = puVar13[6];
          *(undefined8 *)(lVar11 + 0x18 + uVar14 * 8) = puVar13[9];
          uVar14 = uVar14 + 4;
          puVar13 = puVar13 + 0xc;
        } while ((uVar16 & 0x7fffffffffffffc) != uVar14);
        if (uVar19 == 0) goto LAB_1454d5eb3;
      }
      puVar13 = (undefined8 *)(uVar14 * 0x18 + 8);
      uVar17 = 0;
      do {
        *(undefined8 *)(lVar11 + uVar14 * 8 + uVar17 * 8) = *puVar13;
        uVar17 = uVar17 + 1;
        puVar13 = puVar13 + 3;
      } while (uVar19 != uVar17);
    }
LAB_1454d5eb3:
    auVar31 = func_0x0001454d5740(fVar22,*(undefined4 *)((long)plVar5 + 0x4c));
    if (auVar31._0_8_ != 1) {
LAB_1454d6010:
      if (uVar16 != 0) {
        func_0x0001400021d0();
      }
      break;
    }
    fVar22 = *(float *)(in_RCX + 0x8e4);
    lVar12 = *(long *)(in_RCX + 0x4c8);
    lVar18 = 0;
    lVar11 = lVar12;
    do {
      if (*(long *)(in_RCX + 0x4d0) * 0x160 - lVar18 == 0) goto LAB_1454d6010;
      lVar18 = lVar18 + 0x160;
      plVar1 = (long *)(lVar11 + 0x88);
      lVar11 = lVar11 + 0x160;
    } while (*plVar1 != auVar31._8_8_);
    fVar21 = *(float *)(lVar12 + -0x38 + lVar18);
    if (fVar21 <= fVar30) {
      uVar3 = *(undefined8 *)(lVar12 + -0x48 + lVar18);
      fVar27 = (float)uVar3;
      fVar29 = (float)((ulong)uVar3 >> 0x20);
      fVar21 = *(float *)(lVar12 + -0x40 + lVar18);
    }
    else {
      fVar21 = (fVar22 - *(float *)(lVar12 + -0x3c + lVar18)) / fVar21;
      fVar27 = 0.0;
      if (0.0 <= fVar21) {
        fVar27 = fVar21;
      }
      fVar22 = _DAT_1458eb480;
      if (fVar27 <= _DAT_1458eb480) {
        fVar22 = fVar27;
      }
      uVar3 = *(undefined8 *)(lVar12 + -0x54 + lVar18);
      fVar27 = (float)uVar3;
      fVar29 = (float)((ulong)uVar3 >> 0x20);
      uVar3 = *(undefined8 *)(lVar12 + -0x48 + lVar18);
      fVar27 = fVar22 * ((float)uVar3 - fVar27) + fVar27;
      fVar29 = fVar22 * ((float)((ulong)uVar3 >> 0x20) - fVar29) + fVar29;
      fVar21 = *(float *)(lVar12 + -0x4c + lVar18);
      fVar21 = (*(float *)(lVar12 + -0x40 + lVar18) - fVar21) * fVar22 + fVar21;
    }
    if (local_110 == 0) {
      fVar22 = (float)func_0x000145757f60();
    }
    uVar19 = local_110 + 1;
    *(long *)(local_110 * 0x18 + 8) = auVar31._8_8_;
    *(ulong *)(local_110 * 0x18 + 0x10) = CONCAT44(fVar29,fVar27);
    *(float *)(local_110 * 0x18 + 0x18) = fVar21;
    if (uVar16 != 0) {
      fVar22 = (float)func_0x0001400021d0();
    }
    local_110 = uVar19;
  } while (uVar19 < uVar20);
  if (local_110 == 0) {
    return;
  }
  *(undefined4 *)(in_RCX + 0x7d8) = 0;
  func_0x0001454d49e0();
  iVar4 = (int)plVar5[8];
  fVar22 = _DAT_1458eb480;
  if (iVar4 < 0xe16) {
    if (iVar4 < 0x5e6) {
      if (0x84 < iVar4) {
        if (iVar4 == 0x85) goto LAB_1454d6187;
        if ((iVar4 != 0x193) && (iVar4 != 0x2ae)) goto LAB_1454d620a;
        goto LAB_1454d6153;
      }
      if (iVar4 != 0x4b) {
        if (iVar4 != 0x74) goto LAB_1454d620a;
LAB_1454d61be:
        fVar22 = _DAT_145933c50;
        goto LAB_1454d620a;
      }
    }
    else {
      fVar22 = _DAT_1458f6600;
      if (iVar4 < 0xa53) {
        if ((iVar4 == 0x5e6) || (fVar22 = _DAT_1458eb480, iVar4 != 0x7ba)) goto LAB_1454d620a;
      }
      else {
        if (iVar4 == 0xa53) goto LAB_1454d620a;
        if (iVar4 == 0xafc) goto LAB_1454d6153;
        fVar22 = _DAT_1458eb480;
        if (iVar4 != 0xbe4) goto LAB_1454d620a;
      }
    }
  }
  else if (iVar4 < 0x1b05) {
    if (0x1437 < iVar4) {
      if (iVar4 != 0x1438) {
        if ((iVar4 != 0x18d1) && (iVar4 != 0x1a85)) goto LAB_1454d620a;
LAB_1454d6187:
        fVar22 = _DAT_14593e294;
        goto LAB_1454d620a;
      }
LAB_1454d6153:
      fVar22 = _DAT_1458f8fa0;
      goto LAB_1454d620a;
    }
    fVar22 = _DAT_1459c7a20;
    if ((iVar4 == 0xe16) || (fVar22 = _DAT_1458eb480, iVar4 != 0x13fc)) goto LAB_1454d620a;
  }
  else if (iVar4 < 0x2c66) {
    if (iVar4 != 0x1b05) {
      if (iVar4 != 0x1c65) {
        if (iVar4 != 0x27c5) goto LAB_1454d620a;
        goto LAB_1454d61be;
      }
      goto LAB_1454d6153;
    }
  }
  else {
    fVar22 = _DAT_1459c79e8;
    if (iVar4 == 0x5ed3) goto LAB_1454d620a;
    if (iVar4 != 0x4bea) {
      fVar22 = _DAT_1458eb480;
      if (iVar4 != 0x2c66) goto LAB_1454d620a;
      goto LAB_1454d6187;
    }
  }
  fVar22 = _DAT_1458f6680;
LAB_1454d620a:
  local_168 = (float)uVar6;
  fStack_154 = (float)uVar8;
  fVar25 = fVar25 * fStack_154;
  fVar30 = _DAT_1459eb3c0;
  fVar21 = _DAT_1458f8d40;
  for (; local_118 != (undefined8 *)(local_110 * 0x18 + 8); local_118 = local_118 + 3) {
    uVar6 = *local_118;
    fVar27 = *(float *)(local_118 + 1);
    fVar29 = *(float *)((long)local_118 + 0xc);
    func_0x00014544b1a0();
    lVar11 = *(long *)(in_RCX + 0x548);
    if (lVar11 == *(long *)(in_RCX + 0x538)) {
      func_0x0001457580b0();
    }
    lVar12 = *(long *)(in_RCX + 0x540);
    puVar13 = (undefined8 *)(lVar12 + 0x10 + lVar11 * 0x20);
    *puVar13 = local_1b0;
    puVar13[1] = uStack_1a8;
    puVar13 = (undefined8 *)(lVar12 + lVar11 * 0x20);
    *puVar13 = local_1c0;
    puVar13[1] = uStack_1b8;
    *(long *)(in_RCX + 0x548) = lVar11 + 1;
    uVar16 = *(ulong *)(in_RCX + 0x880);
    uVar20 = *(ulong *)(in_RCX + 0x898) + uVar16;
    uVar19 = *(ulong *)(in_RCX + 0x888);
    uVar17 = *(ulong *)(in_RCX + 0x890) ^ uVar16;
    uVar14 = *(ulong *)(in_RCX + 0x898) ^ uVar19;
    *(ulong *)(in_RCX + 0x888) = uVar19 ^ uVar17;
    *(ulong *)(in_RCX + 0x880) = uVar16 ^ uVar14;
    *(ulong *)(in_RCX + 0x890) = uVar17 ^ uVar19 << 0x11;
    *(ulong *)(in_RCX + 0x898) = uVar14 << 0x2d | uVar14 >> 0x13;
    fVar24 = (float)(uint)((uVar20 * 0x800000 | uVar20 >> 0x29) + uVar16 >> 0x28) * fVar30;
    bVar9 = *(char *)((long)plVar5 + 0x75) - 2;
    fVar28 = _DAT_1458eb480;
    if (bVar9 < 7) {
      fVar28 = *(float *)((ulong)bVar9 * 4 + 0x1469aca9c);
    }
    fVar2 = *(float *)(in_RCX + 0x464);
    fVar28 = (*(float *)((long)plVar5 + 0x44) * fVar21 * fVar23 * local_168 * fVar28 +
             (float)(-(uint)(0.0 < *(float *)((long)plVar5 + 0x44)) & (uint)fVar25)) * fVar26;
    if (fVar24 < fVar2) {
      fVar28 = fVar28 * *(float *)(in_RCX + 0x468);
    }
    fVar27 = *(float *)(in_RCX + 1000) - fVar27;
    fVar29 = *(float *)(in_RCX + 0x3ec) - fVar29;
    fVar27 = SQRT(fVar29 * fVar29 + fVar27 * fVar27) / fVar22 + *(float *)(in_RCX + 0x8e4);
    lVar11 = *(long *)(in_RCX + 0x748);
    if (lVar11 == *(long *)(in_RCX + 0x738)) {
      func_0x000145757f60();
    }
    lVar12 = *(long *)(in_RCX + 0x740);
    *(undefined8 *)(lVar12 + lVar11 * 0x18) = uVar6;
    *(float *)(lVar12 + 8 + lVar11 * 0x18) = fVar27;
    *(float *)(lVar12 + 0xc + lVar11 * 0x18) = fVar28;
    *(bool *)(lVar12 + 0x10 + lVar11 * 0x18) = fVar24 < fVar2;
    *(long *)(in_RCX + 0x748) = lVar11 + 1;
  }
  return;
}

