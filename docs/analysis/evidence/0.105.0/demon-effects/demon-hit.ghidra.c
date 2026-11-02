
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,ulong param_3,long param_4,long *param_5,
          long param_6)

{
  long lVar1;
  char *pcVar2;
  long *plVar3;
  undefined8 *puVar4;
  undefined1 uVar5;
  char cVar6;
  ushort uVar7;
  long lVar8;
  undefined8 uVar9;
  code *pcVar10;
  undefined4 uVar11;
  undefined8 uVar12;
  undefined8 uVar13;
  undefined8 uVar14;
  undefined8 uVar15;
  undefined8 uVar16;
  undefined8 uVar17;
  undefined1 auVar18 [16];
  long *plVar19;
  ulong uVar20;
  long lVar21;
  long lVar22;
  ulong *puVar23;
  ulong extraout_RDX;
  ulong uVar24;
  long lVar25;
  long lVar26;
  ulong extraout_RDX_00;
  undefined4 uVar27;
  undefined4 uVar28;
  undefined1 (*pauVar29) [16];
  long lVar30;
  ulong uVar31;
  ulong uVar32;
  float *pfVar33;
  long lVar34;
  undefined4 uVar35;
  bool bVar36;
  float fVar37;
  float fVar38;
  float fVar39;
  float fVar40;
  float fVar41;
  float fVar42;
  float fVar43;
  float fVar44;
  float fVar45;
  float fVar46;
  undefined1 auVar47 [16];
  undefined8 *in_stack_00000028;
  ulong *local_118;
  long lStack_110;
  undefined8 local_108;
  undefined8 uStack_100;
  undefined4 local_f8;
  undefined4 uStack_f4;
  undefined4 uStack_f0;
  undefined4 uStack_ec;

  auVar18._8_8_ = local_108;
  auVar18._0_8_ = lStack_110;
  if (*(ulong *)(param_4 + 0xd8) <= param_3) {
    func_0x000145d697e3();
                    /* WARNING: Does not return */
    pcVar10 = (code *)invalidInstructionException();
    (*pcVar10)();
  }
  lVar8 = *(long *)(*(long *)(param_4 + 0xd0) + 0x18 + param_3 * 0x78);
  lVar22 = 0;
  do {
    if (*(long *)(param_4 + 0x7b0) << 6 == lVar22) {
      bVar36 = false;
      goto joined_r0x00014594c602;
    }
    lVar1 = lVar22 + 0x40;
    pcVar2 = (char *)(*(long *)(param_4 + 0x7a8) + lVar22);
    lVar22 = lVar1;
  } while (*pcVar2 != '\x1e');
  bVar36 = 2 < *(byte *)(*(long *)(param_4 + 0x7a8) + -0x3f + lVar1);
joined_r0x00014594c602:
  if (param_6 == 0) {
    return;
  }
  plVar19 = param_5 + param_6;
  fVar41 = 0.0;
  fVar42 = _DAT_145d6d874;
  fVar43 = _DAT_145d73d44;
  fVar44 = _DAT_145d73e10;
  fVar45 = _DAT_145d70c70;
  fVar46 = _DAT_145db8620;
LAB_14594c66a:
  local_108 = auVar18._8_8_;
  lStack_110 = auVar18._0_8_;
  lVar22 = *param_5;
  fVar37 = (float)func_0x000145950e90();
  func_0x0001458ab9e0();
  lVar1 = *(long *)(param_4 + 0x5e0);
  if (lVar1 == *(long *)(param_4 + 0x5d0)) {
    func_0x000145bcb530();
  }
  param_5 = param_5 + 1;
  lVar25 = *(long *)(param_4 + 0x5d8);
  puVar4 = (undefined8 *)(lVar25 + 0x10 + lVar1 * 0x20);
  *puVar4 = local_108;
  puVar4[1] = uStack_100;
  plVar3 = (long *)(lVar25 + lVar1 * 0x20);
  *plVar3 = (long)local_118;
  plVar3[1] = lStack_110;
  *(long *)(param_4 + 0x5e0) = lVar1 + 1;
  uVar5 = *(undefined1 *)(param_4 + 0x195);
  *(undefined1 *)(param_4 + 0x195) = 2;
  uVar9 = *(undefined8 *)(param_4 + 0x170);
  *(long *)(param_4 + 0x170) = lVar8;
  pauVar29 = (undefined1 (*) [16])(param_4 + 0x140);
  local_118 = *(ulong **)*pauVar29;
  auVar47 = *pauVar29;
  uVar12 = *(undefined8 *)(param_4 + 0x150);
  auVar18 = *(undefined1 (*) [16])(param_4 + 0x148);
  uVar20 = *(ulong *)(param_4 + 0x158);
  uVar13 = *(undefined8 *)(param_4 + 0x160);
  uVar14 = *(undefined8 *)(param_4 + 0x168);
  uVar15 = in_stack_00000028[1];
  uVar27 = *(undefined4 *)(in_stack_00000028 + 2);
  uVar35 = *(undefined4 *)((long)in_stack_00000028 + 0x14);
  uVar28 = *(undefined4 *)(in_stack_00000028 + 3);
  uVar11 = *(undefined4 *)((long)in_stack_00000028 + 0x1c);
  uVar16 = in_stack_00000028[4];
  uVar17 = in_stack_00000028[5];
  *(undefined8 *)*pauVar29 = *in_stack_00000028;
  *(undefined8 *)(param_4 + 0x148) = uVar15;
  *(undefined4 *)(param_4 + 0x150) = uVar27;
  *(undefined4 *)(param_4 + 0x154) = uVar35;
  *(undefined4 *)(param_4 + 0x158) = uVar28;
  *(undefined4 *)(param_4 + 0x15c) = uVar11;
  *(undefined8 *)(param_4 + 0x160) = uVar16;
  *(undefined8 *)(param_4 + 0x168) = uVar17;
  func_0x000145933ec0(pauVar29,param_5,lVar22,param_4);
  local_108._0_4_ = (undefined4)uVar12;
  local_108._4_4_ = (undefined4)((ulong)uVar12 >> 0x20);
  uStack_100._0_4_ = (undefined4)uVar20;
  uStack_100._4_4_ = (undefined4)(uVar20 >> 0x20);
  local_f8 = (undefined4)uVar13;
  uStack_f4 = (undefined4)((ulong)uVar13 >> 0x20);
  uStack_f0 = (undefined4)uVar14;
  uStack_ec = (undefined4)((ulong)uVar14 >> 0x20);
  *(undefined4 *)pauVar29[2] = local_f8;
  *(undefined4 *)(pauVar29[2] + 4) = uStack_f4;
  *(undefined4 *)(pauVar29[2] + 8) = uStack_f0;
  *(undefined4 *)(pauVar29[2] + 0xc) = uStack_ec;
  *(undefined4 *)pauVar29[1] = (undefined4)local_108;
  *(undefined4 *)(pauVar29[1] + 4) = local_108._4_4_;
  *(undefined4 *)(pauVar29[1] + 8) = (undefined4)uStack_100;
  *(undefined4 *)(pauVar29[1] + 0xc) = uStack_100._4_4_;
  *pauVar29 = auVar47;
  *(undefined8 *)(param_4 + 0x170) = uVar9;
  *(undefined1 *)(param_4 + 0x195) = uVar5;
  lVar1 = *(long *)(param_4 + 0x560);
  lVar21 = *(long *)(param_4 + 0x568) * 0x160;
  lVar25 = lVar21;
  lVar26 = lVar1;
  do {
    lVar34 = lVar26;
    lVar30 = lVar25;
    if (lVar30 == 0) break;
    lVar25 = lVar30 + -0x160;
    lVar26 = lVar34 + 0x160;
  } while ((*(long *)(lVar34 + 0x88) != lVar22) || ((*(byte *)(lVar34 + 0x68) & 1) != 0));
  uStack_100 = uVar20;
  if (*(char *)(lVar8 + 0x39) != '\x02') {
    if (*(char *)(lVar8 + 0x39) != '\x03') goto LAB_14594c660;
    if (lVar30 == 0) {
      auVar47 = func_0x0001458da590();
      uVar20 = *(ulong *)(lVar8 + 0x10);
      fVar39 = *(float *)(param_4 + 0x4e0);
      fVar38 = fVar39 + fVar46;
      fVar40 = fVar38;
      if (*(float *)(param_4 + 0x478) <= fVar38) {
        fVar40 = *(float *)(param_4 + 0x478);
      }
      fVar40 = (float)(-(uint)NAN(fVar40) & (uint)fVar38 | ~-(uint)NAN(fVar40) & (uint)fVar40);
      *(float *)(param_4 + 0x4e0) = fVar40;
      fVar39 = fVar40 - fVar39;
      if (fVar41 < fVar39) {
        if (auVar47._0_8_ == 0) {
          auVar47._8_8_ = 10;
          auVar47._0_8_ = 0x146e7a8e8;
        }
        local_118 = (ulong *)0xffffffffffffffff;
        func_0x00014595f3c0(fVar40,fVar39,SUB84((double)fVar39,0));
        uStack_100 = uVar20;
        auVar18 = auVar47;
      }
      fVar39 = (float)func_0x000145bc981d();
      uVar27 = 0;
      uVar35 = (undefined4)(long)fVar39;
      if (fVar39 < fVar41) {
        uVar35 = 0;
      }
      uVar28 = 0xffffffff;
      if (fVar42 < fVar39) {
        uVar35 = 0xffffffff;
      }
      fVar39 = (float)func_0x000145bc981d();
      uVar11 = (int)(long)fVar39;
      if (fVar39 < fVar41) {
        uVar11 = uVar27;
      }
      if (fVar42 < fVar39) {
        uVar11 = uVar28;
      }
      uVar20 = *(ulong *)(param_4 + 0x990);
      if (uVar20 != 0) {
        lVar22 = *(long *)(param_4 + 0x998);
        do {
          uVar31 = (ulong)((uint)*(ushort *)(uVar20 + 0x36) * 2);
          uVar24 = 0xffffffffffffffff;
          do {
            uVar32 = (ulong)*(ushort *)(uVar20 + 0x36);
            if (uVar31 == 0) goto joined_r0x00014594c9b7;
            uVar7 = *(ushort *)(uVar20 + 0x3a + uVar24 * 2);
            uVar24 = uVar24 + 1;
            uVar31 = uVar31 - 2;
          } while ((char)((uVar7 < 0x16) - (0x16 < uVar7)) == '\x01');
          uVar32 = uVar24;
          if (uVar7 < 0x16 == 0x16 < uVar7) {
            *(undefined4 *)(uVar20 + 8 + uVar24 * 4) = uVar35;
            puVar23 = (ulong *)(param_4 + 0x990);
            uVar20 = *puVar23;
            goto joined_r0x00014594ca87;
          }
joined_r0x00014594c9b7:
          if (lVar22 == 0) goto LAB_14594cbf6;
          lVar22 = lVar22 + -1;
          uVar20 = *(ulong *)(uVar20 + 0x50 + uVar32 * 8);
        } while( true );
      }
      uVar20 = 0;
      uVar32 = extraout_RDX;
LAB_14594cbf6:
      local_118 = (ulong *)(param_4 + 0x990);
      auVar18._8_8_ = 0;
      auVar18._0_8_ = uVar20;
      puVar23 = local_118;
      func_0x0001458e1710();
      uVar20 = *puVar23;
      uVar24 = extraout_RDX_00;
      uStack_100 = uVar32;
joined_r0x00014594ca87:
      if (uVar20 != 0) {
        lVar22 = *(long *)(param_4 + 0x998);
        do {
          uVar32 = (ulong)((uint)*(ushort *)(uVar20 + 0x36) * 2);
          uVar31 = 0xffffffffffffffff;
          do {
            uVar24 = (ulong)*(ushort *)(uVar20 + 0x36);
            if (uVar32 == 0) goto joined_r0x00014594caf7;
            uVar7 = *(ushort *)(uVar20 + 0x3a + uVar31 * 2);
            uVar31 = uVar31 + 1;
            uVar32 = uVar32 - 2;
          } while ((char)((uVar7 < 0x1c) - (0x1c < uVar7)) == '\x01');
          uVar24 = uVar31;
          if (uVar7 < 0x1c == 0x1c < uVar7) {
            *(undefined4 *)(uVar20 + 8 + uVar31 * 4) = uVar11;
            goto LAB_14594cb09;
          }
joined_r0x00014594caf7:
          if (lVar22 == 0) goto LAB_14594cc81;
          lVar22 = lVar22 + -1;
          uVar20 = *(ulong *)(uVar20 + 0x50 + uVar24 * 8);
        } while( true );
      }
      uVar20 = 0;
      goto LAB_14594cc35;
    }
LAB_14594cb09:
    uVar20 = *(ulong *)(param_4 + 0x7b0);
    uVar24 = uStack_100;
    goto joined_r0x00014594cb13;
  }
  if (((bool)(bVar36 & lVar30 != 0)) && (*(long *)(param_4 + 0x568) != 0)) {
    lVar25 = 0;
    do {
      if (((*(long *)(lVar1 + 0x88 + lVar25) == lVar22) && (*(int *)(lVar1 + 0x68 + lVar25) == 0))
         && (fVar37 = *(float *)(lVar1 + 0xf4 + lVar25) * fVar43,
            pfVar33 = (float *)(lVar1 + 0xf0 + lVar25), *pfVar33 <= fVar37 && fVar37 != *pfVar33)) {
        lVar26 = 0;
        lVar25 = lVar1;
        goto LAB_14594ca50;
      }
      lVar25 = lVar25 + 0x160;
    } while (lVar21 - lVar25 != 0);
  }
  goto LAB_14594c660;
LAB_14594cc81:
  puVar23 = (ulong *)(param_4 + 0x990);
LAB_14594cc35:
  auVar18._8_8_ = 0;
  auVar18._0_8_ = uVar20;
  func_0x0001458e1710();
  uVar20 = *(ulong *)(param_4 + 0x7b0);
  local_118 = puVar23;
joined_r0x00014594cb13:
  uStack_100 = uVar24;
  if (uVar20 == 0) goto LAB_14594c660;
  lVar22 = *(long *)(param_4 + 0x7a8);
  fVar39 = fVar45;
  if (uVar20 == 1) {
    uVar24 = 0;
LAB_14594cb89:
    if (*(char *)(lVar22 + uVar24 * 0x40) == '\x1f') {
      fVar39 = fVar39 + *(float *)(lVar22 + 4 + uVar24 * 0x40);
    }
  }
  else {
    pfVar33 = (float *)(lVar22 + 0x44);
    uVar24 = 0;
    do {
      if (*(char *)(pfVar33 + -0x11) == '\x1f') {
        fVar39 = fVar39 + pfVar33[-0x10];
        cVar6 = *(char *)(pfVar33 + -1);
      }
      else {
        cVar6 = *(char *)(pfVar33 + -1);
      }
      if (cVar6 == '\x1f') {
        fVar39 = fVar39 + *pfVar33;
      }
      uVar24 = uVar24 + 2;
      pfVar33 = pfVar33 + 0x20;
    } while ((uVar20 & 0xfffffffffffffffe) != uVar24);
    if ((uVar20 & 1) != 0) goto LAB_14594cb89;
  }
  if (fVar41 < fVar39) {
    fVar40 = *(float *)(param_4 + 0x478) * fVar43 - *(float *)(param_4 + 400);
    if (fVar40 <= fVar41) {
      fVar40 = fVar41;
    }
    fVar38 = fVar37 * fVar39;
    if (fVar40 <= fVar37 * fVar39) {
      fVar38 = fVar40;
    }
    if (fVar41 < fVar38) {
      *(float *)(param_4 + 400) = *(float *)(param_4 + 400) + fVar38;
      *(float *)(param_4 + 0x4e4) = fVar38 + *(float *)(param_4 + 0x4e4);
    }
  }
LAB_14594c660:
  if (param_5 == plVar19) {
    return;
  }
  goto LAB_14594c66a;
  while( true ) {
    lVar26 = lVar26 + 0x160;
    plVar3 = (long *)(lVar25 + 0x88);
    lVar25 = lVar25 + 0x160;
    if (*plVar3 == lVar22) break;
LAB_14594ca50:
    if (lVar21 - lVar26 == 0) goto LAB_14594c660;
  }
  *(float *)(lVar1 + -8 + lVar26) = *(float *)(param_4 + 0x9ec) + fVar44;
  goto LAB_14594c660;
}
