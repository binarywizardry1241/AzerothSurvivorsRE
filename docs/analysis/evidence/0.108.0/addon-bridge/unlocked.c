undefined8 * FUN_1458e4170(void)

{
  code *pcVar1;
  long lVar2;
  undefined8 *in_RCX;
  long in_R8;
  undefined8 local_80;
  undefined8 uStack_78;
  undefined8 local_70;

  func_0x0001458e5790(0x146beb08a,in_RCX,0x13,0x146beb08a);
  func_0x0001458e5b40();
  if (-1 < in_R8) {
    if (in_R8 == 0) {
      lVar2 = 1;
    }
    else {
      func_0x000140002200();
      lVar2 = func_0x0001400021c0();
      if (lVar2 == 0) goto LAB_1458e4218;
      func_0x000145bf293b();
    }
    in_RCX[6] = 0x146beb0a1;
    in_RCX[7] = 8;
    *in_RCX = local_80;
    in_RCX[1] = uStack_78;
    in_RCX[2] = local_70;
    in_RCX[3] = in_R8;
    in_RCX[4] = lVar2;
    in_RCX[5] = in_R8;
    *(undefined1 *)(in_RCX + 8) = 0;
    return in_RCX;
  }
LAB_1458e4218:
  func_0x000145d934fb();
                    /* WARNING: Does not return */
  pcVar1 = (code *)invalidInstructionException();
  (*pcVar1)();
}
