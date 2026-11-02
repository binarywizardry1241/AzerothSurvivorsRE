
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 param_4,long *param_5,
          undefined8 *param_6)

{
  long *plVar1;
  char *pcVar2;
  undefined8 *puVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  undefined4 *puVar6;
  long lVar7;
  undefined8 uVar8;
  undefined8 uVar9;
  undefined8 uVar10;
  undefined8 uVar11;
  bool bVar12;
  byte bVar13;
  long lVar14;
  ulong uVar15;
  long lVar16;
  long lVar17;
  long lVar18;
  int iVar19;
  uint *puVar20;
  undefined8 uVar21;
  undefined4 *puVar22;
  ulong uVar23;
  int *piVar24;
  float *pfVar25;
  uint *puVar26;
  uint *puVar27;
  ulong uVar28;
  int iVar29;
  uint uVar30;
  ulong uVar31;
  long lVar32;
  long lVar33;
  long lVar34;
  float fVar35;
  float fVar36;
  float fVar37;
  float fVar38;
  float fVar39;
  float fVar40;
  undefined4 in_XMM6_Da;
  float fVar41;
  undefined4 in_XMM7_Da;
  float fVar42;
  float fVar43;
  undefined4 uVar44;
  float fVar45;
  float fVar46;
  undefined8 *in_stack_00000028;
  long *in_stack_00000030;
  long *in_stack_00000038;
  uint local_128;
  float afStack_124 [2];
  uint uStack_11c;
  float local_114;
  uint local_110;
  float local_108;
  long local_100;
  undefined4 local_f4 [3];
  undefined4 local_e8;
  undefined4 local_d8;
  
  puVar22 = (undefined4 *)*param_6;
  lVar16 = param_6[1];
  uVar4 = *(undefined4 *)((long)param_6 + 0x14);
  puVar20 = *(uint **)(puVar22 + 0x3e);
  plVar1 = (long *)(puVar22 + 0x40);
  pcVar2 = (char *)(puVar22 + 0x42);
  lVar18 = *plVar1 * 4;
  puVar26 = puVar20;
  if (*pcVar2 == '\0') {
    do {
      if (lVar18 == 0) goto LAB_140964c0a;
      uVar30 = *puVar26;
      puVar26 = puVar26 + 1;
      lVar32 = *(long *)(*(long *)(lVar16 + 0x108) + 0x58 + (ulong)uVar30 * 0xa0);
      lVar18 = lVar18 + -4;
    } while (lVar32 == 0);
    lVar18 = *(long *)(lVar16 + 0x108) + (ulong)uVar30 * 0xa0;
    uVar15 = (ulong)*(uint *)(lVar18 + 0x94);
    lVar17 = *(long *)(*(long *)(lVar16 + 0x1a8) + 0x18 + uVar15 * 0x48);
    lVar14 = ~*(ulong *)(*(long *)(*(long *)(lVar16 + 0x1a8) + 0x38 + uVar15 * 0x48) +
                        *(long *)(puVar22 + 0x44) * 8) * 0x30;
    uVar15 = (ulong)~*(uint *)(*(long *)(lVar18 + 0x50) + 8);
    lVar18 = uVar15 * 0x30 + *(long *)(lVar17 + 0x10 + lVar14);
    puVar22 = (undefined4 *)(uVar15 * 4 + *(long *)(lVar17 + 0x28 + lVar14));
  }
  else {
    do {
      if (lVar18 == 0) goto LAB_140964c0a;
      uVar30 = *puVar26;
      puVar26 = puVar26 + 1;
      lVar32 = *(long *)(*(long *)(lVar16 + 0x1a8) + 0x10 + (ulong)uVar30 * 0x48);
      lVar18 = lVar18 + -4;
    } while (lVar32 == 0);
    lVar18 = *(long *)(lVar16 + 0x1a8) + (ulong)uVar30 * 0x48;
    lVar17 = *(long *)(lVar18 + 0x18);
    lVar14 = ~*(ulong *)(*(long *)(lVar18 + 0x38) + *(long *)(puVar22 + 0x44) * 8) * 0x30;
    lVar18 = *(long *)(lVar17 + 0x10 + lVar14);
    puVar22 = *(undefined4 **)(lVar17 + 0x28 + lVar14);
  }
  iVar29 = (int)lVar32;
  iVar19 = 1;
LAB_140964c11:
  lVar32 = *param_3;
  puVar6 = (undefined4 *)param_3[2];
  uVar5 = *(undefined4 *)((long)param_3 + 0x1c);
  local_100 = *param_5;
  lVar17 = *in_stack_00000030;
  lVar14 = in_stack_00000030[1];
  lVar7 = *in_stack_00000038;
  lVar33 = in_stack_00000038[1];
  puVar27 = puVar20 + *plVar1;
  if (*pcVar2 == '\0') {
    if (iVar19 != iVar29) {
      return;
    }
    while (puVar26 != puVar27) {
      uVar30 = *puVar26;
      puVar26 = puVar26 + 1;
      puVar20 = (uint *)((ulong)uVar30 * 0xa0);
      if (*(long *)(*(long *)(lVar16 + 0x108) + 0x58 + (long)puVar20) != 0) {
        return;
      }
    }
  }
  else {
    if (iVar19 != iVar29) {
      return;
    }
    while (puVar26 != puVar27) {
      uVar30 = *puVar26;
      puVar26 = puVar26 + 1;
      puVar20 = (uint *)((ulong)uVar30 * 9);
      if (*(long *)(*(long *)(lVar16 + 0x1a8) + 0x10 + (ulong)uVar30 * 0x48) != 0) {
        return;
      }
    }
  }
  if (lVar18 == 0) {
    return;
  }
  iVar19 = *(int *)*in_stack_00000028;
  if (iVar19 == 0) {
    puVar27 = *(uint **)(lVar7 + 0xf8);
    puVar26 = puVar27 + *(long *)(lVar7 + 0x100);
    if (*(char *)(lVar7 + 0x108) != '\0') {
      lVar34 = 8;
      uVar15 = 0;
      uVar28 = 0;
      uVar31 = 0;
LAB_140964d47:
      if ((int)uVar31 == (int)uVar15) {
LAB_140964d50:
        if (puVar27 != puVar26) goto code_r0x000140964d55;
        lVar16 = 8;
LAB_140964ddd:
        puVar20 = (uint *)0x0;
        puVar27 = puVar26;
        uVar23 = uVar15;
        goto LAB_140964de5;
      }
      goto LAB_140964d2e;
    }
    lVar16 = 8;
    uVar15 = 0;
    uVar23 = 0;
    uVar28 = 0;
    do {
      if ((int)uVar23 == (int)uVar15) {
        do {
          if (puVar27 == puVar26) {
            lVar34 = 8;
            goto LAB_140964ddd;
          }
          uVar30 = *puVar27;
          puVar27 = puVar27 + 1;
          uVar31 = *(ulong *)(*(long *)(lVar33 + 0x108) + 0x58 + (ulong)uVar30 * 0xa0);
        } while (uVar31 == 0);
        lVar16 = *(long *)(*(long *)(lVar33 + 0x108) + (ulong)uVar30 * 0xa0 + 0x50);
        uVar23 = 0;
        uVar15 = uVar31 & 0xffffffff;
      }
      lVar34 = uVar23 * 0x10;
      uVar23 = (ulong)((int)uVar23 + 1);
      puVar20 = *(uint **)(lVar16 + lVar34);
      uVar28 = (ulong)puVar20 >> 0x20;
    } while ((int)puVar20 == 0);
    lVar34 = 8;
LAB_140964de5:
    if (*(char *)(lVar7 + 0x108) == '\0') {
      do {
        uVar30 = (uint)uVar23;
        if (uVar30 == (uint)uVar15) {
          do {
            if (puVar27 == puVar26) goto LAB_140964e87;
            uVar30 = *puVar27;
            puVar27 = puVar27 + 1;
            uVar15 = *(ulong *)(*(long *)(lVar33 + 0x108) + 0x58 + (ulong)uVar30 * 0xa0);
          } while (uVar15 == 0);
          lVar16 = *(long *)(*(long *)(lVar33 + 0x108) + (ulong)uVar30 * 0xa0 + 0x50);
          uVar30 = 0;
        }
        uVar23 = (ulong)(uVar30 + 1);
        iVar19 = *(int *)(lVar16 + (ulong)uVar30 * 0x10);
      } while (iVar19 == 0);
    }
    else {
      do {
        uVar30 = (uint)uVar23;
        if (uVar30 == (uint)uVar15) {
          do {
            if (puVar27 == puVar26) goto LAB_140964e87;
            uVar30 = *puVar27;
            puVar27 = puVar27 + 1;
            uVar15 = *(ulong *)(*(long *)(lVar33 + 0x1a8) + 0x10 + (ulong)uVar30 * 0x48);
          } while (uVar15 == 0);
          lVar34 = *(long *)(*(long *)(lVar33 + 0x1a8) + (ulong)uVar30 * 0x48 + 8);
          uVar30 = 0;
        }
        uVar23 = (ulong)(uVar30 + 1);
        iVar19 = *(int *)(lVar34 + (ulong)uVar30 * 8);
      } while (iVar19 == 0);
    }
LAB_140964e8a:
    uVar15 = 0x100000000;
    if (iVar19 == 0) {
      uVar15 = uVar28 << 0x20 | (ulong)puVar20 & 0xffffffff;
    }
    if (((ulong)puVar20 & 0xffffffff) == 0) {
      uVar15 = 0;
    }
  }
  else {
    uVar15 = CONCAT44(((int *)*in_stack_00000028)[1],iVar19);
  }
  fVar42 = 0.0;
  local_e8 = in_XMM6_Da;
  local_d8 = in_XMM7_Da;
  if ((uVar15 & 0xffffffff) == 0) {
LAB_140964f3c:
    bVar13 = 0;
    uVar44 = 0;
  }
  else {
    uVar23 = uVar15 & 0xffffffff ^ 0xffffffff;
    piVar24 = (int *)&DAT_145ed6b08;
    if (uVar23 < *(ulong *)(lVar14 + 0x10)) {
      piVar24 = (int *)(uVar23 * 0x18 + *(long *)(lVar14 + 8));
    }
    if ((piVar24[4] != (int)(uVar15 >> 0x20)) || (*piVar24 == 0)) goto LAB_140964f3c;
    uVar15 = *(ulong *)(piVar24 + 1);
    uVar23 = uVar15 >> 0x20;
    if ((*(ulong *)(lVar17 + 0x38) <= uVar23) ||
       ((*(ulong *)(*(long *)(lVar17 + 0x28) + (uVar15 >> 0x26) * 8) >> (uVar23 & 0x3f) & 1) == 0))
    goto LAB_140964f3c;
    if (uVar23 < *(ulong *)(lVar14 + 0x110)) {
      lVar16 = uVar23 * 0xa0 + *(long *)(lVar14 + 0x108);
    }
    else {
      lVar16 = 0;
    }
    lVar7 = *(long *)(lVar14 + 0x1a8) + (ulong)(uint)piVar24[3] * 0x48;
    uVar23 = *(ulong *)(*(long *)(lVar14 + 0x1a8) + 0x40 + (ulong)(uint)piVar24[3] * 0x48);
    if ((*(ulong *)(lVar17 + 0x110) < uVar23) &&
       (uVar28 = *(ulong *)(*(long *)(lVar7 + 0x38) + *(ulong *)(lVar17 + 0x110) * 8), uVar28 != 0))
    {
      lVar14 = *(long *)(*(long *)(lVar7 + 0x18) + 0x10 + ~uVar28 * 0x30);
    }
    else {
      lVar14 = 0;
    }
    uVar28 = *(ulong *)(lVar17 + 0x118);
    uVar21 = CONCAT71((int7)((ulong)puVar20 >> 8),1);
    if ((uVar28 < *(ulong *)(lVar16 + 0x88)) &&
       (*(long *)(*(long *)(lVar16 + 0x80) + uVar28 * 8) != 0)) {
      if ((uVar28 < uVar23) &&
         (uVar28 = *(ulong *)(*(long *)(lVar7 + 0x38) + uVar28 * 8), uVar28 != 0)) {
        lVar33 = *(long *)(*(long *)(lVar7 + 0x18) + 0x10 + ~uVar28 * 0x30);
        bVar12 = false;
      }
      else {
        bVar12 = false;
        lVar33 = 0;
      }
    }
    else {
      lVar33 = 0;
      bVar12 = true;
    }
    uVar28 = *(ulong *)(lVar17 + 0x120);
    if ((uVar28 < *(ulong *)(lVar16 + 0x88)) &&
       (*(long *)(*(long *)(lVar16 + 0x80) + uVar28 * 8) != 0)) {
      if ((uVar23 <= uVar28) ||
         (uVar23 = *(ulong *)(*(long *)(lVar7 + 0x38) + uVar28 * 8), uVar23 == 0)) {
        uVar21 = 0;
        goto LAB_14096539e;
      }
      lVar16 = *(long *)(*(long *)(lVar7 + 0x18) + 0x10 + ~uVar23 * 0x30);
      uVar21 = 0;
    }
    else {
LAB_14096539e:
      lVar16 = 0;
    }
    uVar15 = (ulong)~(uint)uVar15;
    puVar20 = (uint *)(lVar14 + uVar15 * 0x30);
    local_128 = *puVar20;
    afStack_124[0] = (float)puVar20[1];
    afStack_124[1] = (float)puVar20[2];
    uStack_11c = puVar20[3];
    func_0x000144ffa230(puVar22,uVar21,&local_128,local_f4,CONCAT71((int7)((ulong)lVar7 >> 8),2));
    uVar44 = local_f4[0];
    if ((bVar12 || lVar33 == 0) ||
       (bVar13 = 1, (*(byte *)(lVar33 + 10 + uVar15 * 0x10) & 0x20) == 0)) {
      if ((char)uVar21 == '\0' && lVar16 != 0) {
        bVar13 = *(byte *)(lVar16 + uVar15 * 0x50 + 0x4c) ^ 1;
      }
      else {
        bVar13 = 0;
      }
    }
  }
  *puVar6 = uVar5;
  fVar41 = 0.0;
  fVar36 = 0.0;
  if (bVar13 == 0) {
    uVar15 = *(ulong *)(lVar32 + 0x10);
    if (uVar15 != 0) {
      fVar42 = *(float *)(lVar18 + 0x10);
      fVar41 = *(float *)(lVar18 + 0x14);
      fVar36 = *(float *)(lVar18 + 0x18);
      fVar43 = *(float *)(local_100 + 0x5c);
      lVar16 = *(long *)(lVar32 + 8);
      pfVar25 = (float *)(lVar16 + 0x5c);
      uVar23 = 0;
LAB_140964fa0:
      if ((fVar43 - pfVar25[-0xc]) + pfVar25[-0x11] < pfVar25[-0x12]) goto code_r0x000140964fbf;
      if (uVar23 + 1 < uVar15) {
        lVar17 = (uVar15 - 1) - uVar23;
        do {
          if ((fVar43 - *pfVar25) + pfVar25[-5] < pfVar25[-6]) {
            lVar14 = uVar23 * 0x30;
            uVar21 = *(undefined8 *)(pfVar25 + -0xb);
            uVar8 = *(undefined8 *)(pfVar25 + -9);
            uVar9 = *(undefined8 *)(pfVar25 + -7);
            uVar10 = *(undefined8 *)(pfVar25 + -5);
            uVar11 = *(undefined8 *)(pfVar25 + -1);
            puVar3 = (undefined8 *)(lVar16 + 0x20 + lVar14);
            *puVar3 = *(undefined8 *)(pfVar25 + -3);
            puVar3[1] = uVar11;
            puVar3 = (undefined8 *)(lVar16 + 0x10 + lVar14);
            *puVar3 = uVar9;
            puVar3[1] = uVar10;
            *(undefined8 *)(lVar16 + lVar14) = uVar21;
            ((undefined8 *)(lVar16 + lVar14))[1] = uVar8;
            uVar23 = uVar23 + 1;
          }
          pfVar25 = pfVar25 + 0xc;
          lVar17 = lVar17 + -1;
        } while (lVar17 != 0);
      }
      *(ulong *)(lVar32 + 0x10) = uVar23;
      local_128 = 0;
      uStack_11c = 0;
      local_110 = 0;
      if (uVar23 != 0) {
        lVar16 = *(long *)(lVar32 + 8);
        goto LAB_140964feb;
      }
      fVar43 = 0.0;
      fVar41 = 0.0;
      fVar36 = 0.0;
      goto LAB_14096518d;
    }
    fVar43 = 0.0;
    fVar36 = 0.0;
LAB_14096518d:
    fVar42 = (float)func_0x000145bfa117(uVar44);
    fVar35 = (float)func_0x000145bfa11d(uVar44);
    fVar40 = fVar42 * fVar41;
    fVar42 = ((float)(_DAT_145dcd0a0 ^ (uint)fVar35) * fVar41 - fVar42 * fVar36) + fVar43 * 0.0;
    fVar41 = fVar41 * 0.0 + fVar36 * 0.0 + fVar43;
    fVar36 = fVar43 * 0.0 + (fVar40 - fVar35 * fVar36);
  }
  if ((((fVar42 != 0.0) || (NAN(fVar42))) || (fVar41 != 0.0)) ||
     (((NAN(fVar41) || (fVar36 != 0.0)) || (NAN(fVar36))))) {
    *puVar22 = uVar4;
    *(float *)(lVar18 + 0x10) = fVar42 + *(float *)(lVar18 + 0x10);
    *(float *)(lVar18 + 0x14) = fVar41 + *(float *)(lVar18 + 0x14);
    *(float *)(lVar18 + 0x18) = fVar36 + *(float *)(lVar18 + 0x18);
  }
  return;
LAB_140964c0a:
  iVar29 = 0;
  iVar19 = 0;
  lVar18 = 0;
  goto LAB_140964c11;
code_r0x000140964d55:
  uVar30 = *puVar27;
  puVar27 = puVar27 + 1;
  uVar23 = *(ulong *)(*(long *)(lVar33 + 0x1a8) + 0x10 + (ulong)uVar30 * 0x48);
  if (uVar23 != 0) goto LAB_140964d20;
  goto LAB_140964d50;
LAB_140964d20:
  lVar34 = *(long *)(*(long *)(lVar33 + 0x1a8) + (ulong)uVar30 * 0x48 + 8);
  uVar31 = 0;
  uVar15 = uVar23 & 0xffffffff;
LAB_140964d2e:
  uVar23 = (ulong)((int)uVar31 + 1);
  puVar20 = *(uint **)(lVar34 + uVar31 * 8);
  uVar28 = (ulong)puVar20 >> 0x20;
  uVar31 = uVar23;
  if ((int)puVar20 != 0) goto LAB_14096533c;
  goto LAB_140964d47;
LAB_14096533c:
  lVar16 = 8;
  goto LAB_140964de5;
LAB_140964e87:
  iVar19 = 0;
  goto LAB_140964e8a;
code_r0x000140964fbf:
  uVar23 = uVar23 + 1;
  pfVar25 = pfVar25 + 0xc;
  if (uVar15 == uVar23) goto code_r0x000140964fcb;
  goto LAB_140964fa0;
code_r0x000140964fcb:
  lVar16 = *(long *)(lVar32 + 8);
  uVar23 = uVar15;
LAB_140964feb:
  local_110 = 0;
  uStack_11c = 0;
  local_128 = 0;
  lVar32 = uVar23 * 0x30 + lVar16;
  fVar35 = _DAT_145dcd140;
  fVar40 = _DAT_145ed0a80;
  fVar45 = _DAT_145ed0a84;
  fVar46 = _DAT_145ed0a88;
  do {
    fVar37 = fVar41 - *(float *)(lVar16 + 0x24);
    fVar38 = fVar42 - *(float *)(lVar16 + 0x20);
    fVar39 = fVar36 - *(float *)(lVar16 + 0x28);
    fVar37 = fVar39 * fVar39 + fVar37 * fVar37 + fVar38 * fVar38;
    if (fVar37 <= fVar40) {
      fVar38 = *(float *)(lVar16 + 0xc) * fVar45;
      if (fVar46 < fVar37) {
        fVar37 = (float)func_0x000145bfa165(_DAT_145de7a30);
        fVar38 = fVar38 * fVar37;
      }
      fVar39 = (fVar43 - *(float *)(lVar16 + 0x2c)) + *(float *)(lVar16 + 0x18);
      fVar37 = (float)func_0x000145bfa117(*(float *)(lVar16 + 0x10) * fVar35 * fVar39);
      fVar37 = fVar37 * fVar38;
      if (*(int *)(lVar16 + 4) == 1) {
        fVar39 = (float)func_0x000145bfa135(fVar39 * (float)(*(uint *)(lVar16 + 0x1c) ^
                                                            _DAT_145dcd0a0));
        fVar37 = fVar37 * fVar39;
      }
      uVar15 = (ulong)*(uint *)(lVar16 + 8);
      if ((uVar15 < 3) &&
         ((((&local_128)[uVar15 * 3] & 1) == 0 ||
          (afStack_124[uVar15 * 3] <= fVar38 && fVar38 != afStack_124[uVar15 * 3])))) {
        (&local_128)[uVar15 * 3] = 1;
        afStack_124[uVar15 * 3] = fVar38;
        afStack_124[uVar15 * 3 + 1] = fVar37;
      }
    }
    lVar16 = lVar16 + 0x30;
  } while (lVar16 != lVar32);
  fVar36 = afStack_124[1];
  if ((local_128 & 1) == 0) {
    fVar36 = 0.0;
  }
  if ((uStack_11c & 1) == 0) {
    local_114 = 0.0;
  }
  fVar41 = local_114;
  fVar43 = 0.0;
  if ((local_110 & 1) != 0) {
    fVar43 = local_108;
  }
  goto LAB_14096518d;
}

