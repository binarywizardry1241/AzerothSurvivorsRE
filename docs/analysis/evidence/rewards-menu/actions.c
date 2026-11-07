void FUN_1401160d0(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 param_4,
                  long *param_5)

{
  char cVar1;
  int iVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  long lVar5;
  long lVar6;
  undefined4 *puVar7;
  undefined4 *puVar8;
  char cVar9;
  ulong uVar10;
  long lVar11;
  uint uVar12;
  ulong uVar13;
  undefined8 uVar14;
  undefined8 *puVar15;
  long lVar16;
  uint *puVar17;
  long lVar18;
  byte *pbVar19;
  uint *puVar20;
  uint uVar21;
  long lVar22;
  long lVar23;
  long in_stack_00000028;
  long lStack_138;
  long lStack_b0;
  long lStack_a8;

  lVar5 = *param_3;
  lVar18 = param_3[1];
  iVar2 = *(int *)((long)param_3 + 0x14);
  lVar6 = *param_5;
  puVar7 = (undefined4 *)param_5[2];
  uVar3 = *(undefined4 *)((long)param_5 + 0x1c);
  puVar8 = *(undefined4 **)(in_stack_00000028 + 0x10);
  uVar4 = *(undefined4 *)(in_stack_00000028 + 0x1c);
  uVar12 = iVar2 - (int)param_3[2];
  uVar21 = 0xc233b000;
  if (uVar12 < 0xc233b000) {
    uVar21 = uVar12;
  }
  puVar20 = *(uint **)(lVar5 + 0xf8);
  puVar17 = puVar20 + *(long *)(lVar5 + 0x100);
  cVar1 = *(char *)(lVar5 + 0x108);
  lVar11 = 0;
  lStack_138 = 8;
  uVar14 = 0;
  uVar12 = 0;
  lStack_a8 = 0;
  lStack_b0 = 0;
  do {
    if (cVar1 == '\0') {
      do {
        if (uVar12 == (uint)uVar14) {
          if (puVar20 == puVar17) {
            return;
          }
          uVar12 = *puVar20;
          puVar20 = puVar20 + 1;
          if (*(long *)(*(long *)(lVar18 + 0x108) + 0x58 + (ulong)uVar12 * 0xa0) == 0) {
            do {
              if (puVar20 == puVar17) {
                return;
              }
              uVar12 = *puVar20;
              puVar20 = puVar20 + 1;
            } while (*(long *)(*(long *)(lVar18 + 0x108) + 0x58 + (ulong)uVar12 * 0xa0) == 0);
            lVar16 = *(long *)(lVar18 + 0x108) + (ulong)uVar12 * 0xa0;
          }
          else {
            lVar16 = *(long *)(lVar18 + 0x108) + (ulong)uVar12 * 0xa0;
          }
          lVar11 = *(long *)(lVar18 + 0x1a8) + (ulong)*(uint *)(lVar16 + 0x94) * 0x48;
          uVar13 = *(ulong *)(*(long *)(lVar18 + 0x1a8) + 0x40 +
                             (ulong)*(uint *)(lVar16 + 0x94) * 0x48);
          if ((*(ulong *)(lVar5 + 0x110) < uVar13) &&
             (uVar10 = *(ulong *)(*(long *)(lVar11 + 0x38) + *(ulong *)(lVar5 + 0x110) * 8),
             uVar10 != 0)) {
            lStack_b0 = *(long *)(*(long *)(lVar11 + 0x18) + 0x10 + ~uVar10 * 0x30);
            uVar10 = *(ulong *)(lVar5 + 0x118);
            if (uVar13 <= uVar10) goto LAB_140116500;
LAB_1401164c7:
            uVar13 = *(ulong *)(*(long *)(lVar11 + 0x38) + uVar10 * 8);
            if (uVar13 == 0) goto LAB_140116500;
            lStack_a8 = *(long *)(*(long *)(lVar11 + 0x18) + 0x10 + ~uVar13 * 0x30);
          }
          else {
            lStack_b0 = 0;
            uVar10 = *(ulong *)(lVar5 + 0x118);
            if (uVar10 < uVar13) goto LAB_1401164c7;
LAB_140116500:
            lStack_a8 = 0;
          }
          lVar11 = func_0x000144e4f270();
          lStack_138 = *(long *)(lVar16 + 0x50);
          uVar14 = *(undefined8 *)(lVar16 + 0x58);
          uVar12 = 0;
        }
        uVar13 = (ulong)uVar12;
        uVar12 = uVar12 + 1;
        uVar13 = (ulong)~*(uint *)(lStack_138 + 8 + uVar13 * 0x10);
      } while (uVar21 <= (uint)(iVar2 - *(int *)(lVar11 + uVar13 * 4)));
    }
    else {
      do {
        if (uVar12 == (uint)uVar14) {
          if (puVar20 == puVar17) {
            return;
          }
          uVar13 = (ulong)*puVar20;
          puVar20 = puVar20 + 1;
          lVar11 = *(long *)(lVar18 + 0x1a8);
          if (*(long *)(lVar11 + 0x10 + uVar13 * 0x48) == 0) {
            do {
              if (puVar20 == puVar17) {
                return;
              }
              uVar12 = *puVar20;
              puVar20 = puVar20 + 1;
            } while (*(long *)(*(long *)(lVar18 + 0x1a8) + 0x10 + (ulong)uVar12 * 0x48) == 0);
            lVar16 = *(long *)(lVar18 + 0x1a8) + (ulong)uVar12 * 0x48;
            puVar15 = (undefined8 *)(lVar16 + 0x10);
            uVar13 = *(ulong *)(lVar5 + 0x110);
            uVar10 = *(ulong *)(lVar16 + 0x40);
            if (uVar13 < uVar10) goto LAB_1401162dc;
LAB_140116320:
            lStack_b0 = 0;
            uVar13 = *(ulong *)(lVar5 + 0x118);
            if (uVar10 <= uVar13) goto LAB_140116370;
LAB_140116337:
            uVar13 = *(ulong *)(*(long *)(lVar16 + 0x38) + uVar13 * 8);
            if (uVar13 == 0) goto LAB_140116370;
            lStack_a8 = *(long *)(*(long *)(lVar16 + 0x18) + 0x10 + ~uVar13 * 0x30);
          }
          else {
            lVar16 = lVar11 + uVar13 * 0x48;
            puVar15 = (undefined8 *)(lVar11 + uVar13 * 0x48 + 0x10);
            uVar13 = *(ulong *)(lVar5 + 0x110);
            uVar10 = *(ulong *)(lVar16 + 0x40);
            if (uVar10 <= uVar13) goto LAB_140116320;
LAB_1401162dc:
            uVar13 = *(ulong *)(*(long *)(lVar16 + 0x38) + uVar13 * 8);
            if (uVar13 == 0) goto LAB_140116320;
            lStack_b0 = *(long *)(*(long *)(lVar16 + 0x18) + 0x10 + ~uVar13 * 0x30);
            uVar13 = *(ulong *)(lVar5 + 0x118);
            if (uVar13 < uVar10) goto LAB_140116337;
LAB_140116370:
            lStack_a8 = 0;
          }
          lVar11 = func_0x000144e4f270();
          uVar14 = *puVar15;
          uVar12 = 0;
        }
        uVar13 = (ulong)uVar12;
        uVar12 = uVar12 + 1;
      } while (uVar21 <= (uint)(iVar2 - *(int *)(lVar11 + uVar13 * 4)));
    }
    pbVar19 = (byte *)(uVar13 * 0x20 + lStack_a8);
    if ((char *)(lStack_b0 + uVar13) == (char *)0x0) {
      return;
    }
    if (*(char *)(lStack_b0 + uVar13) == '\0') {
      if (*pbVar19 != 5) {
        *puVar7 = uVar3;
        *(undefined1 *)(lVar6 + 0x73) = 0;
                    /* WARNING: Could not emulate address calculation at 0x00014011668c */
                    /* WARNING: Treating indirect jump as call */
        (*(code *)((long)*(int *)((ulong)*pbVar19 * 4 + 0x145dd82f0) + 0x145dd82f0))();
        return;
      }
      if (*(char *)(lVar6 + 0x73) == '\0') {
        *puVar7 = uVar3;
        *(undefined1 *)(lVar6 + 0x73) = 1;
      }
      else {
        *puVar7 = uVar3;
        *(undefined1 *)(lVar6 + 0x73) = 0;
        *puVar8 = uVar4;
        cVar9 = func_0x0001458e5690();
        if (cVar9 != '\0') {
          func_0x0001401838a0();
        }
        *puVar7 = uVar3;
        lVar16 = *(long *)(lVar6 + 0x18);
        if (lVar16 != -1) {
          lVar22 = *(long *)(lVar6 + 0x28);
          if (lVar22 != 0) {
            lVar23 = *(long *)(lVar6 + 0x20) + 8;
            do {
              if (*(long *)(lVar23 + -8) != 0) {
                func_0x0001400021d0();
              }
              lVar23 = lVar23 + 0x20;
              lVar22 = lVar22 + -1;
            } while (lVar22 != 0);
          }
          if (lVar16 != 0) {
            func_0x0001400021d0();
          }
          if (*(long *)(lVar6 + 0x30) != 0) {
            func_0x0001400021d0();
          }
        }
        *(long *)(lVar6 + 0x18) = -1;
      }
    }
  } while( true );
}
