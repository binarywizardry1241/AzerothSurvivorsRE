void entry(void)

{
  undefined4 *puVar1;
  long *plVar2;
  long *plVar3;
  ulong uVar4;
  long lVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  long lVar8;
  long lVar9;
  char cVar10;
  long in_RCX;
  long lVar11;
  long lVar12;
  long lVar13;
  long local_50;

  uVar4 = *(ulong *)(in_RCX + 0x10);
  if (uVar4 != 0) {
    lVar5 = *(long *)(in_RCX + 8);
    lVar12 = -uVar4;
    lVar13 = 0x20;
    lVar11 = 0;
    do {
      cVar10 = func_0x000145ca6250();
      if (cVar10 == '\0') {
        if (*(long *)(lVar5 + -0x20 + lVar13) != 0) {
          func_0x0001400021d0();
        }
        local_50 = -lVar11;
        if (1U - lVar11 < uVar4) {
          lVar11 = (1 - uVar4) - lVar11;
          do {
            plVar2 = (long *)(lVar5 + lVar13);
            cVar10 = func_0x000145ca6250();
            if (cVar10 == '\0') {
              if (*plVar2 != 0) {
                func_0x0001400021d0();
              }
            }
            else {
              lVar8 = *plVar2;
              uVar6 = *(undefined4 *)((long)plVar2 + 4);
              lVar9 = plVar2[1];
              uVar7 = *(undefined4 *)((long)plVar2 + 0xc);
              lVar12 = plVar2[3];
              plVar3 = (long *)(lVar5 + 0x10 + local_50 * 0x20);
              *plVar3 = plVar2[2];
              plVar3[1] = lVar12;
              puVar1 = (undefined4 *)(lVar5 + local_50 * 0x20);
              *puVar1 = (int)lVar8;
              puVar1[1] = uVar6;
              puVar1[2] = (int)lVar9;
              puVar1[3] = uVar7;
              local_50 = local_50 + 1;
            }
            lVar13 = lVar13 + 0x20;
            lVar11 = lVar11 + 1;
          } while (lVar11 != 0);
        }
        *(long *)(in_RCX + 0x10) = local_50;
        return;
      }
      lVar13 = lVar13 + 0x20;
      lVar11 = lVar11 + -1;
    } while (lVar12 != lVar11);
  }
  return;
}
