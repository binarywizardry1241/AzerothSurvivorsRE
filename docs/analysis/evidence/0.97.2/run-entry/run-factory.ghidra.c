
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long param_3,long *param_4)

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
  bool bVar11;
  ulong uVar12;
  byte bVar13;
  undefined8 *puVar14;
  undefined8 uVar15;
  long lVar16;
  int iVar17;
  undefined4 uVar18;
  undefined4 in_XMM6_Da;
  undefined4 uVar19;
  undefined4 uVar20;
  undefined4 uVar21;
  undefined4 uVar22;
  undefined8 local_cc8 [296];
  undefined1 local_388;
  undefined1 local_383;
  bool local_381;
  bool local_380;
  bool local_37f;
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
  undefined8 local_270;
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
  undefined4 uStack_21c;
  undefined4 uStack_218;
  undefined4 uStack_214;
  undefined4 uStack_210;
  undefined1 local_20c;
  undefined1 local_20b;
  undefined1 local_20a;
  undefined4 local_209;
  undefined1 local_205;
  long *local_1f8;
  undefined4 local_1f0;
  undefined4 uStack_1ec;
  char *local_1e8;
  long local_1e0;
  long local_80;
  undefined8 local_78;
  long *local_70;
  undefined1 local_64;
  undefined1 local_63;
  undefined1 local_62;
  undefined1 local_61;
  undefined8 local_60;
  undefined4 local_58;

  local_60 = 0xfffffffffffffffe;
  if (*(long *)(param_3 + 0xd80) == -1) {
    *param_4 = 2;
    return;
  }
  local_78 = *(undefined8 *)(param_3 + 0xe88);
  uVar1 = *(undefined1 *)(param_3 + 0xeec);
  uVar2 = *(undefined1 *)(param_3 + 0xeed);
  uVar3 = *(undefined1 *)(param_3 + 0xeee);
  local_58 = in_XMM6_Da;
  func_0x00014570c440();
  uVar12 = *(ulong *)(param_3 + 0xda8);
  if (0x7ffffffffffffff8 < uVar12 << 4 || uVar12 >> 0x3c != 0) {
LAB_14543ea11:
    func_0x0001458e721b();
    goto LAB_14543f178;
  }
  uVar10 = *(undefined8 *)(param_3 + 0xe78);
  uVar15 = *(undefined8 *)(param_3 + 0xe80);
  local_80 = param_3;
  local_70 = param_4;
  local_64 = uVar1;
  local_63 = uVar2;
  local_62 = uVar3;
  if (uVar12 << 4 == 0) {
    lVar8 = 8;
    uVar7 = 0;
  }
  else {
    func_0x000140002200();
    lVar8 = func_0x0001400021c0();
    uVar7 = uVar12;
    if (lVar8 == 0) goto LAB_14543ea11;
  }
  if (uVar12 != 0) {
    func_0x000145756ddd();
  }
  lVar16 = local_80;
  uVar5 = *(undefined8 *)(local_80 + 0xe98);
  local_2b0 = *(undefined8 *)(local_80 + 0xe48);
  uStack_2a8 = *(undefined8 *)(local_80 + 0xe50);
  local_2a0 = *(undefined8 *)(local_80 + 0xe58);
  uStack_298 = *(undefined8 *)(local_80 + 0xe60);
  local_290 = *(undefined8 *)(local_80 + 0xe68);
  uStack_288 = *(undefined8 *)(local_80 + 0xe70);
  local_205 = *(undefined1 *)(local_80 + 0xef3);
  local_209 = *(undefined4 *)(local_80 + 0xeef);
  local_368 = local_cc8[0];
  local_258 = *(undefined8 *)(local_80 + 0xea0);
  uStack_250 = *(undefined8 *)(local_80 + 0xea8);
  local_248 = *(undefined4 *)(local_80 + 0xeb0);
  uStack_244 = *(undefined4 *)(local_80 + 0xeb4);
  uStack_240 = *(undefined4 *)(local_80 + 0xeb8);
  uStack_23c = *(undefined4 *)(local_80 + 0xebc);
  local_238 = *(undefined4 *)(local_80 + 0xec0);
  uStack_234 = *(undefined4 *)(local_80 + 0xec4);
  uStack_230 = *(undefined4 *)(local_80 + 0xec8);
  uStack_22c = *(undefined4 *)(local_80 + 0xecc);
  local_228 = *(undefined4 *)(local_80 + 0xed0);
  uStack_224 = *(undefined4 *)(local_80 + 0xed4);
  uStack_220 = *(undefined4 *)(local_80 + 0xed8);
  uStack_21c = *(undefined4 *)(local_80 + 0xedc);
  uStack_218 = *(undefined4 *)(local_80 + 0xee0);
  uStack_214 = *(undefined4 *)(local_80 + 0xee4);
  uStack_210 = *(undefined4 *)(local_80 + 0xee8);
  func_0x000145756ddd();
  local_270 = local_78;
  local_20c = local_64;
  local_20b = local_63;
  local_20a = local_62;
  local_268 = *(long *)(lVar16 + 0xf80) * 0x5851f42d4c957f2d + 0x14057b7ef767814f;
  *(long *)(lVar16 + 0xf80) = local_268;
  local_360 = uVar7;
  local_358 = lVar8;
  local_350 = uVar12;
  local_280 = uVar10;
  local_278 = uVar15;
  local_260 = uVar5;
  lVar8 = func_0x00014540e820();
  lVar8 = lVar8 * 0xf0;
  puVar14 = (undefined8 *)(lVar16 + 0xf68);
  plVar9 = *(long **)(lVar16 + 0xf68);
  if (plVar9 == (long *)0x0) {
    iVar17 = *(int *)(lVar8 + 0x1467164f8);
    if (iVar17 < 0xbd) goto LAB_14543ed09;
LAB_14543ed5e:
    uVar15 = 9;
    uVar10 = 0x1467215c3;
    if (iVar17 == 0xbd) {
      uVar10 = 0x146721599;
      uVar15 = 0x12;
    }
    else if (iVar17 == 0x211) {
      uVar10 = 0x1467215cc;
    }
    else if (iVar17 == 0x215) {
      uVar10 = 0x1467215ab;
      uVar15 = 0xf;
    }
LAB_14543ed9e:
    local_1f0 = *(undefined4 *)(lVar8 + 0x146716508);
    local_1f8 = *(long **)(lVar8 + 0x146716500);
    local_61 = 1;
    func_0x000145460720(puVar14,local_70,uVar10,local_cc8,uVar15,&local_1f8);
    func_0x000140002200();
    plVar9 = (long *)func_0x0001400021c0();
    if (plVar9 == (long *)0x0) {
      func_0x0001458e7201();
LAB_14543f178:
                    /* WARNING: Does not return */
      pcVar6 = (code *)invalidInstructionException();
      (*pcVar6)();
    }
    local_78 = CONCAT44(local_78._4_4_,iVar17);
    func_0x000145756ddd();
    LOCK();
    lVar16 = *plVar9;
    *plVar9 = *plVar9 + 1;
    UNLOCK();
    local_1f8 = plVar9;
    local_70 = plVar9;
    if (*plVar9 == 0 || SCARRY8(lVar16,1) != *plVar9 < 0) goto LAB_14543f178;
    uVar18 = *(undefined4 *)(lVar8 + 0x146716508);
    uVar10 = *(undefined8 *)(lVar8 + 0x146716500);
    plVar9 = (long *)*puVar14;
    if (plVar9 != (long *)0x0) {
      LOCK();
      *plVar9 = *plVar9 + -1;
      UNLOCK();
      if (*plVar9 == 0) {
        func_0x000145416f10();
      }
    }
    *(undefined4 *)(local_80 + 0xf58) = (undefined4)local_78;
    *(undefined8 *)(local_80 + 0xf5c) = uVar10;
    *(undefined4 *)(local_80 + 0xf64) = uVar18;
    *(long **)(local_80 + 0xf68) = local_70;
    lVar16 = local_80;
  }
  else {
    iVar4 = *(int *)(lVar16 + 0xf58);
    iVar17 = *(int *)(lVar8 + 0x1467164f8);
    if (((((iVar4 != *(int *)(lVar8 + 0x1467164f8)) ||
          (iVar17 = iVar4, *(float *)(lVar16 + 0xf5c) != *(float *)(lVar8 + 0x146716500))) ||
         (NAN(*(float *)(lVar16 + 0xf5c)) || NAN(*(float *)(lVar8 + 0x146716500)))) ||
        ((*(float *)(lVar16 + 0xf60) != *(float *)(lVar8 + 0x146716504) ||
         (NAN(*(float *)(lVar16 + 0xf60)) || NAN(*(float *)(lVar8 + 0x146716504)))))) ||
       ((*(float *)(lVar16 + 0xf64) != *(float *)(lVar8 + 0x146716508) ||
        (NAN(*(float *)(lVar16 + 0xf64)) || NAN(*(float *)(lVar8 + 0x146716508)))))) {
      if (0xbc < iVar17) goto LAB_14543ed5e;
LAB_14543ed09:
      uVar15 = 9;
      uVar10 = 0x1467215c3;
      if (iVar17 == 0) {
        uVar10 = 0x14672158a;
        uVar15 = 7;
      }
      else if (iVar17 == 1) {
        uVar10 = 0x146721591;
        uVar15 = 8;
      }
      else if (iVar17 == 0x1e) {
        uVar10 = 0x1467215ba;
      }
      goto LAB_14543ed9e;
    }
    LOCK();
    lVar8 = *plVar9;
    *plVar9 = *plVar9 + 1;
    UNLOCK();
    if (*plVar9 == 0 || SCARRY8(lVar8,1) != *plVar9 < 0) goto LAB_14543f178;
  }
  func_0x000145756ddd();
  local_61 = 0;
  func_0x00014549bb90();
  local_388 = (**(code **)(*(long *)(lVar16 + 0xf00) + 0x40))();
  local_383 = *(undefined1 *)(lVar16 + 0xfcb);
  func_0x0001456fcac0();
  if ((local_1f8 == (long *)0xfffffffffffffffe) && (local_1e0 == 1)) {
    local_381 = *local_1e8 == '1';
LAB_14543ef70:
    bVar13 = local_381;
    if (CONCAT44(uStack_1ec,local_1f0) != 0) {
LAB_14543efa5:
      bVar13 = local_381;
      func_0x0001400021d0();
    }
  }
  else {
    local_381 = false;
    bVar13 = 0;
    if (1 < (long)local_1f8 + 1U) {
      if (local_1f8 == (long *)0xfffffffffffffffe) goto LAB_14543ef70;
      goto LAB_14543efa5;
    }
  }
  func_0x0001456fcac0();
  if ((local_1f8 == (long *)0xfffffffffffffffe) && (local_1e0 == 1)) {
    local_380 = *local_1e8 == '1';
LAB_14543eff9:
    bVar11 = local_380;
    if (CONCAT44(uStack_1ec,local_1f0) != 0) {
LAB_14543f02e:
      bVar11 = local_380;
      func_0x0001400021d0();
    }
  }
  else {
    local_380 = false;
    bVar11 = false;
    if (1 < (long)local_1f8 + 1U) {
      if (local_1f8 == (long *)0xfffffffffffffffe) goto LAB_14543eff9;
      goto LAB_14543f02e;
    }
  }
  func_0x0001456fcac0();
  if ((local_1f8 == (long *)0xfffffffffffffffe) && (local_1e0 == 1)) {
    local_37f = *local_1e8 == '1';
LAB_14543f07f:
    if (CONCAT44(uStack_1ec,local_1f0) == 0) goto LAB_14543f0c0;
  }
  else {
    local_37f = false;
    if ((long)local_1f8 + 1U < 2) goto LAB_14543f0c0;
    if (local_1f8 == (long *)0xfffffffffffffffe) goto LAB_14543f07f;
  }
  func_0x0001400021d0();
LAB_14543f0c0:
  local_381 = (bool)(bVar11 | bVar13);
  *(undefined1 *)(lVar16 + 0xfca) = 0;
  uVar19 = 0;
  uVar20 = 0;
  uVar21 = 0;
  uVar22 = 0;
  *(undefined8 *)(lVar16 + 0xf10) = 0;
  *(undefined8 *)(lVar16 + 0xf18) = 0;
  *(undefined8 *)(lVar16 + 0xf20) = 0;
  *(undefined8 *)(lVar16 + 0xf28) = 0;
  *(undefined8 *)(lVar16 + 0xf30) = 0;
  *(undefined8 *)(lVar16 + 0xf38) = 0;
  *(undefined8 *)(lVar16 + 0xf40) = 0;
  uVar18 = 0;
  if (*(long *)(lVar16 + 0xf08) != 0xffffff) {
    uVar18 = func_0x000145470ca0();
  }
  *(undefined4 *)(lVar16 + 0xf88) = uVar18;
  *(undefined1 *)(lVar16 + 0xfcc) = 0xff;
  *(undefined4 *)(lVar16 + 0xf8c) = uVar19;
  *(undefined4 *)(lVar16 + 0xf90) = uVar20;
  *(undefined4 *)(lVar16 + 0xf94) = uVar21;
  *(undefined4 *)(lVar16 + 0xf98) = uVar22;
  *(undefined4 *)(lVar16 + 0xf9c) = 0;
  func_0x000145756ddd();
  return;
}
