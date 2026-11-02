ulong * entry(undefined8 param_1,undefined8 param_2,long *param_3,ulong *param_4)

{
  code *pcVar1;
  ulong uVar2;
  ulong uVar3;

  uVar3 = param_3[1] - *param_3;
  if (uVar3 < 0x7878787878787801) {
    if ((uVar3 >> 4) + uVar3 == 0) {
      uVar2 = 8;
      uVar3 = 0;
    }
    else {
      func_0x000140002200();
      uVar2 = func_0x0001400021c0();
      if (uVar2 == 0) goto LAB_140b3c121;
      uVar3 = uVar3 >> 7;
    }
    func_0x000140fbb670();
    param_4[2] = 0;
    *param_4 = uVar3;
    param_4[1] = uVar2;
    return param_4;
  }
LAB_140b3c121:
  func_0x000145d992bb();
                    /* WARNING: Does not return */
  pcVar1 = (code *)invalidInstructionException();
  (*pcVar1)();
}
