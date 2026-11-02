long * entry(undefined8 param_1,undefined8 param_2,byte *param_3,long *param_4,long param_5)

{
  byte *pbVar1;
  byte bVar2;
  code *pcVar3;
  byte bVar4;
  long lVar5;
  byte *pbVar6;
  uint uVar7;
  ulong uVar8;
  byte bVar9;
  uint uVar10;
  bool bVar11;
  long local_60;
  long local_58;
  long local_50;

  if (-1 < param_5) {
    if (param_5 == 0) {
      local_60 = 0;
      local_58 = 1;
      local_50 = 0;
    }
    else {
      func_0x000140002200();
      local_58 = func_0x0001400021c0();
      if (local_58 == 0) goto LAB_1458a8fc8;
      pbVar6 = param_3 + param_5;
      bVar11 = true;
      local_50 = 0;
      do {
        bVar2 = *param_3;
        uVar7 = (uint)bVar2;
        if ((char)bVar2 < '\0') {
          pbVar1 = param_3 + 1;
          if (bVar2 < 0xe0) {
            param_3 = param_3 + 2;
            uVar7 = (uVar7 & 0x1f) << 6 | *pbVar1 & 0x3f;
            goto joined_r0x0001458a9114;
          }
          uVar10 = param_3[2] & 0x3f | (*pbVar1 & 0x3f) << 6;
          if (bVar2 < 0xf0) {
            param_3 = param_3 + 3;
            uVar7 = uVar10 | (uVar7 & 0x1f) << 0xc;
            goto joined_r0x0001458a9114;
          }
          pbVar1 = param_3 + 3;
          param_3 = param_3 + 4;
          uVar7 = *pbVar1 & 0x3f | uVar10 << 6 | (uVar7 & 7) << 0x12;
          if (!bVar11) goto LAB_1458a9120;
LAB_1458a90f0:
          uVar10 = uVar7;
          if (0x19 < uVar7 - 0x61) goto LAB_1458a9136;
          uVar10 = uVar7 & 0x5f;
LAB_1458a913f:
          if (param_5 == local_50) {
            func_0x000145bfa970();
          }
          *(char *)(local_58 + local_50) = (char)uVar10;
          lVar5 = 1;
        }
        else {
          param_3 = param_3 + 1;
joined_r0x0001458a9114:
          if (bVar11) goto LAB_1458a90f0;
LAB_1458a9120:
          uVar10 = uVar7 | 0x20;
          if (0x19 < uVar7 - 0x41) {
            uVar10 = uVar7;
          }
LAB_1458a9136:
          if (uVar10 < 0x80) goto LAB_1458a913f;
          uVar8 = 4 - (ulong)(uVar10 < 0x10000);
          if (uVar10 < 0x800) {
            uVar8 = 2;
          }
          if ((ulong)(param_5 - local_50) < uVar8) {
            func_0x000145bfa970();
          }
          bVar9 = (byte)uVar10 & 0x3f | 0x80;
          bVar2 = (byte)(uVar10 >> 6);
          if (uVar10 < 0x800) {
            *(byte *)(local_58 + local_50) = bVar2 | 0xc0;
            *(byte *)(local_58 + 1 + local_50) = bVar9;
            lVar5 = 2;
          }
          else {
            bVar4 = bVar2 & 0x3f | 0x80;
            bVar2 = (byte)(uVar10 >> 0xc);
            if (uVar10 < 0x10000) {
              *(byte *)(local_58 + local_50) = bVar2 | 0xe0;
              *(byte *)(local_58 + 1 + local_50) = bVar4;
              *(byte *)(local_58 + 2 + local_50) = bVar9;
              lVar5 = 3;
            }
            else {
              *(byte *)(local_58 + local_50) = (byte)(uVar10 >> 0x12) | 0xf0;
              *(byte *)(local_58 + 1 + local_50) = bVar2 & 0x3f | 0x80;
              *(byte *)(local_58 + 2 + local_50) = bVar4;
              *(byte *)(local_58 + 3 + local_50) = bVar9;
              lVar5 = 4;
            }
          }
        }
        local_50 = local_50 + lVar5;
        bVar11 = uVar7 == 0x20;
        local_60 = param_5;
      } while (param_3 != pbVar6);
    }
    param_4[2] = local_50;
    *param_4 = local_60;
    param_4[1] = local_58;
    return param_4;
  }
LAB_1458a8fc8:
  func_0x000145d992bb();
                    /* WARNING: Does not return */
  pcVar3 = (code *)invalidInstructionException();
  (*pcVar3)();
}
