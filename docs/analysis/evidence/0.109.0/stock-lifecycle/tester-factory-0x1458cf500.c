/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 *
entry(undefined8 param_1,undefined8 param_2,byte *param_3,undefined8 *param_4,ulong param_5,
     long param_6)

{
  byte *pbVar1;
  byte *pbVar2;
  undefined1 uVar3;
  undefined1 uVar4;
  code *pcVar5;
  long lVar6;
  byte bVar7;
  char cVar8;
  long lVar9;
  long lVar10;
  ulong uVar11;
  undefined4 *puVar12;
  long lVar13;
  long lVar14;
  long lVar15;
  undefined1 *puVar16;
  ulong uVar17;
  ulong uVar18;
  ulong uVar19;
  ulong uVar20;
  long lVar21;
  bool bVar22;
  undefined1 auVar23 [16];
  ulong in_stack_00000028;
  long local_68;
  long local_60;
  long local_58;
  ulong local_50;
  undefined8 local_48;

  local_48 = 0xfffffffffffffffe;
  bVar22 = true;
  if (param_5 < 0x10) {
    if (param_5 == 7) {
      if ((((((byte)(((byte)(DAT_146bdf810 + 0xbf) < 0x1a) << 5 | DAT_146bdf810) ==
              (byte)(((byte)(*param_3 + 0xbf) < 0x1a) << 5 | *param_3)) &&
            ((byte)(((byte)(DAT_146bdf811 + 0xbf) < 0x1a) << 5 | DAT_146bdf811) ==
             (byte)(((byte)(param_3[1] + 0xbf) < 0x1a) << 5 | param_3[1]))) &&
           ((byte)(((byte)(DAT_146bdf812 + 0xbf) < 0x1a) << 5 | DAT_146bdf812) ==
            (byte)(((byte)(param_3[2] + 0xbf) < 0x1a) << 5 | param_3[2]))) &&
          (((byte)(((byte)(DAT_146bdf813 + 0xbf) < 0x1a) << 5 | DAT_146bdf813) ==
            (byte)(((byte)(param_3[3] + 0xbf) < 0x1a) << 5 | param_3[3]) &&
           ((byte)(((byte)(DAT_146bdf814 + 0xbf) < 0x1a) << 5 | DAT_146bdf814) ==
            (byte)(((byte)(param_3[4] + 0xbf) < 0x1a) << 5 | param_3[4]))))) &&
         (((byte)(((byte)(DAT_146bdf815 + 0xbf) < 0x1a) << 5 | DAT_146bdf815) ==
           (byte)(((byte)(param_3[5] + 0xbf) < 0x1a) << 5 | param_3[5]) &&
          ((byte)(((byte)(DAT_146bdf816 + 0xbf) < 0x1a) << 5 | DAT_146bdf816) ==
           (byte)(((byte)(param_3[6] + 0xbf) < 0x1a) << 5 | param_3[6]))))) {
        lVar13 = 0x146be06e8;
        bVar22 = false;
        goto LAB_1458d01a7;
      }
      if (((((byte)(((byte)(DAT_146bdf9a7 + 0xbf) < 0x1a) << 5 | DAT_146bdf9a7) ==
             (byte)(((byte)(*param_3 + 0xbf) < 0x1a) << 5 | *param_3)) &&
           ((byte)(((byte)(DAT_146bdf9a8 + 0xbf) < 0x1a) << 5 | DAT_146bdf9a8) ==
            (byte)(((byte)(param_3[1] + 0xbf) < 0x1a) << 5 | param_3[1]))) &&
          (((byte)(((byte)(DAT_146bdf9a9 + 0xbf) < 0x1a) << 5 | DAT_146bdf9a9) ==
            (byte)(((byte)(param_3[2] + 0xbf) < 0x1a) << 5 | param_3[2]) &&
           ((((byte)(((byte)(DAT_146bdf9aa + 0xbf) < 0x1a) << 5 | DAT_146bdf9aa) ==
              (byte)(((byte)(param_3[3] + 0xbf) < 0x1a) << 5 | param_3[3]) &&
             ((byte)(((byte)(DAT_146bdf9ab + 0xbf) < 0x1a) << 5 | DAT_146bdf9ab) ==
              (byte)(((byte)(param_3[4] + 0xbf) < 0x1a) << 5 | param_3[4]))) &&
            ((byte)(((byte)(DAT_146bdf9ac + 0xbf) < 0x1a) << 5 | DAT_146bdf9ac) ==
             (byte)(((byte)(param_3[5] + 0xbf) < 0x1a) << 5 | param_3[5]))))))) &&
         ((byte)(((byte)(DAT_146bdf9ad + 0xbf) < 0x1a) << 5 | DAT_146bdf9ad) ==
          (byte)(((byte)(param_3[6] + 0xbf) < 0x1a) << 5 | param_3[6]))) {
        lVar13 = 0x146be0778;
        bVar22 = false;
        goto LAB_1458d01a7;
      }
    }
    if (((param_5 == 6) &&
        ((byte)(((byte)(DAT_146bdfb55 + 0xbf) < 0x1a) << 5 | DAT_146bdfb55) ==
         (byte)(((byte)(*param_3 + 0xbf) < 0x1a) << 5 | *param_3))) &&
       (((((byte)(((byte)(DAT_146bdfb56 + 0xbf) < 0x1a) << 5 | DAT_146bdfb56) ==
           (byte)(((byte)(param_3[1] + 0xbf) < 0x1a) << 5 | param_3[1]) &&
          (((byte)(((byte)(DAT_146bdfb57 + 0xbf) < 0x1a) << 5 | DAT_146bdfb57) ==
            (byte)(((byte)(param_3[2] + 0xbf) < 0x1a) << 5 | param_3[2]) &&
           ((byte)(((byte)(DAT_146bdfb58 + 0xbf) < 0x1a) << 5 | DAT_146bdfb58) ==
            (byte)(((byte)(param_3[3] + 0xbf) < 0x1a) << 5 | param_3[3]))))) &&
         ((byte)(((byte)(DAT_146bdfb59 + 0xbf) < 0x1a) << 5 | DAT_146bdfb59) ==
          (byte)(((byte)(param_3[4] + 0xbf) < 0x1a) << 5 | param_3[4]))) &&
        ((byte)(((byte)(DAT_146bdfb5a + 0xbf) < 0x1a) << 5 | DAT_146bdfb5a) ==
         (byte)(((byte)(param_3[5] + 0xbf) < 0x1a) << 5 | param_3[5]))))) {
      lVar13 = 0x146be0808;
      bVar22 = false;
      goto LAB_1458d01a7;
    }
    if ((((param_5 == 5) &&
         ((byte)(((byte)(DAT_146bdfcf7 + 0xbf) < 0x1a) << 5 | DAT_146bdfcf7) ==
          (byte)(((byte)(*param_3 + 0xbf) < 0x1a) << 5 | *param_3))) &&
        ((byte)(((byte)(DAT_146bdfcf8 + 0xbf) < 0x1a) << 5 | DAT_146bdfcf8) ==
         (byte)(((byte)(param_3[1] + 0xbf) < 0x1a) << 5 | param_3[1]))) &&
       ((((byte)(((byte)(DAT_146bdfcf9 + 0xbf) < 0x1a) << 5 | DAT_146bdfcf9) ==
          (byte)(((byte)(param_3[2] + 0xbf) < 0x1a) << 5 | param_3[2]) &&
         ((byte)(((byte)(DAT_146bdfcfa + 0xbf) < 0x1a) << 5 | DAT_146bdfcfa) ==
          (byte)(((byte)(param_3[3] + 0xbf) < 0x1a) << 5 | param_3[3]))) &&
        ((byte)(((byte)(DAT_146bdfcfb + 0xbf) < 0x1a) << 5 | DAT_146bdfcfb) ==
         (byte)(((byte)(param_3[4] + 0xbf) < 0x1a) << 5 | param_3[4]))))) {
      lVar13 = 0x146be0898;
      bVar22 = false;
      goto LAB_1458d01a7;
    }
    if (param_5 == 6) {
      if ((((byte)(((byte)(DAT_146bdfe96 + 0xbf) < 0x1a) << 5 | DAT_146bdfe96) ==
            (byte)(((byte)(*param_3 + 0xbf) < 0x1a) << 5 | *param_3)) &&
          ((byte)(((byte)(DAT_146bdfe97 + 0xbf) < 0x1a) << 5 | DAT_146bdfe97) ==
           (byte)(((byte)(param_3[1] + 0xbf) < 0x1a) << 5 | param_3[1]))) &&
         (((byte)(((byte)(DAT_146bdfe98 + 0xbf) < 0x1a) << 5 | DAT_146bdfe98) ==
           (byte)(((byte)(param_3[2] + 0xbf) < 0x1a) << 5 | param_3[2]) &&
          ((((byte)(((byte)(DAT_146bdfe99 + 0xbf) < 0x1a) << 5 | DAT_146bdfe99) ==
             (byte)(((byte)(param_3[3] + 0xbf) < 0x1a) << 5 | param_3[3]) &&
            ((byte)(((byte)(DAT_146bdfe9a + 0xbf) < 0x1a) << 5 | DAT_146bdfe9a) ==
             (byte)(((byte)(param_3[4] + 0xbf) < 0x1a) << 5 | param_3[4]))) &&
           ((byte)(((byte)(DAT_146bdfe9b + 0xbf) < 0x1a) << 5 | DAT_146bdfe9b) ==
            (byte)(((byte)(param_3[5] + 0xbf) < 0x1a) << 5 | param_3[5]))))))) {
        lVar13 = 0x146be0928;
        bVar22 = false;
        goto LAB_1458d01a7;
      }
      if (((((byte)(((byte)(DAT_146be001b + 0xbf) < 0x1a) << 5 | DAT_146be001b) ==
             (byte)(((byte)(*param_3 + 0xbf) < 0x1a) << 5 | *param_3)) &&
           ((byte)(((byte)(DAT_146be001c + 0xbf) < 0x1a) << 5 | DAT_146be001c) ==
            (byte)(((byte)(param_3[1] + 0xbf) < 0x1a) << 5 | param_3[1]))) &&
          (((byte)(((byte)(DAT_146be001d + 0xbf) < 0x1a) << 5 | DAT_146be001d) ==
            (byte)(((byte)(param_3[2] + 0xbf) < 0x1a) << 5 | param_3[2]) &&
           (((byte)(((byte)(DAT_146be001e + 0xbf) < 0x1a) << 5 | DAT_146be001e) ==
             (byte)(((byte)(param_3[3] + 0xbf) < 0x1a) << 5 | param_3[3]) &&
            ((byte)(((byte)(DAT_146be001f + 0xbf) < 0x1a) << 5 | DAT_146be001f) ==
             (byte)(((byte)(param_3[4] + 0xbf) < 0x1a) << 5 | param_3[4]))))))) &&
         ((byte)(((byte)(DAT_146be0020 + 0xbf) < 0x1a) << 5 | DAT_146be0020) ==
          (byte)(((byte)(param_3[5] + 0xbf) < 0x1a) << 5 | param_3[5]))) {
        lVar13 = 0x146be09b8;
        bVar22 = false;
        goto LAB_1458d01a7;
      }
    }
    if ((((param_5 == 4) &&
         ((byte)(((byte)(DAT_146be01c0 + 0xbf) < 0x1a) << 5 | DAT_146be01c0) ==
          (byte)(((byte)(*param_3 + 0xbf) < 0x1a) << 5 | *param_3))) &&
        ((byte)(((byte)(DAT_146be01c1 + 0xbf) < 0x1a) << 5 | DAT_146be01c1) ==
         (byte)(((byte)(param_3[1] + 0xbf) < 0x1a) << 5 | param_3[1]))) &&
       (((byte)(((byte)(DAT_146be01c2 + 0xbf) < 0x1a) << 5 | DAT_146be01c2) ==
         (byte)(((byte)(param_3[2] + 0xbf) < 0x1a) << 5 | param_3[2]) &&
        ((byte)(((byte)(DAT_146be01c3 + 0xbf) < 0x1a) << 5 | DAT_146be01c3) ==
         (byte)(((byte)(param_3[3] + 0xbf) < 0x1a) << 5 | param_3[3]))))) {
      lVar13 = 0x146be0a48;
      bVar22 = false;
      goto LAB_1458d01a7;
    }
    if ((((param_5 == 7) &&
         ((byte)(((byte)(DAT_146be038c + 0xbf) < 0x1a) << 5 | DAT_146be038c) ==
          (byte)(((byte)(*param_3 + 0xbf) < 0x1a) << 5 | *param_3))) &&
        (((byte)(((byte)(DAT_146be038d + 0xbf) < 0x1a) << 5 | DAT_146be038d) ==
          (byte)(((byte)(param_3[1] + 0xbf) < 0x1a) << 5 | param_3[1]) &&
         ((((byte)(((byte)(DAT_146be038e + 0xbf) < 0x1a) << 5 | DAT_146be038e) ==
            (byte)(((byte)(param_3[2] + 0xbf) < 0x1a) << 5 | param_3[2]) &&
           ((byte)(((byte)(DAT_146be038f + 0xbf) < 0x1a) << 5 | DAT_146be038f) ==
            (byte)(((byte)(param_3[3] + 0xbf) < 0x1a) << 5 | param_3[3]))) &&
          ((byte)(((byte)(DAT_146be0390 + 0xbf) < 0x1a) << 5 | DAT_146be0390) ==
           (byte)(((byte)(param_3[4] + 0xbf) < 0x1a) << 5 | param_3[4]))))))) &&
       ((byte)(((byte)(DAT_146be0391 + 0xbf) < 0x1a) << 5 | DAT_146be0391) ==
        (byte)(((byte)(param_3[5] + 0xbf) < 0x1a) << 5 | param_3[5]))) {
      lVar13 = 0;
      bVar22 = (byte)(((byte)(DAT_146be0392 + 0xbf) < 0x1a) << 5 | DAT_146be0392) !=
               (byte)(((byte)(param_3[6] + 0xbf) < 0x1a) << 5 | param_3[6]);
      if (!bVar22) {
        lVar13 = 0x146be0ad8;
      }
      goto LAB_1458d01a7;
    }
    if (((param_5 == 5) &&
        ((byte)(((byte)(DAT_146be0548 + 0xbf) < 0x1a) << 5 | DAT_146be0548) ==
         (byte)(((byte)(*param_3 + 0xbf) < 0x1a) << 5 | *param_3))) &&
       (((byte)(((byte)(DAT_146be0549 + 0xbf) < 0x1a) << 5 | DAT_146be0549) ==
         (byte)(((byte)(param_3[1] + 0xbf) < 0x1a) << 5 | param_3[1]) &&
        (((byte)(((byte)(DAT_146be054a + 0xbf) < 0x1a) << 5 | DAT_146be054a) ==
          (byte)(((byte)(param_3[2] + 0xbf) < 0x1a) << 5 | param_3[2]) &&
         ((byte)(((byte)(DAT_146be054b + 0xbf) < 0x1a) << 5 | DAT_146be054b) ==
          (byte)(((byte)(param_3[3] + 0xbf) < 0x1a) << 5 | param_3[3]))))))) {
      lVar13 = 0;
      bVar22 = (byte)(((byte)(DAT_146be054c + 0xbf) < 0x1a) << 5 | DAT_146be054c) !=
               (byte)(((byte)(param_3[4] + 0xbf) < 0x1a) << 5 | param_3[4]);
      if (!bVar22) {
        lVar13 = 0x146be0b68;
      }
      goto LAB_1458d01a7;
    }
  }
  lVar13 = 0;
LAB_1458d01a7:
  lVar15 = 0x146be06e8;
  if (!bVar22) {
    lVar15 = lVar13;
  }
  bVar7 = *(char *)(lVar15 + 0x8c) - 1;
  if (bVar7 < 0xb) {
    puVar16 = (undefined1 *)((long)*(int *)((ulong)bVar7 * 4 + 0x146bec510) + 0x146bec510);
    lVar13 = *(long *)((ulong)bVar7 * 8 + 0x146bec540);
  }
  else {
    lVar13 = 1;
    puVar16 = (undefined1 *)0x146bec3b0;
  }
  lVar9 = 0;
  do {
    lVar14 = *(long *)(lVar9 + 0x146bdf550);
    uVar11 = *(ulong *)(lVar9 + 0x146bdf558);
    lVar10 = lVar9 + 0x58;
    local_68 = 0;
    local_60 = 1;
    lVar21 = 0;
    uVar20 = 0;
    while (uVar17 = uVar11 - uVar20, uVar18 = uVar20, local_58 = lVar21, local_50 = uVar20,
          uVar20 <= uVar11) {
      while( true ) {
        if (uVar11 - uVar18 < 0x10) {
          uVar19 = 0;
          if (uVar11 == uVar18) goto LAB_1458d0370;
          while (*(char *)(lVar14 + uVar18 + uVar19) != ' ') {
            uVar19 = uVar19 + 1;
            if (uVar11 - uVar18 == uVar19) goto LAB_1458d0370;
          }
        }
        else {
          auVar23 = func_0x000145bd5860();
          uVar19 = auVar23._8_8_;
          if (auVar23._0_8_ != 1) goto LAB_1458d0370;
        }
        uVar20 = uVar19 + uVar18 + 1;
        uVar19 = uVar19 + uVar18;
        if ((uVar19 < uVar11) && (*(char *)(lVar14 + uVar19) == ' ')) break;
        uVar18 = uVar20;
        if (uVar11 < uVar20) goto LAB_1458d0370;
      }
      uVar18 = uVar19 - local_50;
      if ((ulong)(local_68 - lVar21) < uVar18) {
        func_0x000145bfa970(uVar20,uVar19,lVar21,&local_68,uVar18,1);
        lVar21 = local_58;
        if (uVar19 != local_50) goto LAB_1458d031a;
      }
      else if (uVar19 != local_50) {
LAB_1458d031a:
        func_0x000145bfa0e7();
      }
      lVar21 = lVar21 + uVar18;
    }
LAB_1458d0370:
    lVar14 = local_60;
    if ((ulong)(local_68 - lVar21) < uVar17) {
      func_0x000145bfa970();
      lVar14 = local_60;
      lVar21 = local_58;
    }
    local_60 = lVar14;
    if (uVar11 != local_50) {
      func_0x000145bfa0e7();
    }
    lVar6 = local_68;
    if (lVar21 + uVar17 == in_stack_00000028) {
      if (in_stack_00000028 < 0x10) {
        uVar11 = 0;
        do {
          if (in_stack_00000028 == uVar11) goto LAB_1458d03db;
          pbVar1 = (byte *)(lVar14 + uVar11);
          pbVar2 = (byte *)(param_6 + uVar11);
          uVar11 = uVar11 + 1;
        } while ((byte)(((byte)(*pbVar1 + 0xbf) < 0x1a) << 5 | *pbVar1) ==
                 (byte)(((byte)(*pbVar2 + 0xbf) < 0x1a) << 5 | *pbVar2));
      }
      else {
        cVar8 = func_0x000140179390();
        if (cVar8 != '\0') {
LAB_1458d03db:
          if (lVar6 != 0) {
            func_0x0001400021d0();
          }
          lVar14 = 0;
          do {
            if (puVar16[lVar14] == (&DAT_146bdf5a0)[lVar9]) {
              puVar16 = &DAT_146bdf5a0 + lVar9;
              goto LAB_1458d04cf;
            }
            lVar14 = lVar14 + 1;
          } while (lVar13 != lVar14);
          goto LAB_1458d0200;
        }
      }
    }
    if (lVar6 != 0) {
      func_0x0001400021d0();
    }
LAB_1458d0200:
    lVar9 = lVar10;
    if (lVar10 == 0x2c0) {
LAB_1458d04cf:
      uVar3 = *puVar16;
      func_0x000140002200();
      puVar12 = (undefined4 *)func_0x0001400021c0();
      if (puVar12 == (undefined4 *)0x0) {
        func_0x000145d992bb();
                    /* WARNING: Does not return */
        pcVar5 = (code *)invalidInstructionException();
        (*pcVar5)();
      }
      *(undefined2 *)(puVar12 + 1) = 0x7265;
      *puVar12 = 0x74736554;
      uVar4 = *(undefined1 *)(lVar15 + 0x8c);
      *(undefined1 *)((long)param_4 + 0x37) = 0;
      *(undefined4 *)((long)param_4 + 0x33) = 0;
      param_4[3] = 0xffffff;
      *param_4 = 6;
      param_4[1] = puVar12;
      param_4[2] = 6;
      *(undefined1 *)(param_4 + 6) = uVar3;
      *(undefined1 *)((long)param_4 + 0x31) = uVar4;
      *(undefined1 *)((long)param_4 + 0x32) = 0;
      *(undefined1 (*) [16])(param_4 + 4) = ZEXT416(_DAT_145deb120);
      return param_4;
    }
  } while( true );
}
