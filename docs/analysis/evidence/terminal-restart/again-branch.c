void entry(undefined8 param_1,long param_2)

{
  int *piVar1;
  int iVar2;
  long lVar3;
  code *pcVar4;
  long lVar5;
  long lVar6;
  long unaff_RBP;
  char cVar7;
  undefined4 uVar8;
  undefined8 unaff_R13;

  func_0x0001458b18b0();
  lVar6 = *(long *)(param_2 + 0x10);
  *(undefined8 *)(param_2 + 0x10) = 2;
  if (lVar6 != 2) {
    *(long *)(unaff_RBP + -0x50) = lVar6;
    func_0x000145bf293b();
    if (*(long *)(param_2 + 0xb18) != 0) {
      lVar6 = 0;
LAB_1458b4f50:
      if (*(char *)(*(long *)(param_2 + 0xb10) + 0xa8 + lVar6) == '\0') goto code_r0x0001458b4f5e;
      if (*(long *)(unaff_RBP + -0x40) != 0) {
        func_0x000140002200();
        lVar6 = func_0x0001400021c0();
        if (lVar6 == 0) {
          func_0x000145d934fb();
                    /* WARNING: Does not return */
          pcVar4 = (code *)invalidInstructionException();
          (*pcVar4)();
        }
        *(undefined2 *)(unaff_RBP + 0xa98) = 0x17e;
        *(undefined8 *)(unaff_RBP + 0xa80) = 0x20;
        *(long *)(unaff_RBP + 0xa88) = lVar6;
        *(undefined8 *)(unaff_RBP + 0xa90) = 0;
        func_0x0001458a6870();
      }
      func_0x0001459447a0();
      *(undefined4 *)(unaff_RBP + 0x2110) = 0;
      *(undefined8 *)(unaff_RBP + 0x20f8) = 0;
      *(undefined8 *)(unaff_RBP + 0x2100) = 1;
      *(undefined8 *)(unaff_RBP + 0x2108) = 0;
      lVar6 = *(long *)(unaff_RBP + 0x20c0);
      lVar3 = *(long *)(unaff_RBP + 0x20c8);
      uVar8 = (undefined4)CONCAT71((int7)((ulong)unaff_R13 >> 8),1);
      if (lVar3 != 0) {
        *(undefined1 *)(unaff_RBP + 0x212e) = 1;
        func_0x000145d933f0();
        **(undefined1 **)(unaff_RBP + 0x2100) = 4;
        *(undefined8 *)(unaff_RBP + 0x2108) = 1;
        lVar5 = 1;
        if (*(long *)(unaff_RBP + 0x20f8) - 1U < 4) {
          *(undefined1 *)(unaff_RBP + 0x212e) = 1;
          func_0x000145bf4a90();
          lVar5 = *(long *)(unaff_RBP + 0x2108);
        }
        *(int *)(*(long *)(unaff_RBP + 0x2100) + lVar5) = (int)lVar3;
        *(long *)(unaff_RBP + 0x2108) = *(long *)(unaff_RBP + 0x2108) + 4;
        lVar3 = lVar6 + lVar3 * 8;
        do {
          *(undefined1 *)(unaff_RBP + 0x212e) = 1;
          func_0x0001458c8570();
          lVar6 = lVar6 + 8;
        } while (lVar6 != lVar3);
        piVar1 = (int *)(unaff_RBP + 0x2110);
        *piVar1 = *piVar1 + 1;
        if (*piVar1 != 0) {
          *(undefined4 *)(unaff_RBP + 0xa90) = *(undefined4 *)(unaff_RBP + 0x2108);
          *(undefined4 *)(unaff_RBP + 0xa94) = *(undefined4 *)(unaff_RBP + 0x210c);
          *(undefined4 *)(unaff_RBP + 0xa98) = *(undefined4 *)(unaff_RBP + 0x2110);
          *(undefined4 *)(unaff_RBP + 0xa9c) = *(undefined4 *)(unaff_RBP + 0x2114);
          *(undefined4 *)(unaff_RBP + 0xa80) = *(undefined4 *)(unaff_RBP + 0x20f8);
          *(undefined4 *)(unaff_RBP + 0xa84) = *(undefined4 *)(unaff_RBP + 0x20fc);
          *(undefined4 *)(unaff_RBP + 0xa88) = *(undefined4 *)(unaff_RBP + 0x2100);
          *(undefined4 *)(unaff_RBP + 0xa8c) = *(undefined4 *)(unaff_RBP + 0x2104);
          *(undefined1 *)(unaff_RBP + 0x212e) = 0;
          func_0x0001458b89f0();
          *(undefined1 *)(unaff_RBP + 0x212e) = 0;
          func_0x0001458a6870();
          uVar8 = 0;
        }
      }
      cVar7 = (char)uVar8;
      *(char *)(unaff_RBP + 0x212e) = cVar7;
      func_0x0001458b7220();
      if (*(int *)(unaff_RBP + 0xa80) != 2) {
        func_0x000145bf293b();
        *(undefined8 *)(param_2 + 0xd70) = 0;
        if (*(long *)(param_2 + 0xd78) != 0) {
          func_0x0001400021d0();
        }
        if (*(long *)(param_2 + 0xd90) != 0) {
          func_0x0001400021d0();
        }
        if (*(long *)(param_2 + 0xda8) != 0) {
          func_0x0001400021d0();
        }
        if (*(long *)(param_2 + 0xdc0) != 0) {
          func_0x0001400021d0();
        }
        if (*(long *)(param_2 + 0xdd8) != 0) {
          func_0x0001400021d0();
        }
        if (*(long *)(param_2 + 0xdf0) != 0) {
          func_0x0001400021d0();
        }
        if (*(long *)(param_2 + 0xe08) != 0) {
          func_0x0001400021d0();
        }
        if (*(long *)(param_2 + 0xe20) != 0) {
          func_0x0001400021d0();
        }
        if (*(long *)(param_2 + 0xe38) != 0) {
          func_0x0001400021d0();
        }
        if (*(long *)(param_2 + 0xe50) != 0) {
          func_0x0001400021d0();
        }
        if (*(long *)(param_2 + 0xe68) != 0) {
          func_0x0001400021d0();
        }
        if (*(long *)(param_2 + 0xe80) != 0) {
          func_0x0001400021d0();
        }
        if (*(long *)(param_2 + 0xe98) != 0) {
          func_0x0001400021d0();
        }
        if (*(long *)(param_2 + 0xeb0) != 0) {
          func_0x0001400021d0();
        }
        *(undefined4 *)(unaff_RBP + 0x2118) = uVar8;
        if (*(long *)(param_2 + 0xec8) != 0) {
          func_0x0001400021d0();
        }
        *(undefined8 *)(param_2 + 0xd78) = 0;
        *(undefined8 *)(param_2 + 0xd80) = 1;
        *(undefined8 *)(param_2 + 0xd88) = 0;
        *(undefined8 *)(param_2 + 0xd90) = 0;
        *(undefined8 *)(param_2 + 0xd98) = 1;
        *(undefined8 *)(param_2 + 0xda0) = 0;
        *(undefined8 *)(param_2 + 0xda8) = 0;
        *(undefined8 *)(param_2 + 0xdb0) = 1;
        *(undefined8 *)(param_2 + 0xdb8) = 0;
        *(undefined8 *)(param_2 + 0xdc0) = 0;
        *(undefined8 *)(param_2 + 0xdc8) = 1;
        *(undefined8 *)(param_2 + 0xdd0) = 0;
        *(undefined8 *)(param_2 + 0xdd8) = 0;
        *(undefined8 *)(param_2 + 0xde0) = 1;
        *(undefined8 *)(param_2 + 0xde8) = 0;
        *(undefined8 *)(param_2 + 0xdf0) = 0;
        *(undefined8 *)(param_2 + 0xdf8) = 1;
        *(undefined8 *)(param_2 + 0xe00) = 0;
        *(undefined8 *)(param_2 + 0xe08) = 0;
        *(undefined8 *)(param_2 + 0xe10) = 1;
        *(undefined8 *)(param_2 + 0xe18) = 0;
        *(undefined8 *)(param_2 + 0xe20) = 0;
        *(undefined8 *)(param_2 + 0xe28) = 1;
        *(undefined8 *)(param_2 + 0xe30) = 0;
        *(undefined8 *)(param_2 + 0xe38) = 0;
        *(undefined8 *)(param_2 + 0xe40) = 1;
        *(undefined8 *)(param_2 + 0xe48) = 0;
        *(undefined8 *)(param_2 + 0xe50) = 0;
        *(undefined8 *)(param_2 + 0xe58) = 1;
        *(undefined8 *)(param_2 + 0xe60) = 0;
        *(undefined8 *)(param_2 + 0xe68) = 0;
        *(undefined8 *)(param_2 + 0xe70) = 1;
        *(undefined8 *)(param_2 + 0xe78) = 0;
        *(undefined8 *)(param_2 + 0xe80) = 0;
        *(undefined8 *)(param_2 + 0xe88) = 1;
        *(undefined8 *)(param_2 + 0xe90) = 0;
        *(undefined8 *)(param_2 + 0xe98) = 0;
        *(undefined8 *)(param_2 + 0xea0) = 1;
        *(undefined8 *)(param_2 + 0xea8) = 0;
        *(undefined8 *)(param_2 + 0xeb0) = 0;
        *(undefined8 *)(param_2 + 0xeb8) = 1;
        *(undefined8 *)(param_2 + 0xec0) = 0;
        *(undefined8 *)(param_2 + 0xec8) = 0;
        *(undefined8 *)(param_2 + 0xed0) = 1;
        *(undefined8 *)(param_2 + 0xed8) = 0;
        *(undefined8 *)(param_2 + 0x10e8) = 0;
        *(undefined4 *)(unaff_RBP + 0x20b0) = *(undefined4 *)(unaff_RBP + 0x1a18);
        *(undefined8 *)(unaff_RBP + 0x20a8) = *(undefined8 *)(unaff_RBP + 0x1a10);
        iVar2 = *(int *)(unaff_RBP + 0x4f8);
        *(undefined1 *)(unaff_RBP + 0x212f) = 1;
        func_0x00014591d580();
        *(undefined1 *)(unaff_RBP + 0x212f) = 1;
        func_0x0001458a6870();
        *(undefined1 *)(unaff_RBP + 0x212f) = 1;
        func_0x0001458bb7f0();
        *(undefined1 *)(unaff_RBP + 0x212f) = 1;
        func_0x0001458a6870();
        func_0x000145886360();
        *(undefined1 *)(unaff_RBP + 0x212f) = 1;
        func_0x0001458c70d0();
        *(undefined1 *)(unaff_RBP + 0x212f) = 1;
        func_0x0001458a6870();
        *(int *)(unaff_RBP + 0x1a90) = iVar2 + 0xc;
        *(undefined1 *)(unaff_RBP + 0x212f) = 1;
        func_0x000145991e70();
        func_0x000145bf293b();
        *(int **)(unaff_RBP + 0x2120) = (int *)(param_2 + 0x10);
        if (*(int *)(param_2 + 0x10) != 2) {
          func_0x0001458a4b70();
        }
        func_0x000145bf293b();
        lVar6 = *(long *)(param_2 + 0x1098);
        *(undefined1 *)(unaff_RBP + 0x212f) = 0;
        func_0x0001458e32a0();
        *(undefined1 *)(unaff_RBP + 0x212f) = 0;
        func_0x0001458e49b0();
        *(undefined1 *)(unaff_RBP + 0x212f) = 0;
        func_0x0001458e49b0();
        *(undefined1 *)(unaff_RBP + 0x212f) = 0;
        func_0x0001458e4650();
        *(undefined8 *)(unaff_RBP + 0x2120) = *(undefined8 *)(unaff_RBP + 0x20d8);
        *(undefined8 *)(unaff_RBP + 0x20d0) = *(undefined8 *)(unaff_RBP + 0x20e0);
        (**(code **)(lVar6 + 0x18))();
        if (*(long *)(unaff_RBP + 0x2120) != 0) {
          func_0x0001400021d0();
        }
        cVar7 = *(char *)(unaff_RBP + 0x2118);
      }
      if ((cVar7 != '\0') && (*(long *)(unaff_RBP + 0x20f8) != 0)) {
        func_0x0001400021d0();
      }
      if (*(long *)(unaff_RBP + 0x20b8) != 0) {
        func_0x0001400021d0();
      }
    }
LAB_1458b646e:
    func_0x0001458a4b70();
  }
  return;
code_r0x0001458b4f5e:
  lVar6 = lVar6 + 0xb0;
  if (*(long *)(param_2 + 0xb18) * 0xb0 - lVar6 == 0) goto LAB_1458b646e;
  goto LAB_1458b4f50;
}
