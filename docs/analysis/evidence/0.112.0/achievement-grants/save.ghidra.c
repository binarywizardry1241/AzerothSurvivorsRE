
uint entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,long param_4,ulong param_5,
          byte param_6)

{
  code *pcVar1;
  uint uVar2;
  int iVar3;
  long lVar4;
  ulong uVar5;
  long lVar6;
  ulong uVar7;
  ulong uVar8;
  long lVar9;
  long lVar10;
  ulong *puVar11;
  long lVar12;
  ulong uVar13;
  ulong in_stack_00000028;
  ulong local_58;

  uVar2 = func_0x0001458d9e60();
  if (((byte)uVar2 & param_6) != 0) {
    uVar7 = *(ulong *)(param_4 + 0xd0);
    uVar13 = 0;
    if (uVar7 != 0) {
      lVar12 = *(long *)(param_4 + 200);
      if (uVar7 == 1) {
        lVar10 = 0;
      }
      else {
        lVar9 = 0;
        uVar13 = uVar7;
        do {
          uVar5 = uVar13 >> 1;
          lVar10 = lVar9 + uVar5;
          lVar4 = lVar10 * 0x20;
          uVar8 = *(ulong *)(lVar12 + 0x10 + lVar4);
          lVar6 = uVar8 - param_5;
          if (param_5 <= uVar8) {
            uVar8 = param_5;
          }
          iVar3 = func_0x000145c0a3e7(lVar6,uVar5,param_3,*(undefined8 *)(lVar12 + 8 + lVar4),uVar8)
          ;
          if (iVar3 != 0) {
            lVar6 = (long)iVar3;
          }
          if (0 < lVar6) {
            lVar10 = lVar9;
          }
          uVar13 = uVar13 - uVar5;
          lVar9 = lVar10;
        } while (1 < uVar13);
      }
      lVar12 = *(long *)(lVar12 + 0x10 + lVar10 * 0x20);
      iVar3 = func_0x000145c0a3e7();
      lVar12 = lVar12 - param_5;
      if (iVar3 != 0) {
        lVar12 = (long)iVar3;
      }
      uVar2 = uVar2 & 0xff;
      if (lVar12 == 0) {
        return uVar2;
      }
      uVar13 = lVar10 - (lVar12 >> 0x3f);
    }
    if ((long)param_5 < 0) {
LAB_1458d2028:
      func_0x000145da94eb();
                    /* WARNING: Does not return */
      pcVar1 = (code *)invalidInstructionException();
      (*pcVar1)();
    }
    if (param_5 == 0) {
      local_58 = 1;
    }
    else {
      func_0x000140002200();
      local_58 = func_0x0001400021c0(1);
      if (local_58 == 0) goto LAB_1458d2028;
      func_0x000145c0a3db();
      uVar7 = *(ulong *)(param_4 + 0xd0);
    }
    if (uVar7 < uVar13) {
      func_0x000145da9534();
                    /* WARNING: Does not return */
      pcVar1 = (code *)invalidInstructionException();
      (*pcVar1)();
    }
    if (uVar7 == *(ulong *)(param_4 + 0xc0)) {
      func_0x000145c0dbd0();
    }
    puVar11 = (ulong *)(uVar13 * 0x20 + *(long *)(param_4 + 200));
    if (uVar13 < uVar7) {
      func_0x000145c0a3ed();
    }
    *puVar11 = param_5;
    puVar11[1] = local_58;
    puVar11[2] = param_5;
    puVar11[3] = in_stack_00000028;
    *(ulong *)(param_4 + 0xd0) = uVar7 + 1;
  }
  return uVar2;
}
