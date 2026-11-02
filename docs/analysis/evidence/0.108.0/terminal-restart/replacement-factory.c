/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long param_3,undefined8 *param_4)

{
  undefined1 uVar1;
  undefined1 uVar2;
  undefined1 uVar3;
  int iVar4;
  undefined8 uVar5;
  code *pcVar6;
  ulong uVar7;
  long lVar8;
  long *plVar9;
  undefined8 uVar10;
  int iVar11;
  ulong uVar12;
  long *plVar13;
  undefined8 uVar14;
  long lVar15;
  undefined4 uVar16;
  undefined4 in_XMM6_Da;
  undefined4 uVar17;
  undefined4 uVar18;
  undefined4 uVar19;
  undefined4 uVar20;
  undefined8 local_e30 [304];
  uint local_4b0;
  undefined4 local_4ac;
  undefined1 local_38c;
  undefined1 local_38a;
  undefined1 local_385;
  undefined1 local_384;
  bool local_381;
  bool local_380;
  bool local_37f;
  byte local_37e;
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
  char *local_270;
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
  undefined1 local_20c;
  undefined1 local_20b;
  undefined1 local_20a;
  undefined4 local_209;
  undefined1 local_205;
  long *local_200;
  undefined4 local_1f8;
  undefined4 uStack_1f4;
  char *local_1f0;
  long local_1e8;
  undefined8 *local_88;
  long *local_80;
  char *local_78;
  long local_70;
  undefined1 local_63;
  undefined1 local_62;
  undefined1 local_61;
  undefined8 local_60;
  undefined4 local_58;

  local_60 = 0xfffffffffffffffe;
  if (*(long *)(param_3 + 0xf18) == -1) {
    *param_4 = 2;
    return;
  }
  local_78 = *(char **)(param_3 + 0x1020);
  uVar1 = *(undefined1 *)(param_3 + 0x1084);
  uVar2 = *(undefined1 *)(param_3 + 0x1085);
  uVar3 = *(undefined1 *)(param_3 + 0x1086);
  local_58 = in_XMM6_Da;
  func_0x000145bc5b50();
  uVar12 = *(ulong *)(param_3 + 0xf40);
  if (0x7ffffffffffffff8 < uVar12 << 4 || uVar12 >> 0x3c != 0) {
LAB_1458b72c1:
    func_0x000145d934fb();
    goto LAB_1458b7b04;
  }
  local_80 = (long *)CONCAT71(local_80._1_7_,uVar2);
  uVar10 = *(undefined8 *)(param_3 + 0x1010);
  uVar14 = *(undefined8 *)(param_3 + 0x1018);
  local_88 = param_4;
  local_70 = param_3;
  local_63 = uVar1;
  local_62 = uVar3;
  if (uVar12 << 4 == 0) {
    lVar8 = 8;
    uVar7 = 0;
  }
  else {
    func_0x000140002200();
    lVar8 = func_0x0001400021c0();
    uVar7 = uVar12;
    if (lVar8 == 0) goto LAB_1458b72c1;
  }
  if (uVar12 != 0) {
    func_0x000145bf293b();
  }
  lVar15 = local_70;
  uVar5 = *(undefined8 *)(local_70 + 0x1030);
  local_2b0 = *(undefined8 *)(local_70 + 0xfe0);
  uStack_2a8 = *(undefined8 *)(local_70 + 0xfe8);
  local_2a0 = *(undefined8 *)(local_70 + 0xff0);
  uStack_298 = *(undefined8 *)(local_70 + 0xff8);
  local_290 = *(undefined8 *)(local_70 + 0x1000);
  uStack_288 = *(undefined8 *)(local_70 + 0x1008);
  local_205 = *(undefined1 *)(local_70 + 0x108b);
  local_209 = *(undefined4 *)(local_70 + 0x1087);
  local_368 = local_e30[0];
  local_258 = *(undefined8 *)(local_70 + 0x1038);
  uStack_250 = *(undefined8 *)(local_70 + 0x1040);
  local_248 = *(undefined4 *)(local_70 + 0x1048);
  uStack_244 = *(undefined4 *)(local_70 + 0x104c);
  uStack_240 = *(undefined4 *)(local_70 + 0x1050);
  uStack_23c = *(undefined4 *)(local_70 + 0x1054);
  local_238 = *(undefined4 *)(local_70 + 0x1058);
  uStack_234 = *(undefined4 *)(local_70 + 0x105c);
  uStack_230 = *(undefined4 *)(local_70 + 0x1060);
  uStack_22c = *(undefined4 *)(local_70 + 0x1064);
  local_228 = *(undefined4 *)(local_70 + 0x1068);
  uStack_224 = *(undefined4 *)(local_70 + 0x106c);
  uStack_220 = *(undefined4 *)(local_70 + 0x1070);
  uStack_21c = *(undefined8 *)(local_70 + 0x1074);
  uStack_214 = *(undefined8 *)(local_70 + 0x107c);
  func_0x000145bf293b();
  local_270 = local_78;
  local_20c = local_63;
  local_20b = local_80._0_1_;
  local_20a = local_62;
  local_268 = *(long *)(lVar15 + 0x1118) * 0x5851f42d4c957f2d + 0x14057b7ef767814f;
  *(long *)(lVar15 + 0x1118) = local_268;
  local_360 = uVar7;
  local_358 = lVar8;
  local_350 = uVar12;
  local_280 = uVar10;
  local_278 = uVar14;
  local_260 = uVar5;
  lVar8 = func_0x000145886360();
  lVar8 = lVar8 * 0xf0;
  plVar13 = *(long **)(lVar15 + 0x1100);
  if (plVar13 == (long *)0x0) {
    iVar11 = *(int *)(lVar8 + 0x146bd7c50);
    if (iVar11 < 0xbd) goto LAB_1458b7592;
LAB_1458b75de:
    uVar14 = 9;
    uVar10 = 0x146be5a8b;
    if (iVar11 == 0xbd) {
      uVar10 = 0x146be5a61;
      uVar14 = 0x12;
    }
    else if (iVar11 == 0x211) {
      uVar10 = 0x146be5a94;
    }
    else if (iVar11 == 0x215) {
      uVar10 = 0x146be5a73;
      uVar14 = 0xf;
    }
LAB_1458b761b:
    local_1f8 = *(undefined4 *)(lVar8 + 0x146bd7c60);
    local_200 = *(long **)(lVar8 + 0x146bd7c58);
    local_61 = 1;
    func_0x0001458cd080(plVar13,iVar11,uVar10,local_e30,uVar14,&local_200);
    func_0x000140002200();
    plVar9 = (long *)func_0x0001400021c0();
    if (plVar9 == (long *)0x0) {
      func_0x000145d934e1();
LAB_1458b7b04:
                    /* WARNING: Does not return */
      pcVar6 = (code *)invalidInstructionException();
      (*pcVar6)();
    }
    local_78 = (char *)CONCAT44(local_78._4_4_,iVar11);
    func_0x000145bf293b();
    LOCK();
    lVar15 = *plVar9;
    *plVar9 = *plVar9 + 1;
    UNLOCK();
    local_200 = plVar9;
    local_80 = plVar9;
    if (*plVar9 == 0 || SCARRY8(lVar15,1) != *plVar9 < 0) goto LAB_1458b7b04;
    uVar16 = *(undefined4 *)(lVar8 + 0x146bd7c60);
    uVar10 = *(undefined8 *)(lVar8 + 0x146bd7c58);
    if (plVar13 != (long *)0x0) {
      LOCK();
      *plVar13 = *plVar13 + -1;
      UNLOCK();
      if (*plVar13 == 0) {
        func_0x00014588ea30();
      }
    }
    *(undefined4 *)(local_70 + 0x10f0) = local_78._0_4_;
    *(undefined8 *)(local_70 + 0x10f4) = uVar10;
    *(undefined4 *)(local_70 + 0x10fc) = uVar16;
    *(long **)(local_70 + 0x1100) = local_80;
    plVar13 = local_200;
    lVar15 = local_70;
  }
  else {
    iVar4 = *(int *)(lVar15 + 0x10f0);
    iVar11 = *(int *)(lVar8 + 0x146bd7c50);
    if (((((iVar4 != *(int *)(lVar8 + 0x146bd7c50)) ||
          (iVar11 = iVar4, *(float *)(lVar15 + 0x10f4) != *(float *)(lVar8 + 0x146bd7c58))) ||
         (NAN(*(float *)(lVar15 + 0x10f4)) || NAN(*(float *)(lVar8 + 0x146bd7c58)))) ||
        ((*(float *)(lVar15 + 0x10f8) != *(float *)(lVar8 + 0x146bd7c5c) ||
         (NAN(*(float *)(lVar15 + 0x10f8)) || NAN(*(float *)(lVar8 + 0x146bd7c5c)))))) ||
       ((*(float *)(lVar15 + 0x10fc) != *(float *)(lVar8 + 0x146bd7c60) ||
        (NAN(*(float *)(lVar15 + 0x10fc)) || NAN(*(float *)(lVar8 + 0x146bd7c60)))))) {
      if (0xbc < iVar11) goto LAB_1458b75de;
LAB_1458b7592:
      uVar14 = 9;
      uVar10 = 0x146be5a8b;
      if (iVar11 == 0) {
        uVar10 = 0x146be5a52;
        uVar14 = 7;
      }
      else if (iVar11 == 1) {
        uVar10 = 0x146be5a59;
        uVar14 = 8;
      }
      else if (iVar11 == 0x1e) {
        uVar10 = 0x146be5a82;
      }
      goto LAB_1458b761b;
    }
    LOCK();
    lVar8 = *plVar13;
    *plVar13 = *plVar13 + 1;
    UNLOCK();
    if (*plVar13 == 0 || SCARRY8(lVar8,1) != *plVar13 < 0) goto LAB_1458b7b04;
  }
  func_0x000145bf293b(plVar13);
  local_61 = 0;
  func_0x000145926af0();
  local_38a = (**(code **)(*(long *)(lVar15 + 0x1098) + 0x40))();
  local_385 = *(undefined1 *)(lVar15 + 0x1163);
  local_384 = *(undefined1 *)(lVar15 + 0x1164);
  local_38c = *(undefined1 *)(lVar15 + 0x1165);
  func_0x000145bb61d0(&local_200,local_88,0x146be5a9d,&local_200,0x13);
  if (local_200 == (long *)0xfffffffffffffffe) {
    if (local_1e8 == 1) {
      local_381 = *local_1f0 == '1';
    }
    else {
      local_381 = false;
    }
    plVar13 = (long *)CONCAT44(uStack_1f4,local_1f8);
joined_r0x0001458b782a:
    if (plVar13 != (long *)0x0) {
      func_0x0001400021d0();
    }
  }
  else {
    local_381 = false;
    plVar13 = local_200;
    if (local_200 != (long *)0xffffffffffffffff) goto joined_r0x0001458b782a;
  }
  func_0x000145bb61d0();
  if (local_200 == (long *)0xfffffffffffffffe) {
    if (local_1e8 == 1) {
      local_380 = *local_1f0 == '1';
    }
    else {
      local_380 = false;
    }
    plVar13 = (long *)CONCAT44(uStack_1f4,local_1f8);
joined_r0x0001458b7896:
    if (plVar13 != (long *)0x0) {
      func_0x0001400021d0();
    }
  }
  else {
    local_380 = false;
    plVar13 = local_200;
    if (local_200 != (long *)0xffffffffffffffff) goto joined_r0x0001458b7896;
  }
  func_0x000145bb61d0();
  if (local_200 == (long *)0xfffffffffffffffe) {
    if (local_1e8 == 1) {
      local_37f = *local_1f0 == '1';
    }
    else {
      local_37f = false;
    }
    plVar13 = (long *)CONCAT44(uStack_1f4,local_1f8);
joined_r0x0001458b7902:
    if (plVar13 != (long *)0x0) {
      func_0x0001400021d0();
    }
  }
  else {
    local_37f = false;
    plVar13 = local_200;
    if (local_200 != (long *)0xffffffffffffffff) goto joined_r0x0001458b7902;
  }
  local_4ac = func_0x000145bb61d0();
  if (local_200 == (long *)0xfffffffffffffffe) {
    if (CONCAT44(uStack_1f4,local_1f8) != -1) {
      local_78 = local_1f0;
      local_70 = CONCAT44(uStack_1f4,local_1f8);
      uVar10 = func_0x000145bd4130();
      if (local_70 != 0) {
        func_0x0001400021d0();
      }
      local_4ac = (undefined4)((ulong)uVar10 >> 0x20);
      local_4b0 = (byte)~(byte)uVar10 & 1;
      goto LAB_1458b79c7;
    }
  }
  else if ((local_200 != (long *)0xffffffffffffffff) && (local_200 != (long *)0x0)) {
    local_4ac = func_0x0001400021d0();
  }
  local_4b0 = 0;
LAB_1458b79c7:
  local_37e = local_37e | (byte)local_4b0;
  local_381 = (bool)(local_381 | local_380);
  *(undefined1 *)(lVar15 + 0x1162) = 0;
  uVar17 = 0;
  uVar18 = 0;
  uVar19 = 0;
  uVar20 = 0;
  *(undefined8 *)(lVar15 + 0x10a8) = 0;
  *(undefined8 *)(lVar15 + 0x10b0) = 0;
  *(undefined8 *)(lVar15 + 0x10b8) = 0;
  *(undefined8 *)(lVar15 + 0x10c0) = 0;
  *(undefined8 *)(lVar15 + 0x10c8) = 0;
  *(undefined8 *)(lVar15 + 0x10d0) = 0;
  *(undefined8 *)(lVar15 + 0x10d8) = 0;
  uVar16 = 0;
  if (*(long *)(lVar15 + 0x10a0) != 0xffffff) {
    uVar16 = func_0x0001458de240();
  }
  *(undefined4 *)(lVar15 + 0x1120) = uVar16;
  *(undefined1 *)(lVar15 + 0x1166) = 0xff;
  *(undefined4 *)(lVar15 + 0x1124) = uVar17;
  *(undefined4 *)(lVar15 + 0x1128) = uVar18;
  *(undefined4 *)(lVar15 + 0x112c) = uVar19;
  *(undefined4 *)(lVar15 + 0x1130) = uVar20;
  *(undefined4 *)(lVar15 + 0x1134) = 0;
  func_0x000145bf293b();
  return;
}
