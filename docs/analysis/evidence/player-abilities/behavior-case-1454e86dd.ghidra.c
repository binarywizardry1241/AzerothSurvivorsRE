
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 entry(long param_1,long param_2)

{
  long *plVar1;
  long *plVar2;
  undefined1 uVar3;
  undefined8 uVar4;
  undefined8 uVar5;
  ulong uVar6;
  undefined8 uVar7;
  int iVar8;
  long lVar9;
  long lVar10;
  long *plVar11;
  long unaff_RBX;
  long unaff_RBP;
  undefined4 uVar12;
  long lVar13;
  long lVar14;
  undefined8 *puVar15;
  ulong uVar16;
  float *pfVar17;
  long lVar18;
  undefined8 *unaff_R14;
  int iVar19;
  uint uVar20;
  float fVar21;
  undefined4 uVar22;
  undefined4 extraout_XMM0_Da;
  undefined8 uVar23;
  float fVar24;
  float fVar25;
  float fVar26;
  float fVar27;
  float fVar28;
  float fVar29;
  undefined8 in_XMM6_Qa;
  uint uVar30;
  undefined4 uVar31;
  long lVar32;
  long lVar33;
  float in_XMM10_Da;
  undefined4 uVar34;
  
  uVar30 = (uint)((ulong)in_XMM6_Qa >> 0x20);
  fVar29 = (float)in_XMM6_Qa *
           *(float *)(unaff_RBX + 0x1c) * *(float *)(unaff_RBX + 0x44) * *(float *)(param_2 + 0x50);
  if (_DAT_145bfc414 < fVar29) {
    fVar21 = _DAT_1458f8de0;
    uVar23 = func_0x000145756f57((fVar29 + _DAT_14698ebd0) / _DAT_1458f8de0);
    uVar30 = (uint)((ulong)uVar23 >> 0x20);
    fVar29 = (float)uVar23 * fVar21 + _DAT_145bfc414;
  }
  if (*(float *)(param_2 + 0x4c) <= 0.0) {
    *(undefined4 *)(unaff_RBP + 0xc0) = *(undefined4 *)(unaff_R14 + 1);
    *(undefined8 *)(unaff_RBP + 0xb8) = *unaff_R14;
    uVar22 = func_0x0001454ee0d0();
    if (*(long *)(unaff_RBP + 0xf0) != 0) {
      if (*(long *)(unaff_RBP + 0xe0) != 0) {
        uVar22 = func_0x0001400021d0();
      }
      uVar23 = *(undefined8 *)(unaff_RBP + 8);
LAB_1454eacef:
      lVar18 = *(long *)(param_1 + 0x878);
      uVar31 = (undefined4)((ulong)uVar23 >> 0x20);
      uVar6 = func_0x0001454627f0(uVar22,(int)uVar23,CONCAT44(uVar31,uVar31));
      uVar22 = extraout_XMM0_Da;
      if ((uVar6 & 1) == 0) {
        if ((*(long *)(lVar18 + 0x68) == -1) ||
           (func_0x000145467bf0(), *(int *)(unaff_RBP + 0xe0) != 1)) {
          uVar22 = *(undefined4 *)(lVar18 + 0x90);
        }
        else {
          uVar22 = *(undefined4 *)(unaff_RBP + 0xec);
        }
      }
      *(undefined8 *)(unaff_RBP + 0xbc) = uVar23;
      *(undefined4 *)(unaff_RBP + 0xc4) = uVar22;
      *(undefined4 *)(unaff_RBP + 0xb8) = 1;
      *(undefined4 *)(unaff_RBP + 0x50) = 0;
      func_0x00014544b1a0();
      lVar18 = *(long *)(param_1 + 0x548);
      if (lVar18 == *(long *)(param_1 + 0x538)) {
        func_0x0001457580b0();
      }
      lVar9 = *(long *)(param_1 + 0x540);
      uVar7 = *(undefined8 *)(unaff_RBP + 0xe0);
      uVar4 = *(undefined8 *)(unaff_RBP + 0xe8);
      uVar5 = *(undefined8 *)(unaff_RBP + 0xf8);
      puVar15 = (undefined8 *)(lVar9 + 0x10 + lVar18 * 0x20);
      *puVar15 = *(undefined8 *)(unaff_RBP + 0xf0);
      puVar15[1] = uVar5;
      puVar15 = (undefined8 *)(lVar9 + lVar18 * 0x20);
      *puVar15 = uVar7;
      puVar15[1] = uVar4;
      *(long *)(param_1 + 0x548) = lVar18 + 1;
      lVar18 = *(long *)(unaff_RBP + 0x88);
      fVar21 = *(float *)(lVar18 + 0x58);
      fVar24 = (float)(*(int *)(lVar18 + 0x5c) + (uint)(*(int *)(lVar18 + 0x5c) == 0));
      fVar26 = fVar21;
      if (fVar21 <= _DAT_14594f310) {
        fVar26 = _DAT_14594f310;
      }
      fVar25 = _DAT_1458f8d40 * fVar21 * *(float *)(unaff_RBX + 0x20) * *(float *)(unaff_RBX + 0x48)
      ;
      fVar21 = (float)func_0x000145756e1f((fVar25 / fVar26) * fVar24);
      iVar8 = 0;
      if (0.0 <= fVar21) {
        iVar8 = (int)(long)fVar21;
      }
      iVar19 = -1;
      if (fVar21 <= _DAT_1458eb51c) {
        iVar19 = iVar8;
      }
      uVar20 = iVar19 + (uint)(iVar19 == 0);
      *(undefined8 *)(unaff_RBP + 0xe0) = uVar23;
      *(undefined4 *)(unaff_RBP + 0xe8) = uVar22;
      uVar7 = func_0x0001454eeaa0();
      iVar8 = *(int *)(lVar18 + 0x68);
      fVar26 = (float)uVar20;
      fVar21 = *(float *)(param_1 + 0x8e4);
      uVar31 = *(undefined4 *)(lVar18 + 0x6c);
      uVar30 = iVar8 - 1;
      if (9 < uVar30) {
        uVar34 = *(undefined4 *)(lVar18 + 0x70);
        in_XMM10_Da = in_XMM10_Da / fVar24;
        uVar12 = *(undefined4 *)(lVar18 + 0x40);
        fVar24 = _DAT_1458ed010 + fVar21;
        fVar26 = fVar25 / fVar26;
        fVar21 = fVar25 + fVar21 + _DAT_14590ae44;
        uVar3 = *(undefined1 *)(lVar18 + 0x74);
        lVar18 = *(long *)(param_1 + 0x4e8);
        if (lVar18 == *(long *)(param_1 + 0x4d8)) {
          func_0x00014575b510();
        }
        lVar9 = *(long *)(param_1 + 0x4e0);
        lVar10 = lVar18 * 0x58;
        *(undefined8 *)(lVar9 + lVar10) = 0;
        *(undefined8 *)(lVar9 + 0x18 + lVar10) = uVar7;
        *(int *)(lVar9 + 0x20 + lVar10) = iVar8;
        *(undefined4 *)(lVar9 + 0x24 + lVar10) = uVar31;
        *(undefined4 *)(lVar9 + 0x28 + lVar10) = uVar34;
        *(undefined8 *)(lVar9 + 0x2c + lVar10) = uVar23;
        *(undefined4 *)(lVar9 + 0x34 + lVar10) = uVar22;
        *(float *)(lVar9 + 0x38 + lVar10) = fVar29;
        *(undefined4 *)(lVar9 + 0x3c + lVar10) = uVar12;
        *(float *)(lVar9 + 0x40 + lVar10) = fVar24;
        *(float *)(lVar9 + 0x44 + lVar10) = fVar26;
        *(uint *)(lVar9 + 0x48 + lVar10) = uVar20;
        *(float *)(lVar9 + 0x4c + lVar10) = in_XMM10_Da;
        *(float *)(lVar9 + 0x50 + lVar10) = fVar21;
        *(undefined1 *)(lVar9 + 0x54 + lVar10) = uVar3;
        *(long *)(param_1 + 0x4e8) = lVar18 + 1;
        return CONCAT71((int7)((ulong)lVar9 >> 8),1);
      }
                    /* WARNING: Could not emulate address calculation at 0x0001454eaed7 */
                    /* WARNING: Treating indirect jump as call */
      uVar23 = (*(code *)((long)*(int *)((ulong)uVar30 * 4 + 0x1469acfec) + 0x1469acfec))
                         (fVar21,fVar26,*(undefined4 *)(unaff_RBX + 0x50));
      return uVar23;
    }
    lVar18 = *(long *)(unaff_RBP + 0xe0);
  }
  else {
    *(undefined4 *)(unaff_RBP + 0x44) = *(undefined4 *)(param_1 + 0x8e4);
    *(undefined4 *)(unaff_RBP + 0xe8) = *(undefined4 *)(unaff_R14 + 1);
    *(undefined8 *)(unaff_RBP + 0xe0) = *unaff_R14;
    func_0x0001454ee0d0();
    lVar18 = *(long *)(param_1 + 0x4c8);
    lVar9 = *(long *)(param_1 + 0x4d0);
    *(long *)(unaff_RBP + 0xe0) = lVar18;
    *(long *)(unaff_RBP + 0xe8) = lVar9 * 0x160 + lVar18;
    *(long *)(unaff_RBP + 0xf0) = unaff_RBP + 0x44;
    func_0x0001455267d0();
    fVar21 = fVar29 * fVar29;
    *(float *)(unaff_RBP + 0x40) = fVar21;
    plVar11 = *(long **)(unaff_RBP + 0x20);
    if (*(long *)(unaff_RBP + 0x28) != 0) {
      plVar2 = plVar11 + *(long *)(unaff_RBP + 0x28);
      lVar18 = *(long *)(param_1 + 0x4c8);
      lVar9 = 0x18;
      do {
        lVar9 = lVar9 + -1;
        lVar13 = *plVar11;
        plVar11 = plVar11 + 1;
        lVar14 = 0;
        lVar10 = lVar18;
        while (*(long *)(param_1 + 0x4d0) * 0x160 - lVar14 != 0) {
          lVar14 = lVar14 + 0x160;
          plVar1 = (long *)(lVar10 + 0x88);
          lVar10 = lVar10 + 0x160;
          if (*plVar1 == lVar13) {
            fVar26 = *(float *)(lVar18 + -0x38 + lVar14);
            if (fVar26 <= 0.0) {
              uVar23 = *(undefined8 *)(lVar18 + -0x48 + lVar14);
              fVar24 = (float)uVar23;
              fVar25 = (float)((ulong)uVar23 >> 0x20);
              fVar26 = *(float *)(lVar18 + -0x40 + lVar14);
            }
            else {
              fVar26 = (*(float *)(param_1 + 0x8e4) - *(float *)(lVar18 + -0x3c + lVar14)) / fVar26;
              fVar24 = 0.0;
              if (0.0 <= fVar26) {
                fVar24 = fVar26;
              }
              fVar27 = _DAT_1458eb480;
              if (fVar24 <= _DAT_1458eb480) {
                fVar27 = fVar24;
              }
              uVar23 = *(undefined8 *)(lVar18 + -0x54 + lVar14);
              uVar7 = *(undefined8 *)(lVar18 + -0x48 + lVar14);
              fVar24 = (float)uVar23;
              fVar25 = (float)((ulong)uVar23 >> 0x20);
              fVar24 = fVar27 * ((float)uVar7 - fVar24) + fVar24;
              fVar25 = fVar27 * ((float)((ulong)uVar7 >> 0x20) - fVar25) + fVar25;
              fVar26 = *(float *)(lVar18 + -0x4c + lVar14);
              fVar26 = (*(float *)(lVar18 + -0x40 + lVar14) - fVar26) * fVar27 + fVar26;
            }
            uVar6 = *(ulong *)(unaff_RBP + 0xa0);
            if (uVar6 == 0) {
              lVar18 = 0;
            }
            else {
              if (uVar6 < 5) {
                lVar10 = 0;
                lVar18 = 0;
              }
              else {
                uVar16 = 4;
                if ((uVar6 & 3) != 0) {
                  uVar16 = (ulong)((uint)uVar6 & 3);
                }
                lVar10 = uVar6 - uVar16;
                pfVar17 = (float *)(*(long *)(unaff_RBP + 0x98) + 0x28);
                lVar13 = 0;
                lVar14 = 0;
                lVar32 = 0;
                lVar33 = 0;
                lVar18 = lVar10;
                do {
                  lVar32 = lVar32 + CONCAT44((uint)fVar21 & uRam00000001458fcae4,
                                             -(uint)((pfVar17[-9] - fVar25) * (pfVar17[-9] - fVar25)
                                                     + (pfVar17[-10] - fVar24) *
                                                       (pfVar17[-10] - fVar24) <= fVar21) &
                                             _DAT_1458fcae0);
                  lVar33 = lVar33 + CONCAT44(uVar30 & uRam00000001458fcaec,
                                             -(uint)((pfVar17[-6] - fVar25) * (pfVar17[-6] - fVar25)
                                                     + (pfVar17[-7] - fVar24) *
                                                       (pfVar17[-7] - fVar24) <= fVar21) &
                                             uRam00000001458fcae8);
                  lVar13 = lVar13 + CONCAT44((uint)fVar21 & uRam00000001458fcae4,
                                             -(uint)((pfVar17[-3] - fVar25) * (pfVar17[-3] - fVar25)
                                                     + (pfVar17[-4] - fVar24) *
                                                       (pfVar17[-4] - fVar24) <= fVar21) &
                                             _DAT_1458fcae0);
                  lVar14 = lVar14 + CONCAT44(uVar30 & uRam00000001458fcaec,
                                             -(uint)((*pfVar17 - fVar25) * (*pfVar17 - fVar25) +
                                                     (pfVar17[-1] - fVar24) * (pfVar17[-1] - fVar24)
                                                    <= fVar21) & uRam00000001458fcae8);
                  pfVar17 = pfVar17 + 0xc;
                  lVar18 = lVar18 + -4;
                } while (lVar18 != 0);
                lVar18 = lVar14 + lVar33 + lVar13 + lVar32;
              }
              lVar13 = uVar6 - lVar10;
              puVar15 = (undefined8 *)(*(long *)(unaff_RBP + 0x98) + lVar10 * 0xc);
              do {
                fVar27 = (float)*puVar15 - fVar24;
                fVar28 = (float)((ulong)*puVar15 >> 0x20) - fVar25;
                lVar18 = (lVar18 + 1) - (ulong)(fVar21 < fVar28 * fVar28 + fVar27 * fVar27);
                puVar15 = (undefined8 *)((long)puVar15 + 0xc);
                lVar13 = lVar13 + -1;
              } while (lVar13 != 0);
            }
            *(long *)(unaff_RBP + 0x50) = lVar18;
            *(ulong *)(unaff_RBP + 0x58) = CONCAT44(fVar25,fVar24);
            *(float *)(unaff_RBP + 0x60) = fVar26;
            *(long **)(unaff_RBP + 0xe0) = plVar11;
            *(long **)(unaff_RBP + 0xe8) = plVar2;
            *(long *)(unaff_RBP + 0xf0) = lVar9;
            *(long *)(unaff_RBP + 0xf8) = param_1;
            *(long *)(unaff_RBP + 0x100) = unaff_RBP + 0x90;
            *(long *)(unaff_RBP + 0x108) = unaff_RBP + 0x40;
            uVar22 = func_0x000145512e00();
            uVar23 = *(undefined8 *)(unaff_RBP + 200);
            if (*(long *)(unaff_RBP + 0x90) != 0) {
              uVar22 = func_0x0001400021d0();
            }
            if (*(long *)(unaff_RBP + 0x18) != 0) {
              uVar22 = func_0x0001400021d0();
            }
            goto LAB_1454eacef;
          }
        }
      } while ((lVar9 != 0) && (plVar11 != plVar2));
    }
    if (*(long *)(unaff_RBP + 0x90) != 0) {
      func_0x0001400021d0();
    }
    lVar18 = *(long *)(unaff_RBP + 0x18);
  }
  if (lVar18 != 0) {
    func_0x0001400021d0();
  }
  return 0;
}

