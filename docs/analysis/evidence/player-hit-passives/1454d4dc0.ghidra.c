
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long param_3,long param_4)

{
  long *plVar1;
  uint uVar2;
  ulong uVar3;
  long lVar4;
  long lVar5;
  long lVar6;
  float fVar7;
  undefined4 extraout_XMM0_Da;
  undefined4 uVar8;
  undefined8 uVar9;
  float fVar10;
  undefined4 uVar11;
  undefined4 uVar12;
  undefined8 local_d0;
  undefined4 local_c8;
  
  if (*(long *)(param_4 + 0x2a0) == 0) {
    return;
  }
  lVar6 = 0;
  while ((plVar1 = *(long **)(*(long *)(param_4 + 0x298) + lVar6), plVar1[1] != 9 ||
         (plVar1 = (long *)*plVar1, (char)plVar1[1] != 'h' || *plVar1 != 0x70726f6d796c6f70))) {
    lVar6 = lVar6 + 0x58;
    if (*(long *)(param_4 + 0x2a0) * 0x58 - lVar6 == 0) {
      return;
    }
  }
  if (2 < *(ulong *)(param_4 + 0x7a8)) {
    return;
  }
  fVar10 = *(float *)(param_4 + 0x8e4);
  fVar7 = _DAT_1459eb2d0;
  if (*(long *)(param_4 + 0x730) != 0) {
    lVar6 = *(long *)(param_4 + 0x728);
    lVar4 = 0;
    do {
      if ((*(long *)(lVar6 + 8 + lVar4) == 9) &&
         ((char)(*(long **)(lVar6 + lVar4))[1] == (char)plVar1[1] &&
          **(long **)(lVar6 + lVar4) == *plVar1)) {
        fVar7 = *(float *)(lVar6 + 0x10 + lVar4);
        break;
      }
      lVar4 = lVar4 + 0x18;
    } while (*(long *)(param_4 + 0x730) * 0x18 != lVar4);
  }
  if (fVar7 <= fVar10) {
    lVar4 = *(long *)(param_4 + 0x4c8);
    lVar5 = 0;
    lVar6 = lVar4;
    do {
      if (*(long *)(param_4 + 0x4d0) * 0x160 - lVar5 == 0) {
        return;
      }
      lVar5 = lVar5 + 0x160;
      plVar1 = (long *)(lVar6 + 0x88);
      lVar6 = lVar6 + 0x160;
    } while (*plVar1 != param_3);
    if ((((*(char *)(lVar4 + -0xf8 + lVar5) == '\0') && (*(long *)(lVar4 + -0x148 + lVar5) == -1))
        && (*(long *)(lVar4 + -0x120 + lVar5) == -1)) &&
       ((*(float *)(lVar4 + -0x20 + lVar5) <= fVar10 &&
        (uVar2 = func_0x000145486e90(param_4,param_4 + 0x798,param_3,param_4 + 0x880),
        (float)(uVar2 >> 8) * _DAT_1459eb3c0 < _DAT_1458eb520)))) {
      func_0x0001454d49e0();
      lVar4 = *(long *)(param_4 + 0x4d0) * 0x160;
      lVar6 = *(long *)(param_4 + 0x4c8) + -0x160;
      do {
        lVar5 = lVar6;
        if (lVar4 == 0) goto LAB_1454d513f;
        lVar4 = lVar4 + -0x160;
        lVar6 = lVar5 + 0x160;
      } while (*(long *)(lVar5 + 0x1e8) != param_3);
      *(float *)(lVar5 + 0x2a0) = _DAT_1458f8de0 + fVar10;
      *(undefined4 *)(lVar5 + 0x1d0) = 0;
      *(float *)(lVar5 + 0x28c) = _DAT_14590aefc + fVar10;
      uVar9 = func_0x00014540d200();
      uVar11 = (undefined4)local_d0;
      uVar12 = (undefined4)((ulong)local_d0 >> 0x20);
      uVar3 = func_0x0001454627f0(uVar9,uVar11,uVar12);
      uVar8 = extraout_XMM0_Da;
      if ((uVar3 & 1) == 0) {
        uVar8 = local_c8;
      }
      *(undefined4 *)(lVar5 + 0x274) = uVar8;
      *(ulong *)(lVar5 + 0x26c) = CONCAT44(uVar12,uVar11);
      *(ulong *)(lVar5 + 0x278) = CONCAT44(uVar12,uVar11);
      *(undefined4 *)(lVar5 + 0x280) = uVar8;
      *(ulong *)(lVar5 + 0x284) = (ulong)(uint)fVar10;
      *(int *)(param_4 + 0x908) = *(int *)(param_4 + 0x908) + 1;
      func_0x0001454451b0();
      func_0x000140bd39f0();
LAB_1454d513f:
      lVar6 = *(long *)(param_4 + 0x7a8);
      if (lVar6 == *(long *)(param_4 + 0x798)) {
        func_0x000145757ef0();
      }
      *(long *)(*(long *)(param_4 + 0x7a0) + lVar6 * 8) = param_3;
      *(long *)(param_4 + 0x7a8) = lVar6 + 1;
      func_0x0001454d5440();
      func_0x00014544b1a0();
      func_0x000140bd39f0();
      func_0x0001454d13a0();
    }
  }
  return;
}

