
/* WARNING: Removing unreachable block (ram,0x000145970924) */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined1  [16]
entry(undefined8 param_1,undefined8 param_2,ulong param_3,long param_4,char *param_5)

{
  undefined4 *puVar1;
  float *pfVar2;
  uint uVar3;
  char cVar4;
  undefined1 uVar5;
  ushort uVar6;
  uint uVar7;
  long lVar8;
  undefined1 auVar9 [14];
  ulong uVar10;
  code *pcVar11;
  ulong uVar12;
  long lVar13;
  ulong uVar14;
  long lVar15;
  uint *puVar16;
  ulong unaff_R12;
  ulong uVar17;
  uint uVar18;
  ulong uVar19;
  long lVar20;
  float fVar21;
  float fVar22;
  float fVar23;
  float fVar24;
  undefined8 extraout_XMM0_Qa;
  undefined8 extraout_XMM1_Qa;
  float fVar25;
  float fVar26;
  float fVar27;
  float fVar28;
  float fVar29;
  undefined4 uVar30;
  undefined4 uVar31;
  undefined4 uVar32;
  undefined4 uVar33;
  undefined1 auVar34 [16];
  float fVar35;
  float fVar36;
  float fVar37;
  undefined1 auVar38 [16];
  undefined8 local_100;
  undefined4 local_f8;
  
  uVar19 = *(ulong *)(param_4 + 0x568);
  if (uVar19 == 0) {
    uVar10 = 0;
  }
  else {
    uVar14 = (ulong)((uint)uVar19 & 3);
    if (uVar19 < 4) {
      uVar17 = 0;
      uVar10 = 0;
    }
    else {
      puVar16 = (uint *)(*(long *)(param_4 + 0x560) + 0x638);
      uVar17 = 0;
      uVar10 = 0;
      do {
        uVar10 = ((ulong)*puVar16 ^ 1) +
                 ((ulong)puVar16[-0x76] ^ 1) + ((ulong)puVar16[-0xec] ^ 1) +
                 ((ulong)puVar16[-0x162] ^ 1) + uVar10;
        uVar17 = uVar17 + 4;
        puVar16 = puVar16 + 0x1d8;
      } while ((uVar19 & 0xfffffffffffffffc) != uVar17);
      if (uVar14 == 0) goto LAB_1459706a7;
    }
    lVar15 = 0;
    do {
      uVar10 = uVar10 + ((ulong)*(uint *)(*(long *)(param_4 + 0x560) + uVar17 * 0x1d8 + 0xb0 +
                                         lVar15) ^ 1);
      lVar15 = lVar15 + 0x1d8;
    } while (uVar14 * 0x1d8 - lVar15 != 0);
  }
LAB_1459706a7:
  fVar21 = ((float)*(ushort *)(param_4 + 0x2b0) / _DAT_145d9d2d0) * _DAT_145ea3ae0;
  uVar14 = 0;
  uVar19 = (long)(fVar21 - _DAT_145d9d5e0) & (long)fVar21 >> 0x3f | (long)fVar21;
  if (fVar21 < 0.0) {
    uVar19 = uVar14;
  }
  uVar17 = 0xffffffffffffffff;
  if (fVar21 <= _DAT_145d9d5e4) {
    uVar17 = uVar19;
  }
  uVar19 = 0x32;
  if (0x32 < uVar17) {
    uVar19 = uVar17;
  }
  uVar17 = 0x78;
  if (uVar19 < 0x78) {
    uVar17 = uVar19;
  }
  if (uVar10 < uVar17) {
    lVar15 = func_0x00014588d0d0(param_5,param_4,*(undefined8 *)(param_4 + 0x298),
                                 *(undefined8 *)(param_4 + 0x290));
    lVar15 = lVar15 * 0xf0;
    uVar19 = *(ulong *)(lVar15 + 0x146bde410) - 1;
    if (uVar19 < param_3) {
      param_3 = uVar19;
    }
    if (*(ulong *)(lVar15 + 0x146bde410) <= param_3) {
      func_0x000145d99653();
                    /* WARNING: Does not return */
      pcVar11 = (code *)invalidInstructionException();
      (*pcVar11)();
    }
    lVar20 = param_3 * 0x50 + *(long *)(lVar15 + 0x146bde408);
    if (*param_5 == '\0') {
      func_0x00014596fcd0(extraout_XMM0_Qa,extraout_XMM1_Qa,_DAT_145deaff0,_DAT_145d9d790);
    }
    else {
      local_f8 = *(undefined4 *)(param_5 + 0xc);
      local_100 = *(undefined8 *)(param_5 + 4);
    }
    fVar21 = *(float *)(param_4 + 0xa34) / _DAT_145df0540;
    cVar4 = *(char *)(lVar20 + 0x4c);
    pcVar11 = (code *)0x14599ea10;
    if (cVar4 != '\0') {
      pcVar11 = (code *)0x14599e9c0;
    }
    uVar3 = *(uint *)(param_4 + 0x2b2);
    uVar6 = *(ushort *)(param_4 + 0x2b6);
    fVar24 = *(float *)(lVar20 + 0x30);
    fVar25 = *(float *)(lVar15 + 0x146bde470);
    fVar37 = *(float *)(lVar15 + 0x146bde474);
    fVar27 = *(float *)(param_4 + 0xaa8);
    fVar22 = (float)(*pcVar11)();
    fVar28 = *(float *)(lVar20 + 0x34);
    uVar7 = *(uint *)(lVar20 + 0x20);
    uVar18 = *(int *)(param_4 + 0xa60) + 1;
    *(uint *)(param_4 + 0xa60) = uVar18;
    uVar19 = *(ulong *)(param_4 + 0x9a0);
    uVar10 = *(ulong *)(param_4 + 0x9a8);
    uVar14 = *(ulong *)(param_4 + 0x9b8);
    uVar17 = *(ulong *)(param_4 + 0x9b0);
    do {
      lVar15 = ((uVar19 + uVar14) * 0x800000 | uVar19 + uVar14 >> 0x29) + uVar19;
      uVar12 = uVar10 << 0x11;
      uVar17 = uVar17 ^ uVar19;
      uVar14 = uVar14 ^ uVar10;
      uVar10 = uVar10 ^ uVar17;
      uVar19 = uVar19 ^ uVar14;
      uVar14 = uVar14 << 0x2d | uVar14 >> 0x13;
      uVar17 = uVar17 ^ uVar12;
      fVar29 = ((float)((uint)((ulong)lVar15 >> 0x29) | 0x3f800000) + _DAT_145dcd0c4) *
               _DAT_145dcd140;
    } while (_DAT_145dcd140 <= fVar29);
    fVar26 = _DAT_145f3d9c0;
    fVar36 = _DAT_147229a44;
    if (cVar4 != '\0') {
      fVar26 = _DAT_145d9d2a0;
      fVar36 = _DAT_147229a40;
    }
    fVar36 = fVar36 * fVar24;
    fVar24 = 0.0;
    if (0.0 <= fVar21 / _DAT_145d9d220) {
      fVar24 = fVar21 / _DAT_145d9d220;
    }
    fVar23 = _DAT_145d9d2a0;
    if (fVar24 <= _DAT_145d9d2a0) {
      fVar23 = fVar24;
    }
    fVar35 = fVar37 * fVar23 * fVar23 + _DAT_145d9d2a0;
    fVar24 = _DAT_145d9d2a0;
    fVar37 = _DAT_145dcd0c4;
    fVar23 = (float)func_0x000145bfa165(_DAT_147229a14);
    auVar9._4_2_ = (short)(uVar3 >> 0x10);
    auVar9._0_4_ = uVar3;
    auVar9._6_8_ = SUB148(ZEXT814(0),6);
    fVar26 = fVar26 * fVar28;
    fVar21 = _DAT_1461576b0 * fVar21 * fVar21 * fVar21 +
             _DAT_146068740 * fVar21 * fVar21 + _DAT_145dd4eb4 * fVar21 + fVar24;
    fVar25 = SQRT(fVar25 * fVar27);
    auVar34._4_4_ = (float)auVar9._4_4_;
    auVar34._0_4_ = (float)(uVar3 & 0xffff);
    auVar34._8_8_ = 0;
    fVar24 = (float)func_0x000145bfa165(_DAT_147229a10);
    auVar34 = divps(auVar34,_DAT_146ae6cc0);
    fVar22 = auVar34._0_4_ * fVar23 * fVar22 * fVar36 * fVar35;
    fVar26 = auVar34._4_4_ * fVar24 * fVar25 * fVar21 * fVar26;
    unaff_R12 = (ulong)(uVar18 & 0xffffff) | (ulong)(uVar7 & 0xffffff) << 0x18 | 0xf130000000000000;
    *(ulong *)(param_4 + 0x9a0) = uVar19;
    *(ulong *)(param_4 + 0x9b8) = uVar14;
    *(ulong *)(param_4 + 0x9a8) = uVar10;
    *(ulong *)(param_4 + 0x9b0) = uVar17;
    func_0x00014596ed40();
    fVar21 = *(float *)(param_4 + 0xa34);
    fVar24 = *(float *)(lVar20 + 0x28);
    fVar25 = *(float *)(lVar20 + 0x38);
    fVar28 = _DAT_145dd4e58 * fVar24 + _DAT_147229768;
    fVar27 = _DAT_145d9d2a4 * fVar25;
    uVar5 = *(undefined1 *)(lVar20 + 0x4c);
    fVar36 = ((float)uVar6 / _DAT_145d9d2d0) * _DAT_145f3db98 * *(float *)(lVar20 + 0x3c);
    uVar19 = *(ulong *)(param_4 + 0x9a0);
    uVar10 = *(ulong *)(param_4 + 0x9a8);
    uVar14 = *(ulong *)(param_4 + 0x9b8);
    uVar17 = *(ulong *)(param_4 + 0x9b0);
    do {
      lVar15 = ((uVar19 + uVar14) * 0x800000 | uVar19 + uVar14 >> 0x29) + uVar19;
      uVar12 = uVar10 << 0x11;
      uVar17 = uVar17 ^ uVar19;
      uVar14 = uVar14 ^ uVar10;
      uVar10 = uVar10 ^ uVar17;
      uVar19 = uVar19 ^ uVar14;
      uVar14 = uVar14 << 0x2d | uVar14 >> 0x13;
      uVar17 = uVar17 ^ uVar12;
      fVar23 = ((float)((uint)((ulong)lVar15 >> 0x29) | 0x3f800000) + fVar37) * _DAT_145de21f0;
    } while (_DAT_145de21f0 <= fVar23);
    fVar29 = fVar29 + 0.0;
    *(ulong *)(param_4 + 0x9a0) = uVar19;
    *(ulong *)(param_4 + 0x9b8) = uVar14;
    *(ulong *)(param_4 + 0x9a8) = uVar10;
    *(ulong *)(param_4 + 0x9b0) = uVar17;
    fVar37 = fVar23 + 0.0 + fVar21;
    uVar30 = 0;
    uVar31 = 0;
    uVar32 = 0;
    uVar33 = 0;
    lVar15 = *(long *)(param_4 + 0x568);
    if (lVar15 == *(long *)(param_4 + 0x558)) {
      func_0x000145d7e400();
    }
    lVar8 = *(long *)(param_4 + 0x560);
    lVar13 = lVar15 * 0x1d8;
    *(undefined8 *)(lVar8 + lVar13) = 0;
    *(undefined8 *)(lVar8 + 8 + lVar13) = 8;
    *(undefined8 *)(lVar8 + 0x10 + lVar13) = 0;
    *(undefined8 *)(lVar8 + 0x18 + lVar13) = 0xffffffffffffffff;
    *(undefined8 *)(lVar8 + 0x58 + lVar13) = 0xffffffffffffffff;
    *(undefined4 *)(lVar8 + 0xb0 + lVar13) = 0;
    *(undefined4 *)(lVar8 + 0xb8 + lVar13) = 0;
    *(undefined4 *)(lVar8 + 0xc0 + lVar13) = 0;
    *(undefined4 *)(lVar8 + 0xd0 + lVar13) = 0xffffffff;
    *(ulong *)(lVar8 + 0xf0 + lVar13) = unaff_R12;
    *(long *)(lVar8 + 0xf8 + lVar13) = lVar20;
    puVar1 = (undefined4 *)(lVar8 + 0x100 + lVar13);
    *puVar1 = uVar30;
    puVar1[1] = uVar31;
    puVar1[2] = uVar32;
    puVar1[3] = uVar33;
    puVar1 = (undefined4 *)(lVar8 + 0x110 + lVar13);
    *puVar1 = uVar30;
    puVar1[1] = uVar31;
    puVar1[2] = uVar32;
    puVar1[3] = uVar33;
    puVar1 = (undefined4 *)(lVar8 + 0x120 + lVar13);
    *puVar1 = uVar30;
    puVar1[1] = uVar31;
    puVar1[2] = uVar32;
    puVar1[3] = uVar33;
    puVar1 = (undefined4 *)(lVar8 + 0x130 + lVar13);
    *puVar1 = uVar30;
    puVar1[1] = uVar31;
    puVar1[2] = uVar32;
    puVar1[3] = uVar33;
    puVar1 = (undefined4 *)(lVar8 + 0x140 + lVar13);
    *puVar1 = uVar30;
    puVar1[1] = uVar31;
    puVar1[2] = uVar32;
    puVar1[3] = uVar33;
    *(undefined8 *)(lVar8 + 0x150 + lVar13) = 0;
    *(float *)(lVar8 + 0x158 + lVar13) = fVar22;
    pfVar2 = (float *)(lVar8 + 0x15c + lVar13);
    *pfVar2 = fVar22;
    pfVar2[1] = fVar26;
    *(float *)(lVar8 + 0x164 + lVar13) = fVar36;
    *(float *)(lVar8 + 0x168 + lVar13) = fVar25;
    *(float *)(lVar8 + 0x16c + lVar13) = fVar28;
    *(float *)(lVar8 + 0x170 + lVar13) = fVar24;
    *(undefined4 *)(lVar8 + 0x17c + lVar13) = local_f8;
    *(undefined8 *)(lVar8 + 0x174 + lVar13) = local_100;
    *(undefined8 *)(lVar8 + 0x180 + lVar13) = local_100;
    *(undefined4 *)(lVar8 + 0x188 + lVar13) = local_f8;
    *(float *)(lVar8 + 0x18c + lVar13) = fVar21;
    *(undefined4 *)(lVar8 + 400 + lVar13) = 0;
    *(float *)(lVar8 + 0x194 + lVar13) = fVar37;
    *(float *)(lVar8 + 0x198 + lVar13) = fVar27;
    puVar1 = (undefined4 *)(lVar8 + 0x19c + lVar13);
    *puVar1 = uVar30;
    puVar1[1] = uVar31;
    puVar1[2] = uVar32;
    puVar1[3] = uVar33;
    puVar1 = (undefined4 *)(lVar8 + 0x1ac + lVar13);
    *puVar1 = uVar30;
    puVar1[1] = uVar31;
    puVar1[2] = uVar32;
    puVar1[3] = uVar33;
    *(float *)(lVar8 + 0x1bc + lVar13) = fVar29;
    puVar1 = (undefined4 *)(lVar8 + 0x1c0 + lVar13);
    *puVar1 = uVar30;
    puVar1[1] = uVar31;
    puVar1[2] = uVar32;
    puVar1[3] = uVar33;
    *(undefined4 *)(lVar8 + 0x1d0 + lVar13) = 0;
    *(undefined1 *)(lVar8 + 0x1d4 + lVar13) = uVar5;
    *(long *)(param_4 + 0x568) = lVar15 + 1;
    uVar14 = 1;
  }
  auVar38._8_8_ = unaff_R12;
  auVar38._0_8_ = uVar14;
  return auVar38;
}

