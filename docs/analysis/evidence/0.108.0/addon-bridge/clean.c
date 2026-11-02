void entry(undefined8 param_1,undefined8 param_2,byte *param_3,undefined8 *param_4,byte *param_5,
          uint *param_6)

{
  byte bVar1;
  uint uVar2;
  byte *pbVar3;
  ulong uVar4;
  ulong uVar5;
  uint uVar6;
  uint uVar7;
  byte *pbVar8;
  byte *pbVar9;
  byte *pbVar10;
  long local_58;
  byte *local_50;

  local_58 = 0;
  uVar4 = (ulong)*param_6;
  uVar2 = param_6[1];
  uVar5 = (ulong)param_6[2];
  local_50 = (byte *)0x0;
  pbVar3 = param_3;
  pbVar9 = local_50;
  while (pbVar8 = pbVar9, pbVar3 != param_3 + (long)param_5) {
    bVar1 = *pbVar3;
    uVar6 = (uint)bVar1;
    if ((char)bVar1 < '\0') {
      if (bVar1 < 0xe0) {
        pbVar10 = pbVar3 + 2;
        uVar6 = (uVar6 & 0x1f) << 6 | pbVar3[1] & 0x3f;
      }
      else {
        uVar7 = pbVar3[2] & 0x3f | (pbVar3[1] & 0x3f) << 6;
        if (bVar1 < 0xf0) {
          pbVar10 = pbVar3 + 3;
          uVar6 = uVar7 | (uVar6 & 0x1f) << 0xc;
        }
        else {
          pbVar10 = pbVar3 + 4;
          uVar6 = pbVar3[3] & 0x3f | uVar7 << 6 | (uVar6 & 7) << 0x12;
        }
      }
    }
    else {
      pbVar10 = pbVar3 + 1;
    }
    pbVar9 = pbVar10 + ((long)pbVar8 - (long)pbVar3);
    pbVar3 = pbVar10;
    if ((((uint)uVar4 == uVar6) || (uVar2 == uVar6)) || ((uint)uVar5 == uVar6)) {
      if ((ulong)-local_58 < (ulong)((long)pbVar8 - (long)local_50)) {
        func_0x000145bf4a90();
      }
      if (pbVar8 != local_50) {
        func_0x000145bf293b();
      }
      local_58 = local_58 + ((long)pbVar8 - (long)local_50);
      if (local_58 == 0) {
        func_0x000145bf4a90();
      }
      *(undefined1 *)(local_58 + 1) = 0x20;
      local_58 = local_58 + 1;
      local_50 = pbVar9;
    }
  }
  if ((ulong)-local_58 < (ulong)((long)param_5 - (long)local_50)) {
    func_0x000145bf4a90();
  }
  if (param_5 != local_50) {
    func_0x000145bf293b();
  }
  param_4[2] = local_58 + ((long)param_5 - (long)local_50);
  *param_4 = 0;
  param_4[1] = 1;
  return;
}
