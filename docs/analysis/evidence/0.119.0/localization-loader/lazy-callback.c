/* Ghidra raw-binary import; external memory/callees absent; inferred ABI.
 * Original PE instructions govern Windows-x64 arguments and globals. */

void entry(void)

{
  code *pcVar1;
  long lVar2;
  undefined8 *in_RCX;
  undefined8 *puVar3;

  puVar3 = *(undefined8 **)*in_RCX;
  *(undefined8 *)*in_RCX = 0;
  if (puVar3 == (undefined8 *)0x0) {
    func_0x00014613b4b0();
                    /* WARNING: Does not return */
    pcVar1 = (code *)invalidInstructionException();
    (*pcVar1)();
  }
  func_0x000140002200();
  lVar2 = func_0x0001400021c0();
  if (lVar2 != 0) {
    func_0x000145c13e00();
    puVar3[2] = 0;
    *puVar3 = 0xe;
    puVar3[1] = lVar2;
    return;
  }
  func_0x00014613b1bb();
                    /* WARNING: Does not return */
  pcVar1 = (code *)invalidInstructionException();
  (*pcVar1)();
}
