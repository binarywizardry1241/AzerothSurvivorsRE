
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 *
entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,undefined8 *param_4,
     undefined8 param_5)

{
  byte *pbVar1;
  ulong uVar2;
  byte bVar3;
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
  undefined1 auVar59 [16];
  ulong uVar60;
  long lVar61;
  byte *pbVar62;
  ulong uVar63;
  byte *pbVar64;
  ulong uVar65;
  uint uVar66;
  ulong uVar67;
  uint uVar68;
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
  byte bVar107;
  byte bVar108;
  undefined1 auVar109 [16];

  auVar109 = func_0x00014006f550(param_1,param_4,param_5,param_3);
  uVar67 = auVar109._8_8_;
  pbVar64 = auVar109._0_8_;
  if (uVar67 < 0x20) {
    lVar61 = func_0x000145ba4c30();
  }
  else {
    lVar61 = func_0x000145ba4610();
  }
  if (lVar61 - 2U < 0xb) {
    pbVar62 = pbVar64 + uVar67;
    do {
      if (pbVar64 == pbVar62) {
        if (-1 < (long)uVar67) {
          if (uVar67 == 0) goto LAB_145891651;
          func_0x000140002200();
          pbVar64 = (byte *)func_0x0001400021c0();
          if (pbVar64 != (byte *)0x0) {
            func_0x000145bc977b();
            bVar76 = bRam0000000145d6d18f;
            bVar75 = bRam0000000145d6d18e;
            bVar74 = bRam0000000145d6d18d;
            bVar73 = bRam0000000145d6d18c;
            bVar72 = bRam0000000145d6d18b;
            bVar71 = bRam0000000145d6d18a;
            bVar70 = bRam0000000145d6d189;
            bVar69 = bRam0000000145d6d188;
            bVar11 = bRam0000000145d6d187;
            bVar10 = bRam0000000145d6d186;
            bVar9 = bRam0000000145d6d185;
            bVar8 = bRam0000000145d6d184;
            bVar7 = bRam0000000145d6d183;
            bVar6 = bRam0000000145d6d182;
            bVar5 = bRam0000000145d6d181;
            bVar3 = DAT_145d6d180;
            auVar59 = _DAT_145d6d170;
            auVar109 = _DAT_145d6d160;
            if (uVar67 < 8) {
              uVar63 = 0;
              goto LAB_145891541;
            }
            if (0x1f < uVar67) {
              uVar63 = uVar67 & 0x7fffffffffffffe0;
              uVar65 = 0;
              do {
                pbVar62 = pbVar64 + uVar65;
                bVar28 = pbVar62[1];
                bVar29 = pbVar62[2];
                bVar30 = pbVar62[3];
                bVar31 = pbVar62[4];
                bVar32 = pbVar62[5];
                bVar33 = pbVar62[6];
                bVar34 = pbVar62[7];
                bVar35 = pbVar62[8];
                bVar36 = pbVar62[9];
                bVar37 = pbVar62[10];
                bVar38 = pbVar62[0xb];
                bVar39 = pbVar62[0xc];
                bVar40 = pbVar62[0xd];
                bVar41 = pbVar62[0xe];
                bVar42 = pbVar62[0xf];
                pbVar1 = pbVar64 + uVar65 + 0x10;
                bVar43 = *pbVar1;
                bVar44 = pbVar1[1];
                bVar45 = pbVar1[2];
                bVar46 = pbVar1[3];
                bVar47 = pbVar1[4];
                bVar48 = pbVar1[5];
                bVar49 = pbVar1[6];
                bVar50 = pbVar1[7];
                bVar51 = pbVar1[8];
                bVar52 = pbVar1[9];
                bVar53 = pbVar1[10];
                bVar54 = pbVar1[0xb];
                bVar55 = pbVar1[0xc];
                bVar56 = pbVar1[0xd];
                bVar57 = pbVar1[0xe];
                bVar58 = pbVar1[0xf];
                bVar77 = *pbVar62 + auVar109[0];
                bVar78 = bVar28 + auVar109[1];
                bVar79 = bVar29 + auVar109[2];
                bVar80 = bVar30 + auVar109[3];
                bVar81 = bVar31 + auVar109[4];
                bVar82 = bVar32 + auVar109[5];
                bVar83 = bVar33 + auVar109[6];
                bVar84 = bVar34 + auVar109[7];
                bVar85 = bVar35 + auVar109[8];
                bVar86 = bVar36 + auVar109[9];
                bVar87 = bVar37 + auVar109[10];
                bVar88 = bVar38 + auVar109[0xb];
                bVar89 = bVar39 + auVar109[0xc];
                bVar90 = bVar40 + auVar109[0xd];
                bVar91 = bVar41 + auVar109[0xe];
                bVar92 = bVar42 + auVar109[0xf];
                bVar93 = bVar43 + auVar109[0];
                bVar94 = bVar44 + auVar109[1];
                bVar95 = bVar45 + auVar109[2];
                bVar96 = bVar46 + auVar109[3];
                bVar97 = bVar47 + auVar109[4];
                bVar98 = bVar48 + auVar109[5];
                bVar99 = bVar49 + auVar109[6];
                bVar100 = bVar50 + auVar109[7];
                bVar101 = bVar51 + auVar109[8];
                bVar102 = bVar52 + auVar109[9];
                bVar103 = bVar53 + auVar109[10];
                bVar104 = bVar54 + auVar109[0xb];
                bVar105 = bVar55 + auVar109[0xc];
                bVar106 = bVar56 + auVar109[0xd];
                bVar107 = bVar57 + auVar109[0xe];
                bVar108 = bVar58 + auVar109[0xf];
                bVar12 = auVar59[0];
                bVar13 = auVar59[1];
                bVar14 = auVar59[2];
                bVar15 = auVar59[3];
                bVar16 = auVar59[4];
                bVar17 = auVar59[5];
                bVar18 = auVar59[6];
                bVar19 = auVar59[7];
                bVar20 = auVar59[8];
                bVar21 = auVar59[9];
                bVar22 = auVar59[10];
                bVar23 = auVar59[0xb];
                bVar24 = auVar59[0xc];
                bVar25 = auVar59[0xd];
                bVar26 = auVar59[0xe];
                bVar27 = auVar59[0xf];
                pbVar1 = pbVar64 + uVar65;
                *pbVar1 = -((byte)((bVar12 < bVar77) * bVar12 | (bVar12 >= bVar77) * bVar77) ==
                           bVar77) & bVar3 | *pbVar62;
                pbVar1[1] = -((byte)((bVar13 < bVar78) * bVar13 | (bVar13 >= bVar78) * bVar78) ==
                             bVar78) & bVar5 | bVar28;
                pbVar1[2] = -((byte)((bVar14 < bVar79) * bVar14 | (bVar14 >= bVar79) * bVar79) ==
                             bVar79) & bVar6 | bVar29;
                pbVar1[3] = -((byte)((bVar15 < bVar80) * bVar15 | (bVar15 >= bVar80) * bVar80) ==
                             bVar80) & bVar7 | bVar30;
                pbVar1[4] = -((byte)((bVar16 < bVar81) * bVar16 | (bVar16 >= bVar81) * bVar81) ==
                             bVar81) & bVar8 | bVar31;
                pbVar1[5] = -((byte)((bVar17 < bVar82) * bVar17 | (bVar17 >= bVar82) * bVar82) ==
                             bVar82) & bVar9 | bVar32;
                pbVar1[6] = -((byte)((bVar18 < bVar83) * bVar18 | (bVar18 >= bVar83) * bVar83) ==
                             bVar83) & bVar10 | bVar33;
                pbVar1[7] = -((byte)((bVar19 < bVar84) * bVar19 | (bVar19 >= bVar84) * bVar84) ==
                             bVar84) & bVar11 | bVar34;
                pbVar1[8] = -((byte)((bVar20 < bVar85) * bVar20 | (bVar20 >= bVar85) * bVar85) ==
                             bVar85) & bVar69 | bVar35;
                pbVar1[9] = -((byte)((bVar21 < bVar86) * bVar21 | (bVar21 >= bVar86) * bVar86) ==
                             bVar86) & bVar70 | bVar36;
                pbVar1[10] = -((byte)((bVar22 < bVar87) * bVar22 | (bVar22 >= bVar87) * bVar87) ==
                              bVar87) & bVar71 | bVar37;
                pbVar1[0xb] = -((byte)((bVar23 < bVar88) * bVar23 | (bVar23 >= bVar88) * bVar88) ==
                               bVar88) & bVar72 | bVar38;
                pbVar1[0xc] = -((byte)((bVar24 < bVar89) * bVar24 | (bVar24 >= bVar89) * bVar89) ==
                               bVar89) & bVar73 | bVar39;
                pbVar1[0xd] = -((byte)((bVar25 < bVar90) * bVar25 | (bVar25 >= bVar90) * bVar90) ==
                               bVar90) & bVar74 | bVar40;
                pbVar1[0xe] = -((byte)((bVar26 < bVar91) * bVar26 | (bVar26 >= bVar91) * bVar91) ==
                               bVar91) & bVar75 | bVar41;
                pbVar1[0xf] = -((byte)((bVar27 < bVar92) * bVar27 | (bVar27 >= bVar92) * bVar92) ==
                               bVar92) & bVar76 | bVar42;
                pbVar62 = pbVar64 + uVar65 + 0x10;
                *pbVar62 = -((byte)((bVar12 < bVar93) * bVar12 | (bVar12 >= bVar93) * bVar93) ==
                            bVar93) & bVar3 | bVar43;
                pbVar62[1] = -((byte)((bVar13 < bVar94) * bVar13 | (bVar13 >= bVar94) * bVar94) ==
                              bVar94) & bVar5 | bVar44;
                pbVar62[2] = -((byte)((bVar14 < bVar95) * bVar14 | (bVar14 >= bVar95) * bVar95) ==
                              bVar95) & bVar6 | bVar45;
                pbVar62[3] = -((byte)((bVar15 < bVar96) * bVar15 | (bVar15 >= bVar96) * bVar96) ==
                              bVar96) & bVar7 | bVar46;
                pbVar62[4] = -((byte)((bVar16 < bVar97) * bVar16 | (bVar16 >= bVar97) * bVar97) ==
                              bVar97) & bVar8 | bVar47;
                pbVar62[5] = -((byte)((bVar17 < bVar98) * bVar17 | (bVar17 >= bVar98) * bVar98) ==
                              bVar98) & bVar9 | bVar48;
                pbVar62[6] = -((byte)((bVar18 < bVar99) * bVar18 | (bVar18 >= bVar99) * bVar99) ==
                              bVar99) & bVar10 | bVar49;
                pbVar62[7] = -((byte)((bVar19 < bVar100) * bVar19 | (bVar19 >= bVar100) * bVar100)
                              == bVar100) & bVar11 | bVar50;
                pbVar62[8] = -((byte)((bVar20 < bVar101) * bVar20 | (bVar20 >= bVar101) * bVar101)
                              == bVar101) & bVar69 | bVar51;
                pbVar62[9] = -((byte)((bVar21 < bVar102) * bVar21 | (bVar21 >= bVar102) * bVar102)
                              == bVar102) & bVar70 | bVar52;
                pbVar62[10] = -((byte)((bVar22 < bVar103) * bVar22 | (bVar22 >= bVar103) * bVar103)
                               == bVar103) & bVar71 | bVar53;
                pbVar62[0xb] = -((byte)((bVar23 < bVar104) * bVar23 | (bVar23 >= bVar104) * bVar104)
                                == bVar104) & bVar72 | bVar54;
                pbVar62[0xc] = -((byte)((bVar24 < bVar105) * bVar24 | (bVar24 >= bVar105) * bVar105)
                                == bVar105) & bVar73 | bVar55;
                pbVar62[0xd] = -((byte)((bVar25 < bVar106) * bVar25 | (bVar25 >= bVar106) * bVar106)
                                == bVar106) & bVar74 | bVar56;
                pbVar62[0xe] = -((byte)((bVar26 < bVar107) * bVar26 | (bVar26 >= bVar107) * bVar107)
                                == bVar107) & bVar75 | bVar57;
                pbVar62[0xf] = -((byte)((bVar27 < bVar108) * bVar27 | (bVar27 >= bVar108) * bVar108)
                                == bVar108) & bVar76 | bVar58;
                uVar65 = uVar65 + 0x20;
              } while (uVar63 != uVar65);
              if (uVar67 != uVar63) {
                uVar65 = uVar63;
                if ((uVar67 & 0x18) == 0) goto LAB_145891541;
LAB_1458914ca:
                uVar60 = _DAT_145d6d200;
                auVar59 = _DAT_145d6d1f0;
                auVar109 = _DAT_145d6d1e0;
                uVar63 = uVar67 & 0x7ffffffffffffff8;
                do {
                  uVar2 = *(ulong *)(pbVar64 + uVar65);
                  bVar69 = (char)uVar2 + auVar109[0];
                  bVar70 = (char)(uVar2 >> 8) + auVar109[1];
                  bVar71 = (char)(uVar2 >> 0x10) + auVar109[2];
                  bVar72 = (char)(uVar2 >> 0x18) + auVar109[3];
                  bVar73 = (char)(uVar2 >> 0x20) + auVar109[4];
                  bVar74 = (char)(uVar2 >> 0x28) + auVar109[5];
                  bVar75 = (char)(uVar2 >> 0x30) + auVar109[6];
                  bVar76 = (char)(uVar2 >> 0x38) + auVar109[7];
                  bVar3 = auVar59[0];
                  bVar5 = auVar59[1];
                  bVar6 = auVar59[2];
                  bVar7 = auVar59[3];
                  bVar8 = auVar59[4];
                  bVar9 = auVar59[5];
                  bVar10 = auVar59[6];
                  bVar11 = auVar59[7];
                  *(ulong *)(pbVar64 + uVar65) =
                       ~CONCAT17(-((byte)((bVar76 < bVar11) * bVar11 | (bVar76 >= bVar11) * bVar76)
                                  == bVar76),
                                 CONCAT16(-((byte)((bVar75 < bVar10) * bVar10 |
                                                  (bVar75 >= bVar10) * bVar75) == bVar75),
                                          CONCAT15(-((byte)((bVar74 < bVar9) * bVar9 |
                                                           (bVar74 >= bVar9) * bVar74) == bVar74),
                                                   CONCAT14(-((byte)((bVar73 < bVar8) * bVar8 |
                                                                    (bVar73 >= bVar8) * bVar73) ==
                                                             bVar73),CONCAT13(-((byte)((bVar72 <
                                                  bVar7) * bVar7 | (bVar72 >= bVar7) * bVar72) ==
                                                  bVar72),CONCAT12(-((byte)((bVar71 < bVar6) * bVar6
                                                                           | (bVar71 >= bVar6) *
                                                                             bVar71) == bVar71),
                                                                   CONCAT11(-((byte)((bVar70 < bVar5
                                                                                     ) * bVar5 |
                                                                                    (bVar70 >= bVar5
                                                                                    ) * bVar70) ==
                                                                             bVar70),-((byte)((
                                                  bVar69 < bVar3) * bVar3 |
                                                  (bVar69 >= bVar3) * bVar69) == bVar69)))))))) &
                       uVar60 | uVar2;
                  uVar65 = uVar65 + 8;
                } while (uVar63 != uVar65);
                for (; uVar67 != uVar63; uVar63 = uVar63 + 1) {
LAB_145891541:
                  pbVar64[uVar63] = ((byte)(pbVar64[uVar63] + 0xbf) < 0x1a) << 5 | pbVar64[uVar63];
                }
              }
              if ((uVar67 == 1) || (-0x41 < (char)pbVar64[1])) {
                func_0x000140002200();
                lVar61 = 1;
                pbVar62 = (byte *)func_0x0001400021c0();
                if (pbVar62 != (byte *)0x0) {
                  *pbVar62 = ((byte)(*pbVar64 + 0x9f) < 0x1a) << 5 ^ *pbVar64;
                  if (uVar67 != 1) {
                    if ((char)pbVar64[1] < -0x40) {
                      func_0x000145d69660();
                      goto LAB_1458916b2;
                    }
                    lVar61 = uVar67 - 1;
                    func_0x000145bcb2d0();
                    func_0x000145bc977b();
                    lVar61 = lVar61 + 1;
                  }
                  param_4[2] = lVar61;
                  *param_4 = 1;
                  param_4[1] = pbVar62;
                  func_0x0001400021d0();
                  return param_4;
                }
                func_0x000145d6944b();
              }
              else {
LAB_145891651:
                func_0x000145d69660();
              }
LAB_1458916b2:
                    /* WARNING: Does not return */
              pcVar4 = (code *)invalidInstructionException();
              (*pcVar4)();
            }
            uVar65 = 0;
            goto LAB_1458914ca;
          }
        }
        func_0x000145d6944b();
                    /* WARNING: Does not return */
        pcVar4 = (code *)invalidInstructionException();
        (*pcVar4)();
      }
      bVar3 = *pbVar64;
      uVar68 = (uint)bVar3;
      if ((char)bVar3 < '\0') {
        pbVar1 = pbVar64 + 1;
        if (bVar3 < 0xe0) {
          pbVar64 = pbVar64 + 2;
          uVar68 = (uVar68 & 0x1f) << 6 | *pbVar1 & 0x3f;
        }
        else {
          uVar66 = pbVar64[2] & 0x3f | (*pbVar1 & 0x3f) << 6;
          if (bVar3 < 0xf0) {
            pbVar64 = pbVar64 + 3;
            uVar68 = uVar66 | (uVar68 & 0x1f) << 0xc;
          }
          else {
            pbVar1 = pbVar64 + 3;
            pbVar64 = pbVar64 + 4;
            uVar68 = *pbVar1 & 0x3f | uVar66 << 6 | (uVar68 & 7) << 0x12;
          }
        }
      }
      else {
        pbVar64 = pbVar64 + 1;
      }
    } while (0xffffffe5 < (uVar68 & 0xffffffdf) - 0x5b);
  }
  *param_4 = 0xffffffffffffffff;
  return param_4;
}
