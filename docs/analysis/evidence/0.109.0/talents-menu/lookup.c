undefined1  [16] FUN_145912d90(void)

{
  int iVar1;
  char in_CL;
  byte bVar2;
  long lVar3;
  long in_R8;
  long lVar4;
  undefined8 unaff_R14;
  long lVar5;
  undefined1 auVar6 [16];

  bVar2 = in_CL - 1;
  if ((bVar2 < 0xb) && ((0x5dfU >> (bVar2 & 0x1f) & 1) != 0)) {
    lVar5 = *(long *)((ulong)bVar2 * 8 + 0x1472293d8);
    if (*(long *)(lVar5 + 0x38) != 0) {
      lVar3 = *(long *)(lVar5 + 0x30);
      lVar4 = *(long *)(lVar5 + 0x38) * 0x78;
      unaff_R14 = 0;
      do {
        if ((*(long *)(lVar3 + 0x28) == in_R8) && (iVar1 = func_0x000145bfa0e1(), iVar1 == 0))
        goto LAB_145912e9d;
        lVar3 = lVar3 + 0x78;
        lVar4 = lVar4 + -0x78;
      } while (lVar4 != 0);
    }
    if (*(long *)(lVar5 + 0x78) != 0) {
      lVar3 = *(long *)(lVar5 + 0x70);
      lVar4 = *(long *)(lVar5 + 0x78) * 0x78;
      do {
        if ((*(long *)(lVar3 + 0x28) == in_R8) && (iVar1 = func_0x000145bfa0e1(), iVar1 == 0)) {
          unaff_R14 = 1;
          goto LAB_145912e9d;
        }
        lVar3 = lVar3 + 0x78;
        lVar4 = lVar4 + -0x78;
        unaff_R14 = 0;
      } while (lVar4 != 0);
    }
    if (*(long *)(lVar5 + 0xb8) != 0) {
      lVar3 = *(long *)(lVar5 + 0xb0);
      lVar5 = *(long *)(lVar5 + 0xb8) * 0x78;
      do {
        if ((*(long *)(lVar3 + 0x28) == in_R8) && (iVar1 = func_0x000145bfa0e1(), iVar1 == 0)) {
          unaff_R14 = 2;
          goto LAB_145912e9d;
        }
        lVar3 = lVar3 + 0x78;
        lVar5 = lVar5 + -0x78;
      } while (lVar5 != 0);
      unaff_R14 = 2;
      lVar3 = 0;
      goto LAB_145912e9d;
    }
  }
  lVar3 = 0;
LAB_145912e9d:
  auVar6._8_8_ = lVar3;
  auVar6._0_8_ = unaff_R14;
  return auVar6;
}
