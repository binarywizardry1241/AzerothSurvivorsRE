/* WARNING: Type propagation algorithm not settling */

ulong entry(undefined8 param_1,undefined8 param_2,undefined4 param_3,ulong param_4)

{
  char cVar1;
  char cVar2;
  byte bVar3;
  long lVar4;
  ulong uVar5;
  byte bVar6;
  byte bVar7;
  byte bVar8;
  uint uVar9;
  char cVar10;
  byte bVar11;
  uint uVar12;

  lVar4 = func_0x0001459a29c0(param_3);
  if (lVar4 == 0) {
    return param_4;
  }
  uVar5 = func_0x000145a7d6b0();
  if ((uVar5 & 1) == 0) {
    return param_4;
  }
  cVar1 = (char)(uVar5 >> 8);
  cVar10 = (char)(uVar5 >> 0x20);
  cVar2 = (char)(uVar5 >> 0x10);
  if (cVar1 == '\0') {
    bVar6 = 0;
  }
  else {
    bVar6 = cVar1 - 1;
    if ((byte)param_4 <= bVar6) {
      bVar6 = (byte)param_4;
    }
  }
  if (cVar2 == '\0') {
    bVar7 = 0;
  }
  else {
    bVar8 = cVar2 - 1;
    bVar7 = (byte)(param_4 >> 8);
    if (bVar8 < bVar7) {
      bVar7 = bVar8;
    }
  }
  if ((uint)uVar5 >> 0x18 == 0) {
    uVar9 = 0;
  }
  else {
    bVar8 = (char)(uVar5 >> 0x18) - 1;
    uVar9 = (uint)(param_4 >> 0x10) & 0xff;
    if (bVar8 < (byte)(param_4 >> 0x10)) {
      uVar9 = (uint)bVar8;
    }
  }
  if (cVar10 == '\0') {
    bVar8 = 0;
  }
  else {
    bVar11 = cVar10 - 1;
    bVar8 = (byte)(param_4 >> 0x18);
    if (bVar11 < bVar8) {
      bVar8 = bVar11;
    }
  }
  if ((uVar5 >> 0x28 & 0xff) == 0) {
    uVar12 = 0;
  }
  else {
    bVar3 = (char)(uVar5 >> 0x28) - 1;
    bVar11 = (byte)(param_4 >> 0x20);
    if (bVar3 < bVar11) {
      bVar11 = bVar3;
    }
    uVar12 = (uint)bVar11;
  }
  return (ulong)bVar6 |
         (ulong)bVar7 << 8 | (ulong)(uVar9 << 0x10) | (ulong)bVar8 << 0x18 | (ulong)uVar12 << 0x20;
}
