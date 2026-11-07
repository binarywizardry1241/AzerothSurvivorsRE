long entry(void)

{
  long lVar1;
  long in_RCX;
  long lVar2;

  lVar2 = *(long *)(in_RCX + 0x30);
  lVar1 = func_0x0001458ec500(*(undefined8 *)(in_RCX + 0x38),lVar2,*(undefined8 *)(in_RCX + 0x38),
                              lVar2);
  if (lVar1 == 0) {
    lVar1 = lVar2;
  }
  return lVar1;
}
