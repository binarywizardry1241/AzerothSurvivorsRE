void FUN_145fc32b2(longlong param_1,undefined8 param_2)

{
  undefined1 uStack_21;
  undefined8 *puStack_20;
  undefined8 uStack_18;
  longlong lStack_10;
  undefined1 *puStack_8;

  if (*(int *)(param_1 + 8) != 0) {
    puStack_20 = &uStack_18;
    puStack_8 = &uStack_21;
    uStack_18 = param_2;
    lStack_10 = param_1;
    FUN_146139ce0(param_1 + 8,CONCAT71((int7)((ulonglong)puStack_8 >> 8),1),&puStack_20,
                  &DAT_14620f5c8,&DAT_14620f640);
  }
  return;
}
