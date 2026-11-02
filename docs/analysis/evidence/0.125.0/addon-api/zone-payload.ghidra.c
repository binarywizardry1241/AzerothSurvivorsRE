undefined8 FUN_145c06860(undefined8 param_1,longlong param_2)

{
  undefined8 uVar1;
  code *pcVar2;
  longlong *plVar3;
  ulonglong uVar4;
  byte bVar5;
  longlong lVar6;
  longlong lVar7;
  longlong lVar8;
  undefined4 *puVar9;
  ulonglong uVar10;
  undefined8 *puVar11;
  undefined8 uVar12;
  undefined *puVar13;
  ulonglong uVar14;
  undefined8 uStack_260;
  undefined8 uStack_258;
  undefined *puStack_250;
  undefined4 uStack_248;
  undefined4 uStack_244;
  undefined4 uStack_240;
  undefined4 uStack_23c;
  undefined8 uStack_238;
  undefined4 uStack_228;
  undefined4 uStack_224;
  undefined4 uStack_220;
  undefined4 uStack_21c;
  undefined8 uStack_218;
  undefined4 uStack_208;
  undefined4 uStack_204;
  undefined4 uStack_200;
  undefined4 uStack_1fc;
  undefined8 uStack_1f8;
  undefined4 uStack_1e8;
  undefined4 uStack_1e4;
  undefined4 uStack_1e0;
  undefined4 uStack_1dc;
  undefined8 uStack_1d8;
  undefined4 uStack_1c8;
  undefined4 uStack_1c4;
  undefined4 uStack_1c0;
  undefined4 uStack_1bc;
  ulonglong uStack_1b8;
  undefined4 uStack_1a8;
  undefined4 uStack_1a4;
  undefined4 uStack_1a0;
  undefined4 uStack_19c;
  ulonglong uStack_198;
  longlong *plStack_188;
  undefined8 uStack_180;
  undefined8 uStack_178;
  undefined4 *puStack_170;
  undefined *puStack_168;
  undefined4 *puStack_160;
  undefined *puStack_158;
  undefined *puStack_150;
  undefined *puStack_148;
  float *pfStack_140;
  undefined *puStack_138;
  undefined8 *puStack_130;
  code *pcStack_128;
  undefined *puStack_120;
  undefined *puStack_118;
  undefined4 *puStack_110;
  undefined *puStack_108;
  undefined4 *puStack_100;
  undefined *puStack_f8;
  undefined4 *puStack_f0;
  undefined *puStack_e8;
  undefined4 *puStack_e0;
  undefined *puStack_d8;
  longlong lStack_d0;
  code *pcStack_c8;
  undefined *puStack_c0;
  code *pcStack_b8;
  undefined1 *puStack_b0;
  code *pcStack_a8;
  undefined **ppuStack_a0;
  undefined *puStack_98;
  float fStack_8c;
  undefined *puStack_88;
  undefined *puStack_80;
  undefined8 uStack_78;
  longlong lStack_68;
  undefined8 uStack_60;
  ulonglong uStack_58;
  undefined1 uStack_49;
  undefined8 uStack_48;
  
  uStack_48 = 0xfffffffffffffffe;
  uVar12 = *(undefined8 *)(param_2 + 0x2d0);
  uVar1 = *(undefined8 *)(param_2 + 0x2d8);
  lVar6 = func_0x000145ab1110(uVar12,uVar1);
  lVar6 = lVar6 * 0xf0;
  bVar5 = *(char *)(param_2 + 0x354) - 2;
  if (bVar5 < 10) {
    puVar13 = *(undefined **)(&DAT_1476c9470 + (ulonglong)bVar5 * 8);
  }
  else {
    puVar13 = &DAT_146fe8ce8;
  }
  bVar5 = *(char *)(param_2 + 0x355) - 2;
  if (bVar5 < 7) {
    plStack_188 = *(longlong **)(&DAT_1476c93f8 + (ulonglong)bVar5 * 8);
  }
  else {
    plStack_188 = &DAT_146fe7b50;
  }
  puStack_250 = &UNK_146fe6998 + lVar6;
  puStack_80 = &DAT_1400020c0;
  uStack_258 = param_1;
  puStack_88 = puStack_250;
  lStack_68 = uVar1;
  uStack_58 = uVar12;
  FUN_145fe4b70(&uStack_180,&DAT_146fdab7e,&puStack_88);
  lVar8 = *(longlong *)(&DAT_146fe69a8 + lVar6);
  uVar10 = *(ulonglong *)(&DAT_146fe69b0 + lVar6);
  uStack_60 = uStack_178;
  lVar7 = FUN_145af9cd0();
  if (uStack_180 != (undefined *)0x0) {
    func_0x0001400021d0(uStack_60,uStack_180,1);
  }
  uVar14 = (ulonglong)puStack_170;
  if (lVar7 == 0) {
    uVar14 = uVar10;
    lVar7 = lVar8;
  }
  uStack_180 = (undefined *)0x0;
  uStack_178 = (undefined *)0x1;
  puStack_170 = (undefined4 *)0x0;
  if (uVar14 != 0) {
    FUN_1460157c0(&uStack_180,0,((uVar14 >> 2) + 1) - (ulonglong)((uVar14 & 3) == 0),1,1);
  }
  FUN_145cd6850(lVar7,uVar14 + lVar7,&uStack_180);
  uStack_198 = (ulonglong)puStack_170;
  uStack_1a8 = (undefined4)uStack_180;
  uStack_1a4 = uStack_180._4_4_;
  uStack_1a0 = (undefined4)uStack_178;
  uStack_19c = uStack_178._4_4_;
  puStack_88 = &UNK_146fe6998 + lVar6;
  puStack_80 = &DAT_1400020c0;
  FUN_145fe4b70(&uStack_180,&DAT_146fdab6c,&puStack_88);
  lVar8 = *(longlong *)(&DAT_146fe69b8 + lVar6);
  uVar10 = *(ulonglong *)(&DAT_146fe69c0 + lVar6);
  uStack_60 = uStack_178;
  puVar9 = puStack_170;
  lVar7 = FUN_145af9cd0();
  if (uStack_180 != (undefined *)0x0) {
    func_0x0001400021d0(uStack_60,uStack_180,1);
  }
  if (lVar7 == 0) {
    puVar9 = (undefined4 *)uVar10;
    lVar7 = lVar8;
  }
  uStack_180 = (undefined *)0x0;
  uStack_178 = (undefined *)0x1;
  puStack_170 = (undefined4 *)0x0;
  if (puVar9 != (undefined4 *)0x0) {
    FUN_1460157c0(&uStack_180,0,
                  (((ulonglong)puVar9 >> 2) + 1) - (ulonglong)(((ulonglong)puVar9 & 3) == 0),1,1);
  }
  FUN_145cd6850(lVar7,(longlong)puVar9 + lVar7,&uStack_180);
  uStack_1b8 = (ulonglong)puStack_170;
  uStack_1c8 = (undefined4)uStack_180;
  uStack_1c4 = uStack_180._4_4_;
  uStack_1c0 = (undefined4)uStack_178;
  uStack_1bc = uStack_178._4_4_;
  lVar8 = func_0x000145ab1110(uStack_58,lStack_68);
  lVar8 = *(longlong *)(&DAT_146fe6a18 + lVar8 * 0xf0);
  if (*(char *)(lVar8 + 100) == '\0') {
    if (*(char *)(lVar8 + 0xcc) != '\0') {
      lVar8 = lVar8 + 0x68;
      goto LAB_145c06b4b;
    }
    if (*(char *)(lVar8 + 0x134) != '\0') {
      lVar8 = lVar8 + 0xd0;
      goto LAB_145c06b4b;
    }
    if (*(char *)(lVar8 + 0x19c) != '\0') {
      lVar8 = lVar8 + 0x138;
      goto LAB_145c06b4b;
    }
    if (*(char *)(lVar8 + 0x204) == '\x01') {
      lVar8 = lVar8 + 0x1a0;
      goto LAB_145c06b4b;
    }
    fStack_8c = -1.0;
  }
  else {
LAB_145c06b4b:
    fStack_8c = *(float *)(lVar8 + 0x50) * 60.0;
  }
  uStack_260 = 5;
  puStack_80 = &DAT_1400020c0;
  puStack_88 = puVar13 + 0x10;
  FUN_145fe4b70(&uStack_180,&DAT_146fdaa88,&puStack_88);
  lVar8 = *(longlong *)(puVar13 + 0x20);
  uVar10 = *(ulonglong *)(puVar13 + 0x28);
  uStack_58 = (ulonglong)uStack_178;
  puVar9 = puStack_170;
  lVar7 = FUN_145af9cd0();
  if (uStack_180 != (undefined *)0x0) {
    func_0x0001400021d0(uStack_58,uStack_180,1);
  }
  if (lVar7 == 0) {
    puVar9 = (undefined4 *)uVar10;
    lVar7 = lVar8;
  }
  uStack_180 = (undefined *)0x0;
  uStack_178 = (undefined *)0x1;
  puStack_170 = (undefined4 *)0x0;
  if (puVar9 != (undefined4 *)0x0) {
    FUN_1460157c0(&uStack_180,0,
                  (((ulonglong)puVar9 >> 2) + 1) - (ulonglong)(((ulonglong)puVar9 & 3) == 0),1,1);
  }
  FUN_145cd6850(lVar7,(longlong)puVar9 + lVar7,&uStack_180);
  plVar3 = plStack_188;
  uStack_1d8 = puStack_170;
  uStack_1e8 = (undefined4)uStack_180;
  uStack_1e4 = uStack_180._4_4_;
  uStack_1e0 = (undefined4)uStack_178;
  uStack_1dc = uStack_178._4_4_;
  lVar8 = *plStack_188;
  uVar10 = plStack_188[1];
  uStack_180 = (undefined *)0x0;
  uStack_178 = (undefined *)0x1;
  puStack_170 = (undefined4 *)0x0;
  if (uVar10 != 0) {
    FUN_1460157c0(&uStack_180,0,((uVar10 >> 2) + 1) - (ulonglong)((uVar10 & 3) == 0),1,1);
  }
  uVar10 = uVar10 + lVar8;
  FUN_145cd6850(lVar8,uVar10,&uStack_180);
  uStack_1f8 = puStack_170;
  uStack_208 = (undefined4)uStack_180;
  uStack_204 = uStack_180._4_4_;
  uStack_200 = (undefined4)uStack_178;
  uStack_1fc = uStack_178._4_4_;
  lVar8 = FUN_145aafbf0(plVar3);
  uStack_180 = (undefined *)0x0;
  uStack_178 = (undefined *)0x1;
  puStack_170 = (undefined4 *)0x0;
  if (uVar10 != 0) {
    FUN_1460157c0(&uStack_180,0,((uVar10 >> 2) + 1) - (ulonglong)((uVar10 & 3) == 0),1,1);
  }
  FUN_145cd6850(lVar8,uVar10 + lVar8,&uStack_180);
  uStack_218 = puStack_170;
  uStack_228 = (undefined4)uStack_180;
  uStack_224 = uStack_180._4_4_;
  uStack_220 = (undefined4)uStack_178;
  uStack_21c = uStack_178._4_4_;
  lVar8 = *(longlong *)(param_2 + 0x1b8);
  uVar10 = *(ulonglong *)(param_2 + 0x1c0);
  uStack_180 = (undefined *)0x0;
  uStack_178 = (undefined *)0x1;
  puStack_170 = (undefined4 *)0x0;
  if (uVar10 != 0) {
    FUN_1460157c0(&uStack_180,0,((uVar10 >> 2) + 1) - (ulonglong)((uVar10 & 3) == 0),1,1);
  }
  FUN_145cd6850(lVar8,uVar10 + lVar8,&uStack_180);
  uStack_238 = puStack_170;
  uStack_248 = (undefined4)uStack_180;
  uStack_244 = uStack_180._4_4_;
  uStack_240 = (undefined4)uStack_178;
  uStack_23c = uStack_178._4_4_;
  uStack_49 = *(undefined1 *)(param_2 + 0x36f);
  uVar10 = *(ulonglong *)(param_2 + 0x868);
  uVar14 = uVar10 << 4;
  if (0x7ffffffffffffff8 < uVar14 || uVar10 >> 0x3c != 0) {
    uVar12 = 0;
LAB_145c06d9b:
    FUN_1461bb08b(uVar12,uVar14);
                    /* WARNING: Does not return */
    pcVar2 = (code *)invalidInstructionException();
    (*pcVar2)();
  }
  lVar8 = *(longlong *)(param_2 + 0x860);
  if (uVar14 == 0) {
    uStack_58 = 0;
    lStack_68 = 8;
    uVar4 = uStack_58;
    lVar7 = lStack_68;
  }
  else {
    func_0x000140002200();
    uVar12 = 8;
    lVar7 = func_0x0001400021c0(uVar14,8);
    uVar4 = uVar10;
    if (lVar7 == 0) goto LAB_145c06d9b;
  }
  lStack_68 = lVar7;
  uStack_58 = uVar4;
  if (uVar10 != 0) {
    if (uVar10 == 1) {
      uVar14 = 0;
    }
    else {
      puVar11 = (undefined8 *)(lStack_68 + 0x18);
      uVar14 = 0;
      do {
        lVar7 = (ulonglong)*(byte *)(lVar8 + uVar14) * 8;
        uVar12 = *(undefined8 *)(&DAT_1476c9398 + lVar7);
        puVar11[-3] = *(undefined8 *)(&DAT_1476c92c8 + lVar7);
        puVar11[-2] = uVar12;
        lVar7 = (ulonglong)*(byte *)(lVar8 + 1 + uVar14) * 8;
        uVar12 = *(undefined8 *)(&DAT_1476c9398 + lVar7);
        puVar11[-1] = *(undefined8 *)(&DAT_1476c92c8 + lVar7);
        *puVar11 = uVar12;
        uVar14 = uVar14 + 2;
        puVar11 = puVar11 + 4;
      } while ((uVar10 & 0xffffffffffffffe) != uVar14);
      if ((uVar10 & 1) == 0) goto LAB_145c06eb6;
    }
    lVar8 = (ulonglong)*(byte *)(lVar8 + uVar14) * 8;
    uVar12 = *(undefined8 *)(&DAT_1476c9398 + lVar8);
    *(undefined8 *)(lStack_68 + uVar14 * 0x10) = *(undefined8 *)(&DAT_1476c92c8 + lVar8);
    *(undefined8 *)(lStack_68 + 8 + uVar14 * 0x10) = uVar12;
  }
LAB_145c06eb6:
  FUN_145aae560(&uStack_180,lStack_68,uVar10,&DAT_1476c663a,1);
  uVar12 = uStack_258;
  puStack_150 = &UNK_146fe6a70 + lVar6;
  lStack_d0 = param_2 + 0x356;
  puStack_c0 = &DAT_146fe6a50 + lVar6;
  uStack_78 = puStack_170;
  puStack_88 = uStack_180;
  puStack_80 = uStack_178;
  uStack_180 = puStack_250;
  uStack_178 = &DAT_1400020c0;
  puStack_170 = &uStack_1a8;
  puStack_168 = &DAT_1400020e0;
  puStack_160 = &uStack_1c8;
  puStack_158 = &DAT_1400020e0;
  puStack_148 = &DAT_145ff5920;
  pfStack_140 = &fStack_8c;
  puStack_138 = &DAT_145ff5920;
  puStack_130 = &uStack_260;
  pcStack_128 = FUN_145ff7510;
  puStack_118 = &DAT_1400020c0;
  puStack_110 = &uStack_1e8;
  puStack_108 = &DAT_1400020e0;
  puStack_f8 = &DAT_1400020e0;
  puStack_f0 = &uStack_228;
  puStack_e8 = &DAT_1400020e0;
  puStack_e0 = &uStack_248;
  puStack_d8 = &DAT_1400020e0;
  pcStack_c8 = FUN_145ff2f50;
  pcStack_b8 = FUN_145ff6620;
  puStack_b0 = &uStack_49;
  pcStack_a8 = FUN_145ff2f50;
  ppuStack_a0 = &puStack_88;
  puStack_98 = &DAT_1400020e0;
  puStack_120 = puVar13 + 0x10;
  puStack_100 = &uStack_208;
  FUN_145fe4b70(uStack_258,&DAT_1476c663b,&uStack_180);
  if (puStack_88 != (undefined *)0x0) {
    func_0x0001400021d0(puStack_80,puStack_88,1);
  }
  if (uStack_58 != 0) {
    func_0x0001400021d0(lStack_68,uStack_58 << 4,8);
  }
  if (CONCAT44(uStack_244,uStack_248) != 0) {
    func_0x0001400021d0(CONCAT44(uStack_23c,uStack_240),CONCAT44(uStack_244,uStack_248),1);
  }
  if (CONCAT44(uStack_224,uStack_228) != 0) {
    func_0x0001400021d0(CONCAT44(uStack_21c,uStack_220),CONCAT44(uStack_224,uStack_228),1);
  }
  if (CONCAT44(uStack_204,uStack_208) != 0) {
    func_0x0001400021d0(CONCAT44(uStack_1fc,uStack_200),CONCAT44(uStack_204,uStack_208),1);
  }
  if (CONCAT44(uStack_1e4,uStack_1e8) != 0) {
    func_0x0001400021d0(CONCAT44(uStack_1dc,uStack_1e0),CONCAT44(uStack_1e4,uStack_1e8),1);
  }
  if (CONCAT44(uStack_1c4,uStack_1c8) != 0) {
    func_0x0001400021d0(CONCAT44(uStack_1bc,uStack_1c0),CONCAT44(uStack_1c4,uStack_1c8),1);
  }
  if (CONCAT44(uStack_1a4,uStack_1a8) != 0) {
    func_0x0001400021d0(CONCAT44(uStack_19c,uStack_1a0),CONCAT44(uStack_1a4,uStack_1a8),1);
  }
  return uVar12;
}
