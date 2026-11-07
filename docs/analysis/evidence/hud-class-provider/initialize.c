undefined8 entry(void)

{
  long lVar1;
  code *pcVar2;
  long lVar3;
  long lVar4;
  undefined8 uVar5;
  long lVar6;
  long lVar7;
  undefined8 in_RCX;
  long *plVar8;
  long in_R8;
  undefined1 auVar9 [16];
  undefined8 uStack_48;

  uStack_48 = 0x14029c096;
  auVar9 = func_0x000145bf95a0();
  plVar8 = auVar9._8_8_;
  lVar3 = -auVar9._0_8_;
  *(undefined8 *)(&stack0x00001700 + lVar3) = 0xfffffffffffffffe;
  if (*plVar8 == -1) {
    *(undefined8 *)((long)&uStack_48 + lVar3) = 0x14029c122;
    func_0x000144e85b40(plVar8,in_RCX,in_R8,&stack0x000016b8 + lVar3,0x145df0fb0);
    *(long *)(&stack0x00001130 + lVar3) = in_R8 + 0x40;
    *(long *)(&stack0x00001138 + lVar3) = in_R8 + 0x5a8;
    *(undefined8 *)(&stack0x00001118 + lVar3) = 0;
    *(undefined8 *)(&stack0x00001120 + lVar3) = 8;
    *(undefined8 *)(&stack0x00001128 + lVar3) = 0;
    *(undefined8 *)((long)&uStack_48 + lVar3) = 0x14029c16f;
    lVar4 = func_0x000140003100();
    if (*(long *)(&stack0x00001118 + lVar3) != 0) {
      *(undefined8 *)((long)&uStack_48 + lVar3) = 0x14029c195;
      func_0x0001400021d0();
    }
    *(undefined8 *)((long)&uStack_48 + lVar3) = 0x14029c19e;
    uVar5 = func_0x000140033690();
    *(undefined8 *)(&stack0x000016f0 + lVar3) = uVar5;
    *(undefined8 *)((long)&uStack_48 + lVar3) = 0x14029c1ad;
    uVar5 = func_0x000140031430();
    *(undefined8 *)(&stack0x000016f8 + lVar3) = uVar5;
    *(long *)(&stack0x00001130 + lVar3) = in_R8 + 0x40;
    *(long *)(&stack0x00001138 + lVar3) = in_R8 + 0x5a8;
    *(undefined8 *)(&stack0x00001118 + lVar3) = 0;
    *(undefined8 *)(&stack0x00001120 + lVar3) = 8;
    *(undefined8 *)(&stack0x00001128 + lVar3) = 0;
    *(undefined8 *)((long)&uStack_48 + lVar3) = 0x14029c1f6;
    lVar6 = func_0x000140005770();
    if (*(long *)(&stack0x00001118 + lVar3) != 0) {
      *(undefined8 *)((long)&uStack_48 + lVar3) = 0x14029c21c;
      func_0x0001400021d0();
    }
    *(undefined8 *)((long)&uStack_48 + lVar3) = 0x14029c225;
    lVar7 = func_0x000140032560();
    *(undefined8 *)((long)&uStack_48 + lVar3) = 0x14029c238;
    FUN_140384540();
    *(undefined8 *)((long)&uStack_48 + lVar3) = 0x14029c248;
    func_0x0001400d1600();
    *(undefined8 *)((long)&uStack_48 + lVar3) = 0x14029c258;
    FUN_140397420();
    *(undefined8 *)((long)&uStack_48 + lVar3) = 0x14029c268;
    FUN_14039f690();
    *(undefined8 *)((long)&uStack_48 + lVar3) = 0x14029c278;
    FUN_14039ef60();
    *(undefined8 *)((long)&uStack_48 + lVar3) = 0x14029c285;
    FUN_140384b60();
    *(undefined8 *)(&stack0x00000390 + lVar3) = *(undefined8 *)(&stack0x000016e8 + lVar3);
    *(undefined4 *)(&stack0x00000380 + lVar3) = *(undefined4 *)(&stack0x000016d8 + lVar3);
    *(undefined4 *)(&stack0x00000384 + lVar3) = *(undefined4 *)(&stack0x000016dc + lVar3);
    *(undefined4 *)(&stack0x00000388 + lVar3) = *(undefined4 *)(&stack0x000016e0 + lVar3);
    *(undefined4 *)(&stack0x0000038c + lVar3) = *(undefined4 *)(&stack0x000016e4 + lVar3);
    *(undefined4 *)(&stack0x00000370 + lVar3) = *(undefined4 *)(&stack0x000016c8 + lVar3);
    *(undefined4 *)(&stack0x00000374 + lVar3) = *(undefined4 *)(&stack0x000016cc + lVar3);
    *(undefined4 *)(&stack0x00000378 + lVar3) = *(undefined4 *)(&stack0x000016d0 + lVar3);
    *(undefined4 *)(&stack0x0000037c + lVar3) = *(undefined4 *)(&stack0x000016d4 + lVar3);
    *(undefined4 *)(&stack0x00000360 + lVar3) = *(undefined4 *)(&stack0x000016b8 + lVar3);
    *(undefined4 *)(&stack0x00000364 + lVar3) = *(undefined4 *)(&stack0x000016bc + lVar3);
    *(undefined4 *)(&stack0x00000368 + lVar3) = *(undefined4 *)(&stack0x000016c0 + lVar3);
    *(undefined4 *)(&stack0x0000036c + lVar3) = *(undefined4 *)(&stack0x000016c4 + lVar3);
    *(undefined8 *)((long)&uStack_48 + lVar3) = 0x14029c2d7;
    func_0x000145bfa0e7();
    *(undefined8 *)((long)&uStack_48 + lVar3) = 0x14029c2f0;
    func_0x000145bfa0e7();
    *(undefined8 *)((long)&uStack_48 + lVar3) = 0x14029c309;
    func_0x000145bfa0e7();
    *(undefined8 *)((long)&uStack_48 + lVar3) = 0x14029c322;
    func_0x000145bfa0e7();
    *(undefined8 *)((long)&uStack_48 + lVar3) = 0x14029c33b;
    func_0x000145bfa0e7();
    *(undefined8 *)((long)&uStack_48 + lVar3) = 0x14029c351;
    func_0x000145bfa0e7();
    lVar1 = *(long *)(in_R8 + 0x5a0);
    *(undefined8 *)((long)&uStack_48 + lVar3) = 0x14029c36d;
    func_0x000145bfa0e7();
    plVar8[0x170] = lVar4;
    plVar8[0x171] = *(long *)(&stack0x000016f0 + lVar3);
    plVar8[0x172] = *(long *)(&stack0x000016f8 + lVar3);
    plVar8[0x173] = lVar6;
    plVar8[0x174] = lVar7;
    plVar8[0x175] = 0;
    plVar8[0x176] = 1;
    plVar8[0x177] = 0;
    plVar8[0x178] = lVar1;
  }
  else {
    lVar4 = *(long *)(in_R8 + 0x5a0);
    *(long *)(&stack0x00000360 + lVar3) = lVar4;
    if (plVar8[0x178] != lVar4) {
      *(undefined8 *)(&stack0xffffffffffffffe8 + lVar3) = 0x145df2520;
      *(undefined8 *)(&stack0xffffffffffffffe0 + lVar3) = 0x83;
      *(undefined8 *)((long)&uStack_48 + lVar3) = 0x14029c10a;
      func_0x000145d4891d(plVar8 + 0x178,in_RCX,plVar8 + 0x178,0,&stack0x00000360 + lVar3,
                          0x145df24d8);
                    /* WARNING: Does not return */
      pcVar2 = (code *)invalidInstructionException();
      (*pcVar2)();
    }
  }
  *(int *)(plVar8 + 0x179) = *(int *)(in_R8 + 0x5b0) + 0x3dcc5000;
  *(undefined8 *)(&stack0x00000378 + lVar3) = 0x10;
  *(undefined8 *)(&stack0x00000380 + lVar3) = 0;
  *(undefined8 *)(&stack0x00000388 + lVar3) = 0;
  *(undefined8 *)(&stack0x00000390 + lVar3) = 0x10;
  *(undefined8 *)(&stack0x00000398 + lVar3) = 0;
  *(undefined8 *)(&stack0x000003a0 + lVar3) = 0;
  *(undefined8 *)(&stack0x000003a8 + lVar3) = 0x10;
  *(undefined8 *)(&stack0x000003b0 + lVar3) = 0;
  *(undefined8 *)(&stack0x000003b8 + lVar3) = 0;
  *(undefined8 *)(&stack0x000003c0 + lVar3) = 0x10;
  *(undefined8 *)(&stack0x000003c8 + lVar3) = 0;
  *(undefined8 *)(&stack0x000003d0 + lVar3) = 0;
  *(undefined8 *)(&stack0x000003d8 + lVar3) = 0x10;
  *(undefined8 *)(&stack0x00000360 + lVar3) = 0;
  *(undefined8 *)(&stack0x000003e0 + lVar3) = 0;
  *(undefined8 *)(&stack0x000003e8 + lVar3) = 0;
  *(undefined4 *)(&stack0x000003f0 + lVar3) = 0;
  *(undefined8 *)(&stack0x00000368 + lVar3) = 8;
  *(undefined8 *)(&stack0x00000370 + lVar3) = 0;
  *(undefined8 *)((long)&uStack_48 + lVar3) = 0x14029c478;
  func_0x000140277ff0();
  *(undefined8 *)((long)&uStack_48 + lVar3) = 0x14029c48e;
  func_0x000145bfa0e7();
  return in_RCX;
}
