
ulong * entry(undefined8 param_1,undefined8 param_2,long *param_3,ulong *param_4)

{
  ulong uVar1;
  ulong uVar2;
  long lVar3;
  ulong uVar4;
  code *pcVar5;
  ulong uVar6;
  ulong uVar7;
  ulong uVar8;
  ulong uVar9;
  
  uVar1 = param_3[1];
  uVar2 = param_3[2];
  uVar9 = uVar2 - uVar1;
  if (uVar2 < uVar1) {
    uVar9 = 0;
  }
  if (0x7ffffffffffffff8 < uVar9 * 8 || uVar9 >> 0x3d != 0) {
LAB_1455375b9:
    func_0x0001458e721b();
                    /* WARNING: Does not return */
    pcVar5 = (code *)invalidInstructionException();
    (*pcVar5)();
  }
  if (uVar9 * 8 == 0) {
    uVar6 = 8;
    uVar9 = 0;
  }
  else {
    func_0x000140002200();
    uVar6 = func_0x0001400021c0(8);
    if (uVar6 == 0) goto LAB_1455375b9;
  }
  if (uVar1 < uVar2) {
    lVar3 = *param_3;
    uVar8 = 0;
    do {
      uVar4 = *(ulong *)(lVar3 + 0x10);
      if (uVar4 == 0) {
        func_0x0001458e78b0();
                    /* WARNING: Does not return */
        pcVar5 = (code *)invalidInstructionException();
        (*pcVar5)();
      }
      uVar7 = uVar1 + uVar8;
      if ((uVar7 | uVar4) >> 0x20 == 0) {
        uVar7 = (uVar7 & 0xffffffff) % (uVar4 & 0xffffffff);
      }
      else {
        uVar7 = uVar7 % uVar4;
      }
      *(undefined8 *)(uVar6 + uVar8 * 8) = *(undefined8 *)(*(long *)(lVar3 + 8) + uVar7 * 8);
      uVar8 = uVar8 + 1;
    } while ((uVar1 - uVar2) + uVar8 != 0);
  }
  else {
    uVar8 = 0;
  }
  *param_4 = uVar9;
  param_4[1] = uVar6;
  param_4[2] = uVar8;
  return param_4;
}

