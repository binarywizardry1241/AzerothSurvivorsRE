undefined8
FUN_145913300(undefined8 param_1,undefined8 param_2,undefined8 param_3,undefined8 param_4)

{
  long lVar1;
  long lVar2;
  long local_70;
  long local_58;
  long local_50;
  long local_48;
  long local_38;
  undefined8 local_30;

  local_30 = 0xfffffffffffffffe;
  func_0x0001459c8d10(param_1,param_4,0x1472260b8,&local_58,0x1472261d8);
  FUN_14588ad20();
  local_38 = local_70;
  FUN_14590cb30();
  if (local_48 != 0) {
    lVar2 = local_50 + 8;
    lVar1 = local_48;
    do {
      if (*(long *)(lVar2 + -8) != 0) {
        func_0x0001400021d0();
      }
      lVar2 = lVar2 + 0x18;
      lVar1 = lVar1 + -1;
    } while (lVar1 != 0);
  }
  if (local_58 != 0) {
    func_0x0001400021d0();
  }
  if (local_38 != 0) {
    func_0x0001400021d0();
  }
  return param_4;
}
