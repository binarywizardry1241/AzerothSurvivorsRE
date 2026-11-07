
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8
entry(undefined8 param_1,undefined8 param_2,long param_3,undefined8 param_4,long *param_5,
     uint param_6)

{
  uint *puVar1;
  char cVar2;
  long lVar3;
  long lVar4;
  long lVar5;
  ulong uVar6;
  long lVar7;
  ulong uVar8;
  long lVar9;
  undefined1 auVar10 [16];
  uint uVar11;
  uint uVar12;
  long lVar13;
  ulong uVar14;
  uint *puVar15;
  long lVar16;
  long lVar17;
  ulong uVar18;
  long lVar19;
  ulong uVar20;
  int iVar21;
  uint uVar22;
  uint uVar23;
  ushort uVar24;
  long lVar25;
  long lVar26;
  byte bVar27;
  undefined1 auVar28 [16];
  undefined1 auVar29 [16];
  undefined1 auVar30 [16];
  undefined1 in_XMM10_Ba;
  char cVar31;
  undefined1 in_XMM10_Bb;
  char cVar32;
  undefined1 in_XMM10_Bc;
  char cVar33;
  undefined1 in_XMM10_Bd;
  char cVar34;
  undefined1 in_XMM10_Be;
  char cVar35;
  undefined1 in_XMM10_Bf;
  char cVar36;
  undefined1 in_XMM10_Bg;
  char cVar37;
  undefined1 in_XMM10_Bh;
  char cVar38;
  undefined1 in_XMM10_Bi;
  char cVar39;
  undefined1 in_XMM10_Bj;
  char cVar40;
  undefined1 in_XMM10_Bk;
  char cVar41;
  undefined1 in_XMM10_Bl;
  char cVar42;
  undefined1 in_XMM10_Bm;
  char cVar43;
  undefined1 in_XMM10_Bn;
  char cVar44;
  undefined1 in_XMM10_Bo;
  char cVar45;
  undefined1 in_XMM10_Bp;
  char cVar46;
  int local_138;
  ulong local_130;

  lVar3 = *param_5;
  lVar4 = param_5[1];
  puVar15 = *(uint **)(lVar3 + 0xf8);
  puVar1 = puVar15 + *(long *)(lVar3 + 0x100);
  cVar2 = *(char *)(lVar3 + 0x108);
  lVar5 = *(long *)(param_3 + 0x40);
  uVar6 = *(ulong *)(param_3 + 0x48);
  lVar7 = *(long *)(param_3 + 0x90);
  uVar8 = *(ulong *)(param_3 + 0x80);
  lVar9 = *(long *)(param_3 + 0x78);
  lVar17 = 8;
  lVar19 = 0;
  iVar21 = -(uint)(CONCAT13(in_XMM10_Bd,CONCAT12(in_XMM10_Bc,CONCAT11(in_XMM10_Bb,in_XMM10_Ba))) ==
                  CONCAT13(in_XMM10_Bd,CONCAT12(in_XMM10_Bc,CONCAT11(in_XMM10_Bb,in_XMM10_Ba))));
  cVar31 = (char)iVar21;
  cVar32 = (char)((uint)iVar21 >> 8);
  cVar33 = (char)((uint)iVar21 >> 0x10);
  cVar34 = (char)((uint)iVar21 >> 0x18);
  iVar21 = -(uint)(CONCAT13(in_XMM10_Bh,CONCAT12(in_XMM10_Bg,CONCAT11(in_XMM10_Bf,in_XMM10_Be))) ==
                  CONCAT13(in_XMM10_Bh,CONCAT12(in_XMM10_Bg,CONCAT11(in_XMM10_Bf,in_XMM10_Be))));
  cVar35 = (char)iVar21;
  cVar36 = (char)((uint)iVar21 >> 8);
  cVar37 = (char)((uint)iVar21 >> 0x10);
  cVar38 = (char)((uint)iVar21 >> 0x18);
  iVar21 = -(uint)(CONCAT13(in_XMM10_Bl,CONCAT12(in_XMM10_Bk,CONCAT11(in_XMM10_Bj,in_XMM10_Bi))) ==
                  CONCAT13(in_XMM10_Bl,CONCAT12(in_XMM10_Bk,CONCAT11(in_XMM10_Bj,in_XMM10_Bi))));
  cVar39 = (char)iVar21;
  cVar40 = (char)((uint)iVar21 >> 8);
  cVar41 = (char)((uint)iVar21 >> 0x10);
  cVar42 = (char)((uint)iVar21 >> 0x18);
  iVar21 = -(uint)(CONCAT13(in_XMM10_Bp,CONCAT12(in_XMM10_Bo,CONCAT11(in_XMM10_Bn,in_XMM10_Bm))) ==
                  CONCAT13(in_XMM10_Bp,CONCAT12(in_XMM10_Bo,CONCAT11(in_XMM10_Bn,in_XMM10_Bm))));
  cVar43 = (char)iVar21;
  cVar44 = (char)((uint)iVar21 >> 8);
  cVar45 = (char)((uint)iVar21 >> 0x10);
  cVar46 = (char)((uint)iVar21 >> 0x18);
  uVar14 = 0;
  lVar16 = 0;
LAB_140acadb1:
  do {
    if (cVar2 == '\0') {
      if ((int)uVar14 == (int)lVar16) {
        do {
          if (puVar15 == puVar1) {
            return 0;
          }
          uVar22 = *puVar15;
          puVar15 = puVar15 + 1;
          lVar16 = *(long *)(*(long *)(lVar4 + 0x108) + 0x58 + (ulong)uVar22 * 0xa0);
        } while (lVar16 == 0);
        lVar17 = *(long *)(lVar4 + 0x108) + (ulong)uVar22 * 0xa0;
        uVar14 = (ulong)*(uint *)(lVar17 + 0x94);
        if (*(ulong *)(lVar3 + 0x110) < *(ulong *)(*(long *)(lVar4 + 0x1a8) + 0x40 + uVar14 * 0x48))
        {
          lVar19 = *(long *)(lVar4 + 0x1a8) + uVar14 * 0x48;
          uVar14 = *(ulong *)(*(long *)(lVar19 + 0x38) + *(ulong *)(lVar3 + 0x110) * 8);
          if (uVar14 == 0) goto LAB_140acaec1;
          lVar19 = *(long *)(*(long *)(lVar19 + 0x18) + 0x10 + ~uVar14 * 0x30);
        }
        else {
LAB_140acaec1:
          lVar19 = 0;
        }
        lVar17 = *(long *)(lVar17 + 0x50);
        uVar14 = 0;
      }
      iVar21 = (int)uVar14;
      uVar14 = (ulong)~*(uint *)(lVar17 + 8 + uVar14 * 0x10);
    }
    else {
      if ((int)uVar14 == (int)lVar16) {
        do {
          if (puVar15 == puVar1) {
            return 0;
          }
          uVar22 = *puVar15;
          puVar15 = puVar15 + 1;
          lVar16 = *(long *)(*(long *)(lVar4 + 0x1a8) + 0x10 + (ulong)uVar22 * 0x48);
        } while (lVar16 == 0);
        lVar19 = *(long *)(lVar4 + 0x1a8) + (ulong)uVar22 * 0x48;
        if ((*(ulong *)(lVar3 + 0x110) < *(ulong *)(lVar19 + 0x40)) &&
           (uVar14 = *(ulong *)(*(long *)(lVar19 + 0x38) + *(ulong *)(lVar3 + 0x110) * 8),
           uVar14 != 0)) {
          lVar19 = *(long *)(*(long *)(lVar19 + 0x18) + 0x10 + ~uVar14 * 0x30);
        }
        else {
          lVar19 = 0;
        }
        uVar14 = 0;
      }
      iVar21 = (int)uVar14;
    }
    lVar13 = uVar14 * 0xc0 + lVar19;
    uVar22 = iVar21 + 1;
    uVar14 = (ulong)uVar22;
    if (*(char *)(lVar13 + 0x40) == '\x01') {
      if (lVar7 != 0) {
        uVar18 = (ulong)*(uint *)(lVar13 + 0x48) << 0x38 | (ulong)*(uint7 *)(lVar13 + 0x41);
        uVar20 = (ulong)*(byte *)(lVar13 + 0x50) << 0x38 | (ulong)*(uint *)(lVar13 + 0x4c) << 0x18 |
                 (ulong)(*(uint *)(lVar13 + 0x48) >> 8);
        auVar28._8_8_ = 0;
        auVar28._0_8_ = uVar20 ^ 0x3f84d5b5b5470917;
        auVar10._8_8_ = 0;
        auVar10._0_8_ = uVar18 ^ 0xdef19dc0fe5cef68;
        uVar14 = SUB168(auVar28 * auVar10,8) ^ SUB168(auVar28 * auVar10,0);
        bVar27 = (byte)(uVar14 >> 0x39);
        auVar28 = ZEXT216(CONCAT11(bVar27,bVar27));
        auVar28 = pshuflw(auVar28,auVar28,0);
        lVar13 = 0;
        while( true ) {
          uVar14 = uVar14 & uVar8;
          auVar10 = *(undefined1 (*) [16])(lVar9 + uVar14);
          auVar30[0] = -(auVar10[0] == auVar28[0]);
          auVar30[1] = -(auVar10[1] == auVar28[1]);
          auVar30[2] = -(auVar10[2] == auVar28[2]);
          auVar30[3] = -(auVar10[3] == auVar28[3]);
          auVar30[4] = -(auVar10[4] == auVar28[4]);
          auVar30[5] = -(auVar10[5] == auVar28[5]);
          auVar30[6] = -(auVar10[6] == auVar28[6]);
          auVar30[7] = -(auVar10[7] == auVar28[7]);
          auVar30[8] = -(auVar10[8] == auVar28[0]);
          auVar30[9] = -(auVar10[9] == auVar28[1]);
          auVar30[10] = -(auVar10[10] == auVar28[2]);
          auVar30[0xb] = -(auVar10[0xb] == auVar28[3]);
          auVar30[0xc] = -(auVar10[0xc] == auVar28[4]);
          auVar30[0xd] = -(auVar10[0xd] == auVar28[5]);
          auVar30[0xe] = -(auVar10[0xe] == auVar28[6]);
          auVar30[0xf] = -(auVar10[0xf] == auVar28[7]);
          uVar24 = (ushort)(SUB161(auVar30 >> 7,0) & 1) |
                   (ushort)(SUB161(auVar30 >> 0xf,0) & 1) << 1 |
                   (ushort)(SUB161(auVar30 >> 0x17,0) & 1) << 2 |
                   (ushort)(SUB161(auVar30 >> 0x1f,0) & 1) << 3 |
                   (ushort)(SUB161(auVar30 >> 0x27,0) & 1) << 4 |
                   (ushort)(SUB161(auVar30 >> 0x2f,0) & 1) << 5 |
                   (ushort)(SUB161(auVar30 >> 0x37,0) & 1) << 6 |
                   (ushort)(SUB161(auVar30 >> 0x3f,0) & 1) << 7 |
                   (ushort)(SUB161(auVar30 >> 0x47,0) & 1) << 8 |
                   (ushort)(SUB161(auVar30 >> 0x4f,0) & 1) << 9 |
                   (ushort)(SUB161(auVar30 >> 0x57,0) & 1) << 10 |
                   (ushort)(SUB161(auVar30 >> 0x5f,0) & 1) << 0xb |
                   (ushort)(SUB161(auVar30 >> 0x67,0) & 1) << 0xc |
                   (ushort)(SUB161(auVar30 >> 0x6f,0) & 1) << 0xd |
                   (ushort)(SUB161(auVar30 >> 0x77,0) & 1) << 0xe |
                   (ushort)(auVar30[0xf] >> 7) << 0xf;
          uVar23 = (uint)uVar24;
          while (uVar24 != 0) {
            uVar11 = 0;
            for (uVar12 = uVar23; (uVar12 & 1) == 0; uVar12 = uVar12 >> 1 | 0x80000000) {
              uVar11 = uVar11 + 1;
            }
            lVar25 = (uVar11 + uVar14 & uVar8) * -0x300;
            if (*(ulong *)(lVar9 + -0x300 + lVar25) == uVar18 &&
                *(ulong *)(lVar9 + -0x2f8 + lVar25) == uVar20) {
              lVar26 = lVar25 + lVar9 + -0x2f0;
              lVar13 = *(long *)(lVar25 + lVar9 + -0x280);
              goto joined_r0x000140acb0c1;
            }
            uVar24 = (ushort)(uVar23 - 1) & (ushort)uVar23;
            uVar23 = CONCAT22((short)(uVar23 - 1 >> 0x10),uVar24);
          }
          auVar29[0] = -(auVar10[0] == cVar31);
          auVar29[1] = -(auVar10[1] == cVar32);
          auVar29[2] = -(auVar10[2] == cVar33);
          auVar29[3] = -(auVar10[3] == cVar34);
          auVar29[4] = -(auVar10[4] == cVar35);
          auVar29[5] = -(auVar10[5] == cVar36);
          auVar29[6] = -(auVar10[6] == cVar37);
          auVar29[7] = -(auVar10[7] == cVar38);
          auVar29[8] = -(auVar10[8] == cVar39);
          auVar29[9] = -(auVar10[9] == cVar40);
          auVar29[10] = -(auVar10[10] == cVar41);
          auVar29[0xb] = -(auVar10[0xb] == cVar42);
          auVar29[0xc] = -(auVar10[0xc] == cVar43);
          auVar29[0xd] = -(auVar10[0xd] == cVar44);
          auVar29[0xe] = -(auVar10[0xe] == cVar45);
          auVar29[0xf] = -(auVar10[0xf] == cVar46);
          if ((((((((((((((((SUB161(auVar29 >> 7,0) & 1) != 0 || (SUB161(auVar29 >> 0xf,0) & 1) != 0
                           ) || (SUB161(auVar29 >> 0x17,0) & 1) != 0) ||
                         (SUB161(auVar29 >> 0x1f,0) & 1) != 0) ||
                        (SUB161(auVar29 >> 0x27,0) & 1) != 0) ||
                       (SUB161(auVar29 >> 0x2f,0) & 1) != 0) || (SUB161(auVar29 >> 0x37,0) & 1) != 0
                      ) || (SUB161(auVar29 >> 0x3f,0) & 1) != 0) ||
                    (SUB161(auVar29 >> 0x47,0) & 1) != 0) || (SUB161(auVar29 >> 0x4f,0) & 1) != 0)
                  || (SUB161(auVar29 >> 0x57,0) & 1) != 0) || (SUB161(auVar29 >> 0x5f,0) & 1) != 0)
                || (SUB161(auVar29 >> 0x67,0) & 1) != 0) || (SUB161(auVar29 >> 0x6f,0) & 1) != 0) ||
              (SUB161(auVar29 >> 0x77,0) & 1) != 0) || auVar29[0xf] < '\0') break;
          uVar14 = uVar14 + lVar13 + 0x10;
          lVar13 = lVar13 + 0x10;
        }
LAB_140acb286:
        uVar14 = (ulong)uVar22;
      }
      goto LAB_140acadb1;
    }
    uVar18 = (ulong)*(uint *)(*(long *)(lVar13 + 0x48) + 0x6c);
    if (uVar18 < uVar6) {
      lVar26 = uVar18 * 0x2f8;
      lVar25 = *(long *)(lVar5 + lVar26);
      if (((lVar25 != -2) && (lVar25 != -1)) &&
         (lVar26 = lVar26 + lVar5,
         *(int *)(lVar26 + 0x2f0) == *(int *)(*(long *)(lVar13 + 0x48) + 0x68))) {
        lVar13 = *(long *)(lVar26 + 0x70);
joined_r0x000140acb0c1:
        uVar14 = (ulong)uVar22;
        if (lVar13 != 0) {
          if ((param_6 & 1) != 0) {
            func_0x000141925b70();
          }
          func_0x0001419bc530();
          if ((local_138 != 1) || (*(ulong *)(lVar26 + 0x88) <= local_130)) goto LAB_140acb286;
          uVar14 = (ulong)uVar22;
          if ((*(byte *)(*(long *)(lVar26 + 0x80) + local_130 * 0x2c) & 8) == 0) {
            return CONCAT71((int7)(local_130 * 0x2c >> 8),1);
          }
        }
      }
    }
  } while( true );
}
