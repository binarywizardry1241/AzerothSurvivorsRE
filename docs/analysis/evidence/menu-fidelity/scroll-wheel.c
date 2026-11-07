/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_140197330(undefined8 param_1,undefined8 param_2,undefined8 param_3,undefined8 param_4,
                  undefined8 *param_5,undefined8 param_6,long *param_7,undefined8 *param_8)

{
  char *pcVar1;
  double dVar2;
  int iVar3;
  undefined4 uVar4;
  ulong *puVar5;
  long lVar6;
  ulong uVar7;
  long lVar8;
  undefined8 uVar9;
  undefined8 uVar10;
  long *plVar11;
  undefined1 auVar12 [16];
  undefined1 auVar13 [12];
  double dVar14;
  ulong uVar15;
  byte bVar16;
  ushort uVar17;
  undefined4 uVar18;
  uint uVar19;
  int iVar20;
  long lVar21;
  ulong uVar22;
  uint uVar23;
  ulong uVar24;
  long lVar25;
  uint *puVar26;
  uint uVar27;
  ulong uVar28;
  long lVar29;
  uint *puVar30;
  long lVar31;
  ulong uVar32;
  uint *puVar33;
  ulong uVar34;
  long lVar35;
  long lVar36;
  undefined8 *puVar37;
  long lVar38;
  float *pfVar39;
  bool bVar40;
  byte bVar41;
  undefined1 auVar42 [16];
  undefined1 auVar43 [16];
  undefined1 auVar44 [16];
  undefined1 auVar45 [16];
  undefined1 auVar46 [16];
  float fVar47;
  float fVar48;
  float fVar49;
  float fVar50;
  float fVar51;
  undefined4 in_XMM6_Da;
  float fVar52;
  undefined4 in_XMM7_Da;
  float fVar53;
  float fVar54;
  char cVar55;
  char cVar57;
  char cVar58;
  char cVar59;
  char cVar60;
  char cVar61;
  char cVar62;
  char cVar63;
  char cVar64;
  char cVar65;
  char cVar66;
  char cVar67;
  char cVar68;
  char cVar69;
  char cVar70;
  char cVar71;
  undefined1 auVar56 [16];
  float fVar72;
  float fVar73;
  float fVar74;
  float fVar75;
  float fVar76;
  float fVar77;
  float fVar78;
  float fVar79;
  char cVar80;
  char cVar81;
  char cVar82;
  char cVar83;
  char cVar84;
  char cVar85;
  char cVar86;
  char cVar87;
  char cVar88;
  char cVar89;
  char cVar90;
  char cVar91;
  char cVar92;
  char cVar93;
  char cVar94;
  char cVar95;
  long *in_stack_00000028;
  uint local_24c;
  long local_240;
  long local_238;
  long local_230;
  char local_210;
  long local_1f8;
  long local_1f0;
  long local_1e8;
  int local_1dc;
  long local_1d0;
  byte *local_1c0;
  byte **local_1b8;
  int *local_1b0;
  long local_1a8;
  long local_1a0;
  long local_198;
  uint *local_190;
  uint *local_188;
  undefined8 local_180;
  long local_178;
  ulong local_170;
  long local_168;
  undefined8 uStack_160;
  long local_158;
  long lStack_150;
  undefined8 local_148;
  undefined8 uStack_140;
  char local_138;
  long local_130;
  ulong local_128;
  ulong local_120;
  ulong local_118;
  undefined8 local_110;
  long *local_108;
  undefined4 *local_100;
  undefined4 local_f4;
  undefined8 local_f0;
  undefined4 local_e8;
  undefined4 local_d8;

  fVar48 = (float)((ulong)param_2 >> 0x20);
  fVar54 = (float)param_2;
  puVar5 = (ulong *)*param_5;
  lVar25 = param_5[1];
  uVar24 = *puVar5;
  uVar28 = 0;
  uVar32 = uVar24 - *(ulong *)(lVar25 + 0x18);
  if (uVar24 < *(ulong *)(lVar25 + 0x18)) {
    uVar32 = uVar28;
  }
  uVar22 = uVar24 - *(ulong *)(lVar25 + 0x38);
  if (uVar24 < *(ulong *)(lVar25 + 0x38)) {
    uVar22 = uVar28;
  }
  lVar29 = uVar32 * 0x20 + *(long *)(lVar25 + 8);
  uVar24 = *(ulong *)(lVar25 + 0x10);
  lVar31 = uVar22 * 0x20 + *(long *)(lVar25 + 0x28);
  bVar40 = uVar24 < uVar32;
  uVar34 = uVar24 - uVar32;
  if (bVar40) {
    uVar34 = uVar28;
  }
  lVar6 = *param_7;
  if (bVar40) {
    lVar29 = 8;
  }
  uVar7 = *(ulong *)(lVar25 + 0x30);
  if (bVar40) {
    uVar32 = uVar24;
  }
  if (uVar7 < uVar22) {
    lVar31 = 8;
  }
  lVar8 = param_7[1];
  uVar15 = uVar7 - uVar22;
  if (uVar7 < uVar22) {
    uVar22 = uVar7;
    uVar15 = uVar28;
  }
  lVar25 = *(long *)(lVar25 + 0x40);
  uVar28 = (lVar25 - uVar15) - uVar34;
  lVar21 = param_7[2];
  iVar3 = *(int *)((long)param_7 + 0x14);
  uVar9 = *param_8;
  uVar10 = param_8[1];
  plVar11 = (long *)*in_stack_00000028;
  local_100 = (undefined4 *)in_stack_00000028[2];
  uVar4 = *(undefined4 *)((long)in_stack_00000028 + 0x1c);
  *puVar5 = uVar28;
  fVar50 = _DAT_145d9d714;
  uVar24 = ((uVar22 + lVar25 + uVar32) - uVar7) - uVar24;
  lVar36 = uVar15 * 0x20 + lVar31;
  lVar25 = lVar29;
  fVar53 = _DAT_145d9d710;
  do {
    uVar24 = uVar24 + 1;
    if ((lVar25 == 0) || (lVar25 == uVar34 * 0x20 + lVar29)) {
      if ((lVar31 == 0) || (lVar31 == lVar36)) break;
      lVar38 = 0;
      lVar25 = lVar31;
      lVar31 = lVar31 + 0x20;
    }
    else {
      lVar38 = lVar25 + 0x20;
    }
    *puVar5 = uVar24;
    fVar54 = *(float *)(lVar25 + 0x14);
    if (*(char *)(lVar25 + 0x18) == '\0') {
      fVar54 = *(float *)(lVar25 + 0x14) * fVar50;
    }
    fVar48 = 0.0;
    fVar53 = fVar53 + fVar54;
    lVar25 = lVar38;
  } while( true );
  local_e8 = in_XMM6_Da;
  local_d8 = in_XMM7_Da;
  func_0x000140180b10(lVar31,lVar25,uVar9,&local_1b8,uVar10);
  if ((char)local_1b8 == '\x01') {
    local_f4 = 0;
  }
  else {
    uVar18 = 0;
    local_f4 = 0;
    if (*local_1b0 == 1) {
      dVar14 = *(double *)(local_1b0 + 2);
      if (0.0 <= dVar14) {
        dVar2 = *(double *)(local_1b0 + 4);
        fVar54 = SUB84(dVar2,0);
        fVar48 = (float)((ulong)dVar2 >> 0x20);
        local_f4 = uVar18;
        if (((0.0 <= dVar2) && (dVar14 < (double)(uint)local_1b0[0x30])) &&
           (dVar2 < (double)(uint)local_1b0[0x31])) {
          fVar54 = (float)dVar14;
          fVar48 = (float)*(double *)(local_1b0 + 4);
          local_f0 = CONCAT44(fVar48,fVar54);
          local_f4 = 1;
        }
      }
    }
  }
  local_1c0 = (byte *)&local_f4;
  local_1a8 = lVar8 + 0x1a0;
  local_1a0 = lVar8 + 0x100;
  puVar26 = *(uint **)(lVar6 + 0xf8);
  lVar25 = *(long *)(lVar6 + 0x100);
  local_188 = puVar26 + lVar25;
  local_138 = *(char *)(lVar6 + 0x108);
  local_1b8 = &local_1c0;
  local_180 = 8;
  local_178 = 0;
  local_170 = 8;
  local_168 = 0;
  uStack_160 = 0;
  local_158 = 0;
  lStack_150 = 0;
  local_148 = 0;
  uStack_140 = 0;
  lVar31 = 0;
  local_1b0 = (int *)lVar8;
  local_198 = lVar6;
  local_190 = puVar26;
  if (local_138 == '\0') {
    uVar24 = 8;
    lVar36 = 0;
    lVar29 = 0;
    uVar32 = 0;
    puVar33 = puVar26;
    do {
      do {
        uVar27 = (uint)uVar32;
        if (uVar27 == (uint)lVar29) {
          do {
            if (puVar33 == local_188) {
              local_210 = '\0';
              bVar16 = 0;
              goto LAB_140197b64;
            }
            local_190 = puVar33 + 1;
            uVar27 = *puVar33;
            lVar29 = *(long *)(*(long *)(lVar8 + 0x108) + 0x58 + (ulong)uVar27 * 0xa0);
            puVar33 = local_190;
          } while (lVar29 == 0);
          lVar36 = *(long *)(lVar8 + 0x108) + (ulong)uVar27 * 0xa0;
          uVar24 = (ulong)*(uint *)(lVar36 + 0x94);
          lVar31 = *(long *)(lVar8 + 0x1a8) + uVar24 * 0x48;
          uVar24 = *(ulong *)(*(long *)(lVar8 + 0x1a8) + 0x40 + uVar24 * 0x48);
          if ((*(ulong *)(lVar6 + 0x110) < uVar24) &&
             (uVar32 = *(ulong *)(*(long *)(lVar31 + 0x38) + *(ulong *)(lVar6 + 0x110) * 8),
             uVar32 != 0)) {
            uStack_160 = *(undefined8 *)(*(long *)(lVar31 + 0x18) + 0x10 + ~uVar32 * 0x30);
            uVar32 = *(ulong *)(lVar6 + 0x118);
            if (uVar24 <= uVar32) goto LAB_140197a83;
LAB_140197a33:
            uVar32 = *(ulong *)(*(long *)(lVar31 + 0x38) + uVar32 * 8);
            if (uVar32 == 0) goto LAB_140197a83;
            local_158 = *(long *)(*(long *)(lVar31 + 0x18) + 0x10 + ~uVar32 * 0x30);
            uVar32 = *(ulong *)(lVar6 + 0x120);
            if (uVar24 <= uVar32) goto LAB_140197a69;
LAB_140197a9b:
            uVar32 = *(ulong *)(*(long *)(lVar31 + 0x38) + uVar32 * 8);
            if (uVar32 == 0) {
              lStack_150 = 0;
            }
            else {
              lStack_150 = *(long *)(*(long *)(lVar31 + 0x18) + 0x10 + ~uVar32 * 0x30);
            }
            uVar32 = *(ulong *)(lVar6 + 0x128);
            if (uVar24 <= uVar32) goto LAB_140197afe;
LAB_140197adb:
            uVar24 = *(ulong *)(*(long *)(lVar31 + 0x38) + uVar32 * 8);
            if (uVar24 == 0) goto LAB_140197afe;
            local_148 = *(undefined8 *)(*(long *)(lVar31 + 0x18) + 0x10 + ~uVar24 * 0x30);
          }
          else {
            uStack_160 = 0;
            uVar32 = *(ulong *)(lVar6 + 0x118);
            if (uVar32 < uVar24) goto LAB_140197a33;
LAB_140197a83:
            local_158 = 0;
            uVar32 = *(ulong *)(lVar6 + 0x120);
            if (uVar32 < uVar24) goto LAB_140197a9b;
LAB_140197a69:
            lStack_150 = 0;
            uVar32 = *(ulong *)(lVar6 + 0x128);
            if (uVar32 < uVar24) goto LAB_140197adb;
LAB_140197afe:
            local_148 = 0;
          }
          uVar24 = *(ulong *)(lVar36 + 0x50);
          uVar27 = 0;
          uVar32 = 1;
          uStack_140 = CONCAT44(1,(int)lVar29);
          lVar31 = local_158;
          lVar36 = lStack_150;
          local_170 = uVar24;
          local_168 = lVar29;
        }
        else {
          uVar32 = (ulong)(uVar27 + 1);
          uStack_140 = CONCAT44(uVar27 + 1,(undefined4)uStack_140);
        }
      } while ((char)local_f4 == '\0');
      uVar22 = (ulong)~*(uint *)(uVar24 + 8 + (ulong)uVar27 * 0x10);
      lVar35 = uVar22 * 0x68;
      lVar38 = uVar22 * 0x20;
      pfVar39 = (float *)(lVar36 + lVar38);
      uVar9 = *(undefined8 *)(lVar31 + 0x30 + lVar35);
      fVar50 = (float)uVar9;
      fVar51 = (float)((ulong)uVar9 >> 0x20);
      puVar37 = (undefined8 *)(lVar36 + 0x10 + lVar38);
      uVar9 = *puVar37;
      uVar10 = *puVar37;
      auVar42._4_4_ =
           -(uint)(fVar48 <=
                  fVar51 * fRam0000000145da8cdc * pfVar39[3] +
                  fVar50 * fRam0000000145da8cd4 * pfVar39[1] + (float)((ulong)uVar9 >> 0x20));
      auVar42._0_4_ =
           -(uint)(fVar54 <=
                  fVar51 * fRam0000000145da8cd8 * pfVar39[2] + fVar50 * _DAT_145da8cd0 * *pfVar39 +
                  (float)uVar9);
      auVar42._8_4_ =
           -(uint)(fVar51 * fRam0000000145dcd058 * pfVar39[2] + fVar50 * _DAT_145dcd050 * *pfVar39 +
                   (float)uVar10 <= fVar54);
      auVar42._12_4_ =
           -(uint)(fVar51 * fRam0000000145dcd05c * pfVar39[3] +
                   fVar50 * fRam0000000145dcd054 * pfVar39[1] + (float)((ulong)uVar10 >> 0x20) <=
                  fVar48);
      uVar27 = movmskps((int)uVar28,auVar42);
      uVar28 = (ulong)uVar27;
    } while (uVar27 != 0xf);
    lVar31 = lVar31 + lVar35;
  }
  else {
    lVar36 = 0;
    lVar29 = 0;
    uVar24 = 0;
    puVar33 = puVar26;
    do {
      do {
        uVar27 = (uint)uVar24;
        if (uVar27 == (uint)lVar29) {
          do {
            if (puVar33 == local_188) {
              local_210 = '\x01';
              bVar16 = 0;
              goto LAB_140197b64;
            }
            local_190 = puVar33 + 1;
            uVar27 = *puVar33;
            lVar29 = *(long *)(*(long *)(lVar8 + 0x1a8) + 0x10 + (ulong)uVar27 * 0x48);
            puVar33 = local_190;
          } while (lVar29 == 0);
          lVar31 = *(long *)(lVar8 + 0x1a8) + (ulong)uVar27 * 0x48;
          uVar24 = *(ulong *)(lVar31 + 0x40);
          if ((*(ulong *)(lVar6 + 0x110) < uVar24) &&
             (uVar32 = *(ulong *)(*(long *)(lVar31 + 0x38) + *(ulong *)(lVar6 + 0x110) * 8),
             uVar32 != 0)) {
            uStack_160 = *(undefined8 *)(*(long *)(lVar31 + 0x18) + 0x10 + ~uVar32 * 0x30);
            uVar32 = *(ulong *)(lVar6 + 0x118);
            if (uVar24 <= uVar32) goto LAB_1401977d9;
LAB_1401977a1:
            uVar32 = *(ulong *)(*(long *)(lVar31 + 0x38) + uVar32 * 8);
            if (uVar32 == 0) goto LAB_1401977d9;
            local_158 = *(long *)(*(long *)(lVar31 + 0x18) + 0x10 + ~uVar32 * 0x30);
            uVar32 = *(ulong *)(lVar6 + 0x120);
            if (uVar32 < uVar24) goto LAB_1401977f1;
LAB_140197829:
            lStack_150 = 0;
            uVar32 = *(ulong *)(lVar6 + 0x128);
            if (uVar24 <= uVar32) goto LAB_140197864;
LAB_140197841:
            uVar24 = *(ulong *)(*(long *)(lVar31 + 0x38) + uVar32 * 8);
            if (uVar24 == 0) goto LAB_140197864;
            local_148 = *(undefined8 *)(*(long *)(lVar31 + 0x18) + 0x10 + ~uVar24 * 0x30);
          }
          else {
            uStack_160 = 0;
            uVar32 = *(ulong *)(lVar6 + 0x118);
            if (uVar32 < uVar24) goto LAB_1401977a1;
LAB_1401977d9:
            local_158 = 0;
            uVar32 = *(ulong *)(lVar6 + 0x120);
            if (uVar24 <= uVar32) goto LAB_140197829;
LAB_1401977f1:
            uVar32 = *(ulong *)(*(long *)(lVar31 + 0x38) + uVar32 * 8);
            if (uVar32 == 0) goto LAB_140197829;
            lStack_150 = *(long *)(*(long *)(lVar31 + 0x18) + 0x10 + ~uVar32 * 0x30);
            uVar32 = *(ulong *)(lVar6 + 0x128);
            if (uVar32 < uVar24) goto LAB_140197841;
LAB_140197864:
            local_148 = 0;
          }
          local_180 = *(undefined8 *)(lVar31 + 8);
          uVar27 = 0;
          uVar24 = 1;
          uStack_140 = CONCAT44(1,(int)lVar29);
          lVar31 = local_158;
          lVar36 = lStack_150;
          local_178 = lVar29;
        }
        else {
          uVar24 = (ulong)(uVar27 + 1);
          uStack_140 = CONCAT44(uVar27 + 1,(undefined4)uStack_140);
        }
      } while ((char)local_f4 == '\0');
      uVar32 = (ulong)uVar27 * 0x68;
      lVar38 = (ulong)uVar27 * 0x20;
      pfVar39 = (float *)(lVar36 + lVar38);
      uVar9 = *(undefined8 *)(lVar31 + 0x30 + uVar32);
      fVar50 = (float)uVar9;
      fVar51 = (float)((ulong)uVar9 >> 0x20);
      puVar37 = (undefined8 *)(lVar36 + 0x10 + lVar38);
      uVar9 = *puVar37;
      uVar10 = *puVar37;
      auVar12._4_4_ =
           -(uint)(fVar48 <=
                  fVar51 * fRam0000000145da8cdc * pfVar39[3] +
                  fVar50 * fRam0000000145da8cd4 * pfVar39[1] + (float)((ulong)uVar9 >> 0x20));
      auVar12._0_4_ =
           -(uint)(fVar54 <=
                  fVar51 * fRam0000000145da8cd8 * pfVar39[2] + fVar50 * _DAT_145da8cd0 * *pfVar39 +
                  (float)uVar9);
      auVar12._8_4_ =
           -(uint)(fVar51 * fRam0000000145dcd058 * pfVar39[2] + fVar50 * _DAT_145dcd050 * *pfVar39 +
                   (float)uVar10 <= fVar54);
      auVar12._12_4_ =
           -(uint)(fVar51 * fRam0000000145dcd05c * pfVar39[3] +
                   fVar50 * fRam0000000145dcd054 * pfVar39[1] + (float)((ulong)uVar10 >> 0x20) <=
                  fVar48);
      uVar27 = movmskps((int)uVar28,auVar12);
      uVar28 = (ulong)uVar27;
    } while (uVar27 != 0xf);
    lVar31 = lVar31 + uVar32;
  }
  local_1dc = func_0x000140129000(uVar32,uVar24,*(undefined4 *)(lVar31 + 0x58),&local_1b8);
  puVar26 = *(uint **)(lVar6 + 0xf8);
  lVar25 = *(long *)(lVar6 + 0x100);
  local_210 = *(char *)(lVar6 + 0x108);
  bVar16 = 1;
LAB_140197b64:
  puVar33 = puVar26 + lVar25;
  uVar19 = iVar3 - (int)lVar21;
  uVar27 = 0xc233b000;
  if (uVar19 < 0xc233b000) {
    uVar27 = uVar19;
  }
  local_108 = plVar11 + 4;
  local_1f8 = 0;
  local_1d0 = 8;
  fVar54 = 0.0;
  local_230 = 0;
  local_238 = 0;
  local_240 = 0;
  lVar25 = 0;
  local_24c = 0;
  puVar30 = puVar33;
  fVar48 = _DAT_145da8cd0;
  fVar50 = fRam0000000145da8cd4;
  fVar51 = fRam0000000145da8cd8;
  fVar72 = fRam0000000145da8cdc;
  fVar73 = _DAT_145dcd050;
  fVar74 = fRam0000000145dcd054;
  fVar75 = fRam0000000145dcd058;
  fVar76 = fRam0000000145dcd05c;
  do {
    if (local_210 == '\0') {
      if (local_24c == (uint)lVar25) {
        do {
          if (puVar26 == puVar30) {
            return;
          }
          uVar19 = *puVar26;
          puVar26 = puVar26 + 1;
          lVar25 = *(long *)(*(long *)(lVar8 + 0x108) + 0x58 + (ulong)uVar19 * 0xa0);
        } while (lVar25 == 0);
        lVar21 = *(long *)(lVar8 + 0x108) + (ulong)uVar19 * 0xa0;
        uVar32 = (ulong)*(uint *)(lVar21 + 0x94);
        lVar31 = *(long *)(lVar8 + 0x1a8);
        uVar24 = *(ulong *)(lVar31 + 0x40 + uVar32 * 0x48);
        lVar29 = *(long *)(lVar31 + 0x18 + uVar32 * 0x48);
        lVar31 = *(long *)(lVar31 + 0x38 + uVar32 * 0x48);
        if ((*(ulong *)(lVar6 + 0x118) < uVar24) &&
           (uVar32 = *(ulong *)(lVar31 + *(ulong *)(lVar6 + 0x118) * 8), uVar32 != 0)) {
          local_230 = *(long *)(lVar29 + 0x10 + ~uVar32 * 0x30);
          uVar32 = *(ulong *)(lVar6 + 0x120);
          if (uVar24 <= uVar32) goto LAB_140197df6;
LAB_140197d8f:
          uVar32 = *(ulong *)(lVar31 + uVar32 * 8);
          if (uVar32 == 0) goto LAB_140197df6;
          local_238 = *(long *)(lVar29 + 0x10 + ~uVar32 * 0x30);
          uVar32 = *(ulong *)(lVar6 + 0x128);
          if (uVar32 < uVar24) goto LAB_140197e0c;
LAB_140197e80:
          local_240 = 0;
        }
        else {
          local_230 = 0;
          uVar32 = *(ulong *)(lVar6 + 0x120);
          if (uVar32 < uVar24) goto LAB_140197d8f;
LAB_140197df6:
          local_238 = 0;
          uVar32 = *(ulong *)(lVar6 + 0x128);
          if (uVar24 <= uVar32) goto LAB_140197e80;
LAB_140197e0c:
          uVar24 = *(ulong *)(lVar31 + uVar32 * 8);
          if (uVar24 == 0) goto LAB_140197e80;
          local_240 = *(long *)(lVar29 + 0x10 + ~uVar24 * 0x30);
        }
        lVar31 = ~*(ulong *)(lVar31 + *(long *)(lVar6 + 0x110) * 8) * 0x30;
        local_1f8 = *(long *)(lVar29 + 0x10 + lVar31);
        local_1e8 = *(long *)(lVar29 + 0x20 + lVar31);
        local_1f0 = *(long *)(lVar29 + 0x28 + lVar31);
        local_1d0 = *(long *)(lVar21 + 0x50);
        local_24c = 0;
      }
      uVar19 = ~*(uint *)(local_1d0 + 8 + (ulong)local_24c * 0x10);
    }
    else {
      uVar19 = local_24c;
      if (local_24c == (uint)lVar25) {
        do {
          if (puVar26 == puVar30) {
            return;
          }
          uVar19 = *puVar26;
          puVar26 = puVar26 + 1;
          lVar25 = *(long *)(*(long *)(lVar8 + 0x1a8) + 0x10 + (ulong)uVar19 * 0x48);
        } while (lVar25 == 0);
        lVar31 = *(long *)(lVar8 + 0x1a8) + (ulong)uVar19 * 0x48;
        uVar24 = *(ulong *)(lVar31 + 0x40);
        lVar29 = *(long *)(lVar31 + 0x18);
        lVar31 = *(long *)(lVar31 + 0x38);
        if ((*(ulong *)(lVar6 + 0x118) < uVar24) &&
           (uVar32 = *(ulong *)(lVar31 + *(ulong *)(lVar6 + 0x118) * 8), uVar32 != 0)) {
          local_230 = *(long *)(lVar29 + 0x10 + ~uVar32 * 0x30);
          uVar32 = *(ulong *)(lVar6 + 0x120);
          if (uVar24 <= uVar32) goto LAB_140197dc0;
LAB_140197d48:
          uVar32 = *(ulong *)(lVar31 + uVar32 * 8);
          if (uVar32 == 0) goto LAB_140197dc0;
          local_238 = *(long *)(lVar29 + 0x10 + ~uVar32 * 0x30);
          uVar32 = *(ulong *)(lVar6 + 0x128);
          if (uVar32 < uVar24) goto LAB_140197dd6;
LAB_140197e2c:
          local_240 = 0;
        }
        else {
          local_230 = 0;
          uVar32 = *(ulong *)(lVar6 + 0x120);
          if (uVar32 < uVar24) goto LAB_140197d48;
LAB_140197dc0:
          local_238 = 0;
          uVar32 = *(ulong *)(lVar6 + 0x128);
          if (uVar24 <= uVar32) goto LAB_140197e2c;
LAB_140197dd6:
          uVar24 = *(ulong *)(lVar31 + uVar32 * 8);
          if (uVar24 == 0) goto LAB_140197e2c;
          local_240 = *(long *)(lVar29 + 0x10 + ~uVar24 * 0x30);
        }
        lVar31 = ~*(ulong *)(lVar31 + *(long *)(lVar6 + 0x110) * 8) * 0x30;
        local_1f8 = *(long *)(lVar29 + 0x10 + lVar31);
        local_1e8 = *(long *)(lVar29 + 0x20 + lVar31);
        local_1f0 = *(long *)(lVar29 + 0x28 + lVar31);
        uVar19 = 0;
        local_24c = uVar19;
      }
    }
    uVar32 = (ulong)uVar19;
    lVar31 = local_1f8 + uVar32 * 8;
    lVar29 = uVar32 * 0x68 + local_230;
    pfVar39 = (float *)(uVar32 * 0x20 + local_238);
    puVar37 = (undefined8 *)(uVar32 * 0x10 + local_240);
    fVar78 = *(float *)(lVar29 + 0x34);
    fVar79 = *(float *)(lVar29 + 100);
    fVar77 = *(float *)(lVar29 + 0x3c) * fVar79;
    lVar21 = local_130;
    uVar24 = local_120;
    if ((uint)(iVar3 - *(int *)(local_1e8 + uVar32 * 4)) < uVar27) {
      fVar52 = 0.0;
      if (plVar11[3] != 0) {
        local_110 = *puVar37;
        lVar36 = puVar37[1];
        uVar22 = func_0x00014000d750();
        lVar38 = *plVar11;
        uVar28 = plVar11[1];
        bVar41 = (byte)(uVar22 >> 0x39);
        auVar42 = ZEXT216(CONCAT11(bVar41,bVar41));
        auVar42 = pshuflw(auVar42,auVar42,0);
        cVar80 = auVar42[0];
        cVar81 = auVar42[1];
        cVar82 = auVar42[2];
        cVar83 = auVar42[3];
        cVar84 = auVar42[4];
        cVar85 = auVar42[5];
        cVar86 = auVar42[6];
        cVar87 = auVar42[7];
        lVar35 = 0;
        cVar88 = cVar80;
        cVar89 = cVar81;
        cVar90 = cVar82;
        cVar91 = cVar83;
        cVar92 = cVar84;
        cVar93 = cVar85;
        cVar94 = cVar86;
        cVar95 = cVar87;
        while( true ) {
          pcVar1 = (char *)(lVar38 + (uVar22 & uVar28));
          cVar55 = *pcVar1;
          cVar57 = pcVar1[1];
          cVar58 = pcVar1[2];
          cVar59 = pcVar1[3];
          cVar60 = pcVar1[4];
          cVar61 = pcVar1[5];
          cVar62 = pcVar1[6];
          cVar63 = pcVar1[7];
          cVar64 = pcVar1[8];
          cVar65 = pcVar1[9];
          cVar66 = pcVar1[10];
          cVar67 = pcVar1[0xb];
          cVar68 = pcVar1[0xc];
          cVar69 = pcVar1[0xd];
          cVar70 = pcVar1[0xe];
          cVar71 = pcVar1[0xf];
          auVar43[0] = -(cVar55 == cVar80);
          auVar43[1] = -(cVar57 == cVar81);
          auVar43[2] = -(cVar58 == cVar82);
          auVar43[3] = -(cVar59 == cVar83);
          auVar43[4] = -(cVar60 == cVar84);
          auVar43[5] = -(cVar61 == cVar85);
          auVar43[6] = -(cVar62 == cVar86);
          auVar43[7] = -(cVar63 == cVar87);
          auVar43[8] = -(cVar64 == cVar88);
          auVar43[9] = -(cVar65 == cVar89);
          auVar43[10] = -(cVar66 == cVar90);
          auVar43[0xb] = -(cVar67 == cVar91);
          auVar43[0xc] = -(cVar68 == cVar92);
          auVar43[0xd] = -(cVar69 == cVar93);
          auVar43[0xe] = -(cVar70 == cVar94);
          auVar43[0xf] = -(cVar71 == cVar95);
          uVar17 = (ushort)(SUB161(auVar43 >> 7,0) & 1) |
                   (ushort)(SUB161(auVar43 >> 0xf,0) & 1) << 1 |
                   (ushort)(SUB161(auVar43 >> 0x17,0) & 1) << 2 |
                   (ushort)(SUB161(auVar43 >> 0x1f,0) & 1) << 3 |
                   (ushort)(SUB161(auVar43 >> 0x27,0) & 1) << 4 |
                   (ushort)(SUB161(auVar43 >> 0x2f,0) & 1) << 5 |
                   (ushort)(SUB161(auVar43 >> 0x37,0) & 1) << 6 |
                   (ushort)(SUB161(auVar43 >> 0x3f,0) & 1) << 7 |
                   (ushort)(SUB161(auVar43 >> 0x47,0) & 1) << 8 |
                   (ushort)(SUB161(auVar43 >> 0x4f,0) & 1) << 9 |
                   (ushort)(SUB161(auVar43 >> 0x57,0) & 1) << 10 |
                   (ushort)(SUB161(auVar43 >> 0x5f,0) & 1) << 0xb |
                   (ushort)(SUB161(auVar43 >> 0x67,0) & 1) << 0xc |
                   (ushort)(SUB161(auVar43 >> 0x6f,0) & 1) << 0xd |
                   (ushort)(SUB161(auVar43 >> 0x77,0) & 1) << 0xe |
                   (ushort)(auVar43[0xf] >> 7) << 0xf;
          uVar34 = uVar22 & uVar28;
          uVar7 = (ulong)uVar17;
          lVar21 = local_130;
          uVar24 = local_120;
          uVar22 = local_118;
          while (local_130 = lVar35, local_118 = uVar7, local_120 = uVar34, uVar17 != 0) {
            uVar19 = 0;
            for (uVar23 = (uint)local_118; (uVar23 & 1) == 0; uVar23 = uVar23 >> 1 | 0x80000000) {
              uVar19 = uVar19 + 1;
            }
            uVar24 = uVar19 + local_120 & uVar28;
            local_128 = uVar28;
            if (lVar36 == *(long *)(lVar38 + -0x10 + uVar24 * -0x18)) {
              iVar20 = func_0x000145bfa0e1();
              if (iVar20 == 0) {
                fVar52 = *(float *)(uVar24 * -0x18 + lVar38 + -8);
                lVar21 = local_130;
                uVar24 = local_120;
                goto LAB_1401980cd;
              }
            }
            iVar20 = (int)local_118 + -1;
            uVar17 = (ushort)iVar20 & (ushort)local_118;
            uVar34 = local_120;
            uVar7 = (ulong)CONCAT22((short)((uint)iVar20 >> 0x10),uVar17);
            uVar28 = local_128;
            lVar35 = local_130;
            lVar21 = local_130;
            uVar24 = local_120;
            uVar22 = local_118;
          }
          auVar56[0] = -(cVar55 == -1);
          auVar56[1] = -(cVar57 == -1);
          auVar56[2] = -(cVar58 == -1);
          auVar56[3] = -(cVar59 == -1);
          auVar56[4] = -(cVar60 == -1);
          auVar56[5] = -(cVar61 == -1);
          auVar56[6] = -(cVar62 == -1);
          auVar56[7] = -(cVar63 == -1);
          auVar56[8] = -(cVar64 == -1);
          auVar56[9] = -(cVar65 == -1);
          auVar56[10] = -(cVar66 == -1);
          auVar56[0xb] = -(cVar67 == -1);
          auVar56[0xc] = -(cVar68 == -1);
          auVar56[0xd] = -(cVar69 == -1);
          auVar56[0xe] = -(cVar70 == -1);
          auVar56[0xf] = -(cVar71 == -1);
          local_118 = uVar22;
          if ((((((((((((((((SUB161(auVar56 >> 7,0) & 1) != 0 || (SUB161(auVar56 >> 0xf,0) & 1) != 0
                           ) || (SUB161(auVar56 >> 0x17,0) & 1) != 0) ||
                         (SUB161(auVar56 >> 0x1f,0) & 1) != 0) ||
                        (SUB161(auVar56 >> 0x27,0) & 1) != 0) ||
                       (SUB161(auVar56 >> 0x2f,0) & 1) != 0) || (SUB161(auVar56 >> 0x37,0) & 1) != 0
                      ) || (SUB161(auVar56 >> 0x3f,0) & 1) != 0) ||
                    (SUB161(auVar56 >> 0x47,0) & 1) != 0) || (SUB161(auVar56 >> 0x4f,0) & 1) != 0)
                  || (SUB161(auVar56 >> 0x57,0) & 1) != 0) || (SUB161(auVar56 >> 0x5f,0) & 1) != 0)
                || (SUB161(auVar56 >> 0x67,0) & 1) != 0) || (SUB161(auVar56 >> 0x6f,0) & 1) != 0) ||
              (SUB161(auVar56 >> 0x77,0) & 1) != 0) || auVar56[0xf] < '\0') break;
          uVar22 = local_120 + local_130 + 0x10;
          lVar35 = local_130 + 0x10;
          local_130 = lVar21;
          local_120 = uVar24;
        }
      }
    }
    else {
      fVar52 = *(float *)(lVar31 + 4);
    }
LAB_1401980cd:
    local_120 = uVar24;
    local_130 = lVar21;
    if (((bool)(bVar16 & local_1dc == *(int *)(lVar29 + 0x58))) && ((*local_1c0 & 1) != 0)) {
      fVar47 = *(float *)(lVar29 + 0x30);
      uVar9 = *(undefined8 *)(pfVar39 + 4);
      uVar10 = *(undefined8 *)(pfVar39 + 4);
      auVar44._0_4_ = fVar78 * fVar51 * pfVar39[2] + fVar47 * fVar48 * *pfVar39 + (float)uVar9;
      auVar44._4_4_ =
           fVar78 * fVar72 * pfVar39[3] + fVar47 * fVar50 * pfVar39[1] +
           (float)((ulong)uVar9 >> 0x20);
      auVar44._8_4_ = fVar78 * fVar75 * pfVar39[2] + fVar47 * fVar73 * *pfVar39 + (float)uVar10;
      auVar44._12_4_ =
           fVar78 * fVar76 * pfVar39[3] + fVar47 * fVar74 * pfVar39[1] +
           (float)((ulong)uVar10 >> 0x20);
      fVar47 = (float)*(undefined8 *)(local_1c0 + 4);
      fVar49 = (float)((ulong)*(undefined8 *)(local_1c0 + 4) >> 0x20);
      auVar13._4_8_ = auVar44._8_8_;
      auVar13._0_4_ = -(uint)(auVar44._4_4_ <= fVar49);
      auVar45._0_8_ = auVar13._0_8_ << 0x20;
      auVar45._8_4_ = -(uint)(auVar44._8_4_ <= fVar47);
      auVar45._12_4_ = -(uint)(auVar44._12_4_ <= fVar49);
      auVar46._8_8_ = auVar45._8_8_;
      auVar46._4_4_ = -(uint)(fVar49 <= auVar44._4_4_);
      auVar46._0_4_ = -(uint)(fVar47 <= auVar44._0_4_);
      iVar20 = movmskps((int)local_1c0,auVar46);
      if (iVar20 != 0xf) goto LAB_140198150;
      fVar52 = fVar52 - fVar53;
      if (fVar78 <= fVar54) goto LAB_1401981a0;
LAB_140198160:
      fVar77 = fVar77 - fVar78 * fVar79;
      if (fVar77 <= fVar54) {
        fVar77 = fVar54;
      }
      fVar78 = 0.0;
      if (0.0 <= fVar52) {
        fVar78 = fVar52;
      }
      fVar52 = fVar77;
      if (fVar78 <= fVar77) {
        fVar52 = fVar78;
      }
    }
    else {
LAB_140198150:
      if (fVar54 < fVar78) goto LAB_140198160;
LAB_1401981a0:
      if (fVar52 <= fVar54) {
        fVar52 = fVar54;
      }
    }
    local_24c = local_24c + 1;
    *local_100 = uVar4;
    puVar30 = puVar33;
    func_0x0001400bf5a0();
    if ((*(float *)(lVar31 + 4) != fVar52) || (NAN(*(float *)(lVar31 + 4)) || NAN(fVar52))) {
      *(int *)(local_1f0 + uVar32 * 4) = iVar3;
      *(float *)(lVar31 + 4) = fVar52;
    }
  } while( true );
}
