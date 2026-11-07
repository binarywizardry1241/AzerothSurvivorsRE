/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,int param_3,long param_4,ulong param_5)

{
  long *plVar1;
  undefined4 *puVar2;
  ushort uVar3;
  int iVar4;
  undefined8 *puVar5;
  long lVar6;
  code *pcVar7;
  undefined1 *puVar8;
  long lVar9;
  ulong uVar10;
  long lVar11;
  int iVar12;
  undefined8 uVar13;
  ulong uVar14;
  ulong uVar15;
  undefined8 *puVar16;
  ulong uVar17;
  bool bVar18;
  undefined1 auVar19 [16];
  float fVar20;
  undefined4 in_XMM6_Da;
  float fVar21;
  undefined4 in_XMM7_Da;
  float fVar22;
  undefined4 uVar23;
  undefined4 uVar24;
  undefined4 uVar25;
  undefined1 auVar26 [16];
  undefined8 local_e8;
  undefined8 local_e0;
  undefined1 *local_d8;
  undefined1 *local_d0;
  undefined8 local_c8;
  undefined8 local_c0;
  undefined8 local_b8;
  long local_b0;
  long local_a8;
  long *local_a0;
  undefined1 auStack_98 [16];
  undefined8 uStack_88;
  undefined8 local_80;
  undefined1 local_78;
  undefined8 local_70;
  undefined4 local_68;
  undefined4 local_58;

  local_70 = 0xfffffffffffffffe;
  fVar21 = *(float *)(param_4 + 0x9ec);
  local_68 = in_XMM6_Da;
  local_58 = in_XMM7_Da;
  if (param_3 == 3) {
    local_e0 = 5;
    local_e8 = 0x146e78e34;
    iVar12 = 0x5b9b;
  }
  else if (param_3 == 4) {
    local_e0 = 10;
    local_e8 = 0x146e78e59;
    iVar12 = 0x5bd1;
  }
  else {
    local_e8 = 0x146e79dd0;
    local_e0 = 0xb;
    iVar12 = 0x2330;
    if (param_3 == 5) {
      uVar23 = 0;
      uVar24 = 0;
      uVar25 = 0;
      fVar22 = *(float *)(param_4 + 0x478) * _DAT_145d6d754;
      uVar13 = 0x146e79dd0;
      auVar26 = func_0x0001458da590(0x146e79dd0,param_4,0xb,0x146e79dd0);
      fVar21 = *(float *)(param_4 + 0x4e0);
      fVar22 = fVar22 + fVar21;
      fVar20 = fVar22;
      if (*(float *)(param_4 + 0x478) <= fVar22) {
        fVar20 = *(float *)(param_4 + 0x478);
      }
      auVar19._4_4_ = uVar23;
      auVar19._0_4_ = (uint)fVar22 & -(uint)NAN(fVar20);
      auVar19._8_4_ = uVar24;
      auVar19._12_4_ = uVar25;
      auVar19 = ZEXT416(~-(uint)NAN(fVar20) & (uint)fVar20) | auVar19;
      fVar20 = auVar19._0_4_;
      *(float *)(param_4 + 0x4e0) = fVar20;
      fVar20 = fVar20 - fVar21;
      fVar21 = 0.0;
      if (0.0 < fVar20) {
        if (auVar26._0_8_ == 0) {
          auVar26._8_8_ = 0xb;
          auVar26._0_8_ = uVar13;
        }
        local_a0 = (long *)0xffffffffffffffff;
        uStack_88 = 0x146e79ddb;
        local_80 = 0xf;
        local_78 = 0;
        auStack_98 = auVar26;
        func_0x00014595f3c0(auVar19._0_8_,fVar20,(double)fVar20);
      }
      fVar20 = (float)func_0x000145bc981d();
      uVar10 = (long)fVar20 & 0xffffffff;
      if (fVar20 < fVar21) {
        uVar10 = 0;
      }
      if (_DAT_145d6d874 < fVar20) {
        uVar10 = 0xffffffff;
      }
      fVar20 = _DAT_145d6d874;
      fVar22 = (float)func_0x000145bc981d();
      uVar14 = (long)fVar22 & 0xffffffff;
      if (fVar22 < fVar21) {
        uVar14 = 0;
      }
      uVar23 = (undefined4)uVar14;
      if (fVar20 < fVar22) {
        uVar23 = 0xffffffff;
      }
      plVar1 = (long *)(param_4 + 0x990);
      lVar11 = *(long *)(param_4 + 0x990);
      if (lVar11 != 0) {
        lVar9 = *(long *)(param_4 + 0x998);
        do {
          uVar17 = (ulong)((uint)*(ushort *)(lVar11 + 0x36) * 2);
          uVar14 = 0xffffffffffffffff;
          do {
            param_5 = (ulong)*(ushort *)(lVar11 + 0x36);
            if (uVar17 == 0) goto LAB_145945422;
            uVar3 = *(ushort *)(lVar11 + 0x3a + uVar14 * 2);
            param_5 = uVar14 + 1;
            uVar17 = uVar17 - 2;
            uVar14 = param_5;
          } while ((char)((uVar3 < 0x16) - (0x16 < uVar3)) == '\x01');
          if (uVar3 < 0x16 == 0x16 < uVar3) {
            *(int *)(lVar11 + 8 + param_5 * 4) = (int)uVar10;
            lVar11 = *plVar1;
            if (lVar11 == 0) goto LAB_14594573c;
            goto LAB_145945696;
          }
LAB_145945422:
          bVar18 = lVar9 == 0;
          lVar9 = lVar9 + -1;
          if (bVar18) goto LAB_145945704;
          lVar11 = *(long *)(lVar11 + 0x50 + param_5 * 8);
        } while( true );
      }
      lVar11 = 0;
LAB_145945704:
      auStack_98._8_8_ = 0;
      local_80 = 0x16;
      local_a0 = plVar1;
      auStack_98._0_8_ = lVar11;
      uStack_88 = param_5;
      func_0x0001458e1710();
      lVar11 = *plVar1;
      param_5 = uVar10;
      if (lVar11 != 0) {
LAB_145945696:
        lVar9 = *(long *)(param_4 + 0x998);
        do {
          uVar14 = (ulong)((uint)*(ushort *)(lVar11 + 0x36) * 2);
          uVar10 = 0xffffffffffffffff;
          do {
            param_5 = (ulong)*(ushort *)(lVar11 + 0x36);
            if (uVar14 == 0) goto LAB_1459456ee;
            uVar3 = *(ushort *)(lVar11 + 0x3a + uVar10 * 2);
            param_5 = uVar10 + 1;
            uVar14 = uVar14 - 2;
            uVar10 = param_5;
          } while ((char)((uVar3 < 0x1c) - (0x1c < uVar3)) == '\x01');
          if (uVar3 < 0x1c == 0x1c < uVar3) {
            *(undefined4 *)(lVar11 + 8 + param_5 * 4) = uVar23;
            goto LAB_14594576a;
          }
LAB_1459456ee:
          bVar18 = lVar9 == 0;
          lVar9 = lVar9 + -1;
          if (bVar18) goto LAB_14594573e;
          lVar11 = *(long *)(lVar11 + 0x50 + param_5 * 8);
        } while( true );
      }
LAB_14594573c:
      lVar11 = 0;
LAB_14594573e:
      auStack_98._8_8_ = 0;
      local_80 = 0x1c;
      local_a0 = plVar1;
      auStack_98._0_8_ = lVar11;
      uStack_88 = param_5;
      func_0x0001458e1710();
LAB_14594576a:
      local_b8 = *(undefined8 *)(param_4 + 0x460);
      local_c8 = (undefined8 *)((ulong)local_c8._4_4_ << 0x20);
      func_0x0001458b5100();
      lVar11 = *(long *)(param_4 + 0x5e0);
      if (lVar11 == *(long *)(param_4 + 0x5d0)) {
        func_0x000145bcb530();
      }
      lVar9 = *(long *)(param_4 + 0x5d8);
      puVar5 = (undefined8 *)(lVar9 + 0x10 + lVar11 * 0x20);
      *puVar5 = auStack_98._8_8_;
      puVar5[1] = uStack_88;
      plVar1 = (long *)(lVar9 + lVar11 * 0x20);
      *plVar1 = (long)local_a0;
      plVar1[1] = auStack_98._0_8_;
      *(long *)(param_4 + 0x5e0) = lVar11 + 1;
      goto LAB_14594551a;
    }
  }
  uVar10 = *(ulong *)(param_4 + 0x380);
  if (uVar10 != 0) {
    puVar5 = *(undefined8 **)(param_4 + 0x378);
    uVar14 = 0;
    puVar16 = puVar5;
LAB_145945260:
    if (*(int *)((long)puVar16 + 0xc) != iVar12) goto code_r0x00014594526a;
    uVar17 = uVar14 + 1;
    uVar15 = uVar14;
    if (uVar17 < uVar10) {
      if (((int)uVar10 + (int)uVar14 & 1U) == 0) {
        if (*(int *)((long)puVar16 + 0x24) != iVar12) {
          puVar16[2] = puVar16[5];
          *puVar16 = puVar16[3];
          puVar16[1] = puVar16[4];
          uVar15 = uVar14 + 1;
        }
        uVar17 = uVar14 + 2;
      }
      if (uVar10 - 2 != uVar14) {
        puVar16 = puVar5 + uVar17 * 3;
        lVar11 = uVar10 - uVar17;
        do {
          if (*(int *)((long)puVar16 + 0xc) == iVar12) {
            iVar4 = *(int *)((long)puVar16 + 0x24);
          }
          else {
            puVar5[uVar15 * 3 + 2] = puVar16[2];
            uVar13 = puVar16[1];
            puVar5[uVar15 * 3] = *puVar16;
            (puVar5 + uVar15 * 3)[1] = uVar13;
            uVar15 = uVar15 + 1;
            iVar4 = *(int *)((long)puVar16 + 0x24);
          }
          if (iVar4 != iVar12) {
            puVar5[uVar15 * 3 + 2] = puVar16[5];
            uVar13 = puVar16[4];
            puVar5[uVar15 * 3] = puVar16[3];
            (puVar5 + uVar15 * 3)[1] = uVar13;
            uVar15 = uVar15 + 1;
          }
          puVar16 = puVar16 + 6;
          lVar11 = lVar11 + -2;
        } while (lVar11 != 0);
      }
    }
    uVar10 = uVar15;
    *(ulong *)(param_4 + 0x380) = uVar10;
    goto LAB_145945435;
  }
  uVar10 = 0;
LAB_145945435:
  fVar21 = fVar21 + *(float *)((ulong)(param_3 == 3) * 4 + 0x146e786d0);
  if (uVar10 == *(ulong *)(param_4 + 0x370)) {
    func_0x000145bfaf60();
  }
  lVar11 = *(long *)(param_4 + 0x378);
  *(undefined4 *)(lVar11 + uVar10 * 0x18) = 0;
  *(int *)(lVar11 + 0xc + uVar10 * 0x18) = iVar12;
  *(float *)(lVar11 + 0x10 + uVar10 * 0x18) = fVar21;
  *(undefined4 *)(lVar11 + 0x14 + uVar10 * 0x18) = 0;
  *(ulong *)(param_4 + 0x380) = uVar10 + 1;
  local_b8 = *(undefined8 *)(param_4 + 0x460);
  local_c8 = (undefined8 *)((ulong)local_c8._4_4_ << 0x20);
  func_0x0001458b5100();
  lVar11 = *(long *)(param_4 + 0x5e0);
  if (lVar11 == *(long *)(param_4 + 0x5d0)) {
    func_0x000145bcb530();
  }
  lVar9 = *(long *)(param_4 + 0x5d8);
  puVar2 = (undefined4 *)(lVar9 + 0x10 + lVar11 * 0x20);
  *puVar2 = auStack_98._8_4_;
  puVar2[1] = auStack_98._12_4_;
  puVar2[2] = (undefined4)uStack_88;
  puVar2[3] = uStack_88._4_4_;
  plVar1 = (long *)(lVar9 + lVar11 * 0x20);
  *plVar1 = (long)local_a0;
  plVar1[1] = auStack_98._0_8_;
  *(long *)(param_4 + 0x5e0) = lVar11 + 1;
  func_0x0001458f96f0();
  func_0x0001458f0ed0();
LAB_14594551a:
  func_0x000140002200();
  puVar8 = (undefined1 *)func_0x0001400021c0();
  if (puVar8 == (undefined1 *)0x0) {
    func_0x000145d6944b();
                    /* WARNING: Does not return */
    pcVar7 = (code *)invalidInstructionException();
    (*pcVar7)();
  }
  *puVar8 = 0x7b;
  local_a0 = (long *)0x1;
  auStack_98._8_8_ = 1;
  uStack_88 = CONCAT71(uStack_88._1_7_,1);
  auStack_98._0_8_ = puVar8;
  func_0x0001458d97b0();
  local_c8 = &local_e8;
  local_c0 = 0x1400020c0;
  func_0x000145b9c4d0();
  local_b0 = (long)local_a0;
  local_d0 = (undefined1 *)auStack_98._0_8_;
  func_0x0001458d97b0();
  lVar11 = auStack_98._8_8_;
  if (local_a0 == (long *)auStack_98._8_8_) {
    func_0x000145bcb2d0();
  }
  local_a8 = (long)local_a0;
  local_d8 = (undefined1 *)auStack_98._0_8_;
  *(undefined1 *)(auStack_98._0_8_ + lVar11) = 0x7d;
  lVar9 = *(long *)(param_4 + 0x5f8);
  if (lVar9 == *(long *)(param_4 + 0x5e8)) {
    func_0x000145bcb3e0();
  }
  lVar6 = *(long *)(param_4 + 0x5f0);
  *(long *)(lVar6 + lVar9 * 0x18) = local_a8;
  *(undefined1 **)(lVar6 + 8 + lVar9 * 0x18) = local_d8;
  *(long *)(lVar6 + 0x10 + lVar9 * 0x18) = lVar11 + 1;
  *(long *)(param_4 + 0x5f8) = lVar9 + 1;
  if (local_b0 != 0) {
    func_0x0001400021d0();
  }
  return;
code_r0x00014594526a:
  uVar14 = uVar14 + 1;
  puVar16 = puVar16 + 3;
  if (uVar10 == uVar14) goto LAB_145945435;
  goto LAB_145945260;
}
