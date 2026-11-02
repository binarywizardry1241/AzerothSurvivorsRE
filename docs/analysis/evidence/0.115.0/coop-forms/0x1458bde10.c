
void entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,undefined8 param_4)

{
  code *pcVar1;
  undefined8 *puVar2;
  undefined8 local_40;
  undefined8 uStack_38;
  undefined8 local_30;
  undefined8 uStack_28;
  undefined8 local_20;
  undefined8 uStack_18;
  undefined8 local_10;

  local_10 = 0xfffffffffffffffe;
  func_0x0001458544c0(param_1,param_2,param_4,&local_40,param_3);
  func_0x000140002200();
  puVar2 = (undefined8 *)func_0x0001400021c0(param_1,param_2,8,0x30);
  if (puVar2 != (undefined8 *)0x0) {
    puVar2[4] = local_20;
    puVar2[5] = uStack_18;
    puVar2[2] = local_30;
    puVar2[3] = uStack_28;
    *puVar2 = local_40;
    puVar2[1] = uStack_38;
    return;
  }
  func_0x000145eb6fb1(param_1,param_2,0x30,8);
                    /* WARNING: Does not return */
  pcVar1 = (code *)invalidInstructionException();
  (*pcVar1)();
}
