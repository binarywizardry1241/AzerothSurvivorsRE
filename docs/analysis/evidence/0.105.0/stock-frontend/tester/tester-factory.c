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
      if ((((((byte)(((byte)(DAT_146baa8d0 + 0xbf) < 0x1a) << 5 | DAT_146baa8d0) ==
              (byte)(((byte)(*param_3 + 0xbf) < 0x1a) << 5 | *param_3)) &&
            ((byte)(((byte)(DAT_146baa8d1 + 0xbf) < 0x1a) << 5 | DAT_146baa8d1) ==
             (byte)(((byte)(param_3[1] + 0xbf) < 0x1a) << 5 | param_3[1]))) &&
           ((byte)(((byte)(DAT_146baa8d2 + 0xbf) < 0x1a) << 5 | DAT_146baa8d2) ==
            (byte)(((byte)(param_3[2] + 0xbf) < 0x1a) << 5 | param_3[2]))) &&
          (((byte)(((byte)(DAT_146baa8d3 + 0xbf) < 0x1a) << 5 | DAT_146baa8d3) ==
            (byte)(((byte)(param_3[3] + 0xbf) < 0x1a) << 5 | param_3[3]) &&
           ((byte)(((byte)(DAT_146baa8d4 + 0xbf) < 0x1a) << 5 | DAT_146baa8d4) ==
            (byte)(((byte)(param_3[4] + 0xbf) < 0x1a) << 5 | param_3[4]))))) &&
         (((byte)(((byte)(DAT_146baa8d5 + 0xbf) < 0x1a) << 5 | DAT_146baa8d5) ==
           (byte)(((byte)(param_3[5] + 0xbf) < 0x1a) << 5 | param_3[5]) &&
          ((byte)(((byte)(DAT_146baa8d6 + 0xbf) < 0x1a) << 5 | DAT_146baa8d6) ==
           (byte)(((byte)(param_3[6] + 0xbf) < 0x1a) << 5 | param_3[6]))))) {
        lVar13 = 0x146bab7a8;
        bVar22 = false;
        goto LAB_1458b7b37;
      }
      if (((((byte)(((byte)(DAT_146baaa67 + 0xbf) < 0x1a) << 5 | DAT_146baaa67) ==
             (byte)(((byte)(*param_3 + 0xbf) < 0x1a) << 5 | *param_3)) &&
           ((byte)(((byte)(DAT_146baaa68 + 0xbf) < 0x1a) << 5 | DAT_146baaa68) ==
            (byte)(((byte)(param_3[1] + 0xbf) < 0x1a) << 5 | param_3[1]))) &&
          (((byte)(((byte)(DAT_146baaa69 + 0xbf) < 0x1a) << 5 | DAT_146baaa69) ==
            (byte)(((byte)(param_3[2] + 0xbf) < 0x1a) << 5 | param_3[2]) &&
           ((((byte)(((byte)(DAT_146baaa6a + 0xbf) < 0x1a) << 5 | DAT_146baaa6a) ==
              (byte)(((byte)(param_3[3] + 0xbf) < 0x1a) << 5 | param_3[3]) &&
             ((byte)(((byte)(DAT_146baaa6b + 0xbf) < 0x1a) << 5 | DAT_146baaa6b) ==
              (byte)(((byte)(param_3[4] + 0xbf) < 0x1a) << 5 | param_3[4]))) &&
            ((byte)(((byte)(DAT_146baaa6c + 0xbf) < 0x1a) << 5 | DAT_146baaa6c) ==
             (byte)(((byte)(param_3[5] + 0xbf) < 0x1a) << 5 | param_3[5]))))))) &&
         ((byte)(((byte)(DAT_146baaa6d + 0xbf) < 0x1a) << 5 | DAT_146baaa6d) ==
          (byte)(((byte)(param_3[6] + 0xbf) < 0x1a) << 5 | param_3[6]))) {
        lVar13 = 0x146bab838;
        bVar22 = false;
        goto LAB_1458b7b37;
      }
    }
    if (((param_5 == 6) &&
        ((byte)(((byte)(DAT_146baac15 + 0xbf) < 0x1a) << 5 | DAT_146baac15) ==
         (byte)(((byte)(*param_3 + 0xbf) < 0x1a) << 5 | *param_3))) &&
       (((((byte)(((byte)(DAT_146baac16 + 0xbf) < 0x1a) << 5 | DAT_146baac16) ==
           (byte)(((byte)(param_3[1] + 0xbf) < 0x1a) << 5 | param_3[1]) &&
          (((byte)(((byte)(DAT_146baac17 + 0xbf) < 0x1a) << 5 | DAT_146baac17) ==
            (byte)(((byte)(param_3[2] + 0xbf) < 0x1a) << 5 | param_3[2]) &&
           ((byte)(((byte)(DAT_146baac18 + 0xbf) < 0x1a) << 5 | DAT_146baac18) ==
            (byte)(((byte)(param_3[3] + 0xbf) < 0x1a) << 5 | param_3[3]))))) &&
         ((byte)(((byte)(DAT_146baac19 + 0xbf) < 0x1a) << 5 | DAT_146baac19) ==
          (byte)(((byte)(param_3[4] + 0xbf) < 0x1a) << 5 | param_3[4]))) &&
        ((byte)(((byte)(DAT_146baac1a + 0xbf) < 0x1a) << 5 | DAT_146baac1a) ==
         (byte)(((byte)(param_3[5] + 0xbf) < 0x1a) << 5 | param_3[5]))))) {
      lVar13 = 0x146bab8c8;
      bVar22 = false;
      goto LAB_1458b7b37;
    }
    if ((((param_5 == 5) &&
         ((byte)(((byte)(DAT_146baadb7 + 0xbf) < 0x1a) << 5 | DAT_146baadb7) ==
          (byte)(((byte)(*param_3 + 0xbf) < 0x1a) << 5 | *param_3))) &&
        ((byte)(((byte)(DAT_146baadb8 + 0xbf) < 0x1a) << 5 | DAT_146baadb8) ==
         (byte)(((byte)(param_3[1] + 0xbf) < 0x1a) << 5 | param_3[1]))) &&
       ((((byte)(((byte)(DAT_146baadb9 + 0xbf) < 0x1a) << 5 | DAT_146baadb9) ==
          (byte)(((byte)(param_3[2] + 0xbf) < 0x1a) << 5 | param_3[2]) &&
         ((byte)(((byte)(DAT_146baadba + 0xbf) < 0x1a) << 5 | DAT_146baadba) ==
          (byte)(((byte)(param_3[3] + 0xbf) < 0x1a) << 5 | param_3[3]))) &&
        ((byte)(((byte)(DAT_146baadbb + 0xbf) < 0x1a) << 5 | DAT_146baadbb) ==
         (byte)(((byte)(param_3[4] + 0xbf) < 0x1a) << 5 | param_3[4]))))) {
      lVar13 = 0x146bab958;
      bVar22 = false;
      goto LAB_1458b7b37;
    }
    if (param_5 == 6) {
      if ((((byte)(((byte)(DAT_146baaf56 + 0xbf) < 0x1a) << 5 | DAT_146baaf56) ==
            (byte)(((byte)(*param_3 + 0xbf) < 0x1a) << 5 | *param_3)) &&
          ((byte)(((byte)(DAT_146baaf57 + 0xbf) < 0x1a) << 5 | DAT_146baaf57) ==
           (byte)(((byte)(param_3[1] + 0xbf) < 0x1a) << 5 | param_3[1]))) &&
         (((byte)(((byte)(DAT_146baaf58 + 0xbf) < 0x1a) << 5 | DAT_146baaf58) ==
           (byte)(((byte)(param_3[2] + 0xbf) < 0x1a) << 5 | param_3[2]) &&
          ((((byte)(((byte)(DAT_146baaf59 + 0xbf) < 0x1a) << 5 | DAT_146baaf59) ==
             (byte)(((byte)(param_3[3] + 0xbf) < 0x1a) << 5 | param_3[3]) &&
            ((byte)(((byte)(DAT_146baaf5a + 0xbf) < 0x1a) << 5 | DAT_146baaf5a) ==
             (byte)(((byte)(param_3[4] + 0xbf) < 0x1a) << 5 | param_3[4]))) &&
           ((byte)(((byte)(DAT_146baaf5b + 0xbf) < 0x1a) << 5 | DAT_146baaf5b) ==
            (byte)(((byte)(param_3[5] + 0xbf) < 0x1a) << 5 | param_3[5]))))))) {
        lVar13 = 0x146bab9e8;
        bVar22 = false;
        goto LAB_1458b7b37;
      }
      if (((((byte)(((byte)(DAT_146bab0db + 0xbf) < 0x1a) << 5 | DAT_146bab0db) ==
             (byte)(((byte)(*param_3 + 0xbf) < 0x1a) << 5 | *param_3)) &&
           ((byte)(((byte)(DAT_146bab0dc + 0xbf) < 0x1a) << 5 | DAT_146bab0dc) ==
            (byte)(((byte)(param_3[1] + 0xbf) < 0x1a) << 5 | param_3[1]))) &&
          (((byte)(((byte)(DAT_146bab0dd + 0xbf) < 0x1a) << 5 | DAT_146bab0dd) ==
            (byte)(((byte)(param_3[2] + 0xbf) < 0x1a) << 5 | param_3[2]) &&
           (((byte)(((byte)(DAT_146bab0de + 0xbf) < 0x1a) << 5 | DAT_146bab0de) ==
             (byte)(((byte)(param_3[3] + 0xbf) < 0x1a) << 5 | param_3[3]) &&
            ((byte)(((byte)(DAT_146bab0df + 0xbf) < 0x1a) << 5 | DAT_146bab0df) ==
             (byte)(((byte)(param_3[4] + 0xbf) < 0x1a) << 5 | param_3[4]))))))) &&
         ((byte)(((byte)(DAT_146bab0e0 + 0xbf) < 0x1a) << 5 | DAT_146bab0e0) ==
          (byte)(((byte)(param_3[5] + 0xbf) < 0x1a) << 5 | param_3[5]))) {
        lVar13 = 0x146baba78;
        bVar22 = false;
        goto LAB_1458b7b37;
      }
    }
    if ((((param_5 == 4) &&
         ((byte)(((byte)(DAT_146bab280 + 0xbf) < 0x1a) << 5 | DAT_146bab280) ==
          (byte)(((byte)(*param_3 + 0xbf) < 0x1a) << 5 | *param_3))) &&
        ((byte)(((byte)(DAT_146bab281 + 0xbf) < 0x1a) << 5 | DAT_146bab281) ==
         (byte)(((byte)(param_3[1] + 0xbf) < 0x1a) << 5 | param_3[1]))) &&
       (((byte)(((byte)(DAT_146bab282 + 0xbf) < 0x1a) << 5 | DAT_146bab282) ==
         (byte)(((byte)(param_3[2] + 0xbf) < 0x1a) << 5 | param_3[2]) &&
        ((byte)(((byte)(DAT_146bab283 + 0xbf) < 0x1a) << 5 | DAT_146bab283) ==
         (byte)(((byte)(param_3[3] + 0xbf) < 0x1a) << 5 | param_3[3]))))) {
      lVar13 = 0x146babb08;
      bVar22 = false;
      goto LAB_1458b7b37;
    }
    if ((((param_5 == 7) &&
         ((byte)(((byte)(DAT_146bab44c + 0xbf) < 0x1a) << 5 | DAT_146bab44c) ==
          (byte)(((byte)(*param_3 + 0xbf) < 0x1a) << 5 | *param_3))) &&
        (((byte)(((byte)(DAT_146bab44d + 0xbf) < 0x1a) << 5 | DAT_146bab44d) ==
          (byte)(((byte)(param_3[1] + 0xbf) < 0x1a) << 5 | param_3[1]) &&
         ((((byte)(((byte)(DAT_146bab44e + 0xbf) < 0x1a) << 5 | DAT_146bab44e) ==
            (byte)(((byte)(param_3[2] + 0xbf) < 0x1a) << 5 | param_3[2]) &&
           ((byte)(((byte)(DAT_146bab44f + 0xbf) < 0x1a) << 5 | DAT_146bab44f) ==
            (byte)(((byte)(param_3[3] + 0xbf) < 0x1a) << 5 | param_3[3]))) &&
          ((byte)(((byte)(DAT_146bab450 + 0xbf) < 0x1a) << 5 | DAT_146bab450) ==
           (byte)(((byte)(param_3[4] + 0xbf) < 0x1a) << 5 | param_3[4]))))))) &&
       ((byte)(((byte)(DAT_146bab451 + 0xbf) < 0x1a) << 5 | DAT_146bab451) ==
        (byte)(((byte)(param_3[5] + 0xbf) < 0x1a) << 5 | param_3[5]))) {
      lVar13 = 0;
      bVar22 = (byte)(((byte)(DAT_146bab452 + 0xbf) < 0x1a) << 5 | DAT_146bab452) !=
               (byte)(((byte)(param_3[6] + 0xbf) < 0x1a) << 5 | param_3[6]);
      if (!bVar22) {
        lVar13 = 0x146babb98;
      }
      goto LAB_1458b7b37;
    }
    if (((param_5 == 5) &&
        ((byte)(((byte)(DAT_146bab608 + 0xbf) < 0x1a) << 5 | DAT_146bab608) ==
         (byte)(((byte)(*param_3 + 0xbf) < 0x1a) << 5 | *param_3))) &&
       (((byte)(((byte)(DAT_146bab609 + 0xbf) < 0x1a) << 5 | DAT_146bab609) ==
         (byte)(((byte)(param_3[1] + 0xbf) < 0x1a) << 5 | param_3[1]) &&
        (((byte)(((byte)(DAT_146bab60a + 0xbf) < 0x1a) << 5 | DAT_146bab60a) ==
          (byte)(((byte)(param_3[2] + 0xbf) < 0x1a) << 5 | param_3[2]) &&
         ((byte)(((byte)(DAT_146bab60b + 0xbf) < 0x1a) << 5 | DAT_146bab60b) ==
          (byte)(((byte)(param_3[3] + 0xbf) < 0x1a) << 5 | param_3[3]))))))) {
      lVar13 = 0;
      bVar22 = (byte)(((byte)(DAT_146bab60c + 0xbf) < 0x1a) << 5 | DAT_146bab60c) !=
               (byte)(((byte)(param_3[4] + 0xbf) < 0x1a) << 5 | param_3[4]);
      if (!bVar22) {
        lVar13 = 0x146babc28;
      }
      goto LAB_1458b7b37;
    }
  }
  lVar13 = 0;
LAB_1458b7b37:
  lVar15 = 0x146bab7a8;
  if (!bVar22) {
    lVar15 = lVar13;
  }
  bVar7 = *(char *)(lVar15 + 0x8c) - 1;
  if (bVar7 < 0xb) {
    puVar16 = (undefined1 *)((long)*(int *)((ulong)bVar7 * 4 + 0x146bb7b18) + 0x146bb7b18);
    lVar13 = *(long *)((ulong)bVar7 * 8 + 0x146bb7b48);
  }
  else {
    lVar13 = 1;
    puVar16 = (undefined1 *)0x146bb7960;
  }
  lVar9 = 0;
  do {
    lVar14 = *(long *)(lVar9 + 0x146baa610);
    uVar11 = *(ulong *)(lVar9 + 0x146baa618);
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
          if (uVar11 == uVar18) goto LAB_1458b7d00;
          while (*(char *)(lVar14 + uVar18 + uVar19) != ' ') {
            uVar19 = uVar19 + 1;
            if (uVar11 - uVar18 == uVar19) goto LAB_1458b7d00;
          }
        }
        else {
          auVar23 = func_0x000145ba4f00();
          uVar19 = auVar23._8_8_;
          if (auVar23._0_8_ != 1) goto LAB_1458b7d00;
        }
        uVar20 = uVar19 + uVar18 + 1;
        uVar19 = uVar19 + uVar18;
        if ((uVar19 < uVar11) && (*(char *)(lVar14 + uVar19) == ' ')) break;
        uVar18 = uVar20;
        if (uVar11 < uVar20) goto LAB_1458b7d00;
      }
      uVar18 = uVar19 - local_50;
      if ((ulong)(local_68 - lVar21) < uVar18) {
        func_0x000145bcb2d0(uVar20,uVar19,lVar21,&local_68,uVar18,1);
        lVar21 = local_58;
        if (uVar19 != local_50) goto LAB_1458b7caa;
      }
      else if (uVar19 != local_50) {
LAB_1458b7caa:
        func_0x000145bc977b();
      }
      lVar21 = lVar21 + uVar18;
    }
LAB_1458b7d00:
    lVar14 = local_60;
    if ((ulong)(local_68 - lVar21) < uVar17) {
      func_0x000145bcb2d0();
      lVar14 = local_60;
      lVar21 = local_58;
    }
    local_60 = lVar14;
    if (uVar11 != local_50) {
      func_0x000145bc977b();
    }
    lVar6 = local_68;
    if (lVar21 + uVar17 == in_stack_00000028) {
      if (in_stack_00000028 < 0x10) {
        uVar11 = 0;
        do {
          if (in_stack_00000028 == uVar11) goto LAB_1458b7d6b;
          pbVar1 = (byte *)(lVar14 + uVar11);
          pbVar2 = (byte *)(param_6 + uVar11);
          uVar11 = uVar11 + 1;
        } while ((byte)(((byte)(*pbVar1 + 0xbf) < 0x1a) << 5 | *pbVar1) ==
                 (byte)(((byte)(*pbVar2 + 0xbf) < 0x1a) << 5 | *pbVar2));
      }
      else {
        cVar8 = func_0x000140002210();
        if (cVar8 != '\0') {
LAB_1458b7d6b:
          if (lVar6 != 0) {
            func_0x0001400021d0();
          }
          lVar14 = 0;
          do {
            if (puVar16[lVar14] == (&DAT_146baa660)[lVar9]) {
              puVar16 = &DAT_146baa660 + lVar9;
              goto LAB_1458b7e5f;
            }
            lVar14 = lVar14 + 1;
          } while (lVar13 != lVar14);
          goto LAB_1458b7b90;
        }
      }
    }
    if (lVar6 != 0) {
      func_0x0001400021d0();
    }
LAB_1458b7b90:
    lVar9 = lVar10;
    if (lVar10 == 0x2c0) {
LAB_1458b7e5f:
      uVar3 = *puVar16;
      func_0x000140002200();
      puVar12 = (undefined4 *)func_0x0001400021c0();
      if (puVar12 == (undefined4 *)0x0) {
        func_0x000145d6944b();
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
      *(undefined1 (*) [16])(param_4 + 4) = ZEXT416(_DAT_145db8080);
      return param_4;
    }
  } while( true );
}
