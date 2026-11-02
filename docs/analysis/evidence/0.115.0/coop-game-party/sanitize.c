
void entry(undefined8 param_1,undefined8 param_2,byte *param_3,byte *param_4,long *param_5)

{
  byte *pbVar1;
  byte bVar2;
  byte bVar3;
  long lVar4;
  ulong uVar5;
  undefined1 uVar6;
  ulong uVar7;
  long lVar8;
  uint uVar9;
  byte bVar10;
  uint uVar11;

  do {
    if (param_4 == param_3) {
      return;
    }
    bVar2 = *param_4;
    uVar5 = (ulong)bVar2;
    uVar11 = (uint)bVar2;
    if ((char)bVar2 < '\0') {
      pbVar1 = param_4 + 1;
      if (bVar2 < 0xe0) {
        param_4 = param_4 + 2;
        uVar11 = (uVar11 & 0x1f) << 6 | *pbVar1 & 0x3f;
        uVar5 = (ulong)uVar11;
        lVar8 = param_5[2];
        goto joined_r0x0001459e6d7e;
      }
      uVar9 = param_4[2] & 0x3f | (*pbVar1 & 0x3f) << 6;
      if (0xef < bVar2) {
        pbVar1 = param_4 + 3;
        param_4 = param_4 + 4;
        uVar11 = *pbVar1 & 0x3f | uVar9 << 6 | (uVar11 & 7) << 0x12;
        uVar5 = (ulong)uVar11;
        lVar8 = param_5[2];
        goto joined_r0x0001459e6d7e;
      }
      param_4 = param_4 + 3;
      uVar9 = uVar9 | (uVar11 & 0x1f) << 0xc;
      uVar5 = (ulong)uVar9;
      lVar8 = param_5[2];
      if (uVar9 < 0x3e) goto LAB_1459e6db0;
LAB_1459e6dd4:
      uVar7 = uVar5;
      uVar11 = (uint)uVar7;
      if (uVar11 < 0x80) {
        uVar6 = (undefined1)uVar7;
        if (*param_5 == lVar8) {
LAB_1459e6de3:
          uVar6 = (undefined1)uVar7;
          func_0x000145d14a10(param_5,lVar8,lVar8,param_5,1,1);
        }
        goto LAB_1459e6dc2;
      }
      uVar5 = 4 - (ulong)(uVar11 < 0x10000);
      if (uVar11 < 0x800) {
        uVar5 = 2;
      }
      if ((ulong)(*param_5 - lVar8) < uVar5) {
        func_0x000145d14a10(uVar7,lVar8,lVar8,param_5,uVar5,1);
      }
      uVar11 = (uint)uVar7;
      bVar3 = (byte)uVar7 & 0x3f | 0x80;
      bVar2 = (byte)(uVar7 >> 6);
      lVar4 = param_5[1];
      if (uVar11 < 0x800) {
        *(byte *)(lVar4 + lVar8) = bVar2 | 0xc0;
        *(byte *)(lVar4 + 1 + lVar8) = bVar3;
        lVar4 = 2;
      }
      else {
        bVar10 = bVar2 & 0x3f | 0x80;
        bVar2 = (byte)(uVar7 >> 0xc);
        if (uVar11 < 0x10000) {
          *(byte *)(lVar4 + lVar8) = bVar2 | 0xe0;
          *(byte *)(lVar4 + 1 + lVar8) = bVar10;
          *(byte *)(lVar4 + 2 + lVar8) = bVar3;
          lVar4 = 3;
        }
        else {
          *(byte *)(lVar4 + lVar8) = (byte)(uVar11 >> 0x12) | 0xf0;
          *(byte *)(lVar4 + 1 + lVar8) = bVar2 & 0x3f | 0x80;
          *(byte *)(lVar4 + 2 + lVar8) = bVar10;
          *(byte *)(lVar4 + 3 + lVar8) = bVar3;
          lVar4 = 4;
        }
      }
    }
    else {
      param_4 = param_4 + 1;
      lVar8 = param_5[2];
joined_r0x0001459e6d7e:
      if (0x3d < uVar11) goto LAB_1459e6dd4;
LAB_1459e6db0:
      uVar7 = 0x20;
      uVar6 = 0x20;
      if ((0x2800100000000200U >> (uVar5 & 0x3f) & 1) == 0) goto LAB_1459e6dd4;
      if (*param_5 == lVar8) goto LAB_1459e6de3;
LAB_1459e6dc2:
      *(undefined1 *)(param_5[1] + lVar8) = uVar6;
      lVar4 = 1;
    }
    param_5[2] = lVar4 + lVar8;
  } while( true );
}
