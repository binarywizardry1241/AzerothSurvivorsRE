void FUN_1458ecfd0(longlong param_1,ulonglong param_2)

{
  undefined4 *puVar1;
  undefined4 *puVar2;
  undefined1 uVar3;
  char cVar4;
  undefined1 uVar5;
  undefined8 uVar6;
  bool bVar7;
  code *pcVar8;
  undefined4 uVar9;
  undefined4 uVar10;
  undefined4 uVar11;
  undefined4 uVar12;
  undefined4 uVar13;
  undefined4 uVar14;
  undefined4 uVar15;
  undefined4 uVar16;
  undefined4 uVar17;
  undefined4 uVar18;
  undefined4 uVar19;
  undefined4 uVar20;
  undefined8 uVar21;
  undefined8 uVar22;
  undefined8 uVar23;
  ulonglong uVar24;
  longlong lVar25;
  longlong lVar26;
  char *pcVar27;
  undefined8 uVar28;
  longlong lVar29;
  undefined8 uVar30;
  undefined4 *puVar31;
  ulonglong uVar32;
  longlong lVar33;
  undefined *puVar34;
  byte bVar35;
  ulonglong uVar36;
  undefined4 *puVar37;
  undefined8 uVar38;
  undefined8 uStackX_8;
  longlong alStackX_10 [3];
  undefined8 uStack_48;

  uStack_48 = 0x1458ecfe6;
  lVar25 = FUN_145d13ac0();
  lVar25 = -lVar25;
  *(undefined8 *)(&stack0x00001390 + lVar25) = 0xfffffffffffffffe;
  if (param_2 != 0) {
    uVar36 = *(ulonglong *)(param_1 + 0x988);
    if (param_2 <= uVar36) {
      *(ulonglong *)(&stack0x00001380 + lVar25) = param_2;
      uVar32 = param_2 - 1;
      *(ulonglong *)(&stack0x00001378 + lVar25) = uVar32;
      if (uVar36 <= uVar32) {
LAB_1458ed9bd:
        *(undefined8 *)((longlong)&uStack_48 + lVar25) = 0x1458ed9d3;
        FUN_145eb709b(*(undefined8 *)(&stack0x00001378 + lVar25),uVar36,&DAT_14732f698);
                    /* WARNING: Does not return */
        pcVar8 = (code *)invalidInstructionException();
        (*pcVar8)();
      }
      lVar26 = *(longlong *)(param_1 + 0x980);
      lVar33 = uVar32 * 0x980;
      lVar29 = *(longlong *)(lVar26 + lVar33);
      *(undefined8 *)((longlong)&uStack_48 + lVar25) = 0x1458ed2d3;
      func_0x000145d145fb(&stack0x00000970 + lVar25,lVar26 + lVar33 + 8,0x978);
      *(undefined8 *)((longlong)&uStack_48 + lVar25) = 0x1458ed2ed;
      func_0x000145d14607(lVar26 + lVar33,lVar26 + lVar33 + 0x980,(uVar36 - param_2) * 0x980);
      uVar36 = uVar36 - 1;
      *(ulonglong *)(param_1 + 0x988) = uVar36;
      if (lVar29 == 2) goto LAB_1458ed9bd;
      *(longlong *)(&stack0xfffffffffffffff0 + lVar25) = lVar29;
      *(undefined8 *)((longlong)&uStack_48 + lVar25) = 0x1458ed31b;
      func_0x000145d145fb(&stack0xfffffffffffffff8 + lVar25,&stack0x00000970 + lVar25,0x978);
      uVar36 = *(ulonglong *)(&stack0x00001378 + lVar25);
      if (*(char *)(param_1 + 0xc41) == '\x01') {
        *(undefined8 *)(&stack0x00001348 + lVar25) = *(undefined8 *)(param_1 + 0xb40);
        lVar26 = *(longlong *)(param_1 + 0x638);
        lVar29 = *(longlong *)(param_1 + 0x640);
        *(undefined8 *)(param_1 + 0x640) = 0;
        *(longlong *)(&stack0x00000988 + lVar25) = lVar29;
        *(undefined8 *)(&stack0x00000990 + lVar25) = 0;
        *(longlong *)(&stack0x00000970 + lVar25) = lVar26;
        *(longlong *)(&stack0x00000978 + lVar25) = lVar29 * 0x20 + lVar26;
        *(longlong *)(&stack0x00000980 + lVar25) = param_1 + 0x630;
        *(undefined1 **)(&stack0x00000998 + lVar25) = &stack0x00001348 + lVar25;
        (&stack0x0000138f)[lVar25] = 1;
        *(undefined8 *)((longlong)&uStack_48 + lVar25) = 0x1458ed3b3;
        FUN_1459bc540(param_1 + 0xa38,&stack0x00000970 + lVar25);
        lVar26 = *(longlong *)(param_1 + 0x650);
        lVar29 = *(longlong *)(param_1 + 0x658);
        *(undefined8 *)(param_1 + 0x658) = 0;
        *(longlong *)(&stack0x00000988 + lVar25) = lVar29;
        *(undefined8 *)(&stack0x00000990 + lVar25) = 0;
        *(longlong *)(&stack0x00000970 + lVar25) = lVar26;
        *(longlong *)(&stack0x00000978 + lVar25) = lVar26 + lVar29 * 0x18;
        *(longlong *)(&stack0x00000980 + lVar25) = param_1 + 0x648;
        *(undefined1 **)(&stack0x00000998 + lVar25) = &stack0x00001348 + lVar25;
        (&stack0x0000138f)[lVar25] = 1;
        *(undefined8 *)((longlong)&uStack_48 + lVar25) = 0x1458ed424;
        FUN_1459bc470(param_1 + 0xa50,&stack0x00000970 + lVar25);
      }
      *(undefined8 *)((longlong)&uStack_48 + lVar25) = 0x1458ed431;
      func_0x000145920ed0(param_1,&stack0xfffffffffffffff0 + lVar25);
      *(undefined8 *)(param_1 + 0xb40) = *(undefined8 *)(&stack0x00001380 + lVar25);
      uVar38 = *(undefined8 *)(param_1 + 0x2d0);
      uVar30 = *(undefined8 *)(param_1 + 0x2d8);
      (&stack0x0000138f)[lVar25] = 1;
      *(undefined8 *)((longlong)&uStack_48 + lVar25) = 0x1458ed45c;
      FUN_1458db300(uVar38,uVar30,param_1);
      (&stack0x0000138f)[lVar25] = 1;
      *(undefined8 *)((longlong)&uStack_48 + lVar25) = 0x1458ed46c;
      FUN_145901040(param_1);
      *(undefined8 *)(param_1 + 0xb40) = 0;
      *(undefined8 *)((longlong)&uStack_48 + lVar25) = 0x1458ed487;
      func_0x000145920ed0(param_1,&stack0xfffffffffffffff0 + lVar25);
      *(undefined8 *)((longlong)&uStack_48 + lVar25) = 0x1458ed49c;
      func_0x000145d145fb(&stack0x00000970 + lVar25,&stack0xfffffffffffffff0 + lVar25,0x980);
      uVar32 = *(ulonglong *)(param_1 + 0x988);
      if (uVar36 <= uVar32) {
        if (uVar32 == *(ulonglong *)(param_1 + 0x978)) {
          *(undefined8 *)((longlong)&uStack_48 + lVar25) = 0x1458ed4bd;
          FUN_145e984e0();
        }
        lVar33 = lVar33 + *(longlong *)(param_1 + 0x980);
        if (uVar36 <= uVar32 && uVar32 - uVar36 != 0) {
          *(undefined8 *)((longlong)&uStack_48 + lVar25) = 0x1458ed4e3;
          func_0x000145d14607(lVar33 + 0x980,lVar33,(uVar32 - uVar36) * 0x980);
        }
        *(undefined8 *)((longlong)&uStack_48 + lVar25) = 0x1458ed4f8;
        func_0x000145d145fb(lVar33,&stack0x00000970 + lVar25,0x980);
        *(ulonglong *)(param_1 + 0x988) = uVar32 + 1;
        return;
      }
      *(undefined8 *)((longlong)&uStack_48 + lVar25) = 0x1458ed9ba;
      FUN_145eb7014(uVar36,uVar32,&DAT_14732f6b0);
      goto LAB_1458ed9bb;
    }
  }
  *(undefined8 *)((longlong)&uStack_48 + lVar25) = 0x1458ed01f;
  FUN_14597e330(param_1);
  uVar38 = *(undefined8 *)(param_1 + 0x2b8);
  uVar3 = *(undefined1 *)(param_1 + 0x32c);
  cVar4 = *(char *)(param_1 + 0x32d);
  uVar5 = *(undefined1 *)(param_1 + 0x32e);
  *(undefined8 *)((longlong)&uStack_48 + lVar25) = 0x1458ed04e;
  FUN_145ce7810(&stack0xfffffffffffffff0 + lVar25,param_1 + 0x1b0);
  uVar36 = *(ulonglong *)(param_1 + 0x1d8);
  uVar32 = uVar36 << 4;
  bVar7 = uVar36 >> 0x3c != 0;
  if (0x7ffffffffffffff8 < uVar32 || bVar7) {
    uVar38 = 0;
  }
  else {
    (&stack0x00001380)[lVar25] = uVar5;
    (&stack0x00001378)[lVar25] = uVar3;
    *(undefined8 *)(&stack0x00001370 + lVar25) = *(undefined8 *)(param_1 + 0x2a8);
    *(undefined8 *)(&stack0x00001368 + lVar25) = *(undefined8 *)(param_1 + 0x2b0);
    *(undefined8 *)(&stack0x00001320 + lVar25) = *(undefined8 *)(param_1 + 0x2c0);
    uVar30 = *(undefined8 *)(param_1 + 0x1d0);
    if (uVar32 == 0) {
      lVar26 = 8;
      uVar24 = 0;
joined_r0x0001458ed99d:
      if (uVar36 != 0) {
        *(undefined8 *)((longlong)&uStack_48 + lVar25) = 0x1458ed11d;
        func_0x000145d145fb(lVar26,uVar30,uVar32);
      }
      *(ulonglong *)(&stack0x00000988 + lVar25) = uVar24;
      *(longlong *)(&stack0x00000990 + lVar25) = lVar26;
      *(ulonglong *)(&stack0x00000998 + lVar25) = uVar36;
      uVar30 = *(undefined8 *)(param_1 + 0x2c8);
      uVar28 = *(undefined8 *)(param_1 + 0x278);
      uVar6 = *(undefined8 *)(param_1 + 0x280);
      uVar21 = *(undefined8 *)(param_1 + 0x288);
      uVar22 = *(undefined8 *)(param_1 + 0x290);
      uVar23 = *(undefined8 *)(param_1 + 0x2a0);
      *(undefined8 *)(&stack0x00000a58 + lVar25) = *(undefined8 *)(param_1 + 0x298);
      *(undefined8 *)(&stack0x00000a60 + lVar25) = uVar23;
      *(undefined8 *)(&stack0x00000a48 + lVar25) = uVar21;
      *(undefined8 *)(&stack0x00000a50 + lVar25) = uVar22;
      *(undefined8 *)(&stack0x00000a38 + lVar25) = uVar28;
      *(undefined8 *)(&stack0x00000a40 + lVar25) = uVar6;
      uVar28 = *(undefined8 *)(param_1 + 0x2d0);
      uVar6 = *(undefined8 *)(param_1 + 0x2d8);
      *(undefined8 *)(&stack0x00000a78 + lVar25) = uVar38;
      (&stack0x00000aec)[lVar25] = (&stack0x00001378)[lVar25];
      (&stack0x00000aed)[lVar25] = cVar4;
      (&stack0x00000aee)[lVar25] = (&stack0x00001380)[lVar25];
      (&stack0x00000af3)[lVar25] = *(undefined1 *)(param_1 + 0x333);
      *(undefined4 *)(&stack0x00000aef + lVar25) = *(undefined4 *)(param_1 + 0x32f);
      *(undefined8 *)(&stack0x00000970 + lVar25) =
           *(undefined8 *)(&stack0xfffffffffffffff0 + lVar25);
      *(undefined8 *)(&stack0x00000978 + lVar25) =
           *(undefined8 *)(&stack0xfffffffffffffff8 + lVar25);
      *(undefined8 *)(&stack0x00000980 + lVar25) =
           *(undefined8 *)((longlong)alStackX_10 + lVar25 + -0x10);
      *(undefined8 *)(&stack0x00000a68 + lVar25) = *(undefined8 *)(&stack0x00001370 + lVar25);
      *(undefined8 *)(&stack0x00000a70 + lVar25) = *(undefined8 *)(&stack0x00001368 + lVar25);
      *(undefined8 *)(&stack0x00000a80 + lVar25) = *(undefined8 *)(&stack0x00001320 + lVar25);
      uVar38 = *(undefined8 *)(param_1 + 0x2e8);
      uVar9 = *(undefined4 *)(param_1 + 0x2f0);
      uVar10 = *(undefined4 *)(param_1 + 0x2f4);
      uVar11 = *(undefined4 *)(param_1 + 0x2f8);
      uVar12 = *(undefined4 *)(param_1 + 0x2fc);
      uVar13 = *(undefined4 *)(param_1 + 0x300);
      uVar14 = *(undefined4 *)(param_1 + 0x304);
      uVar15 = *(undefined4 *)(param_1 + 0x308);
      uVar16 = *(undefined4 *)(param_1 + 0x30c);
      uVar17 = *(undefined4 *)(param_1 + 0x310);
      uVar18 = *(undefined4 *)(param_1 + 0x314);
      uVar19 = *(undefined4 *)(param_1 + 0x318);
      uVar20 = *(undefined4 *)(param_1 + 0x31c);
      *(undefined8 *)(&stack0x00000aa0 + lVar25) = *(undefined8 *)(param_1 + 0x2e0);
      *(undefined8 *)(&stack0x00000aa8 + lVar25) = uVar38;
      *(undefined4 *)(&stack0x00000ab0 + lVar25) = uVar9;
      *(undefined4 *)(&stack0x00000ab4 + lVar25) = uVar10;
      *(undefined4 *)(&stack0x00000ab8 + lVar25) = uVar11;
      *(undefined4 *)(&stack0x00000abc + lVar25) = uVar12;
      *(undefined4 *)(&stack0x00000ac0 + lVar25) = uVar13;
      *(undefined4 *)(&stack0x00000ac4 + lVar25) = uVar14;
      *(undefined4 *)(&stack0x00000ac8 + lVar25) = uVar15;
      *(undefined4 *)(&stack0x00000acc + lVar25) = uVar16;
      *(undefined4 *)(&stack0x00000ad0 + lVar25) = uVar17;
      *(undefined4 *)(&stack0x00000ad4 + lVar25) = uVar18;
      *(undefined4 *)(&stack0x00000ad8 + lVar25) = uVar19;
      *(undefined4 *)(&stack0x00000adc + lVar25) = uVar20;
      uVar9 = *(undefined4 *)(param_1 + 800);
      uVar10 = *(undefined4 *)(param_1 + 0x324);
      uVar11 = *(undefined4 *)(param_1 + 0x328);
      *(undefined4 *)(&stack0x00000adc + lVar25) = *(undefined4 *)(param_1 + 0x31c);
      *(undefined4 *)(&stack0x00000ae0 + lVar25) = uVar9;
      *(undefined4 *)(&stack0x00000ae4 + lVar25) = uVar10;
      *(undefined4 *)(&stack0x00000ae8 + lVar25) = uVar11;
      *(undefined8 *)((longlong)&uStack_48 + lVar25) = 0x1458ed251;
      func_0x000145d145fb(&stack0x000009a0 + lVar25,param_1 + 0x1e0,0x98);
      *(undefined8 *)(&stack0x00000a88 + lVar25) = uVar30;
      *(undefined8 *)(&stack0x00000a90 + lVar25) = uVar28;
      *(undefined8 *)(&stack0x00000a98 + lVar25) = uVar6;
      bVar35 = cVar4 - 2;
      if (bVar35 < 7) {
        puVar34 = *(undefined **)(&DAT_147332878 + (ulonglong)bVar35 * 8);
      }
      else {
        puVar34 = &DAT_146cc1ec8;
      }
      *(undefined **)(&stack0x00001378 + lVar25) = puVar34;
      uVar30 = 0x34;
      *(undefined8 *)((longlong)&uStack_48 + lVar25) = 0x1458ed52e;
      pcVar27 = (char *)FUN_1458dff90("{hero} the {race} {class} joins the party in {zone}.");
      uVar38 = uVar30;
      if (pcVar27 == (char *)0x0) {
        uVar38 = 0x34;
        pcVar27 = "{hero} the {race} {class} joins the party in {zone}.";
      }
      *(undefined8 *)((longlong)&uStack_48 + lVar25) = 0x1458ed549;
      uVar28 = FUN_145808210(*(undefined8 *)(&stack0x00001378 + lVar25));
      *(undefined8 *)(&stack0x00001310 + lVar25) = uVar28;
      *(undefined8 *)(&stack0x00001318 + lVar25) = uVar30;
      if ((byte)((&stack0x00000aec)[lVar25] - 2) < 10) {
        puVar34 = *(undefined **)
                   (&DAT_1473328f0 + (ulonglong)(byte)((&stack0x00000aec)[lVar25] - 2) * 8);
      }
      else {
        puVar34 = &DAT_146cc3058;
      }
      *(undefined **)(&stack0x00001348 + lVar25) = puVar34 + 0x10;
      *(undefined **)(&stack0x00001350 + lVar25) = &DAT_1400020c0;
      *(undefined8 *)((longlong)&uStack_48 + lVar25) = 0x1458ed5ac;
      FUN_145ce7350(&stack0xfffffffffffffff0 + lVar25,&DAT_146cb4e22,&stack0x00001348 + lVar25);
      uVar30 = *(undefined8 *)((longlong)alStackX_10 + lVar25 + -0x10);
      lVar26 = *(longlong *)(puVar34 + 0x20);
      uVar28 = *(undefined8 *)(puVar34 + 0x28);
      *(undefined8 *)(&stack0x00001380 + lVar25) =
           *(undefined8 *)(&stack0xfffffffffffffff8 + lVar25);
      *(undefined8 *)((longlong)&uStack_48 + lVar25) = 0x1458ed5c9;
      lVar29 = FUN_1458dff90();
      if (*(longlong *)(&stack0xfffffffffffffff0 + lVar25) != 0) {
        *(undefined8 *)((longlong)&uStack_48 + lVar25) = 0x1458ed5eb;
        func_0x0001400021d0(*(undefined8 *)(&stack0x00001380 + lVar25),
                            *(longlong *)(&stack0xfffffffffffffff0 + lVar25),1);
      }
      if (lVar29 == 0) {
        uVar30 = uVar28;
        lVar29 = lVar26;
      }
      *(longlong *)(&stack0x00001300 + lVar25) = lVar29;
      *(undefined8 *)(&stack0x00001308 + lVar25) = uVar30;
      *(undefined8 *)((longlong)&uStack_48 + lVar25) = 0x1458ed617;
      lVar29 = func_0x0001458095e0(*(undefined8 *)(&stack0x00000a68 + lVar25),
                                   *(undefined8 *)(&stack0x00000a70 + lVar25));
      lVar29 = lVar29 * 0xf0;
      *(undefined **)(&stack0x00001348 + lVar25) = &UNK_146cc0d10 + lVar29;
      *(undefined **)(&stack0x00001350 + lVar25) = &DAT_1400020c0;
      *(undefined8 *)((longlong)&uStack_48 + lVar25) = 0x1458ed659;
      FUN_145ce7350(&stack0xfffffffffffffff0 + lVar25,&DAT_146cb4ef6,&stack0x00001348 + lVar25);
      uVar30 = *(undefined8 *)((longlong)alStackX_10 + lVar25 + -0x10);
      lVar26 = *(longlong *)(&DAT_146cc0d20 + lVar29);
      uVar28 = *(undefined8 *)(&DAT_146cc0d28 + lVar29);
      *(undefined8 *)(&stack0x00001380 + lVar25) =
           *(undefined8 *)(&stack0xfffffffffffffff8 + lVar25);
      *(undefined8 *)((longlong)&uStack_48 + lVar25) = 0x1458ed679;
      lVar29 = FUN_1458dff90();
      if (*(longlong *)(&stack0xfffffffffffffff0 + lVar25) != 0) {
        *(undefined8 *)((longlong)&uStack_48 + lVar25) = 0x1458ed69b;
        func_0x0001400021d0(*(undefined8 *)(&stack0x00001380 + lVar25),
                            *(longlong *)(&stack0xfffffffffffffff0 + lVar25),1);
      }
      if (lVar29 == 0) {
        uVar30 = uVar28;
        lVar29 = lVar26;
      }
      *(longlong *)(&stack0x000012f0 + lVar25) = lVar29;
      *(undefined8 *)(&stack0x000012f8 + lVar25) = uVar30;
      *(undefined **)(&stack0xfffffffffffffff0 + lVar25) = &DAT_14732f890;
      *(undefined8 *)(&stack0xfffffffffffffff8 + lVar25) = 4;
      *(undefined1 **)((longlong)alStackX_10 + lVar25 + -0x10) = &stack0x00000970 + lVar25;
      *(undefined **)((longlong)&uStackX_8 + lVar25) = &DAT_14732f870;
      *(undefined **)((longlong)alStackX_10 + lVar25) = &DAT_14732f8b8;
      *(undefined8 *)((longlong)alStackX_10 + lVar25 + 8) = 4;
      *(undefined1 **)((longlong)alStackX_10 + lVar25 + 0x10) = &stack0x00001310 + lVar25;
      *(undefined **)(&stack0x00000028 + lVar25) = &DAT_14732f898;
      *(undefined **)(&stack0x00000030 + lVar25) = &DAT_14732f8bc;
      *(undefined8 *)(&stack0x00000038 + lVar25) = 5;
      *(undefined1 **)(&stack0x00000040 + lVar25) = &stack0x00001300 + lVar25;
      *(undefined **)(&stack0x00000048 + lVar25) = &DAT_14732f898;
      *(undefined **)(&stack0x00000050 + lVar25) = &DAT_14732f8c1;
      *(undefined8 *)(&stack0x00000058 + lVar25) = 4;
      *(undefined1 **)(&stack0x00000060 + lVar25) = &stack0x000012f0 + lVar25;
      *(undefined **)(&stack0x00000068 + lVar25) = &DAT_14732f898;
      *(undefined8 *)(&stack0xffffffffffffffe0 + lVar25) = 4;
      *(undefined8 *)((longlong)&uStack_48 + lVar25) = 0x1458ed769;
      FUN_1458e0370(&stack0x00001330 + lVar25,pcVar27,uVar38,&stack0xfffffffffffffff0 + lVar25);
      *(undefined8 *)(&stack0x00001380 + lVar25) = *(undefined8 *)(&stack0x00001338 + lVar25);
      *(undefined8 *)((longlong)&uStack_48 + lVar25) = 0x1458ed78b;
      FUN_1459ae7c0(&stack0x00001348 + lVar25,*(undefined8 *)(&stack0x00001338 + lVar25),
                    *(undefined8 *)(&stack0x00001340 + lVar25));
      lVar26 = *(longlong *)(param_1 + 0x640);
      if (lVar26 == *(longlong *)(param_1 + 0x630)) {
        *(undefined8 *)((longlong)&uStack_48 + lVar25) = 0x1458ed7a8;
        FUN_145d150f0(param_1 + 0x630);
      }
      lVar29 = *(longlong *)(param_1 + 0x638);
      uVar9 = *(undefined4 *)(&stack0x00001348 + lVar25);
      uVar10 = *(undefined4 *)(&stack0x0000134c + lVar25);
      uVar11 = *(undefined4 *)(&stack0x00001350 + lVar25);
      uVar12 = *(undefined4 *)(&stack0x00001354 + lVar25);
      uVar13 = *(undefined4 *)(&stack0x0000135c + lVar25);
      uVar14 = *(undefined4 *)(&stack0x00001360 + lVar25);
      uVar15 = *(undefined4 *)(&stack0x00001364 + lVar25);
      puVar31 = (undefined4 *)(lVar29 + 0x10 + lVar26 * 0x20);
      *puVar31 = *(undefined4 *)(&stack0x00001358 + lVar25);
      puVar31[1] = uVar13;
      puVar31[2] = uVar14;
      puVar31[3] = uVar15;
      puVar31 = (undefined4 *)(lVar29 + lVar26 * 0x20);
      *puVar31 = uVar9;
      puVar31[1] = uVar10;
      puVar31[2] = uVar11;
      puVar31[3] = uVar12;
      *(longlong *)(param_1 + 0x640) = lVar26 + 1;
      if (*(longlong *)(&stack0x00001330 + lVar25) != 0) {
        *(undefined8 *)((longlong)&uStack_48 + lVar25) = 0x1458ed7f6;
        func_0x0001400021d0(*(undefined8 *)(&stack0x00001380 + lVar25),
                            *(longlong *)(&stack0x00001330 + lVar25),1);
      }
      *(undefined8 *)((longlong)&uStack_48 + lVar25) = 0x1458ed807;
      FUN_145808540(&stack0xfffffffffffffff0 + lVar25,*(undefined8 *)(&stack0x00001378 + lVar25));
      *(undefined8 *)(&stack0x00001370 + lVar25) =
           *(undefined8 *)(&stack0xfffffffffffffff0 + lVar25);
      puVar31 = *(undefined4 **)(&stack0xfffffffffffffff8 + lVar25);
      puVar37 = puVar31 + *(longlong *)((longlong)alStackX_10 + lVar25 + -0x10) * 4;
      *(undefined4 **)(&stack0x00001368 + lVar25) = puVar31;
      for (; puVar31 != puVar37; puVar31 = puVar31 + 4) {
        uVar9 = puVar31[1];
        uVar10 = puVar31[2];
        uVar11 = puVar31[3];
        *(undefined4 *)(&stack0x00001330 + lVar25) = *puVar31;
        *(undefined4 *)(&stack0x00001334 + lVar25) = uVar9;
        *(undefined4 *)(&stack0x00001338 + lVar25) = uVar10;
        *(undefined4 *)(&stack0x0000133c + lVar25) = uVar11;
        *(undefined1 **)(&stack0x00001348 + lVar25) = &stack0x00001330 + lVar25;
        *(undefined **)(&stack0x00001350 + lVar25) = &DAT_1400020c0;
        *(undefined8 *)((longlong)&uStack_48 + lVar25) = 0x1458ed881;
        FUN_145ce7350(&stack0xfffffffffffffff0 + lVar25,&DAT_14732f8c5,&stack0x00001348 + lVar25);
        *(undefined8 *)(&stack0x00001378 + lVar25) =
             *(undefined8 *)(&stack0xfffffffffffffff0 + lVar25);
        uVar38 = *(undefined8 *)((longlong)alStackX_10 + lVar25 + -0x10);
        *(undefined8 *)(&stack0x00001380 + lVar25) =
             *(undefined8 *)(&stack0xfffffffffffffff8 + lVar25);
        *(undefined8 *)((longlong)&uStack_48 + lVar25) = 0x1458ed8a4;
        FUN_1459ae7c0(&stack0xfffffffffffffff0 + lVar25,
                      *(undefined8 *)(&stack0xfffffffffffffff8 + lVar25),uVar38);
        lVar26 = *(longlong *)(param_1 + 0x640);
        if (lVar26 == *(longlong *)(param_1 + 0x630)) {
          *(undefined8 *)((longlong)&uStack_48 + lVar25) = 0x1458ed8c1;
          FUN_145d150f0(param_1 + 0x630);
        }
        lVar29 = *(longlong *)(param_1 + 0x638);
        uVar9 = *(undefined4 *)(&stack0xfffffffffffffff0 + lVar25);
        uVar10 = *(undefined4 *)(&stack0xfffffffffffffff4 + lVar25);
        uVar11 = *(undefined4 *)(&stack0xfffffffffffffff8 + lVar25);
        uVar12 = *(undefined4 *)(&stack0xfffffffffffffffc + lVar25);
        puVar1 = (undefined4 *)((longlong)alStackX_10 + lVar25 + -0x10);
        uVar13 = puVar1[1];
        uVar14 = puVar1[2];
        uVar15 = puVar1[3];
        puVar2 = (undefined4 *)(lVar29 + 0x10 + lVar26 * 0x20);
        *puVar2 = *puVar1;
        puVar2[1] = uVar13;
        puVar2[2] = uVar14;
        puVar2[3] = uVar15;
        puVar1 = (undefined4 *)(lVar29 + lVar26 * 0x20);
        *puVar1 = uVar9;
        puVar1[1] = uVar10;
        puVar1[2] = uVar11;
        puVar1[3] = uVar12;
        *(longlong *)(param_1 + 0x640) = lVar26 + 1;
        if (*(longlong *)(&stack0x00001378 + lVar25) != 0) {
          *(undefined8 *)((longlong)&uStack_48 + lVar25) = 0x1458ed90d;
          func_0x0001400021d0(*(undefined8 *)(&stack0x00001380 + lVar25),
                              *(longlong *)(&stack0x00001378 + lVar25),1);
        }
      }
      if (*(longlong *)(&stack0x00001370 + lVar25) != 0) {
        *(undefined8 *)((longlong)&uStack_48 + lVar25) = 0x1458ed934;
        func_0x0001400021d0(*(undefined8 *)(&stack0x00001368 + lVar25),
                            *(longlong *)(&stack0x00001370 + lVar25) << 4,8);
      }
      if (*(longlong *)(&stack0x00000970 + lVar25) != 0) {
        *(undefined8 *)((longlong)&uStack_48 + lVar25) = 0x1458ed952;
        func_0x0001400021d0(*(undefined8 *)(&stack0x00000978 + lVar25),
                            *(longlong *)(&stack0x00000970 + lVar25),1);
      }
      if (*(longlong *)(&stack0x00000988 + lVar25) != 0) {
        *(undefined8 *)((longlong)&uStack_48 + lVar25) = 0x1458ed974;
        func_0x0001400021d0(*(undefined8 *)(&stack0x00000990 + lVar25),
                            *(longlong *)(&stack0x00000988 + lVar25) << 4,8);
      }
      *(undefined8 *)((longlong)&uStack_48 + lVar25) = 0x1458ed97c;
      FUN_145901040(param_1);
      return;
    }
    *(undefined8 *)(&stack0x00001328 + lVar25) = uVar38;
    *(undefined8 *)((longlong)&uStack_48 + lVar25) = 0x1458ed0e5;
    func_0x000140002200(CONCAT71(0x7fffffffffffff,0x7ffffffffffffff8 < uVar32 || bVar7),uVar30);
    uVar38 = 8;
    *(undefined8 *)((longlong)&uStack_48 + lVar25) = 0x1458ed0f8;
    lVar26 = func_0x0001400021c0(uVar32,8);
    if (lVar26 != 0) {
      uVar38 = *(undefined8 *)(&stack0x00001328 + lVar25);
      uVar24 = uVar36;
      goto joined_r0x0001458ed99d;
    }
  }
  *(undefined8 *)((longlong)&uStack_48 + lVar25) = 0x1458ed088;
  FUN_145eb6fcb(uVar38,uVar32);
LAB_1458ed9bb:
                    /* WARNING: Does not return */
  pcVar8 = (code *)invalidInstructionException();
  (*pcVar8)();
}
