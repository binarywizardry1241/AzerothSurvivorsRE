
void entry(undefined8 param_1,undefined8 param_2,undefined8 *param_3,undefined8 *param_4)

{
  undefined4 uVar1;
  undefined8 uVar2;
  undefined4 *puVar3;
  undefined4 *puVar4;
  long lVar5;
  undefined4 *puVar6;
  undefined4 *puVar7;
  long local_d8;
  long local_c0;
  long local_a8;

  uVar2 = param_3[2];
  puVar3 = (undefined4 *)*param_3;
  puVar6 = (undefined4 *)param_3[1];
  puVar4 = (undefined4 *)param_3[3];
  puVar7 = puVar3;
  if (puVar6 != puVar4) {
    do {
      uVar1 = *puVar6;
      func_0x0001459963c0();
      if (local_d8 != -1) {
        lVar5 = local_a8;
        if (local_d8 != 0) {
          func_0x0001400021d0();
        }
        if (local_c0 != 0) {
          func_0x0001400021d0();
        }
        if (lVar5 == 4) {
          *puVar7 = uVar1;
          puVar7 = puVar7 + 1;
        }
      }
      puVar6 = puVar6 + 1;
    } while (puVar6 != puVar4);
  }
  *param_4 = uVar2;
  param_4[1] = puVar3;
  param_4[2] = (ulong)((long)puVar7 - (long)puVar3) >> 2;
  return;
}
