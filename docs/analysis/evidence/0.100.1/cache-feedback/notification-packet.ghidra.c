undefined8 * entry(void)

{
  code *pcVar1;
  long lVar2;
  undefined8 *in_RCX;
  ulong in_R8;
  undefined6 uStack_46;

  func_0x000140002200();
  lVar2 = func_0x0001400021c0();
  if (lVar2 == 0) {
    func_0x00014590379b();
                    /* WARNING: Does not return */
    pcVar1 = (code *)invalidInstructionException();
    (*pcVar1)();
  }
  if (in_R8 < 0x21) {
    if (in_R8 == 0) goto LAB_14545bf61;
  }
  else {
    func_0x0001457744b0();
  }
  func_0x0001457731ed();
LAB_14545bf61:
  if (in_R8 == 0x20) {
    func_0x000145903690();
  }
  *(undefined1 *)(lVar2 + in_R8) = 0;
  *in_RCX = 0x20;
  in_RCX[1] = lVar2;
  in_RCX[2] = in_R8 + 1;
  in_RCX[3] = CONCAT62(uStack_46,0x1cb);
  return in_RCX;
}
