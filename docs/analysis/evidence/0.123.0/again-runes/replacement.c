
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(void)

{
  float fVar1;
  undefined1 uVar2;
  int iVar3;
  int iVar4;
  undefined8 uVar5;
  code *pcVar6;
  long lVar7;
  undefined4 uVar8;
  undefined4 uVar9;
  undefined4 uVar10;
  undefined4 uVar11;
  undefined4 uVar12;
  undefined4 uVar13;
  undefined4 uVar14;
  undefined4 uVar15;
  undefined8 uVar16;
  ulong uVar17;
  undefined1 uVar18;
  uint uVar19;
  long lVar20;
  long *plVar21;
  undefined8 uVar22;
  undefined8 *in_RCX;
  ulong uVar23;
  long lVar24;
  undefined1 uVar25;
  ulong uVar26;
  undefined8 *puVar27;
  undefined8 uVar28;
  undefined8 uVar29;
  long lVar30;
  bool bVar31;
  bool bVar32;
  undefined4 uVar33;
  undefined4 uVar34;
  undefined8 in_XMM6_Qa;
  undefined4 uVar35;
  undefined4 in_XMM6_Dc;
  undefined4 uVar36;
  undefined4 in_XMM6_Dd;
  undefined4 uVar37;
  undefined1 auVar38 [16];
  undefined8 uStack_48;
  
  uVar34 = (undefined4)((ulong)in_XMM6_Qa >> 0x20);
  uVar33 = (undefined4)in_XMM6_Qa;
  uStack_48 = 0x145c26336;
  auVar38 = func_0x0001460044e0();
  lVar20 = auVar38._8_8_;
  lVar7 = -auVar38._0_8_;
  *(undefined4 *)(&stack0x00001130 + lVar7) = uVar33;
  *(undefined4 *)(&stack0x00001134 + lVar7) = uVar34;
  *(undefined4 *)(&stack0x00001138 + lVar7) = in_XMM6_Dc;
  *(undefined4 *)(&stack0x0000113c + lVar7) = in_XMM6_Dd;
  *(undefined8 *)(&stack0x00001128 + lVar7) = 0xfffffffffffffffe;
  if (*(long *)(lVar20 + 0x16d0) == -1) {
    *in_RCX = 2;
    return;
  }
  uVar22 = *(undefined8 *)(lVar20 + 0x1800);
  uVar18 = *(undefined1 *)(lVar20 + 0x1874);
  uVar2 = *(undefined1 *)(lVar20 + 0x1875);
  uVar25 = *(undefined1 *)(lVar20 + 0x1876);
  *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145c26392;
  func_0x000145fd8260();
  uVar23 = *(ulong *)(lVar20 + 0x16f8);
  if (0x7ffffffffffffff8 < uVar23 << 4 || uVar23 >> 0x3c != 0) {
LAB_145c263c1:
    *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145c263cc;
    func_0x0001461add5b();
    goto LAB_145c26d6d;
  }
  *(undefined8 *)(&stack0x000010e8 + lVar7) = uVar22;
  (&stack0x00001123)[lVar7] = uVar2;
  (&stack0x00001122)[lVar7] = uVar18;
  *(undefined8 **)(&stack0x00001100 + lVar7) = in_RCX;
  *(undefined8 *)(&stack0x000010f0 + lVar7) = *(undefined8 *)(lVar20 + 0x17f0);
  uVar22 = *(undefined8 *)(lVar20 + 0x17f8);
  *(long *)(&stack0x00001110 + lVar7) = lVar20;
  if (uVar23 << 4 == 0) {
    *(undefined8 *)(&stack0x00001118 + lVar7) = 8;
    *(undefined8 *)(&stack0x00001108 + lVar7) = 0;
  }
  else {
    *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145c26431;
    func_0x000140002200();
    *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145c26444;
    lVar20 = func_0x0001400021c0();
    *(long *)(&stack0x00001118 + lVar7) = lVar20;
    if (lVar20 == 0) goto LAB_145c263c1;
    *(ulong *)(&stack0x00001108 + lVar7) = uVar23;
    lVar20 = *(long *)(&stack0x00001110 + lVar7);
  }
  if (uVar23 != 0) {
    *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145c2647f;
    func_0x00014600504b();
  }
  uVar26 = *(ulong *)(lVar20 + 0x1718);
  if (0x7ffffffffffffffc < uVar26 * 8 || uVar26 >> 0x3d != 0) {
LAB_145c264ae:
    *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145c264b9;
    func_0x0001461add5b();
    goto LAB_145c26d6d;
  }
  *(undefined8 *)(&stack0x000010f8 + lVar7) = uVar22;
  (&stack0x00001124)[lVar7] = uVar25;
  (&stack0x00001125)[lVar7] = *(undefined1 *)(lVar20 + 0x1700);
  uVar18 = *(undefined1 *)(lVar20 + 0x188f);
  uVar33 = (undefined4)*(undefined8 *)(lVar20 + 0x186c);
  uVar34 = (undefined4)((ulong)*(undefined8 *)(lVar20 + 0x186c) >> 0x20);
  if (uVar26 * 8 == 0) {
    lVar20 = 4;
    (&stack0x00001126)[lVar7] = uVar18;
    uVar17 = 0;
  }
  else {
    *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145c264ff;
    func_0x000140002200();
    *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145c26511;
    lVar20 = func_0x0001400021c0();
    if (lVar20 == 0) goto LAB_145c264ae;
    (&stack0x00001126)[lVar7] = uVar18;
    uVar17 = uVar26;
  }
  if (uVar26 != 0) {
    *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145c26536;
    func_0x00014600504b();
  }
  lVar30 = *(long *)(&stack0x00001110 + lVar7);
  *(undefined8 *)(&stack0x00001038 + lVar7) = *(undefined8 *)(lVar30 + 0x17e8);
  uVar22 = *(undefined8 *)(lVar30 + 0x17b8);
  uVar28 = *(undefined8 *)(lVar30 + 0x17c0);
  uVar5 = *(undefined8 *)(lVar30 + 0x17c8);
  uVar29 = *(undefined8 *)(lVar30 + 0x17d0);
  uVar16 = *(undefined8 *)(lVar30 + 0x17e0);
  *(undefined8 *)(&stack0x00001028 + lVar7) = *(undefined8 *)(lVar30 + 0x17d8);
  *(undefined8 *)(&stack0x00001030 + lVar7) = uVar16;
  *(undefined8 *)(&stack0x00001018 + lVar7) = uVar5;
  *(undefined8 *)(&stack0x00001020 + lVar7) = uVar29;
  *(undefined8 *)(&stack0x00001008 + lVar7) = uVar22;
  *(undefined8 *)(&stack0x00001010 + lVar7) = uVar28;
  uVar22 = *(undefined8 *)(lVar30 + 0x1810);
  uVar28 = *(undefined8 *)(lVar30 + 0x1818);
  (&stack0x000010cb)[lVar7] = *(undefined1 *)(lVar30 + 0x187b);
  *(undefined4 *)(&stack0x000010c7 + lVar7) = *(undefined4 *)(lVar30 + 0x1877);
  *(undefined8 *)(&stack0x00000f30 + lVar7) = *(undefined8 *)(&stack0x00000010 + lVar7);
  uVar5 = *(undefined8 *)((long)(&stack0x00000000 + lVar7) + 8);
  *(undefined8 *)(&stack0x00000f20 + lVar7) = *(undefined8 *)(&stack0x00000000 + lVar7);
  *(undefined8 *)(&stack0x00000f28 + lVar7) = uVar5;
  uVar5 = *(undefined8 *)(lVar30 + 0x1864);
  *(undefined8 *)(&stack0x000010ac + lVar7) = *(undefined8 *)(lVar30 + 0x185c);
  *(undefined8 *)(&stack0x000010b4 + lVar7) = uVar5;
  uVar5 = *(undefined8 *)(lVar30 + 0x1820);
  uVar29 = *(undefined8 *)(lVar30 + 0x1828);
  uVar35 = *(undefined4 *)(lVar30 + 0x1830);
  uVar36 = *(undefined4 *)(lVar30 + 0x1834);
  uVar37 = *(undefined4 *)(lVar30 + 0x1838);
  uVar8 = *(undefined4 *)(lVar30 + 0x183c);
  uVar9 = *(undefined4 *)(lVar30 + 0x1840);
  uVar10 = *(undefined4 *)(lVar30 + 0x1844);
  uVar11 = *(undefined4 *)(lVar30 + 0x1848);
  uVar12 = *(undefined4 *)(lVar30 + 0x184c);
  uVar13 = *(undefined4 *)(lVar30 + 0x1854);
  uVar14 = *(undefined4 *)(lVar30 + 0x1858);
  uVar15 = *(undefined4 *)(lVar30 + 0x185c);
  *(undefined4 *)(&stack0x000010a0 + lVar7) = *(undefined4 *)(lVar30 + 0x1850);
  *(undefined4 *)(&stack0x000010a4 + lVar7) = uVar13;
  *(undefined4 *)(&stack0x000010a8 + lVar7) = uVar14;
  *(undefined4 *)(&stack0x000010ac + lVar7) = uVar15;
  *(undefined4 *)(&stack0x00001090 + lVar7) = uVar9;
  *(undefined4 *)(&stack0x00001094 + lVar7) = uVar10;
  *(undefined4 *)(&stack0x00001098 + lVar7) = uVar11;
  *(undefined4 *)(&stack0x0000109c + lVar7) = uVar12;
  *(undefined4 *)(&stack0x00001080 + lVar7) = uVar35;
  *(undefined4 *)(&stack0x00001084 + lVar7) = uVar36;
  *(undefined4 *)(&stack0x00001088 + lVar7) = uVar37;
  *(undefined4 *)(&stack0x0000108c + lVar7) = uVar8;
  *(undefined8 *)(&stack0x00001070 + lVar7) = uVar5;
  *(undefined8 *)(&stack0x00001078 + lVar7) = uVar29;
  *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145c2661b;
  func_0x00014600504b();
  uVar5 = *(undefined8 *)(lVar30 + 0x1884);
  *(undefined8 *)(&stack0x000010cc + lVar7) = *(undefined8 *)(lVar30 + 0x187c);
  *(undefined8 *)(&stack0x000010d4 + lVar7) = uVar5;
  *(undefined4 *)(&stack0x000010db + lVar7) = *(undefined4 *)(lVar30 + 0x188b);
  *(undefined8 *)(&stack0x00000f38 + lVar7) = *(undefined8 *)(&stack0x00001108 + lVar7);
  *(undefined8 *)(&stack0x00000f40 + lVar7) = *(undefined8 *)(&stack0x00001118 + lVar7);
  *(ulong *)(&stack0x00000f48 + lVar7) = uVar23;
  (&stack0x00000f50)[lVar7] = (&stack0x00001125)[lVar7];
  *(ulong *)(&stack0x00000f58 + lVar7) = uVar17;
  *(long *)(&stack0x00000f60 + lVar7) = lVar20;
  *(ulong *)(&stack0x00000f68 + lVar7) = uVar26;
  *(undefined8 *)(&stack0x00001040 + lVar7) = *(undefined8 *)(&stack0x000010f0 + lVar7);
  *(undefined8 *)(&stack0x00001048 + lVar7) = *(undefined8 *)(&stack0x000010f8 + lVar7);
  *(undefined8 *)(&stack0x00001050 + lVar7) = *(undefined8 *)(&stack0x000010e8 + lVar7);
  *(undefined8 *)(&stack0x00001060 + lVar7) = uVar22;
  *(undefined8 *)(&stack0x00001068 + lVar7) = uVar28;
  lVar20 = *(long *)(lVar30 + 0x1ab8) * 0x5851f42d4c957f2d + 0x14057b7ef767814f;
  *(ulong *)(&stack0x000010bc + lVar7) = CONCAT44(uVar34,uVar33);
  (&stack0x000010c4)[lVar7] = (&stack0x00001122)[lVar7];
  (&stack0x000010c5)[lVar7] = (&stack0x00001123)[lVar7];
  (&stack0x000010c6)[lVar7] = (&stack0x00001124)[lVar7];
  (&stack0x000010df)[lVar7] = (&stack0x00001126)[lVar7];
  *(long *)(lVar30 + 0x1ab8) = lVar20;
  *(long *)(&stack0x00001058 + lVar7) = lVar20;
  *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145c26723;
  lVar20 = func_0x000145aaef50();
  lVar20 = lVar20 * 0xf0;
  lVar24 = lVar20 + 0x146fd8f70;
  puVar27 = (undefined8 *)(lVar30 + 0x1aa0);
  plVar21 = *(long **)(lVar30 + 0x1aa0);
  if (plVar21 == (long *)0x0) {
    iVar4 = *(int *)(lVar20 + 0x146fd9030);
joined_r0x000145c26857:
    if (iVar4 < 0xbd) {
      uVar28 = 9;
      uVar22 = 0x1476a9e6e;
      if (iVar4 == 0) {
        uVar22 = 0x1476a9e35;
        uVar28 = 7;
      }
      else if (iVar4 == 1) {
        uVar22 = 0x1476a9e3c;
        uVar28 = 8;
      }
      else if (iVar4 == 0x1e) {
        uVar22 = 0x1476a9e65;
      }
    }
    else {
      uVar28 = 9;
      uVar22 = 0x1476a9e6e;
      if (iVar4 == 0xbd) {
        uVar22 = 0x1476a9e44;
        uVar28 = 0x12;
      }
      else if (iVar4 == 0x211) {
        uVar22 = 0x1476a9e77;
      }
      else if (iVar4 == 0x215) {
        uVar22 = 0x1476a9e56;
        uVar28 = 0xf;
      }
    }
    *(undefined4 *)(&stack0x00000d68 + lVar7) = *(undefined4 *)(lVar20 + 0x146fd9040);
    fVar1 = *(float *)(lVar20 + 0x146fd9048);
    *(undefined8 *)(&stack0x00000d60 + lVar7) = *(undefined8 *)(lVar20 + 0x146fd9038);
    uVar5 = *(undefined8 *)(lVar20 + 0x146fd8fd0);
    if (*(char *)(lVar20 + 0x146fd905c) == '\0') {
      uVar29 = 0;
    }
    else {
      uVar29 = *(undefined8 *)(lVar20 + 0x146fd8fc8);
    }
    (&stack0x00001127)[lVar7] = 1;
    *(undefined8 *)(&stack0xfffffffffffffff0 + lVar7) = uVar5;
    *(undefined8 *)(&stack0xffffffffffffffe8 + lVar7) = uVar29;
    *(float *)(&stack0xffffffffffffffe0 + lVar7) = fVar1 + _DAT_1461b26f4;
    *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145c2691b;
    func_0x000145bed460(puVar27,lVar24,uVar22,&stack0x00000010 + lVar7,uVar28,
                        &stack0x00000d60 + lVar7);
    *(undefined8 *)(&stack0x00000000 + lVar7) = 1;
    *(undefined8 *)(&stack0x00000008 + lVar7) = 1;
    *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145c26931;
    func_0x000140002200();
    *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145c26940;
    plVar21 = (long *)func_0x0001400021c0();
    if (plVar21 == (long *)0x0) {
      *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145c26d6c;
      func_0x0001461add41();
LAB_145c26d6d:
                    /* WARNING: Does not return */
      pcVar6 = (code *)invalidInstructionException();
      (*pcVar6)();
    }
    *(int *)(&stack0x00001118 + lVar7) = iVar4;
    *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145c26964;
    func_0x00014600504b();
    *(long **)(&stack0x00000d60 + lVar7) = plVar21;
    *(long **)(&stack0x00001108 + lVar7) = plVar21;
    LOCK();
    lVar20 = *plVar21;
    *plVar21 = *plVar21 + 1;
    UNLOCK();
    if (*plVar21 == 0 || SCARRY8(lVar20,1) != *plVar21 < 0) goto LAB_145c26d6d;
    *(undefined4 *)(&stack0x00000008 + lVar7) = *(undefined4 *)(lVar24 + 0xd0);
    *(undefined8 *)(&stack0x00000000 + lVar7) = *(undefined8 *)(lVar24 + 200);
    plVar21 = (long *)*puVar27;
    if (plVar21 != (long *)0x0) {
      LOCK();
      *plVar21 = *plVar21 + -1;
      UNLOCK();
      if (*plVar21 == 0) {
        *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145c269a6;
        func_0x000145bf4500();
      }
    }
    lVar30 = *(long *)(&stack0x00001110 + lVar7);
    *(undefined4 *)(lVar30 + 0x1a90) = *(undefined4 *)(&stack0x00001118 + lVar7);
    *(undefined8 *)(lVar30 + 0x1a94) = *(undefined8 *)(&stack0x00000000 + lVar7);
    *(undefined4 *)(lVar30 + 0x1a9c) = *(undefined4 *)(&stack0x00000008 + lVar7);
    *(undefined8 *)(lVar30 + 0x1aa0) = *(undefined8 *)(&stack0x00001108 + lVar7);
    uVar22 = *(undefined8 *)(&stack0x00000d60 + lVar7);
  }
  else {
    iVar3 = *(int *)(lVar30 + 0x1a90);
    iVar4 = *(int *)(lVar20 + 0x146fd9030);
    if (((((iVar3 != *(int *)(lVar20 + 0x146fd9030)) ||
          (iVar4 = iVar3, *(float *)(lVar30 + 0x1a94) != *(float *)(lVar20 + 0x146fd9038))) ||
         (NAN(*(float *)(lVar30 + 0x1a94)) || NAN(*(float *)(lVar20 + 0x146fd9038)))) ||
        ((*(float *)(lVar30 + 0x1a98) != *(float *)(lVar20 + 0x146fd903c) ||
         (NAN(*(float *)(lVar30 + 0x1a98)) || NAN(*(float *)(lVar20 + 0x146fd903c)))))) ||
       ((*(float *)(lVar30 + 0x1a9c) != *(float *)(lVar20 + 0x146fd9040) ||
        (NAN(*(float *)(lVar30 + 0x1a9c)) || NAN(*(float *)(lVar20 + 0x146fd9040))))))
    goto joined_r0x000145c26857;
    LOCK();
    lVar20 = *plVar21;
    *plVar21 = *plVar21 + 1;
    UNLOCK();
    if (*plVar21 == 0 || SCARRY8(lVar20,1) != *plVar21 < 0) goto LAB_145c26d6d;
    uVar22 = *puVar27;
  }
  *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145c26a01;
  func_0x00014600504b(uVar22);
  (&stack0x00001127)[lVar7] = 0;
  *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145c26a17;
  func_0x000145b15970();
  pcVar6 = *(code **)(*(long *)(lVar30 + 0x19f8) + 0x40);
  *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145c26a29;
  uVar18 = (*pcVar6)();
  (&stack0x00000d42)[lVar7] = uVar18;
  (&stack0x00000d47)[lVar7] = *(undefined1 *)(lVar30 + 0x1b0b);
  (&stack0x00000d48)[lVar7] = *(undefined1 *)(lVar30 + 0x1b0c);
  (&stack0x00000d40)[lVar7] = *(undefined1 *)(lVar30 + 0x1b0d);
  *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145c26a73;
  func_0x000145fc88c0();
  lVar20 = *(long *)(&stack0x00000d60 + lVar7);
  if (lVar20 == -2) {
    if (*(long *)(&stack0x00000d68 + lVar7) == -1) goto LAB_145c26acd;
    if (*(long *)(&stack0x00000d78 + lVar7) == 1) {
      bVar31 = **(char **)(&stack0x00000d70 + lVar7) == '1';
    }
    else {
      bVar31 = false;
    }
    if (*(long *)(&stack0x00000d68 + lVar7) != 0) {
      *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145c26d58;
      func_0x0001400021d0();
    }
  }
  else {
    if ((lVar20 != -1) && (lVar20 != 0)) {
      *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145c26a9e;
      func_0x0001400021d0();
    }
LAB_145c26acd:
    bVar31 = false;
  }
  (&stack0x00000d4b)[lVar7] = bVar31;
  *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145c26af1;
  func_0x000145fc88c0();
  lVar20 = *(long *)(&stack0x00000d60 + lVar7);
  if (lVar20 == -2) {
    if (*(long *)(&stack0x00000d78 + lVar7) == 1) {
      bVar32 = **(char **)(&stack0x00000d70 + lVar7) == '1';
    }
    else {
      bVar32 = false;
    }
    (&stack0x00000d4c)[lVar7] = bVar32;
    lVar20 = *(long *)(&stack0x00000d68 + lVar7);
LAB_145c26b3d:
    if (lVar20 != 0) {
      *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145c26b51;
      func_0x0001400021d0();
    }
  }
  else {
    (&stack0x00000d4c)[lVar7] = 0;
    if (lVar20 != -1) goto LAB_145c26b3d;
  }
  *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145c26b6e;
  func_0x000145fc88c0();
  lVar20 = *(long *)(&stack0x00000d60 + lVar7);
  if (lVar20 == -2) {
    if (*(long *)(&stack0x00000d78 + lVar7) == 1) {
      bVar32 = **(char **)(&stack0x00000d70 + lVar7) == '1';
    }
    else {
      bVar32 = false;
    }
    (&stack0x00000d4d)[lVar7] = bVar32;
    lVar20 = *(long *)(&stack0x00000d68 + lVar7);
LAB_145c26bba:
    if (lVar20 != 0) {
      *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145c26bce;
      func_0x0001400021d0();
    }
  }
  else {
    (&stack0x00000d4d)[lVar7] = 0;
    if (lVar20 != -1) goto LAB_145c26bba;
  }
  *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145c26be8;
  uVar33 = func_0x000145fc88c0();
  lVar20 = *(long *)(&stack0x00000d60 + lVar7);
  if (lVar20 == -2) {
    if (*(long *)(&stack0x00000d68 + lVar7) != -1) {
      *(long *)(&stack0x00001110 + lVar7) = *(long *)(&stack0x00000d68 + lVar7);
      *(undefined8 *)(&stack0x00001118 + lVar7) = *(undefined8 *)(&stack0x00000d70 + lVar7);
      *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145c26c47;
      uVar22 = func_0x000145fe6840();
      if (*(long *)(&stack0x00001110 + lVar7) != 0) {
        *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145c26c69;
        func_0x0001400021d0();
      }
      uVar33 = (undefined4)((ulong)uVar22 >> 0x20);
      uVar19 = (byte)~(byte)uVar22 & 1;
      goto LAB_145c26c82;
    }
  }
  else if ((lVar20 != -1) && (lVar20 != 0)) {
    *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145c26c17;
    uVar33 = func_0x0001400021d0();
  }
  uVar19 = 0;
LAB_145c26c82:
  *(uint *)(&stack0x00000be8 + lVar7) = uVar19;
  *(undefined4 *)(&stack0x00000bec + lVar7) = uVar33;
  (&stack0x00000d4e)[lVar7] = (&stack0x00000d4e)[lVar7] | (byte)uVar19;
  (&stack0x00000d4b)[lVar7] = bVar31 | (&stack0x00000d4c)[lVar7];
  *(undefined1 *)(lVar30 + 0x1b0a) = 0;
  uVar34 = 0;
  uVar35 = 0;
  uVar36 = 0;
  uVar37 = 0;
  *(undefined8 *)(lVar30 + 0x1a08) = 0;
  *(undefined8 *)(lVar30 + 0x1a10) = 0;
  *(undefined8 *)(lVar30 + 0x1a18) = 0;
  *(undefined8 *)(lVar30 + 0x1a20) = 0;
  *(undefined8 *)(lVar30 + 0x1a28) = 0;
  *(undefined8 *)(lVar30 + 0x1a30) = 0;
  *(undefined8 *)(lVar30 + 0x1a38) = 0;
  uVar33 = 0;
  if (*(long *)(lVar30 + 0x1a00) != 0xffffff) {
    *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145c26cf0;
    uVar33 = func_0x000145c51020();
  }
  *(undefined4 *)(lVar30 + 0x1ac8) = uVar33;
  *(undefined1 *)(lVar30 + 0x1b0e) = 0xff;
  *(undefined4 *)(lVar30 + 0x1acc) = uVar34;
  *(undefined4 *)(lVar30 + 0x1ad0) = uVar35;
  *(undefined4 *)(lVar30 + 0x1ad4) = uVar36;
  *(undefined4 *)(lVar30 + 0x1ad8) = uVar37;
  *(undefined4 *)(lVar30 + 0x1adc) = 0;
  *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145c26d27;
  func_0x00014600504b();
  return;
}

