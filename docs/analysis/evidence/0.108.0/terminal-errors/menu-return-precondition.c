bool entry(void)

{
  undefined8 *puVar1;
  long lVar2;
  long in_RCX;
  byte bVar3;
  long lVar4;
  undefined8 local_58;
  undefined8 uStack_50;
  undefined8 local_48;

  bVar3 = *(char *)(in_RCX + 0xac7) - 1;
  if (bVar3 < 3) {
    lVar4 = *(long *)(in_RCX + 0x658);
    *(undefined8 *)(in_RCX + 0x658) = 0;
    for (; lVar4 != 0; lVar4 = lVar4 + -1) {
      func_0x00014590fc10();
    }
    *(undefined1 *)(in_RCX + 0xac5) = 0xff;
    *(undefined1 *)(in_RCX + 0xab7) = 1;
    *(undefined1 *)(in_RCX + 0xac7) = 4;
    *(undefined4 *)(in_RCX + 0x978) = 1;
    *(undefined4 *)(in_RCX + 0x97c) = *(undefined4 *)(in_RCX + 0xa34);
    func_0x00014591da20();
    func_0x000145945240();
    lVar4 = *(long *)(in_RCX + 0x640);
    if (lVar4 == *(long *)(in_RCX + 0x630)) {
      func_0x000145bf4cb0();
    }
    lVar2 = *(long *)(in_RCX + 0x638);
    *(undefined8 *)(lVar2 + 0x10 + lVar4 * 0x18) = local_48;
    puVar1 = (undefined8 *)(lVar2 + lVar4 * 0x18);
    *puVar1 = local_58;
    puVar1[1] = uStack_50;
    *(long *)(in_RCX + 0x640) = lVar4 + 1;
  }
  return bVar3 < 3;
}
