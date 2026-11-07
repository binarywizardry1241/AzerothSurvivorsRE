/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(void)

{
  long *plVar1;
  char *pcVar2;
  char *pcVar3;
  undefined8 *puVar4;
  int *piVar5;
  code *pcVar6;
  ushort uVar7;
  short sVar8;
  uint uVar9;
  undefined8 uVar10;
  undefined8 uVar11;
  undefined8 uVar12;
  undefined8 uVar13;
  undefined8 uVar14;
  long lVar15;
  undefined8 uVar16;
  undefined8 uVar17;
  long lVar18;
  undefined8 *puVar19;
  undefined4 *puVar20;
  long lVar21;
  long in_RCX;
  undefined1 uVar22;
  ulong uVar23;
  ulong uVar24;
  undefined4 uVar25;
  ulong uVar26;
  uint uVar27;
  undefined8 in_R9;
  long lVar28;
  long lVar29;
  ushort uVar30;
  ulong uVar31;
  ulong uVar32;
  undefined4 unaff_R12D;
  undefined4 unaff_R13D;
  ulong uVar33;
  uint uVar34;
  undefined4 uVar35;
  undefined1 auVar36 [16];
  undefined1 auVar37 [16];
  undefined1 auVar38 [16];
  undefined1 auVar39 [16];
  undefined1 auVar40 [16];
  undefined1 auVar41 [16];
  undefined1 auVar42 [16];
  undefined1 auVar43 [16];
  undefined8 uStack_48;

  uStack_48 = 0x140272076;
  lVar15 = func_0x000145bc8c10();
  lVar15 = -lVar15;
  puVar4 = (undefined8 *)(&stack0x00000040 + lVar15);
  *(undefined8 *)(&stack0x00001070 + lVar15) = 0xfffffffffffffffe;
  *(undefined8 *)((long)&uStack_48 + lVar15) = 0x1402720a5;
  func_0x0001458ddb50();
  if (*(long *)(&stack0xffffffffffffffe0 + lVar15) == -1) {
    uVar35 = 0;
    *(undefined4 *)(&stack0x00001058 + lVar15) = 0;
  }
  else {
    *(long *)(&stack0x00000fd0 + lVar15) = *(long *)(&stack0xffffffffffffffe0 + lVar15);
    *(long *)(&stack0x00000fc0 + lVar15) = in_RCX;
    lVar18 = *(long *)(&stack0xffffffffffffffe8 + lVar15);
    uVar24 = *(ulong *)(&stack0xfffffffffffffff0 + lVar15);
    *(undefined8 *)(&stack0x00000fc8 + lVar15) = 0;
    *(undefined4 *)(&stack0x00001058 + lVar15) = 0;
    uVar31 = 0;
    *(long *)(&stack0x00001060 + lVar15) = lVar18;
    uVar32 = 0;
LAB_140272157:
    do {
      uVar33 = uVar31;
      if (uVar31 <= uVar24) {
        do {
          lVar21 = lVar18 + uVar33;
          if (uVar24 - uVar33 < 0x10) {
            uVar23 = 0;
            uVar31 = uVar24;
            if (uVar24 == uVar33) break;
            while (uVar26 = uVar33, *(char *)(lVar21 + uVar23) != '\n') {
              uVar23 = uVar23 + 1;
              if (uVar24 - uVar33 == uVar23) goto LAB_140272223;
            }
          }
          else {
            *(undefined8 *)((long)&uStack_48 + lVar15) = 0x1402721ca;
            auVar43 = func_0x000145ba4f00();
            uVar23 = auVar43._8_8_;
            lVar18 = *(long *)(&stack0x00001060 + lVar15);
            uVar26 = uVar33;
            uVar31 = uVar24;
            if (auVar43._0_8_ != 1) break;
          }
          uVar33 = uVar23 + uVar26 + 1;
          uVar31 = uVar33;
          if ((uVar26 + uVar23 < uVar24) && (*(char *)(lVar21 + uVar23) == '\n')) {
            in_R9 = 0;
            uVar26 = uVar33;
            goto LAB_140272238;
          }
        } while (uVar33 <= uVar24);
      }
LAB_140272223:
      uVar33 = uVar24;
      in_R9 = CONCAT71((int7)((ulong)in_R9 >> 8),1);
      uVar24 = uVar33;
      uVar26 = uVar32;
      if (uVar33 == uVar32) break;
LAB_140272238:
      lVar21 = lVar18 + uVar32;
      lVar29 = uVar33 - uVar32;
      lVar28 = lVar29;
      if ((lVar29 != 0) && (*(char *)(lVar18 + -1 + uVar33) == '\n')) {
        lVar28 = lVar29 + -1;
        if (lVar28 == 0) {
          lVar28 = 0;
        }
        else if (*(char *)(lVar18 + -2 + uVar33) == '\r') {
          lVar28 = lVar29 + -2;
        }
      }
      *(int *)(&stack0x00001054 + lVar15) = (int)in_R9;
      *(undefined8 *)(&stack0xffffffffffffffe0 + lVar15) = 0;
      *(long *)(&stack0xffffffffffffffe8 + lVar15) = lVar28;
      *(long *)(&stack0xfffffffffffffff0 + lVar15) = lVar21;
      *(long *)(&stack0xfffffffffffffff8 + lVar15) = lVar28;
      *(long *)(&stack0x00000000 + lVar15) = lVar21;
      *(long *)(&stack0x00000008 + lVar15) = lVar21 + lVar28;
      *(undefined8 *)(&stack0x00000010 + lVar15) = 0;
      *(undefined2 *)(&stack0x00000018 + lVar15) = 1;
      *(undefined8 *)((long)&uStack_48 + lVar15) = 0x1402722b1;
      func_0x00014025ede0();
      uVar32 = uVar26;
      if (*(long *)(&stack0x00000ff0 + lVar15) == 3) {
        puVar19 = *(undefined8 **)(&stack0x00000fe8 + lVar15);
        *(undefined8 *)(&stack0x00000fb0 + lVar15) = *puVar19;
        *(undefined8 *)(&stack0x00000fa8 + lVar15) = puVar19[1];
        *(undefined8 **)(&stack0x00000fb8 + lVar15) = puVar19;
        *(undefined8 *)((long)&uStack_48 + lVar15) = 0x1402722f7;
        uVar16 = func_0x000145baaf70();
        *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140272306;
        uVar17 = func_0x000145baaf70();
        if ((((uint)uVar16 | (uint)uVar17) & 1) != 0) goto LAB_140272314;
        uVar27 = (uint)((ulong)uVar17 >> 0x20);
        uVar34 = (uint)((ulong)uVar16 >> 0x20);
        if ((0x7f7fffff < (uVar34 & 0x7fffffff)) || (0x7f7fffff < (uVar27 & 0x7fffffff)))
        goto LAB_140272314;
        if (*(long *)(&stack0x00000fa8 + lVar15) == 5) {
          piVar5 = *(int **)(&stack0x00000fb0 + lVar15);
          lVar18 = *(long *)(&stack0x00001060 + lVar15);
          if ((char)piVar5[1] == 'y' && *piVar5 == 0x6c6c6174) {
            *(undefined4 *)(&stack0x00001058 + lVar15) = 1;
          }
          else {
            if ((char)piVar5[1] == 'd' && *piVar5 == 0x6c697562) {
              *(undefined8 *)(&stack0x00000fc8 + lVar15) = 1;
              *(uint *)(&stack0x00000fd8 + lVar15) = uVar27;
              *(uint *)(&stack0x00000fdc + lVar15) = uVar34;
            }
            uVar27 = *(uint *)(&stack0x00001068 + lVar15);
            uVar34 = *(uint *)(&stack0x0000105c + lVar15);
          }
        }
        else {
          uVar27 = *(uint *)(&stack0x00001068 + lVar15);
          uVar34 = *(uint *)(&stack0x0000105c + lVar15);
          lVar18 = *(long *)(&stack0x00001060 + lVar15);
        }
        *(uint *)(&stack0x00001068 + lVar15) = uVar27;
        *(uint *)(&stack0x0000105c + lVar15) = uVar34;
        uVar27 = *(uint *)(&stack0x00001054 + lVar15);
        if (*(long *)(&stack0x00000fe0 + lVar15) != 0) goto LAB_140272339;
LAB_140272348:
        if ((uVar27 & 1) != 0) break;
        goto LAB_140272157;
      }
LAB_140272314:
      if (*(long *)(&stack0x00000fe0 + lVar15) != 0) {
        lVar18 = *(long *)(&stack0x00001060 + lVar15);
        uVar27 = *(uint *)(&stack0x00001054 + lVar15);
LAB_140272339:
        *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140272348;
        func_0x0001400021d0();
        goto LAB_140272348;
      }
      lVar18 = *(long *)(&stack0x00001060 + lVar15);
    } while ((*(uint *)(&stack0x00001054 + lVar15) & 1) == 0);
    if (*(long *)(&stack0x00000fd0 + lVar15) != 0) {
      *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140272114;
      func_0x0001400021d0();
    }
    in_RCX = *(long *)(&stack0x00000fc0 + lVar15);
    uVar35 = (undefined4)*(undefined8 *)(&stack0x00000fc8 + lVar15);
    unaff_R12D = *(undefined4 *)(&stack0x00000fd8 + lVar15);
    unaff_R13D = *(undefined4 *)(&stack0x00000fdc + lVar15);
  }
  lVar18 = in_RCX + 0x40;
  plVar1 = (long *)(in_RCX + 0x5a8);
  *(long *)(&stack0x00000ff8 + lVar15) = lVar18;
  *(long **)(&stack0x00001000 + lVar15) = plVar1;
  *(undefined8 *)(&stack0x00000fe0 + lVar15) = 0;
  *(undefined8 *)(&stack0x00000fe8 + lVar15) = 8;
  *(undefined8 *)(&stack0x00000ff0 + lVar15) = 0;
  if (*(long *)(in_RCX + 0x90) != 0) {
    uVar24 = 0xb7d14969f30a9628;
    lVar21 = *(long *)(in_RCX + 0x78);
    lVar28 = 0;
    while( true ) {
      uVar24 = uVar24 & *(ulong *)(in_RCX + 0x80);
      pcVar2 = (char *)(lVar21 + uVar24);
      auVar43[0] = -(*pcVar2 == DAT_145d9af60);
      auVar43[1] = -(pcVar2[1] == cRam0000000145d9af61);
      auVar43[2] = -(pcVar2[2] == cRam0000000145d9af62);
      auVar43[3] = -(pcVar2[3] == cRam0000000145d9af63);
      auVar43[4] = -(pcVar2[4] == cRam0000000145d9af64);
      auVar43[5] = -(pcVar2[5] == cRam0000000145d9af65);
      auVar43[6] = -(pcVar2[6] == cRam0000000145d9af66);
      auVar43[7] = -(pcVar2[7] == cRam0000000145d9af67);
      auVar43[8] = -(pcVar2[8] == cRam0000000145d9af68);
      auVar43[9] = -(pcVar2[9] == cRam0000000145d9af69);
      auVar43[10] = -(pcVar2[10] == cRam0000000145d9af6a);
      auVar43[0xb] = -(pcVar2[0xb] == cRam0000000145d9af6b);
      auVar43[0xc] = -(pcVar2[0xc] == cRam0000000145d9af6c);
      auVar43[0xd] = -(pcVar2[0xd] == cRam0000000145d9af6d);
      auVar43[0xe] = -(pcVar2[0xe] == cRam0000000145d9af6e);
      auVar43[0xf] = -(pcVar2[0xf] == cRam0000000145d9af6f);
      uVar30 = (ushort)(SUB161(auVar43 >> 7,0) & 1) | (ushort)(SUB161(auVar43 >> 0xf,0) & 1) << 1 |
               (ushort)(SUB161(auVar43 >> 0x17,0) & 1) << 2 |
               (ushort)(SUB161(auVar43 >> 0x1f,0) & 1) << 3 |
               (ushort)(SUB161(auVar43 >> 0x27,0) & 1) << 4 |
               (ushort)(SUB161(auVar43 >> 0x2f,0) & 1) << 5 |
               (ushort)(SUB161(auVar43 >> 0x37,0) & 1) << 6 |
               (ushort)(SUB161(auVar43 >> 0x3f,0) & 1) << 7 |
               (ushort)(SUB161(auVar43 >> 0x47,0) & 1) << 8 |
               (ushort)(SUB161(auVar43 >> 0x4f,0) & 1) << 9 |
               (ushort)(SUB161(auVar43 >> 0x57,0) & 1) << 10 |
               (ushort)(SUB161(auVar43 >> 0x5f,0) & 1) << 0xb |
               (ushort)(SUB161(auVar43 >> 0x67,0) & 1) << 0xc |
               (ushort)(SUB161(auVar43 >> 0x6f,0) & 1) << 0xd |
               (ushort)(SUB161(auVar43 >> 0x77,0) & 1) << 0xe | (ushort)(auVar43[0xf] >> 7) << 0xf;
      uVar27 = (uint)uVar30;
      while (uVar30 != 0) {
        uVar34 = 0;
        for (uVar9 = uVar27; (uVar9 & 1) == 0; uVar9 = uVar9 >> 1 | 0x80000000) {
          uVar34 = uVar34 + 1;
        }
        uVar31 = uVar34 + uVar24 & *(ulong *)(in_RCX + 0x80);
        pcVar3 = (char *)(lVar21 + -0x18 + uVar31 * -0x18);
        auVar40[0] = -(*pcVar3 == DAT_145dbf500);
        auVar40[1] = -(pcVar3[1] == cRam0000000145dbf501);
        auVar40[2] = -(pcVar3[2] == cRam0000000145dbf502);
        auVar40[3] = -(pcVar3[3] == cRam0000000145dbf503);
        auVar40[4] = -(pcVar3[4] == cRam0000000145dbf504);
        auVar40[5] = -(pcVar3[5] == cRam0000000145dbf505);
        auVar40[6] = -(pcVar3[6] == cRam0000000145dbf506);
        auVar40[7] = -(pcVar3[7] == cRam0000000145dbf507);
        auVar40[8] = -(pcVar3[8] == cRam0000000145dbf508);
        auVar40[9] = -(pcVar3[9] == cRam0000000145dbf509);
        auVar40[10] = -(pcVar3[10] == cRam0000000145dbf50a);
        auVar40[0xb] = -(pcVar3[0xb] == cRam0000000145dbf50b);
        auVar40[0xc] = -(pcVar3[0xc] == cRam0000000145dbf50c);
        auVar40[0xd] = -(pcVar3[0xd] == cRam0000000145dbf50d);
        auVar40[0xe] = -(pcVar3[0xe] == cRam0000000145dbf50e);
        auVar40[0xf] = -(pcVar3[0xf] == cRam0000000145dbf50f);
        if ((ushort)((ushort)(SUB161(auVar40 >> 7,0) & 1) |
                     (ushort)(SUB161(auVar40 >> 0xf,0) & 1) << 1 |
                     (ushort)(SUB161(auVar40 >> 0x17,0) & 1) << 2 |
                     (ushort)(SUB161(auVar40 >> 0x1f,0) & 1) << 3 |
                     (ushort)(SUB161(auVar40 >> 0x27,0) & 1) << 4 |
                     (ushort)(SUB161(auVar40 >> 0x2f,0) & 1) << 5 |
                     (ushort)(SUB161(auVar40 >> 0x37,0) & 1) << 6 |
                     (ushort)(SUB161(auVar40 >> 0x3f,0) & 1) << 7 |
                     (ushort)(SUB161(auVar40 >> 0x47,0) & 1) << 8 |
                     (ushort)(SUB161(auVar40 >> 0x4f,0) & 1) << 9 |
                     (ushort)(SUB161(auVar40 >> 0x57,0) & 1) << 10 |
                     (ushort)(SUB161(auVar40 >> 0x5f,0) & 1) << 0xb |
                     (ushort)(SUB161(auVar40 >> 0x67,0) & 1) << 0xc |
                     (ushort)(SUB161(auVar40 >> 0x6f,0) & 1) << 0xd |
                     (ushort)(SUB161(auVar40 >> 0x77,0) & 1) << 0xe |
                    (ushort)(auVar40[0xf] >> 7) << 0xf) == 0xffff) {
          lVar21 = *(long *)(lVar21 + uVar31 * -0x18 + -8);
          uVar25 = *(undefined4 *)(&stack0x00001068 + lVar15);
          lVar18 = *(long *)(&stack0x00000fe0 + lVar15);
          goto joined_r0x000140272620;
        }
        uVar30 = (ushort)(uVar27 - 1) & (ushort)uVar27;
        uVar27 = CONCAT22((short)(uVar27 - 1 >> 0x10),uVar30);
      }
      auVar38[0] = -(*pcVar2 == -1);
      auVar38[1] = -(pcVar2[1] == -1);
      auVar38[2] = -(pcVar2[2] == -1);
      auVar38[3] = -(pcVar2[3] == -1);
      auVar38[4] = -(pcVar2[4] == -1);
      auVar38[5] = -(pcVar2[5] == -1);
      auVar38[6] = -(pcVar2[6] == -1);
      auVar38[7] = -(pcVar2[7] == -1);
      auVar38[8] = -(pcVar2[8] == -1);
      auVar38[9] = -(pcVar2[9] == -1);
      auVar38[10] = -(pcVar2[10] == -1);
      auVar38[0xb] = -(pcVar2[0xb] == -1);
      auVar38[0xc] = -(pcVar2[0xc] == -1);
      auVar38[0xd] = -(pcVar2[0xd] == -1);
      auVar38[0xe] = -(pcVar2[0xe] == -1);
      auVar38[0xf] = -(pcVar2[0xf] == -1);
      if ((((((((((((((((SUB161(auVar38 >> 7,0) & 1) != 0 || (SUB161(auVar38 >> 0xf,0) & 1) != 0) ||
                      (SUB161(auVar38 >> 0x17,0) & 1) != 0) || (SUB161(auVar38 >> 0x1f,0) & 1) != 0)
                    || (SUB161(auVar38 >> 0x27,0) & 1) != 0) || (SUB161(auVar38 >> 0x2f,0) & 1) != 0
                   ) || (SUB161(auVar38 >> 0x37,0) & 1) != 0) ||
                 (SUB161(auVar38 >> 0x3f,0) & 1) != 0) || (SUB161(auVar38 >> 0x47,0) & 1) != 0) ||
               (SUB161(auVar38 >> 0x4f,0) & 1) != 0) || (SUB161(auVar38 >> 0x57,0) & 1) != 0) ||
             (SUB161(auVar38 >> 0x5f,0) & 1) != 0) || (SUB161(auVar38 >> 0x67,0) & 1) != 0) ||
           (SUB161(auVar38 >> 0x6f,0) & 1) != 0) || (SUB161(auVar38 >> 0x77,0) & 1) != 0) ||
          auVar38[0xf] < '\0') break;
      uVar24 = uVar24 + lVar28 + 0x10;
      lVar28 = lVar28 + 0x10;
    }
  }
  lVar21 = *(long *)(in_RCX + 0xe0);
  uVar24 = *(ulong *)(in_RCX + 0xe8);
  uVar31 = 0xb7d14969f30a9628;
  lVar28 = 0;
  while( true ) {
    uVar31 = uVar31 & uVar24;
    pcVar2 = (char *)(lVar21 + uVar31);
    auVar41[0] = -(*pcVar2 == DAT_145d9af60);
    auVar41[1] = -(pcVar2[1] == cRam0000000145d9af61);
    auVar41[2] = -(pcVar2[2] == cRam0000000145d9af62);
    auVar41[3] = -(pcVar2[3] == cRam0000000145d9af63);
    auVar41[4] = -(pcVar2[4] == cRam0000000145d9af64);
    auVar41[5] = -(pcVar2[5] == cRam0000000145d9af65);
    auVar41[6] = -(pcVar2[6] == cRam0000000145d9af66);
    auVar41[7] = -(pcVar2[7] == cRam0000000145d9af67);
    auVar41[8] = -(pcVar2[8] == cRam0000000145d9af68);
    auVar41[9] = -(pcVar2[9] == cRam0000000145d9af69);
    auVar41[10] = -(pcVar2[10] == cRam0000000145d9af6a);
    auVar41[0xb] = -(pcVar2[0xb] == cRam0000000145d9af6b);
    auVar41[0xc] = -(pcVar2[0xc] == cRam0000000145d9af6c);
    auVar41[0xd] = -(pcVar2[0xd] == cRam0000000145d9af6d);
    auVar41[0xe] = -(pcVar2[0xe] == cRam0000000145d9af6e);
    auVar41[0xf] = -(pcVar2[0xf] == cRam0000000145d9af6f);
    uVar30 = (ushort)(SUB161(auVar41 >> 7,0) & 1) | (ushort)(SUB161(auVar41 >> 0xf,0) & 1) << 1 |
             (ushort)(SUB161(auVar41 >> 0x17,0) & 1) << 2 |
             (ushort)(SUB161(auVar41 >> 0x1f,0) & 1) << 3 |
             (ushort)(SUB161(auVar41 >> 0x27,0) & 1) << 4 |
             (ushort)(SUB161(auVar41 >> 0x2f,0) & 1) << 5 |
             (ushort)(SUB161(auVar41 >> 0x37,0) & 1) << 6 |
             (ushort)(SUB161(auVar41 >> 0x3f,0) & 1) << 7 |
             (ushort)(SUB161(auVar41 >> 0x47,0) & 1) << 8 |
             (ushort)(SUB161(auVar41 >> 0x4f,0) & 1) << 9 |
             (ushort)(SUB161(auVar41 >> 0x57,0) & 1) << 10 |
             (ushort)(SUB161(auVar41 >> 0x5f,0) & 1) << 0xb |
             (ushort)(SUB161(auVar41 >> 0x67,0) & 1) << 0xc |
             (ushort)(SUB161(auVar41 >> 0x6f,0) & 1) << 0xd |
             (ushort)(SUB161(auVar41 >> 0x77,0) & 1) << 0xe | (ushort)(auVar41[0xf] >> 7) << 0xf;
    uVar27 = (uint)uVar30;
    if (uVar30 != 0) break;
LAB_1402725e0:
    auVar39[0] = -(*pcVar2 == -1);
    auVar39[1] = -(pcVar2[1] == -1);
    auVar39[2] = -(pcVar2[2] == -1);
    auVar39[3] = -(pcVar2[3] == -1);
    auVar39[4] = -(pcVar2[4] == -1);
    auVar39[5] = -(pcVar2[5] == -1);
    auVar39[6] = -(pcVar2[6] == -1);
    auVar39[7] = -(pcVar2[7] == -1);
    auVar39[8] = -(pcVar2[8] == -1);
    auVar39[9] = -(pcVar2[9] == -1);
    auVar39[10] = -(pcVar2[10] == -1);
    auVar39[0xb] = -(pcVar2[0xb] == -1);
    auVar39[0xc] = -(pcVar2[0xc] == -1);
    auVar39[0xd] = -(pcVar2[0xd] == -1);
    auVar39[0xe] = -(pcVar2[0xe] == -1);
    auVar39[0xf] = -(pcVar2[0xf] == -1);
    uVar25 = *(undefined4 *)(&stack0x00001068 + lVar15);
    if ((((((((((((((((SUB161(auVar39 >> 7,0) & 1) != 0 || (SUB161(auVar39 >> 0xf,0) & 1) != 0) ||
                    (SUB161(auVar39 >> 0x17,0) & 1) != 0) || (SUB161(auVar39 >> 0x1f,0) & 1) != 0)
                  || (SUB161(auVar39 >> 0x27,0) & 1) != 0) || (SUB161(auVar39 >> 0x2f,0) & 1) != 0)
                || (SUB161(auVar39 >> 0x37,0) & 1) != 0) || (SUB161(auVar39 >> 0x3f,0) & 1) != 0) ||
              (SUB161(auVar39 >> 0x47,0) & 1) != 0) || (SUB161(auVar39 >> 0x4f,0) & 1) != 0) ||
            (SUB161(auVar39 >> 0x57,0) & 1) != 0) || (SUB161(auVar39 >> 0x5f,0) & 1) != 0) ||
          (SUB161(auVar39 >> 0x67,0) & 1) != 0) || (SUB161(auVar39 >> 0x6f,0) & 1) != 0) ||
        (SUB161(auVar39 >> 0x77,0) & 1) != 0) || auVar39[0xf] < '\0') {
LAB_1402726a3:
      lVar21 = *plVar1;
      *plVar1 = lVar21 + 1;
      *(undefined2 *)(&stack0x00000030 + lVar15) = 0x100;
      *(undefined8 *)(&stack0xffffffffffffffe0 + lVar15) = 1;
      *(undefined8 *)(&stack0xffffffffffffffe8 + lVar15) = _DAT_145dbfa10;
      *(undefined8 *)(&stack0xfffffffffffffff0 + lVar15) = uRam0000000145dbfa18;
      *(undefined8 *)(&stack0x00000008 + lVar15) = 4;
      *(undefined8 *)(&stack0x00000010 + lVar15) = 0x2c;
      *(undefined8 *)(&stack0x00000028 + lVar15) = 0;
      (&stack0x00000032)[lVar15] = 1;
      *(undefined8 *)(&stack0xfffffffffffffff8 + lVar15) = 0;
      (&stack0x00000018)[lVar15] = 2;
      *(undefined8 *)((long)&uStack_48 + lVar15) = 0x1402726ff;
      func_0x000140011c70(lVar18,uVar25,lVar21,lVar18,&stack0xffffffffffffffe0 + lVar15);
      *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140272713;
      func_0x000140011ac0();
      lVar18 = *(long *)(&stack0x00000fe0 + lVar15);
joined_r0x000140272620:
      if (lVar18 != 0) {
LAB_140272720:
        *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140272736;
        func_0x0001400021d0();
      }
LAB_140272736:
      *(undefined4 *)(&stack0xffffffffffffffe0 + lVar15) =
           *(undefined4 *)(&stack0x00001058 + lVar15);
      *(undefined4 *)(&stack0xffffffffffffffe4 + lVar15) =
           *(undefined4 *)(&stack0x0000105c + lVar15);
      *(undefined4 *)(&stack0xffffffffffffffe8 + lVar15) = uVar25;
      *(undefined4 *)(&stack0xffffffffffffffec + lVar15) = uVar35;
      *(undefined4 *)(&stack0xfffffffffffffff0 + lVar15) = unaff_R13D;
      *(undefined4 *)(&stack0xfffffffffffffff4 + lVar15) = unaff_R12D;
      (&stack0x00000000)[lVar15] = 2;
      uVar35 = *(undefined4 *)(in_RCX + 0x5b0);
      *(undefined8 *)((long)&uStack_48 + lVar15) = 0x14027276a;
      func_0x000144e7b3e0();
      *(long *)(&stack0x00000fe0 + lVar15) = lVar21;
      *(undefined8 *)((long)&uStack_48 + lVar15) = 0x14027278a;
      lVar18 = func_0x00014000a130();
      if (*(char *)(lVar18 + 0x30) == '\x01') {
        *(undefined8 *)((long)&uStack_48 + lVar15) = 0x1402727a1;
        func_0x000144e5dc40();
      }
      else {
        *(undefined8 *)((long)&uStack_48 + lVar15) = 0x1402727b4;
        func_0x000145bc978d();
        *(undefined4 *)(lVar18 + 0x28) = uVar35;
        *(undefined1 *)(lVar18 + 0x30) = 1;
      }
      *(undefined4 *)(lVar18 + 0x2c) = uVar35;
      *(undefined8 *)((long)&uStack_48 + lVar15) = 0x1402727c3;
      func_0x000140002200();
      *(undefined8 *)((long)&uStack_48 + lVar15) = 0x1402727d2;
      puVar19 = (undefined8 *)func_0x0001400021c0();
      if (puVar19 != (undefined8 *)0x0) {
        *puVar19 = 0;
        *(undefined4 *)(puVar19 + 4) = 0;
        *(undefined1 *)((long)puVar19 + 0x24) = 0;
        *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140272800;
        func_0x000144e09040();
        *(undefined8 *)((long)&uStack_48 + lVar15) = 0x14027281b;
        func_0x000140119ae0();
        *(undefined8 *)((long)&uStack_48 + lVar15) = 0x14027282b;
        func_0x000140011470();
        *(undefined8 *)(&stack0x00001040 + lVar15) = *puVar4;
        *(undefined8 *)(&stack0x00001048 + lVar15) = *(undefined8 *)(&stack0x00000048 + lVar15);
        *(undefined8 *)(&stack0x00001030 + lVar15) = *(undefined8 *)(&stack0x00000030 + lVar15);
        *(undefined8 *)(&stack0x00001038 + lVar15) = *(undefined8 *)(&stack0x00000038 + lVar15);
        *(undefined8 *)(&stack0x00001020 + lVar15) = *(undefined8 *)(&stack0x00000020 + lVar15);
        *(undefined8 *)(&stack0x00001028 + lVar15) = *(undefined8 *)(&stack0x00000028 + lVar15);
        uVar16 = *(undefined8 *)((long)(&stack0x00000000 + lVar15) + 8);
        *(undefined8 *)(&stack0x00001010 + lVar15) = *(undefined8 *)(&stack0x00000010 + lVar15);
        *(undefined8 *)(&stack0x00001018 + lVar15) = *(undefined8 *)(&stack0x00000018 + lVar15);
        *(undefined8 *)(&stack0x00001000 + lVar15) = *(undefined8 *)(&stack0x00000000 + lVar15);
        *(undefined8 *)(&stack0x00001008 + lVar15) = uVar16;
        *(undefined8 *)(&stack0x00000ff0 + lVar15) =
             *(undefined8 *)(&stack0xfffffffffffffff0 + lVar15);
        *(undefined8 *)(&stack0x00000ff8 + lVar15) =
             *(undefined8 *)(&stack0xfffffffffffffff8 + lVar15);
        *(undefined8 *)(&stack0x00000fe0 + lVar15) =
             *(undefined8 *)(&stack0xffffffffffffffe0 + lVar15);
        *(undefined8 *)(&stack0x00000fe8 + lVar15) =
             *(undefined8 *)(&stack0xffffffffffffffe8 + lVar15);
        (&stack0x00000f38)[lVar15] = 0;
        *(undefined8 *)((long)&uStack_48 + lVar15) = 0x14027289a;
        func_0x000140119ae0();
        *(undefined8 *)((long)&uStack_48 + lVar15) = 0x1402728ad;
        func_0x000140011470();
        *puVar4 = *(undefined8 *)(&stack0x00001040 + lVar15);
        *(undefined8 *)(&stack0x00000048 + lVar15) = *(undefined8 *)(&stack0x00001048 + lVar15);
        *(undefined8 *)(&stack0x00000030 + lVar15) = *(undefined8 *)(&stack0x00001030 + lVar15);
        *(undefined8 *)(&stack0x00000038 + lVar15) = *(undefined8 *)(&stack0x00001038 + lVar15);
        *(undefined8 *)(&stack0x00000020 + lVar15) = *(undefined8 *)(&stack0x00001020 + lVar15);
        *(undefined8 *)(&stack0x00000028 + lVar15) = *(undefined8 *)(&stack0x00001028 + lVar15);
        uVar16 = *(undefined8 *)(&stack0x00000fe0 + lVar15);
        uVar17 = *(undefined8 *)(&stack0x00000fe8 + lVar15);
        uVar10 = *(undefined8 *)(&stack0x00000ff0 + lVar15);
        uVar11 = *(undefined8 *)(&stack0x00000ff8 + lVar15);
        *(undefined8 *)(&stack0x00000010 + lVar15) = *(undefined8 *)(&stack0x00001010 + lVar15);
        *(undefined8 *)(&stack0x00000018 + lVar15) = *(undefined8 *)(&stack0x00001018 + lVar15);
        *(undefined8 *)(&stack0x00000000 + lVar15) = *(undefined8 *)(&stack0x00001000 + lVar15);
        *(undefined8 *)((long)(&stack0x00000000 + lVar15) + 8) =
             *(undefined8 *)(&stack0x00001008 + lVar15);
        *(undefined8 *)(&stack0xfffffffffffffff0 + lVar15) = uVar10;
        *(undefined8 *)(&stack0xfffffffffffffff8 + lVar15) = uVar11;
        *(undefined8 *)(&stack0xffffffffffffffe0 + lVar15) = uVar16;
        *(undefined8 *)(&stack0xffffffffffffffe8 + lVar15) = uVar17;
        *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140272907;
        func_0x0001401597c0();
        *(undefined8 *)((long)&uStack_48 + lVar15) = 0x14027290c;
        func_0x000140002200();
        *(undefined8 *)((long)&uStack_48 + lVar15) = 0x14027291b;
        lVar18 = func_0x0001400021c0();
        if (lVar18 == 0) {
          *(undefined8 *)((long)&uStack_48 + lVar15) = 0x1402736ee;
          func_0x000145d69431();
                    /* WARNING: Does not return */
          pcVar6 = (code *)invalidInstructionException();
          (*pcVar6)();
        }
        *(long *)(&stack0x00001060 + lVar15) = lVar18;
        *(undefined8 *)(&stack0xffffffffffffffe0 + lVar15) = 0xffffffffffffffff;
        *(undefined4 *)(&stack0x00000ba8 + lVar15) = 0;
        (&stack0x00000bac)[lVar15] = 0;
        *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140272949;
        func_0x000140002200();
        *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140272958;
        lVar18 = func_0x0001400021c0();
        if (lVar18 == 0) {
          *(undefined8 *)((long)&uStack_48 + lVar15) = 0x1402736ff;
          func_0x000145d69431();
        }
        else {
          *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140272976;
          func_0x000145bc977b(lVar18);
          *(undefined8 *)((long)&uStack_48 + lVar15) = 0x14027298d;
          func_0x000144e09040();
          *(undefined8 *)(&stack0xffffffffffffffe0 + lVar15) = 0xffffffffffffffff;
          *(undefined4 *)(&stack0x00000280 + lVar15) = 0;
          (&stack0x00000284)[lVar15] = 0;
          *(undefined8 *)((long)&uStack_48 + lVar15) = 0x1402729ac;
          func_0x000140002200();
          *(undefined8 *)((long)&uStack_48 + lVar15) = 0x1402729bb;
          lVar18 = func_0x0001400021c0();
          if (lVar18 == 0) {
            *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140273714;
            func_0x000145d69431();
          }
          else {
            *(undefined8 *)((long)&uStack_48 + lVar15) = 0x1402729d9;
            func_0x000145bc977b(lVar18);
            *(undefined8 *)((long)&uStack_48 + lVar15) = 0x1402729f0;
            func_0x000144e09040();
            *(undefined8 *)(&stack0xffffffffffffffe0 + lVar15) = 0xffffffffffffffff;
            *(undefined4 *)(&stack0x00000298 + lVar15) = 0;
            (&stack0x0000029c)[lVar15] = 0;
            *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140272a0f;
            func_0x000140002200();
            *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140272a1e;
            lVar18 = func_0x0001400021c0();
            if (lVar18 == 0) {
              *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140273729;
              func_0x000145d69431();
            }
            else {
              *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140272a3c;
              func_0x000145bc977b(lVar18);
              *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140272a53;
              func_0x000144e09040();
              *(undefined8 *)(&stack0xffffffffffffffe0 + lVar15) = 0xffffffffffffffff;
              *(undefined4 *)(&stack0x00000160 + lVar15) = 0;
              (&stack0x00000164)[lVar15] = 0;
              *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140272a72;
              func_0x000140002200();
              *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140272a81;
              lVar18 = func_0x0001400021c0();
              if (lVar18 == 0) {
                *(undefined8 *)((long)&uStack_48 + lVar15) = 0x14027373e;
                func_0x000145d69431();
              }
              else {
                *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140272a9f;
                func_0x000145bc977b(lVar18);
                *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140272ab6;
                func_0x000144e09040();
                *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140272abc;
                func_0x000140002200();
                *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140272acb;
                puVar20 = (undefined4 *)func_0x0001400021c0();
                if (puVar20 == (undefined4 *)0x0) {
                  *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140273753;
                  func_0x000145d69431();
                }
                else {
                  *puVar20 = 0;
                  *(undefined1 *)(puVar20 + 1) = 0;
                  *(undefined8 *)(puVar20 + 0x40) = 0xffffffffffffffff;
                  *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140272aff;
                  func_0x000144e09040();
                  *(undefined8 *)(&stack0xffffffffffffffe0 + lVar15) = 0xffffffffffffffff;
                  *(undefined4 *)(&stack0x00000168 + lVar15) = 0;
                  (&stack0x0000016c)[lVar15] = 0;
                  *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140272b1e;
                  func_0x000140002200();
                  *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140272b2d;
                  lVar18 = func_0x0001400021c0();
                  if (lVar18 == 0) {
                    *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140273768;
                    func_0x000145d69431();
                  }
                  else {
                    *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140272b4b;
                    func_0x000145bc977b(lVar18);
                    *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140272b62;
                    func_0x000144e09040();
                    *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140272b68;
                    func_0x000140002200();
                    *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140272b77;
                    puVar20 = (undefined4 *)func_0x0001400021c0();
                    if (puVar20 == (undefined4 *)0x0) {
                      *(undefined8 *)((long)&uStack_48 + lVar15) = 0x14027377d;
                      func_0x000145d69431();
                    }
                    else {
                      *puVar20 = 0;
                      *(undefined1 *)(puVar20 + 1) = 0;
                      *(undefined8 *)(puVar20 + 0x40) = 0xffffffffffffffff;
                      *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140272bab;
                      func_0x000144e09040();
                      *(undefined8 *)(&stack0x000000d0 + lVar15) = 0xffffffffffffffff;
                      *(undefined4 *)(&stack0x00000230 + lVar15) = 0;
                      (&stack0x00000234)[lVar15] = 0;
                      *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140272bcd;
                      func_0x000140002200();
                      *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140272bdc;
                      lVar18 = func_0x0001400021c0();
                      if (lVar18 == 0) {
                        *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140273792;
                        func_0x000145d69431();
                      }
                      else {
                        *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140272bfa;
                        func_0x000145bc977b(lVar18);
                        *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140272c11;
                        func_0x000144e09040();
                        *(undefined8 *)(&stack0x00000020 + lVar15) = 0xffffffffffffffff;
                        *(undefined4 *)(&stack0x00000380 + lVar15) = 0;
                        (&stack0x00000384)[lVar15] = 0;
                        *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140272c30;
                        func_0x000140002200();
                        *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140272c3f;
                        lVar18 = func_0x0001400021c0();
                        if (lVar18 == 0) {
                          *(undefined8 *)((long)&uStack_48 + lVar15) = 0x1402737a7;
                          func_0x000145d69431();
                        }
                        else {
                          *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140272c5d;
                          func_0x000145bc977b(lVar18);
                          *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140272c74;
                          func_0x000144e09040();
                          *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140272c7a;
                          func_0x000140002200();
                          *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140272c89;
                          puVar20 = (undefined4 *)func_0x0001400021c0();
                          if (puVar20 == (undefined4 *)0x0) {
                            *(undefined8 *)((long)&uStack_48 + lVar15) = 0x1402737b9;
                            func_0x000145d69431();
                          }
                          else {
                            *puVar20 = 0;
                            *(undefined1 *)(puVar20 + 1) = 0;
                            *(undefined8 *)(puVar20 + 0x40) = 0xffffffffffffffff;
                            *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140272cbd;
                            func_0x000144e09040();
                            *(undefined8 *)(&stack0x00000020 + lVar15) = 0xffffffffffffffff;
                            *(undefined4 *)(&stack0x000002a8 + lVar15) = 0;
                            (&stack0x000002ac)[lVar15] = 0;
                            *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140272cdc;
                            func_0x000140002200();
                            *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140272ceb;
                            lVar18 = func_0x0001400021c0();
                            if (lVar18 == 0) {
                              *(undefined8 *)((long)&uStack_48 + lVar15) = 0x1402737cb;
                              func_0x000145d69431();
                            }
                            else {
                              *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140272d09;
                              func_0x000145bc977b(lVar18);
                              *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140272d1d;
                              func_0x000144e09040();
                              uVar16 = *(undefined8 *)(&stack0x00000f30 + lVar15);
                              puVar19 = *(undefined8 **)(&stack0x00001060 + lVar15);
                              puVar19[0xc] = *(undefined8 *)(&stack0x00000f28 + lVar15);
                              puVar19[0xd] = uVar16;
                              uVar16 = *(undefined8 *)(&stack0x00000f20 + lVar15);
                              puVar19[10] = *(undefined8 *)(&stack0x00000f18 + lVar15);
                              puVar19[0xb] = uVar16;
                              uVar16 = *(undefined8 *)(&stack0x00000f10 + lVar15);
                              puVar19[8] = *(undefined8 *)(&stack0x00000f08 + lVar15);
                              puVar19[9] = uVar16;
                              uVar16 = *(undefined8 *)(&stack0x00000ec8 + lVar15);
                              uVar17 = *(undefined8 *)(&stack0x00000ed0 + lVar15);
                              uVar10 = *(undefined8 *)(&stack0x00000ed8 + lVar15);
                              uVar11 = *(undefined8 *)(&stack0x00000ee0 + lVar15);
                              uVar12 = *(undefined8 *)(&stack0x00000ee8 + lVar15);
                              uVar13 = *(undefined8 *)(&stack0x00000ef0 + lVar15);
                              uVar14 = *(undefined8 *)(&stack0x00000f00 + lVar15);
                              puVar19[6] = *(undefined8 *)(&stack0x00000ef8 + lVar15);
                              puVar19[7] = uVar14;
                              puVar19[4] = uVar12;
                              puVar19[5] = uVar13;
                              puVar19[2] = uVar10;
                              puVar19[3] = uVar11;
                              *puVar19 = uVar16;
                              puVar19[1] = uVar17;
                              uVar16 = *(undefined8 *)(&stack0x00000e60 + lVar15);
                              uVar17 = *(undefined8 *)(&stack0x00000e68 + lVar15);
                              uVar10 = *(undefined8 *)(&stack0x00000e70 + lVar15);
                              uVar11 = *(undefined8 *)(&stack0x00000e78 + lVar15);
                              uVar12 = *(undefined8 *)(&stack0x00000e80 + lVar15);
                              uVar13 = *(undefined8 *)(&stack0x00000e88 + lVar15);
                              uVar14 = *(undefined8 *)(&stack0x00000e90 + lVar15);
                              puVar19[0xe] = *(undefined8 *)(&stack0x00000e58 + lVar15);
                              puVar19[0xf] = uVar16;
                              puVar19[0x10] = uVar17;
                              puVar19[0x11] = uVar10;
                              puVar19[0x12] = uVar11;
                              puVar19[0x13] = uVar12;
                              puVar19[0x14] = uVar13;
                              puVar19[0x15] = uVar14;
                              uVar16 = *(undefined8 *)(&stack0x00000ea0 + lVar15);
                              puVar19[0x16] = *(undefined8 *)(&stack0x00000e98 + lVar15);
                              puVar19[0x17] = uVar16;
                              uVar16 = *(undefined8 *)(&stack0x00000eb0 + lVar15);
                              puVar19[0x18] = *(undefined8 *)(&stack0x00000ea8 + lVar15);
                              puVar19[0x19] = uVar16;
                              uVar16 = *(undefined8 *)(&stack0x00000ec0 + lVar15);
                              puVar19[0x1a] = *(undefined8 *)(&stack0x00000eb8 + lVar15);
                              puVar19[0x1b] = uVar16;
                              uVar16 = *(undefined8 *)(&stack0x00000e50 + lVar15);
                              puVar19[0x28] = *(undefined8 *)(&stack0x00000e48 + lVar15);
                              puVar19[0x29] = uVar16;
                              uVar16 = *(undefined8 *)(&stack0x00000e40 + lVar15);
                              puVar19[0x26] = *(undefined8 *)(&stack0x00000e38 + lVar15);
                              puVar19[0x27] = uVar16;
                              uVar16 = *(undefined8 *)(&stack0x00000e30 + lVar15);
                              puVar19[0x24] = *(undefined8 *)(&stack0x00000e28 + lVar15);
                              puVar19[0x25] = uVar16;
                              uVar16 = *(undefined8 *)(&stack0x00000de8 + lVar15);
                              uVar17 = *(undefined8 *)(&stack0x00000df0 + lVar15);
                              uVar10 = *(undefined8 *)(&stack0x00000df8 + lVar15);
                              uVar11 = *(undefined8 *)(&stack0x00000e00 + lVar15);
                              uVar12 = *(undefined8 *)(&stack0x00000e08 + lVar15);
                              uVar13 = *(undefined8 *)(&stack0x00000e10 + lVar15);
                              uVar14 = *(undefined8 *)(&stack0x00000e20 + lVar15);
                              puVar19[0x22] = *(undefined8 *)(&stack0x00000e18 + lVar15);
                              puVar19[0x23] = uVar14;
                              puVar19[0x20] = uVar12;
                              puVar19[0x21] = uVar13;
                              puVar19[0x1e] = uVar10;
                              puVar19[0x1f] = uVar11;
                              puVar19[0x1c] = uVar16;
                              puVar19[0x1d] = uVar17;
                              uVar16 = *(undefined8 *)(&stack0x00000d80 + lVar15);
                              uVar17 = *(undefined8 *)(&stack0x00000d88 + lVar15);
                              uVar10 = *(undefined8 *)(&stack0x00000d90 + lVar15);
                              uVar11 = *(undefined8 *)(&stack0x00000d98 + lVar15);
                              uVar12 = *(undefined8 *)(&stack0x00000da0 + lVar15);
                              uVar13 = *(undefined8 *)(&stack0x00000da8 + lVar15);
                              uVar14 = *(undefined8 *)(&stack0x00000db0 + lVar15);
                              puVar19[0x2a] = *(undefined8 *)(&stack0x00000d78 + lVar15);
                              puVar19[0x2b] = uVar16;
                              puVar19[0x2c] = uVar17;
                              puVar19[0x2d] = uVar10;
                              puVar19[0x2e] = uVar11;
                              puVar19[0x2f] = uVar12;
                              puVar19[0x30] = uVar13;
                              puVar19[0x31] = uVar14;
                              uVar16 = *(undefined8 *)(&stack0x00000dc0 + lVar15);
                              puVar19[0x32] = *(undefined8 *)(&stack0x00000db8 + lVar15);
                              puVar19[0x33] = uVar16;
                              uVar16 = *(undefined8 *)(&stack0x00000dd0 + lVar15);
                              puVar19[0x34] = *(undefined8 *)(&stack0x00000dc8 + lVar15);
                              puVar19[0x35] = uVar16;
                              uVar16 = *(undefined8 *)(&stack0x00000de0 + lVar15);
                              puVar19[0x36] = *(undefined8 *)(&stack0x00000dd8 + lVar15);
                              puVar19[0x37] = uVar16;
                              uVar16 = *(undefined8 *)(&stack0x00000d10 + lVar15);
                              uVar17 = *(undefined8 *)(&stack0x00000d18 + lVar15);
                              uVar10 = *(undefined8 *)(&stack0x00000d20 + lVar15);
                              uVar11 = *(undefined8 *)(&stack0x00000d28 + lVar15);
                              uVar12 = *(undefined8 *)(&stack0x00000d30 + lVar15);
                              uVar13 = *(undefined8 *)(&stack0x00000d38 + lVar15);
                              uVar14 = *(undefined8 *)(&stack0x00000d40 + lVar15);
                              puVar19[0x38] = *(undefined8 *)(&stack0x00000d08 + lVar15);
                              puVar19[0x39] = uVar16;
                              puVar19[0x3a] = uVar17;
                              puVar19[0x3b] = uVar10;
                              puVar19[0x3c] = uVar11;
                              puVar19[0x3d] = uVar12;
                              puVar19[0x3e] = uVar13;
                              puVar19[0x3f] = uVar14;
                              uVar16 = *(undefined8 *)(&stack0x00000d50 + lVar15);
                              puVar19[0x40] = *(undefined8 *)(&stack0x00000d48 + lVar15);
                              puVar19[0x41] = uVar16;
                              uVar16 = *(undefined8 *)(&stack0x00000d70 + lVar15);
                              puVar19[0x44] = *(undefined8 *)(&stack0x00000d68 + lVar15);
                              puVar19[0x45] = uVar16;
                              uVar16 = *(undefined8 *)(&stack0x00000d60 + lVar15);
                              puVar19[0x42] = *(undefined8 *)(&stack0x00000d58 + lVar15);
                              puVar19[0x43] = uVar16;
                              uVar16 = *(undefined8 *)(&stack0x00000d00 + lVar15);
                              puVar19[0x52] = *(undefined8 *)(&stack0x00000cf8 + lVar15);
                              puVar19[0x53] = uVar16;
                              uVar16 = *(undefined8 *)(&stack0x00000cf0 + lVar15);
                              puVar19[0x50] = *(undefined8 *)(&stack0x00000ce8 + lVar15);
                              puVar19[0x51] = uVar16;
                              uVar16 = *(undefined8 *)(&stack0x00000ce0 + lVar15);
                              puVar19[0x4e] = *(undefined8 *)(&stack0x00000cd8 + lVar15);
                              puVar19[0x4f] = uVar16;
                              uVar16 = *(undefined8 *)(&stack0x00000c98 + lVar15);
                              uVar17 = *(undefined8 *)(&stack0x00000ca0 + lVar15);
                              uVar10 = *(undefined8 *)(&stack0x00000ca8 + lVar15);
                              uVar11 = *(undefined8 *)(&stack0x00000cb0 + lVar15);
                              uVar12 = *(undefined8 *)(&stack0x00000cb8 + lVar15);
                              uVar13 = *(undefined8 *)(&stack0x00000cc0 + lVar15);
                              uVar14 = *(undefined8 *)(&stack0x00000cd0 + lVar15);
                              puVar19[0x4c] = *(undefined8 *)(&stack0x00000cc8 + lVar15);
                              puVar19[0x4d] = uVar14;
                              puVar19[0x4a] = uVar12;
                              puVar19[0x4b] = uVar13;
                              puVar19[0x48] = uVar10;
                              puVar19[0x49] = uVar11;
                              puVar19[0x46] = uVar16;
                              puVar19[0x47] = uVar17;
                              uVar16 = *(undefined8 *)(&stack0x00000c30 + lVar15);
                              uVar17 = *(undefined8 *)(&stack0x00000c38 + lVar15);
                              uVar10 = *(undefined8 *)(&stack0x00000c40 + lVar15);
                              uVar11 = *(undefined8 *)(&stack0x00000c48 + lVar15);
                              uVar12 = *(undefined8 *)(&stack0x00000c50 + lVar15);
                              uVar13 = *(undefined8 *)(&stack0x00000c58 + lVar15);
                              uVar14 = *(undefined8 *)(&stack0x00000c60 + lVar15);
                              puVar19[0x54] = *(undefined8 *)(&stack0x00000c28 + lVar15);
                              puVar19[0x55] = uVar16;
                              puVar19[0x56] = uVar17;
                              puVar19[0x57] = uVar10;
                              puVar19[0x58] = uVar11;
                              puVar19[0x59] = uVar12;
                              puVar19[0x5a] = uVar13;
                              puVar19[0x5b] = uVar14;
                              uVar16 = *(undefined8 *)(&stack0x00000c70 + lVar15);
                              puVar19[0x5c] = *(undefined8 *)(&stack0x00000c68 + lVar15);
                              puVar19[0x5d] = uVar16;
                              uVar16 = *(undefined8 *)(&stack0x00000c80 + lVar15);
                              puVar19[0x5e] = *(undefined8 *)(&stack0x00000c78 + lVar15);
                              puVar19[0x5f] = uVar16;
                              uVar16 = *(undefined8 *)(&stack0x00000c90 + lVar15);
                              puVar19[0x60] = *(undefined8 *)(&stack0x00000c88 + lVar15);
                              puVar19[0x61] = uVar16;
                              uVar16 = *(undefined8 *)(&stack0x00000bc0 + lVar15);
                              uVar17 = *(undefined8 *)(&stack0x00000bc8 + lVar15);
                              uVar10 = *(undefined8 *)(&stack0x00000bd0 + lVar15);
                              uVar11 = *(undefined8 *)(&stack0x00000bd8 + lVar15);
                              uVar12 = *(undefined8 *)(&stack0x00000be0 + lVar15);
                              uVar13 = *(undefined8 *)(&stack0x00000be8 + lVar15);
                              uVar14 = *(undefined8 *)(&stack0x00000bf0 + lVar15);
                              puVar19[0x62] = *(undefined8 *)(&stack0x00000bb8 + lVar15);
                              puVar19[99] = uVar16;
                              puVar19[100] = uVar17;
                              puVar19[0x65] = uVar10;
                              puVar19[0x66] = uVar11;
                              puVar19[0x67] = uVar12;
                              puVar19[0x68] = uVar13;
                              puVar19[0x69] = uVar14;
                              uVar16 = *(undefined8 *)(&stack0x00000c00 + lVar15);
                              puVar19[0x6a] = *(undefined8 *)(&stack0x00000bf8 + lVar15);
                              puVar19[0x6b] = uVar16;
                              uVar16 = *(undefined8 *)(&stack0x00000c10 + lVar15);
                              puVar19[0x6c] = *(undefined8 *)(&stack0x00000c08 + lVar15);
                              puVar19[0x6d] = uVar16;
                              uVar16 = *(undefined8 *)(&stack0x00000c20 + lVar15);
                              puVar19[0x6e] = *(undefined8 *)(&stack0x00000c18 + lVar15);
                              puVar19[0x6f] = uVar16;
                              uVar16 = *(undefined8 *)(&stack0x00000f40 + lVar15);
                              uVar17 = *(undefined8 *)(&stack0x00000f48 + lVar15);
                              uVar10 = *(undefined8 *)(&stack0x00000f50 + lVar15);
                              uVar11 = *(undefined8 *)(&stack0x00000f58 + lVar15);
                              uVar12 = *(undefined8 *)(&stack0x00000f60 + lVar15);
                              uVar13 = *(undefined8 *)(&stack0x00000f68 + lVar15);
                              uVar14 = *(undefined8 *)(&stack0x00000f70 + lVar15);
                              puVar19[0x70] = *(undefined8 *)(&stack0x00000f38 + lVar15);
                              puVar19[0x71] = uVar16;
                              puVar19[0x72] = uVar17;
                              puVar19[0x73] = uVar10;
                              puVar19[0x74] = uVar11;
                              puVar19[0x75] = uVar12;
                              puVar19[0x76] = uVar13;
                              puVar19[0x77] = uVar14;
                              uVar16 = *(undefined8 *)(&stack0x00000f80 + lVar15);
                              puVar19[0x78] = *(undefined8 *)(&stack0x00000f78 + lVar15);
                              puVar19[0x79] = uVar16;
                              uVar16 = *(undefined8 *)(&stack0x00000f90 + lVar15);
                              puVar19[0x7a] = *(undefined8 *)(&stack0x00000f88 + lVar15);
                              puVar19[0x7b] = uVar16;
                              uVar16 = *(undefined8 *)(&stack0x00000fa0 + lVar15);
                              puVar19[0x7c] = *(undefined8 *)(&stack0x00000f98 + lVar15);
                              puVar19[0x7d] = uVar16;
                              uVar16 = *(undefined8 *)(&stack0x00000fe8 + lVar15);
                              uVar17 = *(undefined8 *)(&stack0x00000ff0 + lVar15);
                              uVar10 = *(undefined8 *)(&stack0x00000ff8 + lVar15);
                              uVar11 = *(undefined8 *)(&stack0x00001000 + lVar15);
                              uVar12 = *(undefined8 *)(&stack0x00001008 + lVar15);
                              uVar13 = *(undefined8 *)(&stack0x00001010 + lVar15);
                              uVar14 = *(undefined8 *)(&stack0x00001018 + lVar15);
                              puVar19[0x7e] = *(undefined8 *)(&stack0x00000fe0 + lVar15);
                              puVar19[0x7f] = uVar16;
                              puVar19[0x80] = uVar17;
                              puVar19[0x81] = uVar10;
                              puVar19[0x82] = uVar11;
                              puVar19[0x83] = uVar12;
                              puVar19[0x84] = uVar13;
                              puVar19[0x85] = uVar14;
                              uVar16 = *(undefined8 *)(&stack0x00001028 + lVar15);
                              puVar19[0x86] = *(undefined8 *)(&stack0x00001020 + lVar15);
                              puVar19[0x87] = uVar16;
                              uVar16 = *(undefined8 *)(&stack0x00001038 + lVar15);
                              puVar19[0x88] = *(undefined8 *)(&stack0x00001030 + lVar15);
                              puVar19[0x89] = uVar16;
                              uVar16 = *(undefined8 *)(&stack0x00001048 + lVar15);
                              puVar19[0x8a] = *(undefined8 *)(&stack0x00001040 + lVar15);
                              puVar19[0x8b] = uVar16;
                              uVar16 = *(undefined8 *)(&stack0xffffffffffffffe8 + lVar15);
                              uVar17 = *(undefined8 *)(&stack0xfffffffffffffff0 + lVar15);
                              uVar10 = *(undefined8 *)(&stack0xfffffffffffffff8 + lVar15);
                              uVar11 = *(undefined8 *)(&stack0x00000000 + lVar15);
                              uVar12 = *(undefined8 *)((long)(&stack0x00000000 + lVar15) + 8);
                              uVar13 = *(undefined8 *)(&stack0x00000010 + lVar15);
                              uVar14 = *(undefined8 *)(&stack0x00000018 + lVar15);
                              puVar19[0x8c] = *(undefined8 *)(&stack0xffffffffffffffe0 + lVar15);
                              puVar19[0x8d] = uVar16;
                              puVar19[0x8e] = uVar17;
                              puVar19[0x8f] = uVar10;
                              puVar19[0x90] = uVar11;
                              puVar19[0x91] = uVar12;
                              puVar19[0x92] = uVar13;
                              puVar19[0x93] = uVar14;
                              uVar16 = *(undefined8 *)(&stack0x00000028 + lVar15);
                              puVar19[0x94] = *(undefined8 *)(&stack0x00000020 + lVar15);
                              puVar19[0x95] = uVar16;
                              uVar16 = *(undefined8 *)(&stack0x00000038 + lVar15);
                              puVar19[0x96] = *(undefined8 *)(&stack0x00000030 + lVar15);
                              puVar19[0x97] = uVar16;
                              uVar16 = *(undefined8 *)(&stack0x00000048 + lVar15);
                              puVar19[0x98] = *puVar4;
                              puVar19[0x99] = uVar16;
                              *(undefined8 *)(&stack0xffffffffffffffe8 + lVar15) = 0xb;
                              *(undefined8 **)(&stack0xfffffffffffffff0 + lVar15) = puVar19;
                              *(undefined8 *)(&stack0xfffffffffffffff8 + lVar15) = 0xb;
                              *(undefined8 *)(&stack0x00000000 + lVar15) = 0;
                              *(undefined8 *)(&stack0x00000008 + lVar15) = 8;
                              *(undefined8 *)(&stack0x00000010 + lVar15) = 0;
                              *(undefined8 *)(&stack0x00000018 + lVar15) = 0;
                              *(undefined8 *)(&stack0xffffffffffffffe0 + lVar15) =
                                   0xffffffffffffffff;
                              *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140273169;
                              func_0x000144e4f960();
                              *(undefined8 *)(&stack0x00001040 + lVar15) = *puVar4;
                              *(undefined8 *)(&stack0x00001048 + lVar15) =
                                   *(undefined8 *)(&stack0x00000048 + lVar15);
                              *(undefined8 *)(&stack0x00001030 + lVar15) =
                                   *(undefined8 *)(&stack0x00000030 + lVar15);
                              *(undefined8 *)(&stack0x00001038 + lVar15) =
                                   *(undefined8 *)(&stack0x00000038 + lVar15);
                              *(undefined8 *)(&stack0x00001020 + lVar15) =
                                   *(undefined8 *)(&stack0x00000020 + lVar15);
                              *(undefined8 *)(&stack0x00001028 + lVar15) =
                                   *(undefined8 *)(&stack0x00000028 + lVar15);
                              uVar16 = *(undefined8 *)((long)(&stack0x00000000 + lVar15) + 8);
                              *(undefined8 *)(&stack0x00001010 + lVar15) =
                                   *(undefined8 *)(&stack0x00000010 + lVar15);
                              *(undefined8 *)(&stack0x00001018 + lVar15) =
                                   *(undefined8 *)(&stack0x00000018 + lVar15);
                              *(undefined8 *)(&stack0x00001000 + lVar15) =
                                   *(undefined8 *)(&stack0x00000000 + lVar15);
                              *(undefined8 *)(&stack0x00001008 + lVar15) = uVar16;
                              *(undefined8 *)(&stack0x00000ff0 + lVar15) =
                                   *(undefined8 *)(&stack0xfffffffffffffff0 + lVar15);
                              *(undefined8 *)(&stack0x00000ff8 + lVar15) =
                                   *(undefined8 *)(&stack0xfffffffffffffff8 + lVar15);
                              *(undefined8 *)(&stack0x00000fe0 + lVar15) =
                                   *(undefined8 *)(&stack0xffffffffffffffe0 + lVar15);
                              *(undefined8 *)(&stack0x00000fe8 + lVar15) =
                                   *(undefined8 *)(&stack0xffffffffffffffe8 + lVar15);
                              *(undefined8 *)((long)&uStack_48 + lVar15) = 0x1402731d1;
                              func_0x000140119ae0();
                              *(undefined8 *)((long)&uStack_48 + lVar15) = 0x1402731e4;
                              func_0x000140011470();
                              *puVar4 = *(undefined8 *)(&stack0x00001040 + lVar15);
                              *(undefined8 *)(&stack0x00000048 + lVar15) =
                                   *(undefined8 *)(&stack0x00001048 + lVar15);
                              *(undefined8 *)(&stack0x00000030 + lVar15) =
                                   *(undefined8 *)(&stack0x00001030 + lVar15);
                              *(undefined8 *)(&stack0x00000038 + lVar15) =
                                   *(undefined8 *)(&stack0x00001038 + lVar15);
                              *(undefined8 *)(&stack0x00000020 + lVar15) =
                                   *(undefined8 *)(&stack0x00001020 + lVar15);
                              *(undefined8 *)(&stack0x00000028 + lVar15) =
                                   *(undefined8 *)(&stack0x00001028 + lVar15);
                              uVar16 = *(undefined8 *)(&stack0x00000fe0 + lVar15);
                              uVar17 = *(undefined8 *)(&stack0x00000fe8 + lVar15);
                              uVar10 = *(undefined8 *)(&stack0x00000ff0 + lVar15);
                              uVar11 = *(undefined8 *)(&stack0x00000ff8 + lVar15);
                              *(undefined8 *)(&stack0x00000010 + lVar15) =
                                   *(undefined8 *)(&stack0x00001010 + lVar15);
                              *(undefined8 *)(&stack0x00000018 + lVar15) =
                                   *(undefined8 *)(&stack0x00001018 + lVar15);
                              *(undefined8 *)(&stack0x00000000 + lVar15) =
                                   *(undefined8 *)(&stack0x00001000 + lVar15);
                              *(undefined8 *)((long)(&stack0x00000000 + lVar15) + 8) =
                                   *(undefined8 *)(&stack0x00001008 + lVar15);
                              *(undefined8 *)(&stack0xfffffffffffffff0 + lVar15) = uVar10;
                              *(undefined8 *)(&stack0xfffffffffffffff8 + lVar15) = uVar11;
                              *(undefined8 *)(&stack0xffffffffffffffe0 + lVar15) = uVar16;
                              *(undefined8 *)(&stack0xffffffffffffffe8 + lVar15) = uVar17;
                              *(undefined8 *)((long)&uStack_48 + lVar15) = 0x14027323e;
                              func_0x000140159570();
                              *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140273243;
                              func_0x000140002200();
                              *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140273252;
                              lVar18 = func_0x0001400021c0();
                              if (lVar18 == 0) {
                                *(undefined8 *)((long)&uStack_48 + lVar15) = 0x1402737dd;
                                func_0x000145d69431();
                    /* WARNING: Does not return */
                                pcVar6 = (code *)invalidInstructionException();
                                (*pcVar6)();
                              }
                              *(long *)(&stack0x00001060 + lVar15) = lVar18;
                              *(undefined8 *)(&stack0x00000020 + lVar15) = 0xffffffffffffffff;
                              *(undefined4 *)(&stack0x00000258 + lVar15) = 0;
                              (&stack0x0000025c)[lVar15] = 0;
                              *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140273280;
                              func_0x000140002200();
                              *(undefined8 *)((long)&uStack_48 + lVar15) = 0x14027328f;
                              lVar18 = func_0x0001400021c0();
                              if (lVar18 == 0) {
                                *(undefined8 *)((long)&uStack_48 + lVar15) = 0x1402737ee;
                                func_0x000145d69431();
                              }
                              else {
                                *(undefined8 *)((long)&uStack_48 + lVar15) = 0x1402732ad;
                                func_0x000145bc977b(lVar18);
                                *(undefined8 *)((long)&uStack_48 + lVar15) = 0x1402732c4;
                                func_0x000144e09040();
                                *(undefined8 *)((long)&uStack_48 + lVar15) = 0x1402732ca;
                                func_0x000140002200();
                                *(undefined8 *)((long)&uStack_48 + lVar15) = 0x1402732d9;
                                puVar20 = (undefined4 *)func_0x0001400021c0();
                                if (puVar20 == (undefined4 *)0x0) {
                                  *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140273800;
                                  func_0x000145d69431();
                                }
                                else {
                                  *puVar20 = 0;
                                  *(undefined1 *)(puVar20 + 1) = 0;
                                  *(undefined8 *)(puVar20 + 0x46) = 0xffffffffffffffff;
                                  *(undefined8 *)((long)&uStack_48 + lVar15) = 0x14027330d;
                                  func_0x000144e09040();
                                  *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140273313;
                                  func_0x000140002200();
                                  *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140273322;
                                  puVar20 = (undefined4 *)func_0x0001400021c0();
                                  if (puVar20 == (undefined4 *)0x0) {
                                    *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140273812;
                                    func_0x000145d69431();
                                  }
                                  else {
                                    *puVar20 = 0;
                                    *(undefined1 *)(puVar20 + 1) = 0;
                                    *(undefined1 *)(puVar20 + 2) = 0;
                                    *(undefined8 *)((long)&uStack_48 + lVar15) = 0x14027334c;
                                    func_0x000144e09040();
                                    uVar16 = *(undefined8 *)(&stack0x00000fa0 + lVar15);
                                    puVar19 = *(undefined8 **)(&stack0x00001060 + lVar15);
                                    puVar19[0xc] = *(undefined8 *)(&stack0x00000f98 + lVar15);
                                    puVar19[0xd] = uVar16;
                                    uVar16 = *(undefined8 *)(&stack0x00000f90 + lVar15);
                                    puVar19[10] = *(undefined8 *)(&stack0x00000f88 + lVar15);
                                    puVar19[0xb] = uVar16;
                                    uVar16 = *(undefined8 *)(&stack0x00000f80 + lVar15);
                                    puVar19[8] = *(undefined8 *)(&stack0x00000f78 + lVar15);
                                    puVar19[9] = uVar16;
                                    uVar16 = *(undefined8 *)(&stack0x00000f38 + lVar15);
                                    uVar17 = *(undefined8 *)(&stack0x00000f40 + lVar15);
                                    uVar10 = *(undefined8 *)(&stack0x00000f48 + lVar15);
                                    uVar11 = *(undefined8 *)(&stack0x00000f50 + lVar15);
                                    uVar12 = *(undefined8 *)(&stack0x00000f58 + lVar15);
                                    uVar13 = *(undefined8 *)(&stack0x00000f60 + lVar15);
                                    uVar14 = *(undefined8 *)(&stack0x00000f70 + lVar15);
                                    puVar19[6] = *(undefined8 *)(&stack0x00000f68 + lVar15);
                                    puVar19[7] = uVar14;
                                    puVar19[4] = uVar12;
                                    puVar19[5] = uVar13;
                                    puVar19[2] = uVar10;
                                    puVar19[3] = uVar11;
                                    *puVar19 = uVar16;
                                    puVar19[1] = uVar17;
                                    uVar16 = *(undefined8 *)(&stack0x00000fe8 + lVar15);
                                    uVar17 = *(undefined8 *)(&stack0x00000ff0 + lVar15);
                                    uVar10 = *(undefined8 *)(&stack0x00000ff8 + lVar15);
                                    uVar11 = *(undefined8 *)(&stack0x00001000 + lVar15);
                                    uVar12 = *(undefined8 *)(&stack0x00001008 + lVar15);
                                    uVar13 = *(undefined8 *)(&stack0x00001010 + lVar15);
                                    uVar14 = *(undefined8 *)(&stack0x00001018 + lVar15);
                                    puVar19[0xe] = *(undefined8 *)(&stack0x00000fe0 + lVar15);
                                    puVar19[0xf] = uVar16;
                                    puVar19[0x10] = uVar17;
                                    puVar19[0x11] = uVar10;
                                    puVar19[0x12] = uVar11;
                                    puVar19[0x13] = uVar12;
                                    puVar19[0x14] = uVar13;
                                    puVar19[0x15] = uVar14;
                                    uVar16 = *(undefined8 *)(&stack0x00001028 + lVar15);
                                    puVar19[0x16] = *(undefined8 *)(&stack0x00001020 + lVar15);
                                    puVar19[0x17] = uVar16;
                                    uVar16 = *(undefined8 *)(&stack0x00001038 + lVar15);
                                    puVar19[0x18] = *(undefined8 *)(&stack0x00001030 + lVar15);
                                    puVar19[0x19] = uVar16;
                                    uVar16 = *(undefined8 *)(&stack0x00001048 + lVar15);
                                    puVar19[0x1a] = *(undefined8 *)(&stack0x00001040 + lVar15);
                                    puVar19[0x1b] = uVar16;
                                    uVar16 = *(undefined8 *)(&stack0xffffffffffffffe8 + lVar15);
                                    uVar17 = *(undefined8 *)(&stack0xfffffffffffffff0 + lVar15);
                                    uVar10 = *(undefined8 *)(&stack0xfffffffffffffff8 + lVar15);
                                    uVar11 = *(undefined8 *)(&stack0x00000000 + lVar15);
                                    uVar12 = *(undefined8 *)((long)(&stack0x00000000 + lVar15) + 8);
                                    uVar13 = *(undefined8 *)(&stack0x00000010 + lVar15);
                                    uVar14 = *(undefined8 *)(&stack0x00000018 + lVar15);
                                    puVar19[0x1c] =
                                         *(undefined8 *)(&stack0xffffffffffffffe0 + lVar15);
                                    puVar19[0x1d] = uVar16;
                                    puVar19[0x1e] = uVar17;
                                    puVar19[0x1f] = uVar10;
                                    puVar19[0x20] = uVar11;
                                    puVar19[0x21] = uVar12;
                                    puVar19[0x22] = uVar13;
                                    puVar19[0x23] = uVar14;
                                    uVar16 = *(undefined8 *)(&stack0x00000028 + lVar15);
                                    puVar19[0x24] = *(undefined8 *)(&stack0x00000020 + lVar15);
                                    puVar19[0x25] = uVar16;
                                    uVar16 = *(undefined8 *)(&stack0x00000038 + lVar15);
                                    puVar19[0x26] = *(undefined8 *)(&stack0x00000030 + lVar15);
                                    puVar19[0x27] = uVar16;
                                    uVar16 = *(undefined8 *)(&stack0x00000048 + lVar15);
                                    puVar19[0x28] = *puVar4;
                                    puVar19[0x29] = uVar16;
                                    *(undefined8 *)(&stack0xffffffffffffffe8 + lVar15) = 3;
                                    *(undefined8 **)(&stack0xfffffffffffffff0 + lVar15) = puVar19;
                                    *(undefined8 *)(&stack0xfffffffffffffff8 + lVar15) = 3;
                                    *(undefined8 *)(&stack0x00000000 + lVar15) = 0;
                                    *(undefined8 *)(&stack0x00000008 + lVar15) = 8;
                                    *(undefined8 *)(&stack0x00000010 + lVar15) = 0;
                                    *(undefined8 *)(&stack0x00000018 + lVar15) = 0;
                                    *(undefined8 *)(&stack0xffffffffffffffe0 + lVar15) =
                                         0xffffffffffffffff;
                                    *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140273488;
                                    func_0x000144e4f960();
                                    *(undefined8 *)(&stack0x00001040 + lVar15) = *puVar4;
                                    *(undefined8 *)(&stack0x00001048 + lVar15) =
                                         *(undefined8 *)(&stack0x00000048 + lVar15);
                                    *(undefined8 *)(&stack0x00001030 + lVar15) =
                                         *(undefined8 *)(&stack0x00000030 + lVar15);
                                    *(undefined8 *)(&stack0x00001038 + lVar15) =
                                         *(undefined8 *)(&stack0x00000038 + lVar15);
                                    *(undefined8 *)(&stack0x00001020 + lVar15) =
                                         *(undefined8 *)(&stack0x00000020 + lVar15);
                                    *(undefined8 *)(&stack0x00001028 + lVar15) =
                                         *(undefined8 *)(&stack0x00000028 + lVar15);
                                    uVar16 = *(undefined8 *)((long)(&stack0x00000000 + lVar15) + 8);
                                    *(undefined8 *)(&stack0x00001010 + lVar15) =
                                         *(undefined8 *)(&stack0x00000010 + lVar15);
                                    *(undefined8 *)(&stack0x00001018 + lVar15) =
                                         *(undefined8 *)(&stack0x00000018 + lVar15);
                                    *(undefined8 *)(&stack0x00001000 + lVar15) =
                                         *(undefined8 *)(&stack0x00000000 + lVar15);
                                    *(undefined8 *)(&stack0x00001008 + lVar15) = uVar16;
                                    *(undefined8 *)(&stack0x00000ff0 + lVar15) =
                                         *(undefined8 *)(&stack0xfffffffffffffff0 + lVar15);
                                    *(undefined8 *)(&stack0x00000ff8 + lVar15) =
                                         *(undefined8 *)(&stack0xfffffffffffffff8 + lVar15);
                                    *(undefined8 *)(&stack0x00000fe0 + lVar15) =
                                         *(undefined8 *)(&stack0xffffffffffffffe0 + lVar15);
                                    *(undefined8 *)(&stack0x00000fe8 + lVar15) =
                                         *(undefined8 *)(&stack0xffffffffffffffe8 + lVar15);
                                    *(undefined8 *)((long)&uStack_48 + lVar15) = 0x1402734f0;
                                    func_0x000140119ae0();
                                    *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140273503;
                                    func_0x000140011470();
                                    *puVar4 = *(undefined8 *)(&stack0x00001040 + lVar15);
                                    *(undefined8 *)(&stack0x00000048 + lVar15) =
                                         *(undefined8 *)(&stack0x00001048 + lVar15);
                                    *(undefined8 *)(&stack0x00000030 + lVar15) =
                                         *(undefined8 *)(&stack0x00001030 + lVar15);
                                    *(undefined8 *)(&stack0x00000038 + lVar15) =
                                         *(undefined8 *)(&stack0x00001038 + lVar15);
                                    *(undefined8 *)(&stack0x00000020 + lVar15) =
                                         *(undefined8 *)(&stack0x00001020 + lVar15);
                                    *(undefined8 *)(&stack0x00000028 + lVar15) =
                                         *(undefined8 *)(&stack0x00001028 + lVar15);
                                    uVar16 = *(undefined8 *)(&stack0x00000fe0 + lVar15);
                                    uVar17 = *(undefined8 *)(&stack0x00000fe8 + lVar15);
                                    uVar10 = *(undefined8 *)(&stack0x00000ff0 + lVar15);
                                    uVar11 = *(undefined8 *)(&stack0x00000ff8 + lVar15);
                                    *(undefined8 *)(&stack0x00000010 + lVar15) =
                                         *(undefined8 *)(&stack0x00001010 + lVar15);
                                    *(undefined8 *)(&stack0x00000018 + lVar15) =
                                         *(undefined8 *)(&stack0x00001018 + lVar15);
                                    *(undefined8 *)(&stack0x00000000 + lVar15) =
                                         *(undefined8 *)(&stack0x00001000 + lVar15);
                                    *(undefined8 *)((long)(&stack0x00000000 + lVar15) + 8) =
                                         *(undefined8 *)(&stack0x00001008 + lVar15);
                                    *(undefined8 *)(&stack0xfffffffffffffff0 + lVar15) = uVar10;
                                    *(undefined8 *)(&stack0xfffffffffffffff8 + lVar15) = uVar11;
                                    *(undefined8 *)(&stack0xffffffffffffffe0 + lVar15) = uVar16;
                                    *(undefined8 *)(&stack0xffffffffffffffe8 + lVar15) = uVar17;
                                    *(undefined8 *)((long)&uStack_48 + lVar15) = 0x14027355d;
                                    func_0x000140159570();
                                    *(undefined8 *)(&stack0x000000d0 + lVar15) = 0xffffffffffffffff;
                                    *(undefined4 *)(&stack0x00000230 + lVar15) = 0;
                                    (&stack0x00000234)[lVar15] = 0;
                                    *(undefined8 *)((long)&uStack_48 + lVar15) = 0x14027357e;
                                    func_0x000140002200();
                                    *(undefined8 *)((long)&uStack_48 + lVar15) = 0x14027358d;
                                    lVar18 = func_0x0001400021c0();
                                    if (lVar18 != 0) {
                                      *(undefined8 *)((long)&uStack_48 + lVar15) = 0x1402735ab;
                                      func_0x000145bc977b(lVar18);
                                      *(undefined8 *)((long)&uStack_48 + lVar15) = 0x1402735be;
                                      func_0x000144e09040();
                                      *(undefined8 *)((long)&uStack_48 + lVar15) = 0x1402735d9;
                                      func_0x000140119ae0();
                                      *(undefined8 *)((long)&uStack_48 + lVar15) = 0x1402735e9;
                                      func_0x000140011470();
                                      *(undefined8 *)(&stack0x00001040 + lVar15) = *puVar4;
                                      *(undefined8 *)(&stack0x00001048 + lVar15) =
                                           *(undefined8 *)(&stack0x00000048 + lVar15);
                                      *(undefined8 *)(&stack0x00001030 + lVar15) =
                                           *(undefined8 *)(&stack0x00000030 + lVar15);
                                      *(undefined8 *)(&stack0x00001038 + lVar15) =
                                           *(undefined8 *)(&stack0x00000038 + lVar15);
                                      *(undefined8 *)(&stack0x00001020 + lVar15) =
                                           *(undefined8 *)(&stack0x00000020 + lVar15);
                                      *(undefined8 *)(&stack0x00001028 + lVar15) =
                                           *(undefined8 *)(&stack0x00000028 + lVar15);
                                      uVar16 = *(undefined8 *)
                                                ((long)(&stack0x00000000 + lVar15) + 8);
                                      *(undefined8 *)(&stack0x00001010 + lVar15) =
                                           *(undefined8 *)(&stack0x00000010 + lVar15);
                                      *(undefined8 *)(&stack0x00001018 + lVar15) =
                                           *(undefined8 *)(&stack0x00000018 + lVar15);
                                      *(undefined8 *)(&stack0x00001000 + lVar15) =
                                           *(undefined8 *)(&stack0x00000000 + lVar15);
                                      *(undefined8 *)(&stack0x00001008 + lVar15) = uVar16;
                                      *(undefined8 *)(&stack0x00000ff0 + lVar15) =
                                           *(undefined8 *)(&stack0xfffffffffffffff0 + lVar15);
                                      *(undefined8 *)(&stack0x00000ff8 + lVar15) =
                                           *(undefined8 *)(&stack0xfffffffffffffff8 + lVar15);
                                      *(undefined8 *)(&stack0x00000fe0 + lVar15) =
                                           *(undefined8 *)(&stack0xffffffffffffffe0 + lVar15);
                                      *(undefined8 *)(&stack0x00000fe8 + lVar15) =
                                           *(undefined8 *)(&stack0xffffffffffffffe8 + lVar15);
                                      *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140273646;
                                      func_0x000140159570();
                                      return;
                                    }
                                    *(undefined8 *)((long)&uStack_48 + lVar15) = 0x140273824;
                                    func_0x000145d69431();
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
                    /* WARNING: Does not return */
        pcVar6 = (code *)invalidInstructionException();
        (*pcVar6)();
      }
      *(undefined8 *)((long)&uStack_48 + lVar15) = 0x1402736dd;
      func_0x000145d69431();
                    /* WARNING: Does not return */
      pcVar6 = (code *)invalidInstructionException();
      (*pcVar6)();
    }
    uVar31 = uVar31 + lVar28 + 0x10;
    lVar28 = lVar28 + 0x10;
  }
LAB_14027259b:
  uVar34 = 0;
  for (uVar9 = uVar27; (uVar9 & 1) == 0; uVar9 = uVar9 >> 1 | 0x80000000) {
    uVar34 = uVar34 + 1;
  }
  uVar32 = uVar34 + uVar31 & uVar24;
  lVar29 = lVar21 + uVar32 * -0x80;
  auVar42[0] = -(*(char *)(lVar29 + -0x80) == DAT_145dbf500);
  auVar42[1] = -(*(char *)(lVar29 + -0x7f) == cRam0000000145dbf501);
  auVar42[2] = -(*(char *)(lVar29 + -0x7e) == cRam0000000145dbf502);
  auVar42[3] = -(*(char *)(lVar29 + -0x7d) == cRam0000000145dbf503);
  auVar42[4] = -(*(char *)(lVar29 + -0x7c) == cRam0000000145dbf504);
  auVar42[5] = -(*(char *)(lVar29 + -0x7b) == cRam0000000145dbf505);
  auVar42[6] = -(*(char *)(lVar29 + -0x7a) == cRam0000000145dbf506);
  auVar42[7] = -(*(char *)(lVar29 + -0x79) == cRam0000000145dbf507);
  auVar42[8] = -(*(char *)(lVar29 + -0x78) == cRam0000000145dbf508);
  auVar42[9] = -(*(char *)(lVar29 + -0x77) == cRam0000000145dbf509);
  auVar42[10] = -(*(char *)(lVar29 + -0x76) == cRam0000000145dbf50a);
  auVar42[0xb] = -(*(char *)(lVar29 + -0x75) == cRam0000000145dbf50b);
  auVar42[0xc] = -(*(char *)(lVar29 + -0x74) == cRam0000000145dbf50c);
  auVar42[0xd] = -(*(char *)(lVar29 + -0x73) == cRam0000000145dbf50d);
  auVar42[0xe] = -(*(char *)(lVar29 + -0x72) == cRam0000000145dbf50e);
  auVar42[0xf] = -(*(char *)(lVar29 + -0x71) == cRam0000000145dbf50f);
  if ((ushort)((ushort)(SUB161(auVar42 >> 7,0) & 1) | (ushort)(SUB161(auVar42 >> 0xf,0) & 1) << 1 |
               (ushort)(SUB161(auVar42 >> 0x17,0) & 1) << 2 |
               (ushort)(SUB161(auVar42 >> 0x1f,0) & 1) << 3 |
               (ushort)(SUB161(auVar42 >> 0x27,0) & 1) << 4 |
               (ushort)(SUB161(auVar42 >> 0x2f,0) & 1) << 5 |
               (ushort)(SUB161(auVar42 >> 0x37,0) & 1) << 6 |
               (ushort)(SUB161(auVar42 >> 0x3f,0) & 1) << 7 |
               (ushort)(SUB161(auVar42 >> 0x47,0) & 1) << 8 |
               (ushort)(SUB161(auVar42 >> 0x4f,0) & 1) << 9 |
               (ushort)(SUB161(auVar42 >> 0x57,0) & 1) << 10 |
               (ushort)(SUB161(auVar42 >> 0x5f,0) & 1) << 0xb |
               (ushort)(SUB161(auVar42 >> 0x67,0) & 1) << 0xc |
               (ushort)(SUB161(auVar42 >> 0x6f,0) & 1) << 0xd |
               (ushort)(SUB161(auVar42 >> 0x77,0) & 1) << 0xe | (ushort)(auVar42[0xf] >> 7) << 0xf)
      != 0xffff) goto code_r0x0001402725c9;
  uVar24 = uVar32 - 0x10 & uVar24;
  pcVar2 = (char *)(lVar21 + uVar24);
  auVar36[0] = -(*pcVar2 == -1);
  auVar36[1] = -(pcVar2[1] == -1);
  auVar36[2] = -(pcVar2[2] == -1);
  auVar36[3] = -(pcVar2[3] == -1);
  auVar36[4] = -(pcVar2[4] == -1);
  auVar36[5] = -(pcVar2[5] == -1);
  auVar36[6] = -(pcVar2[6] == -1);
  auVar36[7] = -(pcVar2[7] == -1);
  auVar36[8] = -(pcVar2[8] == -1);
  auVar36[9] = -(pcVar2[9] == -1);
  auVar36[10] = -(pcVar2[10] == -1);
  auVar36[0xb] = -(pcVar2[0xb] == -1);
  auVar36[0xc] = -(pcVar2[0xc] == -1);
  auVar36[0xd] = -(pcVar2[0xd] == -1);
  auVar36[0xe] = -(pcVar2[0xe] == -1);
  auVar36[0xf] = -(pcVar2[0xf] == -1);
  uVar7 = (ushort)(SUB161(auVar36 >> 7,0) & 1) | (ushort)(SUB161(auVar36 >> 0xf,0) & 1) << 1 |
          (ushort)(SUB161(auVar36 >> 0x17,0) & 1) << 2 |
          (ushort)(SUB161(auVar36 >> 0x1f,0) & 1) << 3 |
          (ushort)(SUB161(auVar36 >> 0x27,0) & 1) << 4 |
          (ushort)(SUB161(auVar36 >> 0x2f,0) & 1) << 5 |
          (ushort)(SUB161(auVar36 >> 0x37,0) & 1) << 6 |
          (ushort)(SUB161(auVar36 >> 0x3f,0) & 1) << 7 |
          (ushort)(SUB161(auVar36 >> 0x47,0) & 1) << 8 |
          (ushort)(SUB161(auVar36 >> 0x4f,0) & 1) << 9 |
          (ushort)(SUB161(auVar36 >> 0x57,0) & 1) << 10 |
          (ushort)(SUB161(auVar36 >> 0x5f,0) & 1) << 0xb |
          (ushort)(SUB161(auVar36 >> 0x67,0) & 1) << 0xc |
          (ushort)(SUB161(auVar36 >> 0x6f,0) & 1) << 0xd |
          (ushort)(SUB161(auVar36 >> 0x77,0) & 1) << 0xe | (ushort)(auVar36[0xf] >> 7) << 0xf;
  pcVar2 = (char *)(lVar21 + uVar32);
  auVar37[0] = -(*pcVar2 == -1);
  auVar37[1] = -(pcVar2[1] == -1);
  auVar37[2] = -(pcVar2[2] == -1);
  auVar37[3] = -(pcVar2[3] == -1);
  auVar37[4] = -(pcVar2[4] == -1);
  auVar37[5] = -(pcVar2[5] == -1);
  auVar37[6] = -(pcVar2[6] == -1);
  auVar37[7] = -(pcVar2[7] == -1);
  auVar37[8] = -(pcVar2[8] == -1);
  auVar37[9] = -(pcVar2[9] == -1);
  auVar37[10] = -(pcVar2[10] == -1);
  auVar37[0xb] = -(pcVar2[0xb] == -1);
  auVar37[0xc] = -(pcVar2[0xc] == -1);
  auVar37[0xd] = -(pcVar2[0xd] == -1);
  auVar37[0xe] = -(pcVar2[0xe] == -1);
  auVar37[0xf] = -(pcVar2[0xf] == -1);
  uVar30 = 0xf;
  if (uVar7 != 0) {
    for (; uVar7 >> uVar30 == 0; uVar30 = uVar30 - 1) {
    }
  }
  sVar8 = 0;
  for (uVar27 = (ushort)((ushort)(SUB161(auVar37 >> 7,0) & 1) |
                         (ushort)(SUB161(auVar37 >> 0xf,0) & 1) << 1 |
                         (ushort)(SUB161(auVar37 >> 0x17,0) & 1) << 2 |
                         (ushort)(SUB161(auVar37 >> 0x1f,0) & 1) << 3 |
                         (ushort)(SUB161(auVar37 >> 0x27,0) & 1) << 4 |
                         (ushort)(SUB161(auVar37 >> 0x2f,0) & 1) << 5 |
                         (ushort)(SUB161(auVar37 >> 0x37,0) & 1) << 6 |
                         (ushort)(SUB161(auVar37 >> 0x3f,0) & 1) << 7 |
                         (ushort)(SUB161(auVar37 >> 0x47,0) & 1) << 8 |
                         (ushort)(SUB161(auVar37 >> 0x4f,0) & 1) << 9 |
                         (ushort)(SUB161(auVar37 >> 0x57,0) & 1) << 10 |
                         (ushort)(SUB161(auVar37 >> 0x5f,0) & 1) << 0xb |
                         (ushort)(SUB161(auVar37 >> 0x67,0) & 1) << 0xc |
                         (ushort)(SUB161(auVar37 >> 0x6f,0) & 1) << 0xd |
                         (ushort)(SUB161(auVar37 >> 0x77,0) & 1) << 0xe |
                        (ushort)(auVar37[0xf] >> 7) << 0xf) | 0x10000; (uVar27 & 1) == 0;
      uVar27 = uVar27 >> 1 | 0x80000000) {
    sVar8 = sVar8 + 1;
  }
  uVar22 = 0x80;
  if ((ushort)(sVar8 + (uVar30 ^ 0xf)) < 0x10) {
    *(long *)(in_RCX + 0xf0) = *(long *)(in_RCX + 0xf0) + 1;
    uVar22 = 0xff;
  }
  *(undefined1 *)(lVar21 + uVar32) = uVar22;
  *(undefined1 *)(lVar21 + 0x10 + uVar24) = uVar22;
  *(long *)(in_RCX + 0xf8) = *(long *)(in_RCX + 0xf8) + -1;
  lVar21 = *(long *)(lVar29 + -0x70);
  uVar25 = *(undefined4 *)(&stack0x00001068 + lVar15);
  if (lVar21 == 2) goto LAB_1402726a3;
  *(undefined8 *)(&stack0x00000048 + lVar15) = *(undefined8 *)(lVar29 + -8);
  uVar16 = *(undefined8 *)(lVar29 + -0x10);
  *(undefined8 *)(&stack0x00000038 + lVar15) = *(undefined8 *)(lVar29 + -0x18);
  *(undefined8 *)(&stack0x00000040 + lVar15) = uVar16;
  uVar16 = *(undefined8 *)(lVar29 + -0x20);
  *(undefined8 *)(&stack0x00000028 + lVar15) = *(undefined8 *)(lVar29 + -0x28);
  *(undefined8 *)(&stack0x00000030 + lVar15) = uVar16;
  uVar16 = *(undefined8 *)(lVar29 + -0x68);
  uVar17 = *(undefined8 *)(lVar29 + -0x60);
  uVar10 = *(undefined8 *)(lVar29 + -0x58);
  uVar11 = *(undefined8 *)(lVar29 + -0x50);
  uVar12 = *(undefined8 *)(lVar29 + -0x48);
  uVar13 = *(undefined8 *)(lVar29 + -0x40);
  uVar14 = *(undefined8 *)(lVar29 + -0x30);
  *(undefined8 *)(&stack0x00000018 + lVar15) = *(undefined8 *)(lVar29 + -0x38);
  *(undefined8 *)(&stack0x00000020 + lVar15) = uVar14;
  *(undefined8 *)(&stack0x00000008 + lVar15) = uVar12;
  *(undefined8 *)(&stack0x00000010 + lVar15) = uVar13;
  *(undefined8 *)(&stack0xfffffffffffffff8 + lVar15) = uVar10;
  *(undefined8 *)(&stack0x00000000 + lVar15) = uVar11;
  *(undefined8 *)(&stack0xffffffffffffffe8 + lVar15) = uVar16;
  *(undefined8 *)(&stack0xfffffffffffffff0 + lVar15) = uVar17;
  *(long *)(&stack0xffffffffffffffe0 + lVar15) = lVar21;
  *(undefined8 *)((long)&uStack_48 + lVar15) = 0x1402736b5;
  lVar21 = func_0x000144df2330(lVar18,uVar25,&stack0x00000fe0 + lVar15,
                               &stack0xffffffffffffffe0 + lVar15);
  if (*(long *)(&stack0x00000fe0 + lVar15) == 0) goto LAB_140272736;
  goto LAB_140272720;
code_r0x0001402725c9:
  uVar30 = (ushort)(uVar27 - 1) & (ushort)uVar27;
  uVar27 = CONCAT22((short)(uVar27 - 1 >> 0x10),uVar30);
  if (uVar30 == 0) goto LAB_1402725e0;
  goto LAB_14027259b;
}
