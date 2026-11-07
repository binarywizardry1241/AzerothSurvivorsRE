/* WARNING: Removing unreachable block (ram,0x000145943e41) */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(void)

{
  undefined4 *puVar1;
  undefined8 *puVar2;
  long lVar3;
  long lVar4;
  undefined8 uVar5;
  long in_RCX;
  long lVar6;
  long lVar8;
  float fVar9;
  float fVar10;
  float fVar11;
  float fVar12;
  float fVar13;
  float fVar14;
  float fVar15;
  undefined8 local_110;
  undefined4 uStack_108;
  undefined4 uStack_104;
  undefined8 local_100;
  undefined8 uStack_f8;
  long local_d0;
  long lVar7;

  fVar11 = (float)*(undefined8 *)(in_RCX + 0x4c8);
  fVar12 = (float)((ulong)*(undefined8 *)(in_RCX + 0x4c8) >> 0x20);
  fVar13 = *(float *)(in_RCX + 0x9ec);
  local_d0 = 8;
  lVar3 = *(long *)(in_RCX + 0x5c0);
  lVar4 = *(long *)(in_RCX + 0x5c8);
  lVar8 = 0;
  lVar6 = lVar3;
  fVar14 = _DAT_145d70c74;
  fVar15 = _DAT_145d6d424;
  while (lVar7 = lVar6, lVar6 = lVar7 + 0x48, lVar7 != lVar3 + lVar4 * 0x48) {
    if ((*(int *)(lVar7 + 0x20) == 0) && (*(int *)(lVar7 + 0x18) == 0)) {
      fVar9 = *(float *)(lVar7 + 0x34) - fVar11;
      fVar10 = *(float *)(lVar7 + 0x38) - fVar12;
      fVar9 = SQRT(fVar10 * fVar10 + fVar9 * fVar9) / fVar14;
      if (fVar9 <= fVar15) {
        fVar9 = fVar15;
      }
      *(undefined4 *)(lVar7 + 0x18) = 1;
      *(float *)(lVar7 + 0x1c) = fVar13 + fVar9;
      uVar5 = *(undefined8 *)(lVar7 + 0x28);
      local_110 = *(undefined8 *)(lVar7 + 0x34);
      uStack_108 = *(undefined4 *)(lVar7 + 0x3c);
      if (lVar8 == 0) {
        func_0x000145bcb3e0();
      }
      *(undefined8 *)(lVar8 * 0x18 + 8) = uVar5;
      *(undefined8 *)(lVar8 * 0x18 + 0x10) = local_110;
      *(undefined4 *)(lVar8 * 0x18 + 0x18) = uStack_108;
      *(float *)(lVar8 * 0x18 + 0x1c) = fVar9;
      lVar8 = lVar8 + 1;
    }
  }
  for (; local_d0 != lVar8 * 0x18 + 8; local_d0 = local_d0 + 0x18) {
    *(int *)(in_RCX + 0xa10) = *(int *)(in_RCX + 0xa10) + 1;
    func_0x0001458aa9e0();
    lVar3 = *(long *)(in_RCX + 0x5e0);
    if (lVar3 == *(long *)(in_RCX + 0x5d0)) {
      func_0x000145bcb530();
    }
    lVar4 = *(long *)(in_RCX + 0x5d8);
    puVar2 = (undefined8 *)(lVar4 + 0x10 + lVar3 * 0x20);
    *puVar2 = local_100;
    puVar2[1] = uStack_f8;
    puVar1 = (undefined4 *)(lVar4 + lVar3 * 0x20);
    *puVar1 = (undefined4)local_110;
    puVar1[1] = local_110._4_4_;
    puVar1[2] = uStack_108;
    puVar1[3] = uStack_104;
    *(long *)(in_RCX + 0x5e0) = lVar3 + 1;
  }
  return;
}
