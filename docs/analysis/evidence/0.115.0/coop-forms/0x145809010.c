
long entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,long param_4)

{
  long lVar1;
  long lVar2;
  long local_60 [3];
  undefined8 local_48;
  undefined8 local_38;
  undefined8 local_30;

  local_30 = 0xfffffffffffffffe;
  local_60[0] = param_4 + 8;
  local_60[1] = 0x1400020c0;
  func_0x000145ce7350(param_4,param_2,0x146cb4ef6,local_60 + 2,local_60);
  lVar2 = *(long *)(param_4 + 0x18);
  local_38 = local_48;
  lVar1 = func_0x0001458dff90();
  if (local_60[2] != 0) {
    func_0x0001400021d0();
  }
  if (lVar1 == 0) {
    lVar1 = lVar2;
  }
  return lVar1;
}
