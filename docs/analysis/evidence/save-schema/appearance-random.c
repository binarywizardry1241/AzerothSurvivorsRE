ulong entry(void)

{
  byte bVar1;
  long lVar2;
  ulong uVar3;
  ulong uVar4;
  ulong uVar5;
  ulong uVar6;
  ulong uVar7;
  undefined4 in_ECX;
  ulong uVar8;
  ulong uVar9;
  ulong in_R8;
  ulong uVar10;
  ulong uVar11;
  ulong uVar12;

  lVar2 = func_0x0001459a29c0(in_ECX,in_R8);
  uVar11 = 1;
  if (lVar2 == 0) {
    uVar9 = 1;
    uVar8 = 1;
    uVar12 = 1;
    uVar10 = 1;
  }
  else {
    uVar3 = func_0x000145a7d6b0();
    uVar9 = 1;
    uVar8 = 1;
    uVar12 = 1;
    uVar10 = 1;
    if ((uVar3 & 1) != 0) {
      uVar11 = uVar3 >> 8 & 0xffffff;
      uVar8 = uVar3 >> 0x10 & 0xffff;
      uVar11 = (ulong)((int)uVar11 + (uint)((char)uVar11 == '\0') & 0xff);
      uVar9 = (ulong)((int)uVar8 + (uint)((char)uVar8 == '\0') & 0xff);
      uVar8 = (ulong)(((uint)(uVar3 >> 0x18) & 0xff) + (uint)((char)(uVar3 >> 0x18) == '\0') & 0xff)
      ;
      bVar1 = (byte)(uVar3 >> 0x20);
      if (bVar1 < 2) {
        bVar1 = 1;
      }
      uVar12 = (ulong)bVar1;
      bVar1 = (byte)(uVar3 >> 0x28);
      if (bVar1 < 2) {
        bVar1 = 1;
      }
      uVar10 = (ulong)bVar1;
    }
  }
  uVar3 = (in_R8 ^ 0x9e3779b97f4a7c15) << 0xd ^ in_R8 ^ 0x9e3779b97f4a7c15;
  uVar3 = uVar3 >> 7 ^ uVar3;
  uVar3 = uVar3 << 0x11 ^ uVar3;
  uVar4 = uVar3 << 0xd ^ uVar3;
  uVar4 = uVar4 >> 7 ^ uVar4;
  uVar4 = uVar4 << 0x11 ^ uVar4;
  uVar5 = uVar4 << 0xd ^ uVar4;
  uVar5 = uVar5 >> 7 ^ uVar5;
  uVar5 = uVar5 << 0x11 ^ uVar5;
  uVar6 = uVar5 << 0xd ^ uVar5;
  uVar6 = uVar6 >> 7 ^ uVar6;
  uVar6 = uVar6 << 0x11 ^ uVar6;
  uVar7 = uVar6 << 0xd ^ uVar6;
  uVar7 = uVar7 >> 7 ^ uVar7;
  return (ulong)(uint)((int)(uVar4 % uVar9) << 8 | (int)(uVar5 % uVar8) << 0x10) | uVar3 % uVar11 |
         (ulong)(uint)((int)(uVar6 % uVar12) << 0x18) | (uVar7 << 0x11 ^ uVar7) % uVar10 << 0x20;
}
