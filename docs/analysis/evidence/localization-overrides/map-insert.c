/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined1  [16]
entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 *param_4,undefined8 param_5,
     undefined8 param_6)

{
  long *plVar1;
  undefined1 (*pauVar2) [16];
  ulong uVar3;
  long lVar4;
  uint uVar5;
  bool bVar6;
  ushort uVar7;
  int iVar8;
  uint uVar9;
  ulong uVar10;
  ulong uVar11;
  long lVar12;
  undefined8 uVar13;
  ulong uVar14;
  long lVar15;
  uint uVar16;
  byte bVar17;
  undefined1 auVar18 [16];
  undefined1 auVar19 [16];
  long lVar20;
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
  char cVar35;
  char cVar36;
  undefined1 in_XMM7_Ba;
  char cVar37;
  undefined1 in_XMM7_Bb;
  char cVar38;
  undefined1 in_XMM7_Bc;
  char cVar39;
  undefined1 in_XMM7_Bd;
  char cVar40;
  undefined1 in_XMM7_Be;
  char cVar41;
  undefined1 in_XMM7_Bf;
  char cVar42;
  undefined1 in_XMM7_Bg;
  char cVar43;
  undefined1 in_XMM7_Bh;
  char cVar44;
  undefined1 in_XMM7_Bi;
  char cVar45;
  undefined1 in_XMM7_Bj;
  char cVar46;
  undefined1 in_XMM7_Bk;
  char cVar47;
  undefined1 in_XMM7_Bl;
  char cVar48;
  undefined1 in_XMM7_Bm;
  char cVar49;
  undefined1 in_XMM7_Bn;
  char cVar50;
  undefined1 in_XMM7_Bo;
  char cVar51;
  undefined1 in_XMM7_Bp;
  undefined1 auVar52 [16];
  ulong local_a0;

  uVar10 = func_0x000140017260();
  if (param_4[2] == 0) {
    func_0x000145d76fb0();
  }
  pauVar2 = (undefined1 (*) [16])*param_4;
  uVar3 = param_4[1];
  uVar14 = uVar10 >> 0x39;
  bVar17 = (byte)(uVar10 >> 0x39);
  auVar18 = ZEXT216(CONCAT11(bVar17,bVar17));
  auVar18 = pshuflw(auVar18,auVar18,0);
  cVar21 = auVar18[0];
  cVar22 = auVar18[1];
  cVar23 = auVar18[2];
  cVar24 = auVar18[3];
  cVar25 = auVar18[4];
  cVar26 = auVar18[5];
  cVar27 = auVar18[6];
  cVar28 = auVar18[7];
  lVar4 = param_3[2];
  bVar6 = false;
  iVar8 = -(uint)(CONCAT13(in_XMM7_Bd,CONCAT12(in_XMM7_Bc,CONCAT11(in_XMM7_Bb,in_XMM7_Ba))) ==
                 CONCAT13(in_XMM7_Bd,CONCAT12(in_XMM7_Bc,CONCAT11(in_XMM7_Bb,in_XMM7_Ba))));
  cVar37 = (char)iVar8;
  cVar38 = (char)((uint)iVar8 >> 8);
  cVar39 = (char)((uint)iVar8 >> 0x10);
  cVar40 = (char)((uint)iVar8 >> 0x18);
  iVar8 = -(uint)(CONCAT13(in_XMM7_Bh,CONCAT12(in_XMM7_Bg,CONCAT11(in_XMM7_Bf,in_XMM7_Be))) ==
                 CONCAT13(in_XMM7_Bh,CONCAT12(in_XMM7_Bg,CONCAT11(in_XMM7_Bf,in_XMM7_Be))));
  cVar41 = (char)iVar8;
  cVar42 = (char)((uint)iVar8 >> 8);
  cVar43 = (char)((uint)iVar8 >> 0x10);
  cVar44 = (char)((uint)iVar8 >> 0x18);
  iVar8 = -(uint)(CONCAT13(in_XMM7_Bl,CONCAT12(in_XMM7_Bk,CONCAT11(in_XMM7_Bj,in_XMM7_Bi))) ==
                 CONCAT13(in_XMM7_Bl,CONCAT12(in_XMM7_Bk,CONCAT11(in_XMM7_Bj,in_XMM7_Bi))));
  cVar45 = (char)iVar8;
  cVar46 = (char)((uint)iVar8 >> 8);
  cVar47 = (char)((uint)iVar8 >> 0x10);
  cVar48 = (char)((uint)iVar8 >> 0x18);
  iVar8 = -(uint)(CONCAT13(in_XMM7_Bp,CONCAT12(in_XMM7_Bo,CONCAT11(in_XMM7_Bn,in_XMM7_Bm))) ==
                 CONCAT13(in_XMM7_Bp,CONCAT12(in_XMM7_Bo,CONCAT11(in_XMM7_Bn,in_XMM7_Bm))));
  cVar49 = (char)iVar8;
  cVar50 = (char)((uint)iVar8 >> 8);
  cVar51 = (char)((uint)iVar8 >> 0x10);
  bVar17 = (byte)((uint)iVar8 >> 0x18);
  lVar12 = 0;
  cVar29 = cVar21;
  cVar30 = cVar22;
  cVar31 = cVar23;
  cVar32 = cVar24;
  cVar33 = cVar25;
  cVar34 = cVar26;
  cVar35 = cVar27;
  cVar36 = cVar28;
  do {
    uVar10 = uVar10 & uVar3;
    auVar18 = *(undefined1 (*) [16])(*pauVar2 + uVar10);
    auVar19[0] = -(auVar18[0] == cVar21);
    auVar19[1] = -(auVar18[1] == cVar22);
    auVar19[2] = -(auVar18[2] == cVar23);
    auVar19[3] = -(auVar18[3] == cVar24);
    auVar19[4] = -(auVar18[4] == cVar25);
    auVar19[5] = -(auVar18[5] == cVar26);
    auVar19[6] = -(auVar18[6] == cVar27);
    auVar19[7] = -(auVar18[7] == cVar28);
    auVar19[8] = -(auVar18[8] == cVar29);
    auVar19[9] = -(auVar18[9] == cVar30);
    auVar19[10] = -(auVar18[10] == cVar31);
    auVar19[0xb] = -(auVar18[0xb] == cVar32);
    auVar19[0xc] = -(auVar18[0xc] == cVar33);
    auVar19[0xd] = -(auVar18[0xd] == cVar34);
    auVar19[0xe] = -(auVar18[0xe] == cVar35);
    auVar19[0xf] = -(auVar18[0xf] == cVar36);
    uVar7 = (ushort)(SUB161(auVar19 >> 7,0) & 1) | (ushort)(SUB161(auVar19 >> 0xf,0) & 1) << 1 |
            (ushort)(SUB161(auVar19 >> 0x17,0) & 1) << 2 |
            (ushort)(SUB161(auVar19 >> 0x1f,0) & 1) << 3 |
            (ushort)(SUB161(auVar19 >> 0x27,0) & 1) << 4 |
            (ushort)(SUB161(auVar19 >> 0x2f,0) & 1) << 5 |
            (ushort)(SUB161(auVar19 >> 0x37,0) & 1) << 6 |
            (ushort)(SUB161(auVar19 >> 0x3f,0) & 1) << 7 |
            (ushort)(SUB161(auVar19 >> 0x47,0) & 1) << 8 |
            (ushort)(SUB161(auVar19 >> 0x4f,0) & 1) << 9 |
            (ushort)(SUB161(auVar19 >> 0x57,0) & 1) << 10 |
            (ushort)(SUB161(auVar19 >> 0x5f,0) & 1) << 0xb |
            (ushort)(SUB161(auVar19 >> 0x67,0) & 1) << 0xc |
            (ushort)(SUB161(auVar19 >> 0x6f,0) & 1) << 0xd |
            (ushort)(SUB161(auVar19 >> 0x77,0) & 1) << 0xe | (ushort)(auVar19[0xf] >> 7) << 0xf;
    uVar16 = (uint)uVar7;
    while (uVar7 != 0) {
      uVar9 = 0;
      for (uVar5 = uVar16; (uVar5 & 1) == 0; uVar5 = uVar5 >> 1 | 0x80000000) {
        uVar9 = uVar9 + 1;
      }
      uVar11 = uVar9 + uVar10 & uVar3;
      if (lVar4 == *(long *)((long)pauVar2 + uVar11 * -0x28 + -0x18)) {
        lVar15 = uVar11 * -0x28 + (long)pauVar2;
        iVar8 = func_0x000145bf2947();
        if (iVar8 == 0) {
          uVar13 = *(undefined8 *)(lVar15 + -0x10);
          uVar10 = *(ulong *)(lVar15 + -8);
          *(undefined8 *)(lVar15 + -0x10) = param_5;
          *(undefined8 *)(lVar15 + -8) = param_6;
          if (*param_3 != 0) {
            func_0x0001400021d0();
          }
          goto LAB_14599a8f9;
        }
      }
      uVar7 = (ushort)(uVar16 - 1) & (ushort)uVar16;
      uVar16 = CONCAT22((short)(uVar16 - 1 >> 0x10),uVar7);
    }
    if (bVar6) goto LAB_14599a81e;
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
            (ushort)(SUB161(auVar18 >> 0x77,0) & 1) << 0xe |
            (ushort)(byte)(auVar18[0xf] >> 7) << 0xf;
    if (uVar7 == 0) {
      bVar6 = false;
    }
    else {
      uVar16 = 0;
      for (uVar9 = (uint)uVar7; (uVar9 & 1) == 0; uVar9 = uVar9 >> 1 | 0x80000000) {
        uVar16 = uVar16 + 1;
      }
      local_a0 = uVar16 + uVar10 & uVar3;
LAB_14599a81e:
      auVar52[0] = -(auVar18[0] == cVar37);
      auVar52[1] = -(auVar18[1] == cVar38);
      auVar52[2] = -(auVar18[2] == cVar39);
      auVar52[3] = -(auVar18[3] == cVar40);
      auVar52[4] = -(auVar18[4] == cVar41);
      auVar52[5] = -(auVar18[5] == cVar42);
      auVar52[6] = -(auVar18[6] == cVar43);
      auVar52[7] = -(auVar18[7] == cVar44);
      auVar52[8] = -(auVar18[8] == cVar45);
      auVar52[9] = -(auVar18[9] == cVar46);
      auVar52[10] = -(auVar18[10] == cVar47);
      auVar52[0xb] = -(auVar18[0xb] == cVar48);
      auVar52[0xc] = -(auVar18[0xc] == cVar49);
      auVar52[0xd] = -(auVar18[0xd] == cVar50);
      auVar52[0xe] = -(auVar18[0xe] == cVar51);
      auVar52[0xf] = -(auVar18[0xf] == bVar17);
      if ((((((((((((((((SUB161(auVar52 >> 7,0) & 1) != 0 || (SUB161(auVar52 >> 0xf,0) & 1) != 0) ||
                      (SUB161(auVar52 >> 0x17,0) & 1) != 0) || (SUB161(auVar52 >> 0x1f,0) & 1) != 0)
                    || (SUB161(auVar52 >> 0x27,0) & 1) != 0) || (SUB161(auVar52 >> 0x2f,0) & 1) != 0
                   ) || (SUB161(auVar52 >> 0x37,0) & 1) != 0) ||
                 (SUB161(auVar52 >> 0x3f,0) & 1) != 0) || (SUB161(auVar52 >> 0x47,0) & 1) != 0) ||
               (SUB161(auVar52 >> 0x4f,0) & 1) != 0) || (SUB161(auVar52 >> 0x57,0) & 1) != 0) ||
             (SUB161(auVar52 >> 0x5f,0) & 1) != 0) || (SUB161(auVar52 >> 0x67,0) & 1) != 0) ||
           (SUB161(auVar52 >> 0x6f,0) & 1) != 0) || (SUB161(auVar52 >> 0x77,0) & 1) != 0) ||
          auVar52[0xf] < '\0') {
        bVar17 = (*pauVar2)[local_a0];
        if (-1 < (char)bVar17) {
          auVar18 = *pauVar2;
          uVar16 = 0;
          for (uVar9 = (uint)(ushort)((ushort)(SUB161(auVar18 >> 7,0) & 1) |
                                      (ushort)(SUB161(auVar18 >> 0xf,0) & 1) << 1 |
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
                                      (ushort)(SUB161(auVar18 >> 0x77,0) & 1) << 0xe |
                                     (ushort)(byte)(auVar18[0xf] >> 7) << 0xf); (uVar9 & 1) == 0;
              uVar9 = uVar9 >> 1 | 0x80000000) {
            uVar16 = uVar16 + 1;
          }
          local_a0 = (ulong)uVar16;
          bVar17 = (*pauVar2)[local_a0];
        }
        lVar4 = param_3[2];
        lVar12 = *param_3;
        lVar15 = param_3[1];
        (*pauVar2)[local_a0] = (char)uVar14;
        pauVar2[1][local_a0 - 0x10 & uVar3] = (char)uVar14;
        lVar20 = param_4[3] - _DAT_145d975a8;
        param_4[2] = param_4[2] - (ulong)(bVar17 & 1);
        param_4[3] = lVar20;
        *(long *)((long)pauVar2 + local_a0 * -0x28 + -0x18) = lVar4;
        plVar1 = (long *)((long)pauVar2 + local_a0 * -0x28 + -0x28);
        *plVar1 = lVar12;
        plVar1[1] = lVar15;
        *(undefined8 *)((long)pauVar2 + local_a0 * -0x28 + -0x10) = param_5;
        *(undefined8 *)((long)pauVar2 + local_a0 * -0x28 + -8) = param_6;
        uVar13 = 0;
LAB_14599a8f9:
        auVar18._8_8_ = uVar10;
        auVar18._0_8_ = uVar13;
        return auVar18;
      }
      bVar6 = true;
    }
    uVar10 = uVar10 + lVar12 + 0x10;
    lVar12 = lVar12 + 0x10;
  } while( true );
}
