bool FUN_14590f1f0(void)

{
  byte *pbVar1;
  long in_RCX;
  long lVar2;

  lVar2 = 0;
  do {
    if (*(long *)(in_RCX + 0x58) << 6 == lVar2) {
      return false;
    }
    pbVar1 = (byte *)(*(long *)(in_RCX + 0x50) + lVar2);
    lVar2 = lVar2 + 0x40;
  } while (0x22 < *pbVar1);
  if ((*(char *)(in_RCX + 0x72) != '\x01') && (*(char *)(in_RCX + 0x73) == '\0')) {
    return false;
  }
  return *(byte *)(in_RCX + 0x70) != 0 && (*(byte *)(in_RCX + 0x70) & 1) == 0;
}
