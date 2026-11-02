
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 param_4,long *param_5,
          long *param_6)

{
  uint *puVar1;
  undefined1 auVar2 [16];
  char cVar3;
  int iVar4;
  undefined4 uVar5;
  long lVar6;
  undefined4 *puVar7;
  long lVar8;
  long lVar9;
  long lVar10;
  uint uVar11;
  uint uVar12;
  long lVar13;
  long lVar14;
  long lVar15;
  ulong uVar16;
  ulong uVar17;
  long *plVar18;
  long lVar19;
  long lVar20;
  int iVar21;
  undefined8 uVar22;
  undefined8 *puVar23;
  long lVar24;
  long lVar25;
  uint uVar26;
  ushort uVar27;
  uint *puVar28;
  undefined1 auVar29 [16];
  undefined1 auVar30 [16];
  long *in_stack_00000028;
  long local_128;
  long local_f0;
  undefined1 local_e8 [16];
  undefined8 local_d8;
  undefined1 local_c8 [16];
  long local_90;

  lVar25 = *in_stack_00000028;
  if (*(char *)(lVar25 + 0x1a8) != '\x01') {
    return;
  }
  lVar6 = *param_3;
  lVar20 = param_3[1];
  lVar14 = param_3[2];
  iVar4 = *(int *)((long)param_3 + 0x14);
  puVar7 = (undefined4 *)in_stack_00000028[2];
  uVar5 = *(undefined4 *)((long)in_stack_00000028 + 0x1c);
  lVar19 = *param_6;
  if (*(long *)(lVar19 + 0x38) != 0) {
    lVar13 = *param_5;
    lVar8 = param_5[1];
    uVar16 = 0x13bb6a541ca82e47;
    lVar24 = 0;
    while( true ) {
      uVar16 = uVar16 & *(ulong *)(lVar19 + 0x28);
      auVar2 = *(undefined1 (*) [16])(*(long *)(lVar19 + 0x20) + uVar16);
      auVar30[0] = -(auVar2[0] == DAT_1459076a0);
      auVar30[1] = -(auVar2[1] == DAT_1459076a0._1_1_);
      auVar30[2] = -(auVar2[2] == DAT_1459076a0._2_1_);
      auVar30[3] = -(auVar2[3] == DAT_1459076a0._3_1_);
      auVar30[4] = -(auVar2[4] == DAT_1459076a0._4_1_);
      auVar30[5] = -(auVar2[5] == DAT_1459076a0._5_1_);
      auVar30[6] = -(auVar2[6] == DAT_1459076a0._6_1_);
      auVar30[7] = -(auVar2[7] == DAT_1459076a0._7_1_);
      auVar30[8] = -(auVar2[8] == DAT_1459076a0._8_1_);
      auVar30[9] = -(auVar2[9] == DAT_1459076a0._9_1_);
      auVar30[10] = -(auVar2[10] == DAT_1459076a0._10_1_);
      auVar30[0xb] = -(auVar2[0xb] == DAT_1459076a0._11_1_);
      auVar30[0xc] = -(auVar2[0xc] == DAT_1459076a0._12_1_);
      auVar30[0xd] = -(auVar2[0xd] == DAT_1459076a0._13_1_);
      auVar30[0xe] = -(auVar2[0xe] == DAT_1459076a0._14_1_);
      auVar30[0xf] = -(auVar2[0xf] == DAT_1459076a0._15_1_);
      uVar27 = (ushort)(SUB161(auVar30 >> 7,0) & 1) | (ushort)(SUB161(auVar30 >> 0xf,0) & 1) << 1 |
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
               (ushort)(SUB161(auVar30 >> 0x77,0) & 1) << 0xe | (ushort)(auVar30[0xf] >> 7) << 0xf;
      uVar26 = (uint)uVar27;
      while (uVar27 != 0) {
        uVar12 = 0;
        for (uVar11 = uVar26; (uVar11 & 1) == 0; uVar11 = uVar11 >> 1 | 0x80000000) {
          uVar12 = uVar12 + 1;
        }
        if (*(short *)(*(long *)(lVar19 + 0x20) + (uVar12 + uVar16 & *(ulong *)(lVar19 + 0x28)) * -4
                      + -4) == 1) {
          puVar28 = *(uint **)(lVar13 + 0xf8);
          puVar1 = puVar28 + *(long *)(lVar13 + 0x100);
          cVar3 = *(char *)(lVar13 + 0x108);
          local_f0 = 0;
          local_128 = 8;
          local_90 = 0;
          lVar19 = 0;
          uVar16 = 0;
          goto LAB_14028d92a;
        }
        uVar27 = (ushort)(uVar26 - 1) & (ushort)uVar26;
        uVar26 = CONCAT22((short)(uVar26 - 1 >> 0x10),uVar27);
      }
      auVar29[0] = -(auVar2[0] == -1);
      auVar29[1] = -(auVar2[1] == -1);
      auVar29[2] = -(auVar2[2] == -1);
      auVar29[3] = -(auVar2[3] == -1);
      auVar29[4] = -(auVar2[4] == -1);
      auVar29[5] = -(auVar2[5] == -1);
      auVar29[6] = -(auVar2[6] == -1);
      auVar29[7] = -(auVar2[7] == -1);
      auVar29[8] = -(auVar2[8] == -1);
      auVar29[9] = -(auVar2[9] == -1);
      auVar29[10] = -(auVar2[10] == -1);
      auVar29[0xb] = -(auVar2[0xb] == -1);
      auVar29[0xc] = -(auVar2[0xc] == -1);
      auVar29[0xd] = -(auVar2[0xd] == -1);
      auVar29[0xe] = -(auVar2[0xe] == -1);
      auVar29[0xf] = -(auVar2[0xf] == -1);
      if ((((((((((((((((SUB161(auVar29 >> 7,0) & 1) != 0 || (SUB161(auVar29 >> 0xf,0) & 1) != 0) ||
                      (SUB161(auVar29 >> 0x17,0) & 1) != 0) || (SUB161(auVar29 >> 0x1f,0) & 1) != 0)
                    || (SUB161(auVar29 >> 0x27,0) & 1) != 0) || (SUB161(auVar29 >> 0x2f,0) & 1) != 0
                   ) || (SUB161(auVar29 >> 0x37,0) & 1) != 0) ||
                 (SUB161(auVar29 >> 0x3f,0) & 1) != 0) || (SUB161(auVar29 >> 0x47,0) & 1) != 0) ||
               (SUB161(auVar29 >> 0x4f,0) & 1) != 0) || (SUB161(auVar29 >> 0x57,0) & 1) != 0) ||
             (SUB161(auVar29 >> 0x5f,0) & 1) != 0) || (SUB161(auVar29 >> 0x67,0) & 1) != 0) ||
           (SUB161(auVar29 >> 0x6f,0) & 1) != 0) || (SUB161(auVar29 >> 0x77,0) & 1) != 0) ||
          auVar29[0xf] < '\0') break;
      uVar16 = uVar16 + lVar24 + 0x10;
      lVar24 = lVar24 + 0x10;
    }
  }
LAB_14028dc06:
  puVar28 = *(uint **)(lVar6 + 0xf8);
  puVar1 = puVar28 + *(long *)(lVar6 + 0x100);
  cVar3 = *(char *)(lVar6 + 0x108);
  uVar12 = iVar4 - (int)lVar14;
  uVar26 = 0xc233b000;
  if (uVar12 < 0xc233b000) {
    uVar26 = uVar12;
  }
  lVar25 = 8;
  lVar19 = 0;
  local_90 = 0;
  lVar14 = 0;
  uVar22 = 0;
  uVar16 = 0;
  do {
    if (cVar3 == '\0') {
      do {
        if ((int)uVar16 == (int)uVar22) {
          if (puVar28 == puVar1) {
            return;
          }
          uVar12 = *puVar28;
          puVar28 = puVar28 + 1;
          if (*(long *)(*(long *)(lVar20 + 0x108) + 0x58 + (ulong)uVar12 * 0xa0) == 0) {
            do {
              if (puVar28 == puVar1) {
                return;
              }
              uVar12 = *puVar28;
              puVar28 = puVar28 + 1;
            } while (*(long *)(*(long *)(lVar20 + 0x108) + 0x58 + (ulong)uVar12 * 0xa0) == 0);
            lVar25 = *(long *)(lVar20 + 0x108) + (ulong)uVar12 * 0xa0;
          }
          else {
            lVar25 = *(long *)(lVar20 + 0x108) + (ulong)uVar12 * 0xa0;
          }
          puVar23 = (undefined8 *)(lVar25 + 0x58);
          lVar14 = *(long *)(lVar20 + 0x1a8) + (ulong)*(uint *)(lVar25 + 0x94) * 0x48;
          uVar16 = *(ulong *)(*(long *)(lVar20 + 0x1a8) + 0x40 +
                             (ulong)*(uint *)(lVar25 + 0x94) * 0x48);
          if ((*(ulong *)(lVar6 + 0x110) < uVar16) &&
             (uVar17 = *(ulong *)(*(long *)(lVar14 + 0x38) + *(ulong *)(lVar6 + 0x110) * 8),
             uVar17 != 0)) {
            lVar19 = *(long *)(*(long *)(lVar14 + 0x18) + 0x10 + ~uVar17 * 0x30);
            uVar17 = *(ulong *)(lVar6 + 0x118);
            if (uVar16 <= uVar17) goto LAB_14028dcd0;
LAB_14028de02:
            uVar16 = *(ulong *)(*(long *)(lVar14 + 0x38) + uVar17 * 8);
            if (uVar16 == 0) goto LAB_14028dcd0;
            local_90 = *(long *)(*(long *)(lVar14 + 0x18) + 0x10 + ~uVar16 * 0x30);
          }
          else {
            lVar19 = 0;
            uVar17 = *(ulong *)(lVar6 + 0x118);
            if (uVar17 < uVar16) goto LAB_14028de02;
LAB_14028dcd0:
            local_90 = 0;
          }
          lVar14 = func_0x000144e5d7b0();
          lVar25 = *(long *)(lVar25 + 0x50);
          uVar22 = *puVar23;
          uVar16 = 0;
        }
        lVar13 = uVar16 * 0x10;
        uVar16 = (ulong)((int)uVar16 + 1);
        uVar17 = (ulong)~*(uint *)(lVar25 + 8 + lVar13);
      } while (uVar26 <= (uint)(iVar4 - *(int *)(lVar14 + uVar17 * 4)));
    }
    else {
      do {
        uVar12 = (uint)uVar16;
        if (uVar12 == (uint)uVar22) {
          if (puVar28 == puVar1) {
            return;
          }
          uVar16 = (ulong)*puVar28;
          puVar28 = puVar28 + 1;
          lVar19 = *(long *)(lVar20 + 0x1a8);
          if (*(long *)(lVar19 + 0x10 + uVar16 * 0x48) == 0) {
            do {
              if (puVar28 == puVar1) {
                return;
              }
              uVar12 = *puVar28;
              puVar28 = puVar28 + 1;
            } while (*(long *)(*(long *)(lVar20 + 0x1a8) + 0x10 + (ulong)uVar12 * 0x48) == 0);
            lVar14 = *(long *)(lVar20 + 0x1a8) + (ulong)uVar12 * 0x48;
            lVar19 = lVar14;
          }
          else {
            lVar14 = lVar19 + uVar16 * 0x48;
            lVar19 = lVar19 + uVar16 * 0x48;
          }
          puVar23 = (undefined8 *)(lVar19 + 0x10);
          uVar16 = *(ulong *)(lVar14 + 0x40);
          if ((*(ulong *)(lVar6 + 0x110) < uVar16) &&
             (uVar17 = *(ulong *)(*(long *)(lVar14 + 0x38) + *(ulong *)(lVar6 + 0x110) * 8),
             uVar17 != 0)) {
            lVar19 = *(long *)(*(long *)(lVar14 + 0x18) + 0x10 + ~uVar17 * 0x30);
            uVar17 = *(ulong *)(lVar6 + 0x118);
            if (uVar16 <= uVar17) goto LAB_14028de40;
LAB_14028df52:
            uVar16 = *(ulong *)(*(long *)(lVar14 + 0x38) + uVar17 * 8);
            if (uVar16 == 0) goto LAB_14028de40;
            local_90 = *(long *)(*(long *)(lVar14 + 0x18) + 0x10 + ~uVar16 * 0x30);
          }
          else {
            lVar19 = 0;
            uVar17 = *(ulong *)(lVar6 + 0x118);
            if (uVar17 < uVar16) goto LAB_14028df52;
LAB_14028de40:
            local_90 = 0;
          }
          lVar14 = func_0x000144e5d7b0();
          uVar22 = *puVar23;
          uVar12 = 0;
        }
        uVar17 = (ulong)uVar12;
        uVar16 = (ulong)(uVar12 + 1);
      } while (uVar26 <= (uint)(iVar4 - *(int *)(lVar14 + uVar17 * 4)));
    }
    if ((char *)(lVar19 + uVar17) == (char *)0x0) {
      return;
    }
    if (*(char *)(lVar19 + uVar17) == '\0') {
      lVar25 = *(long *)(uVar17 * 0x20 + local_90);
      if (-1 < lVar25) {
        lVar25 = 4;
      }
                    /* WARNING: Could not recover jumptable at 0x00014028dff5. Too many branches */
                    /* WARNING: Treating indirect jump as call */
      (*(code *)((long)*(int *)(lVar25 * 4 + 0x14595b7ac) + 0x14595b7ac))();
      return;
    }
  } while( true );
LAB_14028d92a:
  if (cVar3 == '\0') {
    if ((int)uVar16 == (int)local_f0) {
      do {
        if (puVar28 == puVar1) goto LAB_14028dc06;
        uVar26 = *puVar28;
        puVar28 = puVar28 + 1;
        local_f0 = *(long *)(*(long *)(lVar8 + 0x108) + 0x58 + (ulong)uVar26 * 0xa0);
      } while (local_f0 == 0);
      lVar24 = *(long *)(lVar8 + 0x108) + (ulong)uVar26 * 0xa0;
      uVar16 = (ulong)*(uint *)(lVar24 + 0x94);
      lVar19 = *(long *)(lVar8 + 0x1a8) + uVar16 * 0x48;
      uVar16 = *(ulong *)(*(long *)(lVar8 + 0x1a8) + 0x40 + uVar16 * 0x48);
      if ((*(ulong *)(lVar13 + 0x110) < uVar16) &&
         (uVar17 = *(ulong *)(*(long *)(lVar19 + 0x38) + *(ulong *)(lVar13 + 0x110) * 8),
         uVar17 != 0)) {
        local_90 = *(long *)(*(long *)(lVar19 + 0x18) + 0x10 + ~uVar17 * 0x30);
        uVar17 = *(ulong *)(lVar13 + 0x118);
        if (uVar16 <= uVar17) goto LAB_14028db1c;
LAB_14028daea:
        uVar16 = *(ulong *)(*(long *)(lVar19 + 0x38) + uVar17 * 8);
        if (uVar16 == 0) goto LAB_14028db1c;
        lVar19 = *(long *)(*(long *)(lVar19 + 0x18) + 0x10 + ~uVar16 * 0x30);
      }
      else {
        local_90 = 0;
        uVar17 = *(ulong *)(lVar13 + 0x118);
        if (uVar17 < uVar16) goto LAB_14028daea;
LAB_14028db1c:
        lVar19 = 0;
      }
      local_128 = *(long *)(lVar24 + 0x50);
      uVar16 = 0;
    }
    iVar21 = (int)uVar16;
    uVar17 = (ulong)~*(uint *)(local_128 + 8 + (uVar16 & 0xffffffff) * 0x10);
  }
  else {
    if ((int)uVar16 == (int)local_f0) {
      do {
        if (puVar28 == puVar1) goto LAB_14028dc06;
        uVar26 = *puVar28;
        puVar28 = puVar28 + 1;
        local_f0 = *(long *)(*(long *)(lVar8 + 0x1a8) + 0x10 + (ulong)uVar26 * 0x48);
      } while (local_f0 == 0);
      lVar19 = *(long *)(lVar8 + 0x1a8) + (ulong)uVar26 * 0x48;
      uVar16 = *(ulong *)(lVar19 + 0x40);
      if ((*(ulong *)(lVar13 + 0x110) < uVar16) &&
         (uVar17 = *(ulong *)(*(long *)(lVar19 + 0x38) + *(ulong *)(lVar13 + 0x110) * 8),
         uVar17 != 0)) {
        local_90 = *(long *)(*(long *)(lVar19 + 0x18) + 0x10 + ~uVar17 * 0x30);
        uVar17 = *(ulong *)(lVar13 + 0x118);
        if (uVar16 <= uVar17) goto LAB_14028db0d;
LAB_14028dab0:
        uVar16 = *(ulong *)(*(long *)(lVar19 + 0x38) + uVar17 * 8);
        if (uVar16 == 0) goto LAB_14028db0d;
        lVar19 = *(long *)(*(long *)(lVar19 + 0x18) + 0x10 + ~uVar16 * 0x30);
      }
      else {
        local_90 = 0;
        uVar17 = *(ulong *)(lVar13 + 0x118);
        if (uVar17 < uVar16) goto LAB_14028dab0;
LAB_14028db0d:
        lVar19 = 0;
      }
      uVar16 = 0;
    }
    iVar21 = (int)uVar16;
    uVar17 = uVar16 & 0xffffffff;
  }
  uVar16 = (ulong)(iVar21 + 1);
  plVar18 = (long *)(uVar17 * 0x20 + lVar19);
  if ((char *)(local_90 + uVar17) == (char *)0x0) goto LAB_14028dc06;
  if ((-1 < *plVar18) && (*(char *)(local_90 + uVar17) != '\x02')) {
    *puVar7 = uVar5;
    if ((*(long *)(lVar25 + 0x78) != -1) && (*(long *)(lVar25 + 0x78) != 0)) {
      func_0x0001400021d0();
    }
    *(undefined8 *)(lVar25 + 0x78) = 0xffffffffffffffff;
    func_0x000145728850();
    lVar24 = plVar18[3];
    *puVar7 = uVar5;
    lVar10 = *(long *)(lVar25 + 0x28);
    if (lVar10 == *(long *)(lVar25 + 0x18)) {
      func_0x0001457746a0();
    }
    lVar9 = *(long *)(lVar25 + 0x20);
    lVar15 = lVar10 * 0x38;
    *(long *)(lVar9 + 0x30 + lVar15) = lVar24;
    *(undefined1 (*) [16])(lVar9 + 0x20 + lVar15) = local_c8;
    puVar23 = (undefined8 *)(lVar9 + 0x10 + lVar15);
    *puVar23 = local_d8;
    puVar23[1] = 0xffffffffffffffff;
    *(undefined1 (*) [16])(lVar9 + lVar15) = local_e8;
    *(long *)(lVar25 + 0x28) = lVar10 + 1;
  }
  goto LAB_14028d92a;
}
