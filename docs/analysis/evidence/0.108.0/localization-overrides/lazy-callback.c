void entry(void)

{
  code *pcVar1;
  long lVar2;
  undefined8 *in_RCX;
  undefined8 *puVar3;

  puVar3 = *(undefined8 **)*in_RCX;
  *(undefined8 *)*in_RCX = 0;
  if (puVar3 == (undefined8 *)0x0) {
    func_0x000145d937f0();
                    /* WARNING: Does not return */
    pcVar1 = (code *)invalidInstructionException();
    (*pcVar1)();
  }
  func_0x000140002200();
  lVar2 = func_0x0001400021c0();
  if (lVar2 != 0) {
    func_0x0001459caea0();
    puVar3[2] = 0;
    *puVar3 = 0xe;
    puVar3[1] = lVar2;
    return;
  }
  func_0x000145d934fb();
                    /* WARNING: Does not return */
  pcVar1 = (code *)invalidInstructionException();
  (*pcVar1)();
}
