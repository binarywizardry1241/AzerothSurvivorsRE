void FUN_145b5b2a0(longlong param_1,longlong param_2,longlong *param_3)

{
  ushort uVar1;
  ulonglong uVar2;
  undefined8 uVar3;
  code *pcVar4;
  byte bVar5;
  ulonglong uVar6;
  longlong lVar7;
  longlong lVar8;
  byte bVar9;
  int iVar10;
  longlong lVar12;
  byte bVar13;
  char cVar14;
  uint uVar15;
  uint uVar16;
  uint uVar17;
  uint uVar11;

  uVar2 = *(ulonglong *)(param_2 + 0x10);
  if (0xfffd < uVar2) {
    return;
  }
  iVar10 = (int)uVar2 + 2;
  uVar11 = (uint)(ushort)((ushort)iVar10 >> 8);
  uVar16 = (uint)((ushort)iVar10 & 0xff);
  uVar1 = *(ushort *)(param_2 + 0x18);
  uVar17 = (uint)uVar1;
  uVar15 = (uint)(uVar1 >> 8);
  if (*(char *)(param_1 + 0x30) == '\x01') {
    uVar6 = (ulonglong)*(byte *)(param_1 + 0x59);
    if (0x27 < uVar6) {
LAB_145b5b498:
      FUN_14613b553(uVar6,0x28,&DAT_1475e2c88);
                    /* WARNING: Does not return */
      pcVar4 = (code *)invalidInstructionException();
      (*pcVar4)();
    }
    bVar9 = ((byte)((uint)iVar10 >> 8) ^ *(byte *)(param_1 + 0x31 + uVar6)) +
            *(char *)(param_1 + 0x5a);
    uVar11 = (uint)bVar9;
    bVar5 = *(byte *)(param_1 + 0x59) + 1;
    if (bVar5 == 0x28) {
      bVar5 = 0;
    }
    *(byte *)(param_1 + 0x59) = bVar5;
    *(byte *)(param_1 + 0x5a) = bVar9;
    uVar6 = 0x28;
    if (0x27 < bVar5) goto LAB_145b5b498;
    bVar9 = ((byte)iVar10 ^ *(byte *)(param_1 + 0x31 + (ulonglong)bVar5)) + bVar9;
    uVar16 = (uint)bVar9;
    bVar13 = bVar5 + 1;
    if ((byte)(bVar5 + 1) == 0x28) {
      bVar13 = 0;
    }
    *(byte *)(param_1 + 0x59) = bVar13;
    *(byte *)(param_1 + 0x5a) = bVar9;
    if (0x27 < bVar13) goto LAB_145b5b498;
    bVar9 = (*(byte *)(param_1 + 0x31 + (ulonglong)bVar13) ^ (byte)uVar1) + bVar9;
    uVar17 = (uint)bVar9;
    bVar13 = bVar13 + 1;
    if (bVar13 == 0x28) {
      bVar13 = 0;
    }
    *(byte *)(param_1 + 0x59) = bVar13;
    *(byte *)(param_1 + 0x5a) = bVar9;
    if (0x27 < bVar13) goto LAB_145b5b498;
    bVar9 = ((byte)(uVar1 >> 8) ^ *(byte *)(param_1 + 0x31 + (ulonglong)bVar13)) + bVar9;
    uVar15 = (uint)bVar9;
    cVar14 = bVar13 + 1;
    if (cVar14 == '(') {
      cVar14 = '\0';
    }
    *(char *)(param_1 + 0x59) = cVar14;
    *(byte *)(param_1 + 0x5a) = bVar9;
  }
  lVar7 = *param_3;
  lVar12 = param_3[2];
  if ((ulonglong)(lVar7 - lVar12) < 4) {
    FUN_145f945f0(param_3,lVar12,4,1,1);
    lVar7 = *param_3;
    lVar12 = param_3[2];
  }
  lVar8 = param_3[1];
  *(uint *)(lVar8 + lVar12) = uVar11 | uVar16 << 8 | (uVar17 & 0xff) << 0x10 | uVar15 << 0x18;
  lVar12 = lVar12 + 4;
  param_3[2] = lVar12;
  uVar3 = *(undefined8 *)(param_2 + 8);
  if ((ulonglong)(lVar7 - lVar12) < uVar2) {
    FUN_145f945f0(param_3,lVar12,uVar2,1,1);
    lVar8 = param_3[1];
    lVar12 = param_3[2];
  }
  else if (uVar2 == 0) goto LAB_145b5b412;
  func_0x000145f941db(lVar8 + lVar12,uVar3,uVar2);
LAB_145b5b412:
  param_3[2] = lVar12 + uVar2;
  return;
}
