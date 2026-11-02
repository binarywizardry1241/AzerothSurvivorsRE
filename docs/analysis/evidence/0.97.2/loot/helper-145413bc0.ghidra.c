
undefined8 entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,undefined8 param_4)

{
  long lVar1;
  long lVar2;
  long local_48;
  long local_40;
  long local_38;
  undefined8 local_30;

  local_30 = 0xfffffffffffffffe;
  func_0x000145414120(param_1,param_4,param_3,&local_48);
  func_0x0001454139e0();
  func_0x000145533e20();
  if (local_38 != 0) {
    lVar1 = local_40 + 8;
    lVar2 = local_38;
    do {
      if (*(long *)(lVar1 + -8) != 0) {
        func_0x0001400021d0();
      }
      lVar1 = lVar1 + 0x18;
      lVar2 = lVar2 + -1;
    } while (lVar2 != 0);
  }
  if (local_48 != 0) {
    func_0x0001400021d0();
  }
  return param_4;
}
