/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

float entry(undefined8 param_1,undefined8 param_2,char param_3,long param_4)

{
  long lVar1;
  char *pcVar2;
  ulong uVar3;
  int *piVar4;
  code *pcVar5;
  ulong uVar6;
  long lVar7;
  uint uVar8;
  uint uVar9;
  byte bVar10;
  long lVar11;
  long lVar12;
  float fVar13;
  long local_70;
  long local_68;
  long local_60;
  long local_58;
  uint local_4c;
  undefined8 local_48;

  local_48 = 0xfffffffffffffffe;
  func_0x0001459dc1e0(param_1,param_4,param_4 + 0xf0,&local_70);
  uVar3 = *(ulong *)(param_4 + 0x118);
  if (0x7ffffffffffffffc < uVar3 * 4 || uVar3 >> 0x3e != 0) {
LAB_1459b7122:
    func_0x000145da94eb();
                    /* WARNING: Does not return */
    pcVar5 = (code *)invalidInstructionException();
    (*pcVar5)();
  }
  if (uVar3 * 4 == 0) {
    local_58 = 4;
    uVar6 = 0;
  }
  else {
    func_0x000140002200();
    local_58 = func_0x0001400021c0();
    uVar6 = uVar3;
    if (local_58 == 0) goto LAB_1459b7122;
  }
  if (uVar3 != 0) {
    func_0x000145c0a3db();
  }
  if (local_60 == 0) {
    bVar10 = 0;
    uVar8 = 0;
  }
  else {
    lVar11 = 0;
    do {
      if ((*(long *)(local_68 + 0x10 + lVar11) == 7) &&
         (piVar4 = *(int **)(local_68 + 8 + lVar11),
         *(int *)((long)piVar4 + 3) == 0x6e617265 && *piVar4 == 0x65746576)) {
        local_4c = (uint)*(byte *)(local_68 + 0x18 + lVar11);
        goto LAB_1459b71ea;
      }
      lVar11 = lVar11 + 0x20;
    } while (local_60 << 5 != lVar11);
    local_4c = 0;
LAB_1459b71ea:
    lVar11 = local_68 + 8;
    lVar12 = local_60;
    do {
      if (*(long *)(lVar11 + -8) != 0) {
        func_0x0001400021d0();
      }
      lVar11 = lVar11 + 0x20;
      lVar12 = lVar12 + -1;
    } while (lVar12 != 0);
    bVar10 = (byte)local_4c;
    uVar8 = local_4c;
  }
  if (local_70 != 0) {
    bVar10 = (byte)uVar8;
    func_0x0001400021d0();
  }
  if (uVar6 != 0) {
    func_0x0001400021d0();
  }
  lVar11 = *(long *)(param_4 + 0x68);
  lVar7 = *(long *)(param_4 + 0x70) << 5;
  uVar8 = 0;
  lVar12 = 0;
  do {
    if (lVar7 == lVar12) goto LAB_1459b7289;
    lVar1 = lVar12 + 0x20;
    pcVar2 = (char *)(lVar11 + 4 + lVar12);
    lVar12 = lVar1;
  } while (*pcVar2 != '\x01');
  uVar8 = *(uint *)(lVar11 + -0x20 + lVar1);
LAB_1459b7289:
  lVar12 = 0;
  do {
    uVar9 = uVar8;
    if (lVar7 == lVar12) goto LAB_1459b72b3;
    lVar1 = lVar12 + 0x20;
    pcVar2 = (char *)(lVar11 + 4 + lVar12);
    lVar12 = lVar1;
  } while (*pcVar2 != '\x02');
  uVar9 = *(uint *)(lVar11 + -0x20 + lVar1);
  if (uVar9 < uVar8) {
    uVar9 = uVar8;
  }
LAB_1459b72b3:
  lVar12 = 0;
  do {
    uVar8 = uVar9;
    if (lVar7 == lVar12) goto LAB_1459b72e3;
    lVar1 = lVar12 + 0x20;
    pcVar2 = (char *)(lVar11 + 4 + lVar12);
    lVar12 = lVar1;
  } while (*pcVar2 != '\x03');
  uVar8 = *(uint *)(lVar11 + -0x20 + lVar1);
  if (uVar8 < uVar9) {
    uVar8 = uVar9;
  }
LAB_1459b72e3:
  lVar12 = 0;
  do {
    uVar9 = uVar8;
    if (lVar7 == lVar12) goto LAB_1459b7313;
    lVar1 = lVar12 + 0x20;
    pcVar2 = (char *)(lVar11 + 4 + lVar12);
    lVar12 = lVar1;
  } while (*pcVar2 != '\x04');
  uVar9 = *(uint *)(lVar11 + -0x20 + lVar1);
  if (uVar9 < uVar8) {
    uVar9 = uVar8;
  }
LAB_1459b7313:
  lVar12 = 0;
  do {
    uVar8 = uVar9;
    if (lVar7 == lVar12) goto LAB_1459b7343;
    lVar1 = lVar12 + 0x20;
    pcVar2 = (char *)(lVar11 + 4 + lVar12);
    lVar12 = lVar1;
  } while (*pcVar2 != '\x05');
  uVar8 = *(uint *)(lVar11 + -0x20 + lVar1);
  if (uVar8 < uVar9) {
    uVar8 = uVar9;
  }
LAB_1459b7343:
  lVar12 = 0;
  do {
    uVar9 = uVar8;
    if (lVar7 == lVar12) goto LAB_1459b7373;
    lVar1 = lVar12 + 0x20;
    pcVar2 = (char *)(lVar11 + 4 + lVar12);
    lVar12 = lVar1;
  } while (*pcVar2 != '\a');
  uVar9 = *(uint *)(lVar11 + -0x20 + lVar1);
  if (uVar9 < uVar8) {
    uVar9 = uVar8;
  }
LAB_1459b7373:
  lVar12 = 0;
  do {
    uVar8 = uVar9;
    if (lVar7 == lVar12) goto LAB_1459b73a3;
    lVar1 = lVar12 + 0x20;
    pcVar2 = (char *)(lVar11 + 4 + lVar12);
    lVar12 = lVar1;
  } while (*pcVar2 != '\b');
  uVar8 = *(uint *)(lVar11 + -0x20 + lVar1);
  if (uVar8 < uVar9) {
    uVar8 = uVar9;
  }
LAB_1459b73a3:
  lVar12 = 0;
  do {
    uVar9 = uVar8;
    if (lVar7 == lVar12) goto LAB_1459b73d3;
    lVar1 = lVar12 + 0x20;
    pcVar2 = (char *)(lVar11 + 4 + lVar12);
    lVar12 = lVar1;
  } while (*pcVar2 != '\t');
  uVar9 = *(uint *)(lVar11 + -0x20 + lVar1);
  if (uVar9 < uVar8) {
    uVar9 = uVar8;
  }
LAB_1459b73d3:
  lVar12 = 0;
  do {
    uVar8 = uVar9;
    if (lVar7 == lVar12) goto LAB_1459b7403;
    lVar1 = lVar12 + 0x20;
    pcVar2 = (char *)(lVar11 + 4 + lVar12);
    lVar12 = lVar1;
  } while (*pcVar2 != '\v');
  uVar8 = *(uint *)(lVar11 + -0x20 + lVar1);
  if (uVar8 < uVar9) {
    uVar8 = uVar9;
  }
LAB_1459b7403:
  fVar13 = 0.0;
  if (bVar10 != 0) {
    uVar9 = 0;
    lVar12 = 0;
    do {
      if (lVar7 == lVar12) goto LAB_1459b7438;
      lVar1 = lVar12 + 0x20;
      pcVar2 = (char *)(lVar11 + 4 + lVar12);
      lVar12 = lVar1;
    } while (*pcVar2 != param_3);
    uVar9 = *(uint *)(lVar11 + -0x20 + lVar1);
LAB_1459b7438:
    if (uVar9 < uVar8) {
      fVar13 = (float)bVar10 * _DAT_145db6b40;
    }
  }
  return fVar13;
}
