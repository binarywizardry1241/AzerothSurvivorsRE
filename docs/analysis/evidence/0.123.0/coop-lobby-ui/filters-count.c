
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 *
FUN_140287190(undefined8 param_1,undefined8 param_2,char *param_3,undefined8 *param_4,long *param_5)

{
  code *pcVar1;
  undefined4 uVar2;
  int iVar3;
  long lVar4;
  long lVar5;
  ulong uVar6;
  long lVar7;
  long extraout_RDX;
  long *plVar8;
  ulong uVar9;
  char cVar10;
  ulong uVar11;
  ulong uVar12;
  ulong uVar13;
  char *pcVar14;
  undefined8 *puVar15;
  long lVar16;
  byte bVar17;
  undefined1 auVar18 [16];
  undefined8 uStack_1f8;
  long **pplStack_1f0;
  undefined8 uStack_1e8;
  undefined8 uStack_1c8;
  undefined8 uStack_1c0;
  undefined8 uStack_1b8;
  undefined4 uStack_1b0;
  undefined4 uStack_1ac;
  undefined4 uStack_1a8;
  undefined4 uStack_1a4;
  undefined8 uStack_1a0;
  undefined1 uStack_195;
  undefined7 uStack_194;
  undefined1 uStack_18d;
  undefined4 uStack_18c;
  undefined4 uStack_188;
  undefined4 uStack_184;
  ulong uStack_180;
  long *plStack_178;
  undefined8 uStack_170;
  ulong *puStack_168;
  undefined8 uStack_160;
  undefined8 uStack_158;
  undefined8 uStack_150;
  ulong *puStack_148;
  undefined8 uStack_140;
  ulong uStack_138;
  undefined8 *puStack_130;
  undefined8 uStack_128;
  undefined8 uStack_120;
  long **pplStack_118;
  undefined8 uStack_110;
  undefined8 uStack_108;
  undefined8 uStack_100;
  undefined8 uStack_f8;
  undefined1 uStack_f0;
  undefined4 uStack_ef;
  undefined3 uStack_eb;
  long *plStack_e8;
  undefined8 *puStack_e0;
  undefined4 uStack_d8;
  undefined2 uStack_d4;
  undefined1 uStack_d2;
  undefined8 uStack_d1;
  undefined5 uStack_c9;
  undefined3 uStack_c4;
  undefined5 uStack_c1;
  undefined8 uStack_bc;
  undefined8 uStack_b4;
  undefined4 uStack_ac;
  undefined8 uStack_a8;
  long lStack_a0;
  long lStack_98;
  long lStack_90;
  long lStack_88;
  long lStack_80;
  long lStack_78;
  long lStack_70;
  undefined4 uStack_68;
  undefined3 uStack_64;
  char *pcStack_60;
  ulong uStack_58;
  char cStack_49;
  undefined8 uStack_48;
  
  uStack_48 = 0xfffffffffffffffe;
  uStack_1c8 = *param_4;
  uStack_1a0 = param_4[5];
  uStack_1c0 = param_4[1];
  uStack_1b8 = param_4[2];
  uStack_1b0 = *(undefined4 *)(param_4 + 3);
  uStack_1ac = *(undefined4 *)((long)param_4 + 0x1c);
  uStack_1a8 = *(undefined4 *)(param_4 + 4);
  uStack_1a4 = *(undefined4 *)((long)param_4 + 0x24);
  uStack_128._0_1_ = 10;
  puStack_130 = param_4;
  func_0x000145bbfea0(param_1,param_3,8,0x146211c07);
  cStack_49 = *(char *)((long)param_5 + 0x16e);
  func_0x000140148ec0();
  uStack_128 = CONCAT71(uStack_128._1_7_,0xb);
  func_0x000145bbfea0();
  cVar10 = *(char *)((long)param_5 + 0x16f);
  pcStack_60 = param_3;
  func_0x000140148ec0();
  lVar7 = param_5[0x29];
  if (lVar7 == -1) {
    func_0x000145bbfea0();
    if (extraout_RDX < 0) {
LAB_140287318:
      func_0x0001461add5b();
                    /* WARNING: Does not return */
      pcVar1 = (code *)invalidInstructionException();
      (*pcVar1)();
    }
    lStack_80 = extraout_RDX;
    lStack_70 = extraout_RDX;
    if (extraout_RDX == 0) {
      lStack_78 = 1;
    }
    else {
      func_0x000140002200();
      lVar4 = func_0x0001400021c0();
      if (lVar4 == 0) goto LAB_140287318;
      func_0x00014600504b();
      lStack_78 = lVar4;
    }
  }
  else {
    plStack_178 = param_5 + 0x29;
    func_0x000145bbfea0();
    uStack_128 = 0x14620e090;
    uStack_120 = 4;
    pplStack_118 = &plStack_178;
    uStack_110 = 0x146211c30;
    func_0x000145bc0330();
  }
  uStack_128 = CONCAT71(uStack_128._1_7_,0xc);
  func_0x000140148ec0();
  lVar4 = *param_5;
  if (lVar4 == 1) {
    func_0x000145bbfea0();
    func_0x000145be05d0();
    func_0x000145be05e0();
    uStack_128 = 0x146211ba7;
    uStack_120 = 10;
    uStack_110 = 0x14620e070;
    pplStack_118 = &plStack_178;
    func_0x000145bc0330();
    if (plStack_178 != (long *)0x0) {
      func_0x0001400021d0();
    }
  }
  else {
    auVar18 = func_0x000145bbfea0();
    lVar16 = auVar18._8_8_;
    if (lVar16 < 0) {
LAB_14028747f:
      func_0x0001461add5b();
      goto LAB_140287c15;
    }
    if (lVar16 == 0) {
      lStack_98 = 1;
      lStack_a0 = lVar16;
      lStack_90 = lVar16;
    }
    else {
      uStack_58 = auVar18._0_8_;
      func_0x000140002200();
      lVar5 = func_0x0001400021c0();
      if (lVar5 == 0) goto LAB_14028747f;
      func_0x00014600504b();
      lStack_a0 = lVar16;
      lStack_98 = lVar5;
      lStack_90 = lVar16;
    }
  }
  uStack_128 = CONCAT71(uStack_128._1_7_,0xd);
  lStack_88 = lStack_98;
  func_0x000140148ec0();
  uVar11 = param_5[0x10];
  uStack_58 = uVar11;
  if (uVar11 == 0) {
    uVar9 = 0;
  }
  else {
    lVar16 = param_5[0xf];
    bVar17 = (byte)lVar4 ^ 1;
    lVar4 = param_5[1];
    if (lVar7 == -1) {
      if (cStack_49 == '\0') {
        if (cVar10 != '\0') {
          if (uVar11 == 1) {
            uVar6 = 0;
            uVar9 = 0;
          }
          else {
            pcVar14 = (char *)(lVar16 + 0x249);
            uVar6 = 0;
            uVar9 = 0;
            do {
              if (pcVar14[-0x128] == '\0') {
                uVar12 = (ulong)(lVar4 == *(long *)(pcVar14 + -0x141) | bVar17);
                if (*pcVar14 != '\0') goto LAB_140287897;
LAB_140287840:
                uVar13 = (ulong)(lVar4 == *(long *)(pcVar14 + -0x19) | bVar17);
              }
              else {
                uVar12 = 0;
                if (*pcVar14 == '\0') goto LAB_140287840;
LAB_140287897:
                uVar13 = 0;
              }
              uVar9 = uVar9 + uVar12 + uVar13;
              uVar6 = uVar6 + 2;
              pcVar14 = pcVar14 + 0x250;
            } while ((uVar11 & 0xfffffffffffffffe) != uVar6);
            if ((uVar11 & 1) == 0) goto LAB_140287a05;
          }
          lVar7 = uVar6 * 0x128;
          if (*(char *)(lVar16 + 0x121 + lVar7) == '\0') goto LAB_1402879d1;
          goto LAB_140287a00;
        }
        if (uVar11 == 1) {
          uVar6 = 0;
          uVar9 = 0;
        }
        else {
          plVar8 = (long *)(lVar16 + 0x230);
          uVar6 = 0;
          uVar9 = 0;
          do {
            uVar9 = (ulong)(lVar4 == *plVar8 | bVar17) + (lVar4 == plVar8[-0x25] | bVar17) + uVar9;
            uVar6 = uVar6 + 2;
            plVar8 = plVar8 + 0x4a;
          } while ((uVar11 & 0xfffffffffffffffe) != uVar6);
          if ((uVar11 & 1) == 0) goto LAB_140287a05;
        }
        uVar9 = (bVar17 | lVar4 == *(long *)(lVar16 + 0x108 + uVar6 * 0x128)) + uVar9;
      }
      else {
        if (cVar10 == '\0') {
          if (uVar11 == 1) {
            uVar6 = 0;
            uVar9 = 0;
          }
          else {
            pcVar14 = (char *)(lVar16 + 0x248);
            uVar6 = 0;
            uVar9 = 0;
            do {
              if (pcVar14[-0x128] == '\x01') {
                uVar12 = (ulong)(lVar4 == *(long *)(pcVar14 + -0x140) | bVar17);
                if (*pcVar14 == '\x01') goto LAB_1402878c0;
LAB_140287918:
                uVar13 = 0;
              }
              else {
                uVar12 = 0;
                if (*pcVar14 != '\x01') goto LAB_140287918;
LAB_1402878c0:
                uVar13 = (ulong)(lVar4 == *(long *)(pcVar14 + -0x18) | bVar17);
              }
              uVar9 = uVar9 + uVar12 + uVar13;
              uVar6 = uVar6 + 2;
              pcVar14 = pcVar14 + 0x250;
            } while ((uVar11 & 0xfffffffffffffffe) != uVar6);
            if ((uVar11 & 1) == 0) goto LAB_140287a05;
          }
          lVar7 = uVar6 * 0x128;
          if (*(char *)(lVar16 + 0x120 + lVar7) == '\x01') {
LAB_1402879d1:
            lVar16 = lVar16 + lVar7;
            goto LAB_1402879d4;
          }
LAB_140287a00:
          uVar11 = 0;
        }
        else {
          if (uVar11 == 1) {
            uVar6 = 0;
            uVar9 = 0;
          }
          else {
            pcVar14 = (char *)(lVar16 + 0x249);
            uVar6 = 0;
            uVar9 = 0;
            do {
              if ((pcVar14[-0x129] == '\x01') && (pcVar14[-0x128] == '\0')) {
                uVar12 = (ulong)(lVar4 == *(long *)(pcVar14 + -0x141) | bVar17);
                if (pcVar14[-1] != '\x01') goto LAB_1402877c0;
LAB_140287812:
                if (*pcVar14 != '\0') goto LAB_1402877c0;
                uVar13 = (ulong)(lVar4 == *(long *)(pcVar14 + -0x19) | bVar17);
              }
              else {
                uVar12 = 0;
                if (pcVar14[-1] == '\x01') goto LAB_140287812;
LAB_1402877c0:
                uVar13 = 0;
              }
              uVar9 = uVar9 + uVar12 + uVar13;
              uVar6 = uVar6 + 2;
              pcVar14 = pcVar14 + 0x250;
            } while ((uVar11 & 0xfffffffffffffffe) != uVar6);
            if ((uVar11 & 1) == 0) goto LAB_140287a05;
          }
          if ((*(char *)(lVar16 + 0x120 + uVar6 * 0x128) != '\x01') ||
             (lVar16 = lVar16 + uVar6 * 0x128, *(char *)(lVar16 + 0x121) != '\0'))
          goto LAB_140287a00;
LAB_1402879d4:
          uVar11 = (ulong)(bVar17 | lVar4 == *(long *)(lVar16 + 0x108));
        }
        uVar9 = uVar9 + uVar11;
      }
    }
    else {
      lVar7 = param_5[0x2b];
      lVar5 = param_5[0x2a];
      if (cStack_49 == '\0') {
        puVar15 = (undefined8 *)(lVar16 + 0x98);
        uVar9 = 0;
        if (cVar10 == '\0') {
          do {
            while ((lVar7 != puVar15[1] ||
                   (iVar3 = func_0x000146005051(uVar11,uVar9,*puVar15,lVar5,lVar7), iVar3 != 0))) {
              puVar15 = puVar15 + 0x25;
              uVar11 = uVar11 - 1;
              if (uVar11 == 0) goto LAB_140287a05;
            }
            uVar9 = uVar9 + (lVar4 == puVar15[0xe] | bVar17);
            puVar15 = puVar15 + 0x25;
            uVar11 = uVar11 - 1;
          } while (uVar11 != 0);
        }
        else {
          do {
            while (((*(char *)((long)puVar15 + 0x89) != '\0' || (lVar7 != puVar15[1])) ||
                   (iVar3 = func_0x000146005051(uVar11,uVar9,*puVar15,lVar5,lVar7), iVar3 != 0))) {
              puVar15 = puVar15 + 0x25;
              uVar11 = uVar11 - 1;
              if (uVar11 == 0) goto LAB_140287a05;
            }
            uVar9 = uVar9 + (lVar4 == puVar15[0xe] | bVar17);
            puVar15 = puVar15 + 0x25;
            uVar11 = uVar11 - 1;
          } while (uVar11 != 0);
        }
      }
      else if (cVar10 == '\0') {
        puVar15 = (undefined8 *)(lVar16 + 0x98);
        uVar9 = 0;
        do {
          while (((*(char *)(puVar15 + 0x11) != '\x01' || (lVar7 != puVar15[1])) ||
                 (iVar3 = func_0x000146005051(uVar11,uVar9,*puVar15,lVar5,lVar7), iVar3 != 0))) {
            puVar15 = puVar15 + 0x25;
            uVar11 = uVar11 - 1;
            if (uVar11 == 0) goto LAB_140287a05;
          }
          uVar9 = uVar9 + (lVar4 == puVar15[0xe] | bVar17);
          puVar15 = puVar15 + 0x25;
          uVar11 = uVar11 - 1;
        } while (uVar11 != 0);
      }
      else {
        pcVar14 = (char *)(lVar16 + 0x121);
        uVar9 = 0;
        do {
          if (((pcVar14[-1] == '\x01') && (*pcVar14 == '\0')) &&
             ((lVar7 == *(long *)(pcVar14 + -0x81) &&
              (iVar3 = func_0x000146005051(uVar11,uVar9,*(undefined8 *)(pcVar14 + -0x89),lVar5,lVar7
                                          ), iVar3 == 0)))) {
            uVar6 = (ulong)(lVar4 == *(long *)(pcVar14 + -0x19) | bVar17);
          }
          else {
            uVar6 = 0;
          }
          uVar9 = uVar9 + uVar6;
          pcVar14 = pcVar14 + 0x128;
          uVar11 = uVar11 - 1;
        } while (uVar11 != 0);
      }
    }
  }
LAB_140287a05:
  uStack_138 = uVar9;
  if (uVar9 < uStack_58) {
    uVar11 = uStack_58;
    func_0x000145bbfea0(uStack_58,uVar9,0x16,0x146211c77);
    plStack_178 = (long *)0x146211c8d;
    uStack_170 = 5;
    puStack_168 = &uStack_138;
    uStack_160 = 0x14620ddd8;
    uStack_158 = 0x14620ddfc;
    uStack_150 = 3;
    puStack_148 = &uStack_180;
    uStack_140 = 0x14620ddd8;
    puVar15 = &uStack_1f8;
    uStack_180 = uVar11;
    func_0x000145bc0330();
    if (*pcStack_60 == '\x01') {
      uStack_68 = *(undefined4 *)(pcStack_60 + 1);
      uStack_64 = (undefined3)((uint)*(undefined4 *)(pcStack_60 + 4) >> 8);
      plStack_e8 = *(long **)(pcStack_60 + 8);
      puVar15 = (undefined8 *)(ulong)(byte)pcStack_60[0x10];
      uStack_f0 = 1;
    }
    else {
      plStack_e8 = *(long **)(pcStack_60 + 8);
      LOCK();
      lVar7 = *plStack_e8;
      *plStack_e8 = *plStack_e8 + 1;
      UNLOCK();
      if (*plStack_e8 == 0 || SCARRY8(lVar7,1) != *plStack_e8 < 0) {
LAB_140287c15:
                    /* WARNING: Does not return */
        pcVar1 = (code *)invalidInstructionException();
        (*pcVar1)();
      }
      uStack_f0 = 0;
    }
    uStack_110 = uStack_1e8;
    uStack_120 = uStack_1f8;
    pplStack_118 = pplStack_1f0;
    uStack_194 = (undefined7)_DAT_14620dcdc;
    uStack_18d = (undefined1)((ulong)_DAT_14620dcdc >> 0x38);
    uStack_18c = (undefined4)uRam000000014620dce4;
    uStack_188 = (undefined4)((ulong)uRam000000014620dce4 >> 0x20);
    uVar2 = uStack_188;
    uStack_184 = 0x3f800000;
    uStack_108 = 0;
    uStack_100 = 4;
    uStack_f8 = 0;
    uStack_ef = uStack_68;
    uStack_eb = uStack_64;
    uStack_d8 = 0x41500000;
    uStack_d4 = 400;
    uStack_d2 = 1;
    uStack_c1 = (undefined5)(CONCAT44(0x3f800000,uStack_188) >> 0x18);
    uStack_d1 = CONCAT71(uStack_194,uStack_195);
    uStack_c9 = CONCAT41(uStack_18c,uStack_18d);
    uStack_188._0_3_ = (undefined3)((ulong)uRam000000014620dce4 >> 0x20);
    uStack_c4 = (undefined3)uStack_188;
    uStack_ac = _DAT_1461c42a0;
    uStack_bc = _DAT_1461c4290;
    uStack_b4 = uRam00000001461c4298;
    uStack_a8 = _DAT_1461b24f0;
    uStack_128 = uStack_1c8;
    uStack_188 = uVar2;
    puStack_e0 = puVar15;
    func_0x00014025a890();
  }
  if (lStack_a0 != 0) {
    func_0x0001400021d0();
  }
  if (lStack_80 != 0) {
    func_0x0001400021d0();
  }
  return puStack_130;
}

