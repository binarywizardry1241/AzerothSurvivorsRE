
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long param_3,undefined8 *param_4)

{
  int *piVar1;
  char cVar2;
  int iVar3;
  undefined4 uVar4;
  long *plVar5;
  long lVar6;
  long lVar7;
  undefined8 *puVar8;
  code *pcVar9;
  bool bVar10;
  long *plVar11;
  int iVar12;
  long *plVar13;
  long lVar14;
  long lVar15;
  undefined8 *puVar16;
  long *plVar17;
  long lVar18;
  long *plVar19;
  long *plVar20;
  float extraout_XMM0_Da;
  float fVar21;
  float fVar22;
  float fVar23;
  float fVar24;
  float fVar25;
  float fVar26;
  long local_e0;
  long local_d0;
  long lStack_c0;
  long local_b8;

  plVar17 = *(long **)(param_3 + 0xb8);
  lStack_c0 = 4;
  local_b8 = 0;
  plVar5 = *(long **)(param_3 + 0x330);
  lVar6 = *(long *)(param_3 + 0x338);
  plVar13 = plVar17 + *(long *)(param_3 + 0xc0) * 0xc;
  fVar21 = *(float *)(param_3 + 0x4a8);
  local_d0 = 1;
  local_e0 = 0;
  lVar18 = 0;
  bVar10 = false;
  plVar20 = plVar5;
  lVar15 = 4;
  fVar25 = _DAT_145db14c0;
  fVar26 = _DAT_1460b3fa8;
  fVar23 = _DAT_146c08c20;
LAB_14592a37e:
  if (local_d0 == 2) {
LAB_14592a388:
    if (plVar17 == plVar13) goto LAB_14592a4e8;
    local_d0 = 2;
    plVar11 = plVar17 + 0xc;
    plVar19 = plVar17;
  }
  else {
    plVar11 = plVar17;
    if ((plVar20 == (long *)0x0) || (plVar20 == plVar5 + lVar6 * 0xb)) {
      plVar20 = (long *)0x0;
      if (bVar10) goto LAB_14592a388;
      local_d0 = 1;
      plVar20 = (long *)0x0;
      bVar10 = true;
      plVar19 = (long *)(param_3 + 0x410);
    }
    else {
      local_d0 = 1;
      plVar19 = plVar20;
      plVar20 = plVar20 + 0xb;
    }
  }
  plVar17 = plVar11;
  lVar7 = *plVar19;
  iVar3 = *(int *)(lVar7 + 0x40);
  iVar12 = func_0x00014596ca90();
  if (iVar12 == 1) {
    lVar14 = 0;
    do {
      if (lVar18 == lVar14) {
        if (*(char *)(lVar7 + 0x75) == '\b') {
          fVar24 = *(float *)((long)plVar19 + 0x1c) * *(float *)((long)plVar19 + 0x44) *
                   *(float *)(lVar7 + 0x4c);
        }
        else {
          fVar24 = *(float *)((long)plVar19 + 0x1c) * *(float *)((long)plVar19 + 0x44) *
                   *(float *)(lVar7 + 0x50);
        }
        fVar24 = fVar24 * fVar21;
        fVar22 = extraout_XMM0_Da;
        if (fVar26 < fVar24) {
          fVar24 = (float)func_0x000145c0a53d((fVar24 + fVar23) / fVar25);
          fVar24 = fVar24 * fVar25 + fVar26;
        }
        cVar2 = *(char *)(lVar7 + 0x75);
        uVar4 = *(undefined4 *)(lVar7 + 0x40);
        if (local_e0 == 0) {
          func_0x000145c16320();
          lVar15 = lStack_c0;
        }
        *(undefined4 *)(lVar15 + local_e0 * 0xc) = uVar4;
        *(float *)(lVar15 + 4 + local_e0 * 0xc) = fVar24 / fVar22;
        *(bool *)(lVar15 + 8 + local_e0 * 0xc) = cVar2 == '\b';
        local_e0 = local_e0 + 1;
        lVar18 = lVar18 + 0xc;
        lVar15 = lStack_c0;
        local_b8 = local_e0;
        break;
      }
      piVar1 = (int *)(lVar15 + lVar14);
      lVar14 = lVar14 + 0xc;
    } while (*piVar1 != iVar3);
  }
  goto LAB_14592a37e;
LAB_14592a4e8:
  lVar15 = *(long *)(param_3 + 0xd0);
  lVar18 = *(long *)(param_3 + 0xd8) << 7;
  do {
    if (lVar18 == 0) goto LAB_14592a678;
    plVar17 = (long *)(lVar15 + 0x18);
    lVar15 = lVar15 + 0x80;
    lVar18 = lVar18 + -0x80;
  } while (*(char *)(*plVar17 + 0x39) != '\x06');
  lVar15 = 0;
  while ((*(long *)(lVar15 + 0x146bf5eb8) != 8 ||
         (**(long **)(lVar15 + 0x146bf5eb0) != 0x657269666c6c6568))) {
    lVar15 = lVar15 + 0x78;
    if (lVar15 == 0x34f8) {
      func_0x000145da9a60();
                    /* WARNING: Does not return */
      pcVar9 = (code *)invalidInstructionException();
      (*pcVar9)();
    }
  }
  puVar16 = (undefined8 *)(lVar15 + 0x146bf5eb0);
  fVar23 = _DAT_145dad260;
  if (lVar6 != 0) {
    lVar15 = 0;
    do {
      puVar8 = *(undefined8 **)((long)plVar5 + lVar15);
      if ((puVar8[1] == 8) && (*(long *)*puVar8 == 0x657269666c6c6568)) {
        puVar16 = puVar8;
        fVar23 = *(float *)((long)plVar5 + lVar15 + 0x1c);
        break;
      }
      lVar15 = lVar15 + 0x58;
    } while (lVar6 * 0x58 != lVar15);
  }
  func_0x000145897880();
  func_0x000145897ab0();
  fVar23 = fVar23 * 0.0;
  func_0x000145896300();
  fVar21 = fVar21 * fVar23 * *(float *)(puVar16 + 10);
  if (fVar26 < fVar21) {
    fVar21 = (float)func_0x000145c0a53d((fVar21 + _DAT_146c08c20) / fVar25);
    fVar21 = fVar21 * fVar25 + _DAT_1460b3fa8;
  }
  if (local_b8 == 0) {
    func_0x000145c16320();
  }
  fVar21 = fVar21 / _DAT_145db14c0;
  *(undefined4 *)(local_b8 * 0xc + 4) = 0x2da3;
  *(float *)(local_b8 * 0xc + 8) = fVar21;
  *(undefined1 *)(local_b8 * 0xc + 0xc) = 0;
  local_b8 = local_b8 + 1;
LAB_14592a678:
  param_4[2] = local_b8;
  *param_4 = 0;
  param_4[1] = 4;
  return;
}
