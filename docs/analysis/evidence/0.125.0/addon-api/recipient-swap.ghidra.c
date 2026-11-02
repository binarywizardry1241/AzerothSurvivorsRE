undefined8 FUN_145bfdea0(undefined8 param_1,longlong param_2,ulonglong param_3,undefined8 *param_4)

{
  ulonglong uVar1;
  undefined8 uVar2;
  longlong lVar3;
  longlong lVar4;
  undefined8 uVar5;
  code *pcVar6;
  undefined1 *puVar7;
  longlong lVar8;
  longlong lVar9;
  ulonglong uVar10;
  undefined8 uStack_48;
  
  uStack_48 = 0x145bfdeb6;
  lVar8 = FUN_1460112e0();
  lVar8 = -lVar8;
  *(undefined8 *)(&stack0x000017e0 + lVar8) = 0xfffffffffffffffe;
  if (param_3 != 0) {
    uVar10 = *(ulonglong *)(param_2 + 0xa58);
    if (param_3 <= uVar10) {
      *(undefined8 *)(&stack0x000017c8 + lVar8) = param_1;
      *(undefined8 **)(&stack0x000017b8 + lVar8) = param_4;
      *(ulonglong *)(&stack0x000017c0 + lVar8) = param_3;
      uVar1 = param_3 - 1;
      *(ulonglong *)(&stack0x000017d0 + lVar8) = uVar1;
      if (uVar10 <= uVar1) {
LAB_145bfe293:
        *(undefined8 *)((longlong)&uStack_48 + lVar8) = 0x145bfe2a9;
        FUN_1461bb15b(*(undefined8 *)(&stack0x000017d0 + lVar8),uVar10,&DAT_1476c5ff8);
                    /* WARNING: Does not return */
        pcVar6 = (code *)invalidInstructionException();
        (*pcVar6)();
      }
      lVar3 = *(longlong *)(param_2 + 0xa50);
      lVar9 = uVar1 * 0xa18;
      lVar4 = *(longlong *)(lVar3 + lVar9);
      *(undefined8 *)((longlong)&uStack_48 + lVar8) = 0x145bfe00c;
      func_0x000146011e1b(&stack0x00000a00 + lVar8,lVar3 + lVar9 + 8,0xa10);
      *(undefined8 *)((longlong)&uStack_48 + lVar8) = 0x145bfe026;
      func_0x000146011e27(lVar3 + lVar9,lVar3 + lVar9 + 0xa18,(uVar10 - param_3) * 0xa18);
      uVar10 = uVar10 - 1;
      *(ulonglong *)(param_2 + 0xa58) = uVar10;
      if (lVar4 == 2) goto LAB_145bfe293;
      *(longlong *)(&stack0xffffffffffffffe8 + lVar8) = lVar4;
      *(undefined8 *)((longlong)&uStack_48 + lVar8) = 0x145bfe054;
      func_0x000146011e1b(&stack0xfffffffffffffff0 + lVar8,&stack0x00000a00 + lVar8,0xa10);
      uVar10 = *(ulonglong *)(&stack0x000017d0 + lVar8);
      if (*(char *)(param_2 + 0xd7e) == '\x01') {
        *(undefined8 *)(&stack0x00001420 + lVar8) = *(undefined8 *)(param_2 + 0xc78);
        lVar3 = *(longlong *)(param_2 + 0x678);
        lVar4 = *(longlong *)(param_2 + 0x680);
        *(undefined8 *)(param_2 + 0x680) = 0;
        *(longlong *)(&stack0x00000a18 + lVar8) = lVar4;
        *(undefined8 *)(&stack0x00000a20 + lVar8) = 0;
        *(longlong *)(&stack0x00000a00 + lVar8) = lVar3;
        *(longlong *)(&stack0x00000a08 + lVar8) = lVar4 * 0x20 + lVar3;
        *(longlong *)(&stack0x00000a10 + lVar8) = param_2 + 0x670;
        *(undefined1 **)(&stack0x00000a28 + lVar8) = &stack0x00001420 + lVar8;
        (&stack0x000017df)[lVar8] = 1;
        *(undefined8 *)((longlong)&uStack_48 + lVar8) = 0x145bfe0ec;
        FUN_145ca7270(param_2 + 0xb08,&stack0x00000a00 + lVar8);
        lVar3 = *(longlong *)(param_2 + 0x690);
        lVar4 = *(longlong *)(param_2 + 0x698);
        *(undefined8 *)(param_2 + 0x698) = 0;
        *(longlong *)(&stack0x00000a18 + lVar8) = lVar4;
        *(undefined8 *)(&stack0x00000a20 + lVar8) = 0;
        *(longlong *)(&stack0x00000a00 + lVar8) = lVar3;
        *(longlong *)(&stack0x00000a08 + lVar8) = lVar3 + lVar4 * 0x18;
        *(longlong *)(&stack0x00000a10 + lVar8) = param_2 + 0x688;
        *(undefined1 **)(&stack0x00000a28 + lVar8) = &stack0x00001420 + lVar8;
        (&stack0x000017df)[lVar8] = 1;
        *(undefined8 *)((longlong)&uStack_48 + lVar8) = 0x145bfe15d;
        FUN_145ca71a0(param_2 + 0xb20,&stack0x00000a00 + lVar8);
      }
      *(undefined8 *)((longlong)&uStack_48 + lVar8) = 0x145bfe16a;
      func_0x000145c556d0(param_2,&stack0xffffffffffffffe8 + lVar8);
      *(undefined8 *)(param_2 + 0xc78) = *(undefined8 *)(&stack0x000017c0 + lVar8);
      uVar2 = *(undefined8 *)(param_2 + 0x2f0);
      uVar5 = *(undefined8 *)(param_2 + 0x2f8);
      (&stack0x000017df)[lVar8] = 1;
      *(longlong *)(&stack0xffffffffffffffe0 + lVar8) = param_2;
      *(undefined8 *)((longlong)&uStack_48 + lVar8) = 0x145bfe1a5;
      FUN_145af0c40(&stack0x00001420 + lVar8,uVar2,uVar5,*(undefined8 *)(&stack0x000017b8 + lVar8));
      (&stack0x000017de)[lVar8] = 1;
      *(undefined8 *)((longlong)&uStack_48 + lVar8) = 0x145bfe1b5;
      FUN_145c16430(param_2);
      *(undefined8 *)(param_2 + 0xc78) = 0;
      *(undefined8 *)((longlong)&uStack_48 + lVar8) = 0x145bfe1d0;
      func_0x000145c556d0(param_2,&stack0xffffffffffffffe8 + lVar8);
      *(undefined8 *)((longlong)&uStack_48 + lVar8) = 0x145bfe1e5;
      func_0x000146011e1b(&stack0x00000a00 + lVar8,&stack0xffffffffffffffe8 + lVar8,0xa18);
      uVar1 = *(ulonglong *)(param_2 + 0xa58);
      if (uVar1 < uVar10) {
        *(undefined8 *)((longlong)&uStack_48 + lVar8) = 0x145bfe290;
        FUN_1461bb0d4(uVar10,uVar1,&DAT_1476c6010);
                    /* WARNING: Does not return */
        pcVar6 = (code *)invalidInstructionException();
        (*pcVar6)();
      }
      if (uVar1 == *(ulonglong *)(param_2 + 0xa48)) {
        *(undefined8 *)((longlong)&uStack_48 + lVar8) = 0x145bfe206;
        FUN_146199320();
      }
      lVar9 = lVar9 + *(longlong *)(param_2 + 0xa50);
      if (uVar10 <= uVar1 && uVar1 - uVar10 != 0) {
        *(undefined8 *)((longlong)&uStack_48 + lVar8) = 0x145bfe22c;
        func_0x000146011e27(lVar9 + 0xa18,lVar9,(uVar1 - uVar10) * 0xa18);
      }
      *(undefined8 *)((longlong)&uStack_48 + lVar8) = 0x145bfe241;
      func_0x000146011e1b(lVar9,&stack0x00000a00 + lVar8,0xa18);
      *(ulonglong *)(param_2 + 0xa58) = uVar1 + 1;
      puVar7 = &stack0x00001420;
      param_1 = *(undefined8 *)(&stack0x000017c8 + lVar8);
      goto LAB_145bfe25f;
    }
  }
  uVar2 = *param_4;
  *(undefined8 *)((longlong)&uStack_48 + lVar8) = 0x145bfdefc;
  FUN_145c254c0(&stack0x000017a0 + lVar8,param_2);
  *(undefined8 *)((longlong)&uStack_48 + lVar8) = 0x145bfdf0c;
  FUN_145c6d020(&stack0x00001788 + lVar8,param_2);
  *(undefined8 *)((longlong)&uStack_48 + lVar8) = 0x145bfdf1c;
  FUN_145c195a0(&stack0x00001420 + lVar8,param_2);
  *(undefined8 *)((longlong)&uStack_48 + lVar8) = 0x145bfdf2c;
  FUN_145b25f20(&stack0xffffffffffffffe8 + lVar8,param_2,uVar2);
  *(undefined8 *)(&stack0x00000a10 + lVar8) = *(undefined8 *)(&stack0x000017b0 + lVar8);
  *(undefined8 *)(&stack0x00000a00 + lVar8) = *(undefined8 *)(&stack0x000017a0 + lVar8);
  *(undefined8 *)(&stack0x00000a08 + lVar8) = *(undefined8 *)(&stack0x000017a8 + lVar8);
  *(undefined8 *)(&stack0x00000a18 + lVar8) = *(undefined8 *)(&stack0x00001788 + lVar8);
  *(undefined8 *)(&stack0x00000a20 + lVar8) = *(undefined8 *)(&stack0x00001790 + lVar8);
  *(undefined8 *)(&stack0x00000a28 + lVar8) = *(undefined8 *)(&stack0x00001798 + lVar8);
  *(undefined4 *)(&stack0x00000a30 + lVar8) = *(undefined4 *)(&stack0x00001420 + lVar8);
  *(undefined4 *)(&stack0x00000a34 + lVar8) = *(undefined4 *)(&stack0x00001424 + lVar8);
  *(undefined4 *)(&stack0x00000a38 + lVar8) = *(undefined4 *)(&stack0x00001428 + lVar8);
  *(undefined4 *)(&stack0x00000a3c + lVar8) = *(undefined4 *)(&stack0x0000142c + lVar8);
  *(undefined8 *)(&stack0x00000a40 + lVar8) = *(undefined8 *)(&stack0x00001430 + lVar8);
  *(undefined8 *)((longlong)&uStack_48 + lVar8) = 0x145bfdf97;
  func_0x000146011e1b(&stack0x00000a48 + lVar8,&stack0xffffffffffffffe8 + lVar8,800);
  *(undefined8 *)((longlong)&uStack_48 + lVar8) = 0x145bfdfa0;
  FUN_145c16430(param_2);
  puVar7 = &stack0x00000a00;
LAB_145bfe25f:
  *(undefined8 *)((longlong)&uStack_48 + lVar8) = 0x145bfe267;
  func_0x000146011e1b(param_1,(longlong)puVar7 + lVar8,0x368);
  return param_1;
}
