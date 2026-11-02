
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

ulong * FUN_14599e3d0(undefined8 param_1,undefined8 param_2,undefined8 *param_3,ulong *param_4)

{
  byte *pbVar1;
  byte *pbVar2;
  ulong uVar3;
  ulong uVar4;
  undefined1 auVar5 [16];
  undefined1 auVar6 [16];
  ulong uVar7;
  code *pcVar8;
  byte bVar9;
  byte bVar10;
  byte bVar11;
  byte bVar12;
  byte bVar13;
  byte bVar14;
  byte bVar15;
  byte bVar16;
  byte bVar17;
  byte bVar18;
  byte bVar19;
  byte bVar20;
  byte bVar21;
  byte bVar22;
  byte bVar23;
  byte bVar24;
  byte bVar25;
  byte bVar26;
  byte bVar27;
  byte bVar28;
  byte bVar29;
  byte bVar30;
  byte bVar31;
  byte bVar32;
  byte bVar33;
  byte bVar34;
  byte bVar35;
  byte bVar36;
  byte bVar37;
  byte bVar38;
  byte bVar39;
  byte bVar40;
  byte bVar41;
  byte bVar42;
  byte bVar43;
  byte bVar44;
  byte bVar45;
  byte bVar46;
  byte bVar47;
  byte bVar48;
  byte bVar49;
  byte bVar50;
  byte bVar51;
  byte bVar52;
  byte bVar53;
  byte bVar54;
  byte bVar55;
  byte bVar56;
  byte bVar57;
  byte bVar58;
  byte bVar59;
  byte bVar60;
  byte bVar61;
  byte bVar62;
  byte bVar63;
  undefined1 auVar64 [16];
  ulong uVar65;
  long lVar66;
  ulong uVar67;
  ulong uVar68;
  ulong uVar69;
  char cVar70;
  ulong uVar71;
  byte bVar72;
  byte bVar74;
  byte bVar75;
  byte bVar76;
  byte bVar77;
  byte bVar78;
  byte bVar79;
  byte bVar80;
  undefined1 auVar73 [16];
  byte bVar81;
  byte bVar83;
  byte bVar84;
  byte bVar85;
  byte bVar86;
  byte bVar87;
  byte bVar88;
  byte bVar89;
  byte bVar90;
  byte bVar91;
  byte bVar92;
  byte bVar93;
  byte bVar94;
  byte bVar95;
  byte bVar96;
  byte bVar97;
  undefined1 auVar82 [16];
  byte bVar98;
  byte bVar99;
  byte bVar100;
  byte bVar101;
  byte bVar102;
  byte bVar103;
  byte bVar104;
  byte bVar105;
  byte bVar106;
  byte bVar107;
  byte bVar108;
  byte bVar109;
  byte bVar110;
  byte bVar111;
  byte bVar112;
  byte bVar113;

  uVar7 = param_3[1];
  if ((long)uVar7 < 0) {
LAB_14599e3fe:
    func_0x000145da94eb();
                    /* WARNING: Does not return */
    pcVar8 = (code *)invalidInstructionException();
    (*pcVar8)();
  }
  if (uVar7 == 0) {
    *param_4 = 0;
    param_4[1] = 1;
    param_4[2] = 0;
    return param_4;
  }
  func_0x000140002200(*param_3);
  lVar66 = func_0x0001400021c0();
  if (lVar66 == 0) goto LAB_14599e3fe;
  func_0x000145c0a3db();
  bVar80 = bRam0000000145dad18f;
  bVar79 = bRam0000000145dad18e;
  bVar78 = bRam0000000145dad18d;
  bVar77 = bRam0000000145dad18c;
  bVar76 = bRam0000000145dad18b;
  bVar75 = bRam0000000145dad18a;
  bVar74 = bRam0000000145dad189;
  bVar72 = bRam0000000145dad188;
  bVar16 = bRam0000000145dad187;
  bVar15 = bRam0000000145dad186;
  bVar14 = bRam0000000145dad185;
  bVar13 = bRam0000000145dad184;
  bVar12 = bRam0000000145dad183;
  bVar11 = bRam0000000145dad182;
  bVar10 = bRam0000000145dad181;
  bVar9 = DAT_145dad180;
  auVar5 = _DAT_145dad170;
  auVar64 = _DAT_145dad160;
  if (uVar7 < 8) {
    uVar67 = 0;
LAB_14599e573:
    do {
      *(byte *)(lVar66 + uVar67) =
           ((byte)(*(byte *)(lVar66 + uVar67) + 0xbf) < 0x1a) << 5 | *(byte *)(lVar66 + uVar67);
      uVar67 = uVar67 + 1;
LAB_14599e58d:
    } while (uVar7 != uVar67);
  }
  else {
    if (uVar7 < 0x20) {
      uVar68 = 0;
LAB_14599e50a:
      uVar69 = _DAT_145dad2b0;
      auVar5 = _DAT_145dad2a0;
      auVar64 = _DAT_145dad290;
      uVar67 = uVar7 & 0x7ffffffffffffff8;
      do {
        uVar3 = *(ulong *)(lVar66 + uVar68);
        bVar72 = (char)uVar3 + auVar64[0];
        bVar74 = (char)(uVar3 >> 8) + auVar64[1];
        bVar75 = (char)(uVar3 >> 0x10) + auVar64[2];
        bVar76 = (char)(uVar3 >> 0x18) + auVar64[3];
        bVar77 = (char)(uVar3 >> 0x20) + auVar64[4];
        bVar78 = (char)(uVar3 >> 0x28) + auVar64[5];
        bVar79 = (char)(uVar3 >> 0x30) + auVar64[6];
        bVar80 = (char)(uVar3 >> 0x38) + auVar64[7];
        bVar9 = auVar5[0];
        bVar10 = auVar5[1];
        bVar11 = auVar5[2];
        bVar12 = auVar5[3];
        bVar13 = auVar5[4];
        bVar14 = auVar5[5];
        bVar15 = auVar5[6];
        bVar16 = auVar5[7];
        *(ulong *)(lVar66 + uVar68) =
             ~CONCAT17(-((byte)((bVar80 < bVar16) * bVar16 | (bVar80 >= bVar16) * bVar80) == bVar80)
                       ,CONCAT16(-((byte)((bVar79 < bVar15) * bVar15 | (bVar79 >= bVar15) * bVar79)
                                  == bVar79),
                                 CONCAT15(-((byte)((bVar78 < bVar14) * bVar14 |
                                                  (bVar78 >= bVar14) * bVar78) == bVar78),
                                          CONCAT14(-((byte)((bVar77 < bVar13) * bVar13 |
                                                           (bVar77 >= bVar13) * bVar77) == bVar77),
                                                   CONCAT13(-((byte)((bVar76 < bVar12) * bVar12 |
                                                                    (bVar76 >= bVar12) * bVar76) ==
                                                             bVar76),CONCAT12(-((byte)((bVar75 <
                                                  bVar11) * bVar11 | (bVar75 >= bVar11) * bVar75) ==
                                                  bVar75),CONCAT11(-((byte)((bVar74 < bVar10) *
                                                                            bVar10 | (bVar74 >=
                                                                                     bVar10) *
                                                  bVar74) == bVar74),
                                                  -((byte)((bVar72 < bVar9) * bVar9 |
                                                          (bVar72 >= bVar9) * bVar72) == bVar72)))))
                                         ))) & uVar69 | uVar3;
        uVar68 = uVar68 + 8;
        if (uVar67 == uVar68) goto LAB_14599e58d;
      } while( true );
    }
    uVar67 = uVar7 & 0x7fffffffffffffe0;
    uVar68 = 0;
    do {
      pbVar1 = (byte *)(lVar66 + uVar68);
      bVar33 = pbVar1[1];
      bVar34 = pbVar1[2];
      bVar35 = pbVar1[3];
      bVar36 = pbVar1[4];
      bVar37 = pbVar1[5];
      bVar38 = pbVar1[6];
      bVar39 = pbVar1[7];
      bVar40 = pbVar1[8];
      bVar41 = pbVar1[9];
      bVar42 = pbVar1[10];
      bVar43 = pbVar1[0xb];
      bVar44 = pbVar1[0xc];
      bVar45 = pbVar1[0xd];
      bVar46 = pbVar1[0xe];
      bVar47 = pbVar1[0xf];
      pbVar2 = (byte *)(lVar66 + 0x10 + uVar68);
      bVar48 = *pbVar2;
      bVar49 = pbVar2[1];
      bVar50 = pbVar2[2];
      bVar51 = pbVar2[3];
      bVar52 = pbVar2[4];
      bVar53 = pbVar2[5];
      bVar54 = pbVar2[6];
      bVar55 = pbVar2[7];
      bVar56 = pbVar2[8];
      bVar57 = pbVar2[9];
      bVar58 = pbVar2[10];
      bVar59 = pbVar2[0xb];
      bVar60 = pbVar2[0xc];
      bVar61 = pbVar2[0xd];
      bVar62 = pbVar2[0xe];
      bVar63 = pbVar2[0xf];
      bVar81 = *pbVar1 + auVar64[0];
      bVar83 = bVar33 + auVar64[1];
      bVar84 = bVar34 + auVar64[2];
      bVar85 = bVar35 + auVar64[3];
      bVar86 = bVar36 + auVar64[4];
      bVar87 = bVar37 + auVar64[5];
      bVar88 = bVar38 + auVar64[6];
      bVar89 = bVar39 + auVar64[7];
      bVar90 = bVar40 + auVar64[8];
      bVar91 = bVar41 + auVar64[9];
      bVar92 = bVar42 + auVar64[10];
      bVar93 = bVar43 + auVar64[0xb];
      bVar94 = bVar44 + auVar64[0xc];
      bVar95 = bVar45 + auVar64[0xd];
      bVar96 = bVar46 + auVar64[0xe];
      bVar97 = bVar47 + auVar64[0xf];
      bVar98 = bVar48 + auVar64[0];
      bVar99 = bVar49 + auVar64[1];
      bVar100 = bVar50 + auVar64[2];
      bVar101 = bVar51 + auVar64[3];
      bVar102 = bVar52 + auVar64[4];
      bVar103 = bVar53 + auVar64[5];
      bVar104 = bVar54 + auVar64[6];
      bVar105 = bVar55 + auVar64[7];
      bVar106 = bVar56 + auVar64[8];
      bVar107 = bVar57 + auVar64[9];
      bVar108 = bVar58 + auVar64[10];
      bVar109 = bVar59 + auVar64[0xb];
      bVar110 = bVar60 + auVar64[0xc];
      bVar111 = bVar61 + auVar64[0xd];
      bVar112 = bVar62 + auVar64[0xe];
      bVar113 = bVar63 + auVar64[0xf];
      bVar17 = auVar5[0];
      bVar18 = auVar5[1];
      bVar19 = auVar5[2];
      bVar20 = auVar5[3];
      bVar21 = auVar5[4];
      bVar22 = auVar5[5];
      bVar23 = auVar5[6];
      bVar24 = auVar5[7];
      bVar25 = auVar5[8];
      bVar26 = auVar5[9];
      bVar27 = auVar5[10];
      bVar28 = auVar5[0xb];
      bVar29 = auVar5[0xc];
      bVar30 = auVar5[0xd];
      bVar31 = auVar5[0xe];
      bVar32 = auVar5[0xf];
      pbVar2 = (byte *)(lVar66 + uVar68);
      *pbVar2 = -((byte)((bVar17 < bVar81) * bVar17 | (bVar17 >= bVar81) * bVar81) == bVar81) &
                bVar9 | *pbVar1;
      pbVar2[1] = -((byte)((bVar18 < bVar83) * bVar18 | (bVar18 >= bVar83) * bVar83) == bVar83) &
                  bVar10 | bVar33;
      pbVar2[2] = -((byte)((bVar19 < bVar84) * bVar19 | (bVar19 >= bVar84) * bVar84) == bVar84) &
                  bVar11 | bVar34;
      pbVar2[3] = -((byte)((bVar20 < bVar85) * bVar20 | (bVar20 >= bVar85) * bVar85) == bVar85) &
                  bVar12 | bVar35;
      pbVar2[4] = -((byte)((bVar21 < bVar86) * bVar21 | (bVar21 >= bVar86) * bVar86) == bVar86) &
                  bVar13 | bVar36;
      pbVar2[5] = -((byte)((bVar22 < bVar87) * bVar22 | (bVar22 >= bVar87) * bVar87) == bVar87) &
                  bVar14 | bVar37;
      pbVar2[6] = -((byte)((bVar23 < bVar88) * bVar23 | (bVar23 >= bVar88) * bVar88) == bVar88) &
                  bVar15 | bVar38;
      pbVar2[7] = -((byte)((bVar24 < bVar89) * bVar24 | (bVar24 >= bVar89) * bVar89) == bVar89) &
                  bVar16 | bVar39;
      pbVar2[8] = -((byte)((bVar25 < bVar90) * bVar25 | (bVar25 >= bVar90) * bVar90) == bVar90) &
                  bVar72 | bVar40;
      pbVar2[9] = -((byte)((bVar26 < bVar91) * bVar26 | (bVar26 >= bVar91) * bVar91) == bVar91) &
                  bVar74 | bVar41;
      pbVar2[10] = -((byte)((bVar27 < bVar92) * bVar27 | (bVar27 >= bVar92) * bVar92) == bVar92) &
                   bVar75 | bVar42;
      pbVar2[0xb] = -((byte)((bVar28 < bVar93) * bVar28 | (bVar28 >= bVar93) * bVar93) == bVar93) &
                    bVar76 | bVar43;
      pbVar2[0xc] = -((byte)((bVar29 < bVar94) * bVar29 | (bVar29 >= bVar94) * bVar94) == bVar94) &
                    bVar77 | bVar44;
      pbVar2[0xd] = -((byte)((bVar30 < bVar95) * bVar30 | (bVar30 >= bVar95) * bVar95) == bVar95) &
                    bVar78 | bVar45;
      pbVar2[0xe] = -((byte)((bVar31 < bVar96) * bVar31 | (bVar31 >= bVar96) * bVar96) == bVar96) &
                    bVar79 | bVar46;
      pbVar2[0xf] = -((byte)((bVar32 < bVar97) * bVar32 | (bVar32 >= bVar97) * bVar97) == bVar97) &
                    bVar80 | bVar47;
      pbVar1 = (byte *)(lVar66 + 0x10 + uVar68);
      *pbVar1 = -((byte)((bVar17 < bVar98) * bVar17 | (bVar17 >= bVar98) * bVar98) == bVar98) &
                bVar9 | bVar48;
      pbVar1[1] = -((byte)((bVar18 < bVar99) * bVar18 | (bVar18 >= bVar99) * bVar99) == bVar99) &
                  bVar10 | bVar49;
      pbVar1[2] = -((byte)((bVar19 < bVar100) * bVar19 | (bVar19 >= bVar100) * bVar100) == bVar100)
                  & bVar11 | bVar50;
      pbVar1[3] = -((byte)((bVar20 < bVar101) * bVar20 | (bVar20 >= bVar101) * bVar101) == bVar101)
                  & bVar12 | bVar51;
      pbVar1[4] = -((byte)((bVar21 < bVar102) * bVar21 | (bVar21 >= bVar102) * bVar102) == bVar102)
                  & bVar13 | bVar52;
      pbVar1[5] = -((byte)((bVar22 < bVar103) * bVar22 | (bVar22 >= bVar103) * bVar103) == bVar103)
                  & bVar14 | bVar53;
      pbVar1[6] = -((byte)((bVar23 < bVar104) * bVar23 | (bVar23 >= bVar104) * bVar104) == bVar104)
                  & bVar15 | bVar54;
      pbVar1[7] = -((byte)((bVar24 < bVar105) * bVar24 | (bVar24 >= bVar105) * bVar105) == bVar105)
                  & bVar16 | bVar55;
      pbVar1[8] = -((byte)((bVar25 < bVar106) * bVar25 | (bVar25 >= bVar106) * bVar106) == bVar106)
                  & bVar72 | bVar56;
      pbVar1[9] = -((byte)((bVar26 < bVar107) * bVar26 | (bVar26 >= bVar107) * bVar107) == bVar107)
                  & bVar74 | bVar57;
      pbVar1[10] = -((byte)((bVar27 < bVar108) * bVar27 | (bVar27 >= bVar108) * bVar108) == bVar108)
                   & bVar75 | bVar58;
      pbVar1[0xb] = -((byte)((bVar28 < bVar109) * bVar28 | (bVar28 >= bVar109) * bVar109) == bVar109
                     ) & bVar76 | bVar59;
      pbVar1[0xc] = -((byte)((bVar29 < bVar110) * bVar29 | (bVar29 >= bVar110) * bVar110) == bVar110
                     ) & bVar77 | bVar60;
      pbVar1[0xd] = -((byte)((bVar30 < bVar111) * bVar30 | (bVar30 >= bVar111) * bVar111) == bVar111
                     ) & bVar78 | bVar61;
      pbVar1[0xe] = -((byte)((bVar31 < bVar112) * bVar31 | (bVar31 >= bVar112) * bVar112) == bVar112
                     ) & bVar79 | bVar62;
      pbVar1[0xf] = -((byte)((bVar32 < bVar113) * bVar32 | (bVar32 >= bVar113) * bVar113) == bVar113
                     ) & bVar80 | bVar63;
      uVar68 = uVar68 + 0x20;
    } while (uVar67 != uVar68);
    if (uVar7 != uVar67) {
      uVar68 = uVar67;
      if ((uVar7 & 0x18) != 0) goto LAB_14599e50a;
      goto LAB_14599e573;
    }
  }
  func_0x000140002200();
  uVar68 = func_0x0001400021c0();
  auVar64 = _DAT_145dc9cc0;
  bVar80 = bRam0000000145dad18f;
  bVar79 = bRam0000000145dad18e;
  bVar78 = bRam0000000145dad18d;
  bVar77 = bRam0000000145dad18c;
  bVar76 = bRam0000000145dad18b;
  bVar75 = bRam0000000145dad18a;
  bVar74 = bRam0000000145dad189;
  bVar72 = bRam0000000145dad188;
  bVar16 = bRam0000000145dad187;
  bVar15 = bRam0000000145dad186;
  bVar14 = bRam0000000145dad185;
  bVar13 = bRam0000000145dad184;
  bVar12 = bRam0000000145dad183;
  bVar11 = bRam0000000145dad182;
  bVar10 = bRam0000000145dad181;
  bVar9 = DAT_145dad180;
  if (uVar68 == 0) {
    func_0x000145da94eb();
                    /* WARNING: Does not return */
    pcVar8 = (code *)invalidInstructionException();
    (*pcVar8)();
  }
  if (uVar7 < 8) {
    uVar67 = 0;
  }
  else {
    if (uVar7 < 0x20) {
      uVar69 = 0;
    }
    else {
      uVar67 = uVar7 & 0x7fffffffffffffe0;
      uVar69 = 0;
      do {
        auVar5 = *(undefined1 (*) [16])(lVar66 + uVar69);
        auVar6 = *(undefined1 (*) [16])(lVar66 + 0x10 + uVar69);
        auVar73[0] = -(auVar5[0] == bVar9);
        auVar73[1] = -(auVar5[1] == bVar10);
        auVar73[2] = -(auVar5[2] == bVar11);
        auVar73[3] = -(auVar5[3] == bVar12);
        auVar73[4] = -(auVar5[4] == bVar13);
        auVar73[5] = -(auVar5[5] == bVar14);
        auVar73[6] = -(auVar5[6] == bVar15);
        auVar73[7] = -(auVar5[7] == bVar16);
        auVar73[8] = -(auVar5[8] == bVar72);
        auVar73[9] = -(auVar5[9] == bVar74);
        auVar73[10] = -(auVar5[10] == bVar75);
        auVar73[0xb] = -(auVar5[0xb] == bVar76);
        auVar73[0xc] = -(auVar5[0xc] == bVar77);
        auVar73[0xd] = -(auVar5[0xd] == bVar78);
        auVar73[0xe] = -(auVar5[0xe] == bVar79);
        auVar73[0xf] = -(auVar5[0xf] == bVar80);
        auVar82[0] = -(auVar6[0] == bVar9);
        auVar82[1] = -(auVar6[1] == bVar10);
        auVar82[2] = -(auVar6[2] == bVar11);
        auVar82[3] = -(auVar6[3] == bVar12);
        auVar82[4] = -(auVar6[4] == bVar13);
        auVar82[5] = -(auVar6[5] == bVar14);
        auVar82[6] = -(auVar6[6] == bVar15);
        auVar82[7] = -(auVar6[7] == bVar16);
        auVar82[8] = -(auVar6[8] == bVar72);
        auVar82[9] = -(auVar6[9] == bVar74);
        auVar82[10] = -(auVar6[10] == bVar75);
        auVar82[0xb] = -(auVar6[0xb] == bVar76);
        auVar82[0xc] = -(auVar6[0xc] == bVar77);
        auVar82[0xd] = -(auVar6[0xd] == bVar78);
        auVar82[0xe] = -(auVar6[0xe] == bVar79);
        auVar82[0xf] = -(auVar6[0xf] == bVar80);
        *(undefined1 (*) [16])(uVar68 + uVar69) = auVar73 & auVar64 | ~auVar73 & auVar5;
        *(undefined1 (*) [16])(uVar68 + 0x10 + uVar69) = auVar82 & auVar64 | ~auVar82 & auVar6;
        uVar69 = uVar69 + 0x20;
      } while (uVar67 != uVar69);
      if (uVar7 == uVar67) goto LAB_14599e6c9;
      uVar69 = uVar67;
      if ((uVar7 & 0x18) == 0) goto LAB_14599e6a1;
    }
    uVar65 = _DAT_146560e80;
    uVar3 = _DAT_145dad2b0;
    uVar67 = uVar7 & 0x7ffffffffffffff8;
    do {
      uVar4 = *(ulong *)(lVar66 + uVar69);
      uVar71 = CONCAT17(-((char)(uVar4 >> 0x38) == (char)(uVar3 >> 0x38)),
                        CONCAT16(-((char)(uVar4 >> 0x30) == (char)(uVar3 >> 0x30)),
                                 CONCAT15(-((char)(uVar4 >> 0x28) == (char)(uVar3 >> 0x28)),
                                          CONCAT14(-((char)(uVar4 >> 0x20) == (char)(uVar3 >> 0x20))
                                                   ,CONCAT13(-((char)(uVar4 >> 0x18) ==
                                                              (char)(uVar3 >> 0x18)),
                                                             CONCAT12(-((char)(uVar4 >> 0x10) ==
                                                                       (char)(uVar3 >> 0x10)),
                                                                      CONCAT11(-((char)(uVar4 >> 8)
                                                                                == (char)(uVar3 >> 8
                                                                                         )),
                                                                               -((char)uVar4 ==
                                                                                (char)uVar3))))))));
      *(ulong *)(uVar68 + uVar69) = uVar71 & uVar65 | ~uVar71 & uVar4;
      uVar69 = uVar69 + 8;
    } while (uVar67 != uVar69);
    if (uVar7 == uVar67) goto LAB_14599e6c9;
  }
LAB_14599e6a1:
  do {
    cVar70 = *(char *)(lVar66 + uVar67);
    if (*(char *)(lVar66 + uVar67) == ' ') {
      cVar70 = '_';
    }
    *(char *)(uVar68 + uVar67) = cVar70;
    uVar67 = uVar67 + 1;
  } while (uVar7 != uVar67);
LAB_14599e6c9:
  *param_4 = uVar7;
  param_4[1] = uVar68;
  param_4[2] = uVar7;
  func_0x0001400021d0();
  return param_4;
}
