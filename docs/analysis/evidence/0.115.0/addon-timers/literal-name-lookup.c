
undefined8 FUN_1458dff90(undefined8 param_1,longlong param_2)

{
  char *pcVar1;
  longlong lVar2;
  code *pcVar3;
  uint uVar4;
  uint uVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  char cVar9;
  char cVar10;
  char cVar11;
  char cVar12;
  char cVar13;
  char cVar14;
  char cVar15;
  char cVar16;
  char cVar17;
  char cVar18;
  char cVar19;
  char cVar20;
  char cVar21;
  char cVar22;
  char cVar23;
  char cVar24;
  longlong *plVar25;
  ushort uVar26;
  int iVar27;
  int iVar28;
  ulonglong uVar29;
  ulonglong uVar30;
  ulonglong uVar31;
  longlong lVar32;
  longlong lVar33;
  uint uVar34;
  longlong *plVar35;
  longlong unaff_GS_OFFSET;
  byte bVar36;
  undefined1 auVar37 [16];
  undefined1 auVar38 [16];
  undefined1 auVar39 [16];
  char unaff_XMM7_Ba;
  char unaff_XMM7_Bb;
  char unaff_XMM7_Bc;
  char unaff_XMM7_Bd;
  char unaff_XMM7_Be;
  char unaff_XMM7_Bf;
  char unaff_XMM7_Bg;
  char unaff_XMM7_Bh;
  char unaff_XMM7_Bi;
  char unaff_XMM7_Bj;
  char unaff_XMM7_Bk;
  char unaff_XMM7_Bl;
  char unaff_XMM7_Bm;
  char unaff_XMM7_Bn;
  char unaff_XMM7_Bo;
  char unaff_XMM7_Bp;
  undefined1 auVar40 [16];
  undefined1 auVar41 [16];

  if (DAT_148214788 != 0) {
    FUN_145e9814b(&DAT_148214770);
  }
  plVar25 = DAT_148214778;
  lVar2 = *(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)_tls_index * 8);
  uVar29 = DAT_148217160;
  if (*(char *)(lVar2 + 0x330) != '\0') {
    uVar29 = *(ulonglong *)(lVar2 + 0x338);
  }
  uVar30 = DAT_148214780 - 1;
  if (uVar29 < DAT_148214780 - 1) {
    uVar30 = uVar29;
  }
  uVar29 = 0xd;
  if (uVar30 < 0xd) {
    uVar29 = uVar30;
  }
  if (DAT_148214780 <= uVar29) {
    FUN_145eb7363(uVar29,DAT_148214780,&DAT_14703cd70);
                    /* WARNING: Does not return */
    pcVar3 = (code *)invalidInstructionException();
    (*pcVar3)();
  }
  if (DAT_148214778[uVar29 * 6 + 3] != 0) {
    plVar35 = DAT_148214778 + uVar29 * 6;
    uVar30 = FUN_140026790(plVar35 + 4,param_1,param_2);
    lVar2 = *plVar35;
    uVar29 = plVar35[1];
    bVar36 = (byte)(uVar30 >> 0x39);
    auVar37 = ZEXT216(CONCAT11(bVar36,bVar36));
    auVar37 = pshuflw(auVar37,auVar37,0);
    lVar32 = 0;
    iVar27 = -(uint)(CONCAT13(unaff_XMM7_Bd,
                              CONCAT12(unaff_XMM7_Bc,CONCAT11(unaff_XMM7_Bb,unaff_XMM7_Ba))) ==
                    CONCAT13(unaff_XMM7_Bd,
                             CONCAT12(unaff_XMM7_Bc,CONCAT11(unaff_XMM7_Bb,unaff_XMM7_Ba))));
    unaff_XMM7_Ba = (char)iVar27;
    unaff_XMM7_Bb = (char)((uint)iVar27 >> 8);
    unaff_XMM7_Bc = (char)((uint)iVar27 >> 0x10);
    unaff_XMM7_Bd = (char)((uint)iVar27 >> 0x18);
    iVar27 = -(uint)(CONCAT13(unaff_XMM7_Bh,
                              CONCAT12(unaff_XMM7_Bg,CONCAT11(unaff_XMM7_Bf,unaff_XMM7_Be))) ==
                    CONCAT13(unaff_XMM7_Bh,
                             CONCAT12(unaff_XMM7_Bg,CONCAT11(unaff_XMM7_Bf,unaff_XMM7_Be))));
    unaff_XMM7_Be = (char)iVar27;
    unaff_XMM7_Bf = (char)((uint)iVar27 >> 8);
    unaff_XMM7_Bg = (char)((uint)iVar27 >> 0x10);
    unaff_XMM7_Bh = (char)((uint)iVar27 >> 0x18);
    iVar27 = -(uint)(CONCAT13(unaff_XMM7_Bl,
                              CONCAT12(unaff_XMM7_Bk,CONCAT11(unaff_XMM7_Bj,unaff_XMM7_Bi))) ==
                    CONCAT13(unaff_XMM7_Bl,
                             CONCAT12(unaff_XMM7_Bk,CONCAT11(unaff_XMM7_Bj,unaff_XMM7_Bi))));
    unaff_XMM7_Bi = (char)iVar27;
    unaff_XMM7_Bj = (char)((uint)iVar27 >> 8);
    unaff_XMM7_Bk = (char)((uint)iVar27 >> 0x10);
    unaff_XMM7_Bl = (char)((uint)iVar27 >> 0x18);
    iVar27 = -(uint)(CONCAT13(unaff_XMM7_Bp,
                              CONCAT12(unaff_XMM7_Bo,CONCAT11(unaff_XMM7_Bn,unaff_XMM7_Bm))) ==
                    CONCAT13(unaff_XMM7_Bp,
                             CONCAT12(unaff_XMM7_Bo,CONCAT11(unaff_XMM7_Bn,unaff_XMM7_Bm))));
    unaff_XMM7_Bm = (char)iVar27;
    unaff_XMM7_Bn = (char)((uint)iVar27 >> 8);
    unaff_XMM7_Bo = (char)((uint)iVar27 >> 0x10);
    unaff_XMM7_Bp = (char)((uint)iVar27 >> 0x18);
    while( true ) {
      uVar30 = uVar30 & uVar29;
      pcVar1 = (char *)(lVar2 + uVar30);
      cVar9 = *pcVar1;
      cVar10 = pcVar1[1];
      cVar11 = pcVar1[2];
      cVar12 = pcVar1[3];
      cVar13 = pcVar1[4];
      cVar14 = pcVar1[5];
      cVar15 = pcVar1[6];
      cVar16 = pcVar1[7];
      cVar17 = pcVar1[8];
      cVar18 = pcVar1[9];
      cVar19 = pcVar1[10];
      cVar20 = pcVar1[0xb];
      cVar21 = pcVar1[0xc];
      cVar22 = pcVar1[0xd];
      cVar23 = pcVar1[0xe];
      cVar24 = pcVar1[0xf];
      auVar38[0] = -(cVar9 == auVar37[0]);
      auVar38[1] = -(cVar10 == auVar37[1]);
      auVar38[2] = -(cVar11 == auVar37[2]);
      auVar38[3] = -(cVar12 == auVar37[3]);
      auVar38[4] = -(cVar13 == auVar37[4]);
      auVar38[5] = -(cVar14 == auVar37[5]);
      auVar38[6] = -(cVar15 == auVar37[6]);
      auVar38[7] = -(cVar16 == auVar37[7]);
      auVar38[8] = -(cVar17 == auVar37[0]);
      auVar38[9] = -(cVar18 == auVar37[1]);
      auVar38[10] = -(cVar19 == auVar37[2]);
      auVar38[0xb] = -(cVar20 == auVar37[3]);
      auVar38[0xc] = -(cVar21 == auVar37[4]);
      auVar38[0xd] = -(cVar22 == auVar37[5]);
      auVar38[0xe] = -(cVar23 == auVar37[6]);
      auVar38[0xf] = -(cVar24 == auVar37[7]);
      uVar26 = (ushort)(SUB161(auVar38 >> 7,0) & 1) | (ushort)(SUB161(auVar38 >> 0xf,0) & 1) << 1 |
               (ushort)(SUB161(auVar38 >> 0x17,0) & 1) << 2 |
               (ushort)(SUB161(auVar38 >> 0x1f,0) & 1) << 3 |
               (ushort)(SUB161(auVar38 >> 0x27,0) & 1) << 4 |
               (ushort)(SUB161(auVar38 >> 0x2f,0) & 1) << 5 |
               (ushort)(SUB161(auVar38 >> 0x37,0) & 1) << 6 |
               (ushort)(SUB161(auVar38 >> 0x3f,0) & 1) << 7 |
               (ushort)(SUB161(auVar38 >> 0x47,0) & 1) << 8 |
               (ushort)(SUB161(auVar38 >> 0x4f,0) & 1) << 9 |
               (ushort)(SUB161(auVar38 >> 0x57,0) & 1) << 10 |
               (ushort)(SUB161(auVar38 >> 0x5f,0) & 1) << 0xb |
               (ushort)(SUB161(auVar38 >> 0x67,0) & 1) << 0xc |
               (ushort)(SUB161(auVar38 >> 0x6f,0) & 1) << 0xd |
               (ushort)(SUB161(auVar38 >> 0x77,0) & 1) << 0xe | (ushort)(auVar38[0xf] >> 7) << 0xf;
      uVar34 = (uint)uVar26;
      while (uVar26 != 0) {
        uVar4 = 0;
        for (uVar5 = uVar34; (uVar5 & 1) == 0; uVar5 = uVar5 >> 1 | 0x80000000) {
          uVar4 = uVar4 + 1;
        }
        uVar31 = uVar4 + uVar30 & uVar29;
        if (param_2 == *(longlong *)(lVar2 + -0x18 + uVar31 * -0x28)) {
          lVar33 = lVar2 + uVar31 * -0x28;
          iVar27 = func_0x000145d14601(param_1,*(undefined8 *)(lVar33 + -0x20),param_2);
          if (iVar27 == 0) goto LAB_1458e01ba;
        }
        uVar26 = (ushort)(uVar34 - 1) & (ushort)uVar34;
        uVar34 = CONCAT22((short)(uVar34 - 1 >> 0x10),uVar26);
      }
      auVar40[0] = -(cVar9 == unaff_XMM7_Ba);
      auVar40[1] = -(cVar10 == unaff_XMM7_Bb);
      auVar40[2] = -(cVar11 == unaff_XMM7_Bc);
      auVar40[3] = -(cVar12 == unaff_XMM7_Bd);
      auVar40[4] = -(cVar13 == unaff_XMM7_Be);
      auVar40[5] = -(cVar14 == unaff_XMM7_Bf);
      auVar40[6] = -(cVar15 == unaff_XMM7_Bg);
      auVar40[7] = -(cVar16 == unaff_XMM7_Bh);
      auVar40[8] = -(cVar17 == unaff_XMM7_Bi);
      auVar40[9] = -(cVar18 == unaff_XMM7_Bj);
      auVar40[10] = -(cVar19 == unaff_XMM7_Bk);
      auVar40[0xb] = -(cVar20 == unaff_XMM7_Bl);
      auVar40[0xc] = -(cVar21 == unaff_XMM7_Bm);
      auVar40[0xd] = -(cVar22 == unaff_XMM7_Bn);
      auVar40[0xe] = -(cVar23 == unaff_XMM7_Bo);
      auVar40[0xf] = -(cVar24 == unaff_XMM7_Bp);
      if ((((((((((((((((SUB161(auVar40 >> 7,0) & 1) != 0 || (SUB161(auVar40 >> 0xf,0) & 1) != 0) ||
                      (SUB161(auVar40 >> 0x17,0) & 1) != 0) || (SUB161(auVar40 >> 0x1f,0) & 1) != 0)
                    || (SUB161(auVar40 >> 0x27,0) & 1) != 0) || (SUB161(auVar40 >> 0x2f,0) & 1) != 0
                   ) || (SUB161(auVar40 >> 0x37,0) & 1) != 0) ||
                 (SUB161(auVar40 >> 0x3f,0) & 1) != 0) || (SUB161(auVar40 >> 0x47,0) & 1) != 0) ||
               (SUB161(auVar40 >> 0x4f,0) & 1) != 0) || (SUB161(auVar40 >> 0x57,0) & 1) != 0) ||
             (SUB161(auVar40 >> 0x5f,0) & 1) != 0) || (SUB161(auVar40 >> 0x67,0) & 1) != 0) ||
           (SUB161(auVar40 >> 0x6f,0) & 1) != 0) || (SUB161(auVar40 >> 0x77,0) & 1) != 0) ||
          auVar40[0xf] < '\0') break;
      uVar30 = uVar30 + lVar32 + 0x10;
      lVar32 = lVar32 + 0x10;
    }
  }
  if (plVar25[3] == 0) {
    return 0;
  }
  uVar30 = FUN_140026790(plVar25 + 4,param_1,param_2);
  lVar2 = *plVar25;
  uVar29 = plVar25[1];
  bVar36 = (byte)(uVar30 >> 0x39);
  auVar37 = ZEXT216(CONCAT11(bVar36,bVar36));
  auVar37 = pshuflw(auVar37,auVar37,0);
  iVar27 = -(uint)(CONCAT13(unaff_XMM7_Bd,
                            CONCAT12(unaff_XMM7_Bc,CONCAT11(unaff_XMM7_Bb,unaff_XMM7_Ba))) ==
                  CONCAT13(unaff_XMM7_Bd,
                           CONCAT12(unaff_XMM7_Bc,CONCAT11(unaff_XMM7_Bb,unaff_XMM7_Ba))));
  iVar6 = -(uint)(CONCAT13(unaff_XMM7_Bh,
                           CONCAT12(unaff_XMM7_Bg,CONCAT11(unaff_XMM7_Bf,unaff_XMM7_Be))) ==
                 CONCAT13(unaff_XMM7_Bh,
                          CONCAT12(unaff_XMM7_Bg,CONCAT11(unaff_XMM7_Bf,unaff_XMM7_Be))));
  iVar7 = -(uint)(CONCAT13(unaff_XMM7_Bl,
                           CONCAT12(unaff_XMM7_Bk,CONCAT11(unaff_XMM7_Bj,unaff_XMM7_Bi))) ==
                 CONCAT13(unaff_XMM7_Bl,
                          CONCAT12(unaff_XMM7_Bk,CONCAT11(unaff_XMM7_Bj,unaff_XMM7_Bi))));
  iVar8 = -(uint)(CONCAT13(unaff_XMM7_Bp,
                           CONCAT12(unaff_XMM7_Bo,CONCAT11(unaff_XMM7_Bn,unaff_XMM7_Bm))) ==
                 CONCAT13(unaff_XMM7_Bp,
                          CONCAT12(unaff_XMM7_Bo,CONCAT11(unaff_XMM7_Bn,unaff_XMM7_Bm))));
  lVar32 = 0;
  do {
    uVar30 = uVar30 & uVar29;
    pcVar1 = (char *)(lVar2 + uVar30);
    cVar9 = *pcVar1;
    cVar10 = pcVar1[1];
    cVar11 = pcVar1[2];
    cVar12 = pcVar1[3];
    cVar13 = pcVar1[4];
    cVar14 = pcVar1[5];
    cVar15 = pcVar1[6];
    cVar16 = pcVar1[7];
    cVar17 = pcVar1[8];
    cVar18 = pcVar1[9];
    cVar19 = pcVar1[10];
    cVar20 = pcVar1[0xb];
    cVar21 = pcVar1[0xc];
    cVar22 = pcVar1[0xd];
    cVar23 = pcVar1[0xe];
    cVar24 = pcVar1[0xf];
    auVar39[0] = -(cVar9 == auVar37[0]);
    auVar39[1] = -(cVar10 == auVar37[1]);
    auVar39[2] = -(cVar11 == auVar37[2]);
    auVar39[3] = -(cVar12 == auVar37[3]);
    auVar39[4] = -(cVar13 == auVar37[4]);
    auVar39[5] = -(cVar14 == auVar37[5]);
    auVar39[6] = -(cVar15 == auVar37[6]);
    auVar39[7] = -(cVar16 == auVar37[7]);
    auVar39[8] = -(cVar17 == auVar37[0]);
    auVar39[9] = -(cVar18 == auVar37[1]);
    auVar39[10] = -(cVar19 == auVar37[2]);
    auVar39[0xb] = -(cVar20 == auVar37[3]);
    auVar39[0xc] = -(cVar21 == auVar37[4]);
    auVar39[0xd] = -(cVar22 == auVar37[5]);
    auVar39[0xe] = -(cVar23 == auVar37[6]);
    auVar39[0xf] = -(cVar24 == auVar37[7]);
    uVar26 = (ushort)(SUB161(auVar39 >> 7,0) & 1) | (ushort)(SUB161(auVar39 >> 0xf,0) & 1) << 1 |
             (ushort)(SUB161(auVar39 >> 0x17,0) & 1) << 2 |
             (ushort)(SUB161(auVar39 >> 0x1f,0) & 1) << 3 |
             (ushort)(SUB161(auVar39 >> 0x27,0) & 1) << 4 |
             (ushort)(SUB161(auVar39 >> 0x2f,0) & 1) << 5 |
             (ushort)(SUB161(auVar39 >> 0x37,0) & 1) << 6 |
             (ushort)(SUB161(auVar39 >> 0x3f,0) & 1) << 7 |
             (ushort)(SUB161(auVar39 >> 0x47,0) & 1) << 8 |
             (ushort)(SUB161(auVar39 >> 0x4f,0) & 1) << 9 |
             (ushort)(SUB161(auVar39 >> 0x57,0) & 1) << 10 |
             (ushort)(SUB161(auVar39 >> 0x5f,0) & 1) << 0xb |
             (ushort)(SUB161(auVar39 >> 0x67,0) & 1) << 0xc |
             (ushort)(SUB161(auVar39 >> 0x6f,0) & 1) << 0xd |
             (ushort)(SUB161(auVar39 >> 0x77,0) & 1) << 0xe | (ushort)(auVar39[0xf] >> 7) << 0xf;
    uVar34 = (uint)uVar26;
    while (uVar26 != 0) {
      uVar4 = 0;
      for (uVar5 = uVar34; (uVar5 & 1) == 0; uVar5 = uVar5 >> 1 | 0x80000000) {
        uVar4 = uVar4 + 1;
      }
      uVar31 = uVar4 + uVar30 & uVar29;
      if (param_2 == *(longlong *)(lVar2 + -0x18 + uVar31 * -0x28)) {
        lVar33 = lVar2 + uVar31 * -0x28;
        iVar28 = func_0x000145d14601(param_1,*(undefined8 *)(lVar33 + -0x20),param_2);
        if (iVar28 == 0) {
LAB_1458e01ba:
          return *(undefined8 *)(lVar33 + -0x10);
        }
      }
      uVar26 = (ushort)(uVar34 - 1) & (ushort)uVar34;
      uVar34 = CONCAT22((short)(uVar34 - 1 >> 0x10),uVar26);
    }
    auVar41[0] = -(cVar9 == (char)iVar27);
    auVar41[1] = -(cVar10 == (char)((uint)iVar27 >> 8));
    auVar41[2] = -(cVar11 == (char)((uint)iVar27 >> 0x10));
    auVar41[3] = -(cVar12 == (char)((uint)iVar27 >> 0x18));
    auVar41[4] = -(cVar13 == (char)iVar6);
    auVar41[5] = -(cVar14 == (char)((uint)iVar6 >> 8));
    auVar41[6] = -(cVar15 == (char)((uint)iVar6 >> 0x10));
    auVar41[7] = -(cVar16 == (char)((uint)iVar6 >> 0x18));
    auVar41[8] = -(cVar17 == (char)iVar7);
    auVar41[9] = -(cVar18 == (char)((uint)iVar7 >> 8));
    auVar41[10] = -(cVar19 == (char)((uint)iVar7 >> 0x10));
    auVar41[0xb] = -(cVar20 == (char)((uint)iVar7 >> 0x18));
    auVar41[0xc] = -(cVar21 == (char)iVar8);
    auVar41[0xd] = -(cVar22 == (char)((uint)iVar8 >> 8));
    auVar41[0xe] = -(cVar23 == (char)((uint)iVar8 >> 0x10));
    auVar41[0xf] = -(cVar24 == (char)((uint)iVar8 >> 0x18));
    if ((((((((((((((((SUB161(auVar41 >> 7,0) & 1) != 0 || (SUB161(auVar41 >> 0xf,0) & 1) != 0) ||
                    (SUB161(auVar41 >> 0x17,0) & 1) != 0) || (SUB161(auVar41 >> 0x1f,0) & 1) != 0)
                  || (SUB161(auVar41 >> 0x27,0) & 1) != 0) || (SUB161(auVar41 >> 0x2f,0) & 1) != 0)
                || (SUB161(auVar41 >> 0x37,0) & 1) != 0) || (SUB161(auVar41 >> 0x3f,0) & 1) != 0) ||
              (SUB161(auVar41 >> 0x47,0) & 1) != 0) || (SUB161(auVar41 >> 0x4f,0) & 1) != 0) ||
            (SUB161(auVar41 >> 0x57,0) & 1) != 0) || (SUB161(auVar41 >> 0x5f,0) & 1) != 0) ||
          (SUB161(auVar41 >> 0x67,0) & 1) != 0) || (SUB161(auVar41 >> 0x6f,0) & 1) != 0) ||
        (SUB161(auVar41 >> 0x77,0) & 1) != 0) || auVar41[0xf] < '\0') {
      return 0;
    }
    uVar30 = uVar30 + lVar32 + 0x10;
    lVar32 = lVar32 + 0x10;
  } while( true );
}
