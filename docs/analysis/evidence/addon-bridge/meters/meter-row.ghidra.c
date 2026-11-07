/* WARNING: Removing unreachable block (ram,0x0001459b8ef7) */

void entry(undefined8 param_1,undefined8 param_2,undefined8 *param_3,long *param_4)

{
  long lVar1;
  long lVar2;
  long *plVar3;
  long lVar4;
  ulong uVar5;
  undefined4 *puVar6;
  long lVar7;
  undefined4 local_130;
  undefined4 uStack_12c;
  undefined4 uStack_128;
  undefined4 uStack_124;
  undefined8 local_120;

  lVar1 = *param_4;
  lVar2 = param_4[1];
  plVar3 = (long *)*param_3;
  lVar7 = param_3[1];
  if (lVar1 != lVar2) {
    puVar6 = (undefined4 *)(param_3[2] + lVar7 * 0x18);
    uVar5 = 0;
    do {
      lVar4 = *(long *)(lVar1 + uVar5 * 8);
      if (*(long *)(lVar4 + 0x28) != 0) {
        func_0x000145bcb2d0();
      }
      FUN_1459b9b70();
      func_0x000145bc97db((int)*(undefined8 *)(lVar4 + 0x40));
      func_0x000145b9c4d0();
      *(undefined8 *)(puVar6 + 4) = local_120;
      *puVar6 = local_130;
      puVar6[1] = uStack_12c;
      puVar6[2] = uStack_128;
      puVar6[3] = uStack_124;
      uVar5 = uVar5 + 1;
      puVar6 = puVar6 + 6;
    } while ((ulong)(lVar2 - lVar1) >> 3 != uVar5);
    lVar7 = lVar7 + uVar5;
  }
  *plVar3 = lVar7;
  return;
}
