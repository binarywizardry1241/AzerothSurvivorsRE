undefined8 * FUN_1458ea670(void)

{
  code *pcVar1;
  long lVar2;
  undefined8 *in_RCX;
  long in_R8;
  char in_R9B;
  undefined8 local_80;
  undefined8 uStack_78;
  undefined8 local_70;

  if (in_R9B == '\0') {
    FUN_1458ec500(0x146bf17a4,in_RCX,0x12,0x146bf17a4);
    FUN_1458ec8b0();
    if (in_R8 < 0) {
LAB_1458ea7b8:
      func_0x000145d992bb();
      goto LAB_1458ea7cc;
    }
    if (in_R8 == 0) {
      lVar2 = 1;
    }
    else {
      func_0x000140002200();
      lVar2 = func_0x0001400021c0();
      if (lVar2 == 0) goto LAB_1458ea7b8;
      func_0x000145bfa0e7();
    }
    in_RCX[6] = 0x146bf17b6;
    in_RCX[7] = 4;
    goto LAB_1458ea870;
  }
  FUN_1458ec500(0x146bf17ba,in_RCX,0x10,0x146bf17ba);
  FUN_1458ec8b0();
  if (-1 < in_R8) {
    if (in_R8 == 0) {
      lVar2 = 1;
    }
    else {
      func_0x000140002200();
      lVar2 = func_0x0001400021c0();
      if (lVar2 == 0) goto LAB_1458ea725;
      func_0x000145bfa0e7();
    }
    in_RCX[6] = 0x146bf17ca;
    in_RCX[7] = 9;
LAB_1458ea870:
    *in_RCX = local_80;
    in_RCX[1] = uStack_78;
    in_RCX[2] = local_70;
    in_RCX[3] = in_R8;
    in_RCX[4] = lVar2;
    in_RCX[5] = in_R8;
    *(undefined1 *)(in_RCX + 8) = 1;
    return in_RCX;
  }
LAB_1458ea725:
  func_0x000145d992bb();
LAB_1458ea7cc:
                    /* WARNING: Does not return */
  pcVar1 = (code *)invalidInstructionException();
  (*pcVar1)();
}
