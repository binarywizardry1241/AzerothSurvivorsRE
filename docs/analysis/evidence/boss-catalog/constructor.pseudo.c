
/* WARNING: Removing unreachable block (ram,0x00014593079f) */
/* WARNING: Removing unreachable block (ram,0x00014593082a) */
/* WARNING: Removing unreachable block (ram,0x00014593091c) */
/* WARNING: Heritage AFTER dead removal. Example location: XMM1_Qa : 0x000145930d49 */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* WARNING: Restarted to delay deadcode elimination for space: register */

void entry(undefined8 param_1,undefined4 param_2,undefined8 param_3,undefined8 param_4,
          undefined8 *param_5,long param_6)

{
  undefined2 *puVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  float fVar5;
  byte bVar6;
  uint uVar7;
  undefined8 uVar8;
  undefined1 auVar9 [16];
  undefined1 auVar10 [16];
  code *pcVar11;
  float fVar12;
  float fVar13;
  float fVar14;
  float fVar15;
  undefined1 auVar16 [16];
  float fVar17;
  undefined1 auVar18 [14];
  undefined1 auVar19 [14];
  undefined1 auVar20 [14];
  undefined1 auVar21 [16];
  undefined1 auVar22 [16];
  undefined1 auVar23 [14];
  uint uVar24;
  long lVar25;
  ulong uVar26;
  ulong uVar27;
  int *piVar28;
  undefined1 *puVar29;
  ulong uVar30;
  float *pfVar31;
  long lVar32;
  ulong uVar33;
  float *pfVar34;
  long lVar35;
  uint uVar36;
  ulong uVar37;
  ulong uVar38;
  ulong uVar39;
  float *pfVar40;
  int iVar41;
  undefined8 uVar42;
  undefined8 extraout_XMM0_Qa;
  int iVar44;
  int iVar45;
  undefined8 extraout_XMM0_Qb;
  undefined1 auVar43 [16];
  undefined2 in_XMM1_Wc;
  undefined2 in_XMM1_Wd;
  undefined1 auVar46 [16];
  undefined4 in_XMM6_Da;
  undefined4 uVar47;
  undefined4 uVar48;
  undefined1 auVar49 [16];
  undefined1 auVar50 [16];
  undefined1 auVar51 [16];
  int local_280;
  uint uStack_274;
  undefined8 uStack_268;
  undefined8 *local_120;
  undefined8 local_118;
  undefined8 local_110;
  undefined8 local_108;
  undefined8 **local_100;
  undefined8 local_f8;
  uint local_f0;
  undefined8 *local_e8;
  undefined1 *puStack_e0;
  undefined8 local_d8;
  undefined4 uStack_d0;
  undefined4 uStack_cc;
  undefined1 *local_c0;
  undefined8 *local_b8;
  int *local_b0;
  undefined1 local_a1;
  undefined8 local_a0;
  undefined4 local_98;

  local_a0 = 0xfffffffffffffffe;
  local_98 = in_XMM6_Da;
  lVar25 = func_0x0001458753b0(param_3,param_6,*(undefined8 *)(param_6 + 0x298),
                               *(undefined8 *)(param_6 + 0x290));
  local_118 = CONCAT44(local_118._4_4_,*(undefined4 *)(param_6 + 0x4d0));
  local_120 = *(undefined8 **)(param_6 + 0x4c8);
  local_100 = &local_120;
  pfVar40 = *(float **)(lVar25 * 0xf0 + 0x146ba94b8);
  lVar35 = *(long *)(lVar25 * 0xf0 + 0x146ba94c0);
  pfVar31 = pfVar40 + lVar35 * 2;
  local_280 = (int)pfVar40;
  uVar42 = func_0x00014599ca00();
  uVar27 = CONCAT44(local_d8._4_4_,(undefined4)local_d8);
  if (uVar27 == 0) {
    if (((int)lVar25 == 0xb) || ((int)lVar25 == 7)) {
      uVar27 = lVar35 - 1U & 0x1fffffffffffffff;
      pfVar34 = pfVar40;
      do {
        pfVar34 = pfVar34 + 2;
        uVar42 = func_0x000145bc97f9(*pfVar40 - *(float *)local_100);
        iVar41 = (int)uVar42;
        iVar44 = (int)((ulong)uVar42 >> 0x20);
        uVar42 = func_0x000145bc97f9(*pfVar34 - *(float *)local_100);
        iVar45 = (int)((ulong)uVar42 >> 0x20);
        auVar43._0_4_ = (uint)(iVar41 >> 0x1f) >> 1;
        auVar43._4_4_ = (uint)((int)uVar42 >> 0x1f) >> 1;
        auVar43._8_4_ = (uint)(iVar44 >> 0x1f) >> 1;
        auVar43._12_4_ = (uint)(iVar45 >> 0x1f) >> 1;
        auVar51._4_4_ = (int)uVar42;
        auVar51._0_4_ = iVar41;
        auVar51._8_4_ = iVar44;
        auVar51._12_4_ = iVar45;
        if (SUB164(auVar43 ^ auVar51,0) <= SUB164(auVar43 ^ auVar51,4)) {
          pfVar40 = pfVar34;
        }
        uVar27 = uVar27 - 1;
      } while (uVar27 != 0);
      goto LAB_1459300fd;
    }
    if (local_e8 != (undefined8 *)0x0) {
      uVar42 = func_0x0001400021d0();
    }
    func_0x000145932750(uVar42,CONCAT26(in_XMM1_Wd,CONCAT24(in_XMM1_Wc,param_2)),_DAT_145db7ca4,
                        _DAT_145d9de20);
  }
  else {
    lVar35 = 0x3f;
    if (uVar27 != 0) {
      for (; uVar27 >> lVar35 == 0; lVar35 = lVar35 + -1) {
      }
    }
    uVar38 = *(ulong *)(param_6 + 0x958);
    uVar30 = *(ulong *)(param_6 + 0x960);
    uVar33 = *(ulong *)(param_6 + 0x970);
    uVar37 = *(ulong *)(param_6 + 0x968);
    do {
      uVar26 = ((uVar38 + uVar33) * 0x800000 | uVar38 + uVar33 >> 0x29) + uVar38;
      uVar39 = uVar30 << 0x11;
      uVar37 = uVar37 ^ uVar38;
      uVar33 = uVar33 ^ uVar30;
      uVar38 = uVar38 ^ uVar33;
      uVar33 = uVar33 << 0x2d | uVar33 >> 0x13;
      uVar30 = uVar30 ^ uVar37;
      auVar9._8_8_ = 0;
      auVar9._0_8_ = uVar26;
      auVar10._8_8_ = 0;
      auVar10._0_8_ = uVar27;
      uVar26 = SUB168(auVar9 * auVar10,8);
      uVar37 = uVar37 ^ uVar39;
    } while ((uVar27 << (~(byte)lVar35 & 0x3f)) - 1 < SUB168(auVar9 * auVar10,0));
    *(ulong *)(param_6 + 0x958) = uVar38;
    *(ulong *)(param_6 + 0x970) = uVar33;
    *(ulong *)(param_6 + 0x960) = uVar30;
    *(ulong *)(param_6 + 0x968) = uVar37;
    if (uVar27 <= uVar26) {
      func_0x000145d697e3();
                    /* WARNING: Does not return */
      pcVar11 = (code *)invalidInstructionException();
      (*pcVar11)();
    }
    pfVar40 = *(float **)((long)puStack_e0 + uVar26 * 8);
LAB_1459300fd:
    uStack_274 = (uint)((ulong)pfVar31 >> 0x20);
    uVar47 = (undefined4)*(undefined8 *)pfVar40;
    uVar48 = (undefined4)((ulong)*(undefined8 *)pfVar40 >> 0x20);
    auVar50._4_4_ = uVar48;
    auVar50._0_4_ = uVar48;
    auVar50._8_8_ = 0;
    lVar35 = *(long *)(param_6 + 0x950);
    uVar27 = func_0x0001458c7b60();
    auVar49._8_8_ = extraout_XMM0_Qb;
    auVar49._0_8_ = extraout_XMM0_Qa;
    local_f0 = (uint)extraout_XMM0_Qa;
    if ((uVar27 & 1) == 0) {
      if ((*(long *)(lVar35 + 0x68) == -1) ||
         (func_0x0001458cc950(extraout_XMM0_Qa,CONCAT26(in_XMM1_Wd,CONCAT24(in_XMM1_Wc,param_2)),
                              uVar47,auVar50._0_4_), local_280 != 1)) {
        local_f0 = *(uint *)(lVar35 + 0xb8);
        auVar49 = ZEXT416(local_f0);
      }
      else {
        auVar49 = ZEXT416(uStack_274);
        local_f0 = uStack_274;
      }
    }
    if (local_e8 != (undefined8 *)0x0) {
      func_0x0001400021d0();
      local_f0 = auVar49._0_4_;
    }
    local_f8 = CONCAT44(uVar48,uVar47);
  }
  func_0x0001458753b0();
  auVar51 = ZEXT416(*(uint *)(param_6 + 0x2b4));
  func_0x000145bc9805();
  uVar7 = *(uint *)(param_5 + 6);
  uVar24 = *(int *)(param_6 + 0xa0c) + 1;
  *(uint *)(param_6 + 0xa0c) = uVar24;
  func_0x0001459317c0();
  uVar27 = param_5[3];
  if (uVar27 != 0) {
    lVar35 = param_5[2];
    func_0x000140002200();
    uVar38 = func_0x0001400021c0();
    if (uVar38 == 0) {
      func_0x000145d6944b();
                    /* WARNING: Does not return */
      pcVar11 = (code *)invalidInstructionException();
      (*pcVar11)();
    }
    if ((uVar27 < 0xd) || (uVar38 < uVar27 * 0x1c + lVar35 && lVar35 + 0x18U < uVar38 + uVar27 * 4))
    {
      uVar30 = 0;
    }
    else {
      uVar30 = 8;
      if ((uVar27 & 7) != 0) {
        uVar30 = (ulong)((uint)uVar27 & 7);
      }
      uVar30 = uVar27 - uVar30;
      pfVar31 = (float *)(lVar35 + 0xdc);
      uVar33 = 0;
      fVar12 = (float)DAT_146e78620;
      fVar13 = DAT_146e78620._4_4_;
      fVar14 = DAT_146e78620._8_4_;
      fVar15 = DAT_146e78620._12_4_;
      do {
        fVar2 = *pfVar31;
        fVar3 = pfVar31[-7];
        fVar4 = pfVar31[-0xe];
        fVar5 = pfVar31[-0x15];
        fVar17 = pfVar31[-0x2a] * fVar13;
        auVar16._4_2_ = SUB42(fVar17,0);
        auVar16._0_4_ = pfVar31[-0x31] * fVar12;
        auVar16._6_2_ = (short)((uint)fVar17 >> 0x10);
        auVar16._8_4_ = pfVar31[-0x23] * fVar14;
        auVar16._12_4_ = pfVar31[-0x1c] * fVar15;
        *(undefined1 (*) [16])(uVar38 + uVar33 * 4) = auVar16;
        pfVar40 = (float *)(uVar38 + 0x10 + uVar33 * 4);
        *pfVar40 = fVar5 * fVar12;
        pfVar40[1] = fVar4 * fVar13;
        pfVar40[2] = fVar3 * fVar14;
        pfVar40[3] = fVar2 * fVar15;
        uVar33 = uVar33 + 8;
        pfVar31 = pfVar31 + 0x38;
      } while (uVar30 != uVar33);
    }
    fVar12 = _DAT_145d74008;
    uVar36 = (uint)uVar27 - (int)uVar30 & 3;
    uVar33 = uVar30;
    if (uVar36 != 0) {
      lVar25 = 0;
      do {
        *(float *)(uVar38 + uVar33 * 4) =
             *(float *)(lVar35 + uVar30 * 0x1c + 0x18 + lVar25 * 4) * fVar12;
        uVar33 = uVar33 + 1;
        lVar25 = lVar25 + 7;
      } while ((ulong)uVar36 * 7 - lVar25 != 0);
    }
    fVar12 = _DAT_145d74008;
    if (uVar30 - uVar27 < 0xfffffffffffffffd) {
      pfVar31 = (float *)(uVar33 * 0x1c + lVar35 + 0x6c);
      do {
        *(float *)(uVar38 + uVar33 * 4) = pfVar31[-0x15] * fVar12;
        *(float *)(uVar38 + 4 + uVar33 * 4) = pfVar31[-0xe] * fVar12;
        *(float *)(uVar38 + 8 + uVar33 * 4) = pfVar31[-7] * fVar12;
        *(float *)(uVar38 + 0xc + uVar33 * 4) = *pfVar31 * fVar12;
        uVar33 = uVar33 + 4;
        pfVar31 = pfVar31 + 0x1c;
      } while (uVar27 != uVar33);
    }
  }
  func_0x000145bc9805();
  auVar18._10_2_ = 0;
  auVar18._0_10_ = auVar51._0_10_;
  auVar18._12_2_ = auVar51._6_2_;
  auVar19._8_2_ = auVar51._4_2_;
  auVar19._0_8_ = auVar51._0_8_;
  auVar19._10_4_ = auVar18._10_4_;
  auVar23._6_8_ = 0;
  auVar23._0_6_ = auVar19._8_6_;
  auVar20._4_2_ = auVar51._2_2_;
  auVar20._0_4_ = auVar51._0_4_;
  auVar20._6_8_ = SUB148(auVar23 << 0x40,6);
  auVar46._0_4_ = (float)(auVar51._0_4_ & 0xffff);
  auVar46._4_4_ = (float)auVar20._4_4_;
  auVar46._8_4_ = (float)auVar19._8_4_;
  auVar46._12_4_ = (float)auVar51._6_2_;
  divps(auVar46,_DAT_146ab54c0);
  lVar35 = *(long *)(param_6 + 0x568);
  if (lVar35 == *(long *)(param_6 + 0x558)) {
    func_0x000145c824e0();
  }
  func_0x000145bc977b();
  *(long *)(param_6 + 0x568) = lVar35 + 1;
  puStack_e0 = (undefined1 *)0x145badf80;
  local_e8 = param_5 + 6;
  local_b8 = param_5 + 6;
  func_0x000145b9c4d0();
  local_c0 = (undefined1 *)0x8;
  uVar42 = *param_5;
  uVar8 = param_5[1];
  func_0x0001458da590();
  local_e8 = param_5 + 6;
  puStack_e0 = (undefined1 *)0x145badf80;
  local_110 = uVar8;
  local_c0 = (undefined1 *)uVar42;
  local_b0 = (int *)((ulong)(uVar24 & 0xffffff) | (ulong)(uVar7 & 0xffffff) << 0x18 |
                    0xf130000000000000);
  func_0x000145b9c4d0();
  local_108 = 8;
  func_0x0001458da590();
  func_0x0001458aae00();
  lVar35 = *(long *)(param_6 + 0x5e0);
  if (lVar35 == *(long *)(param_6 + 0x5d0)) {
    func_0x000145bcb530();
  }
  lVar25 = *(long *)(param_6 + 0x5d8);
  auVar21._12_4_ = 0;
  auVar21._0_12_ = ZEXT412(8) << 0x40;
  uStack_268._0_2_ = (undefined2)uVar27;
  uStack_268._2_2_ = (undefined2)(uVar27 >> 0x10);
  uStack_268._4_2_ = (undefined2)(uVar27 >> 0x20);
  uStack_268._6_2_ = (undefined2)(uVar27 >> 0x30);
  puVar1 = (undefined2 *)(lVar25 + 0x10 + lVar35 * 0x20);
  *puVar1 = 0;
  puVar1[1] = 0;
  puVar1[2] = 0;
  puVar1[3] = 0;
  puVar1[4] = (undefined2)uStack_268;
  puVar1[5] = uStack_268._2_2_;
  puVar1[6] = uStack_268._4_2_;
  puVar1[7] = uStack_268._6_2_;
  *(undefined1 (*) [16])(lVar25 + lVar35 * 0x20) = auVar21;
  *(long *)(param_6 + 0x5e0) = lVar35 + 1;
  local_e8 = local_b8;
  puStack_e0 = (undefined1 *)0x145badf80;
  func_0x000145b9c4d0();
  local_b0 = (int *)0x8;
  func_0x0001458da590();
  func_0x0001458da590();
  func_0x0001458a9500();
  lVar35 = *(long *)(param_6 + 0x5e0);
  if (lVar35 == *(long *)(param_6 + 0x5d0)) {
    func_0x000145bcb530();
  }
  lVar25 = *(long *)(param_6 + 0x5d8);
  auVar22._12_4_ = 0;
  auVar22._0_12_ = ZEXT412(8) << 0x40;
  puVar1 = (undefined2 *)(lVar25 + 0x10 + lVar35 * 0x20);
  *puVar1 = 0;
  puVar1[1] = 0;
  puVar1[2] = 0;
  puVar1[3] = 0;
  puVar1[4] = (undefined2)uStack_268;
  puVar1[5] = uStack_268._2_2_;
  puVar1[6] = uStack_268._4_2_;
  puVar1[7] = uStack_268._6_2_;
  *(undefined1 (*) [16])(lVar25 + lVar35 * 0x20) = auVar22;
  *(long *)(param_6 + 0x5e0) = lVar35 + 1;
  func_0x000140002200();
  piVar28 = (int *)func_0x0001400021c0();
  if (piVar28 != (int *)0x0) {
    *piVar28 = 0x1fee;
    lVar35 = *(long *)(param_6 + 0x5e0);
    local_b0 = piVar28;
    if (lVar35 == *(long *)(param_6 + 0x5d0)) {
      func_0x000145bcb530();
    }
    lVar25 = *(long *)(param_6 + 0x5d8);
    lVar32 = lVar35 * 0x20;
    *(undefined8 *)(lVar25 + lVar32) = 0x20;
    *(int **)(lVar25 + 8 + lVar32) = local_b0;
    *(undefined8 *)(lVar25 + 0x10 + lVar32) = 4;
    *(undefined2 *)(lVar25 + 0x18 + lVar32) = 0x2d2;
    *(long *)(param_6 + 0x5e0) = lVar35 + 1;
    iVar41 = *(int *)(param_5 + 10);
    if (iVar41 != 0) {
      func_0x000140002200();
      piVar28 = (int *)func_0x0001400021c0();
      if (piVar28 == (int *)0x0) goto LAB_145930dac;
      *piVar28 = iVar41;
      lVar35 = *(long *)(param_6 + 0x5e0);
      local_b0 = piVar28;
      if (lVar35 == *(long *)(param_6 + 0x5d0)) {
        func_0x000145bcb530();
      }
      lVar25 = *(long *)(param_6 + 0x5d8);
      lVar32 = lVar35 * 0x20;
      *(undefined8 *)(lVar25 + lVar32) = 0x20;
      *(int **)(lVar25 + 8 + lVar32) = local_b0;
      *(undefined8 *)(lVar25 + 0x10 + lVar32) = 4;
      *(undefined2 *)(lVar25 + 0x18 + lVar32) = 0x2d2;
      *(long *)(param_6 + 0x5e0) = lVar35 + 1;
    }
    func_0x000140002200();
    puVar29 = (undefined1 *)func_0x0001400021c0();
    if (puVar29 != (undefined1 *)0x0) {
      *puVar29 = 0x7b;
      uStack_268 = CONCAT71((int7)(uVar27 >> 8),1);
      func_0x0001458d97b0();
      local_120 = local_b8;
      local_118 = 0x145badf80;
      local_a1 = 1;
      func_0x000145b9c4d0();
      local_b8 = (undefined8 *)puVar29;
      func_0x0001458da590();
      func_0x0001400021d0();
      local_a1 = 0;
      func_0x0001458d97b0();
      bVar6 = *(byte *)((long)param_5 + 0x54);
      func_0x0001458d9500();
      uVar38 = (ulong)bVar6 ^ 5;
      if (uVar38 != 0) {
        func_0x000145bcb2d0();
      }
      func_0x000145bc977b();
      lVar35 = uVar38 + 1;
      local_e8 = (undefined8 *)0x1;
      uStack_268._4_4_ = (undefined4)(uVar27 >> 0x20);
      uStack_d0 = (undefined4)uStack_268;
      uStack_cc = uStack_268._4_4_;
      puStack_e0 = puVar29;
      local_d8 = lVar35;
      if (lVar35 == 1) {
        func_0x000145bcb2d0();
      }
      local_b8 = local_e8;
      local_c0 = puStack_e0;
      puStack_e0[lVar35] = 0x7d;
      lVar25 = *(long *)(param_6 + 0x5f8);
      if (lVar25 == *(long *)(param_6 + 0x5e8)) {
        func_0x000145bcb3e0();
      }
      lVar32 = *(long *)(param_6 + 0x5f0);
      *(undefined8 **)(lVar32 + lVar25 * 0x18) = local_b8;
      *(undefined1 **)(lVar32 + 8 + lVar25 * 0x18) = local_c0;
      *(long *)(lVar32 + 0x10 + lVar25 * 0x18) = lVar35 + 1;
      *(long *)(param_6 + 0x5f8) = lVar25 + 1;
      return;
    }
    func_0x000145d6944b();
                    /* WARNING: Does not return */
    pcVar11 = (code *)invalidInstructionException();
    (*pcVar11)();
  }
LAB_145930dac:
  func_0x000145d6944b();
                    /* WARNING: Does not return */
  pcVar11 = (code *)invalidInstructionException();
  (*pcVar11)();
}
