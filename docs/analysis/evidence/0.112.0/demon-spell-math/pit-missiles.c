
ulong * entry(undefined8 param_1,undefined8 param_2,long *param_3,ulong *param_4)

{
  ulong uVar1;
  undefined4 uVar2;
  ulong uVar3;
  ulong uVar4;
  long lVar5;
  code *pcVar6;
  ulong uVar7;
  ulong uVar8;
  undefined4 *puVar9;
  ulong uVar10;
  ulong uVar11;

  uVar3 = param_3[1];
  uVar4 = param_3[2];
  uVar11 = uVar4 - uVar3;
  if (uVar4 < uVar3) {
    uVar11 = 0;
  }
  if (0x7ffffffffffffff8 < uVar11 << 4 || uVar11 >> 0x3c != 0) {
LAB_1459da718:
    func_0x000145da94eb();
                    /* WARNING: Does not return */
    pcVar6 = (code *)invalidInstructionException();
    (*pcVar6)();
  }
  if (uVar11 << 4 == 0) {
    uVar7 = 8;
    uVar11 = 0;
  }
  else {
    func_0x000140002200();
    uVar7 = func_0x0001400021c0(8);
    if (uVar7 == 0) goto LAB_1459da718;
  }
  if (uVar3 < uVar4) {
    lVar5 = *param_3;
    puVar9 = (undefined4 *)(uVar7 + 8);
    uVar10 = 0;
    do {
      uVar8 = *(ulong *)(lVar5 + 0x10);
      if (uVar8 == 0) {
        func_0x000145da9b80();
                    /* WARNING: Does not return */
        pcVar6 = (code *)invalidInstructionException();
        (*pcVar6)();
      }
      uVar1 = uVar3 + uVar10;
      if ((uVar1 | uVar8) >> 0x20 == 0) {
        uVar8 = (uVar1 & 0xffffffff) % (uVar8 & 0xffffffff);
      }
      else {
        uVar8 = uVar1 % uVar8;
      }
      uVar2 = *(undefined4 *)((ulong)(uVar1 == 0) * 4 + 0x147244690);
      *(undefined8 *)(puVar9 + -2) = *(undefined8 *)(*(long *)(lVar5 + 8) + uVar8 * 8);
      *puVar9 = uVar2;
      uVar10 = uVar10 + 1;
      puVar9 = puVar9 + 4;
    } while ((uVar3 - uVar4) + uVar10 != 0);
  }
  else {
    uVar10 = 0;
  }
  *param_4 = uVar11;
  param_4[1] = uVar7;
  param_4[2] = uVar10;
  return param_4;
}
