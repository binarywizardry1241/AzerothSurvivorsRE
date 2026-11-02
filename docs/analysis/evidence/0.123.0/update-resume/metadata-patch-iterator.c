
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

long * entry(undefined8 param_1,undefined8 param_2,long *param_3,long *param_4)

{
  undefined1 auVar1 [16];
  ulong uVar2;
  code *pcVar3;
  long lVar4;
  long lVar5;
  long lVar6;
  long lVar7;
  long lVar8;
  long lVar9;
  int *piVar10;
  ulong uVar11;
  int *piVar12;
  long *plVar13;
  long lVar14;
  long lVar15;
  byte bVar16;
  byte bVar17;
  byte bVar18;
  byte bVar19;
  byte bVar20;
  byte bVar21;
  byte bVar22;
  byte bVar23;
  byte bVar25;
  byte bVar26;
  byte bVar27;
  byte bVar28;
  byte bVar29;
  byte bVar30;
  byte bVar31;
  byte bVar32;
  undefined1 auVar24 [16];
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
  undefined1 auVar49 [16];
  char cVar50;
  char cVar51;
  char cVar52;
  char cVar53;
  char cVar54;
  char cVar55;
  char cVar56;
  undefined8 in_XMM6_Qa;
  char cVar57;
  byte bVar58;
  byte bVar59;
  byte bVar60;
  byte bVar61;
  byte bVar62;
  byte bVar63;
  byte bVar64;
  undefined8 in_XMM7_Qa;
  byte bVar65;
  undefined1 auVar66 [16];
  char cVar67;
  char cVar68;
  char cVar69;
  char cVar70;
  char cVar71;
  char cVar72;
  char cVar73;
  char cVar74;
  char cVar75;
  char cVar76;
  char cVar77;
  char cVar78;
  char cVar79;
  char cVar80;
  char cVar81;
  char cVar82;
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
  undefined1 auVar99 [16];
  undefined1 auVar100 [16];
  undefined1 auVar101 [16];
  long local_1f8;
  long local_1f0;
  int *local_1e8;
  long local_1e0;
  long lStack_1d8;
  long local_1d0;
  long lStack_1c8;
  undefined1 local_1c0 [16];
  long local_1b0;
  long local_118 [3];
  long lStack_100;
  long local_f8;
  long lStack_f0;
  long *local_e0;
  undefined8 local_d8;
  long local_d0;
  undefined1 (*local_c8) [16];
  int *local_c0;
  int *local_b8;
  undefined8 local_b0;
  undefined8 local_a8;
  undefined8 local_98;
  
  auVar101._8_8_ = local_1e8;
  auVar101._0_8_ = local_1f0;
  local_b0 = 0xfffffffffffffffe;
  local_b8 = (int *)param_3[1];
  local_e0 = param_4;
  if ((int *)*param_3 != local_b8) {
    local_c8 = (undefined1 (*) [16])param_3[4];
    plVar13 = local_118;
    lVar15 = param_3[2];
    uVar2 = param_3[3];
    lVar14 = *param_3;
    auVar66 = _DAT_1461b8120;
    auVar99 = _DAT_1461b8070;
    cVar50 = DAT_1461b8100;
    cVar51 = cRam00000001461b8101;
    cVar52 = cRam00000001461b8102;
    cVar53 = cRam00000001461b8103;
    cVar54 = cRam00000001461b8104;
    cVar55 = cRam00000001461b8105;
    cVar56 = cRam00000001461b8106;
    cVar57 = cRam00000001461b8107;
    bVar58 = DAT_1461b8110;
    bVar59 = bRam00000001461b8111;
    bVar60 = bRam00000001461b8112;
    bVar61 = bRam00000001461b8113;
    bVar62 = bRam00000001461b8114;
    bVar63 = bRam00000001461b8115;
    bVar64 = bRam00000001461b8116;
    bVar65 = bRam00000001461b8117;
    cVar67 = DAT_1461b8050;
    cVar68 = cRam00000001461b8051;
    cVar69 = cRam00000001461b8052;
    cVar70 = cRam00000001461b8053;
    cVar71 = cRam00000001461b8054;
    cVar72 = cRam00000001461b8055;
    cVar73 = cRam00000001461b8056;
    cVar74 = cRam00000001461b8057;
    cVar75 = cRam00000001461b8058;
    cVar76 = cRam00000001461b8059;
    cVar77 = cRam00000001461b805a;
    cVar78 = cRam00000001461b805b;
    cVar79 = cRam00000001461b805c;
    cVar80 = cRam00000001461b805d;
    cVar81 = cRam00000001461b805e;
    cVar82 = cRam00000001461b805f;
    bVar83 = DAT_1461b8060;
    bVar84 = bRam00000001461b8061;
    bVar85 = bRam00000001461b8062;
    bVar86 = bRam00000001461b8063;
    bVar87 = bRam00000001461b8064;
    bVar88 = bRam00000001461b8065;
    bVar89 = bRam00000001461b8066;
    bVar90 = bRam00000001461b8067;
    bVar91 = bRam00000001461b8068;
    bVar92 = bRam00000001461b8069;
    bVar93 = bRam00000001461b806a;
    bVar94 = bRam00000001461b806b;
    bVar95 = bRam00000001461b806c;
    bVar96 = bRam00000001461b806d;
    bVar97 = bRam00000001461b806e;
    bVar98 = bRam00000001461b806f;
    local_a8 = in_XMM6_Qa;
    local_98 = in_XMM7_Qa;
    do {
      *param_3 = lVar14 + 0x20;
      while( true ) {
        auVar100 = func_0x000145fe08c0();
        uVar11 = auVar100._8_8_;
        if (auVar100._0_8_ != 1) break;
        if ((uVar11 < uVar2) && (*(char *)(lVar15 + uVar11) == '/')) {
          if ((uVar11 + 1 < uVar2) && (*(char *)(lVar15 + uVar11 + 1) < -0x40)) {
            func_0x0001461adf70();
                    /* WARNING: Does not return */
            pcVar3 = (code *)invalidInstructionException();
            (*pcVar3)();
          }
          break;
        }
        if (uVar2 < uVar11) break;
      }
      func_0x00014005d970();
      if (local_1f8 == -1) goto LAB_1400af1d0;
      plVar13[6] = local_1b0;
      *(undefined1 (*) [16])(plVar13 + 4) = local_1c0;
      plVar13[2] = local_1d0;
      plVar13[3] = lStack_1c8;
      *plVar13 = local_1e0;
      plVar13[1] = lStack_1d8;
      piVar10 = local_c0;
      if ((long)local_1e8 < 0) {
LAB_1400af0aa:
        local_c0 = piVar10;
        func_0x0001461add5b();
                    /* WARNING: Does not return */
        pcVar3 = (code *)invalidInstructionException();
        (*pcVar3)();
      }
      if (local_1e8 == (int *)0x0) {
        local_c0 = (int *)0x1;
LAB_1400af0d8:
        local_b8 = local_1e8;
        func_0x000145fd7da0();
        auVar101 = func_0x000145fd86c0();
        if (local_b8 != (int *)0x0) {
          func_0x0001400021d0();
        }
        if (local_1f8 != 0) {
          func_0x0001400021d0();
        }
        if (local_118[0] != 0) {
          func_0x0001400021d0();
        }
        if (lStack_f0 != 0) {
          lVar15 = local_f8 + 8;
          lVar14 = lStack_f0;
          do {
            if (*(long *)(lVar15 + -8) != 0) {
              func_0x0001400021d0();
            }
            lVar15 = lVar15 + 0x20;
            lVar14 = lVar14 + -1;
          } while (lVar14 != 0);
        }
        if (lStack_100 != 0) {
          func_0x0001400021d0();
        }
LAB_1400af1d0:
        local_c0 = *(int **)*local_c8;
joined_r0x0001400af2b4:
        if (local_c0 != (int *)0x0) {
          local_d8 = auVar101._8_8_;
          local_d0 = auVar101._0_8_;
          local_b8 = *(int **)(*local_c8 + 8);
          if (*(code **)local_b8 != (code *)0x0) {
            (**(code **)local_b8)();
            auVar101._8_8_ = local_d8;
            auVar101._0_8_ = local_d0;
          }
          local_d8 = auVar101._8_8_;
          local_d0 = auVar101._0_8_;
          if (*(long *)((long)local_b8 + 8) != 0) {
            func_0x0001400021d0();
          }
        }
        *local_c8 = auVar101;
        break;
      }
      local_d0 = lVar14 + 0x20;
      func_0x000140002200();
      local_c0 = (int *)func_0x0001400021c0();
      piVar10 = local_1e8;
      if (local_c0 == (int *)0x0) goto LAB_1400af0aa;
      func_0x00014600504b();
      if (local_1e8 < (int *)0x8) {
        piVar10 = (int *)0x0;
LAB_1400aefa0:
        do {
          *(byte *)((long)local_c0 + (long)piVar10) =
               ((byte)(*(byte *)((long)local_c0 + (long)piVar10) + 0xbf) < 0x1a) << 5 |
               *(byte *)((long)local_c0 + (long)piVar10);
          piVar12 = (int *)((long)piVar10 + 1);
joined_r0x0001400aef93:
          piVar10 = piVar12;
        } while (piVar10 != local_1e8);
      }
      else {
        if (local_1e8 < (int *)0x20) {
          piVar10 = (int *)0x0;
LAB_1400aef48:
          do {
            uVar11 = *(ulong *)((long)local_c0 + (long)piVar10);
            bVar16 = (char)uVar11 + cVar50;
            bVar17 = (char)(uVar11 >> 8) + cVar51;
            bVar18 = (char)(uVar11 >> 0x10) + cVar52;
            bVar19 = (char)(uVar11 >> 0x18) + cVar53;
            bVar20 = (char)(uVar11 >> 0x20) + cVar54;
            bVar21 = (char)(uVar11 >> 0x28) + cVar55;
            bVar22 = (char)(uVar11 >> 0x30) + cVar56;
            bVar23 = (char)(uVar11 >> 0x38) + cVar57;
            *(ulong *)((long)local_c0 + (long)piVar10) =
                 ~CONCAT17(-((byte)((bVar23 < bVar65) * bVar65 | (bVar23 >= bVar65) * bVar23) ==
                            bVar23),CONCAT16(-((byte)((bVar22 < bVar64) * bVar64 |
                                                     (bVar22 >= bVar64) * bVar22) == bVar22),
                                             CONCAT15(-((byte)((bVar21 < bVar63) * bVar63 |
                                                              (bVar21 >= bVar63) * bVar21) == bVar21
                                                       ),CONCAT14(-((byte)((bVar20 < bVar62) *
                                                                           bVar62 | (bVar20 >=
                                                                                    bVar62) * bVar20
                                                                          ) == bVar20),
                                                                  CONCAT13(-((byte)((bVar19 < bVar61
                                                                                    ) * bVar61 |
                                                                                   (bVar19 >= bVar61
                                                                                   ) * bVar19) ==
                                                                            bVar19),CONCAT12(-((byte
                                                  )((bVar18 < bVar60) * bVar60 |
                                                   (bVar18 >= bVar60) * bVar18) == bVar18),
                                                  CONCAT11(-((byte)((bVar17 < bVar59) * bVar59 |
                                                                   (bVar17 >= bVar59) * bVar17) ==
                                                            bVar17),-((byte)((bVar16 < bVar58) *
                                                                             bVar58 | (bVar16 >=
                                                                                      bVar58) * 
                                                  bVar16) == bVar16)))))))) & auVar66._0_8_ | uVar11
            ;
            piVar10 = piVar10 + 2;
            piVar12 = (int *)((ulong)local_1e8 & 0x7ffffffffffffff8);
            if ((int *)((ulong)local_1e8 & 0x7ffffffffffffff8) == piVar10)
            goto joined_r0x0001400aef93;
          } while( true );
        }
        piVar10 = (int *)((ulong)local_1e8 & 0x7fffffffffffffe0);
        piVar12 = (int *)0x0;
        do {
          auVar100 = *(undefined1 (*) [16])((long)local_c0 + (long)piVar12);
          auVar1 = *(undefined1 (*) [16])((long)(local_c0 + 4) + (long)piVar12);
          bVar16 = auVar100[0] + cVar67;
          bVar17 = auVar100[1] + cVar68;
          bVar18 = auVar100[2] + cVar69;
          bVar19 = auVar100[3] + cVar70;
          bVar20 = auVar100[4] + cVar71;
          bVar21 = auVar100[5] + cVar72;
          bVar22 = auVar100[6] + cVar73;
          bVar23 = auVar100[7] + cVar74;
          bVar25 = auVar100[8] + cVar75;
          bVar26 = auVar100[9] + cVar76;
          bVar27 = auVar100[10] + cVar77;
          bVar28 = auVar100[0xb] + cVar78;
          bVar29 = auVar100[0xc] + cVar79;
          bVar30 = auVar100[0xd] + cVar80;
          bVar31 = auVar100[0xe] + cVar81;
          bVar32 = auVar100[0xf] + cVar82;
          bVar33 = auVar1[0] + cVar67;
          bVar34 = auVar1[1] + cVar68;
          bVar35 = auVar1[2] + cVar69;
          bVar36 = auVar1[3] + cVar70;
          bVar37 = auVar1[4] + cVar71;
          bVar38 = auVar1[5] + cVar72;
          bVar39 = auVar1[6] + cVar73;
          bVar40 = auVar1[7] + cVar74;
          bVar41 = auVar1[8] + cVar75;
          bVar42 = auVar1[9] + cVar76;
          bVar43 = auVar1[10] + cVar77;
          bVar44 = auVar1[0xb] + cVar78;
          bVar45 = auVar1[0xc] + cVar79;
          bVar46 = auVar1[0xd] + cVar80;
          bVar47 = auVar1[0xe] + cVar81;
          bVar48 = auVar1[0xf] + cVar82;
          auVar49[0] = -((byte)((bVar83 < bVar16) * bVar83 | (bVar83 >= bVar16) * bVar16) == bVar16)
          ;
          auVar49[1] = -((byte)((bVar84 < bVar17) * bVar84 | (bVar84 >= bVar17) * bVar17) == bVar17)
          ;
          auVar49[2] = -((byte)((bVar85 < bVar18) * bVar85 | (bVar85 >= bVar18) * bVar18) == bVar18)
          ;
          auVar49[3] = -((byte)((bVar86 < bVar19) * bVar86 | (bVar86 >= bVar19) * bVar19) == bVar19)
          ;
          auVar49[4] = -((byte)((bVar87 < bVar20) * bVar87 | (bVar87 >= bVar20) * bVar20) == bVar20)
          ;
          auVar49[5] = -((byte)((bVar88 < bVar21) * bVar88 | (bVar88 >= bVar21) * bVar21) == bVar21)
          ;
          auVar49[6] = -((byte)((bVar89 < bVar22) * bVar89 | (bVar89 >= bVar22) * bVar22) == bVar22)
          ;
          auVar49[7] = -((byte)((bVar90 < bVar23) * bVar90 | (bVar90 >= bVar23) * bVar23) == bVar23)
          ;
          auVar49[8] = -((byte)((bVar91 < bVar25) * bVar91 | (bVar91 >= bVar25) * bVar25) == bVar25)
          ;
          auVar49[9] = -((byte)((bVar92 < bVar26) * bVar92 | (bVar92 >= bVar26) * bVar26) == bVar26)
          ;
          auVar49[10] = -((byte)((bVar93 < bVar27) * bVar93 | (bVar93 >= bVar27) * bVar27) == bVar27
                         );
          auVar49[0xb] = -((byte)((bVar94 < bVar28) * bVar94 | (bVar94 >= bVar28) * bVar28) ==
                          bVar28);
          auVar49[0xc] = -((byte)((bVar95 < bVar29) * bVar95 | (bVar95 >= bVar29) * bVar29) ==
                          bVar29);
          auVar49[0xd] = -((byte)((bVar96 < bVar30) * bVar96 | (bVar96 >= bVar30) * bVar30) ==
                          bVar30);
          auVar49[0xe] = -((byte)((bVar97 < bVar31) * bVar97 | (bVar97 >= bVar31) * bVar31) ==
                          bVar31);
          auVar49[0xf] = -((byte)((bVar98 < bVar32) * bVar98 | (bVar98 >= bVar32) * bVar32) ==
                          bVar32);
          auVar24[0] = -((byte)((bVar83 < bVar33) * bVar83 | (bVar83 >= bVar33) * bVar33) == bVar33)
          ;
          auVar24[1] = -((byte)((bVar84 < bVar34) * bVar84 | (bVar84 >= bVar34) * bVar34) == bVar34)
          ;
          auVar24[2] = -((byte)((bVar85 < bVar35) * bVar85 | (bVar85 >= bVar35) * bVar35) == bVar35)
          ;
          auVar24[3] = -((byte)((bVar86 < bVar36) * bVar86 | (bVar86 >= bVar36) * bVar36) == bVar36)
          ;
          auVar24[4] = -((byte)((bVar87 < bVar37) * bVar87 | (bVar87 >= bVar37) * bVar37) == bVar37)
          ;
          auVar24[5] = -((byte)((bVar88 < bVar38) * bVar88 | (bVar88 >= bVar38) * bVar38) == bVar38)
          ;
          auVar24[6] = -((byte)((bVar89 < bVar39) * bVar89 | (bVar89 >= bVar39) * bVar39) == bVar39)
          ;
          auVar24[7] = -((byte)((bVar90 < bVar40) * bVar90 | (bVar90 >= bVar40) * bVar40) == bVar40)
          ;
          auVar24[8] = -((byte)((bVar91 < bVar41) * bVar91 | (bVar91 >= bVar41) * bVar41) == bVar41)
          ;
          auVar24[9] = -((byte)((bVar92 < bVar42) * bVar92 | (bVar92 >= bVar42) * bVar42) == bVar42)
          ;
          auVar24[10] = -((byte)((bVar93 < bVar43) * bVar93 | (bVar93 >= bVar43) * bVar43) == bVar43
                         );
          auVar24[0xb] = -((byte)((bVar94 < bVar44) * bVar94 | (bVar94 >= bVar44) * bVar44) ==
                          bVar44);
          auVar24[0xc] = -((byte)((bVar95 < bVar45) * bVar95 | (bVar95 >= bVar45) * bVar45) ==
                          bVar45);
          auVar24[0xd] = -((byte)((bVar96 < bVar46) * bVar96 | (bVar96 >= bVar46) * bVar46) ==
                          bVar46);
          auVar24[0xe] = -((byte)((bVar97 < bVar47) * bVar97 | (bVar97 >= bVar47) * bVar47) ==
                          bVar47);
          auVar24[0xf] = -((byte)((bVar98 < bVar48) * bVar98 | (bVar98 >= bVar48) * bVar48) ==
                          bVar48);
          *(undefined1 (*) [16])((long)local_c0 + (long)piVar12) = auVar49 & auVar99 | auVar100;
          *(undefined1 (*) [16])((long)(local_c0 + 4) + (long)piVar12) = auVar24 & auVar99 | auVar1;
          piVar12 = piVar12 + 8;
        } while (piVar10 != piVar12);
        if (piVar10 != local_1e8) {
          if (((ulong)local_1e8 & 0x18) != 0) goto LAB_1400aef48;
          goto LAB_1400aefa0;
        }
      }
      if ((((local_1e8 != (int *)0xb) || ((short)local_c0[1] != 0x2d68 || *local_c0 != 0x63746170))
          || (*(int *)((long)local_c0 + 7) != 0x71706d2e)) ||
         ((9 < (byte)(*(byte *)((long)local_c0 + 6) - 0x30) &&
          (0x19 < (byte)((*(byte *)((long)local_c0 + 6) & 0xdf) + 0xbf))))) goto LAB_1400af0d8;
      lVar4 = *plVar13;
      lVar5 = plVar13[1];
      lVar6 = plVar13[2];
      lVar7 = plVar13[3];
      lVar8 = plVar13[4];
      lVar9 = plVar13[5];
      lVar14 = plVar13[6];
      func_0x0001400021d0();
      if (local_1f8 == -1) {
        local_c0 = *(int **)*local_c8;
        goto joined_r0x0001400af2b4;
      }
      if (local_1f8 != -2) {
        local_e0[9] = lVar14;
        local_e0[7] = lVar8;
        local_e0[8] = lVar9;
        local_e0[5] = lVar6;
        local_e0[6] = lVar7;
        local_e0[3] = lVar4;
        local_e0[4] = lVar5;
        *local_e0 = local_1f8;
        local_e0[1] = local_1f0;
        local_e0[2] = 0xb;
        return local_e0;
      }
      lVar14 = local_d0;
    } while ((int *)local_d0 != local_b8);
  }
  *local_e0 = -1;
  return local_e0;
}

