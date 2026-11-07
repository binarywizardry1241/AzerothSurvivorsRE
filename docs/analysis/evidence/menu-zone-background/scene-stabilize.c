
/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,undefined8 *param_3,undefined8 param_4,
          undefined8 *param_5,long *param_6)

{
  undefined4 uVar1;
  char *pcVar2;
  uint *puVar3;
  undefined4 *puVar4;
  long lVar5;
  uint uVar6;
  byte bVar7;
  char cVar8;
  uint uVar9;
  int extraout_EDX;
  int extraout_EDX_00;
  int iVar10;
  undefined8 *extraout_RDX;
  ulong *puVar11;
  int iVar12;
  bool bVar13;
  int *in_stack_00000028;

  pcVar2 = (char *)*param_3;
  puVar3 = (uint *)*param_5;
  puVar4 = (undefined4 *)param_5[2];
  uVar1 = *(undefined4 *)((long)param_5 + 0x1c);
  lVar5 = *param_6;
  if (_DAT_148078190 == 0) {
    LOCK();
    bVar13 = DAT_148078160 == '\0';
    if (bVar13) {
      DAT_148078160 = '\x01';
    }
    UNLOCK();
  }
  else {
    func_0x000145c4aa3e();
    LOCK();
    bVar13 = DAT_148078160 == '\0';
    if (bVar13) {
      DAT_148078160 = '\x01';
    }
    UNLOCK();
    param_3 = extraout_RDX;
  }
  iVar10 = (int)param_3;
  if (!bVar13) {
    func_0x000145dbc1f0();
    iVar10 = extraout_EDX;
  }
  puVar11 = _DAT_1480be9e8;
  if ((*_DAT_1480be9e8 & 0x7fffffffffffffff) == 0) {
    bVar7 = 0;
    uVar9 = (uint)DAT_148078161;
    if (*pcVar2 != '\x01') goto LAB_14085d70d;
LAB_14085d601:
    uVar6 = _DAT_148078168;
    if ((DAT_148078164 & 1) == 0) goto LAB_14085d70d;
    iVar12 = 1;
    uVar9 = _DAT_148078168;
    iVar10 = _DAT_14807816c;
    if (((*in_stack_00000028 != 1) || (in_stack_00000028[1] != _DAT_148078168)) ||
       (in_stack_00000028[2] != _DAT_14807816c)) goto LAB_14085d715;
    uVar9 = 0xffffffff;
    if (in_stack_00000028[3] + 1U != 0) {
      uVar9 = in_stack_00000028[3] + 1U;
    }
    in_stack_00000028[3] = uVar9;
    if (uVar9 < 3) goto LAB_14085d737;
    if ((puVar3 != (uint *)0x0) && (*puVar3 != uVar6)) {
      *puVar4 = uVar1;
      *puVar3 = uVar6;
    }
    DAT_14807818d = 1;
    bVar13 = DAT_14807818e != '\0';
    DAT_14807818e = true;
    if (bVar13) goto LAB_14085d740;
    if (((lVar5 != 0 && 0x11 < uVar9) && (*(char *)(lVar5 + 0x3c) == '\x01')) &&
       ((*(char *)(lVar5 + 0x3d) == '\x01' &&
        ((*(long *)(lVar5 + 0x10) == 0 && (*(long *)(lVar5 + 0x18) == 0)))))) {
      DAT_14807818e = *(long *)(lVar5 + 0x28) == 0;
      goto LAB_14085d740;
    }
  }
  else {
    bVar7 = func_0x000145dbcf80();
    bVar7 = bVar7 ^ 1;
    uVar9 = (uint)DAT_148078161;
    iVar10 = extraout_EDX_00;
    if (*pcVar2 == '\x01') goto LAB_14085d601;
LAB_14085d70d:
    if ((char)*in_stack_00000028 == '\0') {
      iVar10 = -1;
      if (in_stack_00000028[3] + 1 != 0) {
        iVar10 = in_stack_00000028[3] + 1;
      }
      in_stack_00000028[3] = iVar10;
    }
    else {
      iVar12 = 0;
LAB_14085d715:
      *in_stack_00000028 = iVar12;
      in_stack_00000028[1] = uVar9;
      in_stack_00000028[2] = iVar10;
      in_stack_00000028[3] = 0;
    }
LAB_14085d737:
    DAT_14807818d = 0;
  }
  DAT_14807818e = false;
LAB_14085d740:
  if (((bVar7 == 0) && ((*puVar11 & 0x7fffffffffffffff) != 0)) &&
     (cVar8 = func_0x000145dbcf80(), cVar8 == '\0')) {
    DAT_148078161 = 1;
  }
  cVar8 = DAT_148078160;
  LOCK();
  DAT_148078160 = 0;
  UNLOCK();
  if (cVar8 != '\x02') {
    return;
  }
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}
