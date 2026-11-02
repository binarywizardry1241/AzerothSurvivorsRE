
ulong entry(undefined8 param_1,undefined8 param_2)

{
  byte *pbVar1;
  ulong uVar2;
  undefined1 auVar3 [16];
  long local_40;

  func_0x000145709e80();
  auVar3 = func_0x000145702f60();
  pbVar1 = auVar3._0_8_;
  if (((auVar3._8_8_ == 3 && pbVar1 != (byte *)0x0) &&
      ((byte)(((byte)(*pbVar1 + 0xbf) < 0x1a) << 5 | *pbVar1) == 0x73)) &&
     ((byte)(((byte)(pbVar1[1] + 0xbf) < 0x1a) << 5 | pbVar1[1]) == 0x61)) {
    uVar2 = CONCAT71((int7)((ulong)param_2 >> 8),
                     (byte)(((byte)(pbVar1[2] + 0xbf) < 0x1a) << 5 | pbVar1[2]) == 0x76);
  }
  else {
    uVar2 = 0;
  }
  if (local_40 != 0) {
    func_0x0001400021d0();
  }
  return uVar2 & 0xffffffff;
}
