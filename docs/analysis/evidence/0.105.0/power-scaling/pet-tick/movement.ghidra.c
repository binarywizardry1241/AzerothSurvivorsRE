
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,float param_3,undefined8 param_4,undefined8 param_5
          ,undefined8 param_6,ulong param_7,long param_8)

{
  int *piVar1;
  undefined4 *puVar2;
  long lVar3;
  code *pcVar4;
  ulong uVar5;
  long lVar6;
  long lVar7;
  float fVar8;
  float extraout_XMM0_Da;
  int extraout_XMM0_Da_00;
  float fVar9;
  float fVar10;
  undefined4 uVar11;
  float fVar12;
  float fVar13;
  int iVar14;
  float fVar15;
  float in_stack_00000028;
  int local_f0;
  int iStack_ec;
  int iStack_e8;
  int iStack_e4;
  undefined4 local_e0;
  undefined4 uStack_dc;
  undefined4 uStack_d8;
  undefined4 uStack_d4;

  uVar11 = (undefined4)((ulong)param_4 >> 0x20);
  fVar10 = (float)param_4;
  if (*(ulong *)(param_8 + 0xd8) <= param_7) {
    func_0x000145d697e3();
                    /* WARNING: Does not return */
    pcVar4 = (code *)invalidInstructionException();
    (*pcVar4)();
  }
  fVar15 = *(float *)(param_8 + 0x9ec);
  lVar6 = param_7 * 0x78;
  lVar3 = *(long *)(param_8 + 0x950);
  fVar9 = *(float *)(*(long *)(param_8 + 0xd0) + 0x5c + lVar6);
  lVar7 = *(long *)(param_8 + 0xd0) + lVar6;
  fVar8 = 0.0;
  if (fVar9 <= 0.0) {
    fVar12 = (float)*(undefined8 *)(lVar7 + 0x4c);
    fVar13 = (float)((ulong)*(undefined8 *)(lVar7 + 0x4c) >> 0x20);
    fVar9 = *(float *)(lVar7 + 0x54);
  }
  else {
    fVar9 = (fVar15 - *(float *)(lVar7 + 0x58)) / fVar9;
    if (0.0 <= fVar9) {
      fVar8 = fVar9;
    }
    fVar9 = _DAT_145d6d36c;
    if (fVar8 <= _DAT_145d6d36c) {
      fVar9 = fVar8;
    }
    fVar12 = (float)*(undefined8 *)(lVar7 + 0x40);
    fVar13 = (float)((ulong)*(undefined8 *)(lVar7 + 0x40) >> 0x20);
    fVar12 = fVar9 * ((float)*(undefined8 *)(lVar7 + 0x4c) - fVar12) + fVar12;
    fVar13 = fVar9 * ((float)((ulong)*(undefined8 *)(lVar7 + 0x4c) >> 0x20) - fVar13) + fVar13;
    fVar8 = *(float *)(lVar7 + 0x48);
    fVar9 = (*(float *)(lVar7 + 0x54) - fVar8) * fVar9 + fVar8;
  }
  uVar5 = func_0x0001458c7b60(fVar8,fVar12,CONCAT44(fVar13,fVar13));
  fVar8 = extraout_XMM0_Da;
  if ((uVar5 & 1) == 0) {
    fVar8 = fVar9;
  }
  fVar9 = SQRT((fVar13 - fVar10) * (fVar13 - fVar10) + (fVar12 - param_3) * (fVar12 - param_3));
  if (_DAT_145d6d748 <= fVar9) {
    uVar5 = func_0x0001458c7b60(_DAT_145d6d748,param_3,CONCAT44(uVar11,fVar10));
    iVar14 = extraout_XMM0_Da_00;
    if (((uVar5 & 1) == 0) &&
       ((*(long *)(lVar3 + 0x68) == -1 || (func_0x0001458cc950(), iVar14 = iStack_e4, local_f0 != 1)
        ))) {
      iVar14 = *(int *)(lVar3 + 0xb8);
    }
    fVar9 = fVar9 / in_stack_00000028;
    *(int *)(param_8 + 0xa10) = *(int *)(param_8 + 0xa10) + 1;
    func_0x0001458aa9e0();
    lVar3 = *(long *)(param_8 + 0x5e0);
    if (lVar3 == *(long *)(param_8 + 0x5d0)) {
      func_0x000145bcb530();
    }
    lVar7 = *(long *)(param_8 + 0x5d8);
    puVar2 = (undefined4 *)(lVar7 + 0x10 + lVar3 * 0x20);
    *puVar2 = local_e0;
    puVar2[1] = uStack_dc;
    puVar2[2] = uStack_d8;
    puVar2[3] = uStack_d4;
    piVar1 = (int *)(lVar7 + lVar3 * 0x20);
    *piVar1 = local_f0;
    piVar1[1] = iStack_ec;
    piVar1[2] = iStack_e8;
    piVar1[3] = iStack_e4;
    *(long *)(param_8 + 0x5e0) = lVar3 + 1;
    if (*(ulong *)(param_8 + 0xd8) <= param_7) {
      func_0x000145d697e3();
                    /* WARNING: Does not return */
      pcVar4 = (code *)invalidInstructionException();
      (*pcVar4)();
    }
    lVar3 = *(long *)(param_8 + 0xd0);
    *(ulong *)(lVar3 + 0x40 + lVar6) = CONCAT44(fVar13,fVar12);
    *(float *)(lVar3 + 0x48 + lVar6) = fVar8;
    *(float *)(lVar3 + 0x4c + lVar6) = param_3;
    *(float *)(lVar3 + 0x50 + lVar6) = fVar10;
    *(int *)(lVar3 + 0x54 + lVar6) = iVar14;
    *(float *)(lVar3 + 0x58 + lVar6) = fVar15;
    *(float *)(lVar3 + 0x5c + lVar6) = fVar9;
  }
  return;
}
