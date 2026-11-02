undefined8 * FUN_1458ea4b0(void)

{
  code *pcVar1;
  long lVar2;
  undefined8 *in_RCX;
  long in_R8;
  undefined8 local_88;
  undefined8 uStack_80;
  undefined8 local_78;

  FUN_1458ec500(0x146bf172a,in_RCX,0x21,0x146bf172a);
  FUN_1458ec8b0();
  if (-1 < in_R8) {
    if (in_R8 == 0) {
      lVar2 = 1;
    }
    else {
      func_0x000140002200();
      lVar2 = func_0x0001400021c0();
      if (lVar2 == 0) goto LAB_1458ea582;
      func_0x000145bfa0e7();
    }
    in_RCX[6] = 0x146bf1799;
    in_RCX[7] = 0xb;
    *in_RCX = local_88;
    in_RCX[1] = uStack_80;
    in_RCX[2] = local_78;
    in_RCX[3] = in_R8;
    in_RCX[4] = lVar2;
    in_RCX[5] = in_R8;
    *(undefined1 *)(in_RCX + 8) = 0;
    return in_RCX;
  }
LAB_1458ea582:
  func_0x000145d992bb();
                    /* WARNING: Does not return */
  pcVar1 = (code *)invalidInstructionException();
  (*pcVar1)();
}
