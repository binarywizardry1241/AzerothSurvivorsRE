
undefined8 entry(void)

{
  code *pcVar1;
  int iVar2;
  long in_RCX;
  long lVar3;
  ulong uVar4;
  ulong uVar5;
  long *plVar6;
  long in_R8;
  long lVar7;
  long lVar8;
  ulong uVar9;
  long lVar10;
  long local_58;

  lVar7 = *(long *)(in_RCX + 0xb0);
  uVar5 = *(ulong *)(in_RCX + 0xb8);
  uVar9 = 0;
  if (uVar5 != 0) {
    if (uVar5 == 1) {
      lVar3 = 0;
    }
    else {
      lVar8 = 0;
      uVar9 = uVar5;
      do {
        uVar4 = uVar9 >> 1;
        lVar3 = lVar8 + uVar4;
        lVar10 = *(long *)(lVar7 + 0x10 + lVar3 * 0x18) - in_R8;
        iVar2 = func_0x000145c0a3e7();
        if (iVar2 != 0) {
          lVar10 = (long)iVar2;
        }
        if (0 < lVar10) {
          lVar3 = lVar8;
        }
        uVar9 = uVar9 - uVar4;
        lVar8 = lVar3;
      } while (1 < uVar9);
    }
    lVar8 = *(long *)(lVar7 + 0x10 + lVar3 * 0x18) - in_R8;
    iVar2 = func_0x000145c0a3e7();
    if (iVar2 != 0) {
      lVar8 = (long)iVar2;
    }
    if (lVar8 == 0) {
      return 0;
    }
    uVar9 = lVar3 - (lVar8 >> 0x3f);
  }
  if (in_R8 < 0) {
LAB_1458d9f5e:
    func_0x000145da94eb();
                    /* WARNING: Does not return */
    pcVar1 = (code *)invalidInstructionException();
    (*pcVar1)();
  }
  if (in_R8 == 0) {
    local_58 = 1;
    if (uVar5 != *(ulong *)(in_RCX + 0xa8)) goto LAB_1458d9fd7;
  }
  else {
    func_0x000140002200();
    local_58 = func_0x0001400021c0();
    if (local_58 == 0) goto LAB_1458d9f5e;
    func_0x000145c0a3db();
    if (uVar5 != *(ulong *)(in_RCX + 0xa8)) goto LAB_1458d9fd7;
  }
  func_0x000145c0d9a0();
  lVar7 = *(long *)(in_RCX + 0xb0);
LAB_1458d9fd7:
  plVar6 = (long *)(lVar7 + uVar9 * 0x18);
  if (uVar9 < uVar5) {
    func_0x000145c0a3ed();
  }
  *plVar6 = in_R8;
  plVar6[1] = local_58;
  plVar6[2] = in_R8;
  *(ulong *)(in_RCX + 0xb8) = uVar5 + 1;
  return 1;
}
