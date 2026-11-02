
long entry(void)

{
  long lVar1;
  ulong uVar2;
  ulong uVar3;
  ulong uVar4;
  long in_RCX;
  ulong uVar5;
  ulong uVar6;
  long lVar7;
  ulong uVar8;
  ulong *puVar9;

  lVar7 = *(long *)(in_RCX + 0x10);
  if (lVar7 == 0) {
    return 1;
  }
  lVar1 = *(long *)(in_RCX + 8);
  uVar4 = *(ulong *)(lVar1 + 0x18);
  if (lVar7 != 1) {
    uVar6 = (lVar7 * 0x38 - 0x38U >> 3) * 0x6db6db6db6db6db7;
    uVar5 = (ulong)((uint)uVar6 & 3);
    if (uVar6 - 1 < 3) {
      uVar8 = 0;
    }
    else {
      puVar9 = (ulong *)(lVar1 + 0xf8);
      uVar8 = 0;
      do {
        uVar2 = puVar9[-0x15];
        if (uVar2 < uVar4) {
          uVar3 = puVar9[-0xe];
          if (uVar4 <= puVar9[-0xe]) goto LAB_14589060c;
LAB_1458905e5:
          uVar2 = puVar9[-7];
          if (uVar4 <= puVar9[-7]) goto LAB_145890618;
LAB_1458905ee:
          uVar2 = *puVar9;
          if (uVar4 <= *puVar9) {
LAB_145890623:
            uVar4 = uVar2;
          }
        }
        else {
          uVar4 = uVar2;
          uVar3 = puVar9[-0xe];
          if (puVar9[-0xe] < uVar2) goto LAB_1458905e5;
LAB_14589060c:
          uVar4 = uVar3;
          uVar2 = puVar9[-7];
          if (puVar9[-7] < uVar4) goto LAB_1458905ee;
LAB_145890618:
          uVar4 = uVar2;
          uVar2 = *puVar9;
          if (uVar4 <= *puVar9) goto LAB_145890623;
        }
        uVar8 = uVar8 + 4;
        puVar9 = puVar9 + 0x1c;
      } while ((uVar6 & 0x7fffffffffffffc) != uVar8);
      if (uVar5 == 0) goto LAB_145890657;
    }
    lVar7 = 0;
    uVar6 = uVar4;
    do {
      uVar4 = *(ulong *)(lVar1 + uVar8 * 0x38 + 0x50 + lVar7);
      if (uVar4 < uVar6) {
        uVar4 = uVar6;
      }
      lVar7 = lVar7 + 0x38;
      uVar6 = uVar4;
    } while (uVar5 * 0x38 - lVar7 != 0);
  }
LAB_145890657:
  return uVar4 + 1;
}
