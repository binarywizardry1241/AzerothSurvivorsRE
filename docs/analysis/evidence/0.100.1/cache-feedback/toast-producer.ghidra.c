void entry(void)

{
  long lVar1;
  long lVar2;
  code *pcVar3;
  undefined1 *puVar4;
  long in_RCX;
  long lVar5;

  func_0x000140002200();
  puVar4 = (undefined1 *)func_0x0001400021c0();
  if (puVar4 == (undefined1 *)0x0) {
    func_0x00014590379b();
                    /* WARNING: Does not return */
    pcVar3 = (code *)invalidInstructionException();
    (*pcVar3)();
  }
  *puVar4 = 0x7b;
  func_0x000145456ed0();
  func_0x000145456ed0();
  lVar5 = 1;
  func_0x0001457744b0();
  puVar4[lVar5] = 0x7d;
  lVar1 = *(long *)(in_RCX + 0x578);
  if (lVar1 == *(long *)(in_RCX + 0x568)) {
    func_0x0001457745c0();
  }
  lVar2 = *(long *)(in_RCX + 0x570);
  *(undefined8 *)(lVar2 + lVar1 * 0x18) = 1;
  *(undefined1 **)(lVar2 + 8 + lVar1 * 0x18) = puVar4;
  *(long *)(lVar2 + 0x10 + lVar1 * 0x18) = lVar5 + 1;
  *(long *)(in_RCX + 0x578) = lVar1 + 1;
  return;
}
