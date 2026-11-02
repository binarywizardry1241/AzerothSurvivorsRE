
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8
entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,undefined8 param_4,undefined8 param_5
     ,ulong param_6)

{
  byte *pbVar1;
  byte *pbVar2;
  ulong uVar3;
  code *pcVar4;
  byte bVar5;
  byte bVar6;
  byte bVar7;
  byte bVar8;
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
  undefined1 auVar60 [16];
  undefined1 auVar61 [16];
  ulong uVar62;
  long lVar63;
  ulong uVar64;
  ulong uVar65;
  ulong uVar66;
  byte bVar67;
  byte bVar68;
  byte bVar69;
  byte bVar70;
  byte bVar71;
  byte bVar72;
  byte bVar73;
  byte bVar74;
  byte bVar75;
  byte bVar76;
  byte bVar77;
  byte bVar78;
  byte bVar79;
  byte bVar80;
  byte bVar81;
  byte bVar82;
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
  byte bVar98;
  byte bVar99;
  byte bVar100;
  byte bVar101;
  byte bVar102;
  byte bVar103;
  byte bVar104;
  byte bVar105;
  byte bVar106;

  uVar66 = 0x15;
  if (param_6 != 0) {
    uVar66 = param_6;
  }
  if ((long)uVar66 < 0) {
LAB_1400c7c91:
    func_0x0001458e721b();
                    /* WARNING: Does not return */
    pcVar4 = (code *)invalidInstructionException();
    (*pcVar4)();
  }
  func_0x000140002200(param_3,param_4);
  lVar63 = func_0x0001400021c0();
  if (lVar63 == 0) goto LAB_1400c7c91;
  func_0x000145756ddd();
  bVar74 = bRam00000001458ed04f;
  bVar73 = bRam00000001458ed04e;
  bVar72 = bRam00000001458ed04d;
  bVar71 = bRam00000001458ed04c;
  bVar70 = bRam00000001458ed04b;
  bVar69 = bRam00000001458ed04a;
  bVar68 = bRam00000001458ed049;
  bVar67 = bRam00000001458ed048;
  bVar12 = bRam00000001458ed047;
  bVar11 = bRam00000001458ed046;
  bVar10 = bRam00000001458ed045;
  bVar9 = bRam00000001458ed044;
  bVar8 = bRam00000001458ed043;
  bVar7 = bRam00000001458ed042;
  bVar6 = bRam00000001458ed041;
  bVar5 = DAT_1458ed040;
  auVar61 = _DAT_1458ed030;
  auVar60 = _DAT_1458eb600;
  if (uVar66 < 8) {
    uVar64 = 0;
  }
  else {
    if (uVar66 < 0x20) {
      uVar65 = 0;
LAB_1400c7d99:
      uVar62 = _DAT_1458ed070;
      auVar61 = _DAT_1458ed060;
      auVar60 = _DAT_1458ed050;
      uVar64 = uVar66 & 0x7ffffffffffffff8;
      do {
        uVar3 = *(ulong *)(lVar63 + uVar65);
        bVar67 = (char)uVar3 + auVar60[0];
        bVar68 = (char)(uVar3 >> 8) + auVar60[1];
        bVar69 = (char)(uVar3 >> 0x10) + auVar60[2];
        bVar70 = (char)(uVar3 >> 0x18) + auVar60[3];
        bVar71 = (char)(uVar3 >> 0x20) + auVar60[4];
        bVar72 = (char)(uVar3 >> 0x28) + auVar60[5];
        bVar73 = (char)(uVar3 >> 0x30) + auVar60[6];
        bVar74 = (char)(uVar3 >> 0x38) + auVar60[7];
        bVar5 = auVar61[0];
        bVar6 = auVar61[1];
        bVar7 = auVar61[2];
        bVar8 = auVar61[3];
        bVar9 = auVar61[4];
        bVar10 = auVar61[5];
        bVar11 = auVar61[6];
        bVar12 = auVar61[7];
        *(ulong *)(lVar63 + uVar65) =
             ~CONCAT17(-((byte)((bVar74 < bVar12) * bVar12 | (bVar74 >= bVar12) * bVar74) == bVar74)
                       ,CONCAT16(-((byte)((bVar73 < bVar11) * bVar11 | (bVar73 >= bVar11) * bVar73)
                                  == bVar73),
                                 CONCAT15(-((byte)((bVar72 < bVar10) * bVar10 |
                                                  (bVar72 >= bVar10) * bVar72) == bVar72),
                                          CONCAT14(-((byte)((bVar71 < bVar9) * bVar9 |
                                                           (bVar71 >= bVar9) * bVar71) == bVar71),
                                                   CONCAT13(-((byte)((bVar70 < bVar8) * bVar8 |
                                                                    (bVar70 >= bVar8) * bVar70) ==
                                                             bVar70),CONCAT12(-((byte)((bVar69 <
                                                  bVar7) * bVar7 | (bVar69 >= bVar7) * bVar69) ==
                                                  bVar69),CONCAT11(-((byte)((bVar68 < bVar6) * bVar6
                                                                           | (bVar68 >= bVar6) *
                                                                             bVar68) == bVar68),
                                                                   -((byte)((bVar67 < bVar5) * bVar5
                                                                           | (bVar67 >= bVar5) *
                                                                             bVar67) == bVar67))))))
                                )) & uVar62 | uVar3;
        uVar65 = uVar65 + 8;
        if (uVar64 == uVar65) goto LAB_1400c7e1d;
      } while( true );
    }
    uVar64 = uVar66 & 0x7fffffffffffffe0;
    uVar65 = 0;
    do {
      pbVar1 = (byte *)(lVar63 + uVar65);
      bVar29 = pbVar1[1];
      bVar30 = pbVar1[2];
      bVar31 = pbVar1[3];
      bVar32 = pbVar1[4];
      bVar33 = pbVar1[5];
      bVar34 = pbVar1[6];
      bVar35 = pbVar1[7];
      bVar36 = pbVar1[8];
      bVar37 = pbVar1[9];
      bVar38 = pbVar1[10];
      bVar39 = pbVar1[0xb];
      bVar40 = pbVar1[0xc];
      bVar41 = pbVar1[0xd];
      bVar42 = pbVar1[0xe];
      bVar43 = pbVar1[0xf];
      pbVar2 = (byte *)(lVar63 + 0x10 + uVar65);
      bVar44 = *pbVar2;
      bVar45 = pbVar2[1];
      bVar46 = pbVar2[2];
      bVar47 = pbVar2[3];
      bVar48 = pbVar2[4];
      bVar49 = pbVar2[5];
      bVar50 = pbVar2[6];
      bVar51 = pbVar2[7];
      bVar52 = pbVar2[8];
      bVar53 = pbVar2[9];
      bVar54 = pbVar2[10];
      bVar55 = pbVar2[0xb];
      bVar56 = pbVar2[0xc];
      bVar57 = pbVar2[0xd];
      bVar58 = pbVar2[0xe];
      bVar59 = pbVar2[0xf];
      bVar75 = *pbVar1 + auVar61[0];
      bVar76 = bVar29 + auVar61[1];
      bVar77 = bVar30 + auVar61[2];
      bVar78 = bVar31 + auVar61[3];
      bVar79 = bVar32 + auVar61[4];
      bVar80 = bVar33 + auVar61[5];
      bVar81 = bVar34 + auVar61[6];
      bVar82 = bVar35 + auVar61[7];
      bVar83 = bVar36 + auVar61[8];
      bVar84 = bVar37 + auVar61[9];
      bVar85 = bVar38 + auVar61[10];
      bVar86 = bVar39 + auVar61[0xb];
      bVar87 = bVar40 + auVar61[0xc];
      bVar88 = bVar41 + auVar61[0xd];
      bVar89 = bVar42 + auVar61[0xe];
      bVar90 = bVar43 + auVar61[0xf];
      bVar91 = bVar44 + auVar61[0];
      bVar92 = bVar45 + auVar61[1];
      bVar93 = bVar46 + auVar61[2];
      bVar94 = bVar47 + auVar61[3];
      bVar95 = bVar48 + auVar61[4];
      bVar96 = bVar49 + auVar61[5];
      bVar97 = bVar50 + auVar61[6];
      bVar98 = bVar51 + auVar61[7];
      bVar99 = bVar52 + auVar61[8];
      bVar100 = bVar53 + auVar61[9];
      bVar101 = bVar54 + auVar61[10];
      bVar102 = bVar55 + auVar61[0xb];
      bVar103 = bVar56 + auVar61[0xc];
      bVar104 = bVar57 + auVar61[0xd];
      bVar105 = bVar58 + auVar61[0xe];
      bVar106 = bVar59 + auVar61[0xf];
      bVar13 = auVar60[0];
      bVar14 = auVar60[1];
      bVar15 = auVar60[2];
      bVar16 = auVar60[3];
      bVar17 = auVar60[4];
      bVar18 = auVar60[5];
      bVar19 = auVar60[6];
      bVar20 = auVar60[7];
      bVar21 = auVar60[8];
      bVar22 = auVar60[9];
      bVar23 = auVar60[10];
      bVar24 = auVar60[0xb];
      bVar25 = auVar60[0xc];
      bVar26 = auVar60[0xd];
      bVar27 = auVar60[0xe];
      bVar28 = auVar60[0xf];
      pbVar2 = (byte *)(lVar63 + uVar65);
      *pbVar2 = -((byte)((bVar13 < bVar75) * bVar13 | (bVar13 >= bVar75) * bVar75) == bVar75) &
                bVar5 | *pbVar1;
      pbVar2[1] = -((byte)((bVar14 < bVar76) * bVar14 | (bVar14 >= bVar76) * bVar76) == bVar76) &
                  bVar6 | bVar29;
      pbVar2[2] = -((byte)((bVar15 < bVar77) * bVar15 | (bVar15 >= bVar77) * bVar77) == bVar77) &
                  bVar7 | bVar30;
      pbVar2[3] = -((byte)((bVar16 < bVar78) * bVar16 | (bVar16 >= bVar78) * bVar78) == bVar78) &
                  bVar8 | bVar31;
      pbVar2[4] = -((byte)((bVar17 < bVar79) * bVar17 | (bVar17 >= bVar79) * bVar79) == bVar79) &
                  bVar9 | bVar32;
      pbVar2[5] = -((byte)((bVar18 < bVar80) * bVar18 | (bVar18 >= bVar80) * bVar80) == bVar80) &
                  bVar10 | bVar33;
      pbVar2[6] = -((byte)((bVar19 < bVar81) * bVar19 | (bVar19 >= bVar81) * bVar81) == bVar81) &
                  bVar11 | bVar34;
      pbVar2[7] = -((byte)((bVar20 < bVar82) * bVar20 | (bVar20 >= bVar82) * bVar82) == bVar82) &
                  bVar12 | bVar35;
      pbVar2[8] = -((byte)((bVar21 < bVar83) * bVar21 | (bVar21 >= bVar83) * bVar83) == bVar83) &
                  bVar67 | bVar36;
      pbVar2[9] = -((byte)((bVar22 < bVar84) * bVar22 | (bVar22 >= bVar84) * bVar84) == bVar84) &
                  bVar68 | bVar37;
      pbVar2[10] = -((byte)((bVar23 < bVar85) * bVar23 | (bVar23 >= bVar85) * bVar85) == bVar85) &
                   bVar69 | bVar38;
      pbVar2[0xb] = -((byte)((bVar24 < bVar86) * bVar24 | (bVar24 >= bVar86) * bVar86) == bVar86) &
                    bVar70 | bVar39;
      pbVar2[0xc] = -((byte)((bVar25 < bVar87) * bVar25 | (bVar25 >= bVar87) * bVar87) == bVar87) &
                    bVar71 | bVar40;
      pbVar2[0xd] = -((byte)((bVar26 < bVar88) * bVar26 | (bVar26 >= bVar88) * bVar88) == bVar88) &
                    bVar72 | bVar41;
      pbVar2[0xe] = -((byte)((bVar27 < bVar89) * bVar27 | (bVar27 >= bVar89) * bVar89) == bVar89) &
                    bVar73 | bVar42;
      pbVar2[0xf] = -((byte)((bVar28 < bVar90) * bVar28 | (bVar28 >= bVar90) * bVar90) == bVar90) &
                    bVar74 | bVar43;
      pbVar1 = (byte *)(lVar63 + 0x10 + uVar65);
      *pbVar1 = -((byte)((bVar13 < bVar91) * bVar13 | (bVar13 >= bVar91) * bVar91) == bVar91) &
                bVar5 | bVar44;
      pbVar1[1] = -((byte)((bVar14 < bVar92) * bVar14 | (bVar14 >= bVar92) * bVar92) == bVar92) &
                  bVar6 | bVar45;
      pbVar1[2] = -((byte)((bVar15 < bVar93) * bVar15 | (bVar15 >= bVar93) * bVar93) == bVar93) &
                  bVar7 | bVar46;
      pbVar1[3] = -((byte)((bVar16 < bVar94) * bVar16 | (bVar16 >= bVar94) * bVar94) == bVar94) &
                  bVar8 | bVar47;
      pbVar1[4] = -((byte)((bVar17 < bVar95) * bVar17 | (bVar17 >= bVar95) * bVar95) == bVar95) &
                  bVar9 | bVar48;
      pbVar1[5] = -((byte)((bVar18 < bVar96) * bVar18 | (bVar18 >= bVar96) * bVar96) == bVar96) &
                  bVar10 | bVar49;
      pbVar1[6] = -((byte)((bVar19 < bVar97) * bVar19 | (bVar19 >= bVar97) * bVar97) == bVar97) &
                  bVar11 | bVar50;
      pbVar1[7] = -((byte)((bVar20 < bVar98) * bVar20 | (bVar20 >= bVar98) * bVar98) == bVar98) &
                  bVar12 | bVar51;
      pbVar1[8] = -((byte)((bVar21 < bVar99) * bVar21 | (bVar21 >= bVar99) * bVar99) == bVar99) &
                  bVar67 | bVar52;
      pbVar1[9] = -((byte)((bVar22 < bVar100) * bVar22 | (bVar22 >= bVar100) * bVar100) == bVar100)
                  & bVar68 | bVar53;
      pbVar1[10] = -((byte)((bVar23 < bVar101) * bVar23 | (bVar23 >= bVar101) * bVar101) == bVar101)
                   & bVar69 | bVar54;
      pbVar1[0xb] = -((byte)((bVar24 < bVar102) * bVar24 | (bVar24 >= bVar102) * bVar102) == bVar102
                     ) & bVar70 | bVar55;
      pbVar1[0xc] = -((byte)((bVar25 < bVar103) * bVar25 | (bVar25 >= bVar103) * bVar103) == bVar103
                     ) & bVar71 | bVar56;
      pbVar1[0xd] = -((byte)((bVar26 < bVar104) * bVar26 | (bVar26 >= bVar104) * bVar104) == bVar104
                     ) & bVar72 | bVar57;
      pbVar1[0xe] = -((byte)((bVar27 < bVar105) * bVar27 | (bVar27 >= bVar105) * bVar105) == bVar105
                     ) & bVar73 | bVar58;
      pbVar1[0xf] = -((byte)((bVar28 < bVar106) * bVar28 | (bVar28 >= bVar106) * bVar106) == bVar106
                     ) & bVar74 | bVar59;
      uVar65 = uVar65 + 0x20;
    } while (uVar64 != uVar65);
    if (uVar66 == uVar64) goto LAB_1400c7e22;
    uVar65 = uVar64;
    if ((uVar66 & 0x18) != 0) goto LAB_1400c7d99;
  }
  do {
    *(byte *)(lVar63 + uVar64) =
         ((byte)(*(byte *)(lVar63 + uVar64) + 0xbf) < 0x1a) << 5 | *(byte *)(lVar63 + uVar64);
    uVar64 = uVar64 + 1;
LAB_1400c7e1d:
  } while (uVar66 != uVar64);
LAB_1400c7e22:
  func_0x00014570bf80();
  if (uVar66 != 0) {
    func_0x0001400021d0();
  }
  func_0x0001400310a0();
  return param_4;
}
