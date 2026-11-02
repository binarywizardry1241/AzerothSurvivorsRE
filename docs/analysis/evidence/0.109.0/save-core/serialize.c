/* WARNING: Type propagation algorithm not settling */

void FUN_1458a4340(undefined8 param_1,undefined8 param_2,long *******param_3,long *param_4)

{
  char *pcVar1;
  undefined1 uVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  int iVar10;
  long *****ppppplVar11;
  code *pcVar12;
  long *****ppppplVar13;
  long *******ppppppplVar14;
  undefined1 *puVar15;
  long ******pppppplVar16;
  long ******pppppplVar17;
  char cVar18;
  long *******ppppppplVar19;
  long *******ppppppplVar20;
  long ******pppppplVar21;
  long *******ppppppplVar22;
  long lVar23;
  undefined1 *puVar24;
  long ******pppppplVar25;
  ulong uVar26;
  long *******ppppppplVar27;
  long *******ppppppplVar28;
  long ******pppppplStack_190;
  long ******pppppplStack_188;
  long *******ppppppplStack_180;
  ulong uStack_178;
  long *******ppppppplStack_170;
  long *******ppppppplStack_168;
  long *******ppppppplStack_160;
  long *******ppppppplStack_158;
  undefined1 *puStack_150;
  long *******ppppppplStack_148;
  undefined1 *puStack_140;
  long *******ppppppplStack_138;
  undefined1 *puStack_130;
  long *******ppppppplStack_128;
  undefined1 *puStack_120;
  long *******ppppppplStack_118;
  undefined1 *puStack_110;
  long *******ppppppplStack_108;
  undefined1 *puStack_100;
  undefined1 *puStack_f8;
  undefined8 uStack_f0;
  long *******ppppppplStack_e8;
  undefined8 uStack_e0;
  undefined1 *puStack_d8;
  undefined8 uStack_d0;
  long *******ppppppplStack_c8;
  long *******ppppppplStack_c0;
  ulong uStack_b8;
  long *******ppppppplStack_b0;
  long *******ppppppplStack_a8;
  long *******ppppppplStack_a0;
  long *******ppppppplStack_98;
  long *******ppppppplStack_88;
  long *******ppppppplStack_80;
  long *******ppppppplStack_78;
  long lStack_70;
  long lStack_68;
  long lStack_60;
  long *******ppppppplStack_58;
  long *******ppppppplStack_50;
  undefined8 uStack_48;

  uStack_48 = 0xfffffffffffffffe;
  lStack_70 = 0;
  lStack_68 = 1;
  lStack_60 = 0;
  ppppppplVar14 = (long *******)param_3[1];
  pppppplVar21 = param_3[2];
  ppppppplVar19 = ppppppplVar14;
  ppppppplStack_b0 = param_3;
  while (ppppppplVar19 != ppppppplVar14 + (long)pppppplVar21 * 7) {
    ppppppplVar22 = ppppppplVar19 + 7;
    func_0x0001459c8eb0();
    uVar26 = uStack_b8;
    ppppppplVar20 = ppppppplStack_c0;
    func_0x00014588ad20();
    ppppppplStack_128 = (long *******)((long)ppppppplVar19 + 0x32);
    ppppppplStack_138 = (long *******)((long)ppppppplVar19 + 0x31);
    ppppppplStack_148 = ppppppplVar19 + 6;
    ppppppplStack_78 = ppppppplStack_158;
    ppppppplStack_88 = ppppppplStack_168;
    ppppppplStack_80 = ppppppplStack_160;
    ppppppplStack_108 = ppppppplVar19 + 4;
    puStack_f8 = (undefined1 *)((long)ppppppplVar19 + 0x24);
    ppppppplStack_e8 = ppppppplVar19 + 5;
    ppppppplStack_160 = (long *******)0x145bdf7d0;
    puStack_d8 = (undefined1 *)((long)ppppppplVar19 + 0x2c);
    puStack_150 = &DAT_1400020e0;
    puStack_140 = (undefined1 *)0x145bdb210;
    puStack_130 = (undefined1 *)0x145bdb210;
    puStack_120 = (undefined1 *)0x145bdb210;
    ppppppplStack_118 = (long *******)&ppppppplStack_88;
    puStack_110 = &DAT_1400020e0;
    puStack_100 = (undefined1 *)0x145bde8e0;
    uStack_f0 = 0x145bde8e0;
    uStack_e0 = 0x145bde8e0;
    uStack_d0 = 0x145bde8e0;
    ppppppplStack_168 = ppppppplVar19 + 3;
    ppppppplStack_158 = ppppppplVar19;
    func_0x000145bcce30();
    if (ppppppplStack_88 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    ppppppplStack_58 = ppppppplStack_a8;
    ppppppplStack_50 = ppppppplStack_a0;
    ppppppplVar19 = ppppppplStack_98;
    if ((long *******)(lStack_70 - lStack_60) < ppppppplStack_98) {
      func_0x000145bfa970();
LAB_1458a452b:
      func_0x000145bfa0e7();
    }
    else if (ppppppplStack_98 != (long *******)0x0) goto LAB_1458a452b;
    lStack_60 = lStack_60 + (long)ppppppplVar19;
    if (ppppppplStack_58 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    if (uVar26 != 0) {
      ppppppplVar20 = ppppppplVar20 + 1;
      do {
        if (ppppppplVar20[-1] != (long ******)0x0) {
          func_0x0001400021d0();
        }
        ppppppplVar20 = ppppppplVar20 + 3;
        uVar26 = uVar26 - 1;
      } while (uVar26 != 0);
    }
    ppppppplVar19 = ppppppplVar22;
    if (ppppppplStack_c8 != (long *******)0x0) {
      func_0x0001400021d0();
    }
  }
  ppppppplVar14 = ppppppplStack_b0;
  if (ppppppplStack_b0[0x2a] != (long ******)0xffffffffffffffff) {
    func_0x0001459c8eb0();
    ppppppplVar19 = ppppppplStack_c0;
    uVar26 = uStack_b8;
    func_0x00014588ad20(uStack_b8,ppppppplStack_c0,ppppppplStack_c0,&ppppppplStack_168,uStack_b8,
                        0x146beb4d4);
    ppppppplVar14 = ppppppplStack_b0;
    ppppppplStack_98 = ppppppplStack_158;
    ppppppplStack_a8 = ppppppplStack_168;
    ppppppplStack_a0 = ppppppplStack_160;
    func_0x00014590e510();
    ppppppplStack_128 = ppppppplVar14 + 0x2a;
    ppppppplStack_168 = ppppppplVar14 + 0x31;
    ppppppplStack_158 = (long *******)((long)ppppppplVar14 + 0x189);
    ppppppplStack_148 = (long *******)((long)ppppppplVar14 + 0x18a);
    ppppppplStack_138 = ppppppplVar14 + 0x2d;
    ppppppplStack_160 = (long *******)0x145bdb210;
    puStack_150 = (undefined1 *)0x145bdb210;
    puStack_140 = (undefined1 *)0x145bdb210;
    puStack_130 = &DAT_1400020e0;
    puStack_120 = &DAT_1400020e0;
    ppppppplStack_118 = (long *******)&ppppppplStack_a8;
    puStack_110 = &DAT_1400020e0;
    puStack_100 = &DAT_1400020e0;
    ppppppplStack_108 = (long *******)&ppppppplStack_88;
    func_0x000145bcce30();
    if (ppppppplStack_88 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    if (ppppppplStack_a8 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    if (uVar26 != 0) {
      ppppppplVar19 = ppppppplVar19 + 1;
      do {
        if (ppppppplVar19[-1] != (long ******)0x0) {
          func_0x0001400021d0();
        }
        ppppppplVar19 = ppppppplVar19 + 3;
        uVar26 = uVar26 - 1;
      } while (uVar26 != 0);
    }
    if (ppppppplStack_c8 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    if ((ulong)(lStack_70 - lStack_60) < uStack_178) {
      ppppppplStack_50 = ppppppplStack_180;
      func_0x000145bfa970();
LAB_1458a47db:
      func_0x000145bfa0e7();
    }
    else if (uStack_178 != 0) goto LAB_1458a47db;
    lStack_60 = lStack_60 + uStack_178;
    if (pppppplStack_188 != (long ******)0x0) {
      func_0x0001400021d0();
    }
  }
  pppppplVar21 = ppppppplVar14[4];
  pppppplVar16 = pppppplVar21 + (long)ppppppplVar14[5] * 2;
  for (; pppppplVar21 != pppppplVar16; pppppplVar21 = pppppplVar21 + 2) {
    ppppppplStack_a8 = (long *******)CONCAT71(ppppppplStack_a8._1_7_,*(undefined1 *)pppppplVar21);
    ppppplVar11 = pppppplVar21[1];
    ppppplVar13 = (long *****)0xc;
    if (ppppplVar11 < (long *****)0xc) {
      ppppplVar13 = ppppplVar11;
    }
    uVar26 = (long)ppppplVar13 - 1;
    if (ppppplVar11 == (long *****)0x0) {
      uVar26 = 0;
    }
    if (0xb < uVar26) {
      func_0x000145d99653();
      goto LAB_1458a681b;
    }
    ppppppplStack_158 = (long *******)(uVar26 * 0xf0 + 0x146bde398);
    ppppppplStack_168 = (long *******)&ppppppplStack_a8;
    ppppppplStack_160 = (long *******)0x145bdb210;
    puStack_150 = (undefined1 *)0x1400020c0;
    func_0x000145bcce30();
    ppppppplVar14 = ppppppplStack_78;
    ppppppplStack_58 = ppppppplStack_88;
    ppppppplStack_50 = ppppppplStack_80;
    if ((long *******)(lStack_70 - lStack_60) < ppppppplStack_78) {
      func_0x000145bfa970();
LAB_1458a4910:
      func_0x000145bfa0e7();
    }
    else if (ppppppplStack_78 != (long *******)0x0) goto LAB_1458a4910;
    lStack_60 = lStack_60 + (long)ppppppplVar14;
    if (ppppppplStack_58 != (long *******)0x0) {
      func_0x0001400021d0();
    }
  }
  ppppppplVar14 = ppppppplStack_b0;
  if (ppppppplStack_b0[8] != (long ******)0x0) {
    func_0x0001459c9080();
    ppppppplVar19 = ppppppplStack_a0;
    ppppppplVar22 = ppppppplStack_98;
    func_0x00014588ad20(ppppppplStack_98,ppppppplStack_a0,ppppppplStack_a0,&ppppppplStack_168,
                        ppppppplStack_98,0x146beb4d4);
    ppppppplStack_78 = ppppppplStack_158;
    ppppppplStack_88 = ppppppplStack_168;
    ppppppplStack_80 = ppppppplStack_160;
    ppppppplStack_c8 = (long *******)&ppppppplStack_88;
    ppppppplStack_c0 = (long *******)&DAT_1400020e0;
    func_0x000145bcce30();
    if (ppppppplStack_88 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    ppppppplVar14 = ppppppplStack_b0;
    ppppppplVar20 = ppppppplStack_158;
    if ((long *******)(lStack_70 - lStack_60) < ppppppplStack_158) {
      ppppppplStack_58 = ppppppplStack_160;
      ppppppplStack_50 = ppppppplStack_168;
      func_0x000145bfa970();
      ppppppplVar27 = ppppppplStack_50;
LAB_1458a4a76:
      func_0x000145bfa0e7();
    }
    else {
      ppppppplVar27 = ppppppplStack_168;
      if (ppppppplStack_158 != (long *******)0x0) goto LAB_1458a4a76;
    }
    lStack_60 = lStack_60 + (long)ppppppplVar20;
    if (ppppppplVar27 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    if (ppppppplVar22 != (long *******)0x0) {
      ppppppplVar19 = ppppppplVar19 + 1;
      do {
        if (ppppppplVar19[-1] != (long ******)0x0) {
          func_0x0001400021d0();
        }
        ppppppplVar19 = ppppppplVar19 + 3;
        ppppppplVar22 = (long *******)((long)ppppppplVar22 + -1);
      } while (ppppppplVar22 != (long *******)0x0);
    }
    if (ppppppplStack_a8 != (long *******)0x0) {
      func_0x0001400021d0();
    }
  }
  ppppppplVar19 = (long *******)ppppppplVar14[10];
  ppppppplStack_50 = ppppppplVar19 + (long)ppppppplVar14[0xb] * 0x1d;
  for (; ppppppplVar19 != ppppppplStack_50; ppppppplVar19 = ppppppplVar19 + 0x1d) {
    ppppppplVar22 = ppppppplVar19 + 0x13;
    ppppppplStack_160 = (long *******)((long)ppppppplVar19 + 0xe4);
    uVar2 = *(undefined1 *)((long)ppppppplVar19 + 0xe4);
    pppppplStack_188 = (long ******)0x146beb788;
    ppppppplStack_180 = (long *******)0x5;
    pppppplStack_190 = (long ******)CONCAT71(pppppplStack_190._1_7_,uVar2);
    ppppppplStack_158 = (long *******)0x0;
    ppppppplStack_168 = ppppppplVar22;
    func_0x0001459b8310();
    ppppppplVar20 = ppppppplStack_98;
    ppppppplVar14 = ppppppplStack_a0;
    func_0x00014588ad20();
    ppppppplStack_78 = ppppppplStack_158;
    ppppppplStack_88 = ppppppplStack_168;
    ppppppplStack_80 = ppppppplStack_160;
    ppppppplStack_168 = &pppppplStack_188;
    ppppppplStack_160 = (long *******)0x1400020c0;
    ppppppplStack_158 = &pppppplStack_190;
    puStack_150 = (undefined1 *)0x145bdb210;
    ppppppplStack_148 = (long *******)&ppppppplStack_88;
    puStack_140 = &DAT_1400020e0;
    func_0x000145bcce30();
    if (ppppppplStack_88 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    if (ppppppplVar20 != (long *******)0x0) {
      ppppppplVar14 = ppppppplVar14 + 1;
      do {
        if (ppppppplVar14[-1] != (long ******)0x0) {
          func_0x0001400021d0();
        }
        ppppppplVar14 = ppppppplVar14 + 3;
        ppppppplVar20 = (long *******)((long)ppppppplVar20 + -1);
      } while (ppppppplVar20 != (long *******)0x0);
    }
    if (ppppppplStack_a8 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    uVar26 = uStack_b8;
    if ((ulong)(lStack_70 - lStack_60) < uStack_b8) {
      ppppppplStack_58 = ppppppplStack_c0;
      func_0x000145bfa970();
LAB_1458a4ccf:
      func_0x000145bfa0e7();
    }
    else if (uStack_b8 != 0) goto LAB_1458a4ccf;
    lStack_60 = lStack_60 + uVar26;
    if (ppppppplStack_c8 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    pppppplStack_188 = (long ******)0x146beb78d;
    ppppppplStack_180 = (long *******)0x4;
    pppppplStack_190 = (long ******)CONCAT71(pppppplStack_190._1_7_,uVar2);
    ppppppplStack_158 = (long *******)0x0;
    ppppppplStack_168 = ppppppplVar19;
    ppppppplStack_160 = ppppppplVar22;
    func_0x0001459b8000();
    ppppppplVar20 = ppppppplStack_98;
    ppppppplVar22 = ppppppplStack_a0;
    func_0x00014588ad20();
    ppppppplStack_78 = ppppppplStack_158;
    ppppppplStack_88 = ppppppplStack_168;
    ppppppplStack_80 = ppppppplStack_160;
    ppppppplStack_168 = &pppppplStack_188;
    ppppppplStack_160 = (long *******)0x1400020c0;
    ppppppplStack_158 = &pppppplStack_190;
    puStack_150 = (undefined1 *)0x145bdb210;
    ppppppplStack_148 = (long *******)&ppppppplStack_88;
    puStack_140 = &DAT_1400020e0;
    func_0x000145bcce30();
    if (ppppppplStack_88 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    ppppppplVar14 = ppppppplStack_b0;
    if (ppppppplVar20 != (long *******)0x0) {
      ppppppplVar22 = ppppppplVar22 + 1;
      do {
        if (ppppppplVar22[-1] != (long ******)0x0) {
          func_0x0001400021d0();
        }
        ppppppplVar22 = ppppppplVar22 + 3;
        ppppppplVar20 = (long *******)((long)ppppppplVar20 + -1);
      } while (ppppppplVar20 != (long *******)0x0);
    }
    if (ppppppplStack_a8 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    uVar26 = uStack_b8;
    if ((ulong)(lStack_70 - lStack_60) < uStack_b8) {
      ppppppplStack_58 = ppppppplStack_c0;
      func_0x000145bfa970();
LAB_1458a4e8f:
      func_0x000145bfa0e7();
    }
    else if (uStack_b8 != 0) goto LAB_1458a4e8f;
    lStack_60 = lStack_60 + uVar26;
    if (ppppppplStack_c8 != (long *******)0x0) {
      func_0x0001400021d0();
    }
  }
  ppppppplVar19 = (long *******)ppppppplVar14[0xd];
  ppppppplVar14 = ppppppplVar19 + (long)ppppppplVar14[0xe] * 4;
  for (; ppppppplVar19 != ppppppplVar14; ppppppplVar19 = ppppppplVar19 + 4) {
    pppppplStack_188 = (long ******)((long)ppppppplVar19 + 4);
    ppppppplStack_c8 = ppppppplVar19;
    func_0x0001459105e0();
    ppppppplStack_168 = &pppppplStack_188;
    ppppppplStack_160 = (long *******)0x1404bc1a0;
    ppppppplStack_158 = (long *******)&ppppppplStack_c8;
    puStack_150 = (undefined1 *)0x140130a90;
    ppppppplStack_148 = (long *******)&ppppppplStack_88;
    puStack_140 = &DAT_1400020e0;
    func_0x000145bcce30();
    if (ppppppplStack_88 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    ppppppplVar22 = ppppppplStack_98;
    ppppppplStack_58 = ppppppplStack_a8;
    ppppppplStack_50 = ppppppplStack_a0;
    if ((long *******)(lStack_70 - lStack_60) < ppppppplStack_98) {
      func_0x000145bfa970();
LAB_1458a5050:
      func_0x000145bfa0e7();
    }
    else if (ppppppplStack_98 != (long *******)0x0) goto LAB_1458a5050;
    lStack_60 = lStack_60 + (long)ppppppplVar22;
    if (ppppppplStack_58 != (long *******)0x0) {
      func_0x0001400021d0();
    }
  }
  pppppplVar21 = ppppppplStack_b0[0x10];
  pppppplVar16 = pppppplVar21 + (long)ppppppplStack_b0[0x11] * 10;
  for (; pppppplVar21 != pppppplVar16; pppppplVar21 = pppppplVar21 + 10) {
    pppppplStack_188 = (long ******)((long)pppppplVar21 + 1);
    pppppplStack_190 = pppppplVar21;
    func_0x000140002200();
    ppppppplVar14 = (long *******)func_0x0001400021c0();
    if (ppppppplVar14 == (long *******)0x0) {
      func_0x000145d992bb();
      goto LAB_1458a681b;
    }
    ppppppplStack_88 = (long *******)0x3;
    ppppppplStack_80 = ppppppplVar14;
    func_0x0001459105e0();
    ppppppplVar14[2] = (long ******)ppppppplStack_158;
    *ppppppplVar14 = (long ******)ppppppplStack_168;
    ppppppplVar14[1] = (long ******)ppppppplStack_160;
    func_0x0001459105e0();
    ppppppplVar14[5] = (long ******)ppppppplStack_158;
    ppppppplVar14[3] = (long ******)ppppppplStack_168;
    ppppppplVar14[4] = (long ******)ppppppplStack_160;
    func_0x0001459105e0();
    ppppppplVar14[8] = (long ******)ppppppplStack_158;
    ppppppplVar14[6] = (long ******)ppppppplStack_168;
    ppppppplVar14[7] = (long ******)ppppppplStack_160;
    ppppppplStack_c8 = ppppppplStack_88;
    ppppppplStack_c0 = ppppppplStack_80;
    uStack_b8 = 3;
    lVar23 = 3;
    ppppppplVar14 = ppppppplStack_80;
    func_0x00014588ad20();
    ppppppplStack_78 = ppppppplStack_158;
    ppppppplStack_88 = ppppppplStack_168;
    ppppppplStack_80 = ppppppplStack_160;
    ppppppplStack_168 = &pppppplStack_190;
    ppppppplStack_160 = (long *******)0x1404bc1a0;
    ppppppplStack_158 = &pppppplStack_188;
    puStack_150 = (undefined1 *)0x1404bc1a0;
    ppppppplStack_148 = (long *******)&ppppppplStack_88;
    puStack_140 = &DAT_1400020e0;
    func_0x000145bcce30();
    if (ppppppplStack_88 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    ppppppplVar19 = ppppppplStack_98;
    ppppppplStack_58 = ppppppplStack_a8;
    ppppppplStack_50 = ppppppplStack_a0;
    if ((long *******)(lStack_70 - lStack_60) < ppppppplStack_98) {
      func_0x000145bfa970();
LAB_1458a52b4:
      func_0x000145bfa0e7();
    }
    else if (ppppppplStack_98 != (long *******)0x0) goto LAB_1458a52b4;
    lStack_60 = lStack_60 + (long)ppppppplVar19;
    if (ppppppplStack_58 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    ppppppplVar14 = ppppppplVar14 + 1;
    do {
      if (ppppppplVar14[-1] != (long ******)0x0) {
        func_0x0001400021d0();
      }
      ppppppplVar14 = ppppppplVar14 + 3;
      lVar23 = lVar23 + -1;
    } while (lVar23 != 0);
    if (ppppppplStack_c8 != (long *******)0x0) {
      func_0x0001400021d0();
    }
  }
  ppppppplVar14 = ppppppplStack_b0;
  if (ppppppplStack_b0[0x14] != (long ******)0x0) {
    func_0x0001459c8670();
    ppppppplVar19 = ppppppplStack_a0;
    ppppppplVar22 = ppppppplStack_98;
    func_0x00014588ad20(ppppppplStack_98,ppppppplStack_a0,ppppppplStack_a0,&ppppppplStack_168,
                        ppppppplStack_98,0x146beb4d4);
    ppppppplStack_78 = ppppppplStack_158;
    ppppppplStack_88 = ppppppplStack_168;
    ppppppplStack_80 = ppppppplStack_160;
    ppppppplStack_c8 = (long *******)&ppppppplStack_88;
    ppppppplStack_c0 = (long *******)&DAT_1400020e0;
    func_0x000145bcce30();
    if (ppppppplStack_88 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    ppppppplVar14 = ppppppplStack_b0;
    ppppppplVar20 = ppppppplStack_158;
    if ((long *******)(lStack_70 - lStack_60) < ppppppplStack_158) {
      ppppppplStack_58 = ppppppplStack_160;
      ppppppplStack_50 = ppppppplStack_168;
      func_0x000145bfa970();
      ppppppplVar27 = ppppppplStack_50;
LAB_1458a5490:
      func_0x000145bfa0e7();
    }
    else {
      ppppppplVar27 = ppppppplStack_168;
      if (ppppppplStack_158 != (long *******)0x0) goto LAB_1458a5490;
    }
    lStack_60 = lStack_60 + (long)ppppppplVar20;
    if (ppppppplVar27 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    if (ppppppplVar22 != (long *******)0x0) {
      ppppppplVar19 = ppppppplVar19 + 1;
      do {
        if (ppppppplVar19[-1] != (long ******)0x0) {
          func_0x0001400021d0();
        }
        ppppppplVar19 = ppppppplVar19 + 3;
        ppppppplVar22 = (long *******)((long)ppppppplVar22 + -1);
      } while (ppppppplVar22 != (long *******)0x0);
    }
    if (ppppppplStack_a8 != (long *******)0x0) {
      func_0x0001400021d0();
    }
  }
  if (ppppppplVar14[0x17] != (long ******)0x0) {
    func_0x00014588ad20();
    ppppppplStack_78 = ppppppplStack_158;
    ppppppplStack_88 = ppppppplStack_168;
    ppppppplStack_80 = ppppppplStack_160;
    ppppppplStack_a8 = (long *******)&ppppppplStack_88;
    ppppppplStack_a0 = (long *******)&DAT_1400020e0;
    func_0x000145bcce30();
    if (ppppppplStack_88 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    ppppppplVar19 = ppppppplStack_158;
    if ((long *******)(lStack_70 - lStack_60) < ppppppplStack_158) {
      ppppppplStack_58 = ppppppplStack_160;
      ppppppplStack_50 = ppppppplStack_168;
      func_0x000145bfa970();
      ppppppplVar22 = ppppppplStack_50;
LAB_1458a55ef:
      ppppppplVar14 = ppppppplStack_b0;
      func_0x000145bfa0e7();
    }
    else {
      ppppppplVar22 = ppppppplStack_168;
      ppppppplVar14 = ppppppplStack_b0;
      if (ppppppplStack_158 != (long *******)0x0) goto LAB_1458a55ef;
    }
    lStack_60 = lStack_60 + (long)ppppppplVar19;
    if (ppppppplVar22 != (long *******)0x0) {
      func_0x0001400021d0();
    }
  }
  if (ppppppplVar14[0x1a] != (long ******)0x0) {
    func_0x0001459c89b0();
    ppppppplVar19 = ppppppplStack_a0;
    ppppppplVar22 = ppppppplStack_98;
    func_0x00014588ad20(ppppppplStack_98,ppppppplStack_a0,ppppppplStack_a0,&ppppppplStack_168,
                        ppppppplStack_98,0x146beb4d4);
    ppppppplStack_78 = ppppppplStack_158;
    ppppppplStack_88 = ppppppplStack_168;
    ppppppplStack_80 = ppppppplStack_160;
    ppppppplStack_c8 = (long *******)&ppppppplStack_88;
    ppppppplStack_c0 = (long *******)&DAT_1400020e0;
    func_0x000145bcce30();
    if (ppppppplStack_88 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    ppppppplVar14 = ppppppplStack_b0;
    ppppppplVar20 = ppppppplStack_158;
    if ((long *******)(lStack_70 - lStack_60) < ppppppplStack_158) {
      ppppppplStack_58 = ppppppplStack_160;
      ppppppplStack_50 = ppppppplStack_168;
      func_0x000145bfa970();
      ppppppplVar27 = ppppppplStack_50;
LAB_1458a571e:
      func_0x000145bfa0e7();
    }
    else {
      ppppppplVar27 = ppppppplStack_168;
      if (ppppppplStack_158 != (long *******)0x0) goto LAB_1458a571e;
    }
    lStack_60 = lStack_60 + (long)ppppppplVar20;
    if (ppppppplVar27 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    if (ppppppplVar22 != (long *******)0x0) {
      ppppppplVar19 = ppppppplVar19 + 1;
      do {
        if (ppppppplVar19[-1] != (long ******)0x0) {
          func_0x0001400021d0();
        }
        ppppppplVar19 = ppppppplVar19 + 3;
        ppppppplVar22 = (long *******)((long)ppppppplVar22 + -1);
      } while (ppppppplVar22 != (long *******)0x0);
    }
    if (ppppppplStack_a8 != (long *******)0x0) {
      func_0x0001400021d0();
    }
  }
  if ((((ppppppplVar14[0x32] != (long ******)0x0) || (ppppppplVar14[0x33] != (long ******)0x0)) ||
      (ppppppplVar14[0x34] != (long ******)0x0)) ||
     (((ppppppplVar14[0x35] != (long ******)0x0 || (ppppppplVar14[0x36] != (long ******)0x0)) ||
      ((ppppppplVar14[0x37] != (long ******)0x0 || (ppppppplVar14[0x38] != (long ******)0x0)))))) {
    ppppppplStack_168 = (long *******)0x146beb768;
    ppppppplStack_160 = (long *******)0x146beb76f;
    ppppppplStack_158 = ppppppplVar14;
    func_0x0001459c8290();
    ppppppplVar19 = ppppppplStack_a0;
    ppppppplVar22 = ppppppplStack_98;
    func_0x00014588ad20(ppppppplStack_98,ppppppplStack_a0,ppppppplStack_a0,&ppppppplStack_168,
                        ppppppplStack_98,0x146beb4d4);
    ppppppplStack_78 = ppppppplStack_158;
    ppppppplStack_88 = ppppppplStack_168;
    ppppppplStack_80 = ppppppplStack_160;
    ppppppplStack_c8 = (long *******)&ppppppplStack_88;
    ppppppplStack_c0 = (long *******)&DAT_1400020e0;
    func_0x000145bcce30();
    if (ppppppplStack_88 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    ppppppplVar14 = ppppppplStack_b0;
    ppppppplVar20 = ppppppplStack_158;
    if ((long *******)(lStack_70 - lStack_60) < ppppppplStack_158) {
      ppppppplStack_58 = ppppppplStack_160;
      ppppppplStack_50 = ppppppplStack_168;
      func_0x000145bfa970();
      ppppppplVar27 = ppppppplStack_50;
LAB_1458a58f0:
      func_0x000145bfa0e7();
    }
    else {
      ppppppplVar27 = ppppppplStack_168;
      if (ppppppplStack_158 != (long *******)0x0) goto LAB_1458a58f0;
    }
    lStack_60 = lStack_60 + (long)ppppppplVar20;
    if (ppppppplVar27 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    if (ppppppplVar22 != (long *******)0x0) {
      ppppppplVar19 = ppppppplVar19 + 1;
      do {
        if (ppppppplVar19[-1] != (long ******)0x0) {
          func_0x0001400021d0();
        }
        ppppppplVar19 = ppppppplVar19 + 3;
        ppppppplVar22 = (long *******)((long)ppppppplVar22 + -1);
      } while (ppppppplVar22 != (long *******)0x0);
    }
    if (ppppppplStack_a8 != (long *******)0x0) {
      func_0x0001400021d0();
    }
  }
  ppppppplStack_170 = (long *******)ppppppplVar14[0x1c];
  pppppplVar21 = ppppppplVar14[0x1d];
  if (pppppplVar21 == (long ******)0x0) {
    puVar15 = (undefined1 *)0x1;
    pppppplVar16 = (long ******)0x0;
  }
  else {
    func_0x000140002200();
    puVar15 = (undefined1 *)func_0x0001400021c0();
    if (puVar15 == (undefined1 *)0x0) {
      func_0x000145d992bb();
LAB_1458a681b:
                    /* WARNING: Does not return */
      pcVar12 = (code *)invalidInstructionException();
      (*pcVar12)();
    }
    if (pppppplVar21 < (long ******)0x4) {
      pppppplVar16 = (long ******)0x0;
LAB_1458a5b2d:
      ppppppplVar19 = ppppppplStack_170 + (long)pppppplVar16 * 2;
      do {
        puVar15[(long)pppppplVar16] = *(undefined1 *)ppppppplVar19;
        pppppplVar16 = (long ******)((long)pppppplVar16 + 1);
        ppppppplVar19 = ppppppplVar19 + 2;
      } while (pppppplVar21 != pppppplVar16);
    }
    else if (pppppplVar21 < (long ******)0x10) {
      pppppplVar17 = (long ******)0x0;
LAB_1458a5ac8:
      pppppplVar16 = (long ******)((ulong)pppppplVar21 & 0xfffffffffffffffc);
      ppppppplVar19 = ppppppplStack_170 + (long)pppppplVar17 * 2 + 6;
      do {
        *(uint *)(puVar15 + (long)pppppplVar17) =
             *(int *)ppppppplVar19 << 0x18 |
             (uint)CONCAT12(*(undefined1 *)(ppppppplVar19 + -2),
                            CONCAT11(*(undefined1 *)(ppppppplVar19 + -4),
                                     *(undefined1 *)(ppppppplVar19 + -6)));
        pppppplVar17 = (long ******)((long)pppppplVar17 + 4);
        ppppppplVar19 = ppppppplVar19 + 8;
      } while (pppppplVar16 != pppppplVar17);
      if (pppppplVar21 != pppppplVar16) goto LAB_1458a5b2d;
    }
    else {
      pppppplVar16 = (long ******)((ulong)pppppplVar21 & 0xfffffffffffffff0);
      ppppppplVar19 = ppppppplStack_170 + 0x1e;
      pppppplVar17 = (long ******)0x0;
      do {
        iVar3 = *(int *)ppppppplVar19;
        iVar4 = *(int *)(ppppppplVar19 + -2);
        iVar5 = *(int *)(ppppppplVar19 + -4);
        iVar6 = *(int *)(ppppppplVar19 + -6);
        iVar7 = *(int *)(ppppppplVar19 + -8);
        iVar8 = *(int *)(ppppppplVar19 + -10);
        iVar9 = *(int *)(ppppppplVar19 + -0xc);
        iVar10 = *(int *)(ppppppplVar19 + -0xe);
        *(ulong *)(puVar15 + (long)pppppplVar17) =
             CONCAT44(CONCAT22(CONCAT11((char)*(int *)(ppppppplVar19 + -0x10),
                                        (char)*(int *)(ppppppplVar19 + -0x12)),
                               CONCAT11((char)*(int *)(ppppppplVar19 + -0x14),
                                        (char)*(int *)(ppppppplVar19 + -0x16))),
                      CONCAT22(CONCAT11((char)*(int *)(ppppppplVar19 + -0x18),
                                        (char)*(int *)(ppppppplVar19 + -0x1a)),
                               CONCAT11((char)*(int *)(ppppppplVar19 + -0x1c),
                                        (char)*(int *)(ppppppplVar19 + -0x1e))));
        *(ulong *)((long)(puVar15 + (long)pppppplVar17) + 8) =
             CONCAT44(CONCAT22(CONCAT11((char)iVar3,(char)iVar4),CONCAT11((char)iVar5,(char)iVar6)),
                      CONCAT22(CONCAT11((char)iVar7,(char)iVar8),CONCAT11((char)iVar9,(char)iVar10))
                     );
        pppppplVar17 = pppppplVar17 + 2;
        ppppppplVar19 = ppppppplVar19 + 0x20;
      } while (pppppplVar16 != pppppplVar17);
      if (pppppplVar21 != pppppplVar16) {
        pppppplVar17 = pppppplVar16;
        if (((ulong)pppppplVar21 & 0xc) == 0) goto LAB_1458a5b2d;
        goto LAB_1458a5ac8;
      }
    }
    pppppplVar16 = (long ******)0x1;
    if (pppppplVar21 != (long ******)0x1) {
      lVar23 = 0;
      do {
        if (puVar15[lVar23 + 1] == puVar15[lVar23]) {
          pppppplVar17 = (long ******)(lVar23 + 2);
          pppppplVar16 = (long ******)(lVar23 + 1);
          if (pppppplVar17 < pppppplVar21) {
            if (((int)pppppplVar21 - (int)lVar23 & 1U) != 0) {
              if (puVar15[lVar23 + 2] != puVar15[lVar23]) {
                puVar15[lVar23 + 1] = puVar15[lVar23 + 2];
                pppppplVar16 = (long ******)(lVar23 + 2);
              }
              pppppplVar17 = (long ******)(lVar23 + 3);
            }
            if ((long)pppppplVar21 + -3 != lVar23) goto LAB_1458a5dbd;
          }
          break;
        }
        lVar23 = lVar23 + 1;
        pppppplVar16 = pppppplVar21;
      } while ((long)pppppplVar21 + -1 != lVar23);
    }
  }
  goto LAB_1458a5bc3;
LAB_1458a5dbd:
  do {
    if (puVar15[(long)pppppplVar17] == puVar15[(long)pppppplVar16 + -1]) {
      cVar18 = puVar15[(long)pppppplVar17 + 1];
      pppppplVar25 = pppppplVar16;
      if (cVar18 != puVar15[(long)pppppplVar16 + -1]) {
LAB_1458a5df3:
        puVar15[(long)pppppplVar16] = cVar18;
        pppppplVar25 = (long ******)((long)pppppplVar16 + 1);
      }
    }
    else {
      puVar15[(long)pppppplVar16] = puVar15[(long)pppppplVar17];
      pppppplVar25 = (long ******)((long)pppppplVar16 + 1);
      cVar18 = puVar15[(long)pppppplVar17 + 1];
      pcVar1 = puVar15 + (long)pppppplVar16;
      pppppplVar16 = pppppplVar25;
      if (cVar18 != *pcVar1) goto LAB_1458a5df3;
    }
    pppppplVar17 = (long ******)((long)pppppplVar17 + 2);
    pppppplVar16 = pppppplVar25;
  } while (pppppplVar21 != pppppplVar17);
LAB_1458a5bc3:
  ppppppplVar19 = ppppppplStack_170 + (long)pppppplVar21 * 2;
  puVar24 = puVar15 + (long)pppppplVar16;
  for (; puVar15 != puVar24; puVar15 = puVar15 + 1) {
    pppppplStack_188 = (long ******)CONCAT71(pppppplStack_188._1_7_,*puVar15);
    ppppppplStack_168 = ppppppplStack_170;
    ppppppplStack_158 = &pppppplStack_188;
    ppppppplStack_160 = ppppppplVar19;
    func_0x0001459bd540();
    func_0x00014588b2e0();
    ppppppplStack_78 = ppppppplStack_158;
    ppppppplStack_88 = ppppppplStack_168;
    ppppppplStack_80 = ppppppplStack_160;
    ppppppplStack_168 = &pppppplStack_188;
    ppppppplStack_160 = (long *******)0x145bdb210;
    ppppppplStack_158 = (long *******)&ppppppplStack_88;
    puStack_150 = &DAT_1400020e0;
    func_0x000145bcce30();
    if (ppppppplStack_88 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    ppppppplVar22 = ppppppplStack_98;
    ppppppplStack_58 = ppppppplStack_a8;
    ppppppplStack_50 = ppppppplStack_a0;
    if ((long *******)(lStack_70 - lStack_60) < ppppppplStack_98) {
      func_0x000145bfa970();
LAB_1458a5d0d:
      func_0x000145bfa0e7();
    }
    else if (ppppppplStack_98 != (long *******)0x0) goto LAB_1458a5d0d;
    lStack_60 = lStack_60 + (long)ppppppplVar22;
    if (ppppppplStack_58 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    if (ppppppplStack_c8 != (long *******)0x0) {
      func_0x0001400021d0();
    }
  }
  if (pppppplVar21 != (long ******)0x0) {
    func_0x0001400021d0();
  }
  ppppppplVar19 = ppppppplStack_b0;
  if (ppppppplStack_b0[0x20] != (long ******)0x0) {
    func_0x0001459c8810();
    ppppppplVar22 = ppppppplStack_a0;
    ppppppplVar20 = ppppppplStack_98;
    func_0x00014588ad20(ppppppplStack_98,ppppppplStack_a0,ppppppplStack_a0,&ppppppplStack_168,
                        ppppppplStack_98,0x146beb4d4);
    ppppppplStack_78 = ppppppplStack_158;
    ppppppplStack_88 = ppppppplStack_168;
    ppppppplStack_80 = ppppppplStack_160;
    ppppppplStack_c8 = (long *******)&ppppppplStack_88;
    ppppppplStack_c0 = (long *******)&DAT_1400020e0;
    func_0x000145bcce30();
    if (ppppppplStack_88 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    ppppppplVar19 = ppppppplStack_b0;
    ppppppplVar27 = ppppppplStack_158;
    if ((long *******)(lStack_70 - lStack_60) < ppppppplStack_158) {
      ppppppplStack_58 = ppppppplStack_160;
      ppppppplStack_50 = ppppppplStack_168;
      func_0x000145bfa970();
      ppppppplVar28 = ppppppplStack_50;
LAB_1458a5f0e:
      func_0x000145bfa0e7();
    }
    else {
      ppppppplVar28 = ppppppplStack_168;
      if (ppppppplStack_158 != (long *******)0x0) goto LAB_1458a5f0e;
    }
    lStack_60 = lStack_60 + (long)ppppppplVar27;
    if (ppppppplVar28 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    if (ppppppplVar20 != (long *******)0x0) {
      ppppppplVar22 = ppppppplVar22 + 1;
      do {
        if (ppppppplVar22[-1] != (long ******)0x0) {
          func_0x0001400021d0();
        }
        ppppppplVar22 = ppppppplVar22 + 3;
        ppppppplVar20 = (long *******)((long)ppppppplVar20 + -1);
      } while (ppppppplVar20 != (long *******)0x0);
    }
    if (ppppppplStack_a8 != (long *******)0x0) {
      func_0x0001400021d0();
    }
  }
  if (ppppppplVar19[0x23] != (long ******)0x0) {
    func_0x0001459c9080();
    ppppppplVar22 = ppppppplStack_a0;
    ppppppplVar20 = ppppppplStack_98;
    func_0x00014588ad20(ppppppplStack_98,ppppppplStack_a0,ppppppplStack_a0,&ppppppplStack_168,
                        ppppppplStack_98,0x146beb4d4);
    ppppppplStack_78 = ppppppplStack_158;
    ppppppplStack_88 = ppppppplStack_168;
    ppppppplStack_80 = ppppppplStack_160;
    ppppppplStack_c8 = (long *******)&ppppppplStack_88;
    ppppppplStack_c0 = (long *******)&DAT_1400020e0;
    func_0x000145bcce30();
    if (ppppppplStack_88 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    ppppppplVar19 = ppppppplStack_b0;
    ppppppplVar27 = ppppppplStack_158;
    if ((long *******)(lStack_70 - lStack_60) < ppppppplStack_158) {
      ppppppplStack_58 = ppppppplStack_160;
      ppppppplStack_50 = ppppppplStack_168;
      func_0x000145bfa970();
      ppppppplVar28 = ppppppplStack_50;
LAB_1458a6094:
      func_0x000145bfa0e7();
    }
    else {
      ppppppplVar28 = ppppppplStack_168;
      if (ppppppplStack_158 != (long *******)0x0) goto LAB_1458a6094;
    }
    lStack_60 = lStack_60 + (long)ppppppplVar27;
    if (ppppppplVar28 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    if (ppppppplVar20 != (long *******)0x0) {
      ppppppplVar22 = ppppppplVar22 + 1;
      do {
        if (ppppppplVar22[-1] != (long ******)0x0) {
          func_0x0001400021d0();
        }
        ppppppplVar22 = ppppppplVar22 + 3;
        ppppppplVar20 = (long *******)((long)ppppppplVar20 + -1);
      } while (ppppppplVar20 != (long *******)0x0);
    }
    if (ppppppplStack_a8 != (long *******)0x0) {
      func_0x0001400021d0();
    }
  }
  if (ppppppplVar19[0x26] != (long ******)0x0) {
    func_0x00014588ad20();
    ppppppplStack_78 = ppppppplStack_158;
    ppppppplStack_88 = ppppppplStack_168;
    ppppppplStack_80 = ppppppplStack_160;
    ppppppplStack_a8 = (long *******)&ppppppplStack_88;
    ppppppplStack_a0 = (long *******)&DAT_1400020e0;
    func_0x000145bcce30();
    if (ppppppplStack_88 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    ppppppplVar22 = ppppppplStack_158;
    if ((long *******)(lStack_70 - lStack_60) < ppppppplStack_158) {
      ppppppplStack_58 = ppppppplStack_160;
      ppppppplStack_50 = ppppppplStack_168;
      func_0x000145bfa970();
      ppppppplVar20 = ppppppplStack_50;
LAB_1458a61ef:
      ppppppplVar19 = ppppppplStack_b0;
      func_0x000145bfa0e7();
    }
    else {
      ppppppplVar20 = ppppppplStack_168;
      ppppppplVar19 = ppppppplStack_b0;
      if (ppppppplStack_158 != (long *******)0x0) goto LAB_1458a61ef;
    }
    lStack_60 = lStack_60 + (long)ppppppplVar22;
    if (ppppppplVar20 != (long *******)0x0) {
      func_0x0001400021d0();
    }
  }
  if (*(int *)(ppppppplVar14 + 0x39) == 0) goto LAB_1458a62d2;
  ppppppplStack_80 = (long *******)0x145bde8e0;
  ppppppplStack_88 = ppppppplVar14 + 0x39;
  func_0x000145bcce30();
  ppppppplVar14 = ppppppplStack_158;
  if ((long *******)(lStack_70 - lStack_60) < ppppppplStack_158) {
    ppppppplStack_58 = ppppppplStack_160;
    ppppppplStack_50 = ppppppplStack_168;
    func_0x000145bfa970();
    ppppppplVar22 = ppppppplStack_50;
LAB_1458a6296:
    ppppppplVar19 = ppppppplStack_b0;
    func_0x000145bfa0e7();
  }
  else {
    ppppppplVar22 = ppppppplStack_168;
    ppppppplVar19 = ppppppplStack_b0;
    if (ppppppplStack_158 != (long *******)0x0) goto LAB_1458a6296;
  }
  lStack_60 = lStack_60 + (long)ppppppplVar14;
  if (ppppppplVar22 != (long *******)0x0) {
    func_0x0001400021d0();
  }
LAB_1458a62d2:
  ppppppplVar14 = (long *******)ppppppplVar19[0x28];
  pppppplVar21 = ppppppplVar19[0x29];
  ppppppplVar19 = ppppppplVar14;
  do {
    if (ppppppplVar19 == ppppppplVar14 + (long)pppppplVar21) {
      param_4[2] = lStack_60;
      *param_4 = lStack_70;
      param_4[1] = lStack_68;
      return;
    }
    ppppppplVar22 = ppppppplVar19 + 1;
    func_0x0001459c8eb0();
    ppppppplVar20 = ppppppplStack_c0;
    uVar26 = uStack_b8;
    func_0x00014588ad20();
    ppppppplStack_148 = (long *******)((long)ppppppplVar19 + 2);
    ppppppplStack_78 = ppppppplStack_158;
    ppppppplStack_88 = ppppppplStack_168;
    ppppppplStack_80 = ppppppplStack_160;
    ppppppplStack_158 = (long *******)((long)ppppppplVar19 + 1);
    ppppppplStack_160 = (long *******)0x145bdb210;
    puStack_150 = (undefined1 *)0x145bdb210;
    puStack_140 = (undefined1 *)0x145bdb210;
    ppppppplStack_138 = (long *******)&ppppppplStack_88;
    puStack_130 = &DAT_1400020e0;
    ppppppplStack_168 = ppppppplVar19;
    func_0x000145bcce30();
    if (ppppppplStack_88 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    ppppppplStack_58 = ppppppplStack_a8;
    ppppppplStack_50 = ppppppplStack_a0;
    ppppppplVar19 = ppppppplStack_98;
    if ((long *******)(lStack_70 - lStack_60) < ppppppplStack_98) {
      func_0x000145bfa970();
LAB_1458a6408:
      func_0x000145bfa0e7();
    }
    else if (ppppppplStack_98 != (long *******)0x0) goto LAB_1458a6408;
    lStack_60 = lStack_60 + (long)ppppppplVar19;
    if (ppppppplStack_58 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    if (uVar26 != 0) {
      ppppppplVar20 = ppppppplVar20 + 1;
      do {
        if (ppppppplVar20[-1] != (long ******)0x0) {
          func_0x0001400021d0();
        }
        ppppppplVar20 = ppppppplVar20 + 3;
        uVar26 = uVar26 - 1;
      } while (uVar26 != 0);
    }
    ppppppplVar19 = ppppppplVar22;
    if (ppppppplStack_c8 != (long *******)0x0) {
      func_0x0001400021d0();
    }
  } while( true );
}
