void entry(undefined8 param_1,undefined8 param_2,undefined8 *param_3,undefined8 param_4,
          long *param_5,long *param_6)

{
  uint *puVar1;
  byte *pbVar2;
  uint *puVar3;
  byte bVar4;
  undefined4 uVar5;
  uint uVar6;
  char *pcVar7;
  long lVar8;
  long lVar9;
  long lVar10;
  ulong uVar11;
  undefined1 uVar12;
  char cVar13;
  ulong uVar14;
  long lVar15;
  long lVar16;
  long lVar17;
  uint *puVar18;
  long lVar19;
  uint *puVar20;
  int iVar21;
  long lVar22;
  uint uVar23;
  uint uVar24;
  long lVar25;
  byte *pbVar26;
  long lVar27;
  bool bVar28;
  bool bVar29;
  bool bVar30;
  long *in_stack_00000028;
  long local_68;
  long local_50;

  pcVar7 = (char *)*param_3;
  lVar8 = *param_5;
  lVar15 = *param_6;
  lVar19 = param_6[1];
  uVar5 = *(undefined4 *)((long)param_6 + 0x14);
  lVar9 = *in_stack_00000028;
  lVar10 = in_stack_00000028[1];
  uVar6 = *(uint *)((long)in_stack_00000028 + 0x14);
  puVar18 = *(uint **)(lVar15 + 0xf8);
  puVar1 = puVar18 + *(long *)(lVar15 + 0x100);
  if (*(char *)(lVar15 + 0x108) == '\0') {
    lVar25 = 0;
    lVar17 = 8;
    lVar16 = 0;
    bVar29 = false;
    bVar28 = false;
    uVar24 = 0;
    do {
      if (uVar24 == (uint)lVar25) {
        do {
          if (puVar18 == puVar1) goto LAB_14027cd0f;
          uVar24 = *puVar18;
          puVar18 = puVar18 + 1;
          lVar25 = *(long *)(*(long *)(lVar19 + 0x108) + 0x58 + (ulong)uVar24 * 0xa0);
        } while (lVar25 == 0);
        lVar17 = *(long *)(lVar19 + 0x108) + (ulong)uVar24 * 0xa0;
        if (*(ulong *)(lVar15 + 0x118) < *(ulong *)(lVar17 + 0x88)) {
          bVar28 = *(long *)(*(long *)(lVar17 + 0x80) + *(ulong *)(lVar15 + 0x118) * 8) != 0;
        }
        else {
          bVar28 = false;
        }
        uVar24 = 0;
        bVar29 = false;
        if (*(ulong *)(lVar15 + 0x120) < *(ulong *)(lVar17 + 0x88)) {
          bVar29 = *(long *)(*(long *)(lVar17 + 0x80) + *(ulong *)(lVar15 + 0x120) * 8) != 0;
        }
        lVar27 = *(long *)(*(long *)(lVar19 + 0x1a8) + 0x18 + (ulong)*(uint *)(lVar17 + 0x94) * 0x48
                          );
        lVar22 = ~*(ulong *)(*(long *)(*(long *)(lVar19 + 0x1a8) + 0x38 +
                                      (ulong)*(uint *)(lVar17 + 0x94) * 0x48) +
                            *(long *)(lVar15 + 0x110) * 8) * 0x30;
        lVar16 = *(long *)(lVar27 + 0x10 + lVar22);
        local_68 = *(long *)(lVar27 + 0x28 + lVar22);
        lVar17 = *(long *)(lVar17 + 0x50);
      }
      if (((*pcVar7 != '\0') || ((bVar28 && (*(char *)(lVar8 + 4) == '\0')))) ||
         ((bVar29 && (*(char *)(lVar8 + 5) == '\0')))) {
        cVar13 = '\x01';
      }
      else {
        cVar13 = '\0';
      }
      uVar14 = (ulong)uVar24;
      uVar24 = uVar24 + 1;
      uVar14 = (ulong)~*(uint *)(lVar17 + 8 + uVar14 * 0x10);
      if (*(char *)(lVar16 + uVar14) != cVar13) {
        *(undefined4 *)(local_68 + uVar14 * 4) = uVar5;
        *(char *)(lVar16 + uVar14) = cVar13;
      }
    } while( true );
  }
  lVar25 = 0;
  lVar16 = 0;
  bVar29 = false;
  bVar28 = false;
  uVar24 = 0;
  lVar17 = lVar9;
LAB_14027caa3:
  do {
    uVar23 = uVar24;
    if (uVar24 == (uint)lVar25) {
      do {
        if (puVar18 == puVar1) goto LAB_14027cd0f;
        uVar24 = *puVar18;
        puVar18 = puVar18 + 1;
        lVar25 = *(long *)(*(long *)(lVar19 + 0x1a8) + 0x10 + (ulong)uVar24 * 0x48);
      } while (lVar25 == 0);
      lVar17 = *(long *)(lVar19 + 0x1a8) + (ulong)uVar24 * 0x48;
      lVar16 = *(long *)(lVar17 + 0x38);
      if (*(ulong *)(lVar15 + 0x118) < *(ulong *)(lVar17 + 0x40)) {
        bVar28 = *(long *)(lVar16 + *(ulong *)(lVar15 + 0x118) * 8) != 0;
      }
      else {
        bVar28 = false;
      }
      uVar23 = 0;
      bVar29 = false;
      if (*(ulong *)(lVar15 + 0x120) < *(ulong *)(lVar17 + 0x40)) {
        bVar29 = *(long *)(lVar16 + *(ulong *)(lVar15 + 0x120) * 8) != 0;
      }
      lVar27 = ~*(ulong *)(lVar16 + *(long *)(lVar15 + 0x110) * 8) * 0x30;
      lVar16 = *(long *)(*(long *)(lVar17 + 0x18) + 0x10 + lVar27);
      lVar17 = *(long *)(*(long *)(lVar17 + 0x18) + 0x28 + lVar27);
    }
    if (((*pcVar7 == '\0') && ((!bVar28 || (*(char *)(lVar8 + 4) == '\x01')))) &&
       ((!bVar29 || (*(char *)(lVar8 + 5) != '\0')))) goto LAB_14027cb82;
    uVar12 = 1;
    uVar24 = uVar23 + 1;
  } while (*(char *)(lVar16 + (ulong)uVar23) == '\x01');
  goto LAB_14027cb94;
LAB_14027cd0f:
  puVar20 = *(uint **)(lVar9 + 0xf8);
  puVar1 = puVar20 + *(long *)(lVar9 + 0x100);
  cVar13 = *(char *)(lVar9 + 0x108);
  lVar15 = 0;
  local_50 = 8;
  lVar19 = 0;
  bVar30 = false;
  bVar28 = false;
  bVar29 = false;
  uVar14 = 0;
  do {
    if (cVar13 == '\0') {
      if ((int)uVar14 == (int)lVar15) {
        do {
          if (puVar20 == puVar1) {
            return;
          }
          uVar24 = *puVar20;
          puVar20 = puVar20 + 1;
          lVar15 = *(long *)(*(long *)(lVar10 + 0x108) + 0x58 + (ulong)uVar24 * 0xa0);
        } while (lVar15 == 0);
        lVar25 = *(long *)(lVar10 + 0x108) + (ulong)uVar24 * 0xa0;
        lVar19 = *(long *)(lVar25 + 0x80);
        uVar11 = *(ulong *)(lVar25 + 0x88);
        if (*(ulong *)(lVar9 + 0x118) < uVar11) {
          bVar30 = *(long *)(lVar19 + *(ulong *)(lVar9 + 0x118) * 8) != 0;
          uVar14 = *(ulong *)(lVar9 + 0x120);
          if (uVar11 <= uVar14) goto LAB_14027ce6d;
LAB_14027cf0f:
          bVar28 = *(long *)(lVar19 + uVar14 * 8) != 0;
        }
        else {
          bVar30 = false;
          uVar14 = *(ulong *)(lVar9 + 0x120);
          if (uVar14 < uVar11) goto LAB_14027cf0f;
LAB_14027ce6d:
          bVar28 = false;
        }
        uVar14 = 0;
        bVar29 = false;
        if (*(ulong *)(lVar9 + 0x128) < uVar11) {
          bVar29 = *(long *)(lVar19 + *(ulong *)(lVar9 + 0x128) * 8) != 0;
        }
        lVar16 = *(long *)(*(long *)(lVar10 + 0x1a8) + 0x18 + (ulong)*(uint *)(lVar25 + 0x94) * 0x48
                          );
        lVar17 = ~*(ulong *)(*(long *)(*(long *)(lVar10 + 0x1a8) + 0x38 +
                                      (ulong)*(uint *)(lVar25 + 0x94) * 0x48) +
                            *(long *)(lVar9 + 0x110) * 8) * 0x30;
        lVar19 = *(long *)(lVar16 + 0x10 + lVar17);
        puVar18 = *(uint **)(lVar16 + 0x28 + lVar17);
        local_50 = *(long *)(lVar25 + 0x50);
      }
      iVar21 = (int)uVar14;
      uVar14 = (ulong)~*(uint *)(local_50 + 8 + uVar14 * 0x10);
    }
    else {
      if ((int)uVar14 == (int)lVar15) {
        do {
          if (puVar20 == puVar1) {
            return;
          }
          uVar24 = *puVar20;
          puVar20 = puVar20 + 1;
          lVar15 = *(long *)(*(long *)(lVar10 + 0x1a8) + 0x10 + (ulong)uVar24 * 0x48);
        } while (lVar15 == 0);
        lVar25 = *(long *)(lVar10 + 0x1a8) + (ulong)uVar24 * 0x48;
        uVar11 = *(ulong *)(lVar25 + 0x40);
        lVar19 = *(long *)(lVar25 + 0x38);
        if (*(ulong *)(lVar9 + 0x118) < uVar11) {
          bVar30 = *(long *)(lVar19 + *(ulong *)(lVar9 + 0x118) * 8) != 0;
          uVar14 = *(ulong *)(lVar9 + 0x120);
          if (uVar11 <= uVar14) goto LAB_14027cdd4;
LAB_14027ce91:
          bVar28 = *(long *)(lVar19 + uVar14 * 8) != 0;
        }
        else {
          bVar30 = false;
          uVar14 = *(ulong *)(lVar9 + 0x120);
          if (uVar14 < uVar11) goto LAB_14027ce91;
LAB_14027cdd4:
          bVar28 = false;
        }
        uVar14 = 0;
        bVar29 = false;
        if (*(ulong *)(lVar9 + 0x128) < uVar11) {
          bVar29 = *(long *)(lVar19 + *(ulong *)(lVar9 + 0x128) * 8) != 0;
        }
        lVar16 = ~*(ulong *)(lVar19 + *(long *)(lVar9 + 0x110) * 8) * 0x30;
        lVar19 = *(long *)(*(long *)(lVar25 + 0x18) + 0x10 + lVar16);
        puVar18 = *(uint **)(*(long *)(lVar25 + 0x18) + 0x28 + lVar16);
      }
      iVar21 = (int)uVar14;
    }
    pbVar2 = (byte *)(lVar19 + uVar14);
    puVar3 = puVar18 + uVar14;
    pbVar26 = (byte *)(lVar8 + 1);
    if (!bVar30) {
      lVar25 = (ulong)bVar29 * 3;
      if (bVar28) {
        lVar25 = 2;
      }
      pbVar26 = (byte *)(lVar25 + lVar8);
    }
    uVar14 = (ulong)(iVar21 + 1);
    bVar4 = *pbVar26;
    if (*pbVar2 != (bVar4 ^ 1)) {
      *puVar3 = uVar6;
      *pbVar2 = bVar4 ^ 1;
    }
  } while( true );
LAB_14027cb82:
  uVar12 = 0;
  uVar24 = uVar23 + 1;
  if (*(char *)(lVar16 + (ulong)uVar23) != '\0') {
LAB_14027cb94:
    uVar24 = uVar23 + 1;
    *(undefined4 *)(lVar17 + (ulong)uVar23 * 4) = uVar5;
    *(undefined1 *)(lVar16 + (ulong)uVar23) = uVar12;
  }
  goto LAB_14027caa3;
}
