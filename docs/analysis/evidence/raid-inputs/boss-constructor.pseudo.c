/* WARNING: Removing unreachable block (ram,0x00014593bb06) */
/* WARNING: Removing unreachable block (ram,0x00014593b98e) */
/* WARNING: Removing unreachable block (ram,0x00014593ba1f) */
/* WARNING: Removing unreachable block (ram,0x00014593bd01) */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,undefined8 *param_3,long param_4)

{
  undefined8 *puVar1;
  undefined8 *puVar2;
  undefined4 *puVar3;
  float fVar4;
  float fVar5;
  float fVar6;
  float fVar7;
  float fVar8;
  float fVar9;
  float fVar10;
  undefined8 uVar11;
  undefined1 auVar12 [16];
  code *pcVar13;
  float *pfVar14;
  undefined1 auVar15 [14];
  undefined1 auVar16 [14];
  undefined1 auVar17 [14];
  char cVar18;
  float fVar19;
  float fVar20;
  float fVar21;
  float fVar22;
  uint uVar23;
  long lVar24;
  ulong uVar25;
  int *piVar26;
  ulong uVar27;
  float *pfVar28;
  ulong uVar29;
  float *pfVar30;
  int iVar31;
  long lVar32;
  ulong uVar33;
  undefined8 uVar34;
  ulong uVar35;
  long lVar36;
  ulong uVar37;
  float *pfVar38;
  uint uVar39;
  undefined8 extraout_XMM0_Qa;
  undefined8 extraout_XMM0_Qb;
  undefined1 auVar40 [16];
  undefined4 in_XMM6_Da;
  undefined4 uVar41;
  undefined4 uVar42;
  undefined8 in_XMM7_Qa;
  undefined1 auVar43 [16];
  unkuint10 Var44;
  undefined1 auVar45 [16];
  int local_2e8;
  uint uStack_2dc;
  undefined4 uStack_2d0;
  undefined4 uStack_2cc;
  undefined8 local_110;
  undefined4 local_108;
  undefined8 *local_100;
  undefined8 local_f8;
  undefined8 local_f0;
  undefined8 local_e8;
  float *local_e0;
  undefined8 local_d8;
  uint local_d0;
  undefined8 *local_c8;
  long local_c0;
  ulong local_b8;
  undefined8 *local_b0;
  int *local_a8;
  undefined8 local_a0;
  undefined4 local_98;
  undefined8 local_88;

  local_a0 = 0xfffffffffffffffe;
  local_98 = in_XMM6_Da;
  local_88 = in_XMM7_Qa;
  lVar24 = func_0x000145898dc0(param_1,param_4,*(undefined8 *)(param_4 + 0x2b0),
                               *(undefined8 *)(param_4 + 0x2a8));
  local_108 = *(undefined4 *)(param_4 + 0x4d8);
  local_110 = *(undefined8 *)(param_4 + 0x4d0);
  local_e0 = (float *)&local_110;
  pfVar28 = *(float **)(lVar24 * 0xf0 + 0x146bf2698);
  lVar32 = *(long *)(lVar24 * 0xf0 + 0x146bf26a0);
  lVar36 = lVar32 * 2;
  func_0x0001459cbf00();
  if (local_b8 == 0) {
    if (((int)lVar24 == 0xb) || ((int)lVar24 == 7)) {
      uVar37 = lVar32 - 1U & 0x1fffffffffffffff;
      pfVar38 = pfVar28;
      pfVar14 = pfVar28;
      do {
        pfVar30 = pfVar14 + 2;
        uVar39 = func_0x000145c0a42f(*pfVar38 - *local_e0,pfVar38[1] - local_e0[1]);
        uVar23 = func_0x000145c0a42f(*pfVar30 - *local_e0,pfVar14[3] - local_e0[1]);
        if ((int)((uint)((int)uVar39 >> 0x1f) >> 1 ^ uVar39) <=
            (int)((uint)((int)uVar23 >> 0x1f) >> 1 ^ uVar23)) {
          pfVar38 = pfVar30;
        }
        uVar37 = uVar37 - 1;
        pfVar14 = pfVar30;
      } while (uVar37 != 0);
      goto LAB_14593b25d;
    }
    if (local_c8 != (undefined8 *)0x0) {
      func_0x0001400021d0();
    }
    func_0x00014593d500();
  }
  else {
    lVar32 = 0x3f;
    if (local_b8 != 0) {
      for (; local_b8 >> lVar32 == 0; lVar32 = lVar32 + -1) {
      }
    }
    uVar37 = *(ulong *)(param_4 + 0x9b8);
    uVar27 = *(ulong *)(param_4 + 0x9c0);
    uVar29 = *(ulong *)(param_4 + 0x9d0);
    uVar35 = *(ulong *)(param_4 + 0x9c8);
    do {
      uVar25 = ((uVar37 + uVar29) * 0x800000 | uVar37 + uVar29 >> 0x29) + uVar37;
      uVar33 = uVar27 << 0x11;
      uVar35 = uVar35 ^ uVar37;
      uVar29 = uVar29 ^ uVar27;
      uVar37 = uVar37 ^ uVar29;
      uVar29 = uVar29 << 0x2d | uVar29 >> 0x13;
      uVar27 = uVar27 ^ uVar35;
      auVar45._8_8_ = 0;
      auVar45._0_8_ = uVar25;
      auVar12._8_8_ = 0;
      auVar12._0_8_ = local_b8;
      uVar25 = SUB168(auVar45 * auVar12,8);
      uVar35 = uVar35 ^ uVar33;
    } while ((local_b8 << (~(byte)lVar32 & 0x3f)) - 1 < SUB168(auVar45 * auVar12,0));
    *(ulong *)(param_4 + 0x9b8) = uVar37;
    *(ulong *)(param_4 + 0x9d0) = uVar29;
    *(ulong *)(param_4 + 0x9c0) = uVar27;
    *(ulong *)(param_4 + 0x9c8) = uVar35;
    if (local_b8 <= uVar25) {
      func_0x000145da9883();
                    /* WARNING: Does not return */
      pcVar13 = (code *)invalidInstructionException();
      (*pcVar13)();
    }
    pfVar38 = *(float **)(local_c0 + uVar25 * 8);
LAB_14593b25d:
    uVar41 = (undefined4)*(undefined8 *)pfVar38;
    uVar42 = (undefined4)((ulong)*(undefined8 *)pfVar38 >> 0x20);
    lVar32 = *(long *)(param_4 + 0x9b0);
    uVar37 = func_0x0001458a0b40();
    auVar43._8_8_ = extraout_XMM0_Qb;
    auVar43._0_8_ = extraout_XMM0_Qa;
    local_d0 = (uint)extraout_XMM0_Qa;
    if ((uVar37 & 1) == 0) {
      if (*(long *)(lVar32 + 0x68) != -1) {
        func_0x0001458a4d60();
        local_2e8 = (int)pfVar28;
        if (local_2e8 == 1) {
          uStack_2dc = (uint)((ulong)(pfVar28 + lVar36) >> 0x20);
          auVar43 = ZEXT416(uStack_2dc);
          local_d0 = uStack_2dc;
          goto joined_r0x00014593b573;
        }
      }
      local_d0 = *(uint *)(lVar32 + 0xb8);
      auVar43 = ZEXT416(local_d0);
    }
joined_r0x00014593b573:
    if (local_c8 != (undefined8 *)0x0) {
      func_0x0001400021d0();
      local_d0 = auVar43._0_4_;
    }
    local_d8 = CONCAT44(uVar42,uVar41);
  }
  func_0x000145898dc0();
  if ((*(int *)(param_4 + 0x988) == 1) && (*(char *)(param_4 + 0xad0) != '\0')) {
    func_0x000145c0a465();
    func_0x000145c0a465();
  }
  auVar45 = ZEXT416(*(uint *)(param_4 + 0x2cc));
  uVar39 = *(uint *)(param_3 + 8);
  uVar23 = *(int *)(param_4 + 0xa78) + 1;
  *(uint *)(param_4 + 0xa78) = uVar23;
  uVar27 = (ulong)(uVar23 & 0xffffff) | (ulong)(uVar39 & 0xffffff) << 0x18 | 0xf130000000000000;
  func_0x00014593c570();
  Var44 = auVar45._0_10_;
  lVar32 = param_3[2];
  uVar37 = param_3[3];
  if (uVar37 != 0) {
    func_0x000140002200();
    uVar29 = func_0x0001400021c0();
    fVar22 = fRam0000000146c08e1c;
    fVar21 = fRam0000000146c08e18;
    fVar20 = fRam0000000146c08e14;
    fVar19 = _DAT_146c08e10;
    Var44 = auVar45._0_10_;
    if (uVar29 == 0) {
      func_0x000145da94eb();
                    /* WARNING: Does not return */
      pcVar13 = (code *)invalidInstructionException();
      (*pcVar13)();
    }
    if (uVar37 < 0xc) {
      uVar35 = 0;
    }
    else if (uVar29 < (uVar37 * 0x38 + lVar32) - 4 && lVar32 + 0x30U < uVar29 + uVar37 * 4) {
      uVar35 = 0;
    }
    else {
      uVar35 = uVar37 & 0xfffffffffffffff8;
      pfVar28 = (float *)(lVar32 + 0x1b8);
      uVar25 = 0;
      do {
        fVar4 = pfVar28[-0x54];
        fVar5 = pfVar28[-0x46];
        fVar6 = pfVar28[-0x38];
        fVar7 = *pfVar28;
        fVar8 = pfVar28[-0xe];
        fVar9 = pfVar28[-0x1c];
        fVar10 = pfVar28[-0x2a];
        pfVar38 = (float *)(uVar29 + uVar25 * 4);
        *pfVar38 = pfVar28[-0x62] * fVar19;
        pfVar38[1] = fVar4 * fVar20;
        pfVar38[2] = fVar5 * fVar21;
        pfVar38[3] = fVar6 * fVar22;
        pfVar38 = (float *)(uVar29 + 0x10 + uVar25 * 4);
        *pfVar38 = fVar10 * fVar19;
        pfVar38[1] = fVar9 * fVar20;
        pfVar38[2] = fVar8 * fVar21;
        pfVar38[3] = fVar7 * fVar22;
        uVar25 = uVar25 + 8;
        pfVar28 = pfVar28 + 0x70;
      } while (uVar35 != uVar25);
      if (uVar37 == uVar35) goto LAB_14593b6dd;
    }
    fVar19 = _DAT_145db1730;
    uVar33 = uVar37 & 3;
    uVar25 = uVar35;
    if (uVar33 != 0) {
      lVar36 = 0;
      do {
        *(float *)(uVar29 + uVar25 * 4) =
             *(float *)(uVar35 * 0x38 + lVar32 + 0x30 + lVar36 * 4) * fVar19;
        uVar25 = uVar25 + 1;
        lVar36 = lVar36 + 0xe;
      } while ((ulong)(uint)((int)uVar33 << 4) + uVar33 * -2 != lVar36);
    }
    fVar19 = _DAT_145db1730;
    if (uVar35 - uVar37 < 0xfffffffffffffffd) {
      pfVar28 = (float *)(uVar25 * 0x38 + lVar32 + 0xd8);
      do {
        *(float *)(uVar29 + uVar25 * 4) = pfVar28[-0x2a] * fVar19;
        *(float *)(uVar29 + 4 + uVar25 * 4) = pfVar28[-0x1c] * fVar19;
        *(float *)(uVar29 + 8 + uVar25 * 4) = pfVar28[-0xe] * fVar19;
        *(float *)(uVar29 + 0xc + uVar25 * 4) = *pfVar28 * fVar19;
        uVar25 = uVar25 + 4;
        pfVar28 = pfVar28 + 0x38;
      } while (uVar37 != uVar25);
    }
  }
LAB_14593b6dd:
  auVar15._10_2_ = 0;
  auVar15._0_10_ = Var44;
  auVar15._12_2_ = (short)(Var44 >> 0x30);
  auVar16._8_2_ = (short)(Var44 >> 0x20);
  auVar16._0_8_ = (long)Var44;
  auVar16._10_4_ = auVar15._10_4_;
  auVar17._6_8_ = 0;
  auVar17._0_6_ = auVar16._8_6_;
  auVar40._0_4_ = (float)(ushort)Var44;
  auVar40._4_4_ = (float)(int)CONCAT82(SUB148(auVar17 << 0x40,6),(short)(Var44 >> 0x10));
  auVar40._8_4_ = (float)auVar16._8_4_;
  auVar40._12_4_ = (float)(auVar15._10_4_ >> 0x10);
  divps(auVar40,_DAT_146af86c0);
  lVar32 = *(long *)(param_4 + 0x570);
  if (lVar32 == *(long *)(param_4 + 0x560)) {
    func_0x000145d8d160();
  }
  puVar1 = param_3 + 8;
  func_0x000145c0a3db();
  *(long *)(param_4 + 0x570) = lVar32 + 1;
  cVar18 = DAT_146be68a9;
  if (((uVar39 == 0x2b5) || (cVar18 = DAT_146be68c9, uVar39 == 0x443)) && (cVar18 != '\x02')) {
    func_0x000145915340();
  }
  local_c0 = 0x145beebe0;
  local_c8 = puVar1;
  func_0x000145bdd130();
  uVar34 = *param_3;
  uVar11 = param_3[1];
  local_b0 = (undefined8 *)0x8;
  local_100 = param_3;
  func_0x00014598ddd0();
  local_c0 = 0x145beebe0;
  local_f8 = uVar34;
  local_f0 = uVar11;
  local_c8 = puVar1;
  local_b0 = puVar1;
  local_a8 = (int *)uVar27;
  func_0x000145bdd130();
  local_e8 = 8;
  func_0x00014598ddd0();
  func_0x0001458c4010();
  lVar32 = *(long *)(param_4 + 0x630);
  if (lVar32 == *(long *)(param_4 + 0x620)) {
    func_0x000145c0dbd0();
  }
  lVar36 = *(long *)(param_4 + 0x628);
  uStack_2d0 = (undefined4)uVar37;
  uStack_2cc = (undefined4)(uVar37 >> 0x20);
  puVar3 = (undefined4 *)(lVar36 + 0x10 + lVar32 * 0x20);
  *puVar3 = 0;
  puVar3[1] = 0;
  puVar3[2] = uStack_2d0;
  puVar3[3] = uStack_2cc;
  puVar1 = (undefined8 *)(lVar36 + lVar32 * 0x20);
  *puVar1 = 0;
  puVar1[1] = 8;
  *(long *)(param_4 + 0x630) = lVar32 + 1;
  local_c8 = local_b0;
  local_c0 = 0x145beebe0;
  func_0x000145bdd130();
  local_a8 = (int *)0x8;
  func_0x00014598ddd0();
  puVar1 = local_100;
  func_0x00014598ddd0();
  func_0x0001458c22c0();
  lVar32 = *(long *)(param_4 + 0x630);
  if (lVar32 == *(long *)(param_4 + 0x620)) {
    func_0x000145c0dbd0();
  }
  lVar36 = *(long *)(param_4 + 0x628);
  puVar3 = (undefined4 *)(lVar36 + 0x10 + lVar32 * 0x20);
  *puVar3 = 0;
  puVar3[1] = 0;
  puVar3[2] = uStack_2d0;
  puVar3[3] = uStack_2cc;
  puVar2 = (undefined8 *)(lVar36 + lVar32 * 0x20);
  *puVar2 = 0;
  puVar2[1] = 8;
  *(long *)(param_4 + 0x630) = lVar32 + 1;
  func_0x000140002200();
  piVar26 = (int *)func_0x0001400021c0();
  puVar2 = local_b0;
  if (piVar26 != (int *)0x0) {
    *piVar26 = 0x1fee;
    lVar32 = *(long *)(param_4 + 0x630);
    local_a8 = piVar26;
    if (lVar32 == *(long *)(param_4 + 0x620)) {
      func_0x000145c0dbd0();
    }
    lVar36 = *(long *)(param_4 + 0x628);
    lVar24 = lVar32 * 0x20;
    *(undefined8 *)(lVar36 + lVar24) = 0x20;
    *(int **)(lVar36 + 8 + lVar24) = local_a8;
    *(undefined8 *)(lVar36 + 0x10 + lVar24) = 4;
    *(undefined2 *)(lVar36 + 0x18 + lVar24) = 0x2d2;
    *(long *)(param_4 + 0x630) = lVar32 + 1;
    iVar31 = *(int *)(puVar1 + 0xc);
    if (iVar31 != 0) {
      func_0x000140002200();
      piVar26 = (int *)func_0x0001400021c0();
      if (piVar26 == (int *)0x0) goto LAB_14593bde7;
      *piVar26 = iVar31;
      lVar32 = *(long *)(param_4 + 0x630);
      local_a8 = piVar26;
      if (lVar32 == *(long *)(param_4 + 0x620)) {
        func_0x000145c0dbd0();
      }
      lVar36 = *(long *)(param_4 + 0x628);
      lVar24 = lVar32 * 0x20;
      *(undefined8 *)(lVar36 + lVar24) = 0x20;
      *(int **)(lVar36 + 8 + lVar24) = local_a8;
      *(undefined8 *)(lVar36 + 0x10 + lVar24) = 4;
      *(undefined2 *)(lVar36 + 0x18 + lVar24) = 0x2d2;
      *(long *)(param_4 + 0x630) = lVar32 + 1;
    }
    local_c8 = puVar2;
    local_c0 = 0x145beebe0;
    func_0x000145bdd130();
    local_b0 = (undefined8 *)0x8;
    func_0x00014598ddd0();
    func_0x00014598bf40();
    func_0x000145912fa0();
    return;
  }
LAB_14593bde7:
  func_0x000145da94eb();
                    /* WARNING: Does not return */
  pcVar13 = (code *)invalidInstructionException();
  (*pcVar13)();
}
