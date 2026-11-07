/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,long param_4,undefined8 param_5)

{
  undefined8 *puVar1;
  long lVar2;
  long *plVar3;
  long *plVar4;
  long lVar5;
  long lVar6;
  long lVar7;
  float fVar8;
  float fStack_e0;
  undefined8 local_c8;
  undefined8 uStack_c0;
  undefined8 local_b8;
  undefined8 uStack_b0;
  long local_98;
  long local_88;

  if (*(long *)(param_4 + 800) == 0) {
    return;
  }
  lVar2 = *(long *)(param_4 + 0x318);
  lVar6 = 0;
  while ((plVar3 = *(long **)(lVar2 + lVar6), plVar3[1] != 0xd ||
         (plVar4 = (long *)*plVar3,
         *(long *)((long)plVar4 + 5) != 0x656d616c665f666f || *plVar4 != 0x5f666f5f6c6c6163))) {
    lVar6 = lVar6 + 0x68;
    if (*(long *)(param_4 + 800) * 0x68 - lVar6 == 0) {
      return;
    }
  }
  fVar8 = _DAT_145e81d10;
  if (*(long *)(param_4 + 0x7e0) != 0) {
    lVar5 = *(long *)(param_4 + 0x7d8);
    lVar7 = 0;
    do {
      if ((*(long *)(lVar5 + 8 + lVar7) == 0xd) &&
         (*(long *)((long)*(long **)(lVar5 + lVar7) + 5) == *(long *)((long)plVar4 + 5) &&
          **(long **)(lVar5 + lVar7) == *plVar4)) {
        fVar8 = *(float *)(lVar5 + 0x10 + lVar7);
        break;
      }
      lVar7 = lVar7 + 0x18;
    } while (*(long *)(param_4 + 0x7e0) * 0x18 != lVar7);
  }
  if (fVar8 <= *(float *)(param_4 + 0x9ec)) {
    fStack_e0 = (float)((ulong)*(undefined8 *)(lVar2 + lVar6 + 0x4c) >> 0x20);
    fVar8 = *(float *)(lVar2 + 0x34 + lVar6) * fStack_e0 * *(float *)(plVar3 + 10) *
            *(float *)(param_4 + 0x4a0);
    if (_DAT_146066890 < fVar8) {
      func_0x000145bc98dd((fVar8 + _DAT_146e78468) / _DAT_145d6d650,param_5,param_3);
    }
    func_0x000145925c80();
    if (local_88 != 0) {
      func_0x000145946220();
      func_0x0001458b5100();
      lVar2 = *(long *)(param_4 + 0x5e0);
      if (lVar2 == *(long *)(param_4 + 0x5d0)) {
        func_0x000145bcb530();
      }
      lVar6 = *(long *)(param_4 + 0x5d8);
      puVar1 = (undefined8 *)(lVar6 + 0x10 + lVar2 * 0x20);
      *puVar1 = local_b8;
      puVar1[1] = uStack_b0;
      puVar1 = (undefined8 *)(lVar6 + lVar2 * 0x20);
      *puVar1 = local_c8;
      puVar1[1] = uStack_c0;
      *(long *)(param_4 + 0x5e0) = lVar2 + 1;
      func_0x000145945c10();
    }
    if (local_98 != 0) {
      func_0x0001400021d0();
    }
  }
  return;
}
