uint * entry(undefined8 param_1,undefined8 param_2,long param_3,uint *param_4)

{
  uint uVar1;
  ulong uVar2;
  byte bVar3;
  uint uVar4;
  uint uVar5;
  uint uVar6;
  uint uVar7;
  uint uVar8;
  uint uVar9;
  uint uVar10;
  uint uVar11;
  uint uVar12;
  uint local_50;
  uint local_4c;
  uint local_48;
  uint local_44;
  uint local_40;
  uint local_3c;
  uint local_38;
  uint local_34;

  uVar2 = param_3 * 0x5851f42d4c957f2d + 0xa17654e46fbe17f3;
  uVar4 = (uint)(uVar2 >> 0x2d) ^ (uint)(uVar2 >> 0x1b);
  bVar3 = (byte)(uVar2 >> 0x3b);
  uVar4 = uVar4 >> bVar3 | uVar4 << 0x20 - bVar3;
  uVar2 = uVar2 * 0x5851f42d4c957f2d + 0xa17654e46fbe17f3;
  uVar7 = (uint)(uVar2 >> 0x2d) ^ (uint)(uVar2 >> 0x1b);
  bVar3 = (byte)(uVar2 >> 0x3b);
  uVar7 = uVar7 >> bVar3 | uVar7 << 0x20 - bVar3;
  uVar2 = uVar2 * 0x5851f42d4c957f2d + 0xa17654e46fbe17f3;
  uVar8 = (uint)(uVar2 >> 0x2d) ^ (uint)(uVar2 >> 0x1b);
  bVar3 = (byte)(uVar2 >> 0x3b);
  uVar8 = uVar8 >> bVar3 | uVar8 << 0x20 - bVar3;
  uVar2 = uVar2 * 0x5851f42d4c957f2d + 0xa17654e46fbe17f3;
  uVar9 = (uint)(uVar2 >> 0x2d) ^ (uint)(uVar2 >> 0x1b);
  bVar3 = (byte)(uVar2 >> 0x3b);
  uVar9 = uVar9 >> bVar3 | uVar9 << 0x20 - bVar3;
  uVar2 = uVar2 * 0x5851f42d4c957f2d + 0xa17654e46fbe17f3;
  uVar5 = (uint)(uVar2 >> 0x2d) ^ (uint)(uVar2 >> 0x1b);
  bVar3 = (byte)(uVar2 >> 0x3b);
  uVar5 = uVar5 >> bVar3 | uVar5 << 0x20 - bVar3;
  uVar2 = uVar2 * 0x5851f42d4c957f2d + 0xa17654e46fbe17f3;
  uVar11 = (uint)(uVar2 >> 0x2d) ^ (uint)(uVar2 >> 0x1b);
  bVar3 = (byte)(uVar2 >> 0x3b);
  uVar11 = uVar11 >> bVar3 | uVar11 << 0x20 - bVar3;
  uVar2 = uVar2 * 0x5851f42d4c957f2d + 0xa17654e46fbe17f3;
  uVar12 = (uint)(uVar2 >> 0x2d) ^ (uint)(uVar2 >> 0x1b);
  bVar3 = (byte)(uVar2 >> 0x3b);
  uVar12 = uVar12 >> bVar3 | uVar12 << 0x20 - bVar3;
  uVar2 = uVar2 * 0x5851f42d4c957f2d + 0xa17654e46fbe17f3;
  uVar10 = (uint)(uVar2 >> 0x2d) ^ (uint)(uVar2 >> 0x1b);
  bVar3 = (byte)(uVar2 >> 0x3b);
  uVar10 = uVar10 >> bVar3 | uVar10 << 0x20 - bVar3;
  uVar1 = uVar7 | uVar8 | uVar9 | uVar5 | uVar11 | uVar12;
  uVar6 = ((uVar1 | uVar4) >> 8 | (uVar1 | uVar4) >> 0x10 | uVar4 | uVar1) & 0xff;
  if ((uVar1 >> 0x18 == 0 && (((uVar10 & 0xffffff) == 0 && uVar4 >> 0x18 == 0) && uVar6 == 0)) &&
     (uVar10 < 0x1000000)) {
    func_0x000145a5f7c0(uVar6,param_4,0,&local_50);
    uVar4 = local_50;
    uVar7 = local_4c;
    uVar8 = local_48;
    uVar9 = local_44;
    uVar5 = local_40;
    uVar11 = local_3c;
    uVar12 = local_38;
    uVar10 = local_34;
  }
  local_34 = uVar10;
  local_38 = uVar12;
  local_3c = uVar11;
  local_40 = uVar5;
  local_44 = uVar9;
  local_48 = uVar8;
  local_4c = uVar7;
  local_50 = uVar4;
  param_4[4] = local_40;
  param_4[5] = local_3c;
  param_4[6] = local_38;
  param_4[7] = local_34;
  *param_4 = local_50;
  param_4[1] = local_4c;
  param_4[2] = local_48;
  param_4[3] = local_44;
  return param_4;
}
