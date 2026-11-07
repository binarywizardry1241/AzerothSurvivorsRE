
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,char *param_3,undefined8 *param_4)

{
  long lVar1;
  char cVar2;
  char cVar3;
  char cVar4;
  int iVar5;
  undefined8 uVar6;
  code *pcVar7;
  ulong uVar8;
  long lVar9;
  long *plVar10;
  undefined8 uVar11;
  int iVar12;
  ulong uVar13;
  char *pcVar14;
  undefined8 uVar15;
  char *pcVar16;
  undefined4 uVar17;
  undefined4 in_XMM6_Da;
  undefined4 uVar18;
  undefined4 uVar19;
  undefined4 uVar20;
  undefined4 uVar21;
  undefined8 local_d28 [272];
  uint local_4a8;
  undefined4 local_4a4;
  undefined1 local_390;
  char local_38b;
  char local_38a;
  bool local_387;
  bool local_386;
  bool local_385;
  byte local_384;
  undefined8 local_368;
  ulong local_360;
  long local_358;
  ulong local_350;
  undefined8 local_2b0;
  undefined8 uStack_2a8;
  undefined8 local_2a0;
  undefined8 uStack_298;
  undefined8 local_290;
  undefined8 uStack_288;
  undefined8 local_280;
  undefined8 local_278;
  long local_270;
  long local_268;
  undefined8 local_260;
  undefined8 local_258;
  undefined8 uStack_250;
  undefined4 local_248;
  undefined4 uStack_244;
  undefined4 uStack_240;
  undefined4 uStack_23c;
  undefined4 local_238;
  undefined4 uStack_234;
  undefined4 uStack_230;
  undefined4 uStack_22c;
  undefined4 local_228;
  undefined4 uStack_224;
  undefined4 uStack_220;
  undefined8 uStack_21c;
  undefined8 uStack_214;
  char local_20c;
  undefined1 local_20b;
  char local_20a;
  undefined4 local_209;
  char local_205;
  long *local_200;
  undefined4 local_1f8;
  undefined4 uStack_1f4;
  char *local_1f0;
  long local_1e8;
  undefined8 *local_88;
  long *local_80;
  char *local_78;
  long local_70;
  char local_63;
  char local_62;
  undefined1 local_61;
  undefined8 local_60;
  undefined4 local_58;

  local_60 = 0xfffffffffffffffe;
  if (*(long *)(param_3 + 0xdf8) == -1) {
    *param_4 = 2;
    return;
  }
  local_70 = *(long *)(param_3 + 0xf00);
  cVar2 = param_3[0xf64];
  cVar3 = param_3[0xf65];
  cVar4 = param_3[0xf66];
  local_58 = in_XMM6_Da;
  func_0x000145728850();
  uVar13 = *(ulong *)(param_3 + 0xe20);
  if (0x7ffffffffffffff8 < uVar13 << 4 || uVar13 >> 0x3c != 0) {
LAB_14544f7b1:
    func_0x00014590379b();
    goto LAB_14544ffe8;
  }
  local_80 = (long *)CONCAT71(local_80._1_7_,cVar3);
  uVar11 = *(undefined8 *)(param_3 + 0xef0);
  uVar15 = *(undefined8 *)(param_3 + 0xef8);
  local_88 = param_4;
  local_78 = param_3;
  local_63 = cVar2;
  local_62 = cVar4;
  if (uVar13 << 4 == 0) {
    lVar9 = 8;
    uVar8 = 0;
  }
  else {
    func_0x000140002200();
    lVar9 = func_0x0001400021c0();
    uVar8 = uVar13;
    if (lVar9 == 0) goto LAB_14544f7b1;
  }
  if (uVar13 != 0) {
    func_0x0001457731ed();
  }
  pcVar16 = local_78;
  uVar6 = *(undefined8 *)(local_78 + 0xf10);
  local_2b0 = *(undefined8 *)(local_78 + 0xec0);
  uStack_2a8 = *(undefined8 *)(local_78 + 0xec8);
  local_2a0 = *(undefined8 *)(local_78 + 0xed0);
  uStack_298 = *(undefined8 *)(local_78 + 0xed8);
  local_290 = *(undefined8 *)(local_78 + 0xee0);
  uStack_288 = *(undefined8 *)(local_78 + 0xee8);
  local_205 = local_78[0xf6b];
  local_209 = *(undefined4 *)(local_78 + 0xf67);
  local_368 = local_d28[0];
  local_258 = *(undefined8 *)(local_78 + 0xf18);
  uStack_250 = *(undefined8 *)(local_78 + 0xf20);
  local_248 = *(undefined4 *)(local_78 + 0xf28);
  uStack_244 = *(undefined4 *)(local_78 + 0xf2c);
  uStack_240 = *(undefined4 *)(local_78 + 0xf30);
  uStack_23c = *(undefined4 *)(local_78 + 0xf34);
  local_238 = *(undefined4 *)(local_78 + 0xf38);
  uStack_234 = *(undefined4 *)(local_78 + 0xf3c);
  uStack_230 = *(undefined4 *)(local_78 + 0xf40);
  uStack_22c = *(undefined4 *)(local_78 + 0xf44);
  local_228 = *(undefined4 *)(local_78 + 0xf48);
  uStack_224 = *(undefined4 *)(local_78 + 0xf4c);
  uStack_220 = *(undefined4 *)(local_78 + 0xf50);
  uStack_21c = *(undefined8 *)(local_78 + 0xf54);
  uStack_214 = *(undefined8 *)(local_78 + 0xf5c);
  func_0x0001457731ed();
  local_270 = local_70;
  local_20c = local_63;
  local_20b = local_80._0_1_;
  local_20a = local_62;
  local_268 = *(long *)(pcVar16 + 0xff8) * 0x5851f42d4c957f2d + 0x14057b7ef767814f;
  *(long *)(pcVar16 + 0xff8) = local_268;
  local_360 = uVar8;
  local_358 = lVar9;
  local_350 = uVar13;
  local_280 = uVar11;
  local_278 = uVar15;
  local_260 = uVar6;
  lVar9 = func_0x000145420480();
  lVar9 = lVar9 * 0xf0;
  pcVar14 = pcVar16 + 0xfe0;
  plVar10 = *(long **)(pcVar16 + 0xfe0);
  if (plVar10 == (long *)0x0) {
    iVar12 = *(int *)(lVar9 + 0x1467335d8);
    if (iVar12 < 0xbd) goto LAB_14544fa8c;
LAB_14544fad8:
    uVar15 = 9;
    uVar11 = 0x14673e56b;
    if (iVar12 == 0xbd) {
      uVar11 = 0x14673e541;
      uVar15 = 0x12;
    }
    else if (iVar12 == 0x211) {
      uVar11 = 0x14673e574;
    }
    else if (iVar12 == 0x215) {
      uVar11 = 0x14673e553;
      uVar15 = 0xf;
    }
LAB_14544fb15:
    local_1f8 = *(undefined4 *)(lVar9 + 0x1467335e8);
    local_200 = *(long **)(lVar9 + 0x1467335e0);
    local_61 = 1;
    func_0x000145526fa0(pcVar14,iVar12,uVar11,local_d28,uVar15,&local_200);
    func_0x000140002200();
    plVar10 = (long *)func_0x0001400021c0();
    if (plVar10 == (long *)0x0) {
      func_0x000145903781();
LAB_14544ffe8:
                    /* WARNING: Does not return */
      pcVar7 = (code *)invalidInstructionException();
      (*pcVar7)();
    }
    local_70 = CONCAT44(local_70._4_4_,iVar12);
    func_0x0001457731ed();
    LOCK();
    lVar1 = *plVar10;
    *plVar10 = *plVar10 + 1;
    UNLOCK();
    local_200 = plVar10;
    local_80 = plVar10;
    if (*plVar10 == 0 || SCARRY8(lVar1,1) != *plVar10 < 0) goto LAB_14544ffe8;
    uVar17 = *(undefined4 *)(lVar9 + 0x1467335e8);
    uVar11 = *(undefined8 *)(lVar9 + 0x1467335e0);
    plVar10 = *(long **)pcVar14;
    if (plVar10 != (long *)0x0) {
      LOCK();
      *plVar10 = *plVar10 + -1;
      UNLOCK();
      if (*plVar10 == 0) {
        func_0x000145427f80();
      }
    }
    *(undefined4 *)(local_78 + 0xfd0) = (undefined4)local_70;
    *(undefined8 *)(local_78 + 0xfd4) = uVar11;
    *(undefined4 *)(local_78 + 0xfdc) = uVar17;
    *(long **)(local_78 + 0xfe0) = local_80;
    plVar10 = local_200;
    pcVar16 = local_78;
  }
  else {
    iVar5 = *(int *)(pcVar16 + 0xfd0);
    iVar12 = *(int *)(lVar9 + 0x1467335d8);
    if (((((iVar5 != *(int *)(lVar9 + 0x1467335d8)) ||
          (iVar12 = iVar5, *(float *)(pcVar16 + 0xfd4) != *(float *)(lVar9 + 0x1467335e0))) ||
         (NAN(*(float *)(pcVar16 + 0xfd4)) || NAN(*(float *)(lVar9 + 0x1467335e0)))) ||
        ((*(float *)(pcVar16 + 0xfd8) != *(float *)(lVar9 + 0x1467335e4) ||
         (NAN(*(float *)(pcVar16 + 0xfd8)) || NAN(*(float *)(lVar9 + 0x1467335e4)))))) ||
       ((*(float *)(pcVar16 + 0xfdc) != *(float *)(lVar9 + 0x1467335e8) ||
        (NAN(*(float *)(pcVar16 + 0xfdc)) || NAN(*(float *)(lVar9 + 0x1467335e8)))))) {
      if (0xbc < iVar12) goto LAB_14544fad8;
LAB_14544fa8c:
      uVar15 = 9;
      uVar11 = 0x14673e56b;
      if (iVar12 == 0) {
        uVar11 = 0x14673e532;
        uVar15 = 7;
      }
      else if (iVar12 == 1) {
        uVar11 = 0x14673e539;
        uVar15 = 8;
      }
      else if (iVar12 == 0x1e) {
        uVar11 = 0x14673e562;
      }
      goto LAB_14544fb15;
    }
    LOCK();
    lVar9 = *plVar10;
    *plVar10 = *plVar10 + 1;
    UNLOCK();
    if (*plVar10 == 0 || SCARRY8(lVar9,1) != *plVar10 < 0) goto LAB_14544ffe8;
    plVar10 = *(long **)pcVar14;
  }
  func_0x0001457731ed(plVar10);
  local_61 = 0;
  func_0x0001454ad570();
  local_390 = (**(code **)(*(long *)(pcVar16 + 0xf78) + 0x40))();
  local_38b = pcVar16[0x1043];
  local_38a = pcVar16[0x1044];
  func_0x000145718ed0(&local_200,local_88,0x14673e57d,&local_200,0x13);
  if (local_200 == (long *)0xfffffffffffffffe) {
    if (local_1e8 == 1) {
      local_387 = *local_1f0 == '1';
    }
    else {
      local_387 = false;
    }
    plVar10 = (long *)CONCAT44(uStack_1f4,local_1f8);
joined_r0x00014544fd0e:
    if (plVar10 != (long *)0x0) {
      func_0x0001400021d0();
    }
  }
  else {
    local_387 = false;
    plVar10 = local_200;
    if (local_200 != (long *)0xffffffffffffffff) goto joined_r0x00014544fd0e;
  }
  func_0x000145718ed0();
  if (local_200 == (long *)0xfffffffffffffffe) {
    if (local_1e8 == 1) {
      local_386 = *local_1f0 == '1';
    }
    else {
      local_386 = false;
    }
    plVar10 = (long *)CONCAT44(uStack_1f4,local_1f8);
joined_r0x00014544fd7a:
    if (plVar10 != (long *)0x0) {
      func_0x0001400021d0();
    }
  }
  else {
    local_386 = false;
    plVar10 = local_200;
    if (local_200 != (long *)0xffffffffffffffff) goto joined_r0x00014544fd7a;
  }
  func_0x000145718ed0();
  if (local_200 == (long *)0xfffffffffffffffe) {
    if (local_1e8 == 1) {
      local_385 = *local_1f0 == '1';
    }
    else {
      local_385 = false;
    }
    plVar10 = (long *)CONCAT44(uStack_1f4,local_1f8);
joined_r0x00014544fde6:
    if (plVar10 != (long *)0x0) {
      func_0x0001400021d0();
    }
  }
  else {
    local_385 = false;
    plVar10 = local_200;
    if (local_200 != (long *)0xffffffffffffffff) goto joined_r0x00014544fde6;
  }
  local_4a4 = func_0x000145718ed0();
  if (local_200 == (long *)0xfffffffffffffffe) {
    if (CONCAT44(uStack_1f4,local_1f8) != -1) {
      local_78 = local_1f0;
      local_70 = CONCAT44(uStack_1f4,local_1f8);
      uVar11 = func_0x0001457373e0();
      if (local_70 != 0) {
        func_0x0001400021d0();
      }
      local_4a4 = (undefined4)((ulong)uVar11 >> 0x20);
      local_4a8 = (byte)~(byte)uVar11 & 1;
      goto LAB_14544feab;
    }
  }
  else if ((local_200 != (long *)0xffffffffffffffff) && (local_200 != (long *)0x0)) {
    local_4a4 = func_0x0001400021d0();
  }
  local_4a8 = 0;
LAB_14544feab:
  local_384 = local_384 | (byte)local_4a8;
  local_387 = (bool)(local_387 | local_386);
  pcVar16[0x1042] = '\0';
  uVar18 = 0;
  uVar19 = 0;
  uVar20 = 0;
  uVar21 = 0;
  pcVar16[0xf88] = '\0';
  pcVar16[0xf89] = '\0';
  pcVar16[0xf8a] = '\0';
  pcVar16[0xf8b] = '\0';
  pcVar16[0xf8c] = '\0';
  pcVar16[0xf8d] = '\0';
  pcVar16[0xf8e] = '\0';
  pcVar16[0xf8f] = '\0';
  pcVar16[0xf90] = '\0';
  pcVar16[0xf91] = '\0';
  pcVar16[0xf92] = '\0';
  pcVar16[0xf93] = '\0';
  pcVar16[0xf94] = '\0';
  pcVar16[0xf95] = '\0';
  pcVar16[0xf96] = '\0';
  pcVar16[0xf97] = '\0';
  pcVar16[0xf98] = '\0';
  pcVar16[0xf99] = '\0';
  pcVar16[0xf9a] = '\0';
  pcVar16[0xf9b] = '\0';
  pcVar16[0xf9c] = '\0';
  pcVar16[0xf9d] = '\0';
  pcVar16[0xf9e] = '\0';
  pcVar16[3999] = '\0';
  pcVar16[4000] = '\0';
  pcVar16[0xfa1] = '\0';
  pcVar16[0xfa2] = '\0';
  pcVar16[0xfa3] = '\0';
  pcVar16[0xfa4] = '\0';
  pcVar16[0xfa5] = '\0';
  pcVar16[0xfa6] = '\0';
  pcVar16[0xfa7] = '\0';
  pcVar16[0xfa8] = '\0';
  pcVar16[0xfa9] = '\0';
  pcVar16[0xfaa] = '\0';
  pcVar16[0xfab] = '\0';
  pcVar16[0xfac] = '\0';
  pcVar16[0xfad] = '\0';
  pcVar16[0xfae] = '\0';
  pcVar16[0xfaf] = '\0';
  pcVar16[0xfb0] = '\0';
  pcVar16[0xfb1] = '\0';
  pcVar16[0xfb2] = '\0';
  pcVar16[0xfb3] = '\0';
  pcVar16[0xfb4] = '\0';
  pcVar16[0xfb5] = '\0';
  pcVar16[0xfb6] = '\0';
  pcVar16[0xfb7] = '\0';
  pcVar16[0xfb8] = '\0';
  pcVar16[0xfb9] = '\0';
  pcVar16[0xfba] = '\0';
  pcVar16[0xfbb] = '\0';
  pcVar16[0xfbc] = '\0';
  pcVar16[0xfbd] = '\0';
  pcVar16[0xfbe] = '\0';
  pcVar16[0xfbf] = '\0';
  uVar17 = 0;
  if (*(long *)(pcVar16 + 0xf80) != 0xffffff) {
    uVar17 = func_0x00014547f960();
  }
  *(undefined4 *)(pcVar16 + 0x1000) = uVar17;
  pcVar16[0x1045] = -1;
  *(undefined4 *)(pcVar16 + 0x1004) = uVar18;
  *(undefined4 *)(pcVar16 + 0x1008) = uVar19;
  *(undefined4 *)(pcVar16 + 0x100c) = uVar20;
  *(undefined4 *)(pcVar16 + 0x1010) = uVar21;
  pcVar16[0x1014] = '\0';
  pcVar16[0x1015] = '\0';
  pcVar16[0x1016] = '\0';
  pcVar16[0x1017] = '\0';
  func_0x0001457731ed();
  return;
}
