long entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,long *param_4)

{
  long lVar1;
  long lVar2;
  long *local_60;
  undefined8 local_58;
  long local_50;
  undefined8 local_48;
  undefined8 local_38;
  undefined8 local_30;

  local_30 = 0xfffffffffffffffe;
  local_60 = param_4 + 6;
  local_58 = 0x145f789e0;
  func_0x000145f66f30(param_4,param_2,0x1472c8640,&local_50,&local_60);
  lVar2 = *param_4;
  local_38 = local_48;
  lVar1 = func_0x000145b29ab0();
  if (local_50 != 0) {
    func_0x0001400021d0();
  }
  if (lVar1 == 0) {
    lVar1 = lVar2;
  }
  return lVar1;
}
