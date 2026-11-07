void FUN_140117730(undefined8 param_1,undefined8 param_2,undefined8 *param_3,undefined8 param_4,
                  long *param_5,long *param_6)

{
  char cVar1;
  undefined4 uVar2;
  ulong *puVar3;
  ulong uVar4;
  long lVar5;
  long lVar6;
  long lVar7;
  undefined4 *puVar8;
  char cVar9;
  ulong uVar10;
  ulong uVar11;
  uint uVar12;
  uint uVar13;
  ulong uVar14;
  ulong uVar15;
  ulong uVar16;
  long lVar17;
  long lVar18;
  long lVar19;
  long lVar20;
  long lVar21;
  long lVar22;
  ulong uVar23;
  uint *puVar24;
  long lVar25;
  uint *puVar26;
  long in_stack_00000030;
  undefined4 local_98;
  undefined4 uStack_94;
  long local_80;

  puVar3 = (ulong *)*param_3;
  lVar20 = param_3[1];
  uVar11 = *puVar3;
  uVar14 = 0;
  uVar15 = uVar11 - *(ulong *)(lVar20 + 0x18);
  if (uVar11 < *(ulong *)(lVar20 + 0x18)) {
    uVar15 = uVar14;
  }
  uVar10 = uVar11 - *(ulong *)(lVar20 + 0x38);
  if (uVar11 < *(ulong *)(lVar20 + 0x38)) {
    uVar10 = uVar14;
  }
  lVar21 = uVar15 * 0x18 + *(long *)(lVar20 + 8);
  uVar11 = *(ulong *)(lVar20 + 0x10);
  lVar18 = uVar10 * 0x18 + *(long *)(lVar20 + 0x28);
  uVar16 = uVar11 - uVar15;
  if (uVar11 < uVar15) {
    uVar16 = uVar14;
  }
  uVar4 = *(ulong *)(lVar20 + 0x30);
  if (uVar11 < uVar15) {
    lVar21 = 8;
    uVar15 = uVar11;
  }
  uVar23 = uVar4 - uVar10;
  if (uVar4 < uVar10) {
    lVar18 = 8;
    uVar23 = uVar14;
  }
  lVar20 = *(long *)(lVar20 + 0x40);
  if (uVar4 < uVar10) {
    uVar10 = uVar4;
  }
  lVar5 = *param_5;
  lVar6 = param_5[1];
  lVar7 = *param_6;
  puVar8 = *(undefined4 **)(in_stack_00000030 + 0x10);
  uVar2 = *(undefined4 *)(in_stack_00000030 + 0x1c);
  *puVar3 = (lVar20 - uVar23) - uVar16;
  uVar11 = ((uVar10 + lVar20 + uVar15) - uVar4) - uVar11;
  lVar17 = 0;
  lVar20 = lVar18;
  lVar22 = lVar21;
  do {
    uVar11 = uVar11 + 1;
    if ((lVar22 == 0) || (lVar22 == lVar21 + uVar16 * 0x18)) {
      if ((lVar20 == 0) || (lVar20 == lVar18 + uVar23 * 0x18)) {
        if ((lVar17 != 0) && (*(char *)(lVar7 + 0x72) == '\x01')) {
          puVar24 = *(uint **)(lVar5 + 0xf8);
          puVar26 = puVar24 + *(long *)(lVar5 + 0x100);
          cVar1 = *(char *)(lVar5 + 0x108);
          uVar11 = 0;
          local_80 = 8;
          lVar20 = 0;
          uVar13 = 0;
          while( true ) {
            if (cVar1 == '\0') {
              if (uVar13 == (uint)uVar11) {
                do {
                  if (puVar24 == puVar26) {
                    return;
                  }
                  uVar13 = *puVar24;
                  puVar24 = puVar24 + 1;
                  uVar11 = *(ulong *)(*(long *)(lVar6 + 0x108) + 0x58 + (ulong)uVar13 * 0xa0);
                } while (uVar11 == 0);
                lVar21 = *(long *)(lVar6 + 0x108) + (ulong)uVar13 * 0xa0;
                uVar15 = (ulong)*(uint *)(lVar21 + 0x94);
                lVar20 = *(long *)(lVar6 + 0x1a8) + uVar15 * 0x48;
                if ((*(ulong *)(lVar5 + 0x110) <
                     *(ulong *)(*(long *)(lVar6 + 0x1a8) + 0x40 + uVar15 * 0x48)) &&
                   (uVar15 = *(ulong *)(*(long *)(lVar20 + 0x38) + *(ulong *)(lVar5 + 0x110) * 8),
                   uVar15 != 0)) {
                  lVar20 = *(long *)(*(long *)(lVar20 + 0x18) + 0x10 + ~uVar15 * 0x30);
                }
                else {
                  lVar20 = 0;
                }
                local_80 = *(long *)(lVar21 + 0x50);
                uVar13 = 0;
                uVar11 = uVar11 & 0xffffffff;
              }
              uVar12 = ~*(uint *)(local_80 + 8 + (ulong)uVar13 * 0x10);
            }
            else {
              uVar12 = uVar13;
              if (uVar13 == (uint)uVar11) {
                do {
                  if (puVar24 == puVar26) {
                    return;
                  }
                  uVar13 = *puVar24;
                  puVar24 = puVar24 + 1;
                  uVar11 = *(ulong *)(*(long *)(lVar6 + 0x1a8) + 0x10 + (ulong)uVar13 * 0x48);
                } while (uVar11 == 0);
                lVar20 = *(long *)(lVar6 + 0x1a8) + (ulong)uVar13 * 0x48;
                if ((*(ulong *)(lVar5 + 0x110) < *(ulong *)(lVar20 + 0x40)) &&
                   (uVar15 = *(ulong *)(*(long *)(lVar20 + 0x38) + *(ulong *)(lVar5 + 0x110) * 8),
                   uVar15 != 0)) {
                  lVar20 = *(long *)(*(long *)(lVar20 + 0x18) + 0x10 + ~uVar15 * 0x30);
                }
                else {
                  lVar20 = 0;
                }
                uVar12 = 0;
                uVar11 = uVar11 & 0xffffffff;
                uVar13 = uVar12;
              }
            }
            uVar13 = uVar13 + 1;
            if ((char *)(lVar20 + (ulong)uVar12) == (char *)0x0) break;
            if (*(char *)(lVar20 + (ulong)uVar12) == '\x01') {
              FUN_14589e020();
              cVar9 = func_0x00014590fdd0();
              if (cVar9 == '\0') {
                if (CONCAT44(uStack_94,local_98) != 0) {
                  func_0x0001400021d0();
                }
              }
              else {
                *puVar8 = uVar2;
                FUN_1458a7b80();
                FUN_14589e020();
                FUN_1401838a0();
              }
            }
          }
        }
        return;
      }
      lVar25 = 0;
      lVar19 = lVar20 + 0x18;
      lVar22 = lVar20;
    }
    else {
      lVar25 = lVar22 + 0x18;
      lVar19 = lVar20;
    }
    *puVar3 = uVar11;
    uVar15 = (ulong)*(byte *)(lVar22 + 0x14) ^ 1;
    if (*(short *)(lVar22 + 0x10) != 1) {
      uVar15 = uVar14;
    }
    lVar17 = lVar17 + uVar15;
    lVar20 = lVar19;
    lVar22 = lVar25;
  } while( true );
}
