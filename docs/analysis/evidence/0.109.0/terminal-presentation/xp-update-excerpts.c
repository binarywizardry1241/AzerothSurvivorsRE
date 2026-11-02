/* Original Ghidra owner 0x1400ceb20, lines448..554. */
  goto joined_r0x0001400d0386;
LAB_1400cf187:
  uVar22 = *(uint *)(local_c0 + 0x2c);
  uVar18 = *(uint *)(local_c0 + 0x30) + uVar22;
  uVar25 = 0x6e;
  iVar14 = 2;
  do {
    uVar19 = uVar18 - (uVar25 - 0x1e);
    if (uVar18 < uVar25 - 0x1e) {
      iVar14 = iVar14 + -2;
      goto LAB_1400cf225;
    }
    uVar20 = uVar19 - (uVar25 - 0xf);
    if (uVar19 < uVar25 - 0xf) {
      iVar14 = iVar14 + -1;
      goto LAB_1400cf225;
    }
    uVar18 = uVar20 - uVar25;
    if (uVar20 < uVar25) goto LAB_1400cf225;
    uVar25 = uVar25 + 0x2d;
    iVar14 = iVar14 + 3;
  } while (uVar25 != 0x36b);
  iVar14 = 0x33;
LAB_1400cf225:
  uVar25 = 0x6e;
  iVar21 = 2;
  uVar18 = uVar22;
  do {
    uVar19 = uVar18 - (uVar25 - 0x1e);
    if (uVar18 < uVar25 - 0x1e) {
      iVar21 = iVar21 + -2;
      goto LAB_1400cf275;
    }
    uVar20 = uVar19 - (uVar25 - 0xf);
    if (uVar19 < uVar25 - 0xf) {
      iVar21 = iVar21 + -1;
      goto LAB_1400cf275;
    }
    uVar18 = uVar20 - uVar25;
    if (uVar20 < uVar25) goto LAB_1400cf275;
    uVar25 = uVar25 + 0x2d;
    iVar21 = iVar21 + 3;
  } while (uVar25 != 0x36b);
  iVar21 = 0x33;
LAB_1400cf275:
  fVar44 = (float)(uint)(iVar14 - iVar21) * _DAT_145dcd0b8 + _DAT_145dcd0dc;
  if (_DAT_145dcd0b0 <= fVar44) {
    fVar44 = _DAT_145dcd0b0;
  }
  fVar44 = (fVar40 - ((float)*(ulong *)(local_c0 + 0x20) * _DAT_145dd2e34 + _DAT_145dd2e38 +
                     _DAT_145dd2e3c)) / fVar44;
  fVar47 = 0.0;
  fVar42 = 0.0;
  if (0.0 <= fVar44) {
    fVar42 = fVar44;
  }
  fVar44 = fVar43;
  if (fVar42 <= fVar43) {
    fVar44 = fVar42;
  }
  fVar44 = fVar43 - fVar44;
  local_88 = in_XMM6_Da;
  local_78 = in_XMM7_Da;
  fVar44 = (float)func_0x000145bfa10b((float)*(uint *)(local_c0 + 0x30) *
                                      (fVar43 - fVar44 * fVar44 * fVar44));
  lVar30 = local_a8;
  iVar14 = 0;
  iVar21 = (int)(long)fVar44;
  if (fVar44 < fVar47) {
    iVar21 = 0;
  }
  local_130 = -1;
  if (fVar44 <= _DAT_145dd2e40) {
    local_130 = iVar21;
  }
  uVar22 = local_130 + uVar22;
  uVar18 = 0x6e;
  uVar25 = 2;
  do {
    uVar19 = uVar22 - (uVar18 - 0x1e);
    if (uVar22 < uVar18 - 0x1e) {
      uVar18 = iVar14 * 0xf + 0x50;
      uVar25 = uVar25 - 2;
      uVar20 = uVar22;
      goto LAB_1400cf369;
    }
    uVar20 = uVar19 - (uVar18 - 0xf);
    if (uVar19 < uVar18 - 0xf) {
      uVar18 = iVar14 * 0xf + 0x5f;
      uVar25 = uVar25 - 1;
      uVar20 = uVar19;
      goto LAB_1400cf369;
    }
    uVar22 = uVar20 - uVar18;
    if (uVar20 < uVar18) goto LAB_1400cf369;
    iVar14 = iVar14 + 3;
    uVar18 = uVar18 + 0x2d;
    uVar25 = uVar25 + 3;
  } while (uVar18 != 0x36b);
  uVar25 = 0x33;
  uVar18 = 0;
  uVar20 = 0;
LAB_1400cf369:
  func_0x000140387410();
  puVar3 = *(uint **)(lVar30 + 0xf8);
  lVar12 = *(long *)(lVar30 + 0x100);
  cVar8 = *(char *)(lVar30 + 0x108);

/* Original Ghidra owner 0x1400ceb20, lines675..707. */
  do {
    uVar9 = uVar22 - (uVar19 - 0x1e);
    if (uVar22 < uVar19 - 0x1e) {
      iVar14 = iVar14 + -2;
LAB_1400cf8cb:
      uVar22 = *(uint *)(local_c0 + 0x34);
      goto joined_r0x0001400cfbae;
    }
    uVar10 = uVar9 - (uVar19 - 0xf);
    if (uVar9 < uVar19 - 0xf) {
      iVar14 = iVar14 + -1;
      uVar22 = *(uint *)(local_c0 + 0x34);
      goto joined_r0x0001400cfbae;
    }
    uVar22 = uVar10 - uVar19;
    if (uVar10 < uVar19) goto LAB_1400cf8cb;
    uVar19 = uVar19 + 0x2d;
    iVar14 = iVar14 + 3;
  } while (uVar19 != 0x36b);
  iVar14 = 0x33;
  uVar22 = *(uint *)(local_c0 + 0x34);
joined_r0x0001400cfbae:
  if (uVar22 < uVar25) {
    *(uint *)(local_c0 + 0x34) = uVar25;
    *local_d0 = local_b0;
    *(undefined4 *)(local_c0 + 0x18) = 1;
    *(float *)(local_c0 + 0x1c) = fVar45;
    local_100 = *(int **)(local_c0 + 8);
    lStack_f8 = *(undefined8 *)(local_c0 + 0x10);
    local_1c0 = CONCAT44(local_1c0._4_4_,uVar25);
    func_0x0001458ec450();
    local_1a8 = 0x45dd3b10;
    uStack_1a4 = 1;

/* Original Ghidra owner 0x1400ceb20, lines788..799. */
    func_0x0001400bfda0();
    plVar37 = (long *)CONCAT44(uStack_1a4,local_1a8);
    if (plVar37 != (long *)0x0) {
      local_c8 = local_198;
      local_b0 = local_190._4_4_;
      local_134 = uVar25 - iVar14;
      local_91 = (undefined1)local_a0;
      if (local_134 == 1) {
        auVar49 = func_0x0001458ec450();
        lVar30 = auVar49._8_8_;
        if (lVar30 < 0) {
LAB_1400cfff6:

/* Original Ghidra owner 0x1400ceb20, lines849..886. */
  if (bVar2 != 0) {
    fVar45 = fVar45 - *(float *)(local_c0 + 0x1c);
  }
  piVar23 = (int *)(local_a8 + 0x360);
  func_0x000140399b70();
  local_f0 = (int *)CONCAT44(local_ac,local_d8);
  local_100 = piVar23;
  lStack_f8 = lVar32;
  func_0x0001400bfda0();
  uVar22 = local_d4;
  puVar35 = local_158;
  lVar30 = local_168;
  puVar24 = local_188;
  uVar6 = uRam0000000145dd3ba4;
  if ((CONCAT44(uStack_1a4,local_1a8) != 0 & bVar2) != 0) {
    uVar34 = local_150._4_4_;
    fVar44 = fVar45 / _DAT_145dd2e44;
    *(undefined4 *)local_178 = local_170._4_4_;
    *puVar24 = _DAT_145dd3b9c;
    puVar24[1] = uVar6;
    fVar42 = 0.0;
    if (0.0 <= fVar45 / _DAT_145dd2e38) {
      fVar42 = fVar45 / _DAT_145dd2e38;
    }
    fVar47 = fVar43;
    if (fVar42 <= fVar43) {
      fVar47 = fVar42;
    }
    fVar47 = fVar43 - fVar47;
    if (fVar43 <= fVar44) {
      fVar44 = fVar43;
    }
    fVar42 = fVar47 * fVar47 * fVar47 + _DAT_145dcd0c4;
    *(float *)(puVar24 + 2) = fVar44;
    fVar43 = (fVar42 + fVar43) * _DAT_145dcd0fc + fVar43;
    *puVar35 = uVar34;
    *(float *)(lVar30 + 0x10) = fVar43;
    *(float *)(lVar30 + 0x14) = fVar43;

/* Original Ghidra owner 0x1400ceb20, lines1007..1022. */
        return;
      }
      fVar43 = 0.0;
      if (bVar2 != 0) {
        fVar43 = fVar45 / _DAT_145dd2e4c + _DAT_145d9d2a0;
        if (fVar43 <= 0.0) {
          fVar43 = 0.0;
        }
        fVar43 = fVar43 * _DAT_145dcd0fc;
      }
      uStack_1a4 = (undefined4)_DAT_145dcce60;
      uStack_1a0 = (undefined4)((ulong)_DAT_145dcce60 >> 0x20);
      uStack_19c = 0x3f800000;
      local_198 = (int **)CONCAT44(local_198._4_4_,fVar43);
      local_1a8 = 0;
      cVar8 = func_0x0001400e0fc0(puVar35,puVar24,&local_1a8,puVar24);
