
long * entry(undefined8 param_1,undefined8 param_2,long param_3,long *param_4)

{
  code *pcVar1;
  long lVar2;
  long lVar3;
  ulong uVar4;

  uVar4 = *(long *)(param_3 + 0x18) - *(long *)(param_3 + 8);
  if (uVar4 < 0x1ffffffffffffff9) {
    if ((uVar4 & 0x3fffffffffffffff) == 0) {
      lVar2 = 8;
      lVar3 = 0;
    }
    else {
      func_0x000140002200();
      lVar2 = func_0x0001400021c0();
      if (lVar2 == 0) goto LAB_145545686;
      lVar3 = (uVar4 >> 3) * -0x5555555555555555;
    }
    func_0x000145559c90();
    param_4[2] = 0;
    *param_4 = lVar3;
    param_4[1] = lVar2;
    return param_4;
  }
LAB_145545686:
  func_0x00014590379b();
                    /* WARNING: Does not return */
  pcVar1 = (code *)invalidInstructionException();
  (*pcVar1)();
}
