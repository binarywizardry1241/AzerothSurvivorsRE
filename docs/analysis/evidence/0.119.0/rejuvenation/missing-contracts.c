/* shared-heal-need-admission; original result runtime/gap177-native/lifecycle-query/results/b73d8e2fca0e81e622385517698bdecccbc31a3f9889b26153303359b9ed0897.json. Inferred types/ABI remain uncertain. */

undefined8 FUN_145b85e70(longlong param_1)

{
  float *pfVar1;
  ulonglong uVar2;
  undefined8 *puVar3;
  ulonglong uVar4;
  float fVar5;
  float fVar6;

  uVar2 = *(ulonglong *)(param_1 + 0xa10);
  if (*(ulonglong *)(param_1 + 0xa28) < *(ulonglong *)(param_1 + 0xa10)) {
    uVar2 = *(ulonglong *)(param_1 + 0xa28);
  }
  if (uVar2 != 0) {
    puVar3 = *(undefined8 **)(param_1 + 0xa08);
    uVar4 = 0;
    do {
      if ((((*(ulonglong *)(param_1 + 0xb80) != uVar4) &&
           (*(char *)((longlong)puVar3 + 0xc) != '\0')) &&
          (pfVar1 = (float *)(*(longlong *)(param_1 + 0xa20) + uVar4 * 4),
          *pfVar1 <= 0.85 && *pfVar1 != 0.85)) &&
         (fVar5 = (float)*puVar3 - (float)*(undefined8 *)(param_1 + 0x4f0),
         fVar6 = (float)((ulonglong)*puVar3 >> 0x20) -
                 (float)((ulonglong)*(undefined8 *)(param_1 + 0x4f0) >> 0x20),
         fVar6 * fVar6 + fVar5 * fVar5 <= 900.0)) {
        return CONCAT71((int7)(uVar2 >> 8),1);
      }
      uVar4 = uVar4 + 1;
      puVar3 = puVar3 + 2;
    } while (uVar2 != uVar4);
  }
  return 0;
}



/* remote-hero-tick-gates; original result runtime/gap177-native/lifecycle-query/results/dcff0e14fb4ebe580b7b63c09b587fac1e2bb3a4b00b09e9ba7944259b4b7cc7.json. Inferred types/ABI remain uncertain. */
  if (*(char *)(param_4 + 0xc8a) == '\x01') {
    puVar2 = (undefined4 *)*param_3;
    FUN_145b8d6e0(param_4,*puVar2);
    FUN_145bc53e0(param_4,*puVar2);
    FUN_145becb70(param_4,*puVar2);
    FUN_145bc0690(param_4);
    FUN_145bbddb0(param_4);
  }


/* healing-admission-snapshot; original result runtime/gap177-native/admission-snapshot-query/results/11f03104e09129da7e08cef6443fdee67ab3405effd722dd90f053c6d1daa883.json. Inferred types/ABI remain uncertain. */

void FUN_145b85970(longlong param_1)

{
  longlong lVar1;
  char cVar2;
  code *pcVar3;
  longlong *plVar4;
  undefined8 *puVar5;
  longlong lVar6;
  float fVar7;
  undefined8 *puStack_e0;
  undefined8 *puStack_d8;
  ulonglong *puStack_d0;
  longlong lStack_c8;
  undefined8 uStack_c0;
  undefined8 uStack_b8;
  undefined8 uStack_b0;
  ulonglong uStack_a8;
  undefined8 uStack_a0;
  undefined8 uStack_98;
  undefined8 uStack_90;
  longlong lStack_88;
  longlong lStack_80;
  longlong lStack_78;
  longlong lStack_70;
  longlong lStack_68;
  longlong *plStack_60;
  undefined4 uStack_58;
  undefined4 uStack_54;
  undefined4 uStack_50;
  undefined4 uStack_4c;
  longlong lStack_48;
  undefined8 uStack_38;

  uStack_38 = 0xfffffffffffffffe;
  lVar6 = *(longlong *)(param_1 + 0x998) + 1;
  func_0x000140002200();
  puVar5 = (undefined8 *)func_0x0001400021c0(lVar6 * 0x10,4);
  if (puVar5 == (undefined8 *)0x0) {
    FUN_14613b1bb(4,lVar6 * 0x10);
                    /* WARNING: Does not return */
    pcVar3 = (code *)invalidInstructionException();
    (*pcVar3)();
  }
  uStack_90 = 0;
  uStack_a0 = lVar6;
  uStack_98 = puVar5;
  func_0x000140002200();
  uStack_b8 = (float *)func_0x0001400021c0(lVar6 * 4,4);
  if (uStack_b8 == (float *)0x0) {
    FUN_14613b1bb(4,lVar6 * 4);
                    /* WARNING: Does not return */
    pcVar3 = (code *)invalidInstructionException();
    (*pcVar3)();
  }
  puStack_e0 = &uStack_a0;
  puStack_d8 = &uStack_c0;
  puStack_d0 = &uStack_a8;
  cVar2 = *(char *)(param_1 + 0xc8a);
  *(undefined4 *)(puVar5 + 1) = *(undefined4 *)(param_1 + 0x4f8);
  *puVar5 = *(undefined8 *)(param_1 + 0x4f0);
  *(bool *)((longlong)puVar5 + 0xc) = cVar2 == '\x01';
  fVar7 = *(float *)(param_1 + 0x4a0);
  if (fVar7 <= 1.0) {
    fVar7 = 1.0;
  }
  uStack_90 = 1;
  *uStack_b8 = *(float *)(param_1 + 0x508) / fVar7;
  uStack_b0 = 1;
  uStack_a8 = (ulonglong)(cVar2 != '\x04');
  uStack_c0 = lVar6;
  FUN_145b88450(param_1);
  if (*(longlong *)(param_1 + 0x998) != 0) {
    lStack_48 = *(longlong *)(param_1 + 0x998);
    uStack_58 = *(undefined4 *)(param_1 + 0x988);
    uStack_54 = *(undefined4 *)(param_1 + 0x98c);
    uStack_50 = *(undefined4 *)(param_1 + 0x990);
    uStack_4c = *(undefined4 *)(param_1 + 0x994);
    lStack_88 = *(longlong *)(param_1 + 0x990);
    *(undefined8 *)(param_1 + 0x988) = 0;
    *(undefined8 *)(param_1 + 0x990) = 8;
    *(undefined8 *)(param_1 + 0x998) = 0;
    lStack_80 = lStack_48 * 0x990 + lStack_88;
    lVar6 = 0;
    if (lStack_88 != lStack_80) {
      do {
        lVar6 = lVar6 + 1;
        func_0x000145ba8530(param_1);
        *(longlong *)(param_1 + 0xb80) = lVar6;
        FUN_145b242a0(*(undefined8 *)(param_1 + 0x2e0),*(undefined8 *)(param_1 + 0x2e8),&puStack_e0,
                      param_1);
        FUN_145b88450(param_1);
        lVar1 = lStack_88 + 0x990;
        *(undefined8 *)(param_1 + 0xb80) = 0;
        func_0x000145ba8530(param_1);
        lStack_88 = lVar1;
      } while (lVar1 != lStack_80);
    }
    lStack_c8 = *(longlong *)(param_1 + 0x990);
    lStack_78 = *(longlong *)(param_1 + 0x998);
    lStack_68 = 0;
    lVar6 = lStack_c8;
    lStack_70 = param_1;
    plStack_60 = (longlong *)(param_1 + 0x988);
    while (plVar4 = plStack_60, param_1 = lStack_70, lStack_78 != lStack_68) {
      lStack_68 = lStack_68 + 1;
      FUN_145c24f70(lVar6);
      lVar6 = lVar6 + 0x990;
    }
    if (*plStack_60 != 0) {
      func_0x0001400021d0(*(undefined8 *)(lStack_70 + 0x990),*plStack_60 * 0x990,8);
    }
    plVar4[2] = lStack_48;
    *plVar4 = CONCAT44(uStack_54,uStack_58);
    plVar4[1] = CONCAT44(uStack_4c,uStack_50);
  }
  lStack_48 = uStack_90;
  uStack_58 = (undefined4)uStack_a0;
  uStack_54 = uStack_a0._4_4_;
  uStack_50 = (undefined4)uStack_98;
  uStack_4c = uStack_98._4_4_;
  if (*(longlong *)(param_1 + 0xa00) != 0) {
    func_0x0001400021d0(*(undefined8 *)(param_1 + 0xa08),*(longlong *)(param_1 + 0xa00) << 4,4);
  }
  *(longlong *)(param_1 + 0xa10) = lStack_48;
  *(ulonglong *)(param_1 + 0xa00) = CONCAT44(uStack_54,uStack_58);
  *(ulonglong *)(param_1 + 0xa08) = CONCAT44(uStack_4c,uStack_50);
  lStack_48 = uStack_b0;
  uStack_58 = (undefined4)uStack_c0;
  uStack_54 = uStack_c0._4_4_;
  uStack_50 = (undefined4)uStack_b8;
  uStack_4c = uStack_b8._4_4_;
  if (*(longlong *)(param_1 + 0xa18) != 0) {
    func_0x0001400021d0(*(undefined8 *)(param_1 + 0xa20),*(longlong *)(param_1 + 0xa18) << 2,4);
  }
  *(longlong *)(param_1 + 0xa28) = lStack_48;
  *(ulonglong *)(param_1 + 0xa18) = CONCAT44(uStack_54,uStack_58);
  *(ulonglong *)(param_1 + 0xa20) = CONCAT44(uStack_4c,uStack_50);
  *(ulonglong *)(param_1 + 0xb90) = uStack_a8 + (uStack_a8 == 0);
  return;
}



/* remote-healing-admission-snapshot; original result runtime/gap177-native/remote-snapshot-query/results/b5a66468f1dbc151fee66117992db764dfd67e66ca939ceee617411e943105fb.json. Inferred types/ABI remain uncertain. */
  plVar4 = (longlong *)*param_3;
  cVar2 = *(char *)(param_4 + 0xc8a);
  lVar5 = plVar4[2];
  if (lVar5 == *plVar4) {
    FUN_145fc4c70(plVar4);
  }
  lVar6 = plVar4[1];
  lVar10 = lVar5 * 0x10;
  *(undefined4 *)(lVar6 + 8 + lVar10) = *(undefined4 *)(param_4 + 0x4f8);
  *(undefined8 *)(lVar6 + lVar10) = *(undefined8 *)(param_4 + 0x4f0);
  *(bool *)(lVar6 + 0xc + lVar10) = cVar2 == '\x01';
  plVar4[2] = lVar5 + 1;
  plVar4 = (longlong *)param_3[1];
  fVar11 = *(float *)(param_4 + 0x4a0);
  fVar1 = *(float *)(param_4 + 0x508);
  lVar5 = plVar4[2];
  if (lVar5 == *plVar4) {
    FUN_145f99640(plVar4);
  }
  if (fVar11 <= 1.0) {
    fVar11 = 1.0;
  }
  *(float *)(plVar4[1] + lVar5 * 4) = fVar1 / fVar11;
  plVar4[2] = lVar5 + 1;
  *(longlong *)param_3[2] = *(longlong *)param_3[2] + (ulonglong)(cVar2 != '\x04');
