
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long param_3,undefined8 *param_4)

{
  byte bVar1;
  byte bVar2;
  undefined8 uVar3;
  code *pcVar4;
  int iVar5;
  long lVar6;
  long lVar7;
  byte *pbVar8;
  uint *puVar9;
  long lVar10;
  long lVar11;
  ulong uVar12;
  long lVar13;
  ulong uVar14;
  ulong uVar15;
  long lVar16;
  ulong uVar17;
  ulong uVar18;
  byte *pbVar19;
  long lVar20;
  bool bVar21;
  bool bVar22;
  int local_b8;
  ulong local_b0;
  ulong local_a8;
  long local_78;
  ulong local_68;
  byte *local_58;

  uVar12 = *(ulong *)(param_3 + 0x28);
  uVar18 = uVar12 * 0x10;
  if (0x7ffffffffffffff8 < uVar18 || uVar12 >> 0x3c != 0) {
LAB_14552fb32:
    func_0x00014590379b();
                    /* WARNING: Does not return */
    pcVar4 = (code *)invalidInstructionException();
    (*pcVar4)();
  }
  if (uVar18 == 0) {
    local_58 = (byte *)0x8;
    local_68 = 0;
  }
  else {
    func_0x000140002200();
    local_58 = (byte *)func_0x0001400021c0();
    local_68 = uVar12;
    if (local_58 == (byte *)0x0) goto LAB_14552fb32;
  }
  if (uVar12 != 0) {
    func_0x0001457731ed();
    pbVar19 = local_58 + uVar18;
    do {
      uVar12 = *(ulong *)(local_58 + 8);
      uVar18 = (uVar12 - 1) + (ulong)(uVar12 == 0);
      if (0xb < uVar18) {
        uVar18 = 0xc;
      }
      if (1 < uVar12) {
        bVar1 = *local_58;
        uVar12 = *(ulong *)(param_3 + 0xe8);
        uVar14 = 0;
        do {
          lVar6 = *(long *)(param_3 + 0xe0);
          uVar17 = 0;
          if (uVar12 == 0) {
LAB_14552fcd9:
            if (uVar12 == *(ulong *)(param_3 + 0xd8)) {
              lVar6 = param_3;
              func_0x000145774860();
              lVar6 = *(long *)(lVar6 + 0xe0);
            }
            pbVar8 = (byte *)(uVar17 * 0x10 + lVar6);
            if (uVar17 < uVar12) {
              func_0x0001457731e1();
            }
            *pbVar8 = bVar1;
            *(ulong *)(pbVar8 + 8) = uVar14;
            uVar12 = uVar12 + 1;
            *(ulong *)(param_3 + 0xe8) = uVar12;
          }
          else {
            if (uVar12 == 1) {
              lVar20 = 0;
            }
            else {
              uVar17 = uVar12;
              lVar16 = 0;
              do {
                lVar20 = lVar16 + (uVar17 >> 1);
                lVar13 = lVar20 * 0x10;
                bVar2 = *(byte *)(lVar6 + lVar13);
                bVar22 = bVar1 < bVar2;
                if (bVar2 == bVar1) {
                  bVar22 = uVar14 < *(ulong *)(lVar6 + 8 + lVar13);
                }
                if (bVar22) {
                  lVar20 = lVar16;
                }
                uVar17 = uVar17 - (uVar17 >> 1);
                lVar16 = lVar20;
              } while (1 < uVar17);
            }
            bVar2 = *(byte *)(lVar6 + lVar20 * 0x10);
            bVar21 = bVar2 < bVar1;
            bVar22 = false;
            if (bVar2 == bVar1) {
              uVar17 = *(ulong *)(lVar6 + 8 + lVar20 * 0x10);
              bVar21 = uVar17 < uVar14;
              bVar22 = uVar17 == uVar14;
            }
            if ((!bVar21 && !bVar22) != bVar21) {
              uVar17 = lVar20 + (ulong)((char)((!bVar21 && !bVar22) - bVar21) == -1);
              goto LAB_14552fcd9;
            }
          }
          uVar14 = uVar14 + 1;
        } while (uVar14 != uVar18);
      }
      local_58 = local_58 + 0x10;
    } while (local_58 != pbVar19);
  }
  if (local_68 != 0) {
    func_0x0001400021d0();
  }
  uVar12 = *(ulong *)(param_3 + 0x10);
  if (uVar12 == 0) {
    uVar18 = 0;
    uVar14 = 0;
    goto LAB_14552fe80;
  }
  lVar6 = *(long *)(param_3 + 8);
  uVar17 = (ulong)((uint)uVar12 & 3);
  if (uVar12 < 4) {
    uVar14 = 0;
    uVar18 = 0;
LAB_14552fdc3:
    lVar16 = 0;
    do {
      uVar18 = uVar18 + *(uint *)(uVar14 * 0x38 + lVar6 + 0x28 + lVar16);
      lVar16 = lVar16 + 0x38;
    } while (uVar17 * 0x38 - lVar16 != 0);
  }
  else {
    puVar9 = (uint *)(lVar6 + 0xd0);
    uVar14 = 0;
    uVar18 = 0;
    do {
      uVar18 = (ulong)*puVar9 + (ulong)puVar9[-0xe] + (ulong)puVar9[-0x1c] + puVar9[-0x2a] + uVar18;
      uVar14 = uVar14 + 4;
      puVar9 = puVar9 + 0x38;
    } while ((uVar12 & 0xfffffffffffffffc) != uVar14);
    if (uVar17 != 0) goto LAB_14552fdc3;
  }
  if (uVar12 < 4) {
    uVar15 = 0;
    uVar14 = 0;
  }
  else {
    puVar9 = (uint *)(lVar6 + 0xd4);
    uVar15 = 0;
    uVar14 = 0;
    do {
      uVar14 = (ulong)*puVar9 + (ulong)puVar9[-0xe] + (ulong)puVar9[-0x1c] + puVar9[-0x2a] + uVar14;
      uVar15 = uVar15 + 4;
      puVar9 = puVar9 + 0x38;
    } while ((uVar12 & 0xfffffffffffffffc) != uVar15);
    if ((uVar12 & 3) == 0) goto LAB_14552fe80;
  }
  lVar16 = 0;
  do {
    uVar14 = uVar14 + *(uint *)(lVar6 + uVar15 * 0x38 + 0x2c + lVar16);
    lVar16 = lVar16 + 0x38;
  } while (uVar17 * 0x38 - lVar16 != 0);
LAB_14552fe80:
  uVar12 = *(ulong *)(param_3 + 0x1b0);
  if (*(ulong *)(param_3 + 0x1b0) < uVar18) {
    uVar12 = uVar18;
  }
  uVar18 = *(ulong *)(param_3 + 0x1b8);
  if (*(ulong *)(param_3 + 0x1b8) < uVar14) {
    uVar18 = uVar14;
  }
  *(ulong *)(param_3 + 0x1b0) = uVar12;
  *(ulong *)(param_3 + 0x1b8) = uVar18;
  local_78 = 0;
  iVar5 = 0xd;
  if (_DAT_147a3a4e0 < 0xd) {
    iVar5 = (int)_DAT_147a3a4e0;
  }
  lVar6 = (ulong)(uint)(iVar5 << 5) + 0x147a37aa0;
  if (*(int *)((ulong)(uint)(iVar5 << 5) + 0x147a37ab8) != 0) {
    func_0x0001458e9ead();
  }
  lVar16 = *(long *)(lVar6 + 0x10);
  lVar6 = *(long *)(lVar6 + 8);
  lVar20 = lVar6;
LAB_14552ff23:
  lVar13 = lVar20;
  if (lVar13 == lVar16 * 0x70 + lVar6) {
    param_4[2] = local_78;
    *param_4 = 0;
    param_4[1] = 8;
    return;
  }
  uVar12 = *(ulong *)(param_3 + 0xb8);
  if (uVar12 != 0) goto code_r0x00014552ff44;
  goto LAB_14552ffee;
code_r0x00014552ff44:
  uVar3 = *(undefined8 *)(lVar13 + 8);
  uVar18 = *(ulong *)(lVar13 + 0x10);
  lVar20 = *(long *)(param_3 + 0xb0);
  lVar7 = 0;
  lVar11 = lVar7;
  uVar14 = 1;
  if (uVar12 != 1) {
    do {
      uVar17 = uVar12 >> 1;
      lVar7 = lVar11 + uVar17;
      uVar14 = *(ulong *)(lVar20 + 0x10 + lVar7 * 0x18);
      lVar10 = uVar14 - uVar18;
      if (uVar18 <= uVar14) {
        uVar14 = uVar18;
      }
      iVar5 = func_0x0001457731e7(uVar12,lVar10,uVar3,*(undefined8 *)(lVar20 + 8 + lVar7 * 0x18),
                                  uVar14);
      if (iVar5 != 0) {
        lVar10 = (long)iVar5;
      }
      if (0 < lVar10) {
        lVar7 = lVar11;
      }
      uVar12 = uVar12 - uVar17;
      lVar11 = lVar7;
      uVar14 = uVar12;
    } while (1 < uVar12);
  }
  uVar12 = *(ulong *)(lVar20 + 0x10 + lVar7 * 0x18);
  lVar11 = uVar12 - uVar18;
  if (uVar12 < uVar18) {
    uVar18 = uVar12;
  }
  iVar5 = func_0x0001457731e7(uVar14,lVar11,uVar3,*(undefined8 *)(lVar20 + 8 + lVar7 * 0x18),uVar18)
  ;
  if (iVar5 != 0) {
    lVar11 = (long)iVar5;
  }
  lVar20 = lVar13 + 0x70;
  if (lVar11 != 0) {
LAB_14552ffee:
    lVar20 = lVar13 + 0x70;
    func_0x00014552e100();
    if ((local_b8 == 1) && (local_a8 <= local_b0)) {
      func_0x00014542e180();
      if (local_78 == 0) {
        func_0x000145774550();
      }
      *(long *)(local_78 * 8 + 8) = lVar13;
      local_78 = local_78 + 1;
    }
  }
  goto LAB_14552ff23;
}
