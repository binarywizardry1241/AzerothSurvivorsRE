int FUN_14589d0d0(undefined8 param_1,undefined8 param_2,char param_3,long param_4)

{
  long lVar1;
  char *pcVar2;
  int iVar3;
  uint uVar4;
  uint uVar5;
  uint uVar6;
  uint uVar7;
  long lVar8;

  uVar6 = 0;
  lVar8 = 0;
  do {
    if (*(long *)(param_4 + 0x70) << 5 == lVar8) goto LAB_14589d108;
    lVar1 = lVar8 + 0x20;
    pcVar2 = (char *)(*(long *)(param_4 + 0x68) + 4 + lVar8);
    lVar8 = lVar1;
  } while (*pcVar2 != param_3);
  uVar6 = *(uint *)(*(long *)(param_4 + 0x68) + -0x20 + lVar1);
LAB_14589d108:
  uVar7 = 0x6e;
  iVar3 = 2;
  do {
    uVar4 = uVar6 - (uVar7 - 0x1e);
    if (uVar6 < uVar7 - 0x1e) {
      return iVar3 + -2;
    }
    uVar5 = uVar4 - (uVar7 - 0xf);
    if (uVar4 < uVar7 - 0xf) {
      return iVar3 + -1;
    }
    uVar6 = uVar5 - uVar7;
    if (uVar5 < uVar7) {
      return iVar3;
    }
    uVar7 = uVar7 + 0x2d;
    iVar3 = iVar3 + 3;
  } while (uVar7 != 0x36b);
  return 0x33;
}
