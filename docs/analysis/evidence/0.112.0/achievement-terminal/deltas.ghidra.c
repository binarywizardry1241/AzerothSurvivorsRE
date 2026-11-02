ulong * entry(undefined8 param_1,undefined8 param_2,long *param_3,ulong *param_4)

{
  ulong uVar1;
  long lVar2;
  long lVar3;
  long lVar4;
  long lVar5;
  code *pcVar6;
  ulong *puVar7;
  ulong uVar8;
  ulong uVar9;
  ulong uVar10;

  uVar9 = param_3[2];
  uVar1 = param_3[3];
  uVar10 = uVar1 - uVar9;
  if (uVar1 < uVar9) {
    uVar10 = 0;
  }
  if (0x7ffffffffffffff8 < uVar10 << 4 || uVar10 >> 0x3c != 0) {
LAB_1459da498:
    func_0x000145da94eb();
                    /* WARNING: Does not return */
    pcVar6 = (code *)invalidInstructionException();
    (*pcVar6)();
  }
  if (uVar10 << 4 == 0) {
    puVar7 = (ulong *)&DAT_00000008;
    uVar10 = 0;
  }
  else {
    func_0x000140002200();
    puVar7 = (ulong *)func_0x0001400021c0();
    if (puVar7 == (ulong *)0x0) goto LAB_1459da498;
  }
  if (uVar9 < uVar1) {
    if (uVar9 < 7) {
      lVar2 = *param_3;
      lVar3 = param_3[1];
      lVar4 = *(long *)(lVar2 + uVar9 * 8);
      lVar5 = *(long *)(lVar3 + uVar9 * 8);
      *puVar7 = uVar9;
      puVar7[1] = lVar4 - lVar5;
      uVar8 = 1;
      if (uVar9 + 1 == uVar1) goto LAB_1459da627;
      if (uVar9 != 6) {
        lVar4 = *(long *)(lVar2 + 8 + uVar9 * 8);
        lVar5 = *(long *)(lVar3 + 8 + uVar9 * 8);
        puVar7[2] = uVar9 + 1;
        puVar7[3] = lVar4 - lVar5;
        uVar8 = 2;
        if (uVar9 + 2 == uVar1) goto LAB_1459da627;
        if (uVar9 < 5) {
          lVar4 = *(long *)(lVar2 + 0x10 + uVar9 * 8);
          lVar5 = *(long *)(lVar3 + 0x10 + uVar9 * 8);
          puVar7[4] = uVar9 + 2;
          puVar7[5] = lVar4 - lVar5;
          uVar8 = 3;
          if (uVar9 + 3 == uVar1) goto LAB_1459da627;
          if (uVar9 != 4) {
            lVar4 = *(long *)(lVar2 + 0x18 + uVar9 * 8);
            lVar5 = *(long *)(lVar3 + 0x18 + uVar9 * 8);
            puVar7[6] = uVar9 + 3;
            puVar7[7] = lVar4 - lVar5;
            uVar8 = 4;
            if (uVar9 + 4 == uVar1) goto LAB_1459da627;
            if (uVar9 < 3) {
              lVar4 = *(long *)(lVar2 + 0x20 + uVar9 * 8);
              lVar5 = *(long *)(lVar3 + 0x20 + uVar9 * 8);
              puVar7[8] = uVar9 + 4;
              puVar7[9] = lVar4 - lVar5;
              uVar8 = 5;
              if (uVar9 + 5 == uVar1) goto LAB_1459da627;
              if (uVar9 != 2) {
                lVar4 = *(long *)(lVar2 + 0x28 + uVar9 * 8);
                lVar5 = *(long *)(lVar3 + 0x28 + uVar9 * 8);
                puVar7[10] = uVar9 + 5;
                puVar7[0xb] = lVar4 - lVar5;
                uVar8 = 6;
                if (uVar9 + 6 == uVar1) goto LAB_1459da627;
                if (uVar9 == 0) {
                  lVar2 = *(long *)(lVar2 + 0x30);
                  lVar3 = *(long *)(lVar3 + 0x30);
                  puVar7[0xc] = 6;
                  puVar7[0xd] = lVar2 - lVar3;
                  uVar8 = 7;
                  if (uVar1 == 7) goto LAB_1459da627;
                }
              }
            }
          }
        }
      }
    }
    func_0x000145da9883();
                    /* WARNING: Does not return */
    pcVar6 = (code *)invalidInstructionException();
    (*pcVar6)();
  }
  uVar8 = 0;
LAB_1459da627:
  *param_4 = uVar10;
  param_4[1] = (ulong)puVar7;
  param_4[2] = uVar8;
  return param_4;
}
