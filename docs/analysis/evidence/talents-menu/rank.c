undefined1 FUN_14590fa20(void)

{
  long lVar1;
  long lVar2;
  int iVar3;
  long in_RCX;
  long in_R8;
  long lVar4;

  lVar1 = *(long *)(in_RCX + 0x10);
  if (lVar1 != 0) {
    lVar2 = *(long *)(in_RCX + 8);
    lVar4 = 0;
    do {
      if ((*(long *)(*(long *)(lVar2 + lVar4) + 0x28) == in_R8) &&
         (iVar3 = func_0x000145bfa0e1(), iVar3 == 0)) {
        return *(undefined1 *)(lVar2 + 8 + lVar4);
      }
      lVar4 = lVar4 + 0x10;
    } while (lVar1 << 4 != lVar4);
  }
  return 0;
}
