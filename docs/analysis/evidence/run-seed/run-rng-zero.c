void entry(undefined8 param_1,undefined8 param_2,long param_3,ulong *param_4)

{
  ulong uVar1;
  ulong uVar2;
  ulong uVar3;
  ulong uVar4;
  ulong uVar5;

  uVar3 = (param_3 + 0x9e3779b97f4a7c15U >> 0x1e ^ param_3 + 0x9e3779b97f4a7c15U) *
          -0x40a7b892e31b1a47;
  uVar3 = (uVar3 >> 0x1b ^ uVar3) * -0x6b2fb644ecceee15;
  uVar5 = (param_3 + 0x3c6ef372fe94f82aU >> 0x1e ^ param_3 + 0x3c6ef372fe94f82aU) *
          -0x40a7b892e31b1a47;
  uVar4 = (uVar5 >> 0x1b ^ uVar5) * -0x6b2fb644ecceee15;
  uVar5 = (param_3 + 0xdaa66d2c7ddf743fU >> 0x1e ^ param_3 + 0xdaa66d2c7ddf743fU) *
          -0x40a7b892e31b1a47;
  uVar1 = (uVar5 >> 0x1b ^ uVar5) * -0x6b2fb644ecceee15;
  uVar5 = (param_3 + 0x78dde6e5fd29f054U >> 0x1e ^ param_3 + 0x78dde6e5fd29f054U) *
          -0x40a7b892e31b1a47;
  uVar2 = (uVar5 >> 0x1b ^ uVar5) * -0x6b2fb644ecceee15;
  uVar5 = uVar2 >> 0x1f ^ uVar2;
  if ((((((uVar3 >> 0x1f == (uVar3 & 0xffffffffff)) && ((uVar3 & 0xff0000000000) == 0)) &&
        (uVar3 >> 0x30 == 0)) &&
       ((uVar4 >> 0x1f == (uVar4 & 0xffffffffff) && ((uVar4 & 0xff0000000000) == 0)))) &&
      ((uVar4 >> 0x30 == 0 &&
       ((uVar1 >> 0x1f == (uVar1 & 0xffffffffff) && ((uVar1 & 0xff0000000000) == 0)))))) &&
     ((uVar1 >> 0x30 == 0 && (((uVar5 & 0xffffffffff) == 0 && (uVar2 >> 0x28 == 0)))))) {
    uVar5 = 0xf88bb8a8724c81ec;
    uVar1 = 0x6c45d188009454f;
    uVar4 = 0x6e789e6aa1b965f4;
    uVar3 = 0xe220a8397b1dcdaf;
  }
  else {
    uVar3 = uVar3 >> 0x1f ^ uVar3;
    uVar4 = uVar4 >> 0x1f ^ uVar4;
    uVar1 = uVar1 >> 0x1f ^ uVar1;
  }
  *param_4 = uVar3;
  param_4[1] = uVar4;
  param_4[2] = uVar1;
  param_4[3] = uVar5;
  return;
}
