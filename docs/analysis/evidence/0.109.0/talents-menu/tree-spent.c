void FUN_145910430(undefined8 param_1,undefined8 param_2,char param_3,long param_4,ulong param_5,
                  byte param_6)

{
  long lVar1;
  long lVar2;
  code *pcVar3;
  int iVar4;
  byte bVar5;
  long lVar6;
  long lVar7;
  long lVar8;
  long lVar9;
  long lVar10;
  long *plVar11;

  bVar5 = param_3 - 1;
  if (((bVar5 < 0xb) && ((0x5dfU >> (bVar5 & 0x1f) & 1) != 0)) &&
     (lVar6 = *(long *)(param_4 + 0x10), lVar6 != 0)) {
    plVar11 = *(long **)(param_4 + 8);
    if (param_5 < 3) {
      lVar9 = param_5 * 0x40 + *(long *)((ulong)bVar5 * 8 + 0x1472293d8);
      lVar7 = 0;
      do {
        if ((*(byte *)(plVar11[lVar7 * 2] + 0x70) < param_6) &&
           (lVar1 = *(long *)(lVar9 + 0x38), lVar1 != 0)) {
          lVar8 = *(long *)(lVar9 + 0x30);
          lVar2 = *(long *)(plVar11[lVar7 * 2] + 0x28);
          lVar10 = 0;
          do {
            if ((*(long *)(lVar8 + 0x28 + lVar10) == lVar2) &&
               (iVar4 = func_0x000145bfa0e1(), iVar4 == 0)) break;
            lVar10 = lVar10 + 0x78;
          } while (lVar1 * 0x78 - lVar10 != 0);
        }
        lVar7 = lVar7 + 1;
      } while (lVar7 != lVar6);
    }
    else {
      do {
        if (*(byte *)(*plVar11 + 0x70) < param_6) {
          func_0x000145d99653(param_1,param_2,3,param_5,0x14720b9e8);
                    /* WARNING: Does not return */
          pcVar3 = (code *)invalidInstructionException();
          (*pcVar3)();
        }
        plVar11 = plVar11 + 2;
        lVar6 = lVar6 + -1;
      } while (lVar6 != 0);
    }
  }
  return;
}
