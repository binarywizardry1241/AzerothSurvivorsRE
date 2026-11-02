void entry(undefined8 param_1,undefined8 param_2,long param_3,long param_4,undefined8 *param_5)

{
  long *plVar1;
  undefined8 uVar2;
  undefined8 uVar3;
  undefined8 uVar4;
  long lVar5;
  long lVar6;
  long lVar7;
  undefined8 *puVar8;
  undefined8 local_90;
  undefined8 uStack_88;
  undefined8 local_80;
  undefined4 local_70;
  undefined4 uStack_6c;
  undefined4 uStack_68;
  undefined4 uStack_64;

  plVar1 = (long *)*param_5;
  lVar7 = param_5[1];
  if (param_4 != param_3) {
    puVar8 = (undefined8 *)(lVar7 * 0x38 + param_5[2]);
    lVar6 = -((ulong)(param_3 - param_4) / 0x38);
    lVar5 = 0;
    do {
      uVar2 = *(undefined8 *)(param_4 + 0x18);
      func_0x000145bcd2f0();
      uVar3 = *(undefined8 *)(param_4 + 0x20);
      uVar4 = *(undefined8 *)(param_4 + 0x28);
      puVar8[6] = *(undefined8 *)(param_4 + 0x30);
      puVar8[2] = local_80;
      puVar8[3] = uVar2;
      *puVar8 = local_90;
      puVar8[1] = uStack_88;
      local_70 = (undefined4)uVar3;
      uStack_6c = (undefined4)((ulong)uVar3 >> 0x20);
      uStack_68 = (undefined4)uVar4;
      uStack_64 = (undefined4)((ulong)uVar4 >> 0x20);
      *(undefined4 *)(puVar8 + 4) = local_70;
      *(undefined4 *)((long)puVar8 + 0x24) = uStack_6c;
      *(undefined4 *)(puVar8 + 5) = uStack_68;
      *(undefined4 *)((long)puVar8 + 0x2c) = uStack_64;
      lVar5 = lVar5 + -1;
      puVar8 = puVar8 + 7;
      param_4 = param_4 + 0x38;
    } while (lVar6 != lVar5);
    lVar7 = lVar7 - lVar5;
  }
  *plVar1 = lVar7;
  return;
}
