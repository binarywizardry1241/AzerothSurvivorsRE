void entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,byte *param_4)

{
  byte bVar1;
  long lVar2;
  uint uVar3;
  undefined1 auStack_c [2];
  undefined2 local_a;

  bVar1 = *param_4;
  lVar2 = 3;
  uVar3 = (uint)bVar1;
  if (9 < bVar1) {
    uVar3 = (uint)bVar1 * 0x29 >> 0xc;
    local_a = *(undefined2 *)((ulong)(byte)(bVar1 + (char)uVar3 * -100) * 2 + 0x14726e5ca);
    lVar2 = 1;
  }
  if (bVar1 == 0 || (char)uVar3 != '\0') {
    auStack_c[lVar2] = *(undefined1 *)((ulong)uVar3 * 2 + 0x14726e5cb);
  }
  func_0x000145bd1dd0(param_1,param_2,1,param_3,1,0);
  return;
}
