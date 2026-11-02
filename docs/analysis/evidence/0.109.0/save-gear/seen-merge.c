void entry(void)

{
  undefined4 *puVar1;
  ulong uVar2;
  long lVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  long lVar6;
  long lVar7;
  long lVar8;
  byte bVar9;
  int iVar10;
  byte bVar11;
  long in_RCX;
  long lVar12;
  long lVar13;
  ulong uVar14;
  long *plVar15;
  bool bVar16;

  uVar2 = *(ulong *)(in_RCX + 0x10);
  if (uVar2 < 2) {
    return;
  }
  lVar3 = *(long *)(in_RCX + 8);
  plVar15 = (long *)(lVar3 + 0x40);
  uVar14 = 2;
  while ((plVar15[-6] != plVar15[-2] || (iVar10 = func_0x000145bfa0e1(), iVar10 != 0))) {
    plVar15 = plVar15 + 4;
    bVar16 = uVar14 == uVar2;
    uVar14 = uVar14 + 1;
    if (bVar16) {
      return;
    }
  }
  bVar11 = (byte)(int)plVar15[-1];
  bVar9 = (byte)(int)plVar15[-5];
  if (bVar9 < bVar11) {
    bVar9 = bVar11;
  }
  *(byte *)(plVar15 + -5) = bVar9;
  if (plVar15[-4] != 0) {
    func_0x0001400021d0();
  }
  lVar13 = uVar14 - 1;
  if (uVar14 < uVar2) {
    lVar12 = uVar2 - uVar14;
    do {
      puVar1 = (undefined4 *)(lVar3 + lVar13 * 0x20);
      if ((*(long *)(lVar3 + -0x10 + lVar13 * 0x20) == plVar15[2]) &&
         (iVar10 = func_0x000145bfa0e1(), iVar10 == 0)) {
        bVar11 = (byte)(int)plVar15[3];
        bVar9 = (byte)puVar1[-2];
        if ((byte)puVar1[-2] < bVar11) {
          bVar9 = bVar11;
        }
        *(byte *)(puVar1 + -2) = bVar9;
        if (*plVar15 != 0) {
          func_0x0001400021d0();
        }
      }
      else {
        lVar7 = *plVar15;
        uVar4 = *(undefined4 *)((long)plVar15 + 4);
        lVar8 = plVar15[1];
        uVar5 = *(undefined4 *)((long)plVar15 + 0xc);
        lVar6 = plVar15[3];
        *(long *)(puVar1 + 4) = plVar15[2];
        *(long *)(puVar1 + 6) = lVar6;
        *puVar1 = (int)lVar7;
        puVar1[1] = uVar4;
        puVar1[2] = (int)lVar8;
        puVar1[3] = uVar5;
        lVar13 = lVar13 + 1;
      }
      plVar15 = plVar15 + 4;
      lVar12 = lVar12 + -1;
    } while (lVar12 != 0);
  }
  *(long *)(in_RCX + 0x10) = lVar13;
  return;
}
