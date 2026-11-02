/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_140c03dc0(undefined8 param_1,undefined8 param_2,undefined8 *param_3,undefined8 param_4,
                  undefined8 *param_5,undefined4 *param_6)

{
  undefined4 uVar1;
  undefined4 *puVar2;
  undefined4 *puVar3;
  float *pfVar4;
  code *pcVar5;
  long *plVar6;
  char cVar7;
  undefined8 uVar8;
  undefined4 *puVar9;
  undefined8 *puVar10;
  int iVar11;
  uint uVar12;
  int iVar13;
  uint uVar14;
  float fVar15;
  float fVar16;
  float fVar17;
  float fVar18;
  float fVar19;
  undefined8 in_XMM6_Qa;
  undefined4 in_XMM7_Da;
  undefined8 *in_stack_00000028;
  undefined8 local_2a8;
  undefined8 **local_2a0;
  undefined8 local_298;
  long local_290;
  undefined4 local_1e4;
  undefined8 local_1c8;
  undefined8 uStack_1c0;
  uint *local_1b8;
  ulong local_1b0;
  uint *local_1a8;
  undefined8 local_1a0;
  undefined4 *local_198;
  undefined8 local_190;
  undefined4 *local_188;
  undefined8 local_180;
  undefined8 local_e8;
  undefined8 *local_e0;
  undefined8 *local_d8;
  undefined8 local_d0;
  undefined4 *local_c8;
  float *local_c0;
  undefined8 **local_b8;
  undefined4 *local_b0;
  undefined4 local_a8;
  undefined4 local_a4;
  uint local_a0;
  uint local_9c;
  uint local_98;
  uint uStack_94;
  undefined4 uStack_90;
  undefined4 uStack_8c;
  undefined8 local_88;
  undefined4 local_7c;
  undefined4 local_78;
  undefined1 local_71;
  undefined8 local_70;
  undefined8 local_68;
  undefined4 local_58;

  local_70 = 0xfffffffffffffffe;
  puVar2 = (undefined4 *)*param_3;
  puVar9 = (undefined4 *)param_3[2];
  uVar1 = *(undefined4 *)((long)param_3 + 0x1c);
  puVar3 = (undefined4 *)param_5[2];
  local_7c = *(undefined4 *)((long)param_5 + 0x1c);
  pfVar4 = (float *)*in_stack_00000028;
  local_1c8._0_4_ = *param_6;
  local_1c8._4_4_ = param_6[1];
  uStack_1c0 = *(undefined8 *)(param_6 + 2);
  local_1b8 = *(uint **)(param_6 + 4);
  puVar10 = &local_1c8;
  local_68 = in_XMM6_Qa;
  local_58 = in_XMM7_Da;
  func_0x0001400bfb90(puVar10,*param_5,puVar10,&local_2a8);
  if ((char)local_2a8 != '\x01') {
    local_b8 = local_2a0;
    fVar16 = *pfVar4;
    fVar17 = _DAT_145dcce84;
    if (_DAT_145dcce84 <= fVar16) {
      fVar17 = fVar16;
    }
    fVar16 = _DAT_145d9d4c8;
    if (fVar17 <= _DAT_145d9d4c8) {
      fVar16 = fVar17;
    }
    fVar15 = (float)(*(int *)(local_2a0 + 0x18) + (uint)(*(int *)(local_2a0 + 0x18) == 0));
    fVar18 = _DAT_145f3dea0 / fVar15;
    fVar17 = fVar16;
    if (fVar18 <= fVar16) {
      fVar17 = fVar18;
    }
    fVar19 = (float)(*(int *)((long)local_2a0 + 0xc4) +
                    (uint)(*(int *)((long)local_2a0 + 0xc4) == 0));
    fVar16 = (float)(-(uint)NAN(fVar17) & (uint)fVar16 | ~-(uint)NAN(fVar17) & (uint)fVar17);
    fVar18 = _DAT_145f3dea0 / fVar19;
    fVar17 = fVar16;
    if (fVar18 <= fVar16) {
      fVar17 = fVar18;
    }
    fVar16 = (float)(~-(uint)NAN(fVar17) & (uint)fVar17 | (uint)fVar16 & -(uint)NAN(fVar17));
    fVar19 = fVar16 * fVar19;
    local_c0 = pfVar4;
    local_b0 = puVar3;
    local_78 = uVar1;
    fVar16 = (float)func_0x000145bfa10b(fVar15 * fVar16);
    fVar17 = (float)func_0x000145bfa10b(fVar19);
    iVar13 = (int)(long)fVar16;
    if (fVar16 < 0.0) {
      iVar13 = 0;
    }
    if (_DAT_145dd2e40 < fVar16) {
      iVar13 = -1;
    }
    iVar11 = (int)(long)fVar17;
    if (fVar17 < 0.0) {
      iVar11 = 0;
    }
    if (_DAT_145dd2e40 < fVar17) {
      iVar11 = -1;
    }
    uVar14 = iVar13 + (uint)(iVar13 == 0);
    uVar12 = iVar11 + (uint)(iVar11 == 0);
    if (0x1fff < uVar14) {
      uVar14 = 0x2000;
    }
    if (0x1fff < uVar12) {
      uVar12 = 0x2000;
    }
    if ((uVar14 != puVar2[0xc]) || (uVar12 != puVar2[0xd])) {
      *puVar9 = local_78;
      *local_b0 = local_7c;
      uStack_90 = 1;
      local_1c8 = (float *)((ulong)local_1c8._4_4_ << 0x20);
      local_c8 = puVar9;
      local_a0 = uVar14;
      local_9c = uVar12;
      local_98 = uVar14;
      uStack_94 = uVar12;
      func_0x0001448c6780();
      local_1e4 = 0x10;
      local_71 = 1;
      func_0x000144962cc0();
      func_0x000145bfa0e7();
      local_71 = 0;
      func_0x000140a24af0();
      if (local_98 != 2) {
        local_1c8 = (float *)CONCAT44(uStack_94,local_98);
        uStack_1c0 = CONCAT44(uStack_8c,uStack_90);
        local_71 = 0;
        func_0x000145d995d0();
                    /* WARNING: Does not return */
        pcVar5 = (code *)invalidInstructionException();
        (*pcVar5)();
      }
      local_1c8 = (float *)0xffffffffffffffff;
      local_71 = 0;
      uVar8 = func_0x000144975840();
      local_98 = *puVar2;
      uStack_94 = puVar2[1];
      uStack_90 = puVar2[2];
      uStack_8c = puVar2[3];
      local_88 = *(undefined8 *)(puVar2 + 4);
      *(undefined1 *)puVar2 = 0;
      *(undefined8 *)(puVar2 + 2) = uVar8;
      *local_b0 = local_7c;
      func_0x0001409feff0();
      puVar9 = local_c8;
      if (local_1c8 != (float *)0xfffffffffffffffe) {
        if ((local_1c8 != (float *)0xffffffffffffffff) && (local_1c8 != (float *)0x0)) {
          func_0x0001400021d0();
        }
        if ((local_1b0 < 0xfffffffffffffffe) && (local_1b0 != 0)) {
          func_0x0001400021d0();
        }
      }
      *puVar9 = local_78;
      puVar2[0xc] = uVar14;
      puVar2[0xd] = uVar12;
      if ((*_DAT_14807cfa8 < 3) &&
         (((DAT_148045ff0 - 1 < 2 ||
           ((DAT_148045ff0 != 0 && (cVar7 = func_0x000145d45220(), cVar7 != '\0')))) &&
          (cVar7 = func_0x000144c5d8d0(), cVar7 != '\0')))) {
        local_1a8 = &local_9c;
        local_290 = _DAT_148045fe0 + 0x30;
        local_a4 = *(undefined4 *)(local_b8 + 0x18);
        local_a8 = *(undefined4 *)((long)local_b8 + 0xc4);
        local_1c8 = local_c0;
        uStack_1c0 = 0x145bddbe0;
        local_1b8 = &local_a0;
        local_1b0 = 0x145bde8e0;
        local_1a0 = 0x145bde8e0;
        local_198 = &local_a4;
        local_190 = 0x145bde8e0;
        local_188 = &local_a8;
        local_180 = 0x145bde8e0;
        local_e8 = 0x145f40dfc;
        local_d8 = &local_e8;
        local_d0 = 0x145f3e2c0;
        local_2a8 = 1;
        local_2a0 = &local_d8;
        local_298 = 1;
        local_e0 = puVar10;
        func_0x000144c5f0f0();
      }
      if ((char)local_98 == '\0') {
        plVar6 = (long *)CONCAT44(uStack_8c,uStack_90);
        LOCK();
        *plVar6 = *plVar6 + -1;
        UNLOCK();
        if (*plVar6 == 0) {
          func_0x000144985170();
        }
      }
    }
  }
  return;
}
