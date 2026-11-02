/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long *param_3,long param_4)

{
  long *plVar1;
  long *plVar2;
  undefined8 uVar3;
  code *pcVar4;
  int iVar5;
  undefined4 *puVar6;
  long lVar7;
  long lVar8;
  long lVar9;
  long lVar10;
  float fVar11;
  float fVar12;
  undefined4 local_a0;
  undefined4 uStack_9c;
  undefined4 uStack_98;
  undefined4 uStack_94;
  undefined4 local_90;
  undefined4 uStack_8c;
  undefined4 uStack_88;
  undefined4 uStack_84;

  plVar1 = (long *)*param_3;
  plVar2 = (long *)*plVar1;
  lVar8 = plVar1[1];
  if (lVar8 == 0xb) {
    if (*(long *)((long)plVar2 + 3) == CONCAT35(uRam0000000146bb36b0,_DAT_146bb36ab) &&
        *plVar2 == CONCAT53(_DAT_146bb36ab,_DAT_146bb36a8)) {
      return;
    }
  }
  else if ((lVar8 == 10) && ((short)plVar2[1] == _DAT_146bb36a6 && *plVar2 == _DAT_146bb369e)) {
    return;
  }
  fVar12 = *(float *)(plVar1 + 9) * _DAT_145d73d40 * *(float *)((long)param_3 + 0x2c) *
           *(float *)(param_3 + 9) * *(float *)(param_4 + 0x480) * *(float *)((long)param_3 + 100);
  if (fVar12 <= _DAT_145d73d44) {
    fVar12 = _DAT_145d73d44;
  }
  fVar11 = (float)func_0x000145882c60(lVar8,param_4,lVar8);
  if (fVar11 <= fVar12) {
    fVar11 = fVar12;
  }
  fVar12 = *(float *)((long)param_3 + 0x5c);
  if (*(float *)((long)param_3 + 0x5c) <= _DAT_145d70c34) {
    fVar12 = _DAT_145d70c34;
  }
  fVar11 = fVar11 / fVar12;
  fVar12 = *(float *)(param_4 + 0x9ec) + fVar11;
  lVar9 = *(long *)(param_4 + 0x7d8);
  lVar7 = *(long *)(param_4 + 0x7e0);
  if (lVar7 != 0) {
    lVar10 = 0;
    do {
      if ((*(long *)(lVar9 + 8 + lVar10) == lVar8) && (iVar5 = func_0x000145bc9787(), iVar5 == 0)) {
        *(float *)(lVar9 + 0x10 + lVar10) = fVar12;
        lVar8 = *(long *)(param_4 + 800);
        goto joined_r0x000145946368;
      }
      lVar10 = lVar10 + 0x18;
    } while (lVar7 * 0x18 != lVar10);
  }
  if (lVar7 == *(long *)(param_4 + 2000)) {
    func_0x000145bcb3e0();
    lVar9 = *(long *)(param_4 + 0x7d8);
  }
  *(long **)(lVar9 + lVar7 * 0x18) = plVar2;
  *(long *)(lVar9 + 8 + lVar7 * 0x18) = lVar8;
  *(float *)(lVar9 + 0x10 + lVar7 * 0x18) = fVar12;
  *(long *)(param_4 + 0x7e0) = lVar7 + 1;
  lVar8 = *(long *)(param_4 + 800);
joined_r0x000145946368:
  if (lVar8 != 0) {
    lVar9 = *(long *)(param_4 + 0x318);
    lVar7 = plVar1[1];
    lVar10 = 0;
    do {
      if ((*(long *)(*(long *)(lVar9 + lVar10) + 8) == lVar7) &&
         (iVar5 = func_0x000145bc9787(), iVar5 == 0)) {
        *(float *)(lVar9 + 0x24 + lVar10) = fVar11;
        break;
      }
      lVar10 = lVar10 + 0x68;
    } while (lVar8 * 0x68 - lVar10 != 0);
  }
  func_0x0001458acb30(param_4 + 0x5d0);
  lVar8 = *(long *)(param_4 + 0x5e0);
  if (lVar8 == *(long *)(param_4 + 0x5d0)) {
    func_0x000145bcb530();
  }
  lVar9 = *(long *)(param_4 + 0x5d8);
  puVar6 = (undefined4 *)(lVar9 + 0x10 + lVar8 * 0x20);
  *puVar6 = local_90;
  puVar6[1] = uStack_8c;
  puVar6[2] = uStack_88;
  puVar6[3] = uStack_84;
  puVar6 = (undefined4 *)(lVar9 + lVar8 * 0x20);
  *puVar6 = local_a0;
  puVar6[1] = uStack_9c;
  puVar6[2] = uStack_98;
  puVar6[3] = uStack_94;
  *(long *)(param_4 + 0x5e0) = lVar8 + 1;
  lVar8 = plVar1[8];
  uVar3 = *(undefined8 *)(param_4 + 0x460);
  func_0x000140002200();
  puVar6 = (undefined4 *)func_0x0001400021c0();
  if (puVar6 != (undefined4 *)0x0) {
    *puVar6 = (int)lVar8;
    *(undefined8 *)(puVar6 + 1) = uVar3;
    lVar8 = *(long *)(param_4 + 0x5e0);
    if (lVar8 == *(long *)(param_4 + 0x5d0)) {
      func_0x000145bcb530();
    }
    lVar9 = *(long *)(param_4 + 0x5d8);
    lVar7 = lVar8 * 0x20;
    *(undefined8 *)(lVar9 + lVar7) = 0x20;
    *(undefined4 **)(lVar9 + 8 + lVar7) = puVar6;
    *(undefined8 *)(lVar9 + 0x10 + lVar7) = 0xc;
    *(undefined2 *)(lVar9 + 0x18 + lVar7) = 0x135;
    *(long *)(param_4 + 0x5e0) = lVar8 + 1;
    return;
  }
  func_0x000145d6944b();
                    /* WARNING: Does not return */
  pcVar4 = (code *)invalidInstructionException();
  (*pcVar4)();
}
