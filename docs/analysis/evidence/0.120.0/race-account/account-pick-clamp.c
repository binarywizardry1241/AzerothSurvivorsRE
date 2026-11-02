undefined8 *
entry(undefined8 param_1,undefined8 param_2,long param_3,undefined8 *param_4,undefined8 *param_5)

{
  long lVar1;
  char *pcVar2;
  char cVar3;
  undefined8 uVar4;
  undefined8 uVar5;
  undefined8 uVar6;
  code *pcVar7;
  undefined8 uVar8;
  undefined8 uVar9;
  undefined8 uVar10;
  char cVar11;
  undefined8 uVar12;
  ulong uVar13;
  long lVar14;
  long lVar16;
  long lVar17;
  undefined8 unaff_RBX;
  char cVar18;
  ulong uVar19;
  long lVar20;
  ulong uVar21;
  ulong uVar15;

  cVar3 = *(char *)(param_5 + 7);
  cVar18 = *(char *)((long)param_5 + 0x39);
  cVar11 = func_0x000145a8bf80(cVar18,param_4,
                               CONCAT71((int7)((ulong)unaff_RBX >> 8),cVar3) & 0xffffffff,param_3);
  if (cVar11 != cVar18) {
    *(char *)((long)param_5 + 0x39) = cVar11;
    uVar12 = func_0x000145a7fa60();
    *(int *)((long)param_5 + 0x3b) = (int)uVar12;
    *(char *)((long)param_5 + 0x3f) = (char)((ulong)uVar12 >> 0x20);
  }
  uVar13 = func_0x000145a82ca0();
  lVar16 = *(long *)(param_3 + 0x20);
  lVar17 = *(long *)(param_3 + 0x28) << 4;
  lVar20 = 0;
  do {
    if (lVar17 == lVar20) {
      if (uVar13 == 0) goto LAB_145a8b64b;
      goto LAB_145a8b5ab;
    }
    lVar14 = lVar20 + 0x10;
    pcVar2 = (char *)(lVar16 + lVar20);
    lVar20 = lVar14;
  } while (*pcVar2 != cVar3);
  uVar15 = *(ulong *)(lVar16 + -8 + lVar14);
  uVar21 = 0xc;
  if (uVar15 < 0xc) {
    uVar21 = uVar15;
  }
  uVar19 = 1;
  if (uVar15 != 0) {
    uVar19 = uVar21;
  }
  if (uVar19 <= uVar13) {
LAB_145a8b5ab:
    lVar14 = 0;
    lVar20 = 0;
    do {
      if (lVar17 == lVar20) goto LAB_145a8b5e0;
      lVar1 = lVar20 + 0x10;
      pcVar2 = (char *)(lVar16 + lVar20);
      lVar20 = lVar1;
    } while (*pcVar2 != cVar3);
    uVar13 = *(ulong *)(lVar16 + -8 + lVar1);
    if (uVar13 == 0) {
      lVar14 = 0;
    }
    else {
      uVar15 = 0xc;
      if (uVar13 < 0xc) {
        uVar15 = uVar13;
      }
      lVar14 = uVar15 - 1;
    }
LAB_145a8b5e0:
    uVar12 = *(undefined8 *)(lVar14 * 0xf0 + 0x146f78db8);
    func_0x000140002200();
    lVar16 = func_0x0001400021c0();
    if (lVar16 == 0) {
      func_0x00014614ad6b();
                    /* WARNING: Does not return */
      pcVar7 = (code *)invalidInstructionException();
      (*pcVar7)();
    }
    func_0x000145fa3aab();
    if (param_5[3] != 0) {
      func_0x0001400021d0();
    }
    param_5[3] = uVar12;
    param_5[4] = lVar16;
    param_5[5] = uVar12;
  }
LAB_145a8b64b:
  uVar8 = *param_5;
  uVar9 = param_5[1];
  uVar12 = param_5[2];
  uVar4 = param_5[3];
  uVar5 = param_5[4];
  uVar6 = param_5[5];
  uVar10 = param_5[7];
  param_4[6] = param_5[6];
  param_4[7] = uVar10;
  param_4[4] = uVar5;
  param_4[5] = uVar6;
  param_4[2] = uVar12;
  param_4[3] = uVar4;
  *param_4 = uVar8;
  param_4[1] = uVar9;
  return param_4;
}
