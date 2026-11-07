
undefined8 entry(undefined8 param_1,undefined8 param_2)

{
  undefined4 extraout_EDX;
  undefined4 local_20;
  undefined4 local_1c;
  char local_18 [8];
  undefined8 local_10;
  
  local_20 = func_0x000145cc1fd0();
  local_1c = extraout_EDX;
  func_0x000145cc1f80(param_1,param_2,&local_20,local_18,0xd53e8000,0x19db1de);
  if (local_18[0] == '\0') {
    return local_10;
  }
  return 0;
}

