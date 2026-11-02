
void entry(void)

{
  uint uVar1;
  long lVar2;
  ulong uVar3;
  undefined1 auVar4 [16];
  
  auVar4 = func_0x0001460044e0();
  lVar2 = -auVar4._0_8_;
  *(undefined8 *)(&stack0x00002900 + lVar2) = 0xfffffffffffffffe;
  *(uint **)(&stack0x000028e8 + lVar2) = auVar4._8_8_;
  uVar1 = *auVar4._8_8_;
  uVar3 = 0xb;
  if (1 < uVar1) {
    uVar3 = (ulong)(uVar1 - 2);
  }
  *(ulong *)(&stack0x000028d8 + lVar2) = uVar3;
                    /* WARNING: Could not recover jumptable at 0x000145c23798. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)((long)*(int *)(uVar3 * 4 + 0x1476acad4) + 0x1476acad4))();
  return;
}

