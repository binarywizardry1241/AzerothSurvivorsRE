
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long param_3,undefined8 *param_4)

{
  uint uVar1;
  long lVar2;
  undefined8 uVar3;
  ulong uVar4;
  long lVar5;
  int iVar6;
  ulong uVar7;
  long lVar8;
  long lVar9;
  long lVar10;
  ulong uVar11;
  long lVar12;
  long lVar13;

  iVar6 = 0xd;
  if (_DAT_147a3a4e0 < 0xd) {
    iVar6 = (int)_DAT_147a3a4e0;
  }
  lVar10 = (ulong)(uint)(iVar6 << 5) + 0x147a37aa0;
  if (*(int *)((ulong)(uint)(iVar6 << 5) + 0x147a37ab8) != 0) {
    func_0x0001458e9ead();
  }
  lVar2 = *(long *)(lVar10 + 8);
  lVar10 = *(long *)(lVar10 + 0x10);
  lVar5 = lVar2;
  do {
    do {
      lVar13 = lVar5;
      if (lVar13 == lVar10 * 0x70 + lVar2) {
        param_4[2] = 0;
        *param_4 = 0;
        param_4[1] = 8;
        return;
      }
      lVar5 = lVar13 + 0x70;
    } while (*(char *)(lVar13 + 0x48) != '\t');
    uVar1 = *(uint *)(lVar13 + 0x4c);
    uVar3 = *(undefined8 *)(lVar13 + 8);
    uVar4 = *(ulong *)(lVar13 + 0x10);
    uVar7 = *(ulong *)(param_3 + 0xb8);
    if (uVar7 == 0) break;
    lVar5 = *(long *)(param_3 + 0xb0);
    if (uVar7 == 1) {
      lVar12 = 0;
    }
    else {
      lVar9 = 0;
      do {
        lVar12 = lVar9 + (uVar7 >> 1);
        uVar11 = *(ulong *)(lVar5 + 0x10 + lVar12 * 0x18);
        lVar8 = uVar11 - uVar4;
        if (uVar4 <= uVar11) {
          uVar11 = uVar4;
        }
        iVar6 = func_0x0001457731e7(lVar9,lVar8,uVar3,*(undefined8 *)(lVar5 + 8 + lVar12 * 0x18),
                                    uVar11);
        if (iVar6 != 0) {
          lVar8 = (long)iVar6;
        }
        if (0 < lVar8) {
          lVar12 = lVar9;
        }
        uVar7 = uVar7 - (uVar7 >> 1);
        lVar9 = lVar12;
      } while (1 < uVar7);
    }
    uVar7 = *(ulong *)(lVar5 + 0x10 + lVar12 * 0x18);
    lVar9 = uVar7 - uVar4;
    if (uVar4 <= uVar7) {
      uVar7 = uVar4;
    }
    iVar6 = func_0x0001457731e7(uVar3,lVar9,uVar3,*(undefined8 *)(lVar5 + 8 + lVar12 * 0x18),uVar7);
    if (iVar6 != 0) {
      lVar9 = (long)iVar6;
    }
    lVar5 = lVar13 + 0x70;
  } while (lVar9 == 0);
                    /* WARNING: Could not recover jumptable at 0x00014552f95e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)((long)*(int *)((ulong)uVar1 * 4 + 0x146d35df4) + 0x146d35df4))();
  return;
}
