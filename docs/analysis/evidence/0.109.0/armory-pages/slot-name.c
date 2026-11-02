long entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,byte param_4)

{
  long lVar1;
  long lVar2;
  byte *local_68;
  undefined8 local_60;
  long local_58;
  undefined8 local_50;
  undefined8 local_40;
  byte local_31 [9];

  local_31[1] = 0xfe;
  local_31[2] = 0xff;
  local_31[3] = 0xff;
  local_31[4] = 0xff;
  local_31[5] = 0xff;
  local_31[6] = 0xff;
  local_31[7] = 0xff;
  local_31[8] = 0xff;
  local_68 = local_31;
  local_60 = 0x145bdb210;
  local_31[0] = param_4;
  func_0x000145bcce30(param_1,param_2,0x14722f886,&local_58,&local_68);
  if (((byte)(0x383f5 >> (local_31[0] & 0x1f)) & local_31[0] < 0x12) == 1) {
    lVar2 = *(long *)((ulong)local_31[0] * 8 + 0x147235d80);
  }
  else {
    lVar2 = 1;
  }
  local_40 = local_50;
  lVar1 = func_0x0001458ec500();
  if (local_58 != 0) {
    func_0x0001400021d0();
  }
  if (lVar1 == 0) {
    lVar1 = lVar2;
  }
  return lVar1;
}
