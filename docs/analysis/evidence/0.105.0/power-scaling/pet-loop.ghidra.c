
/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(void)

{
  ulong uVar1;
  int *piVar2;
  ulong *puVar3;
  float *pfVar4;
  long *plVar5;
  ulong *puVar6;
  undefined8 uVar7;
  undefined1 auVar8 [16];
  long lVar9;
  long *plVar10;
  ulong uVar11;
  long lVar12;
  long lVar13;
  ulong uVar14;
  long lVar15;
  uint uVar16;
  long lVar17;
  ulong uVar18;
  undefined8 uVar19;
  long *plVar20;
  long unaff_RBP;
  undefined1 uVar21;
  undefined8 *puVar22;
  char cVar23;
  ulong *puVar24;
  ulong uVar25;
  ulong uVar26;
  ulong uVar27;
  long unaff_R13;
  long lVar28;
  undefined8 uVar29;
  long lVar30;
  bool bVar31;
  byte bVar32;
  int iVar33;
  int iVar34;
  float extraout_XMM0_Da;
  float fVar35;
  float extraout_XMM0_Db;
  undefined8 uVar36;
  float fVar37;
  float fVar38;
  float fVar39;
  undefined1 auVar40 [16];
  undefined1 auVar41 [16];
  undefined1 auVar42 [16];
  undefined1 auVar44 [16];
  float fVar45;
  float fVar46;
  float fVar47;
  float fVar48;
  float fVar49;
  float fVar50;
  undefined8 uVar51;
  float fVar52;
  undefined8 uVar53;
  undefined8 uVar54;
  undefined1 auVar55 [16];
  undefined4 uVar56;
  undefined1 auVar57 [16];
  undefined1 auVar58 [16];
  undefined1 auVar43 [16];

  fVar48 = _DAT_145dbe640;
  uVar53 = *(undefined8 *)(unaff_R13 + 0x4c8);
  uVar54 = 0;
  fVar46 = *(float *)(unaff_R13 + 0x48c) * _DAT_145dbe640;
  *(undefined8 *)(unaff_RBP + 0x350) = *(undefined8 *)(unaff_R13 + 0xd8);
  fVar47 = fVar46;
  if (fVar46 <= fVar48) {
    fVar47 = fVar48;
  }
  *(float *)(unaff_RBP + 0x338) = _DAT_146e78464 * fVar47;
  *(long *)(unaff_RBP + 0x348) = unaff_R13 + 0x128;
  *(long *)(unaff_RBP + 0x330) = unaff_R13 + 0x558;
  *(long *)(unaff_RBP + 0x60) = unaff_R13 + 0x5d0;
  *(long *)(unaff_RBP + 0x48) = unaff_R13 + 0x588;
  *(float *)(unaff_RBP + 0x318) = fVar47 * _DAT_145d9af3c;
  *(long *)(unaff_RBP + 0x50) = unaff_R13 + 0x7e8;
  fVar47 = _DAT_146e78388 * fVar46;
  if (_DAT_146e78388 * fVar46 <= _DAT_145d9dd60) {
    fVar47 = _DAT_145d9dd60;
  }
  *(float *)(unaff_RBP + 0x328) = fVar47;
  *(long *)(unaff_RBP + 0x208) = unaff_R13 + 0x110;
  fVar46 = 0.0;
  fVar48 = 0.0;
  uVar1 = 0;
  fVar47 = _DAT_145d6d36c;
LAB_145904f97:
  do {
    while( true ) {
      do {
        uVar27 = uVar1;
        if (*(ulong *)(unaff_RBP + 0x350) <= uVar27) {
                    /* WARNING: Bad instruction - Truncating control flow here */
          halt_baddata();
        }
        if (*(ulong *)(*(long *)(unaff_RBP + 0x378) + 0xd8) <= uVar27) {
                    /* WARNING: Bad instruction - Truncating control flow here */
          halt_baddata();
        }
        uVar1 = uVar27 + 1;
        lVar12 = *(long *)(*(long *)(unaff_RBP + 0x378) + 0xd0);
        lVar30 = uVar27 * 0x78;
      } while (*(float *)(unaff_RBP + 0x200) < *(float *)(lVar12 + 100 + lVar30));
      *(float *)(lVar12 + lVar30 + 100) = *(float *)(unaff_RBP + 0x200) + _DAT_145d73d44;
      uVar25 = *(ulong *)(*(long *)(unaff_RBP + 0x378) + 0xd8);
      if (uVar25 <= uVar27) {
                    /* WARNING: Bad instruction - Truncating control flow here */
        halt_baddata();
      }
      lVar12 = *(long *)(*(long *)(unaff_RBP + 0x378) + 0xd0);
      uVar14 = lVar12 + lVar30;
      lVar9 = *(long *)(lVar12 + 0x18 + lVar30);
      fVar49 = *(float *)(unaff_RBP + 0x200);
      fVar39 = *(float *)(lVar12 + 0x5c + lVar30);
      if (fVar39 <= fVar46) {
        *(undefined8 *)(unaff_RBP + 0x30) = *(undefined8 *)(uVar14 + 0x4c);
        *(undefined4 *)(unaff_RBP + 0x38) = *(undefined4 *)(uVar14 + 0x54);
        uVar51 = *(undefined8 *)(unaff_RBP + 0x30);
      }
      else {
        fVar39 = (fVar49 - *(float *)(uVar14 + 0x58)) / fVar39;
        fVar37 = 0.0;
        if (0.0 <= fVar39) {
          fVar37 = fVar39;
        }
        fVar39 = fVar47;
        if (fVar37 <= fVar47) {
          fVar39 = fVar37;
        }
        fVar37 = (float)*(undefined8 *)(uVar14 + 0x40);
        fVar35 = (float)((ulong)*(undefined8 *)(uVar14 + 0x40) >> 0x20);
        uVar51 = CONCAT44(fVar39 * ((float)((ulong)*(undefined8 *)(uVar14 + 0x4c) >> 0x20) - fVar35)
                          + fVar35,fVar39 * ((float)*(undefined8 *)(uVar14 + 0x4c) - fVar37) +
                                   fVar37);
        fVar37 = *(float *)(uVar14 + 0x48);
        fVar35 = *(float *)(uVar14 + 0x54);
        *(undefined8 *)(unaff_RBP + 0x30) = uVar51;
        *(float *)(unaff_RBP + 0x38) = (fVar35 - fVar37) * fVar39 + fVar37;
      }
      func_0x000145bc97c3();
      fVar39 = extraout_XMM0_Da;
      fVar37 = extraout_XMM0_Db;
      uVar36 = func_0x000145bc97bd();
      fVar35 = (float)uVar53;
      auVar42._0_4_ = fVar39 * _DAT_146e78510 + fVar35;
      fVar38 = (float)((ulong)uVar53 >> 0x20);
      auVar42._4_4_ = (float)uVar36 * fRam0000000146e78514 + fVar38;
      auVar42._8_4_ = fVar37 * fRam0000000146e78518 + (float)uVar54;
      auVar42._12_4_ =
           (float)((ulong)uVar36 >> 0x20) * fRam0000000146e7851c + (float)((ulong)uVar54 >> 0x20);
      fVar52 = (float)((ulong)uVar51 >> 0x20);
      fVar39 = (float)uVar51 - fVar35;
      fVar37 = fVar52 - fVar38;
      if (SQRT(fVar37 * fVar37 + fVar39 * fVar39) <= _DAT_145d70c74) break;
      *(char *)(unaff_RBP + 0x387) = (char)*(undefined4 *)(unaff_RBP + 0x370);
      func_0x00014592ea80();
    }
    iVar33 = *(int *)(lVar9 + 0x34);
    *(long *)(unaff_RBP + 0x360) = lVar9;
    if (iVar33 == 0) {
      lVar12 = *(long *)(uVar14 + 0x28);
      lVar9 = *(long *)(*(long *)(unaff_RBP + 0x378) + 0x568);
      if (lVar9 != 0) {
        lVar28 = *(long *)(*(long *)(unaff_RBP + 0x378) + 0x560);
        lVar13 = 0;
        do {
          if ((*(long *)(lVar28 + 0x88 + lVar13) == lVar12) &&
             (*(int *)(lVar28 + 0x68 + lVar13) != 1)) {
            fVar39 = *(float *)(lVar28 + 0x128 + lVar13);
            if (fVar39 <= fVar46) {
              uVar36 = *(undefined8 *)(lVar28 + 0x118 + lVar13);
            }
            else {
              fVar39 = (fVar49 - *(float *)(lVar28 + 0x124 + lVar13)) / fVar39;
              fVar49 = 0.0;
              if (0.0 <= fVar39) {
                fVar49 = fVar39;
              }
              fVar39 = fVar47;
              if (fVar49 <= fVar47) {
                fVar39 = fVar49;
              }
              uVar36 = *(undefined8 *)(lVar28 + 0x10c + lVar13);
              uVar19 = *(undefined8 *)(lVar28 + 0x118 + lVar13);
              fVar49 = (float)uVar36;
              fVar37 = (float)((ulong)uVar36 >> 0x20);
              uVar36 = CONCAT44(fVar39 * ((float)((ulong)uVar19 >> 0x20) - fVar37) + fVar37,
                                fVar39 * ((float)uVar19 - fVar49) + fVar49);
            }
            fVar35 = (float)uVar36 - fVar35;
            fVar38 = (float)((ulong)uVar36 >> 0x20) - fVar38;
            if (SQRT(fVar38 * fVar38 + fVar35 * fVar35) < _DAT_145ed7be0) {
              *(byte *)(unaff_RBP + 0x2a0) =
                   (*(long *)(lVar28 + 0x18 + lVar13) != -1) * '\x02' |
                   *(byte *)(lVar28 + 0x15c + lVar13);
              bVar32 = 1;
              goto LAB_14590549e;
            }
            break;
          }
          lVar13 = lVar13 + 0x160;
        } while (lVar9 * 0x160 - lVar13 != 0);
      }
      bVar32 = 0;
LAB_14590549e:
      *(undefined4 *)(unaff_RBP + 0x238) = *(undefined4 *)(unaff_RBP + 0x38);
      *(undefined8 *)(unaff_RBP + 0x230) = *(undefined8 *)(unaff_RBP + 0x30);
      *(char *)(unaff_RBP + 0x387) = (char)*(undefined4 *)(unaff_RBP + 0x370);
      func_0x000145925e50();
      puVar24 = *(ulong **)(unaff_RBP + 0xa8);
      if (*(long *)(unaff_RBP + 0xb0) != 0) {
        puVar6 = puVar24 + *(long *)(unaff_RBP + 0xb0);
        lVar9 = *(long *)(unaff_RBP + 0x378);
        lVar28 = *(long *)(lVar9 + 0x560);
        do {
          uVar25 = *puVar24;
          puVar24 = puVar24 + 1;
          lVar15 = 0;
          lVar13 = lVar28;
          do {
            if (*(long *)(lVar9 + 0x568) * 0x160 - lVar15 == 0) goto LAB_145905556;
            lVar15 = lVar15 + 0x160;
            puVar3 = (ulong *)(lVar13 + 0x88);
            lVar13 = lVar13 + 0x160;
          } while (*puVar3 != uVar25);
          fVar49 = *(float *)(lVar28 + -0x38 + lVar15);
          if (fVar49 <= fVar46) {
            pfVar4 = (float *)(lVar28 + -0x48 + lVar15);
            fVar49 = *pfVar4;
            fVar39 = pfVar4[1];
          }
          else {
            fVar49 = (*(float *)(lVar9 + 0x9ec) - *(float *)(lVar28 + -0x3c + lVar15)) / fVar49;
            fVar39 = 0.0;
            if (0.0 <= fVar49) {
              fVar39 = fVar49;
            }
            fVar37 = fVar47;
            if (fVar39 <= fVar47) {
              fVar37 = fVar39;
            }
            uVar36 = *(undefined8 *)(lVar28 + -0x54 + lVar15);
            fVar49 = (float)uVar36;
            fVar39 = (float)((ulong)uVar36 >> 0x20);
            uVar36 = *(undefined8 *)(lVar28 + -0x48 + lVar15);
            fVar49 = fVar37 * ((float)uVar36 - fVar49) + fVar49;
            fVar39 = fVar37 * ((float)((ulong)uVar36 >> 0x20) - fVar39) + fVar39;
          }
          fVar49 = fVar49 - (float)uVar53;
          fVar39 = fVar39 - (float)((ulong)uVar53 >> 0x20);
          if (SQRT(fVar39 * fVar39 + fVar49 * fVar49) < _DAT_145d9de20) {
            uVar36 = 1;
            lVar9 = *(long *)(unaff_RBP + 0xa0);
            goto joined_r0x000145905835;
          }
LAB_145905556:
        } while (puVar24 != puVar6);
      }
      uVar36 = 0;
      lVar9 = *(long *)(unaff_RBP + 0xa0);
joined_r0x000145905835:
      if (lVar9 != 0) {
        func_0x0001400021d0();
      }
      auVar58._8_8_ = uVar25;
      auVar58._0_8_ = uVar36;
      uVar19 = auVar42._0_8_;
      bVar31 = true;
      if ((char)uVar36 != '\0') {
        lVar28 = *(long *)(*(long *)(unaff_RBP + 0x378) + 0x560);
        lVar13 = 0;
        lVar9 = lVar28;
        do {
          if (*(long *)(*(long *)(unaff_RBP + 0x378) + 0x568) * 0x160 - lVar13 == 0)
          goto LAB_145905664;
          lVar13 = lVar13 + 0x160;
          puVar24 = (ulong *)(lVar9 + 0x88);
          lVar9 = lVar9 + 0x160;
        } while (*puVar24 != uVar25);
        bVar31 = (byte)((*(long *)(lVar28 + -0x148 + lVar13) != -1) * '\x02' |
                       *(byte *)(lVar28 + -4 + lVar13)) <= *(byte *)(unaff_RBP + 0x2a0);
      }
LAB_145905664:
      if (*(char *)(*(long *)(unaff_RBP + 0x360) + 0x39) == '\0') {
        if ((bVar32 & bVar31) == 0) goto LAB_14590569a;
      }
      else {
        *(char *)(unaff_RBP + 0x387) = (char)*(undefined4 *)(unaff_RBP + 0x370);
        auVar58 = func_0x00014594cdc0();
        uVar19 = auVar42._0_8_;
LAB_14590569a:
        lVar12 = auVar58._8_8_;
        if ((auVar58._0_8_ & 1) == 0) {
          if (*(ulong *)(*(long *)(unaff_RBP + 0x378) + 0xd8) <= uVar27) {
                    /* WARNING: Bad instruction - Truncating control flow here */
            halt_baddata();
          }
          *(undefined8 *)(*(long *)(*(long *)(unaff_RBP + 0x378) + 0xd0) + 0x28 + lVar30) = 0;
          fVar49 = (float)uVar51 - (float)uVar19;
          fVar39 = (float)((ulong)uVar51 >> 0x20) - (float)((ulong)uVar19 >> 0x20);
          if (_DAT_145d9aecc < SQRT(fVar39 * fVar39 + fVar49 * fVar49)) {
            *(char *)(unaff_RBP + 0x387) = (char)*(undefined4 *)(unaff_RBP + 0x370);
            func_0x00014592ea80();
          }
          goto LAB_145904f97;
        }
      }
      lVar9 = *(long *)(unaff_RBP + 0x378);
      if (*(ulong *)(lVar9 + 0xd8) <= uVar27) {
                    /* WARNING: Bad instruction - Truncating control flow here */
        halt_baddata();
      }
      *(long *)(*(long *)(lVar9 + 0xd0) + 0x28 + lVar30) = lVar12;
      lVar28 = *(long *)(lVar9 + 0x560);
      lVar17 = *(long *)(lVar9 + 0x568) * 0x160;
      lVar15 = 0;
      lVar13 = *(long *)(unaff_RBP + 0x360);
      lVar9 = lVar28;
      do {
        if (lVar17 - lVar15 == 0) goto LAB_145904f97;
        lVar15 = lVar15 + 0x160;
        plVar10 = (long *)(lVar9 + 0x88);
        lVar9 = lVar9 + 0x160;
      } while (*plVar10 != lVar12);
      fVar49 = *(float *)(unaff_RBP + 0x200);
      fVar39 = *(float *)(lVar28 + -0x38 + lVar15);
      if (fVar39 <= fVar46) {
        uVar25 = *(ulong *)(lVar28 + -0x48 + lVar15);
        auVar55._8_8_ = 0;
        auVar55._0_8_ = uVar25;
      }
      else {
        fVar37 = *(float *)(lVar28 + -0x3c + lVar15);
        auVar41._0_4_ = (fVar49 + _DAT_145ed7ba0) - fVar37;
        auVar41._4_4_ = (fVar49 + fRam0000000145ed7ba4) - fVar37;
        auVar41._8_4_ = (fRam0000000145ed7ba8 + 0.0) - 0.0;
        auVar41._12_4_ = (fRam0000000145ed7bac + 0.0) - 0.0;
        auVar40._4_4_ = fVar39;
        auVar40._0_4_ = fVar39;
        auVar40._8_8_ = 0;
        auVar42 = divps(auVar41,auVar40);
        auVar42 = maxps(ZEXT816(0),auVar42);
        iVar33 = -(uint)(_DAT_145d70ca0 < auVar42._0_4_);
        iVar34 = -(uint)(fRam0000000145d70ca4 < auVar42._4_4_);
        auVar44._4_4_ = iVar34;
        auVar44._0_4_ = iVar33;
        auVar44._8_4_ = iVar34;
        auVar44._12_4_ = iVar34;
        auVar43._8_8_ = auVar44._8_8_;
        auVar43._4_4_ = iVar33;
        auVar43._0_4_ = iVar33;
        uVar16 = movmskpd((int)lVar17,auVar43);
        fVar39 = fVar47;
        if ((uVar16 & 2) == 0) {
          fVar39 = auVar42._4_4_;
        }
        fVar37 = fVar47;
        fVar35 = fVar48;
        if ((uVar16 & 1) == 0) {
          fVar37 = auVar42._0_4_;
          fVar35 = auVar42._8_4_;
        }
        uVar36 = *(undefined8 *)(lVar28 + -0x54 + lVar15);
        uVar19 = *(undefined8 *)(lVar28 + -0x48 + lVar15);
        fVar38 = (float)uVar36;
        fVar50 = (float)uVar19 - fVar38;
        fVar52 = (float)((ulong)uVar36 >> 0x20);
        fVar45 = (float)((ulong)uVar19 >> 0x20) - fVar52;
        uVar25 = CONCAT44(fVar39 * fVar45 + fVar52,fVar39 * fVar50 + fVar38);
        auVar55._0_4_ = fVar37 * fVar50 + fVar38;
        auVar55._4_4_ = fVar37 * fVar45 + fVar52;
        auVar55._8_4_ = fVar35 * 0.0 + 0.0;
        auVar55._12_4_ = fVar35 * 0.0 + 0.0;
      }
      fVar39 = (float)uVar51 - (float)uVar25;
      fVar37 = (float)((ulong)uVar51 >> 0x20) - (float)(uVar25 >> 0x20);
      if (SQRT(fVar37 * fVar37 + fVar39 * fVar39) <= _DAT_14609dd44) {
        if (*(ulong *)(*(long *)(unaff_RBP + 0x378) + 0xd8) <= uVar27) {
                    /* WARNING: Bad instruction - Truncating control flow here */
          halt_baddata();
        }
        if (*(float *)(*(long *)(*(long *)(unaff_RBP + 0x378) + 0xd0) + 0x60 + lVar30) <= fVar49) {
          *(char *)(unaff_RBP + 0x387) = (char)*(undefined4 *)(unaff_RBP + 0x370);
          fVar49 = (float)func_0x00014594e0f0();
          lVar9 = *(long *)(unaff_RBP + 0x378);
          if (*(ulong *)(lVar9 + 0xd8) <= uVar27) {
                    /* WARNING: Bad instruction - Truncating control flow here */
            halt_baddata();
          }
          *(float *)(*(long *)(lVar9 + 0xd0) + 0x60 + lVar30) =
               fVar49 + *(float *)(unaff_RBP + 0x200);
          if (*(ulong *)(lVar9 + 0xd8) <= uVar27) {
                    /* WARNING: Bad instruction - Truncating control flow here */
            halt_baddata();
          }
          lVar28 = *(long *)(*(long *)(lVar9 + 0xd0) + 0x18 + lVar30);
          bVar32 = *(byte *)(lVar28 + 0x39);
          if (bVar32 - 2 < 2) {
            uVar36 = 1;
LAB_145906296:
            cVar23 = '\x01';
          }
          else {
            if (bVar32 == 0) {
              uVar36 = *(undefined8 *)(*(long *)(lVar9 + 0xd0) + lVar30 + 0x20);
              fVar49 = *(float *)(lVar28 + 0x2c);
              lVar9 = *(long *)(unaff_RBP + 0x378);
              uVar14 = *(ulong *)(lVar9 + 0x958);
              uVar25 = *(ulong *)(lVar9 + 0x970) + uVar14;
              uVar18 = *(ulong *)(lVar9 + 0x960);
              uVar26 = *(ulong *)(lVar9 + 0x968) ^ uVar14;
              uVar11 = *(ulong *)(lVar9 + 0x970) ^ uVar18;
              *(ulong *)(lVar9 + 0x960) = uVar18 ^ uVar26;
              *(ulong *)(lVar9 + 0x958) = uVar14 ^ uVar11;
              *(ulong *)(lVar9 + 0x968) = uVar26 ^ uVar18 << 0x11;
              *(ulong *)(lVar9 + 0x970) = uVar11 << 0x2d | uVar11 >> 0x13;
              *(float *)(unaff_RBP + 0x2a0) =
                   (float)(uint)((uVar25 * 0x800000 | uVar25 >> 0x29) + uVar14 >> 0x28) *
                   _DAT_145e4cdf4;
              uVar25 = *(ulong *)(lVar9 + 0x780);
              fVar39 = fVar47;
              if (uVar25 != 0) {
                lVar9 = *(long *)(lVar9 + 0x778);
                fVar39 = _DAT_145d70c70;
                if (uVar25 == 1) {
                  uVar14 = 0;
LAB_1459069a6:
                  if (*(char *)(lVar9 + uVar14 * 8) == '\x11') {
                    fVar39 = fVar39 + *(float *)(lVar9 + 4 + uVar14 * 8);
                  }
                }
                else {
                  uVar14 = 0;
                  do {
                    if (*(char *)(lVar9 + uVar14 * 8) == '\x11') {
                      fVar39 = fVar39 + *(float *)(lVar9 + 4 + uVar14 * 8);
                      cVar23 = *(char *)(lVar9 + 8 + uVar14 * 8);
                    }
                    else {
                      cVar23 = *(char *)(lVar9 + 8 + uVar14 * 8);
                    }
                    if (cVar23 == '\x11') {
                      fVar39 = fVar39 + *(float *)(lVar9 + 0xc + uVar14 * 8);
                    }
                    uVar14 = uVar14 + 2;
                  } while ((uVar25 & 0xfffffffffffffffe) != uVar14);
                  if ((uVar25 & 1) != 0) goto LAB_1459069a6;
                }
                fVar39 = fVar39 + fVar47;
                lVar9 = *(long *)(unaff_RBP + 0x378);
              }
              fVar39 = fVar49 * (((float)*(uint *)(lVar9 + 0x4d8) + _DAT_145d73d14) * _DAT_145db5ef4
                                + fVar47) * *(float *)(lVar9 + 0x47c) * fVar39;
              if (*(float *)(unaff_RBP + 0x2a0) <= *(float *)(lVar9 + 0x484) &&
                  *(float *)(lVar9 + 0x484) != *(float *)(unaff_RBP + 0x2a0)) {
                fVar39 = fVar39 * *(float *)(lVar9 + 0x488);
              }
              *(char *)(unaff_RBP + 0x387) = (char)*(undefined4 *)(unaff_RBP + 0x370);
              uVar25 = (long)fVar39 & 0xffffffff;
              if (fVar39 < fVar46) {
                uVar25 = 0;
              }
              if (_DAT_145d6d874 < fVar39) {
                uVar25 = 0xffffffff;
              }
              func_0x0001458ab9e0(lVar28,lVar9,uVar36,unaff_RBP + 0xa0,lVar12,uVar25);
              lVar12 = *(long *)(*(long *)(unaff_RBP + 0x378) + 0x5e0);
              if (lVar12 == *(long *)(*(long *)(unaff_RBP + 0x378) + 0x5d0)) {
                func_0x000145bcb530();
              }
              lVar9 = *(long *)(unaff_RBP + 0x378);
              lVar28 = *(long *)(lVar9 + 0x5d8);
              uVar36 = *(undefined8 *)(unaff_RBP + 0xa0);
              uVar19 = *(undefined8 *)(unaff_RBP + 0xa8);
              uVar29 = *(undefined8 *)(unaff_RBP + 0xb8);
              puVar22 = (undefined8 *)(lVar28 + 0x10 + lVar12 * 0x20);
              *puVar22 = *(undefined8 *)(unaff_RBP + 0xb0);
              puVar22[1] = uVar29;
              puVar22 = (undefined8 *)(lVar28 + lVar12 * 0x20);
              *puVar22 = uVar36;
              puVar22[1] = uVar19;
              *(long *)(lVar9 + 0x5e0) = lVar12 + 1;
              uVar21 = *(undefined1 *)(lVar9 + 0x195);
              *(undefined1 *)(lVar9 + 0x195) = 2;
              *(char *)(unaff_RBP + 0x387) = (char)*(undefined4 *)(unaff_RBP + 0x370);
              func_0x000145933ec0();
              *(undefined1 *)(*(long *)(unaff_RBP + 0x378) + 0x195) = uVar21;
              lVar13 = *(long *)(unaff_RBP + 0x360);
              goto LAB_14590762b;
            }
            if (bVar32 == 5) {
              uVar36 = 0xfffffffffffffffe;
              goto LAB_145906296;
            }
            cVar23 = '\0';
            uVar36 = 0;
          }
          func_0x000140002200();
          plVar10 = (long *)func_0x0001400021c0();
          if (plVar10 == (long *)0x0) {
                    /* WARNING: Bad instruction - Truncating control flow here */
            halt_baddata();
          }
          *plVar10 = lVar12;
          *(undefined8 *)(unaff_RBP + 0x2e0) = 1;
          *(long **)(unaff_RBP + 0x2e8) = plVar10;
          *(undefined8 *)(unaff_RBP + 0x2f0) = 1;
          if (cVar23 != '\0') {
            lVar13 = *(long *)(*(long *)(unaff_RBP + 0x378) + 0x568) * 0x160;
            lVar9 = *(long *)(*(long *)(unaff_RBP + 0x378) + 0x560) + -0x160;
            do {
              if (lVar13 == 0) goto LAB_145906629;
              lVar13 = lVar13 + -0x160;
              plVar10 = (long *)(lVar9 + 0x1e8);
              lVar9 = lVar9 + 0x160;
            } while (*plVar10 != lVar12);
            puVar22 = (undefined8 *)(unaff_RBP + 0x234);
            func_0x0001458dfae0();
            *(undefined4 *)(unaff_RBP + 0x230) = 1;
            *(undefined4 *)(unaff_RBP + 0x218) = *(undefined4 *)(puVar22 + 1);
            *(undefined8 *)(unaff_RBP + 0x210) = *puVar22;
            *(long *)(unaff_RBP + 0x18) = lVar12;
            *(undefined1 *)(unaff_RBP + 0x36e) = 1;
            func_0x000145925c80();
            uVar19 = *(undefined8 *)(unaff_RBP + 0xa0);
            lVar9 = *(long *)(unaff_RBP + 0xa8);
            lVar13 = *(long *)(unaff_RBP + 0xb0);
            *(long *)(unaff_RBP + 0xa0) = lVar9;
            *(long *)(unaff_RBP + 0xa8) = lVar9;
            *(undefined8 *)(unaff_RBP + 0xb0) = uVar19;
            *(long *)(unaff_RBP + 0xb8) = lVar9 + lVar13 * 8;
            *(undefined8 *)(unaff_RBP + 0xc0) = uVar36;
            *(undefined1 *)(unaff_RBP + 0x36e) = 1;
            func_0x000145996880();
          }
LAB_145906629:
          if (*(ulong *)(*(long *)(unaff_RBP + 0x378) + 0xd8) <= uVar27) {
                    /* WARNING: Bad instruction - Truncating control flow here */
            halt_baddata();
          }
          if (*(char *)(lVar28 + 0x39) == '\x05') {
            lVar9 = *(long *)(unaff_RBP + 0x378);
            piVar2 = (int *)(*(long *)(lVar9 + 0xd0) + lVar30 + 0x70);
            *piVar2 = *piVar2 + 1;
            if (*(ulong *)(lVar9 + 0xd8) <= uVar27) {
                    /* WARNING: Bad instruction - Truncating control flow here */
              halt_baddata();
            }
            if ((uint)(*(int *)(*(long *)(lVar9 + 0xd0) + 0x70 + lVar30) * -0x55555555) < 0x55555556
               ) {
              *(long *)(unaff_RBP + 0x238) = lVar12;
              *(undefined4 *)(unaff_RBP + 0x230) = 0;
              *(undefined4 *)(unaff_RBP + 0x210) = 0;
              *(undefined1 *)(unaff_RBP + 0x36e) = 1;
              func_0x0001458b5100();
              lVar12 = *(long *)(*(long *)(unaff_RBP + 0x378) + 0x5e0);
              if (lVar12 == *(long *)(*(long *)(unaff_RBP + 0x378) + 0x5d0)) {
                func_0x000145bcb530();
              }
              lVar9 = *(long *)(unaff_RBP + 0x378);
              lVar13 = *(long *)(lVar9 + 0x5d8);
              uVar36 = *(undefined8 *)(unaff_RBP + 0xa0);
              uVar19 = *(undefined8 *)(unaff_RBP + 0xa8);
              uVar29 = *(undefined8 *)(unaff_RBP + 0xb8);
              puVar22 = (undefined8 *)(lVar13 + 0x10 + lVar12 * 0x20);
              *puVar22 = *(undefined8 *)(unaff_RBP + 0xb0);
              puVar22[1] = uVar29;
              puVar22 = (undefined8 *)(lVar13 + lVar12 * 0x20);
              *puVar22 = uVar36;
              puVar22[1] = uVar19;
              *(long *)(lVar9 + 0x5e0) = lVar12 + 1;
              uVar19 = 0x146e7a8b0;
            }
            else {
              uVar19 = 0;
              lVar9 = *(long *)(unaff_RBP + 0x378);
            }
            uVar29 = 6;
            if (*(long *)(lVar9 + 800) != 0) {
              lVar12 = 0;
LAB_14590682a:
              plVar10 = *(long **)(*(long *)(lVar9 + 0x318) + lVar12);
              if ((plVar10[1] != 9) ||
                 (plVar10 = (long *)*plVar10,
                 (char)plVar10[1] != 'e' || *plVar10 != 0x7269665f6c756f73)) goto LAB_14590681d;
              lVar12 = *(long *)(unaff_RBP + 0x378);
              uVar56 = *(undefined4 *)(lVar12 + 0x9ec);
              *(undefined4 *)(unaff_RBP + 0xa0) = uVar56;
              func_0x000145995f70();
              lVar9 = *(long *)(lVar12 + 0x7f0);
              uVar25 = *(ulong *)(lVar12 + 0x7f8);
              fVar49 = _DAT_145d70c70;
              if (uVar25 == 0) goto LAB_145906d78;
              uVar14 = (ulong)((uint)uVar25 & 7);
              if (7 < uVar25) {
                uVar18 = 0;
                do {
                  fVar49 = fVar49 + *(float *)(lVar9 + 4 + uVar18 * 8) +
                           *(float *)(lVar9 + 0xc + uVar18 * 8) +
                           *(float *)(lVar9 + 0x14 + uVar18 * 8) +
                           *(float *)(lVar9 + 0x1c + uVar18 * 8) +
                           *(float *)(lVar9 + 0x24 + uVar18 * 8) +
                           *(float *)(lVar9 + 0x2c + uVar18 * 8) +
                           *(float *)(lVar9 + 0x34 + uVar18 * 8) +
                           *(float *)(lVar9 + 0x3c + uVar18 * 8);
                  uVar18 = uVar18 + 8;
                } while ((uVar25 & 0xfffffffffffffff8) != uVar18);
                if (uVar14 != 0) {
LAB_145906d5f:
                  uVar11 = 0;
                  do {
                    fVar49 = fVar49 + *(float *)(lVar9 + uVar18 * 8 + 4 + uVar11 * 8);
                    uVar11 = uVar11 + 1;
                  } while (uVar14 != uVar11);
                }
LAB_145906d78:
                fVar39 = _DAT_145d6d42c - fVar49;
                if (_DAT_145d6d510 <= _DAT_145d6d42c - fVar49) {
                  fVar39 = _DAT_145d6d510;
                }
                if ((_DAT_145ef1c48 < fVar39) &&
                   (*(uint *)(*(long *)(unaff_RBP + 0x378) + 0x8a0) < 5)) {
                  if (uVar25 == **(ulong **)(unaff_RBP + 0x50)) {
                    *(undefined1 *)(unaff_RBP + 0x36e) = 1;
                    func_0x000145bfb120();
                    lVar9 = *(long *)(*(long *)(unaff_RBP + 0x378) + 0x7f0);
                  }
                  *(undefined4 *)(lVar9 + uVar25 * 8) = uVar56;
                  *(float *)(lVar9 + 4 + uVar25 * 8) = fVar39;
                  lVar12 = *(long *)(unaff_RBP + 0x378);
                  *(ulong *)(lVar12 + 0x7f8) = uVar25 + 1;
                  fVar39 = fVar39 + *(float *)(lVar12 + 0x8a8);
                  *(float *)(lVar12 + 0x8a8) = fVar39;
                  uVar16 = *(uint *)(lVar12 + 0x8a0);
                  if (_DAT_146e78540 <= fVar39 && uVar16 < 5) {
                    fVar49 = fVar39 + _DAT_145d73d14;
                    if (fVar39 + _DAT_145d73d14 <= fVar46) {
                      fVar49 = fVar46;
                    }
                    if (3 < uVar16 || fVar49 < _DAT_146e78540) {
                      uVar16 = uVar16 + 1;
                    }
                    else {
                      fVar49 = fVar49 + _DAT_145d73d14;
                      if (fVar49 <= fVar46) {
                        fVar49 = fVar46;
                      }
                      if (2 < uVar16 || fVar49 < _DAT_146e78540) {
                        uVar16 = uVar16 + 2;
                      }
                      else {
                        fVar49 = fVar49 + _DAT_145d73d14;
                        if (fVar49 <= fVar46) {
                          fVar49 = fVar46;
                        }
                        if (1 < uVar16 || fVar49 < _DAT_146e78540) {
                          uVar16 = uVar16 + 3;
                        }
                        else {
                          fVar49 = fVar49 + _DAT_145d73d14;
                          if (fVar49 <= fVar46) {
                            fVar49 = fVar46;
                          }
                          if (uVar16 != 0 || fVar49 < _DAT_146e78540) {
                            uVar16 = uVar16 | 4;
                          }
                          else {
                            fVar49 = fVar49 + _DAT_145d73d14;
                            if (fVar49 <= fVar46) {
                              fVar49 = fVar46;
                            }
                            uVar16 = 5;
                          }
                        }
                      }
                    }
                    lVar12 = *(long *)(unaff_RBP + 0x378);
                    *(float *)(lVar12 + 0x8a8) = fVar49;
                    *(uint *)(lVar12 + 0x8a0) = uVar16;
                  }
                  if (4 < uVar16) {
                    *(undefined4 *)(*(long *)(unaff_RBP + 0x378) + 0x8a8) = 0;
                  }
                  *(undefined1 *)(unaff_RBP + 0x36e) = 1;
                  func_0x000145947780();
                }
                goto LAB_145906fe5;
              }
              uVar18 = 0;
              goto LAB_145906d5f;
            }
LAB_145906fe5:
            uVar36 = 0x146e7a890;
          }
          else {
            uVar29 = 5;
            uVar19 = 0;
            uVar36 = 0x146e791f9;
          }
          *(undefined8 *)(unaff_RBP + 0xa0) = uVar36;
          *(undefined8 *)(unaff_RBP + 0xa8) = uVar29;
          *(undefined8 *)(unaff_RBP + 0xb0) = uVar19;
          *(undefined8 *)(unaff_RBP + 0xb8) = 0xf;
          *(undefined4 *)(unaff_RBP + 0xc0) = 0x3f800000;
          *(undefined1 *)(unaff_RBP + 200) = 0;
          *(undefined1 *)(unaff_RBP + 0x36e) = 1;
          func_0x00014594c4e0();
          lVar13 = *(long *)(unaff_RBP + 0x360);
          if (*(char *)(lVar28 + 0x39) == '\x04') {
            lVar12 = *(long *)(unaff_RBP + 0x378);
            uVar56 = *(undefined4 *)(lVar12 + 0x9ec);
            *(undefined4 *)(unaff_RBP + 0x78) = uVar56;
            uVar14 = *(ulong *)(lVar12 + 0x958);
            uVar18 = *(ulong *)(lVar12 + 0x960);
            uVar25 = *(ulong *)(lVar12 + 0x970) + uVar14;
            uVar26 = *(ulong *)(lVar12 + 0x968) ^ uVar14;
            uVar11 = *(ulong *)(lVar12 + 0x970) ^ uVar18;
            *(ulong *)(lVar12 + 0x960) = uVar18 ^ uVar26;
            *(ulong *)(lVar12 + 0x958) = uVar14 ^ uVar11;
            *(ulong *)(lVar12 + 0x968) = uVar26 ^ uVar18 << 0x11;
            *(ulong *)(lVar12 + 0x970) = uVar11 << 0x2d | uVar11 >> 0x13;
            if (((float)(uint)((uVar25 * 0x800000 | uVar25 >> 0x29) + uVar14 >> 0x28) *
                 _DAT_145e4cdf4 < _DAT_145d6d748) &&
               (func_0x000145996270(), *(ulong *)(*(long *)(unaff_RBP + 0x378) + 0x120) < 2)) {
              lVar12 = *(long *)(unaff_RBP + 0x378);
              if (*(ulong *)(lVar12 + 0xd8) <= uVar27) {
                    /* WARNING: Bad instruction - Truncating control flow here */
                halt_baddata();
              }
              func_0x0001458e0be0(*(undefined8 *)(*(long *)(lVar12 + 0xd0) + 0x20 + lVar30),lVar12,
                                  *(long *)(lVar12 + 0xd0) + lVar30,unaff_RBP + 8);
              *(undefined1 *)(unaff_RBP + 0x36e) = 1;
              func_0x000145925c80();
              uVar36 = *(undefined8 *)(unaff_RBP + 0xa0);
              lVar12 = *(long *)(unaff_RBP + 0xa8);
              lVar9 = *(long *)(unaff_RBP + 0xb0);
              *(long *)(unaff_RBP + 0xa0) = lVar12;
              *(long *)(unaff_RBP + 0xa8) = lVar12;
              *(undefined8 *)(unaff_RBP + 0xb0) = uVar36;
              *(long *)(unaff_RBP + 0xb8) = lVar12 + lVar9 * 8;
              *(undefined8 *)(unaff_RBP + 0xc0) = *(undefined8 *)(unaff_RBP + 0x330);
              *(undefined1 *)(unaff_RBP + 0x36e) = 1;
              func_0x0001459ac8d0();
              lVar12 = *(long *)(unaff_RBP + 0x240);
              if (lVar12 == 0) {
                lVar13 = *(long *)(unaff_RBP + 0x360);
                if (*(long *)(unaff_RBP + 0x230) != 0) {
                  *(undefined8 *)(unaff_RBP + 0x2a0) = *(undefined8 *)(unaff_RBP + 0x238);
                  goto LAB_1459073fe;
                }
              }
              else {
                lVar9 = *(long *)(unaff_RBP + 0x378);
                lVar28 = *(long *)(lVar9 + 0x120);
                if (lVar28 == *(long *)(lVar9 + 0x110)) {
                  *(undefined1 *)(unaff_RBP + 0x346) = 1;
                  func_0x000145bcdda0();
                }
                *(undefined4 *)(*(long *)(lVar9 + 0x118) + lVar28 * 4) = uVar56;
                *(long *)(lVar9 + 0x120) = lVar28 + 1;
                *(undefined4 *)(unaff_RBP + 0x210) = 2;
                *(undefined4 *)(unaff_RBP + 0x18) = 0;
                *(undefined1 *)(unaff_RBP + 0x346) = 1;
                *(undefined8 *)(unaff_RBP + 0x2a0) = *(undefined8 *)(unaff_RBP + 0x238);
                func_0x0001458b5100();
                lVar28 = *(long *)(lVar9 + 0x5e0);
                if (lVar28 == *(long *)(lVar9 + 0x5d0)) {
                  func_0x000145bcb530();
                }
                lVar9 = *(long *)(unaff_RBP + 0x378);
                lVar13 = *(long *)(lVar9 + 0x5d8);
                uVar36 = *(undefined8 *)(unaff_RBP + 0xa0);
                uVar19 = *(undefined8 *)(unaff_RBP + 0xa8);
                uVar29 = *(undefined8 *)(unaff_RBP + 0xb8);
                puVar22 = (undefined8 *)(lVar13 + 0x10 + lVar28 * 0x20);
                *puVar22 = *(undefined8 *)(unaff_RBP + 0xb0);
                puVar22[1] = uVar29;
                puVar22 = (undefined8 *)(lVar13 + lVar28 * 0x20);
                *puVar22 = uVar36;
                puVar22[1] = uVar19;
                *(long *)(lVar9 + 0x5e0) = lVar28 + 1;
                *(undefined8 *)(unaff_RBP + 0x88) = *(undefined8 *)(unaff_RBP + 0x230);
                plVar20 = *(long **)(unaff_RBP + 0x2a0);
                plVar10 = plVar20 + lVar12;
                lVar13 = *(long *)(unaff_RBP + 0x360);
                fVar49 = _DAT_145d9ae9c;
                do {
                  lVar9 = *plVar20;
                  plVar20 = plVar20 + 1;
                  lVar28 = *(long *)(*(long *)(unaff_RBP + 0x378) + 0x560);
                  lVar15 = 0;
                  lVar12 = lVar28;
                  do {
                    if (*(long *)(*(long *)(unaff_RBP + 0x378) + 0x568) * 0x160 - lVar15 == 0)
                    goto LAB_145907353;
                    lVar15 = lVar15 + 0x160;
                    plVar5 = (long *)(lVar12 + 0x88);
                    lVar12 = lVar12 + 0x160;
                  } while (*plVar5 != lVar9);
                  fVar39 = _DAT_145d6d42c;
                  if ((*(long *)(lVar28 + -0x148 + lVar15) == -1) &&
                     (fVar39 = fVar49, *(char *)(lVar28 + -4 + lVar15) != '\0')) {
                    fVar39 = _DAT_145d6d754;
                  }
                  *(float *)(unaff_RBP + 0xa4) = fVar39;
                  *(undefined4 *)(unaff_RBP + 0xa0) = 3;
                  func_0x0001459251b0();
LAB_145907353:
                } while (plVar20 != plVar10);
                if (*(long *)(unaff_RBP + 0x88) != 0) {
LAB_1459073fe:
                  func_0x0001400021d0();
                }
              }
            }
          }
          uVar25 = *(ulong *)(*(long *)(unaff_RBP + 0x378) + 0x780);
          if (uVar25 == 0) {
LAB_145907609:
            lVar12 = *(long *)(unaff_RBP + 0x2e0);
          }
          else {
            lVar12 = *(long *)(*(long *)(unaff_RBP + 0x378) + 0x778);
            fVar49 = _DAT_145d70c70;
            if (uVar25 == 1) {
              uVar14 = 0;
LAB_145907490:
              if (*(char *)(lVar12 + uVar14 * 8) == '\x1f') {
                fVar49 = fVar49 + *(float *)(lVar12 + 4 + uVar14 * 8);
              }
            }
            else {
              uVar14 = 0;
              do {
                if (*(char *)(lVar12 + uVar14 * 8) == '\x1f') {
                  fVar49 = fVar49 + *(float *)(lVar12 + 4 + uVar14 * 8);
                  cVar23 = *(char *)(lVar12 + 8 + uVar14 * 8);
                }
                else {
                  cVar23 = *(char *)(lVar12 + 8 + uVar14 * 8);
                }
                if (cVar23 == '\x1f') {
                  fVar49 = fVar49 + *(float *)(lVar12 + 0xc + uVar14 * 8);
                }
                uVar14 = uVar14 + 2;
              } while ((uVar25 & 0xfffffffffffffffe) != uVar14);
              if ((uVar25 & 1) != 0) goto LAB_145907490;
            }
            if (fVar49 <= fVar46) goto LAB_145907609;
            lVar12 = *(long *)(unaff_RBP + 0x378);
            uVar14 = *(ulong *)(lVar12 + 0x958);
            uVar18 = *(ulong *)(lVar12 + 0x960);
            uVar25 = *(ulong *)(lVar12 + 0x970) + uVar14;
            uVar26 = *(ulong *)(lVar12 + 0x968) ^ uVar14;
            uVar11 = *(ulong *)(lVar12 + 0x970) ^ uVar18;
            *(ulong *)(lVar12 + 0x960) = uVar18 ^ uVar26;
            *(ulong *)(lVar12 + 0x958) = uVar14 ^ uVar11;
            *(ulong *)(lVar12 + 0x968) = uVar26 ^ uVar18 << 0x11;
            *(ulong *)(lVar12 + 0x970) = uVar11 << 0x2d | uVar11 >> 0x13;
            if (fVar49 <= (float)(uint)((uVar25 * 0x800000 | uVar25 >> 0x29) + uVar14 >> 0x28) *
                          _DAT_145e4cdf4) goto LAB_145907609;
            lVar12 = *(long *)(unaff_RBP + 0x2e8);
            *(long *)(unaff_RBP + 0xa0) = lVar12;
            *(long *)(unaff_RBP + 0xa8) = lVar12;
            *(undefined8 *)(unaff_RBP + 0xb0) = *(undefined8 *)(unaff_RBP + 0x2e0);
            *(long *)(unaff_RBP + 0xb8) = lVar12 + *(long *)(unaff_RBP + 0x2f0) * 8;
            *(undefined8 *)(unaff_RBP + 0xc0) = *(undefined8 *)(unaff_RBP + 0x330);
            *(undefined1 *)(unaff_RBP + 0x36e) = 0;
            func_0x0001459ac830();
            lVar13 = *(long *)(unaff_RBP + 0x360);
            if (*(long *)(unaff_RBP + 0x240) != 0) {
              *(undefined8 *)(unaff_RBP + 0xa0) = 0x146e7a8bf;
              *(undefined8 *)(unaff_RBP + 0xa8) = 0xe;
              *(undefined8 *)(unaff_RBP + 0xb0) = 0;
              *(undefined1 *)(unaff_RBP + 200) = 0;
              *(undefined8 *)(unaff_RBP + 0x2a0) = *(undefined8 *)(unaff_RBP + 0x238);
              func_0x00014594c4e0();
            }
            lVar12 = *(long *)(unaff_RBP + 0x230);
          }
          if (lVar12 != 0) {
            func_0x0001400021d0();
          }
        }
      }
LAB_14590762b:
      uVar36 = auVar55._0_8_;
      if ((uVar27 < *(ulong *)(*(long *)(unaff_RBP + 0x378) + 0xd8)) &&
         (lVar12 = *(long *)(*(long *)(unaff_RBP + 0x378) + 0xd0),
         *(char *)(*(long *)(lVar12 + 0x18 + lVar30) + 0x39) != '\0')) {
        lVar12 = lVar12 + lVar30;
        fVar49 = *(float *)(lVar12 + 0x60);
        pfVar4 = (float *)(*(long *)(unaff_RBP + 0x378) + 0x9ec);
        if (*pfVar4 <= fVar49 && fVar49 != *pfVar4) {
          fVar39 = *(float *)(lVar12 + 100);
          fVar37 = fVar39;
          if (fVar49 <= fVar39) {
            fVar37 = fVar49;
          }
          *(uint *)(lVar12 + 100) =
               -(uint)NAN(fVar37) & (uint)fVar39 | ~-(uint)NAN(fVar37) & (uint)fVar37;
        }
      }
      if (*(char *)(lVar13 + 0x39) != '\0') {
        if (*(ulong *)(*(long *)(unaff_RBP + 0x378) + 0xd8) <= uVar27) {
                    /* WARNING: Bad instruction - Truncating control flow here */
          halt_baddata();
        }
        fVar49 = (float)func_0x000145bc97c3();
        fVar39 = (float)func_0x000145bc97bd();
        uVar36 = CONCAT44(auVar55._4_4_ + fVar39 * fRam0000000146e78554,
                          auVar55._0_4_ + fVar49 * _DAT_146e78550);
      }
      fVar49 = (float)uVar51 - (float)uVar36;
      fVar39 = (float)((ulong)uVar51 >> 0x20) - (float)((ulong)uVar36 >> 0x20);
      if (_DAT_145d9ae98 < SQRT(fVar39 * fVar39 + fVar49 * fVar49)) {
        *(char *)(unaff_RBP + 0x387) = (char)*(undefined4 *)(unaff_RBP + 0x370);
        func_0x00014592ea80();
      }
      goto LAB_145904f97;
    }
    fVar49 = (float)uVar51 - auVar42._0_4_;
    fVar52 = fVar52 - auVar42._4_4_;
    if (_DAT_14609dd44 < SQRT(fVar52 * fVar52 + fVar49 * fVar49)) {
      *(char *)(unaff_RBP + 0x387) = (char)*(undefined4 *)(unaff_RBP + 0x370);
      func_0x00014592ea80();
      uVar25 = *(ulong *)(*(long *)(unaff_RBP + 0x378) + 0xd8);
    }
    if (uVar25 <= uVar27) {
                    /* WARNING: Bad instruction - Truncating control flow here */
      halt_baddata();
    }
    if (*(float *)(*(long *)(*(long *)(unaff_RBP + 0x378) + 0xd0) + 0x60 + lVar30) <=
        *(float *)(unaff_RBP + 0x200)) {
      if (*(char *)(*(long *)(unaff_RBP + 0x360) + 0x39) == '\0') {
        *(char *)(unaff_RBP + 0x387) = (char)*(undefined4 *)(unaff_RBP + 0x370);
        func_0x000145925e50();
        bVar31 = *(long *)(unaff_RBP + 0xb0) == 0;
        if (bVar31) {
          auVar8._8_8_ = 0;
          auVar8._0_8_ = uVar14;
          auVar57 = auVar8 << 0x40;
          lVar12 = *(long *)(unaff_RBP + 0xa0);
        }
        else {
          uVar14 = **(ulong **)(unaff_RBP + 0xa8);
          auVar57._8_8_ = uVar14;
          auVar57._0_8_ = 1;
          lVar12 = *(long *)(unaff_RBP + 0xa0);
        }
        uVar25 = (ulong)!bVar31;
        if (lVar12 != 0) {
          func_0x0001400021d0();
          auVar57._8_8_ = uVar14;
          auVar57._0_8_ = uVar25;
        }
      }
      else {
        *(char *)(unaff_RBP + 0x387) = (char)*(undefined4 *)(unaff_RBP + 0x370);
        auVar57 = func_0x00014594cdc0();
      }
      lVar12 = auVar57._8_8_;
      if (*(ulong *)(*(long *)(unaff_RBP + 0x378) + 0xd8) <= uVar27) {
                    /* WARNING: Bad instruction - Truncating control flow here */
        halt_baddata();
      }
      bVar31 = (auVar57._0_8_ & 1) != 0;
      lVar9 = 0;
      if (bVar31) {
        lVar9 = lVar12;
      }
      *(long *)(*(long *)(*(long *)(unaff_RBP + 0x378) + 0xd0) + 0x28 + lVar30) = lVar9;
      if (bVar31) {
        *(char *)(unaff_RBP + 0x387) = (char)*(undefined4 *)(unaff_RBP + 0x370);
        fVar49 = (float)func_0x00014594e0f0();
        lVar9 = *(long *)(unaff_RBP + 0x378);
        if (*(ulong *)(lVar9 + 0xd8) <= uVar27) {
                    /* WARNING: Bad instruction - Truncating control flow here */
          halt_baddata();
        }
        *(float *)(*(long *)(lVar9 + 0xd0) + 0x60 + lVar30) = fVar49 + *(float *)(unaff_RBP + 0x200)
        ;
        if (*(ulong *)(lVar9 + 0xd8) <= uVar27) {
                    /* WARNING: Bad instruction - Truncating control flow here */
          halt_baddata();
        }
        lVar28 = *(long *)(*(long *)(lVar9 + 0xd0) + 0x18 + lVar30);
        lVar9 = *(long *)(lVar9 + 0xd0) + lVar30;
        cVar23 = *(char *)(lVar28 + 0x39);
        if (cVar23 == '\x01') {
          fVar49 = **(float **)(unaff_RBP + 0x80);
          uVar25 = (ulong)(uint)fVar49;
          if (*(float *)(lVar9 + 0x5c) <= fVar46) {
            *(undefined4 *)(unaff_RBP + 0x2e8) = *(undefined4 *)(lVar9 + 0x54);
            *(undefined8 *)(unaff_RBP + 0x2e0) = *(undefined8 *)(lVar9 + 0x4c);
          }
          else {
            fVar37 = (fVar49 - *(float *)(lVar9 + 0x58)) / *(float *)(lVar9 + 0x5c);
            fVar39 = 0.0;
            if (0.0 <= fVar37) {
              fVar39 = fVar37;
            }
            fVar37 = fVar47;
            if (fVar39 <= fVar47) {
              fVar37 = fVar39;
            }
            fVar39 = *(float *)(lVar9 + 0x48);
            fVar35 = *(float *)(lVar9 + 0x54);
            fVar38 = (float)*(undefined8 *)(lVar9 + 0x40);
            fVar52 = (float)((ulong)*(undefined8 *)(lVar9 + 0x40) >> 0x20);
            *(ulong *)(unaff_RBP + 0x2e0) =
                 CONCAT44(fVar37 * ((float)((ulong)*(undefined8 *)(lVar9 + 0x4c) >> 0x20) - fVar52)
                          + fVar52,fVar37 * ((float)*(undefined8 *)(lVar9 + 0x4c) - fVar38) + fVar38
                         );
            *(float *)(unaff_RBP + 0x2e8) = (fVar35 - fVar39) * fVar37 + fVar39;
          }
          uVar14 = *(ulong *)(*(long *)(unaff_RBP + 0x378) + 0x138);
          if (uVar14 != 0) {
            lVar9 = *(long *)(*(long *)(unaff_RBP + 0x378) + 0x130);
            uVar18 = 0;
LAB_145905a90:
            if (fVar49 - *(float *)(lVar9 + uVar18 * 4) < fVar47) break;
            uVar11 = uVar18 + 1;
            uVar26 = uVar18;
            if (uVar11 < uVar14) {
              if (((int)uVar14 + (int)uVar18 & 1U) == 0) {
                fVar39 = *(float *)(lVar9 + 4 + uVar18 * 4);
                if (fVar49 - fVar39 < fVar47) {
                  *(float *)(lVar9 + uVar18 * 4) = fVar39;
                  uVar26 = uVar18 + 1;
                }
                uVar11 = uVar18 + 2;
              }
              if (uVar14 - 2 != uVar18) {
                do {
                  fVar39 = *(float *)(lVar9 + uVar11 * 4);
                  if (fVar49 - fVar39 < fVar47) {
                    *(float *)(lVar9 + uVar26 * 4) = fVar39;
                    uVar26 = uVar26 + 1;
                  }
                  fVar39 = *(float *)(lVar9 + 4 + uVar11 * 4);
                  if (fVar49 - fVar39 < fVar47) {
                    *(float *)(lVar9 + uVar26 * 4) = fVar39;
                    uVar26 = uVar26 + 1;
                  }
                  uVar11 = uVar11 + 2;
                } while (uVar14 != uVar11);
              }
            }
            *(ulong *)(*(long *)(unaff_RBP + 0x378) + 0x138) = uVar26;
            uVar14 = uVar26;
            goto LAB_145905c9c;
          }
          uVar14 = 0;
LAB_145905c9c:
          *(long *)(unaff_RBP + 0x210) = lVar12;
          *(char *)(unaff_RBP + 0x387) = (char)*(undefined4 *)(unaff_RBP + 0x370);
          func_0x000145925c80();
          lVar9 = 0;
          if (uVar14 < 0x19) {
            lVar9 = 0x18 - uVar14;
          }
          uVar51 = *(undefined8 *)(unaff_RBP + 0xa0);
          lVar28 = *(long *)(unaff_RBP + 0xa8);
          lVar13 = *(long *)(unaff_RBP + 0xb0);
          *(long *)(unaff_RBP + 0xa0) = lVar28;
          *(long *)(unaff_RBP + 0xa8) = lVar28;
          *(undefined8 *)(unaff_RBP + 0xb0) = uVar51;
          *(long *)(unaff_RBP + 0xb8) = lVar28 + lVar13 * 8;
          *(undefined8 *)(unaff_RBP + 0xc0) = *(undefined8 *)(unaff_RBP + 0x330);
          *(long *)(unaff_RBP + 200) = lVar9;
          *(char *)(unaff_RBP + 0x387) = (char)*(undefined4 *)(unaff_RBP + 0x370);
          func_0x0001459ac3e0();
          lVar28 = *(long *)(unaff_RBP + 0x238);
          lVar9 = *(long *)(unaff_RBP + 0x240);
          *(long *)(unaff_RBP + 0x88) = lVar9 * 8;
          *(long *)(unaff_RBP + 0x360) = lVar9;
          lVar9 = lVar28 + lVar9 * 8;
          *(long *)(unaff_RBP + 0x2a0) = lVar28;
          for (; lVar28 != lVar9; lVar28 = lVar28 + 8) {
            lVar13 = *(long *)(*(long *)(unaff_RBP + 0x378) + 0x138);
            if (lVar13 == *(long *)(*(long *)(unaff_RBP + 0x378) + 0x128)) {
              *(undefined1 *)(unaff_RBP + 0x326) = 1;
              func_0x000145bcdda0();
            }
            lVar15 = *(long *)(unaff_RBP + 0x378);
            *(int *)(*(long *)(lVar15 + 0x130) + lVar13 * 4) = (int)uVar25;
            *(long *)(lVar15 + 0x138) = lVar13 + 1;
          }
          func_0x000140002200();
          plVar10 = (long *)func_0x0001400021c0();
          if (plVar10 == (long *)0x0) {
                    /* WARNING: Bad instruction - Truncating control flow here */
            halt_baddata();
          }
          *plVar10 = lVar12;
          *(undefined8 *)(unaff_RBP + 0xa0) = 1;
          *(long **)(unaff_RBP + 0xa8) = plVar10;
          *(undefined8 *)(unaff_RBP + 0xb0) = 1;
          lVar28 = *(long *)(unaff_RBP + 0x230);
          lVar9 = 1;
          lVar12 = *(long *)(unaff_RBP + 0x360);
          if (lVar12 == 0) {
            lVar12 = 0;
          }
          else {
            *(long *)(unaff_RBP + 0x58) = lVar28;
            func_0x000145bcb2d0(1,lVar12,1,unaff_RBP + 0xa0,lVar12,8);
            plVar10 = *(long **)(unaff_RBP + 0xa8);
            lVar9 = *(long *)(unaff_RBP + 0xb0);
            func_0x000145bc977b();
            lVar12 = *(long *)(unaff_RBP + 0x360);
            lVar28 = *(long *)(unaff_RBP + 0x58);
          }
          if (lVar28 != 0) {
            func_0x0001400021d0();
          }
          *(undefined8 *)(unaff_RBP + 0x2a0) = *(undefined8 *)(unaff_RBP + 0xa0);
          *(undefined8 *)(unaff_RBP + 0xa0) = 0x146e7ab08;
          *(undefined8 *)(unaff_RBP + 0xa8) = 8;
          *(undefined8 *)(unaff_RBP + 0xb0) = 0;
          *(undefined1 *)(unaff_RBP + 200) = 0;
          lVar28 = *(long *)(unaff_RBP + 0x378);
          *(long **)(unaff_RBP + 0x360) = plVar10;
          func_0x000145950ce0(lVar9 + lVar12,lVar28,uVar27,lVar28,plVar10,lVar9 + lVar12);
          uVar25 = *(ulong *)(lVar28 + 0x780);
          if (uVar25 != 0) {
            lVar12 = *(long *)(*(long *)(unaff_RBP + 0x378) + 0x778);
            fVar49 = _DAT_145d70c70;
            if (uVar25 == 1) {
              uVar14 = 0;
LAB_145906182:
              if (*(char *)(lVar12 + uVar14 * 8) == '\x1f') {
                fVar49 = fVar49 + *(float *)(lVar12 + 4 + uVar14 * 8);
              }
            }
            else {
              uVar14 = 0;
              do {
                if (*(char *)(lVar12 + uVar14 * 8) == '\x1f') {
                  fVar49 = fVar49 + *(float *)(lVar12 + 4 + uVar14 * 8);
                  cVar23 = *(char *)(lVar12 + 8 + uVar14 * 8);
                }
                else {
                  cVar23 = *(char *)(lVar12 + 8 + uVar14 * 8);
                }
                if (cVar23 == '\x1f') {
                  fVar49 = fVar49 + *(float *)(lVar12 + 0xc + uVar14 * 8);
                }
                uVar14 = uVar14 + 2;
              } while ((uVar25 & 0xfffffffffffffffe) != uVar14);
              if ((uVar25 & 1) != 0) goto LAB_145906182;
            }
            if (fVar46 < fVar49) {
              lVar12 = *(long *)(unaff_RBP + 0x378);
              uVar14 = *(ulong *)(lVar12 + 0x958);
              uVar18 = *(ulong *)(lVar12 + 0x960);
              uVar25 = *(ulong *)(lVar12 + 0x970) + uVar14;
              uVar26 = *(ulong *)(lVar12 + 0x968) ^ uVar14;
              uVar11 = *(ulong *)(lVar12 + 0x970) ^ uVar18;
              *(ulong *)(lVar12 + 0x960) = uVar18 ^ uVar26;
              *(ulong *)(lVar12 + 0x958) = uVar14 ^ uVar11;
              *(ulong *)(lVar12 + 0x968) = uVar26 ^ uVar18 << 0x11;
              *(ulong *)(lVar12 + 0x970) = uVar11 << 0x2d | uVar11 >> 0x13;
              if ((float)(uint)((uVar25 * 0x800000 | uVar25 >> 0x29) + uVar14 >> 0x28) *
                  _DAT_145e4cdf4 < fVar49) {
                *(undefined8 *)(unaff_RBP + 0xa0) = 0x146e7a8bf;
                *(undefined8 *)(unaff_RBP + 0xa8) = 0xe;
                *(undefined8 *)(unaff_RBP + 0xb0) = 0;
                *(undefined1 *)(unaff_RBP + 200) = 0;
                func_0x000145950ce0();
              }
            }
          }
          if (*(long *)(unaff_RBP + 0x2a0) != 0) {
            func_0x0001400021d0();
          }
        }
        else {
          if (cVar23 != '\a') {
            if (cVar23 != '\b') {
              if (*(float *)(lVar9 + 0x5c) <= fVar46) {
                uVar51 = *(undefined8 *)(lVar9 + 0x4c);
              }
              else {
                fVar39 = (**(float **)(unaff_RBP + 0x80) - *(float *)(lVar9 + 0x58)) /
                         *(float *)(lVar9 + 0x5c);
                fVar49 = 0.0;
                if (0.0 <= fVar39) {
                  fVar49 = fVar39;
                }
                fVar39 = fVar47;
                if (fVar49 <= fVar47) {
                  fVar39 = fVar49;
                }
                fVar49 = (float)*(undefined8 *)(lVar9 + 0x40);
                fVar37 = (float)((ulong)*(undefined8 *)(lVar9 + 0x40) >> 0x20);
                uVar51 = CONCAT44(fVar39 * ((float)((ulong)*(undefined8 *)(lVar9 + 0x4c) >> 0x20) -
                                           fVar37) + fVar37,
                                  fVar39 * ((float)*(undefined8 *)(lVar9 + 0x4c) - fVar49) + fVar49)
                ;
              }
              uVar36 = *(undefined8 *)(lVar9 + 0x20);
              lVar13 = *(long *)(*(long *)(unaff_RBP + 0x378) + 0x568) * 0x160;
              lVar9 = *(long *)(*(long *)(unaff_RBP + 0x378) + 0x560) + -0x160;
              do {
                if (lVar13 == 0) goto LAB_145906c8c;
                lVar13 = lVar13 + -0x160;
                plVar10 = (long *)(lVar9 + 0x1e8);
                lVar9 = lVar9 + 0x160;
              } while (*plVar10 != lVar12);
              func_0x0001458dfae0();
              uVar56 = *(undefined4 *)(unaff_RBP + 0xa0);
              fVar49 = *(float *)(unaff_RBP + 0xa4);
              *(long *)(unaff_RBP + 0x210) = lVar12;
              *(long *)(unaff_RBP + 0x238) = lVar12;
              *(undefined4 *)(unaff_RBP + 0x230) = 0;
              *(undefined4 *)(unaff_RBP + 0x2e0) = 0;
              *(char *)(unaff_RBP + 0x387) = (char)*(undefined4 *)(unaff_RBP + 0x370);
              func_0x0001458b5100();
              *(undefined4 *)(unaff_RBP + 0x360) = uVar56;
              lVar9 = *(long *)(*(long *)(unaff_RBP + 0x378) + 0x5e0);
              if (lVar9 == *(long *)(*(long *)(unaff_RBP + 0x378) + 0x5d0)) {
                func_0x000145bcb530();
              }
              lVar13 = *(long *)(unaff_RBP + 0x378);
              lVar15 = *(long *)(lVar13 + 0x5d8);
              uVar19 = *(undefined8 *)(unaff_RBP + 0xa0);
              uVar29 = *(undefined8 *)(unaff_RBP + 0xa8);
              uVar7 = *(undefined8 *)(unaff_RBP + 0xb8);
              puVar22 = (undefined8 *)(lVar15 + 0x10 + lVar9 * 0x20);
              *puVar22 = *(undefined8 *)(unaff_RBP + 0xb0);
              puVar22[1] = uVar7;
              puVar22 = (undefined8 *)(lVar15 + lVar9 * 0x20);
              *puVar22 = uVar19;
              puVar22[1] = uVar29;
              *(long *)(lVar13 + 0x5e0) = lVar9 + 1;
              fVar39 = *(float *)(lVar28 + 0x2c);
              uVar14 = *(ulong *)(lVar13 + 0x958);
              uVar25 = *(ulong *)(lVar13 + 0x970) + uVar14;
              uVar18 = *(ulong *)(lVar13 + 0x960);
              uVar26 = *(ulong *)(lVar13 + 0x968) ^ uVar14;
              uVar11 = *(ulong *)(lVar13 + 0x970) ^ uVar18;
              *(ulong *)(lVar13 + 0x960) = uVar18 ^ uVar26;
              *(ulong *)(lVar13 + 0x958) = uVar14 ^ uVar11;
              *(ulong *)(lVar13 + 0x968) = uVar26 ^ uVar18 << 0x11;
              *(ulong *)(lVar13 + 0x970) = uVar11 << 0x2d | uVar11 >> 0x13;
              fVar37 = (float)(uint)((uVar25 * 0x800000 | uVar25 >> 0x29) + uVar14 >> 0x28) *
                       _DAT_145e4cdf4;
              uVar25 = *(ulong *)(lVar13 + 0x780);
              fVar35 = fVar47;
              if (uVar25 != 0) {
                lVar9 = *(long *)(lVar13 + 0x778);
                fVar35 = _DAT_145d70c70;
                if (uVar25 == 1) {
                  uVar14 = 0;
LAB_1459062e3:
                  if (*(char *)(lVar9 + uVar14 * 8) == '\x11') {
                    fVar35 = fVar35 + *(float *)(lVar9 + 4 + uVar14 * 8);
                  }
                }
                else {
                  uVar14 = 0;
                  do {
                    if (*(char *)(lVar9 + uVar14 * 8) == '\x11') {
                      fVar35 = fVar35 + *(float *)(lVar9 + 4 + uVar14 * 8);
                      cVar23 = *(char *)(lVar9 + 8 + uVar14 * 8);
                    }
                    else {
                      cVar23 = *(char *)(lVar9 + 8 + uVar14 * 8);
                    }
                    if (cVar23 == '\x11') {
                      fVar35 = fVar35 + *(float *)(lVar9 + 0xc + uVar14 * 8);
                    }
                    uVar14 = uVar14 + 2;
                  } while ((uVar25 & 0xfffffffffffffffe) != uVar14);
                  if ((uVar25 & 1) != 0) goto LAB_1459062e3;
                }
                fVar35 = fVar35 + fVar47;
                lVar13 = *(long *)(unaff_RBP + 0x378);
              }
              fVar38 = *(float *)(lVar13 + 0x484);
              fVar35 = fVar39 * (((float)*(uint *)(lVar13 + 0x4d8) + _DAT_145d73d14) *
                                 _DAT_145db5ef4 + fVar47) * *(float *)(lVar13 + 0x47c) * fVar35;
              fVar52 = *(float *)(lVar13 + 0x488) * fVar35;
              iVar33 = *(int *)(lVar28 + 0x34);
              fVar39 = fVar47;
              if (iVar33 < 0x13fc) {
                if (iVar33 < 0x5e6) {
                  if (iVar33 < 0x85) {
                    fVar39 = _DAT_145d70c74;
                    if ((iVar33 != 0x4b) && (fVar39 = fVar47, iVar33 == 0x74)) {
LAB_145906b1e:
                      fVar39 = _DAT_145d9de20;
                    }
                  }
                  else {
                    if (iVar33 == 0x85) goto LAB_1459068e6;
                    if ((iVar33 == 0x193) || (iVar33 == 0x2ae)) goto LAB_145906953;
                  }
                }
                else if (iVar33 < 0xafc) {
                  if ((iVar33 == 0x5e6) ||
                     ((fVar39 = _DAT_145d70c74, iVar33 != 0x7ba &&
                      (fVar39 = fVar47, iVar33 == 0xa53)))) {
LAB_1459068d9:
                    fVar39 = _DAT_145d70c30;
                  }
                }
                else {
                  if (iVar33 == 0xafc) goto LAB_145906953;
                  fVar39 = _DAT_145d70c74;
                  if ((iVar33 != 0xbe4) && (fVar39 = fVar47, iVar33 == 0xe16)) {
                    fVar39 = _DAT_146e78520;
                  }
                }
              }
              else if (iVar33 < 0x1c65) {
                if (iVar33 < 0x1a85) {
                  fVar39 = _DAT_145d70c74;
                  if (iVar33 != 0x13fc) {
                    if (iVar33 == 0x1438) goto LAB_145906953;
                    fVar39 = fVar47;
                    if (iVar33 == 0x18d1) goto LAB_1459068e6;
                  }
                }
                else if (iVar33 == 0x1a85) {
LAB_1459068e6:
                  fVar39 = _DAT_145db7ca4;
                }
                else {
                  fVar39 = _DAT_145d70c74;
                  if ((iVar33 != 0x1b05) && (fVar39 = fVar47, iVar33 == 0x1b54)) goto LAB_1459068d9;
                }
              }
              else if (iVar33 < 0x4bea) {
                if (iVar33 == 0x1c65) {
LAB_145906953:
                  fVar39 = _DAT_145d6d890;
                }
                else {
                  if (iVar33 == 0x27c5) goto LAB_145906b1e;
                  if (iVar33 == 0x2c66) goto LAB_1459068e6;
                }
              }
              else {
                fVar39 = _DAT_145d70c74;
                if (((iVar33 != 0x4bea) && (fVar39 = _DAT_146e78460, iVar33 != 0x5ed3)) &&
                   (fVar39 = fVar47, iVar33 == 0x6af7)) goto LAB_145906953;
              }
              uVar21 = fVar37 < fVar38;
              fVar50 = (float)uVar51 - *(float *)(unaff_RBP + 0x360);
              fVar49 = (float)((ulong)uVar51 >> 0x20) - fVar49;
              lVar9 = *(long *)(unaff_RBP + 0x378);
              fVar49 = SQRT(fVar49 * fVar49 + fVar50 * fVar50) / fVar39 + *(float *)(lVar9 + 0x9ec);
              cVar23 = *(char *)(lVar28 + 0x38);
              bVar32 = cVar23 == '\x04';
              lVar28 = *(long *)(lVar9 + 0x598);
              if (lVar28 == *(long *)(lVar9 + 0x588)) {
                *(char *)(unaff_RBP + 0x387) = (char)*(undefined4 *)(unaff_RBP + 0x370);
                *(byte *)(unaff_RBP + 0x40) = bVar32;
                *(int *)(unaff_RBP + 0x360) = iVar33;
                *(float *)(unaff_RBP + 0x2a0) = fVar37;
                *(undefined4 *)(unaff_RBP + 0x2a4) = 0;
                *(undefined4 *)(unaff_RBP + 0x2a8) = 0;
                *(undefined4 *)(unaff_RBP + 0x2ac) = 0;
                *(undefined1 *)(unaff_RBP + 0x88) = uVar21;
                *(char *)(unaff_RBP + 0x58) = cVar23;
                func_0x000145bce850();
                bVar32 = *(byte *)(unaff_RBP + 0x40);
                cVar23 = *(char *)(unaff_RBP + 0x58);
                uVar21 = *(undefined1 *)(unaff_RBP + 0x88);
                fVar37 = *(float *)(unaff_RBP + 0x2a0);
                iVar33 = *(int *)(unaff_RBP + 0x360);
              }
              lVar9 = *(long *)(unaff_RBP + 0x378);
              lVar13 = *(long *)(lVar9 + 0x590);
              lVar15 = lVar28 * 0x80;
              *(undefined8 *)(lVar13 + lVar15) = 0;
              *(undefined4 *)(lVar13 + 0x10 + lVar15) = 0;
              *(undefined1 *)(lVar13 + 0x48 + lVar15) = 2;
              *(long *)(lVar13 + 0x50 + lVar15) = lVar12;
              *(undefined8 *)(lVar13 + 0x58 + lVar15) = uVar36;
              *(uint *)(lVar13 + 0x60 + lVar15) = (uint)bVar32;
              *(undefined8 *)(lVar13 + 100 + lVar15) = _DAT_146e78530;
              *(float *)(lVar13 + 0x6c + lVar15) = fVar49;
              *(int *)(lVar13 + 0x70 + lVar15) = iVar33;
              *(uint *)(lVar13 + 0x74 + lVar15) =
                   -(uint)(fVar37 < fVar38) & (uint)fVar52 |
                   ~-(uint)(fVar37 < fVar38) & (uint)fVar35;
              *(undefined1 *)(lVar13 + 0x78 + lVar15) = uVar21;
              *(undefined2 *)(lVar13 + 0x79 + lVar15) = 0;
              *(char *)(lVar13 + 0x7b + lVar15) = cVar23;
              *(long *)(lVar9 + 0x598) = lVar28 + 1;
              goto LAB_145906c8c;
            }
            *(undefined8 *)(unaff_RBP + 0xa0) = 0x146e7ab10;
            *(undefined8 *)(unaff_RBP + 0xa8) = 9;
            *(undefined8 *)(unaff_RBP + 0xb0) = 0;
            *(undefined1 *)(unaff_RBP + 200) = 0;
            *(char *)(unaff_RBP + 0x387) = (char)*(undefined4 *)(unaff_RBP + 0x370);
            func_0x000145951440();
            uVar25 = *(ulong *)(*(long *)(unaff_RBP + 0x378) + 0x780);
            if (uVar25 == 0) goto LAB_145906c8c;
            lVar12 = *(long *)(*(long *)(unaff_RBP + 0x378) + 0x778);
            fVar49 = _DAT_145d70c70;
            if (uVar25 == 1) {
              uVar14 = 0;
LAB_145906056:
              if (*(char *)(lVar12 + uVar14 * 8) == '\x1f') {
                fVar49 = fVar49 + *(float *)(lVar12 + 4 + uVar14 * 8);
              }
            }
            else {
              uVar14 = 0;
              do {
                if (*(char *)(lVar12 + uVar14 * 8) == '\x1f') {
                  fVar49 = fVar49 + *(float *)(lVar12 + 4 + uVar14 * 8);
                  cVar23 = *(char *)(lVar12 + 8 + uVar14 * 8);
                }
                else {
                  cVar23 = *(char *)(lVar12 + 8 + uVar14 * 8);
                }
                if (cVar23 == '\x1f') {
                  fVar49 = fVar49 + *(float *)(lVar12 + 0xc + uVar14 * 8);
                }
                uVar14 = uVar14 + 2;
              } while ((uVar25 & 0xfffffffffffffffe) != uVar14);
              if ((uVar25 & 1) != 0) goto LAB_145906056;
            }
            if (fVar46 < fVar49) {
              lVar12 = *(long *)(unaff_RBP + 0x378);
              uVar14 = *(ulong *)(lVar12 + 0x958);
              uVar18 = *(ulong *)(lVar12 + 0x960);
              uVar25 = *(ulong *)(lVar12 + 0x970) + uVar14;
              uVar26 = *(ulong *)(lVar12 + 0x968) ^ uVar14;
              uVar11 = *(ulong *)(lVar12 + 0x970) ^ uVar18;
              *(ulong *)(lVar12 + 0x960) = uVar18 ^ uVar26;
              *(ulong *)(lVar12 + 0x958) = uVar14 ^ uVar11;
              *(ulong *)(lVar12 + 0x968) = uVar26 ^ uVar18 << 0x11;
              *(ulong *)(lVar12 + 0x970) = uVar11 << 0x2d | uVar11 >> 0x13;
              if ((float)(uint)((uVar25 * 0x800000 | uVar25 >> 0x29) + uVar14 >> 0x28) *
                  _DAT_145e4cdf4 < fVar49) {
                *(undefined8 *)(unaff_RBP + 0xa0) = 0x146e7a8bf;
                *(undefined8 *)(unaff_RBP + 0xa8) = 0xe;
                *(undefined8 *)(unaff_RBP + 0xb0) = 0;
                *(undefined1 *)(unaff_RBP + 200) = 0;
                *(char *)(unaff_RBP + 0x387) = (char)*(undefined4 *)(unaff_RBP + 0x370);
                func_0x000145951440();
              }
            }
            goto LAB_145906c8c;
          }
          *(char *)(unaff_RBP + 0x387) = (char)*(undefined4 *)(unaff_RBP + 0x370);
          func_0x00014594ff00();
          uVar25 = *(ulong *)(*(long *)(unaff_RBP + 0x378) + 0x780);
          if (uVar25 == 0) goto LAB_145906c8c;
          lVar12 = *(long *)(*(long *)(unaff_RBP + 0x378) + 0x778);
          fVar49 = _DAT_145d70c70;
          if (uVar25 == 1) {
            uVar14 = 0;
LAB_145905f56:
            if (*(char *)(lVar12 + uVar14 * 8) == '\x1f') {
              fVar49 = fVar49 + *(float *)(lVar12 + 4 + uVar14 * 8);
            }
          }
          else {
            uVar14 = 0;
            do {
              if (*(char *)(lVar12 + uVar14 * 8) == '\x1f') {
                fVar49 = fVar49 + *(float *)(lVar12 + 4 + uVar14 * 8);
                cVar23 = *(char *)(lVar12 + 8 + uVar14 * 8);
              }
              else {
                cVar23 = *(char *)(lVar12 + 8 + uVar14 * 8);
              }
              if (cVar23 == '\x1f') {
                fVar49 = fVar49 + *(float *)(lVar12 + 0xc + uVar14 * 8);
              }
              uVar14 = uVar14 + 2;
            } while ((uVar25 & 0xfffffffffffffffe) != uVar14);
            if ((uVar25 & 1) != 0) goto LAB_145905f56;
          }
          if (fVar46 < fVar49) {
            lVar12 = *(long *)(unaff_RBP + 0x378);
            uVar14 = *(ulong *)(lVar12 + 0x958);
            uVar18 = *(ulong *)(lVar12 + 0x960);
            uVar25 = *(ulong *)(lVar12 + 0x970) + uVar14;
            uVar26 = *(ulong *)(lVar12 + 0x968) ^ uVar14;
            uVar11 = *(ulong *)(lVar12 + 0x970) ^ uVar18;
            *(ulong *)(lVar12 + 0x960) = uVar18 ^ uVar26;
            *(ulong *)(lVar12 + 0x958) = uVar14 ^ uVar11;
            *(ulong *)(lVar12 + 0x968) = uVar26 ^ uVar18 << 0x11;
            *(ulong *)(lVar12 + 0x970) = uVar11 << 0x2d | uVar11 >> 0x13;
            if ((float)(uint)((uVar25 * 0x800000 | uVar25 >> 0x29) + uVar14 >> 0x28) *
                _DAT_145e4cdf4 < fVar49) {
              *(char *)(unaff_RBP + 0x387) = (char)*(undefined4 *)(unaff_RBP + 0x370);
              func_0x00014594ff00();
            }
          }
        }
      }
    }
LAB_145906c8c:
    if ((uVar27 < *(ulong *)(*(long *)(unaff_RBP + 0x378) + 0xd8)) &&
       (lVar12 = *(long *)(*(long *)(unaff_RBP + 0x378) + 0xd0),
       *(char *)(*(long *)(lVar12 + 0x18 + lVar30) + 0x39) != '\0')) {
      lVar12 = lVar12 + lVar30;
      fVar49 = *(float *)(lVar12 + 0x60);
      pfVar4 = (float *)(*(long *)(unaff_RBP + 0x378) + 0x9ec);
      if (*pfVar4 <= fVar49 && fVar49 != *pfVar4) {
        fVar39 = *(float *)(lVar12 + 100);
        fVar37 = fVar39;
        if (fVar49 <= fVar39) {
          fVar37 = fVar49;
        }
        *(uint *)(lVar12 + 100) =
             -(uint)NAN(fVar37) & (uint)fVar39 | ~-(uint)NAN(fVar37) & (uint)fVar37;
      }
    }
  } while( true );
  uVar18 = uVar18 + 1;
  if (uVar14 == uVar18) goto LAB_145905c9c;
  goto LAB_145905a90;
LAB_14590681d:
  lVar12 = lVar12 + 0x68;
  if (*(long *)(lVar9 + 800) * 0x68 - lVar12 == 0) goto LAB_145906fe5;
  goto LAB_14590682a;
}
