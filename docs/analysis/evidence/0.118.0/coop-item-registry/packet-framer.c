void entry(undefined8 param_1,undefined8 param_2,long param_3,long param_4,long *param_5)

{
  ushort uVar1;
  code *pcVar2;
  byte bVar3;
  ulong uVar4;
  long lVar5;
  byte bVar6;
  int iVar7;
  ulong uVar9;
  long lVar10;
  byte bVar11;
  char cVar12;
  uint uVar13;
  uint uVar14;
  uint uVar15;
  uint uVar8;

  uVar9 = *(ulong *)(param_3 + 0x10);
  if (0xfffd < uVar9) {
    return;
  }
  iVar7 = (int)uVar9 + 2;
  uVar8 = (uint)(ushort)((ushort)iVar7 >> 8);
  uVar14 = (uint)((ushort)iVar7 & 0xff);
  uVar1 = *(ushort *)(param_3 + 0x18);
  uVar15 = (uint)uVar1;
  uVar13 = (uint)(uVar1 >> 8);
  if (*(char *)(param_4 + 0x30) == '\x01') {
    uVar4 = (ulong)*(byte *)(param_4 + 0x59);
    if (0x27 < uVar4) {
LAB_145b5b3e8:
      func_0x00014613b0d3(param_1,uVar9,0x28,uVar4,0x1475e2c70);
                    /* WARNING: Does not return */
      pcVar2 = (code *)invalidInstructionException();
      (*pcVar2)();
    }
    bVar6 = ((byte)((uint)iVar7 >> 8) ^ *(byte *)(param_4 + 0x31 + uVar4)) +
            *(char *)(param_4 + 0x5a);
    uVar8 = (uint)bVar6;
    bVar3 = *(byte *)(param_4 + 0x59) + 1;
    if (bVar3 == 0x28) {
      bVar3 = 0;
    }
    *(byte *)(param_4 + 0x59) = bVar3;
    *(byte *)(param_4 + 0x5a) = bVar6;
    uVar4 = 0x28;
    if (0x27 < bVar3) goto LAB_145b5b3e8;
    bVar6 = ((byte)iVar7 ^ *(byte *)(param_4 + 0x31 + (ulong)bVar3)) + bVar6;
    uVar14 = (uint)bVar6;
    bVar11 = bVar3 + 1;
    if ((byte)(bVar3 + 1) == 0x28) {
      bVar11 = 0;
    }
    *(byte *)(param_4 + 0x59) = bVar11;
    *(byte *)(param_4 + 0x5a) = bVar6;
    if (0x27 < bVar11) goto LAB_145b5b3e8;
    bVar6 = (*(byte *)(param_4 + 0x31 + (ulong)bVar11) ^ (byte)uVar1) + bVar6;
    uVar15 = (uint)bVar6;
    bVar11 = bVar11 + 1;
    if (bVar11 == 0x28) {
      bVar11 = 0;
    }
    *(byte *)(param_4 + 0x59) = bVar11;
    *(byte *)(param_4 + 0x5a) = bVar6;
    if (0x27 < bVar11) goto LAB_145b5b3e8;
    bVar6 = ((byte)(uVar1 >> 8) ^ *(byte *)(param_4 + 0x31 + (ulong)bVar11)) + bVar6;
    uVar13 = (uint)bVar6;
    cVar12 = bVar11 + 1;
    if (cVar12 == '(') {
      cVar12 = '\0';
    }
    *(char *)(param_4 + 0x59) = cVar12;
    *(byte *)(param_4 + 0x5a) = bVar6;
  }
  lVar5 = *param_5;
  lVar10 = param_5[2];
  if ((ulong)(lVar5 - lVar10) < 4) {
    func_0x000145f94170(lVar10,uVar9,lVar10,param_5,4,1);
    lVar5 = *param_5;
    lVar10 = param_5[2];
  }
  *(uint *)(param_5[1] + lVar10) = uVar8 | uVar14 << 8 | (uVar15 & 0xff) << 0x10 | uVar13 << 0x18;
  lVar10 = lVar10 + 4;
  param_5[2] = lVar10;
  if ((ulong)(lVar5 - lVar10) < uVar9) {
    func_0x000145f94170();
    lVar10 = param_5[2];
  }
  else if (uVar9 == 0) goto LAB_145b5b362;
  func_0x000145f93d5b();
LAB_145b5b362:
  param_5[2] = lVar10 + uVar9;
  return;
}
