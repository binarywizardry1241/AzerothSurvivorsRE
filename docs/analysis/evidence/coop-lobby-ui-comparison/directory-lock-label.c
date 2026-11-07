
undefined8 entry(undefined8 param_1,undefined8 param_2,long param_3,undefined8 param_4)

{
  if ((*(long *)(param_3 + 0xb8) == 6) &&
     ((short)(*(int **)(param_3 + 0xb0))[1] == 0x6369 && **(int **)(param_3 + 0xb0) == 0x6f726568))
  {
    func_0x000145bbfea0(param_3,param_4,0x3e,0x1461c52a4);
  }
  else {
    func_0x000145bbfea0(param_3,param_4,0x30,0x1461c5274);
  }
  func_0x000145bc0330();
  return param_4;
}

