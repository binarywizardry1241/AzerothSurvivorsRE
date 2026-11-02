
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long param_3,short *param_4,long *param_5,
          long param_6)

{
  long lVar1;
  long lVar2;
  int iVar3;
  uint uVar4;
  ulong uVar5;
  int *piVar6;
  int iVar7;
  ulong uVar8;
  undefined4 *puVar9;
  ulong uVar10;
  int iVar11;
  long in_GS_OFFSET;
  float fVar12;
  undefined4 uVar13;
  undefined4 uVar14;
  undefined4 uVar15;
  undefined4 uVar16;

  if (param_3 == 2 && param_4 != (short *)0x0) {
    if (*param_4 == 0x6e65) {
      uVar5 = 1;
      param_4 = (short *)0x0;
    }
    else {
      uVar5 = 1;
      if (*param_4 == 0x6c70) {
        param_4 = (short *)0x1;
      }
      else if (*param_4 == 0x7363) {
        param_4 = (short *)0x2;
      }
      else if (*param_4 == 0x6564) {
        param_4 = (short *)0x3;
      }
      else if (*param_4 == 0x7470) {
        param_4 = (short *)0x4;
      }
      else if (*param_4 == 0x7365) {
        param_4 = (short *)0x5;
      }
      else if (*param_4 == 0x7266) {
        param_4 = (short *)0x6;
      }
      else if (*param_4 == 0x6f72) {
        param_4 = (short *)0x7;
      }
      else if (*param_4 == 0x7274) {
        param_4 = (short *)0x8;
      }
      else if (*param_4 == 0x7572) {
        param_4 = (short *)0x9;
      }
      else if (*param_4 == 0x6b75) {
        param_4 = (short *)0xa;
      }
      else if (*param_4 == 0x687a) {
        param_4 = (short *)0xb;
      }
      else if (*param_4 == 0x616a) {
        param_4 = (short *)0xc;
      }
      else {
        uVar5 = (ulong)(*param_4 == 0x6f6b);
        param_4 = (short *)0xd;
      }
    }
  }
  else {
    uVar5 = 0;
  }
  lVar1 = *(long *)(*(long *)(in_GS_OFFSET + 0x58) + (ulong)_DAT_1482172f0 * 8);
  puVar9 = (undefined4 *)(lVar1 + 0x330);
  uVar13 = *(undefined4 *)(lVar1 + 0x330);
  uVar14 = *(undefined4 *)(lVar1 + 0x334);
  uVar15 = *(undefined4 *)(lVar1 + 0x338);
  uVar16 = *(undefined4 *)(lVar1 + 0x33c);
  *(ulong *)(lVar1 + 0x330) = uVar5;
  *(short **)(lVar1 + 0x338) = param_4;
  uVar5 = *(ulong *)(*param_5 + 0x10);
  if (uVar5 == 0) goto LAB_1458dac9f;
  lVar1 = *(long *)(param_6 + 0xb40);
  lVar2 = *(long *)(*param_5 + 8);
  iVar3 = 0;
  if (uVar5 == 1) {
    uVar10 = 0;
    uVar4 = 0;
LAB_1458daba7:
    if (*(long *)(lVar2 + uVar10 * 0x10) != lVar1) {
      iVar3 = *(int *)(lVar2 + 8 + uVar10 * 0x10);
    }
    uVar8 = (ulong)(iVar3 + uVar4);
  }
  else {
    piVar6 = (int *)(lVar2 + 0x18);
    uVar10 = 0;
    uVar8 = 0;
    do {
      iVar7 = 0;
      if (*(long *)(piVar6 + -6) != lVar1) {
        iVar7 = piVar6[-4];
      }
      iVar11 = 0;
      if (*(long *)(piVar6 + -2) != lVar1) {
        iVar11 = *piVar6;
      }
      uVar4 = (int)uVar8 + iVar7 + iVar11;
      uVar8 = (ulong)uVar4;
      uVar10 = uVar10 + 2;
      piVar6 = piVar6 + 8;
    } while ((uVar5 & 0xfffffffffffffffe) != uVar10);
    if ((uVar5 & 1) != 0) goto LAB_1458daba7;
  }
  if (((int)uVar8 != 0) && (*(char *)(param_6 + 0xc46) != '\x04')) {
    fVar12 = _DAT_145edfeb0;
    if (*(char *)(param_6 + 0xc41) == '\x01') {
      uVar4 = func_0x0001458095e0(puVar9,uVar8,*(undefined8 *)(param_6 + 0x2b0),
                                  *(undefined8 *)(param_6 + 0x2a8));
      fVar12 = _DAT_145edfeb0 /
               ((float)(*(long *)(param_6 + 0xb50) - 1) *
                *(float *)((ulong)(uVar4 < 3) * 4 + 0x14703cad0) * _DAT_145ee0378 + _DAT_145edfeb0);
    }
    func_0x000145d1463d((float)(uVar8 & 0xffffffff) * *(float *)(param_6 + 0x4ac) * fVar12);
    func_0x00014591db30();
  }
LAB_1458dac9f:
  *puVar9 = uVar13;
  puVar9[1] = uVar14;
  puVar9[2] = uVar15;
  puVar9[3] = uVar16;
  return;
}
