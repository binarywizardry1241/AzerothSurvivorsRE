
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long param_3,undefined8 *param_4)

{
  byte bVar1;
  long lVar2;
  long lVar3;
  undefined8 uVar4;
  byte bVar5;
  int iVar6;
  ulong uVar7;
  ulong uVar8;
  long lVar9;
  long lVar10;
  long lVar11;
  long lVar12;
  long lVar13;

  iVar6 = 0xd;
  if (_DAT_14809d0d8 < 0xd) {
    iVar6 = (int)_DAT_14809d0d8;
  }
  uVar7 = (ulong)(uint)(iVar6 << 5);
  if (*(int *)(uVar7 + 0x14809a6a8) != 0) {
    func_0x000145d8e52a();
  }
  lVar2 = *(long *)(uVar7 + 0x14809a6a0);
  lVar3 = *(long *)(uVar7 + 0x14809a698);
  lVar11 = lVar3;
  do {
    do {
      lVar12 = lVar11;
      if (lVar12 == lVar2 * 0x70 + lVar3) {
        param_4[2] = 0;
        *param_4 = 0;
        param_4[1] = 8;
        return;
      }
      lVar11 = lVar12 + 0x70;
    } while (*(char *)(lVar12 + 0x48) != '\t');
    bVar1 = *(byte *)(lVar12 + 0x4c);
    uVar4 = *(undefined8 *)(lVar12 + 8);
    uVar7 = *(ulong *)(lVar12 + 0x10);
    uVar8 = *(ulong *)(param_3 + 0xb8);
    if (uVar8 == 0) break;
    lVar11 = *(long *)(param_3 + 0xb0);
    if (uVar8 == 1) {
      lVar13 = 0;
    }
    else {
      lVar10 = 0;
      do {
        lVar13 = lVar10 + (uVar8 >> 1);
        lVar9 = *(long *)(lVar11 + 0x10 + lVar13 * 0x18) - uVar7;
        iVar6 = func_0x000145c0a3e7();
        if (iVar6 != 0) {
          lVar9 = (long)iVar6;
        }
        if (0 < lVar9) {
          lVar13 = lVar10;
        }
        uVar8 = uVar8 - (uVar8 >> 1);
        lVar10 = lVar13;
      } while (1 < uVar8);
    }
    uVar8 = *(ulong *)(lVar11 + 0x10 + lVar13 * 0x18);
    lVar10 = uVar8 - uVar7;
    if (uVar7 <= uVar8) {
      uVar8 = uVar7;
    }
    iVar6 = func_0x000145c0a3e7(uVar4,lVar10,uVar4,*(undefined8 *)(lVar11 + 8 + lVar13 * 0x18),uVar8
                               );
    if (iVar6 != 0) {
      lVar10 = (long)iVar6;
    }
    lVar11 = lVar12 + 0x70;
  } while (lVar10 == 0);
  bVar5 = bVar1 - 8;
  if (bVar1 < 8) {
    bVar5 = 7;
  }
                    /* WARNING: Could not emulate address calculation at 0x0001459b60bf */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)((long)*(int *)((ulong)bVar5 * 4 + 0x147243524) + 0x147243524))();
  return;
}
