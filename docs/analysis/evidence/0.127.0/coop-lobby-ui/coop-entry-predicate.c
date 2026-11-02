
undefined8 entry(void)

{
  long lVar1;
  int *piVar2;
  long in_RCX;
  
  if ((*(long *)(in_RCX + 0x50) == 4) && (**(int **)(in_RCX + 0x48) == 0x74736f68)) {
    piVar2 = *(int **)(in_RCX + 0x18);
    lVar1 = *(long *)(in_RCX + 0x20);
    if (lVar1 == 4) {
      if (*piVar2 == 0x7466656c) goto LAB_1402af14c;
    }
    else if (lVar1 == 6) {
      if ((short)piVar2[1] == 0x6465 && *piVar2 == 0x6e696f6a) {
        piVar2 = (int *)0x0;
        goto LAB_1402af14c;
      }
    }
    else if ((lVar1 == 7) &&
            ((*(int *)((long)piVar2 + 3) == 0x676e6974 && *piVar2 == 0x74736f68 ||
             (*(int *)((long)piVar2 + 3) == 0x676e696e && *piVar2 == 0x6e696f6a)))) {
LAB_1402af14c:
      return CONCAT71((int7)((ulong)piVar2 >> 8),*(ulong *)(in_RCX + 0x98) < 2);
    }
  }
  return 0;
}

