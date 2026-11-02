
void entry(void)

{
  undefined8 *puVar1;
  undefined4 *puVar2;
  long lVar3;
  long in_RCX;
  long lVar4;
  undefined4 local_48;
  undefined4 uStack_44;
  undefined4 uStack_40;
  undefined4 uStack_3c;
  undefined4 local_38;
  undefined4 uStack_34;
  undefined4 uStack_30;
  undefined4 uStack_2c;

  if (((*(int *)(in_RCX + 0xab8) != 0) && (*(char *)(in_RCX + 0xc46) == '\x01')) &&
     (*(char *)(in_RCX + 0xc34) == '\0')) {
    *(undefined1 *)(in_RCX + 0xc46) = 5;
    func_0x00014590b540();
    func_0x0001459a9890();
    lVar4 = *(long *)(in_RCX + 0x640);
    if (lVar4 == *(long *)(in_RCX + 0x630)) {
      func_0x000145d150f0();
    }
    lVar3 = *(long *)(in_RCX + 0x638);
    puVar2 = (undefined4 *)(lVar3 + 0x10 + lVar4 * 0x20);
    *puVar2 = local_38;
    puVar2[1] = uStack_34;
    puVar2[2] = uStack_30;
    puVar2[3] = uStack_2c;
    puVar2 = (undefined4 *)(lVar3 + lVar4 * 0x20);
    *puVar2 = local_48;
    puVar2[1] = uStack_44;
    puVar2[2] = uStack_40;
    puVar2[3] = uStack_3c;
    *(long *)(in_RCX + 0x640) = lVar4 + 1;
    *(int *)(in_RCX + 0x560) = *(int *)(in_RCX + 0x560) + 1;
    func_0x00014591f650();
    lVar4 = *(long *)(in_RCX + 0x658);
    if (lVar4 == *(long *)(in_RCX + 0x648)) {
      func_0x000145d14e50();
    }
    lVar3 = *(long *)(in_RCX + 0x650);
    *(ulong *)(lVar3 + 0x10 + lVar4 * 0x18) = CONCAT44(uStack_34,local_38);
    puVar1 = (undefined8 *)(lVar3 + lVar4 * 0x18);
    *puVar1 = CONCAT44(uStack_44,local_48);
    puVar1[1] = CONCAT44(uStack_3c,uStack_40);
    *(long *)(in_RCX + 0x658) = lVar4 + 1;
  }
  return;
}
