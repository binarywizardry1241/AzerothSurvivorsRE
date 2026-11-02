
void entry(undefined8 param_1,undefined8 param_2,undefined4 *param_3,long param_4)

{
  undefined4 *puVar1;
  long lVar2;
  code *pcVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  undefined4 uVar8;
  undefined4 uVar9;
  undefined4 uVar10;
  undefined4 uVar11;
  undefined4 uVar12;
  undefined4 uVar13;
  undefined4 uVar14;
  undefined4 uVar15;
  undefined4 uVar16;
  undefined4 uVar17;
  undefined4 uVar18;
  long lVar19;
  long lVar20;
  
  if (((*(char *)(param_3 + 0xe) == '\0') && (*(char *)((long)param_3 + 0x39) == '\0')) &&
     (*(char *)(param_4 + 0x1b4) == '\0')) {
    *(long *)(param_4 + 0x1a0) = *(long *)(param_4 + 0x1a0) + 1;
  }
  lVar19 = *(long *)(param_4 + 0x158);
  if (lVar19 == *(long *)(param_4 + 0x148)) {
    func_0x000146061d20();
  }
  lVar2 = *(long *)(param_4 + 0x150);
  lVar20 = lVar19 * 0x40;
  uVar4 = *param_3;
  uVar5 = param_3[1];
  uVar6 = param_3[2];
  uVar7 = param_3[3];
  uVar8 = param_3[4];
  uVar9 = param_3[5];
  uVar10 = param_3[6];
  uVar11 = param_3[7];
  uVar12 = param_3[8];
  uVar13 = param_3[9];
  uVar14 = param_3[10];
  uVar15 = param_3[0xb];
  uVar16 = param_3[0xd];
  uVar17 = param_3[0xe];
  uVar18 = param_3[0xf];
  puVar1 = (undefined4 *)(lVar2 + 0x30 + lVar20);
  *puVar1 = param_3[0xc];
  puVar1[1] = uVar16;
  puVar1[2] = uVar17;
  puVar1[3] = uVar18;
  puVar1 = (undefined4 *)(lVar2 + 0x20 + lVar20);
  *puVar1 = uVar12;
  puVar1[1] = uVar13;
  puVar1[2] = uVar14;
  puVar1[3] = uVar15;
  puVar1 = (undefined4 *)(lVar2 + 0x10 + lVar20);
  *puVar1 = uVar8;
  puVar1[1] = uVar9;
  puVar1[2] = uVar10;
  puVar1[3] = uVar11;
  puVar1 = (undefined4 *)(lVar2 + lVar20);
  *puVar1 = uVar4;
  puVar1[1] = uVar5;
  puVar1[2] = uVar6;
  puVar1[3] = uVar7;
  *(long *)(param_4 + 0x158) = lVar19 + 1;
  if (0x4f < lVar19) {
    lVar2 = **(long **)(param_4 + 0x150);
    lVar20 = (*(long **)(param_4 + 0x150))[3];
    func_0x000146061727();
    *(long *)(param_4 + 0x158) = lVar19;
    if (lVar2 != 0) {
      if (lVar2 == -1) {
        func_0x000146208a3b();
                    /* WARNING: Does not return */
        pcVar3 = (code *)invalidInstructionException();
        (*pcVar3)();
      }
      func_0x0001400021d0();
    }
    if (lVar20 != 0) {
      func_0x0001400021d0();
    }
  }
  *(long *)(param_4 + 400) = *(long *)(param_4 + 400) + 1;
  return;
}

