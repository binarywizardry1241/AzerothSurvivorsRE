
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(void)

{
  undefined4 *puVar1;
  undefined8 *puVar2;
  char cVar3;
  long lVar4;
  long lVar5;
  long in_RCX;
  undefined4 local_60;
  undefined4 uStack_5c;
  undefined4 uStack_58;
  undefined4 uStack_54;
  undefined4 local_50;
  undefined4 uStack_4c;
  undefined4 uStack_48;
  undefined4 uStack_44;
  undefined8 local_40;

  local_40 = 0xfffffffffffffffe;
  if (*(char *)(in_RCX + 0xc12) == '\x05') {
    cVar3 = *(char *)(in_RCX + 0xc00);
    *(undefined1 *)(in_RCX + 0xc00) = 1;
    *(undefined1 *)(in_RCX + 0xc12) = 1;
    *(float *)(in_RCX + 0xbc8) = *(float *)(in_RCX + 0xb6c) + _DAT_147004000;
    func_0x0001458cada0(in_RCX + 0x620,in_RCX,*(undefined8 *)(in_RCX + 0x468),&local_60,
                        *(undefined4 *)(in_RCX + 0x550));
    lVar4 = *(long *)(in_RCX + 0x630);
    if (lVar4 == *(long *)(in_RCX + 0x620)) {
      func_0x000145cfa0e0();
    }
    lVar5 = *(long *)(in_RCX + 0x628);
    puVar1 = (undefined4 *)(lVar5 + 0x10 + lVar4 * 0x20);
    *puVar1 = local_50;
    puVar1[1] = uStack_4c;
    puVar1[2] = uStack_48;
    puVar1[3] = uStack_44;
    puVar1 = (undefined4 *)(lVar5 + lVar4 * 0x20);
    *puVar1 = local_60;
    puVar1[1] = uStack_5c;
    puVar1[2] = uStack_58;
    puVar1[3] = uStack_54;
    *(long *)(in_RCX + 0x630) = lVar4 + 1;
    *(int *)(in_RCX + 0x550) = *(int *)(in_RCX + 0x550) + 1;
    if (cVar3 == '\0') {
      func_0x000145895720();
      func_0x000145895720();
      func_0x0001458c8a40();
      lVar4 = *(long *)(in_RCX + 0x630);
      if (lVar4 == *(long *)(in_RCX + 0x620)) {
        func_0x000145cfa0e0();
      }
      lVar5 = *(long *)(in_RCX + 0x628);
      puVar2 = (undefined8 *)(lVar5 + 0x10 + lVar4 * 0x20);
      *puVar2 = CONCAT44(uStack_4c,local_50);
      puVar2[1] = CONCAT44(uStack_44,uStack_48);
      puVar2 = (undefined8 *)(lVar5 + lVar4 * 0x20);
      *puVar2 = CONCAT44(uStack_5c,local_60);
      puVar2[1] = CONCAT44(uStack_54,uStack_58);
      *(long *)(in_RCX + 0x630) = lVar4 + 1;
    }
  }
  return;
}
