
void entry(void)

{
  code *pcVar1;
  long lVar2;
  ulong uVar3;
  undefined1 *puVar4;
  ulong uVar5;
  byte bVar6;
  undefined8 in_R8;
  ulong uVar7;
  undefined1 auVar8 [16];
  undefined8 uStack_48;

  uStack_48 = 0x1458b2456;
  auVar8 = func_0x000145d13ac0();
  uVar5 = auVar8._8_8_;
  lVar2 = -auVar8._0_8_;
  *(undefined8 *)(&stack0x00001010 + lVar2) = 0xfffffffffffffffe;
  uVar3 = uVar5 - (uVar5 >> 1);
  uVar7 = 1000000;
  if (uVar5 < 1000000) {
    uVar7 = uVar5;
  }
  if (uVar7 <= uVar3) {
    uVar7 = uVar3;
  }
  *(ulong *)(&stack0x00001000 + lVar2) = uVar7;
  if (0x200 < uVar7) {
    if (uVar7 * 8 < 0x7ffffffffffffff9 && uVar3 >> 0x3d == 0) {
      *(undefined8 *)((long)&uStack_48 + lVar2) = 0x1458b24f8;
      func_0x000140002200();
      *(undefined8 *)((long)&uStack_48 + lVar2) = 0x1458b250a;
      puVar4 = (undefined1 *)func_0x0001400021c0();
      if (puVar4 != (undefined1 *)0x0) {
        bVar6 = 1;
        goto LAB_1458b2521;
      }
    }
    (&stack0x0000100f)[lVar2] = 0;
    *(undefined8 *)((long)&uStack_48 + lVar2) = 0x1458b24e7;
    func_0x000145eb6fcb();
                    /* WARNING: Does not return */
    pcVar1 = (code *)invalidInstructionException();
    (*pcVar1)();
  }
  puVar4 = &stack0xfffffffffffffff8 + lVar2;
  bVar6 = 0;
LAB_1458b2521:
  *(undefined1 **)(&stack0x00000ff8 + lVar2) = puVar4;
  (&stack0x0000100f)[lVar2] = bVar6;
  *(undefined8 *)(&stack0xffffffffffffffe8 + lVar2) = in_R8;
  (&stack0xffffffffffffffe0)[lVar2] = uVar5 < 0x41;
  *(undefined8 *)((long)&uStack_48 + lVar2) = 0x1458b2545;
  func_0x0001458b6100();
  if ((*(long *)(&stack0x00001000 + lVar2) != 0 & bVar6) != 0) {
    *(undefined8 *)((long)&uStack_48 + lVar2) = 0x1458b256a;
    func_0x0001400021d0();
  }
  return;
}
