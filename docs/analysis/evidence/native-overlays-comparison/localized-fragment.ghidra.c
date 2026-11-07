
undefined4 * entry(void)

{
  undefined4 *in_RCX;
  undefined4 local_60;
  undefined4 uStack_5c;
  undefined4 uStack_58;
  undefined4 uStack_54;
  undefined8 local_50;
  long local_48;
  long local_40;
  long local_38;

  func_0x000140103d00();
  func_0x000140032af0();
  *(undefined8 *)(in_RCX + 4) = local_50;
  *in_RCX = local_60;
  in_RCX[1] = uStack_5c;
  in_RCX[2] = uStack_58;
  in_RCX[3] = uStack_54;
  if (local_38 != 0) {
    local_40 = local_40 + 8;
    do {
      if (*(long *)(local_40 + -8) != 0) {
        func_0x0001400021d0();
      }
      local_40 = local_40 + 0x18;
      local_38 = local_38 + -1;
    } while (local_38 != 0);
  }
  if (local_48 != 0) {
    func_0x0001400021d0();
  }
  return in_RCX;
}
