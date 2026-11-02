
/* WARNING: Type propagation algorithm not settling */

void entry(undefined8 param_1,undefined8 param_2,long *******param_3,long *param_4)

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
  long ******local_190;
  long ******local_188;
  long *******local_180;
  ulong local_178;
  long *******local_170;
  long *******local_168;
  long *******ppppppplStack_160;
  long *******local_158;
  undefined1 *local_150;
  long *******local_148;
  undefined1 *local_140;
  long *******local_138;
  undefined1 *local_130;
  long *******local_128;
  undefined1 *local_120;
  long *******local_118;
  undefined1 *local_110;
  long *******local_108;
  undefined1 *local_100;
  undefined1 *local_f8;
  undefined8 local_f0;
  long *******local_e8;
  undefined8 local_e0;
  undefined1 *local_d8;
  undefined8 local_d0;
  long *******local_c8;
  long *******ppppppplStack_c0;
  ulong local_b8;
  long *******local_b0;
  long *******local_a8;
  long *******ppppppplStack_a0;
  long *******local_98;
  long *******local_88;
  long *******ppppppplStack_80;
  long *******local_78;
  long local_70;
  long lStack_68;
  long local_60;
  long *******local_58;
  long *******local_50;
  undefined8 local_48;

  local_48 = 0xfffffffffffffffe;
  local_70 = 0;
  lStack_68 = 1;
  local_60 = 0;
  ppppppplVar14 = (long *******)param_3[1];
  pppppplVar21 = param_3[2];
  ppppppplVar19 = ppppppplVar14;
  local_b0 = param_3;
  while (ppppppplVar19 != ppppppplVar14 + (long)pppppplVar21 * 7) {
    ppppppplVar22 = ppppppplVar19 + 7;
    func_0x0001455441f0();
    uVar26 = local_b8;
    ppppppplVar20 = ppppppplStack_c0;
    func_0x00014546ac40();
    local_128 = (long *******)((long)ppppppplVar19 + 0x32);
    local_138 = (long *******)((long)ppppppplVar19 + 0x31);
    local_148 = ppppppplVar19 + 6;
    local_78 = local_158;
    local_88 = local_168;
    ppppppplStack_80 = ppppppplStack_160;
    local_108 = ppppppplVar19 + 4;
    local_f8 = (undefined1 *)((long)ppppppplVar19 + 0x24);
    local_e8 = ppppppplVar19 + 5;
    ppppppplStack_160 = (long *******)0x14573b340;
    local_d8 = (undefined1 *)((long)ppppppplVar19 + 0x2c);
    local_150 = &DAT_1400020e0;
    local_140 = (undefined1 *)0x145736d20;
    local_130 = (undefined1 *)0x145736d20;
    local_120 = (undefined1 *)0x145736d20;
    local_118 = (long *******)&local_88;
    local_110 = &DAT_1400020e0;
    local_100 = (undefined1 *)0x14573a450;
    local_f0 = 0x14573a450;
    local_e0 = 0x14573a450;
    local_d0 = 0x14573a450;
    local_168 = ppppppplVar19 + 3;
    local_158 = ppppppplVar19;
    func_0x000145728390();
    if (local_88 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    local_58 = local_a8;
    local_50 = ppppppplStack_a0;
    ppppppplVar19 = local_98;
    if ((long *******)(local_70 - local_60) < local_98) {
      func_0x0001457744b0();
LAB_14543680b:
      func_0x0001457731ed();
    }
    else if (local_98 != (long *******)0x0) goto LAB_14543680b;
    local_60 = local_60 + (long)ppppppplVar19;
    if (local_58 != (long *******)0x0) {
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
    if (local_c8 != (long *******)0x0) {
      func_0x0001400021d0();
    }
  }
  ppppppplVar14 = local_b0;
  if (local_b0[0x2a] != (long ******)0xffffffffffffffff) {
    func_0x0001455441f0();
    ppppppplVar19 = ppppppplStack_c0;
    uVar26 = local_b8;
    func_0x00014546ac40(local_b8,ppppppplStack_c0,ppppppplStack_c0,&local_168,local_b8,0x14673d690);
    ppppppplVar14 = local_b0;
    local_98 = local_158;
    local_a8 = local_168;
    ppppppplStack_a0 = ppppppplStack_160;
    func_0x000145451650();
    local_128 = ppppppplVar14 + 0x2a;
    local_168 = ppppppplVar14 + 0x31;
    local_158 = (long *******)((long)ppppppplVar14 + 0x189);
    local_148 = (long *******)((long)ppppppplVar14 + 0x18a);
    local_138 = ppppppplVar14 + 0x2d;
    ppppppplStack_160 = (long *******)0x145736d20;
    local_150 = (undefined1 *)0x145736d20;
    local_140 = (undefined1 *)0x145736d20;
    local_130 = &DAT_1400020e0;
    local_120 = &DAT_1400020e0;
    local_118 = (long *******)&local_a8;
    local_110 = &DAT_1400020e0;
    local_100 = &DAT_1400020e0;
    local_108 = (long *******)&local_88;
    func_0x000145728390();
    if (local_88 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    if (local_a8 != (long *******)0x0) {
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
    if (local_c8 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    if ((ulong)(local_70 - local_60) < local_178) {
      local_50 = local_180;
      func_0x0001457744b0();
LAB_145436abb:
      func_0x0001457731ed();
    }
    else if (local_178 != 0) goto LAB_145436abb;
    local_60 = local_60 + local_178;
    if (local_188 != (long ******)0x0) {
      func_0x0001400021d0();
    }
  }
  pppppplVar21 = ppppppplVar14[4];
  pppppplVar16 = pppppplVar21 + (long)ppppppplVar14[5] * 2;
  for (; pppppplVar21 != pppppplVar16; pppppplVar21 = pppppplVar21 + 2) {
    local_a8 = (long *******)CONCAT71(local_a8._1_7_,*(undefined1 *)pppppplVar21);
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
      func_0x000145903b33();
      goto LAB_145438afb;
    }
    local_158 = (long *******)(uVar26 * 0xf0 + 0x146733520);
    local_168 = (long *******)&local_a8;
    ppppppplStack_160 = (long *******)0x145736d20;
    local_150 = (undefined1 *)0x1400020c0;
    func_0x000145728390();
    ppppppplVar14 = local_78;
    local_58 = local_88;
    local_50 = ppppppplStack_80;
    if ((long *******)(local_70 - local_60) < local_78) {
      func_0x0001457744b0();
LAB_145436bf0:
      func_0x0001457731ed();
    }
    else if (local_78 != (long *******)0x0) goto LAB_145436bf0;
    local_60 = local_60 + (long)ppppppplVar14;
    if (local_58 != (long *******)0x0) {
      func_0x0001400021d0();
    }
  }
  ppppppplVar14 = local_b0;
  if (local_b0[8] != (long ******)0x0) {
    func_0x0001455443c0();
    ppppppplVar19 = ppppppplStack_a0;
    ppppppplVar22 = local_98;
    func_0x00014546ac40(local_98,ppppppplStack_a0,ppppppplStack_a0,&local_168,local_98,0x14673d690);
    local_78 = local_158;
    local_88 = local_168;
    ppppppplStack_80 = ppppppplStack_160;
    local_c8 = (long *******)&local_88;
    ppppppplStack_c0 = (long *******)&DAT_1400020e0;
    func_0x000145728390();
    if (local_88 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    ppppppplVar14 = local_b0;
    ppppppplVar20 = local_158;
    if ((long *******)(local_70 - local_60) < local_158) {
      local_58 = ppppppplStack_160;
      local_50 = local_168;
      func_0x0001457744b0();
      ppppppplVar27 = local_50;
LAB_145436d56:
      func_0x0001457731ed();
    }
    else {
      ppppppplVar27 = local_168;
      if (local_158 != (long *******)0x0) goto LAB_145436d56;
    }
    local_60 = local_60 + (long)ppppppplVar20;
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
    if (local_a8 != (long *******)0x0) {
      func_0x0001400021d0();
    }
  }
  ppppppplVar19 = (long *******)ppppppplVar14[10];
  local_50 = ppppppplVar19 + (long)ppppppplVar14[0xb] * 0x1d;
  for (; ppppppplVar19 != local_50; ppppppplVar19 = ppppppplVar19 + 0x1d) {
    ppppppplVar22 = ppppppplVar19 + 0x13;
    ppppppplStack_160 = (long *******)((long)ppppppplVar19 + 0xe4);
    uVar2 = *(undefined1 *)((long)ppppppplVar19 + 0xe4);
    local_188 = (long ******)0x14673d940;
    local_180 = (long *******)0x5;
    local_190 = (long ******)CONCAT71(local_190._1_7_,uVar2);
    local_158 = (long *******)0x0;
    local_168 = ppppppplVar22;
    func_0x000145534650();
    ppppppplVar20 = local_98;
    ppppppplVar14 = ppppppplStack_a0;
    func_0x00014546ac40();
    local_78 = local_158;
    local_88 = local_168;
    ppppppplStack_80 = ppppppplStack_160;
    local_168 = &local_188;
    ppppppplStack_160 = (long *******)0x1400020c0;
    local_158 = &local_190;
    local_150 = (undefined1 *)0x145736d20;
    local_148 = (long *******)&local_88;
    local_140 = &DAT_1400020e0;
    func_0x000145728390();
    if (local_88 != (long *******)0x0) {
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
    if (local_a8 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    uVar26 = local_b8;
    if ((ulong)(local_70 - local_60) < local_b8) {
      local_58 = ppppppplStack_c0;
      func_0x0001457744b0();
LAB_145436faf:
      func_0x0001457731ed();
    }
    else if (local_b8 != 0) goto LAB_145436faf;
    local_60 = local_60 + uVar26;
    if (local_c8 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    local_188 = (long ******)0x14673d945;
    local_180 = (long *******)0x4;
    local_190 = (long ******)CONCAT71(local_190._1_7_,uVar2);
    local_158 = (long *******)0x0;
    local_168 = ppppppplVar19;
    ppppppplStack_160 = ppppppplVar22;
    func_0x000145534340();
    ppppppplVar20 = local_98;
    ppppppplVar22 = ppppppplStack_a0;
    func_0x00014546ac40();
    local_78 = local_158;
    local_88 = local_168;
    ppppppplStack_80 = ppppppplStack_160;
    local_168 = &local_188;
    ppppppplStack_160 = (long *******)0x1400020c0;
    local_158 = &local_190;
    local_150 = (undefined1 *)0x145736d20;
    local_148 = (long *******)&local_88;
    local_140 = &DAT_1400020e0;
    func_0x000145728390();
    if (local_88 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    ppppppplVar14 = local_b0;
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
    if (local_a8 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    uVar26 = local_b8;
    if ((ulong)(local_70 - local_60) < local_b8) {
      local_58 = ppppppplStack_c0;
      func_0x0001457744b0();
LAB_14543716f:
      func_0x0001457731ed();
    }
    else if (local_b8 != 0) goto LAB_14543716f;
    local_60 = local_60 + uVar26;
    if (local_c8 != (long *******)0x0) {
      func_0x0001400021d0();
    }
  }
  ppppppplVar19 = (long *******)ppppppplVar14[0xd];
  ppppppplVar14 = ppppppplVar19 + (long)ppppppplVar14[0xe] * 4;
  for (; ppppppplVar19 != ppppppplVar14; ppppppplVar19 = ppppppplVar19 + 4) {
    local_188 = (long ******)((long)ppppppplVar19 + 4);
    local_c8 = ppppppplVar19;
    func_0x000145483ec0();
    local_168 = &local_188;
    ppppppplStack_160 = (long *******)0x140496fe0;
    local_158 = (long *******)&local_c8;
    local_150 = (undefined1 *)0x1400ca080;
    local_148 = (long *******)&local_88;
    local_140 = &DAT_1400020e0;
    func_0x000145728390();
    if (local_88 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    ppppppplVar22 = local_98;
    local_58 = local_a8;
    local_50 = ppppppplStack_a0;
    if ((long *******)(local_70 - local_60) < local_98) {
      func_0x0001457744b0();
LAB_145437330:
      func_0x0001457731ed();
    }
    else if (local_98 != (long *******)0x0) goto LAB_145437330;
    local_60 = local_60 + (long)ppppppplVar22;
    if (local_58 != (long *******)0x0) {
      func_0x0001400021d0();
    }
  }
  pppppplVar21 = local_b0[0x10];
  pppppplVar16 = pppppplVar21 + (long)local_b0[0x11] * 10;
  for (; pppppplVar21 != pppppplVar16; pppppplVar21 = pppppplVar21 + 10) {
    local_188 = (long ******)((long)pppppplVar21 + 1);
    local_190 = pppppplVar21;
    func_0x000140002200();
    ppppppplVar14 = (long *******)func_0x0001400021c0();
    if (ppppppplVar14 == (long *******)0x0) {
      func_0x00014590379b();
      goto LAB_145438afb;
    }
    local_88 = (long *******)0x3;
    ppppppplStack_80 = ppppppplVar14;
    func_0x000145483ec0();
    ppppppplVar14[2] = (long ******)local_158;
    *ppppppplVar14 = (long ******)local_168;
    ppppppplVar14[1] = (long ******)ppppppplStack_160;
    func_0x000145483ec0();
    ppppppplVar14[5] = (long ******)local_158;
    ppppppplVar14[3] = (long ******)local_168;
    ppppppplVar14[4] = (long ******)ppppppplStack_160;
    func_0x000145483ec0();
    ppppppplVar14[8] = (long ******)local_158;
    ppppppplVar14[6] = (long ******)local_168;
    ppppppplVar14[7] = (long ******)ppppppplStack_160;
    local_c8 = local_88;
    ppppppplStack_c0 = ppppppplStack_80;
    local_b8 = 3;
    lVar23 = 3;
    ppppppplVar14 = ppppppplStack_80;
    func_0x00014546ac40();
    local_78 = local_158;
    local_88 = local_168;
    ppppppplStack_80 = ppppppplStack_160;
    local_168 = &local_190;
    ppppppplStack_160 = (long *******)0x140496fe0;
    local_158 = &local_188;
    local_150 = (undefined1 *)0x140496fe0;
    local_148 = (long *******)&local_88;
    local_140 = &DAT_1400020e0;
    func_0x000145728390();
    if (local_88 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    ppppppplVar19 = local_98;
    local_58 = local_a8;
    local_50 = ppppppplStack_a0;
    if ((long *******)(local_70 - local_60) < local_98) {
      func_0x0001457744b0();
LAB_145437594:
      func_0x0001457731ed();
    }
    else if (local_98 != (long *******)0x0) goto LAB_145437594;
    local_60 = local_60 + (long)ppppppplVar19;
    if (local_58 != (long *******)0x0) {
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
    if (local_c8 != (long *******)0x0) {
      func_0x0001400021d0();
    }
  }
  ppppppplVar14 = local_b0;
  if (local_b0[0x14] != (long ******)0x0) {
    func_0x0001455439b0();
    ppppppplVar19 = ppppppplStack_a0;
    ppppppplVar22 = local_98;
    func_0x00014546ac40(local_98,ppppppplStack_a0,ppppppplStack_a0,&local_168,local_98,0x14673d690);
    local_78 = local_158;
    local_88 = local_168;
    ppppppplStack_80 = ppppppplStack_160;
    local_c8 = (long *******)&local_88;
    ppppppplStack_c0 = (long *******)&DAT_1400020e0;
    func_0x000145728390();
    if (local_88 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    ppppppplVar14 = local_b0;
    ppppppplVar20 = local_158;
    if ((long *******)(local_70 - local_60) < local_158) {
      local_58 = ppppppplStack_160;
      local_50 = local_168;
      func_0x0001457744b0();
      ppppppplVar27 = local_50;
LAB_145437770:
      func_0x0001457731ed();
    }
    else {
      ppppppplVar27 = local_168;
      if (local_158 != (long *******)0x0) goto LAB_145437770;
    }
    local_60 = local_60 + (long)ppppppplVar20;
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
    if (local_a8 != (long *******)0x0) {
      func_0x0001400021d0();
    }
  }
  if (ppppppplVar14[0x17] != (long ******)0x0) {
    func_0x00014546ac40();
    local_78 = local_158;
    local_88 = local_168;
    ppppppplStack_80 = ppppppplStack_160;
    local_a8 = (long *******)&local_88;
    ppppppplStack_a0 = (long *******)&DAT_1400020e0;
    func_0x000145728390();
    if (local_88 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    ppppppplVar19 = local_158;
    if ((long *******)(local_70 - local_60) < local_158) {
      local_58 = ppppppplStack_160;
      local_50 = local_168;
      func_0x0001457744b0();
      ppppppplVar22 = local_50;
LAB_1454378cf:
      ppppppplVar14 = local_b0;
      func_0x0001457731ed();
    }
    else {
      ppppppplVar22 = local_168;
      ppppppplVar14 = local_b0;
      if (local_158 != (long *******)0x0) goto LAB_1454378cf;
    }
    local_60 = local_60 + (long)ppppppplVar19;
    if (ppppppplVar22 != (long *******)0x0) {
      func_0x0001400021d0();
    }
  }
  if (ppppppplVar14[0x1a] != (long ******)0x0) {
    func_0x000145543cf0();
    ppppppplVar19 = ppppppplStack_a0;
    ppppppplVar22 = local_98;
    func_0x00014546ac40(local_98,ppppppplStack_a0,ppppppplStack_a0,&local_168,local_98,0x14673d690);
    local_78 = local_158;
    local_88 = local_168;
    ppppppplStack_80 = ppppppplStack_160;
    local_c8 = (long *******)&local_88;
    ppppppplStack_c0 = (long *******)&DAT_1400020e0;
    func_0x000145728390();
    if (local_88 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    ppppppplVar14 = local_b0;
    ppppppplVar20 = local_158;
    if ((long *******)(local_70 - local_60) < local_158) {
      local_58 = ppppppplStack_160;
      local_50 = local_168;
      func_0x0001457744b0();
      ppppppplVar27 = local_50;
LAB_1454379fe:
      func_0x0001457731ed();
    }
    else {
      ppppppplVar27 = local_168;
      if (local_158 != (long *******)0x0) goto LAB_1454379fe;
    }
    local_60 = local_60 + (long)ppppppplVar20;
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
    if (local_a8 != (long *******)0x0) {
      func_0x0001400021d0();
    }
  }
  if ((((ppppppplVar14[0x32] != (long ******)0x0) || (ppppppplVar14[0x33] != (long ******)0x0)) ||
      (ppppppplVar14[0x34] != (long ******)0x0)) ||
     (((ppppppplVar14[0x35] != (long ******)0x0 || (ppppppplVar14[0x36] != (long ******)0x0)) ||
      ((ppppppplVar14[0x37] != (long ******)0x0 || (ppppppplVar14[0x38] != (long ******)0x0)))))) {
    local_168 = (long *******)0x14673d920;
    ppppppplStack_160 = (long *******)0x14673d927;
    local_158 = ppppppplVar14;
    func_0x0001455435d0();
    ppppppplVar19 = ppppppplStack_a0;
    ppppppplVar22 = local_98;
    func_0x00014546ac40(local_98,ppppppplStack_a0,ppppppplStack_a0,&local_168,local_98,0x14673d690);
    local_78 = local_158;
    local_88 = local_168;
    ppppppplStack_80 = ppppppplStack_160;
    local_c8 = (long *******)&local_88;
    ppppppplStack_c0 = (long *******)&DAT_1400020e0;
    func_0x000145728390();
    if (local_88 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    ppppppplVar14 = local_b0;
    ppppppplVar20 = local_158;
    if ((long *******)(local_70 - local_60) < local_158) {
      local_58 = ppppppplStack_160;
      local_50 = local_168;
      func_0x0001457744b0();
      ppppppplVar27 = local_50;
LAB_145437bd0:
      func_0x0001457731ed();
    }
    else {
      ppppppplVar27 = local_168;
      if (local_158 != (long *******)0x0) goto LAB_145437bd0;
    }
    local_60 = local_60 + (long)ppppppplVar20;
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
    if (local_a8 != (long *******)0x0) {
      func_0x0001400021d0();
    }
  }
  local_170 = (long *******)ppppppplVar14[0x1c];
  pppppplVar21 = ppppppplVar14[0x1d];
  if (pppppplVar21 == (long ******)0x0) {
    puVar15 = (undefined1 *)0x1;
    pppppplVar16 = (long ******)0x0;
  }
  else {
    func_0x000140002200();
    puVar15 = (undefined1 *)func_0x0001400021c0();
    if (puVar15 == (undefined1 *)0x0) {
      func_0x00014590379b();
LAB_145438afb:
                    /* WARNING: Does not return */
      pcVar12 = (code *)invalidInstructionException();
      (*pcVar12)();
    }
    if (pppppplVar21 < (long ******)0x4) {
      pppppplVar16 = (long ******)0x0;
LAB_145437e0d:
      ppppppplVar19 = local_170 + (long)pppppplVar16 * 2;
      do {
        puVar15[(long)pppppplVar16] = *(undefined1 *)ppppppplVar19;
        pppppplVar16 = (long ******)((long)pppppplVar16 + 1);
        ppppppplVar19 = ppppppplVar19 + 2;
      } while (pppppplVar21 != pppppplVar16);
    }
    else if (pppppplVar21 < (long ******)0x10) {
      pppppplVar17 = (long ******)0x0;
LAB_145437da8:
      pppppplVar16 = (long ******)((ulong)pppppplVar21 & 0xfffffffffffffffc);
      ppppppplVar19 = local_170 + (long)pppppplVar17 * 2 + 6;
      do {
        *(uint *)(puVar15 + (long)pppppplVar17) =
             *(int *)ppppppplVar19 << 0x18 |
             (uint)CONCAT12(*(undefined1 *)(ppppppplVar19 + -2),
                            CONCAT11(*(undefined1 *)(ppppppplVar19 + -4),
                                     *(undefined1 *)(ppppppplVar19 + -6)));
        pppppplVar17 = (long ******)((long)pppppplVar17 + 4);
        ppppppplVar19 = ppppppplVar19 + 8;
      } while (pppppplVar16 != pppppplVar17);
      if (pppppplVar21 != pppppplVar16) goto LAB_145437e0d;
    }
    else {
      pppppplVar16 = (long ******)((ulong)pppppplVar21 & 0xfffffffffffffff0);
      ppppppplVar19 = local_170 + 0x1e;
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
        if (((ulong)pppppplVar21 & 0xc) == 0) goto LAB_145437e0d;
        goto LAB_145437da8;
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
            if ((long)pppppplVar21 + -3 != lVar23) goto LAB_14543809d;
          }
          break;
        }
        lVar23 = lVar23 + 1;
        pppppplVar16 = pppppplVar21;
      } while ((long)pppppplVar21 + -1 != lVar23);
    }
  }
  goto LAB_145437ea3;
LAB_14543809d:
  do {
    if (puVar15[(long)pppppplVar17] == puVar15[(long)pppppplVar16 + -1]) {
      cVar18 = puVar15[(long)pppppplVar17 + 1];
      pppppplVar25 = pppppplVar16;
      if (cVar18 != puVar15[(long)pppppplVar16 + -1]) {
LAB_1454380d3:
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
      if (cVar18 != *pcVar1) goto LAB_1454380d3;
    }
    pppppplVar17 = (long ******)((long)pppppplVar17 + 2);
    pppppplVar16 = pppppplVar25;
  } while (pppppplVar21 != pppppplVar17);
LAB_145437ea3:
  ppppppplVar19 = local_170 + (long)pppppplVar21 * 2;
  puVar24 = puVar15 + (long)pppppplVar16;
  for (; puVar15 != puVar24; puVar15 = puVar15 + 1) {
    local_188 = (long ******)CONCAT71(local_188._1_7_,*puVar15);
    local_168 = local_170;
    local_158 = &local_188;
    ppppppplStack_160 = ppppppplVar19;
    func_0x000145539670();
    func_0x00014546b200();
    local_78 = local_158;
    local_88 = local_168;
    ppppppplStack_80 = ppppppplStack_160;
    local_168 = &local_188;
    ppppppplStack_160 = (long *******)0x145736d20;
    local_158 = (long *******)&local_88;
    local_150 = &DAT_1400020e0;
    func_0x000145728390();
    if (local_88 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    ppppppplVar22 = local_98;
    local_58 = local_a8;
    local_50 = ppppppplStack_a0;
    if ((long *******)(local_70 - local_60) < local_98) {
      func_0x0001457744b0();
LAB_145437fed:
      func_0x0001457731ed();
    }
    else if (local_98 != (long *******)0x0) goto LAB_145437fed;
    local_60 = local_60 + (long)ppppppplVar22;
    if (local_58 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    if (local_c8 != (long *******)0x0) {
      func_0x0001400021d0();
    }
  }
  if (pppppplVar21 != (long ******)0x0) {
    func_0x0001400021d0();
  }
  ppppppplVar19 = local_b0;
  if (local_b0[0x20] != (long ******)0x0) {
    func_0x000145543b50();
    ppppppplVar22 = ppppppplStack_a0;
    ppppppplVar20 = local_98;
    func_0x00014546ac40(local_98,ppppppplStack_a0,ppppppplStack_a0,&local_168,local_98,0x14673d690);
    local_78 = local_158;
    local_88 = local_168;
    ppppppplStack_80 = ppppppplStack_160;
    local_c8 = (long *******)&local_88;
    ppppppplStack_c0 = (long *******)&DAT_1400020e0;
    func_0x000145728390();
    if (local_88 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    ppppppplVar19 = local_b0;
    ppppppplVar27 = local_158;
    if ((long *******)(local_70 - local_60) < local_158) {
      local_58 = ppppppplStack_160;
      local_50 = local_168;
      func_0x0001457744b0();
      ppppppplVar28 = local_50;
LAB_1454381ee:
      func_0x0001457731ed();
    }
    else {
      ppppppplVar28 = local_168;
      if (local_158 != (long *******)0x0) goto LAB_1454381ee;
    }
    local_60 = local_60 + (long)ppppppplVar27;
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
    if (local_a8 != (long *******)0x0) {
      func_0x0001400021d0();
    }
  }
  if (ppppppplVar19[0x23] != (long ******)0x0) {
    func_0x0001455443c0();
    ppppppplVar22 = ppppppplStack_a0;
    ppppppplVar20 = local_98;
    func_0x00014546ac40(local_98,ppppppplStack_a0,ppppppplStack_a0,&local_168,local_98,0x14673d690);
    local_78 = local_158;
    local_88 = local_168;
    ppppppplStack_80 = ppppppplStack_160;
    local_c8 = (long *******)&local_88;
    ppppppplStack_c0 = (long *******)&DAT_1400020e0;
    func_0x000145728390();
    if (local_88 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    ppppppplVar19 = local_b0;
    ppppppplVar27 = local_158;
    if ((long *******)(local_70 - local_60) < local_158) {
      local_58 = ppppppplStack_160;
      local_50 = local_168;
      func_0x0001457744b0();
      ppppppplVar28 = local_50;
LAB_145438374:
      func_0x0001457731ed();
    }
    else {
      ppppppplVar28 = local_168;
      if (local_158 != (long *******)0x0) goto LAB_145438374;
    }
    local_60 = local_60 + (long)ppppppplVar27;
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
    if (local_a8 != (long *******)0x0) {
      func_0x0001400021d0();
    }
  }
  if (ppppppplVar19[0x26] != (long ******)0x0) {
    func_0x00014546ac40();
    local_78 = local_158;
    local_88 = local_168;
    ppppppplStack_80 = ppppppplStack_160;
    local_a8 = (long *******)&local_88;
    ppppppplStack_a0 = (long *******)&DAT_1400020e0;
    func_0x000145728390();
    if (local_88 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    ppppppplVar22 = local_158;
    if ((long *******)(local_70 - local_60) < local_158) {
      local_58 = ppppppplStack_160;
      local_50 = local_168;
      func_0x0001457744b0();
      ppppppplVar20 = local_50;
LAB_1454384cf:
      ppppppplVar19 = local_b0;
      func_0x0001457731ed();
    }
    else {
      ppppppplVar20 = local_168;
      ppppppplVar19 = local_b0;
      if (local_158 != (long *******)0x0) goto LAB_1454384cf;
    }
    local_60 = local_60 + (long)ppppppplVar22;
    if (ppppppplVar20 != (long *******)0x0) {
      func_0x0001400021d0();
    }
  }
  if (*(int *)(ppppppplVar14 + 0x39) == 0) goto LAB_1454385b2;
  ppppppplStack_80 = (long *******)0x14573a450;
  local_88 = ppppppplVar14 + 0x39;
  func_0x000145728390();
  ppppppplVar14 = local_158;
  if ((long *******)(local_70 - local_60) < local_158) {
    local_58 = ppppppplStack_160;
    local_50 = local_168;
    func_0x0001457744b0();
    ppppppplVar22 = local_50;
LAB_145438576:
    ppppppplVar19 = local_b0;
    func_0x0001457731ed();
  }
  else {
    ppppppplVar22 = local_168;
    ppppppplVar19 = local_b0;
    if (local_158 != (long *******)0x0) goto LAB_145438576;
  }
  local_60 = local_60 + (long)ppppppplVar14;
  if (ppppppplVar22 != (long *******)0x0) {
    func_0x0001400021d0();
  }
LAB_1454385b2:
  ppppppplVar14 = (long *******)ppppppplVar19[0x28];
  pppppplVar21 = ppppppplVar19[0x29];
  ppppppplVar19 = ppppppplVar14;
  do {
    if (ppppppplVar19 == ppppppplVar14 + (long)pppppplVar21) {
      param_4[2] = local_60;
      *param_4 = local_70;
      param_4[1] = lStack_68;
      return;
    }
    ppppppplVar22 = ppppppplVar19 + 1;
    func_0x0001455441f0();
    ppppppplVar20 = ppppppplStack_c0;
    uVar26 = local_b8;
    func_0x00014546ac40();
    local_148 = (long *******)((long)ppppppplVar19 + 2);
    local_78 = local_158;
    local_88 = local_168;
    ppppppplStack_80 = ppppppplStack_160;
    local_158 = (long *******)((long)ppppppplVar19 + 1);
    ppppppplStack_160 = (long *******)0x145736d20;
    local_150 = (undefined1 *)0x145736d20;
    local_140 = (undefined1 *)0x145736d20;
    local_138 = (long *******)&local_88;
    local_130 = &DAT_1400020e0;
    local_168 = ppppppplVar19;
    func_0x000145728390();
    if (local_88 != (long *******)0x0) {
      func_0x0001400021d0();
    }
    local_58 = local_a8;
    local_50 = ppppppplStack_a0;
    ppppppplVar19 = local_98;
    if ((long *******)(local_70 - local_60) < local_98) {
      func_0x0001457744b0();
LAB_1454386e8:
      func_0x0001457731ed();
    }
    else if (local_98 != (long *******)0x0) goto LAB_1454386e8;
    local_60 = local_60 + (long)ppppppplVar19;
    if (local_58 != (long *******)0x0) {
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
    if (local_c8 != (long *******)0x0) {
      func_0x0001400021d0();
    }
  } while( true );
}
