
/* WARNING: Type propagation algorithm not settling */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(void)

{
  undefined4 *puVar1;
  ushort uVar2;
  long lVar3;
  code *pcVar4;
  float fVar5;
  float fVar6;
  float fVar7;
  float fVar8;
  int *piVar9;
  byte bVar10;
  undefined4 uVar11;
  byte *pbVar12;
  long lVar13;
  int iVar14;
  uint uVar15;
  long in_RCX;
  int iVar16;
  long lVar17;
  ulong *puVar18;
  long lVar19;
  long *plVar20;
  undefined4 uVar21;
  int *piVar22;
  ulong uVar23;
  ulong uVar24;
  ulong *puVar25;
  ulong uVar26;
  bool bVar27;
  float fVar28;
  float fVar29;
  float fVar30;
  float fVar31;
  float fVar32;
  float fVar33;
  uint uVar34;
  uint uVar35;
  float fVar36;
  float fVar37;
  float fVar38;
  ulong local_170;
  undefined8 local_130;
  undefined4 uStack_128;
  undefined4 uStack_124;

  bVar10 = *(char *)(in_RCX + 0x29c) - 2;
  if (bVar10 < 10) {
    lVar19 = *(long *)((ulong)bVar10 * 8 + 0x1469f84c0);
    bVar10 = *(char *)(in_RCX + 0x29d) - 2;
    if (6 < bVar10) goto LAB_1454a6ae1;
LAB_1454a6b00:
    lVar17 = *(long *)((ulong)bVar10 * 8 + 0x1469f8488);
  }
  else {
    lVar19 = 0x146735848;
    bVar10 = *(char *)(in_RCX + 0x29d) - 2;
    if (bVar10 < 7) goto LAB_1454a6b00;
LAB_1454a6ae1:
    lVar17 = 0x1467346d8;
  }
  uVar26 = *(ulong *)(in_RCX + 0x6e8);
  if (0x7ffffffffffffffc < uVar26 * 8 || uVar26 >> 0x3d != 0) {
LAB_1454a6b3f:
    func_0x00014590379b();
                    /* WARNING: Does not return */
    pcVar4 = (code *)invalidInstructionException();
    (*pcVar4)();
  }
  if (uVar26 * 8 == 0) {
    pbVar12 = (byte *)0x4;
    uVar24 = 0;
  }
  else {
    func_0x000140002200();
    pbVar12 = (byte *)func_0x0001400021c0();
    uVar24 = uVar26;
    if (pbVar12 == (byte *)0x0) goto LAB_1454a6b3f;
  }
  local_130 = 0;
  local_170 = uVar24;
  if (uVar26 != 0) {
    func_0x0001457731ed();
    local_130 = uVar26;
  }
  if (*(long *)(in_RCX + 0x60) != 0) {
    fVar33 = *(float *)(in_RCX + 0x934);
    puVar25 = *(ulong **)(in_RCX + 0x58);
    puVar18 = puVar25 + *(long *)(in_RCX + 0x60) * 2;
    lVar3 = *(long *)(in_RCX + 0x710);
    uVar23 = *(ulong *)(in_RCX + 0x718);
    do {
      if (((fVar33 < *(float *)((long)puVar25 + 0xc)) && (*puVar25 < uVar23)) &&
         (lVar13 = *puVar25 * 0x40, *(char *)(lVar3 + lVar13) == '\x0f')) {
        lVar13 = lVar13 + lVar3;
        bVar10 = *(byte *)(lVar13 + 1);
        fVar31 = (float)(uint)puVar25[1] * *(float *)(lVar13 + 4);
        if (uVar26 == uVar24) {
          func_0x000145780180();
        }
        pbVar12[uVar26 * 8] = bVar10;
        *(float *)(pbVar12 + uVar26 * 8 + 4) = fVar31;
        uVar26 = uVar26 + 1;
        local_130 = uVar26;
      }
      puVar25 = puVar25 + 2;
      local_170 = uVar24;
    } while (puVar25 != puVar18);
  }
  fVar8 = _DAT_14593f7c0;
  fVar7 = _DAT_1459158a0;
  fVar6 = _DAT_1459132f4;
  fVar5 = _DAT_145907490;
  fVar29 = (float)*(uint *)(in_RCX + 0x410) + _DAT_14590750c;
  fVar31 = _DAT_145915914 * fVar29 + _DAT_145907490;
  fVar33 = *(float *)(lVar19 + 0x84);
  iVar14 = (int)(long)fVar29;
  if (fVar29 < 0.0) {
    iVar14 = 0;
  }
  iVar16 = -1;
  if (fVar29 <= _DAT_14590752c) {
    iVar16 = iVar14;
  }
  fVar28 = _DAT_145913300 * fVar29 + _DAT_1459132f8;
  uVar34 = (iVar16 + 1U) / 0xf;
  uVar15 = 3;
  if (uVar34 < 3) {
    uVar15 = uVar34;
  }
  if (*(long *)(lVar17 + 0x28) != 0) {
                    /* WARNING: Could not emulate address calculation at 0x0001454a6b0a */
                    /* WARNING: Treating indirect jump as call */
    (*(code *)((long)*(int *)((ulong)**(uint **)(lVar17 + 0x20) * 4 + 0x1469f85c8) + 0x1469f85c8))
              (fVar28,_DAT_1459158a0,(*(uint **)(lVar17 + 0x20))[1],_DAT_145907490,fVar29,0,fVar31,
               _DAT_145907490);
    return;
  }
  fVar32 = 0.0;
  if (*(long *)(in_RCX + 0x300) != 0) {
                    /* WARNING: Could not recover jumptable at 0x0001454a6e8b. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*(code *)((long)*(int *)((ulong)**(uint **)(in_RCX + 0x2f8) * 4 + 0x1469f85f8) + 0x1469f85f8))
              ();
    return;
  }
  if (*(long *)(in_RCX + 0x2d0) != 0) {
                    /* WARNING: Could not emulate address calculation at 0x0001454a6f06 */
                    /* WARNING: Treating indirect jump as call */
    (*(code *)((long)*(int *)((ulong)*(byte *)(**(long **)(in_RCX + 0x2c8) + 0x44) * 4 + 0x1469f862c
                             ) + 0x1469f862c))();
    return;
  }
  if (uVar26 != 0) {
                    /* WARNING: Could not emulate address calculation at 0x0001454a7130 */
                    /* WARNING: Treating indirect jump as call */
    (*(code *)((long)*(int *)((ulong)*pbVar12 * 4 + 0x1469f8678) + 0x1469f8678))();
    return;
  }
  piVar9 = *(int **)(in_RCX + 0x310);
  fVar36 = _DAT_145907490;
  while (piVar22 = piVar9, piVar22 != *(int **)(in_RCX + 0x310) + *(long *)(in_RCX + 0x318) * 6) {
    piVar9 = piVar22 + 6;
    if (*(float *)(in_RCX + 0x934) < (float)piVar22[4]) {
      if (*piVar22 == 8) {
        fVar31 = fVar31 + (float)piVar22[1] * (_DAT_145907490 + 0.0);
        iVar14 = piVar22[3];
      }
      else {
        if (*piVar22 == 9) {
          fVar32 = fVar32 + (float)piVar22[1] * (_DAT_145907490 + 0.0);
        }
        iVar14 = piVar22[3];
      }
      if (iVar14 == 0x5bd1) {
        fVar31 = fVar31 + _DAT_145907498;
      }
      else if (iVar14 == 0x5b9b) {
        fVar36 = fVar36 + _DAT_145907534;
      }
    }
  }
  fVar30 = (fVar29 * _DAT_14593f7c0 + *(float *)(lVar19 + 0x80) + 0.0) * _DAT_145907490;
  fVar32 = _DAT_145907490 / (fVar32 + _DAT_145907490);
  fVar37 = fVar33 - _DAT_145907534;
  fVar29 = fVar33;
  if (_DAT_145907534 <= fVar33) {
    fVar29 = _DAT_145907534;
  }
  fVar33 = (float)(-(uint)NAN(fVar29) & (uint)fVar33 | ~-(uint)NAN(fVar29) & (uint)fVar29);
  if (fVar37 <= 0.0) {
    fVar37 = 0.0;
  }
  fVar29 = (fVar33 * 0.0) / _DAT_145915800;
  fVar38 = fVar30 - *(float *)(in_RCX + 0x470);
  *(float *)(in_RCX + 0x470) = fVar30;
  *(float *)(in_RCX + 0x474) = fVar29 + fVar37 * 0.0 + fVar31;
  *(float *)(in_RCX + 0x478) = fVar32;
  uVar34 = (int)((uint)(fVar5 < fVar7) << 0x1f) >> 0x1f;
  uVar35 = (int)((uint)(fVar5 < fVar7) << 0x1f) >> 0x1f;
  *(ulong *)(in_RCX + 0x47c) =
       CONCAT44(~uVar35 & (uint)fVar6,~uVar34 & (uint)fVar7) |
       CONCAT44((uint)(_DAT_14590750c + fVar7 + fVar6) & uVar35,_DAT_145a47630 & uVar34);
  if (_DAT_145a2e6b8 <= fVar36) {
    fVar36 = _DAT_145a2e6b8;
  }
  *(float *)(in_RCX + 0x484) = fVar36;
  *(float *)(in_RCX + 0x488) = fVar8;
  *(float *)(in_RCX + 0x48c) = fVar5;
  *(float *)(in_RCX + 0x490) = fVar33;
  *(float *)(in_RCX + 0x494) = fVar28 + fVar30 * 0.0;
  *(float *)(in_RCX + 0x498) = fVar5;
  *(undefined4 *)(in_RCX + 0x49c) = 0;
  *(float *)(in_RCX + 0x4a0) = fVar5;
  *(undefined4 *)(in_RCX + 0x4a4) = 0;
  *(undefined4 *)(in_RCX + 0x4a8) = 0;
  *(undefined4 *)(in_RCX + 0x4ac) = 0;
  *(undefined4 *)(in_RCX + 0x4b0) = 0;
  *(uint *)(in_RCX + 0x4b4) = uVar15;
  *(undefined4 *)(in_RCX + 0x4b8) = 0;
  fVar33 = *(float *)(in_RCX + 0x418);
  if (0.0 < fVar38) {
    fVar33 = fVar33 + fVar38;
    *(float *)(in_RCX + 0x418) = fVar33;
  }
  fVar31 = fVar33;
  if (fVar30 <= fVar33) {
    fVar31 = fVar30;
  }
  *(uint *)(in_RCX + 0x418) = -(uint)NAN(fVar31) & (uint)fVar33 | ~-(uint)NAN(fVar31) & (uint)fVar31
  ;
  if (_DAT_14594e610 <
      (float)((uint)(fVar36 * _DAT_145915874 - *(float *)(in_RCX + 0x4d0)) & _DAT_145915780)) {
    *(float *)(in_RCX + 0x4d0) = fVar36 * _DAT_145915874;
    *(int *)(in_RCX + 0x4cc) = *(int *)(in_RCX + 0x4cc) + 1;
    func_0x00014545e050();
    lVar19 = *(long *)(in_RCX + 0x560);
    if (lVar19 == *(long *)(in_RCX + 0x550)) {
      func_0x000145774710();
    }
    lVar17 = *(long *)(in_RCX + 0x558);
    puVar1 = (undefined4 *)(lVar17 + 0x10 + lVar19 * 0x20);
    *puVar1 = (undefined4)local_130;
    puVar1[1] = local_130._4_4_;
    puVar1[2] = uStack_128;
    puVar1[3] = uStack_124;
    puVar25 = (ulong *)(lVar17 + lVar19 * 0x20);
    *puVar25 = uVar24;
    puVar25[1] = (ulong)pbVar12;
    *(long *)(in_RCX + 0x560) = lVar19 + 1;
  }
  fVar31 = 0.0;
  fVar33 = (float)func_0x00014577327d();
  uVar11 = (int)(long)fVar33;
  if (fVar33 < fVar31) {
    uVar11 = 0;
  }
  uVar21 = 0xffffffff;
  if (fVar33 <= _DAT_14590752c) {
    uVar21 = uVar11;
  }
  plVar20 = (long *)(in_RCX + 0x8d8);
  lVar19 = *(long *)(in_RCX + 0x8d8);
  if (lVar19 != 0) {
    lVar17 = *(long *)(in_RCX + 0x8e0);
    do {
      uVar24 = (ulong)((uint)*(ushort *)(lVar19 + 0x36) * 2);
      uVar26 = 0xffffffffffffffff;
      do {
        uVar23 = (ulong)*(ushort *)(lVar19 + 0x36);
        if (uVar24 == 0) goto LAB_1454a7573;
        uVar2 = *(ushort *)(lVar19 + 0x3a + uVar26 * 2);
        uVar23 = uVar26 + 1;
        uVar24 = uVar24 - 2;
        uVar26 = uVar23;
      } while ((char)((uVar2 < 0x16) - (0x16 < uVar2)) == '\x01');
      if (uVar2 < 0x16 == 0x16 < uVar2) {
        *(undefined4 *)(lVar19 + 8 + uVar23 * 4) = uVar21;
        goto LAB_1454a75b9;
      }
LAB_1454a7573:
      bVar27 = lVar17 == 0;
      lVar17 = lVar17 + -1;
      if (bVar27) break;
      lVar19 = *(long *)(lVar19 + 0x50 + uVar23 * 8);
    } while( true );
  }
  func_0x00014552a730();
LAB_1454a75b9:
  fVar33 = (float)func_0x00014577327d();
  uVar11 = (int)(long)fVar33;
  if (fVar33 < 0.0) {
    uVar11 = 0;
  }
  uVar21 = 0xffffffff;
  if (fVar33 <= _DAT_14590752c) {
    uVar21 = uVar11;
  }
  lVar19 = *plVar20;
  if (lVar19 != 0) {
    lVar17 = *(long *)(in_RCX + 0x8e0);
    do {
      uVar24 = (ulong)((uint)*(ushort *)(lVar19 + 0x36) * 2);
      uVar26 = 0xffffffffffffffff;
      do {
        uVar23 = (ulong)*(ushort *)(lVar19 + 0x36);
        if (uVar24 == 0) goto LAB_1454a7643;
        uVar2 = *(ushort *)(lVar19 + 0x3a + uVar26 * 2);
        uVar23 = uVar26 + 1;
        uVar24 = uVar24 - 2;
        uVar26 = uVar23;
      } while ((char)((uVar2 < 0x1c) - (0x1c < uVar2)) == '\x01');
      if (uVar2 < 0x1c == 0x1c < uVar2) {
        *(undefined4 *)(lVar19 + 8 + uVar23 * 4) = uVar21;
        goto LAB_1454a7689;
      }
LAB_1454a7643:
      bVar27 = lVar17 == 0;
      lVar17 = lVar17 + -1;
      if (bVar27) break;
      lVar19 = *(long *)(lVar19 + 0x50 + uVar23 * 8);
    } while( true );
  }
  func_0x00014552a730();
LAB_1454a7689:
  lVar19 = *(long *)(in_RCX + 0x8d8);
  if (lVar19 != 0) {
    lVar17 = *(long *)(in_RCX + 0x8e0);
    do {
      uVar24 = (ulong)((uint)*(ushort *)(lVar19 + 0x36) * 2);
      uVar26 = 0xffffffffffffffff;
      do {
        uVar23 = (ulong)*(ushort *)(lVar19 + 0x36);
        if (uVar24 == 0) goto LAB_1454a7713;
        uVar2 = *(ushort *)(lVar19 + 0x3a + uVar26 * 2);
        uVar23 = uVar26 + 1;
        uVar24 = uVar24 - 2;
        uVar26 = uVar23;
      } while ((char)((uVar2 < 0x455) - (0x455 < uVar2)) == '\x01');
      if (uVar2 < 0x455 == 0x455 < uVar2) {
        *(float *)(lVar19 + 8 + uVar23 * 4) = *(float *)(in_RCX + 0x47c) * _DAT_14590753c;
        if (local_170 == 0) {
          return;
        }
        goto LAB_1454a7734;
      }
LAB_1454a7713:
      bVar27 = lVar17 == 0;
      lVar17 = lVar17 + -1;
      if (bVar27) break;
      lVar19 = *(long *)(lVar19 + 0x50 + uVar23 * 8);
    } while( true );
  }
  func_0x00014552a730();
  if (local_170 != 0) {
LAB_1454a7734:
    func_0x0001400021d0();
  }
  return;
}
