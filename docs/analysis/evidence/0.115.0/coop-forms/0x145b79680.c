
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 *
entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,undefined8 *param_4,
     undefined8 param_5)

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
  undefined1 auVar57 [16];
  ulong uVar58;
  undefined1 auVar59 [16];
  byte *pbVar60;
  ulong uVar61;
  byte bVar62;
  uint uVar63;
  byte bVar64;
  ulong extraout_RDX;
  long lVar65;
  byte *pbVar66;
  byte bVar67;
  uint uVar68;
  ulong uVar69;
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
  byte bVar109;
  long local_78;

  func_0x0001401edaa0(param_1,param_4,param_5,param_3);
  if (extraout_RDX == 0) {
    *param_4 = 0;
    param_4[1] = 1;
    param_4[2] = 0;
    return param_4;
  }
  func_0x000140002200();
  pbVar60 = (byte *)func_0x0001400021c0();
  if (pbVar60 == (byte *)0x0) {
    func_0x000145eb6fcb();
                    /* WARNING: Does not return */
    pcVar4 = (code *)invalidInstructionException();
    (*pcVar4)();
  }
  pbVar66 = pbVar60;
  func_0x000145d145fb();
  auVar59 = _DAT_145f23a90;
  bVar77 = bRam0000000145ebb1cf;
  bVar76 = bRam0000000145ebb1ce;
  bVar75 = bRam0000000145ebb1cd;
  bVar74 = bRam0000000145ebb1cc;
  bVar73 = bRam0000000145ebb1cb;
  bVar72 = bRam0000000145ebb1ca;
  bVar71 = bRam0000000145ebb1c9;
  bVar70 = bRam0000000145ebb1c8;
  bVar9 = bRam0000000145ebb1c7;
  bVar8 = bRam0000000145ebb1c6;
  bVar7 = bRam0000000145ebb1c5;
  bVar6 = bRam0000000145ebb1c4;
  bVar5 = bRam0000000145ebb1c3;
  bVar67 = bRam0000000145ebb1c2;
  bVar64 = bRam0000000145ebb1c1;
  bVar62 = DAT_145ebb1c0;
  auVar57 = _DAT_145ebb1b0;
  if (extraout_RDX < 8) {
    uVar61 = 0;
  }
  else {
    if (extraout_RDX < 0x20) {
      uVar69 = 0;
LAB_145b797ce:
      auVar59 = _DAT_145f23aa0;
      uVar58 = _DAT_145ebb1f0;
      auVar57 = _DAT_145ebb1e0;
      uVar61 = extraout_RDX & 0xfffffffffffffff8;
      do {
        uVar3 = *(ulong *)(pbVar60 + uVar69);
        bVar70 = (char)uVar3 + auVar59[0];
        bVar71 = (char)(uVar3 >> 8) + auVar59[1];
        bVar72 = (char)(uVar3 >> 0x10) + auVar59[2];
        bVar73 = (char)(uVar3 >> 0x18) + auVar59[3];
        bVar74 = (char)(uVar3 >> 0x20) + auVar59[4];
        bVar75 = (char)(uVar3 >> 0x28) + auVar59[5];
        bVar76 = (char)(uVar3 >> 0x30) + auVar59[6];
        bVar77 = (char)(uVar3 >> 0x38) + auVar59[7];
        bVar62 = auVar57[0];
        bVar64 = auVar57[1];
        bVar67 = auVar57[2];
        bVar5 = auVar57[3];
        bVar6 = auVar57[4];
        bVar7 = auVar57[5];
        bVar8 = auVar57[6];
        bVar9 = auVar57[7];
        *(ulong *)(pbVar60 + uVar69) =
             ~CONCAT17(-((byte)((bVar77 < bVar9) * bVar9 | (bVar77 >= bVar9) * bVar77) == bVar77),
                       CONCAT16(-((byte)((bVar76 < bVar8) * bVar8 | (bVar76 >= bVar8) * bVar76) ==
                                 bVar76),CONCAT15(-((byte)((bVar75 < bVar7) * bVar7 |
                                                          (bVar75 >= bVar7) * bVar75) == bVar75),
                                                  CONCAT14(-((byte)((bVar74 < bVar6) * bVar6 |
                                                                   (bVar74 >= bVar6) * bVar74) ==
                                                            bVar74),CONCAT13(-((byte)((bVar73 <
                                                  bVar5) * bVar5 | (bVar73 >= bVar5) * bVar73) ==
                                                  bVar73),CONCAT12(-((byte)((bVar72 < bVar67) *
                                                                            bVar67 | (bVar72 >=
                                                                                     bVar67) *
                                                  bVar72) == bVar72),
                                                  CONCAT11(-((byte)((bVar71 < bVar64) * bVar64 |
                                                                   (bVar71 >= bVar64) * bVar71) ==
                                                            bVar71),-((byte)((bVar70 < bVar62) *
                                                                             bVar62 | (bVar70 >=
                                                                                      bVar62) *
                                                  bVar70) == bVar70)))))))) & uVar58 ^ uVar3;
        uVar69 = uVar69 + 8;
        if (uVar61 == uVar69) goto LAB_145b79868;
      } while( true );
    }
    uVar61 = extraout_RDX & 0xffffffffffffffe0;
    uVar69 = 0;
    do {
      pbVar1 = pbVar60 + uVar69;
      bVar26 = pbVar1[1];
      bVar27 = pbVar1[2];
      bVar28 = pbVar1[3];
      bVar29 = pbVar1[4];
      bVar30 = pbVar1[5];
      bVar31 = pbVar1[6];
      bVar32 = pbVar1[7];
      bVar33 = pbVar1[8];
      bVar34 = pbVar1[9];
      bVar35 = pbVar1[10];
      bVar36 = pbVar1[0xb];
      bVar37 = pbVar1[0xc];
      bVar38 = pbVar1[0xd];
      bVar39 = pbVar1[0xe];
      bVar40 = pbVar1[0xf];
      pbVar2 = pbVar60 + uVar69 + 0x10;
      bVar41 = *pbVar2;
      bVar42 = pbVar2[1];
      bVar43 = pbVar2[2];
      bVar44 = pbVar2[3];
      bVar45 = pbVar2[4];
      bVar46 = pbVar2[5];
      bVar47 = pbVar2[6];
      bVar48 = pbVar2[7];
      bVar49 = pbVar2[8];
      bVar50 = pbVar2[9];
      bVar51 = pbVar2[10];
      bVar52 = pbVar2[0xb];
      bVar53 = pbVar2[0xc];
      bVar54 = pbVar2[0xd];
      bVar55 = pbVar2[0xe];
      bVar56 = pbVar2[0xf];
      bVar78 = *pbVar1 + auVar59[0];
      bVar79 = bVar26 + auVar59[1];
      bVar80 = bVar27 + auVar59[2];
      bVar81 = bVar28 + auVar59[3];
      bVar82 = bVar29 + auVar59[4];
      bVar83 = bVar30 + auVar59[5];
      bVar84 = bVar31 + auVar59[6];
      bVar85 = bVar32 + auVar59[7];
      bVar86 = bVar33 + auVar59[8];
      bVar87 = bVar34 + auVar59[9];
      bVar88 = bVar35 + auVar59[10];
      bVar89 = bVar36 + auVar59[0xb];
      bVar90 = bVar37 + auVar59[0xc];
      bVar91 = bVar38 + auVar59[0xd];
      bVar92 = bVar39 + auVar59[0xe];
      bVar93 = bVar40 + auVar59[0xf];
      bVar94 = bVar41 + auVar59[0];
      bVar95 = bVar42 + auVar59[1];
      bVar96 = bVar43 + auVar59[2];
      bVar97 = bVar44 + auVar59[3];
      bVar98 = bVar45 + auVar59[4];
      bVar99 = bVar46 + auVar59[5];
      bVar100 = bVar47 + auVar59[6];
      bVar101 = bVar48 + auVar59[7];
      bVar102 = bVar49 + auVar59[8];
      bVar103 = bVar50 + auVar59[9];
      bVar104 = bVar51 + auVar59[10];
      bVar105 = bVar52 + auVar59[0xb];
      bVar106 = bVar53 + auVar59[0xc];
      bVar107 = bVar54 + auVar59[0xd];
      bVar108 = bVar55 + auVar59[0xe];
      bVar109 = bVar56 + auVar59[0xf];
      bVar10 = auVar57[0];
      bVar11 = auVar57[1];
      bVar12 = auVar57[2];
      bVar13 = auVar57[3];
      bVar14 = auVar57[4];
      bVar15 = auVar57[5];
      bVar16 = auVar57[6];
      bVar17 = auVar57[7];
      bVar18 = auVar57[8];
      bVar19 = auVar57[9];
      bVar20 = auVar57[10];
      bVar21 = auVar57[0xb];
      bVar22 = auVar57[0xc];
      bVar23 = auVar57[0xd];
      bVar24 = auVar57[0xe];
      bVar25 = auVar57[0xf];
      pbVar2 = pbVar60 + uVar69;
      *pbVar2 = -((byte)((bVar10 < bVar78) * bVar10 | (bVar10 >= bVar78) * bVar78) == bVar78) &
                bVar62 ^ *pbVar1;
      pbVar2[1] = -((byte)((bVar11 < bVar79) * bVar11 | (bVar11 >= bVar79) * bVar79) == bVar79) &
                  bVar64 ^ bVar26;
      pbVar2[2] = -((byte)((bVar12 < bVar80) * bVar12 | (bVar12 >= bVar80) * bVar80) == bVar80) &
                  bVar67 ^ bVar27;
      pbVar2[3] = -((byte)((bVar13 < bVar81) * bVar13 | (bVar13 >= bVar81) * bVar81) == bVar81) &
                  bVar5 ^ bVar28;
      pbVar2[4] = -((byte)((bVar14 < bVar82) * bVar14 | (bVar14 >= bVar82) * bVar82) == bVar82) &
                  bVar6 ^ bVar29;
      pbVar2[5] = -((byte)((bVar15 < bVar83) * bVar15 | (bVar15 >= bVar83) * bVar83) == bVar83) &
                  bVar7 ^ bVar30;
      pbVar2[6] = -((byte)((bVar16 < bVar84) * bVar16 | (bVar16 >= bVar84) * bVar84) == bVar84) &
                  bVar8 ^ bVar31;
      pbVar2[7] = -((byte)((bVar17 < bVar85) * bVar17 | (bVar17 >= bVar85) * bVar85) == bVar85) &
                  bVar9 ^ bVar32;
      pbVar2[8] = -((byte)((bVar18 < bVar86) * bVar18 | (bVar18 >= bVar86) * bVar86) == bVar86) &
                  bVar70 ^ bVar33;
      pbVar2[9] = -((byte)((bVar19 < bVar87) * bVar19 | (bVar19 >= bVar87) * bVar87) == bVar87) &
                  bVar71 ^ bVar34;
      pbVar2[10] = -((byte)((bVar20 < bVar88) * bVar20 | (bVar20 >= bVar88) * bVar88) == bVar88) &
                   bVar72 ^ bVar35;
      pbVar2[0xb] = -((byte)((bVar21 < bVar89) * bVar21 | (bVar21 >= bVar89) * bVar89) == bVar89) &
                    bVar73 ^ bVar36;
      pbVar2[0xc] = -((byte)((bVar22 < bVar90) * bVar22 | (bVar22 >= bVar90) * bVar90) == bVar90) &
                    bVar74 ^ bVar37;
      pbVar2[0xd] = -((byte)((bVar23 < bVar91) * bVar23 | (bVar23 >= bVar91) * bVar91) == bVar91) &
                    bVar75 ^ bVar38;
      pbVar2[0xe] = -((byte)((bVar24 < bVar92) * bVar24 | (bVar24 >= bVar92) * bVar92) == bVar92) &
                    bVar76 ^ bVar39;
      pbVar2[0xf] = -((byte)((bVar25 < bVar93) * bVar25 | (bVar25 >= bVar93) * bVar93) == bVar93) &
                    bVar77 ^ bVar40;
      pbVar1 = pbVar60 + uVar69 + 0x10;
      *pbVar1 = -((byte)((bVar10 < bVar94) * bVar10 | (bVar10 >= bVar94) * bVar94) == bVar94) &
                bVar62 ^ bVar41;
      pbVar1[1] = -((byte)((bVar11 < bVar95) * bVar11 | (bVar11 >= bVar95) * bVar95) == bVar95) &
                  bVar64 ^ bVar42;
      pbVar1[2] = -((byte)((bVar12 < bVar96) * bVar12 | (bVar12 >= bVar96) * bVar96) == bVar96) &
                  bVar67 ^ bVar43;
      pbVar1[3] = -((byte)((bVar13 < bVar97) * bVar13 | (bVar13 >= bVar97) * bVar97) == bVar97) &
                  bVar5 ^ bVar44;
      pbVar1[4] = -((byte)((bVar14 < bVar98) * bVar14 | (bVar14 >= bVar98) * bVar98) == bVar98) &
                  bVar6 ^ bVar45;
      pbVar1[5] = -((byte)((bVar15 < bVar99) * bVar15 | (bVar15 >= bVar99) * bVar99) == bVar99) &
                  bVar7 ^ bVar46;
      pbVar1[6] = -((byte)((bVar16 < bVar100) * bVar16 | (bVar16 >= bVar100) * bVar100) == bVar100)
                  & bVar8 ^ bVar47;
      pbVar1[7] = -((byte)((bVar17 < bVar101) * bVar17 | (bVar17 >= bVar101) * bVar101) == bVar101)
                  & bVar9 ^ bVar48;
      pbVar1[8] = -((byte)((bVar18 < bVar102) * bVar18 | (bVar18 >= bVar102) * bVar102) == bVar102)
                  & bVar70 ^ bVar49;
      pbVar1[9] = -((byte)((bVar19 < bVar103) * bVar19 | (bVar19 >= bVar103) * bVar103) == bVar103)
                  & bVar71 ^ bVar50;
      pbVar1[10] = -((byte)((bVar20 < bVar104) * bVar20 | (bVar20 >= bVar104) * bVar104) == bVar104)
                   & bVar72 ^ bVar51;
      pbVar1[0xb] = -((byte)((bVar21 < bVar105) * bVar21 | (bVar21 >= bVar105) * bVar105) == bVar105
                     ) & bVar73 ^ bVar52;
      pbVar1[0xc] = -((byte)((bVar22 < bVar106) * bVar22 | (bVar22 >= bVar106) * bVar106) == bVar106
                     ) & bVar74 ^ bVar53;
      pbVar1[0xd] = -((byte)((bVar23 < bVar107) * bVar23 | (bVar23 >= bVar107) * bVar107) == bVar107
                     ) & bVar75 ^ bVar54;
      pbVar1[0xe] = -((byte)((bVar24 < bVar108) * bVar24 | (bVar24 >= bVar108) * bVar108) == bVar108
                     ) & bVar76 ^ bVar55;
      pbVar1[0xf] = -((byte)((bVar25 < bVar109) * bVar25 | (bVar25 >= bVar109) * bVar109) == bVar109
                     ) & bVar77 ^ bVar56;
      uVar69 = uVar69 + 0x20;
    } while (uVar61 != uVar69);
    if (extraout_RDX == uVar61) goto LAB_145b7986d;
    uVar69 = uVar61;
    if ((extraout_RDX & 0x18) != 0) goto LAB_145b797ce;
  }
  do {
    pbVar60[uVar61] = ((byte)(pbVar60[uVar61] + 0x9f) < 0x1a) << 5 ^ pbVar60[uVar61];
    uVar61 = uVar61 + 1;
LAB_145b79868:
  } while (extraout_RDX != uVar61);
LAB_145b7986d:
  pbVar66 = pbVar66 + extraout_RDX;
  local_78 = 0;
  lVar65 = 0;
  do {
    bVar62 = *pbVar60;
    if ((char)bVar62 < '\0') {
      uVar63 = bVar62 & 0x1f;
      pbVar1 = pbVar60 + 1;
      if (bVar62 < 0xe0) {
        pbVar60 = pbVar60 + 2;
        uVar68 = uVar63 << 6 | *pbVar1 & 0x3f;
        goto joined_r0x000145b79932;
      }
      uVar68 = pbVar60[2] & 0x3f | (*pbVar1 & 0x3f) << 6;
      if (0xef < bVar62) {
        pbVar1 = pbVar60 + 3;
        pbVar60 = pbVar60 + 4;
        uVar68 = *pbVar1 & 0x3f | uVar68 << 6 | (bVar62 & 7) << 0x12;
        goto joined_r0x000145b79932;
      }
      pbVar60 = pbVar60 + 3;
      uVar68 = uVar68 | uVar63 << 0xc;
      if (9 < uVar68 - 0x30) goto LAB_145b79970;
LAB_145b79982:
      uVar69 = 1;
      if ((0x7f < uVar68) && (uVar69 = 2, 0x7ff < uVar68)) {
        uVar69 = 4 - (ulong)(uVar68 < 0x10000);
      }
      if ((ulong)-lVar65 < uVar69) {
        func_0x000145e9e020();
        if (0x7f < uVar68) goto LAB_145b799ce;
LAB_145b798a0:
        *(byte *)(lVar65 + 1) = (byte)uVar68;
      }
      else {
        if (uVar68 < 0x80) goto LAB_145b798a0;
LAB_145b799ce:
        bVar62 = (byte)uVar68 & 0x3f | 0x80;
        bVar64 = (byte)(uVar68 >> 6);
        if (uVar68 < 0x800) {
          *(byte *)(lVar65 + 1) = bVar64 | 0xc0;
          *(byte *)(lVar65 + 2) = bVar62;
        }
        else {
          bVar64 = bVar64 & 0x3f | 0x80;
          bVar67 = (byte)(uVar68 >> 0xc);
          if (uVar68 < 0x10000) {
            *(byte *)(lVar65 + 1) = bVar67 | 0xe0;
            *(byte *)(lVar65 + 2) = bVar64;
            *(byte *)(lVar65 + 3) = bVar62;
          }
          else {
            *(byte *)(lVar65 + 1) = (byte)(uVar68 >> 0x12) | 0xf0;
            *(byte *)(lVar65 + 2) = bVar67 & 0x3f | 0x80;
            *(byte *)(lVar65 + 3) = bVar64;
            *(byte *)(lVar65 + 4) = bVar62;
          }
        }
      }
      lVar65 = lVar65 + uVar69;
      local_78 = lVar65;
    }
    else {
      pbVar60 = pbVar60 + 1;
      uVar68 = (uint)bVar62;
joined_r0x000145b79932:
      if (uVar68 - 0x30 < 10) goto LAB_145b79982;
LAB_145b79970:
      if ((uVar68 & 0xffffffdf) - 0x41 < 0x1a) goto LAB_145b79982;
    }
    if (pbVar60 == pbVar66) {
      param_4[2] = local_78;
      *param_4 = 0;
      param_4[1] = 1;
      func_0x0001400021d0();
      return param_4;
    }
  } while( true );
}
