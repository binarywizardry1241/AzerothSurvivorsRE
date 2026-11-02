void entry(undefined8 param_1,undefined8 param_2,long param_3,long param_4)

{
  uint uVar1;
  int iVar2;
  int iVar3;
  int *piVar4;
  ulong uVar5;
  code *pcVar6;
  long lVar7;
  long extraout_RDX;
  long lVar8;
  int *piVar9;
  ulong uVar10;
  ulong uVar11;
  bool bVar12;
  long local_b8;

  piVar9 = *(int **)(param_4 + 8);
  piVar4 = *(int **)(param_4 + 0x18);
  uVar1 = *(uint *)(param_3 + 0x20);
  iVar2 = *(int *)(param_3 + 0x28);
  lVar8 = *(long *)(param_3 + 8);
  uVar5 = *(ulong *)(param_3 + 0x10);
LAB_1459ad7a0:
  do {
    do {
      if (piVar9 == piVar4) {
        if (*(long *)(param_4 + 0x10) != 0) {
          func_0x0001400021d0();
        }
        return;
      }
      iVar3 = *piVar9;
      piVar9 = piVar9 + 1;
      uVar10 = 0;
      uVar11 = (ulong)uVar1;
      do {
        bVar12 = uVar11 == 0;
        uVar11 = uVar11 - 1;
        if (bVar12) goto LAB_1459ad7a0;
        lVar7 = uVar10 + 0x14;
        if (uVar5 < uVar10 + 0x18) {
          func_0x000145d699f0();
          goto LAB_1459ad924;
        }
        uVar10 = (ulong)(uint)((int)uVar10 + iVar2);
      } while (*(int *)(lVar8 + lVar7) != iVar3);
      func_0x000145873b10();
    } while (extraout_RDX == 0);
    if (extraout_RDX < 0) {
LAB_1459ad8d1:
      func_0x000145d6944b();
LAB_1459ad924:
                    /* WARNING: Does not return */
      pcVar6 = (code *)invalidInstructionException();
      (*pcVar6)();
    }
    func_0x000140002200();
    lVar7 = func_0x0001400021c0();
    if (lVar7 == 0) goto LAB_1459ad8d1;
    func_0x000145bc977b();
    if (((extraout_RDX != -1) && (func_0x0001407cf030(), local_b8 != -1)) && (local_b8 != 0)) {
      func_0x0001400021d0();
    }
  } while( true );
}
