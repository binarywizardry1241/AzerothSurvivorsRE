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
      if ((((((byte)(((byte)(DAT_146bd8610 + 0xbf) < 0x1a) << 5 | DAT_146bd8610) ==
              (byte)(((byte)(*param_3 + 0xbf) < 0x1a) << 5 | *param_3)) &&
            ((byte)(((byte)(DAT_146bd8611 + 0xbf) < 0x1a) << 5 | DAT_146bd8611) ==
             (byte)(((byte)(param_3[1] + 0xbf) < 0x1a) << 5 | param_3[1]))) &&
           ((byte)(((byte)(DAT_146bd8612 + 0xbf) < 0x1a) << 5 | DAT_146bd8612) ==
            (byte)(((byte)(param_3[2] + 0xbf) < 0x1a) << 5 | param_3[2]))) &&
          (((byte)(((byte)(DAT_146bd8613 + 0xbf) < 0x1a) << 5 | DAT_146bd8613) ==
            (byte)(((byte)(param_3[3] + 0xbf) < 0x1a) << 5 | param_3[3]) &&
           ((byte)(((byte)(DAT_146bd8614 + 0xbf) < 0x1a) << 5 | DAT_146bd8614) ==
            (byte)(((byte)(param_3[4] + 0xbf) < 0x1a) << 5 | param_3[4]))))) &&
         (((byte)(((byte)(DAT_146bd8615 + 0xbf) < 0x1a) << 5 | DAT_146bd8615) ==
           (byte)(((byte)(param_3[5] + 0xbf) < 0x1a) << 5 | param_3[5]) &&
          ((byte)(((byte)(DAT_146bd8616 + 0xbf) < 0x1a) << 5 | DAT_146bd8616) ==
           (byte)(((byte)(param_3[6] + 0xbf) < 0x1a) << 5 | param_3[6]))))) {
        lVar13 = 0x146bd94e8;
        bVar22 = false;
        goto LAB_1458ab117;
      }
      if (((((byte)(((byte)(DAT_146bd87a7 + 0xbf) < 0x1a) << 5 | DAT_146bd87a7) ==
             (byte)(((byte)(*param_3 + 0xbf) < 0x1a) << 5 | *param_3)) &&
           ((byte)(((byte)(DAT_146bd87a8 + 0xbf) < 0x1a) << 5 | DAT_146bd87a8) ==
            (byte)(((byte)(param_3[1] + 0xbf) < 0x1a) << 5 | param_3[1]))) &&
          (((byte)(((byte)(DAT_146bd87a9 + 0xbf) < 0x1a) << 5 | DAT_146bd87a9) ==
            (byte)(((byte)(param_3[2] + 0xbf) < 0x1a) << 5 | param_3[2]) &&
           ((((byte)(((byte)(DAT_146bd87aa + 0xbf) < 0x1a) << 5 | DAT_146bd87aa) ==
              (byte)(((byte)(param_3[3] + 0xbf) < 0x1a) << 5 | param_3[3]) &&
             ((byte)(((byte)(DAT_146bd87ab + 0xbf) < 0x1a) << 5 | DAT_146bd87ab) ==
              (byte)(((byte)(param_3[4] + 0xbf) < 0x1a) << 5 | param_3[4]))) &&
            ((byte)(((byte)(DAT_146bd87ac + 0xbf) < 0x1a) << 5 | DAT_146bd87ac) ==
             (byte)(((byte)(param_3[5] + 0xbf) < 0x1a) << 5 | param_3[5]))))))) &&
         ((byte)(((byte)(DAT_146bd87ad + 0xbf) < 0x1a) << 5 | DAT_146bd87ad) ==
          (byte)(((byte)(param_3[6] + 0xbf) < 0x1a) << 5 | param_3[6]))) {
        lVar13 = 0x146bd9578;
        bVar22 = false;
        goto LAB_1458ab117;
      }
    }
    if (((param_5 == 6) &&
        ((byte)(((byte)(DAT_146bd8955 + 0xbf) < 0x1a) << 5 | DAT_146bd8955) ==
         (byte)(((byte)(*param_3 + 0xbf) < 0x1a) << 5 | *param_3))) &&
       (((((byte)(((byte)(DAT_146bd8956 + 0xbf) < 0x1a) << 5 | DAT_146bd8956) ==
           (byte)(((byte)(param_3[1] + 0xbf) < 0x1a) << 5 | param_3[1]) &&
          (((byte)(((byte)(DAT_146bd8957 + 0xbf) < 0x1a) << 5 | DAT_146bd8957) ==
            (byte)(((byte)(param_3[2] + 0xbf) < 0x1a) << 5 | param_3[2]) &&
           ((byte)(((byte)(DAT_146bd8958 + 0xbf) < 0x1a) << 5 | DAT_146bd8958) ==
            (byte)(((byte)(param_3[3] + 0xbf) < 0x1a) << 5 | param_3[3]))))) &&
         ((byte)(((byte)(DAT_146bd8959 + 0xbf) < 0x1a) << 5 | DAT_146bd8959) ==
          (byte)(((byte)(param_3[4] + 0xbf) < 0x1a) << 5 | param_3[4]))) &&
        ((byte)(((byte)(DAT_146bd895a + 0xbf) < 0x1a) << 5 | DAT_146bd895a) ==
         (byte)(((byte)(param_3[5] + 0xbf) < 0x1a) << 5 | param_3[5]))))) {
      lVar13 = 0x146bd9608;
      bVar22 = false;
      goto LAB_1458ab117;
    }
    if ((((param_5 == 5) &&
         ((byte)(((byte)(DAT_146bd8af7 + 0xbf) < 0x1a) << 5 | DAT_146bd8af7) ==
          (byte)(((byte)(*param_3 + 0xbf) < 0x1a) << 5 | *param_3))) &&
        ((byte)(((byte)(DAT_146bd8af8 + 0xbf) < 0x1a) << 5 | DAT_146bd8af8) ==
         (byte)(((byte)(param_3[1] + 0xbf) < 0x1a) << 5 | param_3[1]))) &&
       ((((byte)(((byte)(DAT_146bd8af9 + 0xbf) < 0x1a) << 5 | DAT_146bd8af9) ==
          (byte)(((byte)(param_3[2] + 0xbf) < 0x1a) << 5 | param_3[2]) &&
         ((byte)(((byte)(DAT_146bd8afa + 0xbf) < 0x1a) << 5 | DAT_146bd8afa) ==
          (byte)(((byte)(param_3[3] + 0xbf) < 0x1a) << 5 | param_3[3]))) &&
        ((byte)(((byte)(DAT_146bd8afb + 0xbf) < 0x1a) << 5 | DAT_146bd8afb) ==
         (byte)(((byte)(param_3[4] + 0xbf) < 0x1a) << 5 | param_3[4]))))) {
      lVar13 = 0x146bd9698;
      bVar22 = false;
      goto LAB_1458ab117;
    }
    if (param_5 == 6) {
      if ((((byte)(((byte)(DAT_146bd8c96 + 0xbf) < 0x1a) << 5 | DAT_146bd8c96) ==
            (byte)(((byte)(*param_3 + 0xbf) < 0x1a) << 5 | *param_3)) &&
          ((byte)(((byte)(DAT_146bd8c97 + 0xbf) < 0x1a) << 5 | DAT_146bd8c97) ==
           (byte)(((byte)(param_3[1] + 0xbf) < 0x1a) << 5 | param_3[1]))) &&
         (((byte)(((byte)(DAT_146bd8c98 + 0xbf) < 0x1a) << 5 | DAT_146bd8c98) ==
           (byte)(((byte)(param_3[2] + 0xbf) < 0x1a) << 5 | param_3[2]) &&
          ((((byte)(((byte)(DAT_146bd8c99 + 0xbf) < 0x1a) << 5 | DAT_146bd8c99) ==
             (byte)(((byte)(param_3[3] + 0xbf) < 0x1a) << 5 | param_3[3]) &&
            ((byte)(((byte)(DAT_146bd8c9a + 0xbf) < 0x1a) << 5 | DAT_146bd8c9a) ==
             (byte)(((byte)(param_3[4] + 0xbf) < 0x1a) << 5 | param_3[4]))) &&
           ((byte)(((byte)(DAT_146bd8c9b + 0xbf) < 0x1a) << 5 | DAT_146bd8c9b) ==
            (byte)(((byte)(param_3[5] + 0xbf) < 0x1a) << 5 | param_3[5]))))))) {
        lVar13 = 0x146bd9728;
        bVar22 = false;
        goto LAB_1458ab117;
      }
      if (((((byte)(((byte)(DAT_146bd8e1b + 0xbf) < 0x1a) << 5 | DAT_146bd8e1b) ==
             (byte)(((byte)(*param_3 + 0xbf) < 0x1a) << 5 | *param_3)) &&
           ((byte)(((byte)(DAT_146bd8e1c + 0xbf) < 0x1a) << 5 | DAT_146bd8e1c) ==
            (byte)(((byte)(param_3[1] + 0xbf) < 0x1a) << 5 | param_3[1]))) &&
          (((byte)(((byte)(DAT_146bd8e1d + 0xbf) < 0x1a) << 5 | DAT_146bd8e1d) ==
            (byte)(((byte)(param_3[2] + 0xbf) < 0x1a) << 5 | param_3[2]) &&
           (((byte)(((byte)(DAT_146bd8e1e + 0xbf) < 0x1a) << 5 | DAT_146bd8e1e) ==
             (byte)(((byte)(param_3[3] + 0xbf) < 0x1a) << 5 | param_3[3]) &&
            ((byte)(((byte)(DAT_146bd8e1f + 0xbf) < 0x1a) << 5 | DAT_146bd8e1f) ==
             (byte)(((byte)(param_3[4] + 0xbf) < 0x1a) << 5 | param_3[4]))))))) &&
         ((byte)(((byte)(DAT_146bd8e20 + 0xbf) < 0x1a) << 5 | DAT_146bd8e20) ==
          (byte)(((byte)(param_3[5] + 0xbf) < 0x1a) << 5 | param_3[5]))) {
        lVar13 = 0x146bd97b8;
        bVar22 = false;
        goto LAB_1458ab117;
      }
    }
    if ((((param_5 == 4) &&
         ((byte)(((byte)(DAT_146bd8fc0 + 0xbf) < 0x1a) << 5 | DAT_146bd8fc0) ==
          (byte)(((byte)(*param_3 + 0xbf) < 0x1a) << 5 | *param_3))) &&
        ((byte)(((byte)(DAT_146bd8fc1 + 0xbf) < 0x1a) << 5 | DAT_146bd8fc1) ==
         (byte)(((byte)(param_3[1] + 0xbf) < 0x1a) << 5 | param_3[1]))) &&
       (((byte)(((byte)(DAT_146bd8fc2 + 0xbf) < 0x1a) << 5 | DAT_146bd8fc2) ==
         (byte)(((byte)(param_3[2] + 0xbf) < 0x1a) << 5 | param_3[2]) &&
        ((byte)(((byte)(DAT_146bd8fc3 + 0xbf) < 0x1a) << 5 | DAT_146bd8fc3) ==
         (byte)(((byte)(param_3[3] + 0xbf) < 0x1a) << 5 | param_3[3]))))) {
      lVar13 = 0x146bd9848;
      bVar22 = false;
      goto LAB_1458ab117;
    }
    if ((((param_5 == 7) &&
         ((byte)(((byte)(DAT_146bd918c + 0xbf) < 0x1a) << 5 | DAT_146bd918c) ==
          (byte)(((byte)(*param_3 + 0xbf) < 0x1a) << 5 | *param_3))) &&
        (((byte)(((byte)(DAT_146bd918d + 0xbf) < 0x1a) << 5 | DAT_146bd918d) ==
          (byte)(((byte)(param_3[1] + 0xbf) < 0x1a) << 5 | param_3[1]) &&
         ((((byte)(((byte)(DAT_146bd918e + 0xbf) < 0x1a) << 5 | DAT_146bd918e) ==
            (byte)(((byte)(param_3[2] + 0xbf) < 0x1a) << 5 | param_3[2]) &&
           ((byte)(((byte)(DAT_146bd918f + 0xbf) < 0x1a) << 5 | DAT_146bd918f) ==
            (byte)(((byte)(param_3[3] + 0xbf) < 0x1a) << 5 | param_3[3]))) &&
          ((byte)(((byte)(DAT_146bd9190 + 0xbf) < 0x1a) << 5 | DAT_146bd9190) ==
           (byte)(((byte)(param_3[4] + 0xbf) < 0x1a) << 5 | param_3[4]))))))) &&
       ((byte)(((byte)(DAT_146bd9191 + 0xbf) < 0x1a) << 5 | DAT_146bd9191) ==
        (byte)(((byte)(param_3[5] + 0xbf) < 0x1a) << 5 | param_3[5]))) {
      lVar13 = 0;
      bVar22 = (byte)(((byte)(DAT_146bd9192 + 0xbf) < 0x1a) << 5 | DAT_146bd9192) !=
               (byte)(((byte)(param_3[6] + 0xbf) < 0x1a) << 5 | param_3[6]);
      if (!bVar22) {
        lVar13 = 0x146bd98d8;
      }
      goto LAB_1458ab117;
    }
    if (((param_5 == 5) &&
        ((byte)(((byte)(DAT_146bd9348 + 0xbf) < 0x1a) << 5 | DAT_146bd9348) ==
         (byte)(((byte)(*param_3 + 0xbf) < 0x1a) << 5 | *param_3))) &&
       (((byte)(((byte)(DAT_146bd9349 + 0xbf) < 0x1a) << 5 | DAT_146bd9349) ==
         (byte)(((byte)(param_3[1] + 0xbf) < 0x1a) << 5 | param_3[1]) &&
        (((byte)(((byte)(DAT_146bd934a + 0xbf) < 0x1a) << 5 | DAT_146bd934a) ==
          (byte)(((byte)(param_3[2] + 0xbf) < 0x1a) << 5 | param_3[2]) &&
         ((byte)(((byte)(DAT_146bd934b + 0xbf) < 0x1a) << 5 | DAT_146bd934b) ==
          (byte)(((byte)(param_3[3] + 0xbf) < 0x1a) << 5 | param_3[3]))))))) {
      lVar13 = 0;
      bVar22 = (byte)(((byte)(DAT_146bd934c + 0xbf) < 0x1a) << 5 | DAT_146bd934c) !=
               (byte)(((byte)(param_3[4] + 0xbf) < 0x1a) << 5 | param_3[4]);
      if (!bVar22) {
        lVar13 = 0x146bd9968;
      }
      goto LAB_1458ab117;
    }
  }
  lVar13 = 0;
LAB_1458ab117:
  lVar15 = 0x146bd94e8;
  if (!bVar22) {
    lVar15 = lVar13;
  }
  bVar7 = *(char *)(lVar15 + 0x8c) - 1;
  if (bVar7 < 0xb) {
    puVar16 = (undefined1 *)((long)*(int *)((ulong)bVar7 * 4 + 0x146be7698) + 0x146be7698);
    lVar13 = *(long *)((ulong)bVar7 * 8 + 0x146be76c8);
  }
  else {
    lVar13 = 1;
    puVar16 = (undefined1 *)0x146be7520;
  }
  lVar9 = 0;
  do {
    lVar14 = *(long *)(lVar9 + 0x146bd8350);
    uVar11 = *(ulong *)(lVar9 + 0x146bd8358);
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
          if (uVar11 == uVar18) goto LAB_1458ab2e0;
          while (*(char *)(lVar14 + uVar18 + uVar19) != ' ') {
            uVar19 = uVar19 + 1;
            if (uVar11 - uVar18 == uVar19) goto LAB_1458ab2e0;
          }
        }
        else {
          auVar23 = func_0x000145bcd4c0();
          uVar19 = auVar23._8_8_;
          if (auVar23._0_8_ != 1) goto LAB_1458ab2e0;
        }
        uVar20 = uVar19 + uVar18 + 1;
        uVar19 = uVar19 + uVar18;
        if ((uVar19 < uVar11) && (*(char *)(lVar14 + uVar19) == ' ')) break;
        uVar18 = uVar20;
        if (uVar11 < uVar20) goto LAB_1458ab2e0;
      }
      uVar18 = uVar19 - local_50;
      if ((ulong)(local_68 - lVar21) < uVar18) {
        func_0x000145bf3940(uVar20,uVar19,lVar21,&local_68,uVar18,1);
        lVar21 = local_58;
        if (uVar19 != local_50) goto LAB_1458ab28a;
      }
      else if (uVar19 != local_50) {
LAB_1458ab28a:
        func_0x000145bf1d41();
      }
      lVar21 = lVar21 + uVar18;
    }
LAB_1458ab2e0:
    lVar14 = local_60;
    if ((ulong)(local_68 - lVar21) < uVar17) {
      func_0x000145bf3940();
      lVar14 = local_60;
      lVar21 = local_58;
    }
    local_60 = lVar14;
    if (uVar11 != local_50) {
      func_0x000145bf1d41();
    }
    lVar6 = local_68;
    if (lVar21 + uVar17 == in_stack_00000028) {
      if (in_stack_00000028 < 0x10) {
        uVar11 = 0;
        do {
          if (in_stack_00000028 == uVar11) goto LAB_1458ab34b;
          pbVar1 = (byte *)(lVar14 + uVar11);
          pbVar2 = (byte *)(param_6 + uVar11);
          uVar11 = uVar11 + 1;
        } while ((byte)(((byte)(*pbVar1 + 0xbf) < 0x1a) << 5 | *pbVar1) ==
                 (byte)(((byte)(*pbVar2 + 0xbf) < 0x1a) << 5 | *pbVar2));
      }
      else {
        cVar8 = func_0x000140502660();
        if (cVar8 != '\0') {
LAB_1458ab34b:
          if (lVar6 != 0) {
            func_0x0001400021d0();
          }
          lVar14 = 0;
          do {
            if (puVar16[lVar14] == (&DAT_146bd83a0)[lVar9]) {
              puVar16 = &DAT_146bd83a0 + lVar9;
              goto LAB_1458ab43f;
            }
            lVar14 = lVar14 + 1;
          } while (lVar13 != lVar14);
          goto LAB_1458ab170;
        }
      }
    }
    if (lVar6 != 0) {
      func_0x0001400021d0();
    }
LAB_1458ab170:
    lVar9 = lVar10;
    if (lVar10 == 0x2c0) {
LAB_1458ab43f:
      uVar3 = *puVar16;
      func_0x000140002200();
      puVar12 = (undefined4 *)func_0x0001400021c0();
      if (puVar12 == (undefined4 *)0x0) {
        func_0x000145d9370b();
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
      *(undefined1 (*) [16])(param_4 + 4) = ZEXT416(_DAT_145def9c0);
      return param_4;
    }
  } while( true );
}
