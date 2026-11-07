int FUN_14590fcc0(void)

{
  ulong uVar1;
  int iVar2;
  long in_RCX;
  ulong uVar3;
  ulong uVar4;
  byte *pbVar5;

  uVar1 = *(ulong *)(in_RCX + 0x10);
  if (uVar1 == 0) {
    return 0;
  }
  if (uVar1 < 4) {
    uVar3 = 0;
    iVar2 = 0;
  }
  else {
    pbVar5 = (byte *)(*(long *)(in_RCX + 8) + 0x38);
    uVar3 = 0;
    iVar2 = 0;
    do {
      iVar2 = (uint)*pbVar5 +
              (uint)pbVar5[-0x10] + (uint)pbVar5[-0x20] + (uint)pbVar5[-0x30] + iVar2;
      uVar3 = uVar3 + 4;
      pbVar5 = pbVar5 + 0x40;
    } while ((uVar1 & 0xfffffffffffffffc) != uVar3);
    if ((uVar1 & 3) == 0) {
      return iVar2;
    }
  }
  uVar4 = 0;
  do {
    iVar2 = iVar2 + (uint)*(byte *)(*(long *)(in_RCX + 8) + uVar3 * 0x10 + 8 + uVar4);
    uVar4 = uVar4 + 0x10;
  } while (((uint)uVar1 & 3) << 4 != uVar4);
  return iVar2;
}
