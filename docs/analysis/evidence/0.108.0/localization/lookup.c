/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 entry(undefined8 param_1,undefined8 param_2,long param_3)

{
  char *pcVar1;
  long lVar2;
  code *pcVar3;
  uint uVar4;
  uint uVar5;
  long *plVar6;
  ushort uVar7;
  int iVar8;
  ulong uVar9;
  ulong uVar10;
  ulong uVar11;
  long lVar12;
  long lVar13;
  uint uVar14;
  long *plVar15;
  byte bVar16;
  undefined1 auVar17 [16];
  undefined1 auVar18 [16];
  char cVar19;
  char cVar20;
  char cVar21;
  char cVar22;
  char cVar23;
  char cVar24;
  char cVar25;
  char cVar26;
  char cVar27;
  char cVar28;
  char cVar29;
  char cVar30;
  char cVar31;
  char cVar32;
  char cVar33;
  char cVar34;
  char in_XMM7_Ba;
  char cVar35;
  char in_XMM7_Bb;
  char cVar36;
  char in_XMM7_Bc;
  char cVar37;
  char in_XMM7_Bd;
  char cVar38;
  char in_XMM7_Be;
  char cVar39;
  char in_XMM7_Bf;
  char cVar40;
  char in_XMM7_Bg;
  char cVar41;
  char in_XMM7_Bh;
  char cVar42;
  char in_XMM7_Bi;
  char cVar43;
  char in_XMM7_Bj;
  char cVar44;
  char in_XMM7_Bk;
  char cVar45;
  char in_XMM7_Bl;
  char cVar46;
  char in_XMM7_Bm;
  char cVar47;
  char in_XMM7_Bn;
  char cVar48;
  char in_XMM7_Bo;
  char cVar49;
  char in_XMM7_Bp;
  char cVar50;
  char cVar51;
  char cVar54;
  char cVar55;
  char cVar56;
  char cVar57;
  char cVar58;
  char cVar59;
  char cVar60;
  char cVar61;
  char cVar62;
  char cVar63;
  char cVar64;
  char cVar65;
  char cVar66;
  char cVar67;
  undefined1 auVar52 [16];
  char cVar68;
  undefined1 auVar53 [16];

  if (_DAT_14804f5c0 != 0) {
    func_0x000145d7837e();
  }
  plVar6 = _DAT_14804f5b0;
  uVar10 = _DAT_1480520d0;
  if (_DAT_14804f5b8 - 1 < _DAT_1480520d0) {
    uVar10 = _DAT_14804f5b8 - 1;
  }
  if (_DAT_14804f5b8 <= uVar10) {
    func_0x000145d93893();
                    /* WARNING: Does not return */
    pcVar3 = (code *)invalidInstructionException();
    (*pcVar3)();
  }
  if (_DAT_14804f5b0[uVar10 * 6 + 3] != 0) {
    plVar15 = _DAT_14804f5b0 + uVar10 * 6;
    uVar9 = func_0x0001400179a0();
    lVar2 = *plVar15;
    uVar10 = plVar15[1];
    bVar16 = (byte)(uVar9 >> 0x39);
    auVar17 = ZEXT216(CONCAT11(bVar16,bVar16));
    auVar17 = pshuflw(auVar17,auVar17,0);
    cVar19 = auVar17[0];
    cVar20 = auVar17[1];
    cVar21 = auVar17[2];
    cVar22 = auVar17[3];
    cVar23 = auVar17[4];
    cVar24 = auVar17[5];
    cVar25 = auVar17[6];
    cVar26 = auVar17[7];
    lVar12 = 0;
    iVar8 = -(uint)(CONCAT13(in_XMM7_Bd,CONCAT12(in_XMM7_Bc,CONCAT11(in_XMM7_Bb,in_XMM7_Ba))) ==
                   CONCAT13(in_XMM7_Bd,CONCAT12(in_XMM7_Bc,CONCAT11(in_XMM7_Bb,in_XMM7_Ba))));
    in_XMM7_Ba = (char)iVar8;
    in_XMM7_Bb = (char)((uint)iVar8 >> 8);
    in_XMM7_Bc = (char)((uint)iVar8 >> 0x10);
    in_XMM7_Bd = (char)((uint)iVar8 >> 0x18);
    iVar8 = -(uint)(CONCAT13(in_XMM7_Bh,CONCAT12(in_XMM7_Bg,CONCAT11(in_XMM7_Bf,in_XMM7_Be))) ==
                   CONCAT13(in_XMM7_Bh,CONCAT12(in_XMM7_Bg,CONCAT11(in_XMM7_Bf,in_XMM7_Be))));
    in_XMM7_Be = (char)iVar8;
    in_XMM7_Bf = (char)((uint)iVar8 >> 8);
    in_XMM7_Bg = (char)((uint)iVar8 >> 0x10);
    in_XMM7_Bh = (char)((uint)iVar8 >> 0x18);
    iVar8 = -(uint)(CONCAT13(in_XMM7_Bl,CONCAT12(in_XMM7_Bk,CONCAT11(in_XMM7_Bj,in_XMM7_Bi))) ==
                   CONCAT13(in_XMM7_Bl,CONCAT12(in_XMM7_Bk,CONCAT11(in_XMM7_Bj,in_XMM7_Bi))));
    in_XMM7_Bi = (char)iVar8;
    in_XMM7_Bj = (char)((uint)iVar8 >> 8);
    in_XMM7_Bk = (char)((uint)iVar8 >> 0x10);
    in_XMM7_Bl = (char)((uint)iVar8 >> 0x18);
    iVar8 = -(uint)(CONCAT13(in_XMM7_Bp,CONCAT12(in_XMM7_Bo,CONCAT11(in_XMM7_Bn,in_XMM7_Bm))) ==
                   CONCAT13(in_XMM7_Bp,CONCAT12(in_XMM7_Bo,CONCAT11(in_XMM7_Bn,in_XMM7_Bm))));
    in_XMM7_Bm = (char)iVar8;
    in_XMM7_Bn = (char)((uint)iVar8 >> 8);
    in_XMM7_Bo = (char)((uint)iVar8 >> 0x10);
    in_XMM7_Bp = (char)((uint)iVar8 >> 0x18);
    cVar27 = cVar19;
    cVar28 = cVar20;
    cVar29 = cVar21;
    cVar30 = cVar22;
    cVar31 = cVar23;
    cVar32 = cVar24;
    cVar33 = cVar25;
    cVar34 = cVar26;
    while( true ) {
      uVar9 = uVar9 & uVar10;
      pcVar1 = (char *)(lVar2 + uVar9);
      cVar35 = *pcVar1;
      cVar36 = pcVar1[1];
      cVar37 = pcVar1[2];
      cVar38 = pcVar1[3];
      cVar39 = pcVar1[4];
      cVar40 = pcVar1[5];
      cVar41 = pcVar1[6];
      cVar42 = pcVar1[7];
      cVar43 = pcVar1[8];
      cVar44 = pcVar1[9];
      cVar45 = pcVar1[10];
      cVar46 = pcVar1[0xb];
      cVar47 = pcVar1[0xc];
      cVar48 = pcVar1[0xd];
      cVar49 = pcVar1[0xe];
      cVar50 = pcVar1[0xf];
      auVar17[0] = -(cVar35 == cVar19);
      auVar17[1] = -(cVar36 == cVar20);
      auVar17[2] = -(cVar37 == cVar21);
      auVar17[3] = -(cVar38 == cVar22);
      auVar17[4] = -(cVar39 == cVar23);
      auVar17[5] = -(cVar40 == cVar24);
      auVar17[6] = -(cVar41 == cVar25);
      auVar17[7] = -(cVar42 == cVar26);
      auVar17[8] = -(cVar43 == cVar27);
      auVar17[9] = -(cVar44 == cVar28);
      auVar17[10] = -(cVar45 == cVar29);
      auVar17[0xb] = -(cVar46 == cVar30);
      auVar17[0xc] = -(cVar47 == cVar31);
      auVar17[0xd] = -(cVar48 == cVar32);
      auVar17[0xe] = -(cVar49 == cVar33);
      auVar17[0xf] = -(cVar50 == cVar34);
      uVar7 = (ushort)(SUB161(auVar17 >> 7,0) & 1) | (ushort)(SUB161(auVar17 >> 0xf,0) & 1) << 1 |
              (ushort)(SUB161(auVar17 >> 0x17,0) & 1) << 2 |
              (ushort)(SUB161(auVar17 >> 0x1f,0) & 1) << 3 |
              (ushort)(SUB161(auVar17 >> 0x27,0) & 1) << 4 |
              (ushort)(SUB161(auVar17 >> 0x2f,0) & 1) << 5 |
              (ushort)(SUB161(auVar17 >> 0x37,0) & 1) << 6 |
              (ushort)(SUB161(auVar17 >> 0x3f,0) & 1) << 7 |
              (ushort)(SUB161(auVar17 >> 0x47,0) & 1) << 8 |
              (ushort)(SUB161(auVar17 >> 0x4f,0) & 1) << 9 |
              (ushort)(SUB161(auVar17 >> 0x57,0) & 1) << 10 |
              (ushort)(SUB161(auVar17 >> 0x5f,0) & 1) << 0xb |
              (ushort)(SUB161(auVar17 >> 0x67,0) & 1) << 0xc |
              (ushort)(SUB161(auVar17 >> 0x6f,0) & 1) << 0xd |
              (ushort)(SUB161(auVar17 >> 0x77,0) & 1) << 0xe | (ushort)(auVar17[0xf] >> 7) << 0xf;
      uVar14 = (uint)uVar7;
      while (uVar7 != 0) {
        uVar4 = 0;
        for (uVar5 = uVar14; (uVar5 & 1) == 0; uVar5 = uVar5 >> 1 | 0x80000000) {
          uVar4 = uVar4 + 1;
        }
        uVar11 = uVar4 + uVar9 & uVar10;
        if (param_3 == *(long *)(lVar2 + -0x18 + uVar11 * -0x28)) {
          lVar13 = lVar2 + uVar11 * -0x28;
          iVar8 = func_0x000145bf2947();
          if (iVar8 == 0) goto LAB_1458e598a;
        }
        uVar7 = (ushort)(uVar14 - 1) & (ushort)uVar14;
        uVar14 = CONCAT22((short)(uVar14 - 1 >> 0x10),uVar7);
      }
      auVar52[0] = -(cVar35 == in_XMM7_Ba);
      auVar52[1] = -(cVar36 == in_XMM7_Bb);
      auVar52[2] = -(cVar37 == in_XMM7_Bc);
      auVar52[3] = -(cVar38 == in_XMM7_Bd);
      auVar52[4] = -(cVar39 == in_XMM7_Be);
      auVar52[5] = -(cVar40 == in_XMM7_Bf);
      auVar52[6] = -(cVar41 == in_XMM7_Bg);
      auVar52[7] = -(cVar42 == in_XMM7_Bh);
      auVar52[8] = -(cVar43 == in_XMM7_Bi);
      auVar52[9] = -(cVar44 == in_XMM7_Bj);
      auVar52[10] = -(cVar45 == in_XMM7_Bk);
      auVar52[0xb] = -(cVar46 == in_XMM7_Bl);
      auVar52[0xc] = -(cVar47 == in_XMM7_Bm);
      auVar52[0xd] = -(cVar48 == in_XMM7_Bn);
      auVar52[0xe] = -(cVar49 == in_XMM7_Bo);
      auVar52[0xf] = -(cVar50 == in_XMM7_Bp);
      if ((((((((((((((((SUB161(auVar52 >> 7,0) & 1) != 0 || (SUB161(auVar52 >> 0xf,0) & 1) != 0) ||
                      (SUB161(auVar52 >> 0x17,0) & 1) != 0) || (SUB161(auVar52 >> 0x1f,0) & 1) != 0)
                    || (SUB161(auVar52 >> 0x27,0) & 1) != 0) || (SUB161(auVar52 >> 0x2f,0) & 1) != 0
                   ) || (SUB161(auVar52 >> 0x37,0) & 1) != 0) ||
                 (SUB161(auVar52 >> 0x3f,0) & 1) != 0) || (SUB161(auVar52 >> 0x47,0) & 1) != 0) ||
               (SUB161(auVar52 >> 0x4f,0) & 1) != 0) || (SUB161(auVar52 >> 0x57,0) & 1) != 0) ||
             (SUB161(auVar52 >> 0x5f,0) & 1) != 0) || (SUB161(auVar52 >> 0x67,0) & 1) != 0) ||
           (SUB161(auVar52 >> 0x6f,0) & 1) != 0) || (SUB161(auVar52 >> 0x77,0) & 1) != 0) ||
          auVar52[0xf] < '\0') break;
      uVar9 = uVar9 + lVar12 + 0x10;
      lVar12 = lVar12 + 0x10;
    }
  }
  if (plVar6[3] == 0) {
    return 0;
  }
  uVar9 = func_0x0001400179a0();
  lVar2 = *plVar6;
  uVar10 = plVar6[1];
  bVar16 = (byte)(uVar9 >> 0x39);
  auVar17 = ZEXT216(CONCAT11(bVar16,bVar16));
  auVar17 = pshuflw(auVar17,auVar17,0);
  cVar19 = auVar17[0];
  cVar20 = auVar17[1];
  cVar21 = auVar17[2];
  cVar22 = auVar17[3];
  cVar23 = auVar17[4];
  cVar24 = auVar17[5];
  cVar25 = auVar17[6];
  cVar26 = auVar17[7];
  iVar8 = -(uint)(CONCAT13(in_XMM7_Bd,CONCAT12(in_XMM7_Bc,CONCAT11(in_XMM7_Bb,in_XMM7_Ba))) ==
                 CONCAT13(in_XMM7_Bd,CONCAT12(in_XMM7_Bc,CONCAT11(in_XMM7_Bb,in_XMM7_Ba))));
  cVar35 = (char)iVar8;
  cVar36 = (char)((uint)iVar8 >> 8);
  cVar37 = (char)((uint)iVar8 >> 0x10);
  cVar38 = (char)((uint)iVar8 >> 0x18);
  iVar8 = -(uint)(CONCAT13(in_XMM7_Bh,CONCAT12(in_XMM7_Bg,CONCAT11(in_XMM7_Bf,in_XMM7_Be))) ==
                 CONCAT13(in_XMM7_Bh,CONCAT12(in_XMM7_Bg,CONCAT11(in_XMM7_Bf,in_XMM7_Be))));
  cVar39 = (char)iVar8;
  cVar40 = (char)((uint)iVar8 >> 8);
  cVar41 = (char)((uint)iVar8 >> 0x10);
  cVar42 = (char)((uint)iVar8 >> 0x18);
  iVar8 = -(uint)(CONCAT13(in_XMM7_Bl,CONCAT12(in_XMM7_Bk,CONCAT11(in_XMM7_Bj,in_XMM7_Bi))) ==
                 CONCAT13(in_XMM7_Bl,CONCAT12(in_XMM7_Bk,CONCAT11(in_XMM7_Bj,in_XMM7_Bi))));
  cVar43 = (char)iVar8;
  cVar44 = (char)((uint)iVar8 >> 8);
  cVar45 = (char)((uint)iVar8 >> 0x10);
  cVar46 = (char)((uint)iVar8 >> 0x18);
  iVar8 = -(uint)(CONCAT13(in_XMM7_Bp,CONCAT12(in_XMM7_Bo,CONCAT11(in_XMM7_Bn,in_XMM7_Bm))) ==
                 CONCAT13(in_XMM7_Bp,CONCAT12(in_XMM7_Bo,CONCAT11(in_XMM7_Bn,in_XMM7_Bm))));
  cVar47 = (char)iVar8;
  cVar48 = (char)((uint)iVar8 >> 8);
  cVar49 = (char)((uint)iVar8 >> 0x10);
  cVar50 = (char)((uint)iVar8 >> 0x18);
  lVar12 = 0;
  cVar27 = cVar19;
  cVar28 = cVar20;
  cVar29 = cVar21;
  cVar30 = cVar22;
  cVar31 = cVar23;
  cVar32 = cVar24;
  cVar33 = cVar25;
  cVar34 = cVar26;
  do {
    uVar9 = uVar9 & uVar10;
    pcVar1 = (char *)(lVar2 + uVar9);
    cVar51 = *pcVar1;
    cVar54 = pcVar1[1];
    cVar55 = pcVar1[2];
    cVar56 = pcVar1[3];
    cVar57 = pcVar1[4];
    cVar58 = pcVar1[5];
    cVar59 = pcVar1[6];
    cVar60 = pcVar1[7];
    cVar61 = pcVar1[8];
    cVar62 = pcVar1[9];
    cVar63 = pcVar1[10];
    cVar64 = pcVar1[0xb];
    cVar65 = pcVar1[0xc];
    cVar66 = pcVar1[0xd];
    cVar67 = pcVar1[0xe];
    cVar68 = pcVar1[0xf];
    auVar18[0] = -(cVar51 == cVar19);
    auVar18[1] = -(cVar54 == cVar20);
    auVar18[2] = -(cVar55 == cVar21);
    auVar18[3] = -(cVar56 == cVar22);
    auVar18[4] = -(cVar57 == cVar23);
    auVar18[5] = -(cVar58 == cVar24);
    auVar18[6] = -(cVar59 == cVar25);
    auVar18[7] = -(cVar60 == cVar26);
    auVar18[8] = -(cVar61 == cVar27);
    auVar18[9] = -(cVar62 == cVar28);
    auVar18[10] = -(cVar63 == cVar29);
    auVar18[0xb] = -(cVar64 == cVar30);
    auVar18[0xc] = -(cVar65 == cVar31);
    auVar18[0xd] = -(cVar66 == cVar32);
    auVar18[0xe] = -(cVar67 == cVar33);
    auVar18[0xf] = -(cVar68 == cVar34);
    uVar7 = (ushort)(SUB161(auVar18 >> 7,0) & 1) | (ushort)(SUB161(auVar18 >> 0xf,0) & 1) << 1 |
            (ushort)(SUB161(auVar18 >> 0x17,0) & 1) << 2 |
            (ushort)(SUB161(auVar18 >> 0x1f,0) & 1) << 3 |
            (ushort)(SUB161(auVar18 >> 0x27,0) & 1) << 4 |
            (ushort)(SUB161(auVar18 >> 0x2f,0) & 1) << 5 |
            (ushort)(SUB161(auVar18 >> 0x37,0) & 1) << 6 |
            (ushort)(SUB161(auVar18 >> 0x3f,0) & 1) << 7 |
            (ushort)(SUB161(auVar18 >> 0x47,0) & 1) << 8 |
            (ushort)(SUB161(auVar18 >> 0x4f,0) & 1) << 9 |
            (ushort)(SUB161(auVar18 >> 0x57,0) & 1) << 10 |
            (ushort)(SUB161(auVar18 >> 0x5f,0) & 1) << 0xb |
            (ushort)(SUB161(auVar18 >> 0x67,0) & 1) << 0xc |
            (ushort)(SUB161(auVar18 >> 0x6f,0) & 1) << 0xd |
            (ushort)(SUB161(auVar18 >> 0x77,0) & 1) << 0xe | (ushort)(auVar18[0xf] >> 7) << 0xf;
    uVar14 = (uint)uVar7;
    while (uVar7 != 0) {
      uVar4 = 0;
      for (uVar5 = uVar14; (uVar5 & 1) == 0; uVar5 = uVar5 >> 1 | 0x80000000) {
        uVar4 = uVar4 + 1;
      }
      uVar11 = uVar4 + uVar9 & uVar10;
      if (param_3 == *(long *)(lVar2 + -0x18 + uVar11 * -0x28)) {
        lVar13 = lVar2 + uVar11 * -0x28;
        iVar8 = func_0x000145bf2947();
        if (iVar8 == 0) {
LAB_1458e598a:
          return *(undefined8 *)(lVar13 + -0x10);
        }
      }
      uVar7 = (ushort)(uVar14 - 1) & (ushort)uVar14;
      uVar14 = CONCAT22((short)(uVar14 - 1 >> 0x10),uVar7);
    }
    auVar53[0] = -(cVar51 == cVar35);
    auVar53[1] = -(cVar54 == cVar36);
    auVar53[2] = -(cVar55 == cVar37);
    auVar53[3] = -(cVar56 == cVar38);
    auVar53[4] = -(cVar57 == cVar39);
    auVar53[5] = -(cVar58 == cVar40);
    auVar53[6] = -(cVar59 == cVar41);
    auVar53[7] = -(cVar60 == cVar42);
    auVar53[8] = -(cVar61 == cVar43);
    auVar53[9] = -(cVar62 == cVar44);
    auVar53[10] = -(cVar63 == cVar45);
    auVar53[0xb] = -(cVar64 == cVar46);
    auVar53[0xc] = -(cVar65 == cVar47);
    auVar53[0xd] = -(cVar66 == cVar48);
    auVar53[0xe] = -(cVar67 == cVar49);
    auVar53[0xf] = -(cVar68 == cVar50);
    if ((((((((((((((((SUB161(auVar53 >> 7,0) & 1) != 0 || (SUB161(auVar53 >> 0xf,0) & 1) != 0) ||
                    (SUB161(auVar53 >> 0x17,0) & 1) != 0) || (SUB161(auVar53 >> 0x1f,0) & 1) != 0)
                  || (SUB161(auVar53 >> 0x27,0) & 1) != 0) || (SUB161(auVar53 >> 0x2f,0) & 1) != 0)
                || (SUB161(auVar53 >> 0x37,0) & 1) != 0) || (SUB161(auVar53 >> 0x3f,0) & 1) != 0) ||
              (SUB161(auVar53 >> 0x47,0) & 1) != 0) || (SUB161(auVar53 >> 0x4f,0) & 1) != 0) ||
            (SUB161(auVar53 >> 0x57,0) & 1) != 0) || (SUB161(auVar53 >> 0x5f,0) & 1) != 0) ||
          (SUB161(auVar53 >> 0x67,0) & 1) != 0) || (SUB161(auVar53 >> 0x6f,0) & 1) != 0) ||
        (SUB161(auVar53 >> 0x77,0) & 1) != 0) || auVar53[0xf] < '\0') {
      return 0;
    }
    uVar9 = uVar9 + lVar12 + 0x10;
    lVar12 = lVar12 + 0x10;
  } while( true );
}
