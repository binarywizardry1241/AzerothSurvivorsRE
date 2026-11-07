
void FUN_1459e6cb0(byte *param_1,byte *param_2,longlong *param_3)

{
  byte *pbVar1;
  byte bVar2;
  longlong lVar3;
  ulonglong uVar4;
  longlong lVar5;
  uint uVar6;
  byte bVar7;
  uint uVar8;
  byte bVar9;

  do {
    if (param_1 == param_2) {
      return;
    }
    bVar2 = *param_1;
    uVar8 = (uint)bVar2;
    if ((char)bVar2 < '\0') {
      pbVar1 = param_1 + 1;
      if (bVar2 < 0xe0) {
        param_1 = param_1 + 2;
        uVar8 = (uVar8 & 0x1f) << 6 | *pbVar1 & 0x3f;
        lVar5 = param_3[2];
        goto joined_r0x0001459e6d7e;
      }
      uVar6 = param_1[2] & 0x3f | (*pbVar1 & 0x3f) << 6;
      if (0xef < bVar2) {
        pbVar1 = param_1 + 3;
        param_1 = param_1 + 4;
        uVar8 = *pbVar1 & 0x3f | uVar6 << 6 | (uVar8 & 7) << 0x12;
        lVar5 = param_3[2];
        goto joined_r0x0001459e6d7e;
      }
      param_1 = param_1 + 3;
      uVar8 = uVar6 | (uVar8 & 0x1f) << 0xc;
      lVar5 = param_3[2];
      if (uVar8 < 0x3e) goto LAB_1459e6db0;
LAB_1459e6dd4:
      bVar2 = (byte)uVar8;
      if (uVar8 < 0x80) {
        bVar7 = bVar2;
        if (*param_3 == lVar5) {
LAB_1459e6de3:
          bVar2 = bVar7;
          FUN_145d14a10(param_3,lVar5,1,1,1);
        }
        goto LAB_1459e6dc2;
      }
      uVar4 = 4 - (ulonglong)(uVar8 < 0x10000);
      if (uVar8 < 0x800) {
        uVar4 = 2;
      }
      if ((ulonglong)(*param_3 - lVar5) < uVar4) {
        FUN_145d14a10(param_3,lVar5,uVar4,1,1);
      }
      bVar2 = bVar2 & 0x3f | 0x80;
      lVar3 = param_3[1];
      bVar7 = (byte)(uVar8 >> 6);
      if (uVar8 < 0x800) {
        *(byte *)(lVar3 + lVar5) = bVar7 | 0xc0;
        *(byte *)(lVar3 + 1 + lVar5) = bVar2;
        lVar3 = 2;
      }
      else {
        bVar7 = bVar7 & 0x3f | 0x80;
        bVar9 = (byte)(uVar8 >> 0xc);
        if (uVar8 < 0x10000) {
          *(byte *)(lVar3 + lVar5) = bVar9 | 0xe0;
          *(byte *)(lVar3 + 1 + lVar5) = bVar7;
          *(byte *)(lVar3 + 2 + lVar5) = bVar2;
          lVar3 = 3;
        }
        else {
          *(byte *)(lVar3 + lVar5) = (byte)(uVar8 >> 0x12) | 0xf0;
          *(byte *)(lVar3 + 1 + lVar5) = bVar9 & 0x3f | 0x80;
          *(byte *)(lVar3 + 2 + lVar5) = bVar7;
          *(byte *)(lVar3 + 3 + lVar5) = bVar2;
          lVar3 = 4;
        }
      }
    }
    else {
      param_1 = param_1 + 1;
      lVar5 = param_3[2];
joined_r0x0001459e6d7e:
      if (0x3d < uVar8) goto LAB_1459e6dd4;
LAB_1459e6db0:
      bVar2 = 0x20;
      if ((0x2800100000000200U >> ((ulonglong)uVar8 & 0x3f) & 1) == 0) goto LAB_1459e6dd4;
      bVar7 = 0x20;
      if (*param_3 == lVar5) goto LAB_1459e6de3;
LAB_1459e6dc2:
      *(byte *)(param_3[1] + lVar5) = bVar2;
      lVar3 = 1;
    }
    param_3[2] = lVar3 + lVar5;
  } while( true );
}
