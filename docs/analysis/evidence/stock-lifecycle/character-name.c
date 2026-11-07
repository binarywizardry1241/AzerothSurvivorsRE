undefined8 *
entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,undefined8 *param_4,
     undefined8 param_5)

{
  char cVar1;

  cVar1 = func_0x0001458a8710(param_5,param_4,param_5,param_3);
  if (cVar1 == -1) {
    func_0x000140089200();
    func_0x0001458a8fa0();
  }
  else {
    *param_4 = 0xffffffffffffffff;
  }
  return param_4;
}
