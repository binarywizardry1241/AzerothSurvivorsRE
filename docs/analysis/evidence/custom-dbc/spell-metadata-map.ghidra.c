void entry(void)

{
  undefined1 auVar1 [16];
  uint uVar2;
  long *plVar3;
  code *pcVar4;
  uint uVar5;
  uint uVar6;
  int iVar7;
  long lVar8;
  ulong uVar9;
  long *in_RCX;
  long extraout_RDX;
  ulong uVar10;
  long lVar11;
  long *plVar12;
  long lVar13;
  long lVar14;
  uint uVar15;
  ushort uVar16;
  ulong uVar17;
  uint uVar18;
  uint uVar19;
  uint uVar20;
  byte bVar21;
  undefined1 auVar22 [16];
  undefined1 auVar23 [16];
  undefined1 auVar24 [16];
  undefined1 in_XMM6_Ba;
  char cVar25;
  undefined1 in_XMM6_Bb;
  char cVar26;
  undefined1 in_XMM6_Bc;
  char cVar27;
  undefined1 in_XMM6_Bd;
  char cVar28;
  undefined1 in_XMM6_Be;
  char cVar29;
  undefined1 in_XMM6_Bf;
  char cVar30;
  undefined1 in_XMM6_Bg;
  char cVar31;
  undefined1 in_XMM6_Bh;
  char cVar32;
  undefined1 in_XMM6_Bi;
  char cVar33;
  undefined1 in_XMM6_Bj;
  char cVar34;
  undefined1 in_XMM6_Bk;
  char cVar35;
  undefined1 in_XMM6_Bl;
  char cVar36;
  undefined1 in_XMM6_Bm;
  char cVar37;
  undefined1 in_XMM6_Bn;
  char cVar38;
  undefined1 in_XMM6_Bo;
  char cVar39;
  undefined1 in_XMM6_Bp;
  char cVar40;

  uVar2 = *(uint *)((long)in_RCX + 0x14);
  if (*(uint *)(in_RCX + 2) < uVar2) {
    lVar13 = *in_RCX;
    plVar3 = (long *)in_RCX[1];
    iVar7 = -(uint)(CONCAT13(in_XMM6_Bd,CONCAT12(in_XMM6_Bc,CONCAT11(in_XMM6_Bb,in_XMM6_Ba))) ==
                   CONCAT13(in_XMM6_Bd,CONCAT12(in_XMM6_Bc,CONCAT11(in_XMM6_Bb,in_XMM6_Ba))));
    cVar25 = (char)iVar7;
    cVar26 = (char)((uint)iVar7 >> 8);
    cVar27 = (char)((uint)iVar7 >> 0x10);
    cVar28 = (char)((uint)iVar7 >> 0x18);
    iVar7 = -(uint)(CONCAT13(in_XMM6_Bh,CONCAT12(in_XMM6_Bg,CONCAT11(in_XMM6_Bf,in_XMM6_Be))) ==
                   CONCAT13(in_XMM6_Bh,CONCAT12(in_XMM6_Bg,CONCAT11(in_XMM6_Bf,in_XMM6_Be))));
    cVar29 = (char)iVar7;
    cVar30 = (char)((uint)iVar7 >> 8);
    cVar31 = (char)((uint)iVar7 >> 0x10);
    cVar32 = (char)((uint)iVar7 >> 0x18);
    iVar7 = -(uint)(CONCAT13(in_XMM6_Bl,CONCAT12(in_XMM6_Bk,CONCAT11(in_XMM6_Bj,in_XMM6_Bi))) ==
                   CONCAT13(in_XMM6_Bl,CONCAT12(in_XMM6_Bk,CONCAT11(in_XMM6_Bj,in_XMM6_Bi))));
    cVar33 = (char)iVar7;
    cVar34 = (char)((uint)iVar7 >> 8);
    cVar35 = (char)((uint)iVar7 >> 0x10);
    cVar36 = (char)((uint)iVar7 >> 0x18);
    iVar7 = -(uint)(CONCAT13(in_XMM6_Bp,CONCAT12(in_XMM6_Bo,CONCAT11(in_XMM6_Bn,in_XMM6_Bm))) ==
                   CONCAT13(in_XMM6_Bp,CONCAT12(in_XMM6_Bo,CONCAT11(in_XMM6_Bn,in_XMM6_Bm))));
    cVar37 = (char)iVar7;
    cVar38 = (char)((uint)iVar7 >> 8);
    cVar39 = (char)((uint)iVar7 >> 0x10);
    cVar40 = (char)((uint)iVar7 >> 0x18);
    uVar19 = *(uint *)(in_RCX + 2);
    do {
      if (*(ulong *)(lVar13 + 0x10) < (ulong)(*(int *)(lVar13 + 0x28) * uVar19 + 0x10) + 0x18) {
        func_0x000145d699f0();
                    /* WARNING: Does not return */
        pcVar4 = (code *)invalidInstructionException();
        (*pcVar4)();
      }
      uVar20 = uVar19 + 1;
      func_0x000145873b10();
      if (extraout_RDX < 0) {
        func_0x000145d6944b();
                    /* WARNING: Does not return */
        pcVar4 = (code *)invalidInstructionException();
        (*pcVar4)();
      }
      lVar11 = extraout_RDX;
      if (extraout_RDX != 0) {
        func_0x000140002200();
        lVar8 = func_0x0001400021c0();
        if (lVar8 == 0) {
          func_0x000145d6944b();
                    /* WARNING: Does not return */
          pcVar4 = (code *)invalidInstructionException();
          (*pcVar4)();
        }
        func_0x000145bc977b();
      }
      uVar18 = *(int *)(lVar13 + 0x28) * uVar19;
      uVar10 = *(ulong *)(lVar13 + 0x10);
      if (uVar10 < (ulong)(uVar18 + 0x1d4) + 0x18) {
        func_0x000145d699f0();
LAB_1459b3283:
                    /* WARNING: Does not return */
        pcVar4 = (code *)invalidInstructionException();
        (*pcVar4)();
      }
      iVar7 = *(int *)(*(long *)(lVar13 + 8) + (ulong)(uVar18 + 0x1d4) + 0x14);
      if (plVar3[3] != 0) {
        plVar12 = plVar3;
        uVar9 = func_0x000140d8aa00();
        lVar8 = *plVar12;
        bVar21 = (byte)(uVar9 >> 0x39);
        auVar22 = ZEXT216(CONCAT11(bVar21,bVar21));
        auVar22 = pshuflw(auVar22,auVar22,0);
        lVar14 = 0;
        while( true ) {
          uVar9 = uVar9 & plVar12[1];
          auVar1 = *(undefined1 (*) [16])(lVar8 + uVar9);
          auVar24[0] = -(auVar1[0] == auVar22[0]);
          auVar24[1] = -(auVar1[1] == auVar22[1]);
          auVar24[2] = -(auVar1[2] == auVar22[2]);
          auVar24[3] = -(auVar1[3] == auVar22[3]);
          auVar24[4] = -(auVar1[4] == auVar22[4]);
          auVar24[5] = -(auVar1[5] == auVar22[5]);
          auVar24[6] = -(auVar1[6] == auVar22[6]);
          auVar24[7] = -(auVar1[7] == auVar22[7]);
          auVar24[8] = -(auVar1[8] == auVar22[0]);
          auVar24[9] = -(auVar1[9] == auVar22[1]);
          auVar24[10] = -(auVar1[10] == auVar22[2]);
          auVar24[0xb] = -(auVar1[0xb] == auVar22[3]);
          auVar24[0xc] = -(auVar1[0xc] == auVar22[4]);
          auVar24[0xd] = -(auVar1[0xd] == auVar22[5]);
          auVar24[0xe] = -(auVar1[0xe] == auVar22[6]);
          auVar24[0xf] = -(auVar1[0xf] == auVar22[7]);
          uVar16 = (ushort)(SUB161(auVar24 >> 7,0) & 1) |
                   (ushort)(SUB161(auVar24 >> 0xf,0) & 1) << 1 |
                   (ushort)(SUB161(auVar24 >> 0x17,0) & 1) << 2 |
                   (ushort)(SUB161(auVar24 >> 0x1f,0) & 1) << 3 |
                   (ushort)(SUB161(auVar24 >> 0x27,0) & 1) << 4 |
                   (ushort)(SUB161(auVar24 >> 0x2f,0) & 1) << 5 |
                   (ushort)(SUB161(auVar24 >> 0x37,0) & 1) << 6 |
                   (ushort)(SUB161(auVar24 >> 0x3f,0) & 1) << 7 |
                   (ushort)(SUB161(auVar24 >> 0x47,0) & 1) << 8 |
                   (ushort)(SUB161(auVar24 >> 0x4f,0) & 1) << 9 |
                   (ushort)(SUB161(auVar24 >> 0x57,0) & 1) << 10 |
                   (ushort)(SUB161(auVar24 >> 0x5f,0) & 1) << 0xb |
                   (ushort)(SUB161(auVar24 >> 0x67,0) & 1) << 0xc |
                   (ushort)(SUB161(auVar24 >> 0x6f,0) & 1) << 0xd |
                   (ushort)(SUB161(auVar24 >> 0x77,0) & 1) << 0xe |
                   (ushort)(auVar24[0xf] >> 7) << 0xf;
          uVar15 = (uint)uVar16;
          while (uVar16 != 0) {
            uVar5 = 0;
            for (uVar6 = uVar15; (uVar6 & 1) == 0; uVar6 = uVar6 >> 1 | 0x80000000) {
              uVar5 = uVar5 + 1;
            }
            uVar17 = uVar5 + uVar9 & plVar12[1];
            if (iVar7 == *(int *)(lVar8 + -0x18 + uVar17 * -0x18)) {
              lVar8 = *(long *)(lVar8 + uVar17 * -0x18 + -8);
              if (-1 < lVar8) {
                if (lVar8 == 0) {
                  lVar8 = 0;
                  goto LAB_1459b3059;
                }
                func_0x000140002200();
                lVar14 = func_0x0001400021c0();
                if (lVar14 != 0) {
                  func_0x000145bc977b();
                  uVar10 = *(ulong *)(lVar13 + 0x10);
                  uVar18 = uVar19 * *(int *)(lVar13 + 0x28);
                  goto LAB_1459b3059;
                }
              }
              func_0x000145d6944b();
              goto LAB_1459b3283;
            }
            uVar16 = (ushort)(uVar15 - 1) & (ushort)uVar15;
            uVar15 = CONCAT22((short)(uVar15 - 1 >> 0x10),uVar16);
          }
          auVar23[0] = -(auVar1[0] == cVar25);
          auVar23[1] = -(auVar1[1] == cVar26);
          auVar23[2] = -(auVar1[2] == cVar27);
          auVar23[3] = -(auVar1[3] == cVar28);
          auVar23[4] = -(auVar1[4] == cVar29);
          auVar23[5] = -(auVar1[5] == cVar30);
          auVar23[6] = -(auVar1[6] == cVar31);
          auVar23[7] = -(auVar1[7] == cVar32);
          auVar23[8] = -(auVar1[8] == cVar33);
          auVar23[9] = -(auVar1[9] == cVar34);
          auVar23[10] = -(auVar1[10] == cVar35);
          auVar23[0xb] = -(auVar1[0xb] == cVar36);
          auVar23[0xc] = -(auVar1[0xc] == cVar37);
          auVar23[0xd] = -(auVar1[0xd] == cVar38);
          auVar23[0xe] = -(auVar1[0xe] == cVar39);
          auVar23[0xf] = -(auVar1[0xf] == cVar40);
          if ((((((((((((((((SUB161(auVar23 >> 7,0) & 1) != 0 || (SUB161(auVar23 >> 0xf,0) & 1) != 0
                           ) || (SUB161(auVar23 >> 0x17,0) & 1) != 0) ||
                         (SUB161(auVar23 >> 0x1f,0) & 1) != 0) ||
                        (SUB161(auVar23 >> 0x27,0) & 1) != 0) ||
                       (SUB161(auVar23 >> 0x2f,0) & 1) != 0) || (SUB161(auVar23 >> 0x37,0) & 1) != 0
                      ) || (SUB161(auVar23 >> 0x3f,0) & 1) != 0) ||
                    (SUB161(auVar23 >> 0x47,0) & 1) != 0) || (SUB161(auVar23 >> 0x4f,0) & 1) != 0)
                  || (SUB161(auVar23 >> 0x57,0) & 1) != 0) || (SUB161(auVar23 >> 0x5f,0) & 1) != 0)
                || (SUB161(auVar23 >> 0x67,0) & 1) != 0) || (SUB161(auVar23 >> 0x6f,0) & 1) != 0) ||
              (SUB161(auVar23 >> 0x77,0) & 1) != 0) || auVar23[0xf] < '\0') break;
          uVar9 = uVar9 + lVar14 + 0x10;
          lVar14 = lVar14 + 0x10;
        }
      }
      lVar8 = 0;
LAB_1459b3059:
      if (uVar10 < (ulong)uVar18 + 0x18) {
        func_0x000145d699f0();
        goto LAB_1459b3283;
      }
      func_0x0001458ba640();
      if (lVar11 != -1) {
        if (lVar11 != 0) {
          func_0x0001400021d0();
        }
        if (lVar8 != 0) {
          func_0x0001400021d0();
        }
      }
      uVar19 = uVar20;
    } while (uVar20 != uVar2);
  }
  return;
}
