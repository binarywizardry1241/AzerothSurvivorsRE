/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 param_4,undefined8 param_5
          ,long *param_6)

{
  float fVar1;
  char cVar2;
  char cVar3;
  int iVar4;
  undefined4 uVar5;
  long lVar6;
  long lVar7;
  long lVar8;
  undefined4 *puVar9;
  long lVar10;
  bool bVar11;
  uint uVar12;
  long lVar13;
  long lVar14;
  ulong uVar15;
  ulong uVar16;
  long lVar17;
  uint uVar18;
  uint *puVar19;
  uint *puVar20;
  int *piVar21;
  undefined8 uVar22;
  undefined8 *puVar23;
  float fVar24;
  float fVar25;
  float fVar26;
  long *in_stack_00000028;
  int *local_e0;
  int *local_d8;
  long local_c8;
  long local_b8;
  long local_a8;
  long local_90;

  lVar6 = *param_3;
  lVar7 = param_3[1];
  iVar4 = *(int *)((long)param_3 + 0x14);
  lVar8 = *param_6;
  puVar9 = (undefined4 *)param_6[2];
  uVar5 = *(undefined4 *)((long)param_6 + 0x1c);
  lVar10 = *in_stack_00000028;
  puVar20 = *(uint **)(lVar6 + 0xf8);
  puVar19 = puVar20 + *(long *)(lVar6 + 0x100);
  cVar2 = *(char *)(lVar6 + 0x108);
  uVar12 = iVar4 - (int)param_3[2];
  uVar18 = 0xc233b000;
  if (uVar12 < 0xc233b000) {
    uVar18 = uVar12;
  }
  uVar22 = 0;
  local_c8 = 8;
  local_a8 = 0;
  bVar11 = false;
  lVar13 = 0;
  uVar16 = 0;
  local_90 = 0;
  fVar25 = _DAT_145da0424;
  fVar26 = _DAT_145d97480;
LAB_14010a999:
  do {
    while (cVar2 != '\0') {
      do {
        uVar15 = uVar16;
        if ((int)uVar15 == (int)uVar22) {
          if (puVar20 == puVar19) {
            return;
          }
          uVar16 = (ulong)*puVar20;
          puVar20 = puVar20 + 1;
          lVar13 = *(long *)(lVar7 + 0x1a8);
          if (*(long *)(lVar13 + 0x10 + uVar16 * 0x48) == 0) {
            do {
              if (puVar20 == puVar19) {
                return;
              }
              uVar12 = *puVar20;
              puVar20 = puVar20 + 1;
            } while (*(long *)(*(long *)(lVar7 + 0x1a8) + 0x10 + (ulong)uVar12 * 0x48) == 0);
            lVar14 = *(long *)(lVar7 + 0x1a8) + (ulong)uVar12 * 0x48;
            puVar23 = (undefined8 *)(lVar14 + 0x10);
            uVar16 = *(ulong *)(lVar6 + 0x110);
            uVar15 = *(ulong *)(lVar14 + 0x40);
            if (uVar16 < uVar15) goto LAB_14010aa7a;
LAB_14010aab0:
            local_90 = 0;
            uVar16 = *(ulong *)(lVar6 + 0x118);
            if (uVar15 <= uVar16) goto LAB_14010ab10;
LAB_14010aac7:
            if (*(long *)(*(long *)(lVar14 + 0x38) + uVar16 * 8) == 0) goto LAB_14010ab10;
            uVar16 = *(ulong *)(lVar6 + 0x120);
            if (uVar16 < uVar15) goto LAB_14010ab2e;
LAB_14010a9b0:
            bVar11 = false;
          }
          else {
            lVar14 = lVar13 + uVar16 * 0x48;
            puVar23 = (undefined8 *)(lVar13 + uVar16 * 0x48 + 0x10);
            uVar16 = *(ulong *)(lVar6 + 0x110);
            uVar15 = *(ulong *)(lVar14 + 0x40);
            if (uVar15 <= uVar16) goto LAB_14010aab0;
LAB_14010aa7a:
            uVar16 = *(ulong *)(*(long *)(lVar14 + 0x38) + uVar16 * 8);
            if (uVar16 == 0) goto LAB_14010aab0;
            local_90 = *(long *)(*(long *)(lVar14 + 0x18) + 0x10 + ~uVar16 * 0x30);
            uVar16 = *(ulong *)(lVar6 + 0x118);
            if (uVar16 < uVar15) goto LAB_14010aac7;
LAB_14010ab10:
            uVar16 = *(ulong *)(lVar6 + 0x120);
            if (uVar15 <= uVar16) goto LAB_14010a9b0;
LAB_14010ab2e:
            uVar16 = *(ulong *)(*(long *)(lVar14 + 0x38) + uVar16 * 8);
            if (uVar16 == 0) goto LAB_14010a9b0;
            lVar13 = ~uVar16 * 0x30;
            local_a8 = *(long *)(*(long *)(lVar14 + 0x18) + 0x10 + lVar13);
            local_b8 = *(long *)(*(long *)(lVar14 + 0x18) + 0x28 + lVar13);
            bVar11 = true;
          }
          uVar15 = 0;
          lVar13 = func_0x000144e493f0();
          uVar22 = *puVar23;
        }
        uVar16 = (ulong)((int)uVar15 + 1);
      } while (uVar18 <= (uint)(iVar4 - *(int *)(lVar13 + uVar15 * 4)));
      if (!bVar11) {
        bVar11 = false;
        lVar14 = 0;
        cVar3 = *(char *)(local_90 + uVar15);
        piVar21 = local_e0;
        goto joined_r0x00014010ae4b;
      }
      local_e0 = (int *)(local_b8 + uVar15 * 4);
      lVar14 = uVar15 * 0x20 + local_a8;
      bVar11 = true;
      cVar3 = *(char *)(local_90 + uVar15);
      piVar21 = local_e0;
joined_r0x00014010adc4:
      if (cVar3 == '\0') goto LAB_14010ae77;
    }
    do {
      if ((int)uVar16 == (int)uVar22) {
        if (puVar20 == puVar19) {
          return;
        }
        uVar12 = *puVar20;
        puVar20 = puVar20 + 1;
        if (*(long *)(*(long *)(lVar7 + 0x108) + 0x58 + (ulong)uVar12 * 0xa0) == 0) {
          do {
            if (puVar20 == puVar19) {
              return;
            }
            uVar12 = *puVar20;
            puVar20 = puVar20 + 1;
          } while (*(long *)(*(long *)(lVar7 + 0x108) + 0x58 + (ulong)uVar12 * 0xa0) == 0);
          lVar14 = *(long *)(lVar7 + 0x108) + (ulong)uVar12 * 0xa0;
        }
        else {
          lVar14 = *(long *)(lVar7 + 0x108) + (ulong)uVar12 * 0xa0;
        }
        lVar13 = *(long *)(lVar7 + 0x1a8) + (ulong)*(uint *)(lVar14 + 0x94) * 0x48;
        uVar16 = *(ulong *)(*(long *)(lVar7 + 0x1a8) + 0x40 + (ulong)*(uint *)(lVar14 + 0x94) * 0x48
                           );
        if ((*(ulong *)(lVar6 + 0x110) < uVar16) &&
           (uVar15 = *(ulong *)(*(long *)(lVar13 + 0x38) + *(ulong *)(lVar6 + 0x110) * 8),
           uVar15 != 0)) {
          local_90 = *(long *)(*(long *)(lVar13 + 0x18) + 0x10 + ~uVar15 * 0x30);
          uVar15 = *(ulong *)(lVar6 + 0x118);
          if (uVar16 <= uVar15) goto LAB_14010ad00;
LAB_14010acb7:
          if (*(long *)(*(long *)(lVar13 + 0x38) + uVar15 * 8) == 0) goto LAB_14010ad00;
          uVar16 = *(ulong *)(lVar6 + 0x120);
          if (uVar16 < *(ulong *)(lVar14 + 0x88)) goto LAB_14010ad22;
LAB_14010ab80:
          bVar11 = false;
        }
        else {
          local_90 = 0;
          uVar15 = *(ulong *)(lVar6 + 0x118);
          if (uVar15 < uVar16) goto LAB_14010acb7;
LAB_14010ad00:
          uVar16 = *(ulong *)(lVar6 + 0x120);
          if (*(ulong *)(lVar14 + 0x88) <= uVar16) goto LAB_14010ab80;
LAB_14010ad22:
          if (*(long *)(*(long *)(lVar14 + 0x80) + uVar16 * 8) == 0) goto LAB_14010ab80;
          lVar17 = ~*(ulong *)(*(long *)(lVar13 + 0x38) + uVar16 * 8) * 0x30;
          local_a8 = *(long *)(*(long *)(lVar13 + 0x18) + 0x10 + lVar17);
          local_b8 = *(long *)(*(long *)(lVar13 + 0x18) + 0x28 + lVar17);
          bVar11 = true;
        }
        uVar16 = 0;
        lVar13 = func_0x000144e493f0();
        local_c8 = *(long *)(lVar14 + 0x50);
        uVar22 = *(undefined8 *)(lVar14 + 0x58);
      }
      lVar14 = uVar16 * 0x10;
      uVar16 = (ulong)((int)uVar16 + 1);
      uVar15 = (ulong)~*(uint *)(local_c8 + 8 + lVar14);
    } while (uVar18 <= (uint)(iVar4 - *(int *)(lVar13 + uVar15 * 4)));
    if (!bVar11) {
      bVar11 = false;
      lVar14 = 0;
      cVar3 = *(char *)(local_90 + uVar15);
      piVar21 = local_d8;
      goto joined_r0x00014010adc4;
    }
    piVar21 = (int *)(local_b8 + uVar15 * 4);
    lVar14 = uVar15 * 0x20 + local_a8;
    bVar11 = true;
    cVar3 = *(char *)(local_90 + uVar15);
    local_d8 = piVar21;
joined_r0x00014010ae4b:
  } while (cVar3 != '\0');
LAB_14010ae77:
  if (lVar14 == 0) {
LAB_14010aeb5:
    func_0x0001400108d0();
    *puVar9 = uVar5;
    if (*(char *)(lVar8 + 0xa0) != -1) {
      func_0x0001400faa30();
    }
    *(undefined1 *)(lVar8 + 0xa0) = 0xff;
    *puVar9 = uVar5;
    *(int *)(lVar8 + 0xe4) = *(int *)(lVar8 + 0xe4) + 1;
    goto LAB_14010a999;
  }
  *piVar21 = iVar4;
  fVar1 = *(float *)(lVar10 + 0x8c);
  if (*(int *)(lVar14 + 0x18) == 1) {
    fVar24 = fVar1 - *(float *)(lVar14 + 0x1c);
    if (fVar24 < fVar25) goto LAB_14010a999;
    if (fVar24 < fVar26) goto LAB_14010aeb5;
  }
  *(undefined4 *)(lVar14 + 0x18) = 1;
  *(float *)(lVar14 + 0x1c) = fVar1;
  goto LAB_14010a999;
}
