/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined1  [16] entry(undefined8 param_1,undefined8 param_2,long param_3,byte *param_4)

{
  byte bVar1;
  byte *pbVar2;
  byte *pbVar3;
  byte *pbVar4;
  uint uVar5;
  byte *pbVar6;
  byte *pbVar7;
  uint uVar8;
  ulong uVar9;
  byte bVar10;
  undefined1 auVar11 [16];

  pbVar6 = param_4 + param_3;
  if (param_3 == 0) {
    pbVar4 = (byte *)0x0;
    pbVar3 = (byte *)0x0;
    pbVar7 = param_4;
joined_r0x00014008935c:
    do {
      do {
        pbVar2 = pbVar6;
        if (pbVar7 == pbVar2) goto LAB_14008946e;
        uVar5 = (uint)(char)pbVar2[-1];
        if ((int)uVar5 < 0) {
          bVar10 = pbVar2[-2];
          if ((char)bVar10 < -0x40) {
            bVar1 = pbVar2[-3];
            if ((char)bVar1 < -0x40) {
              pbVar6 = pbVar2 + -4;
              uVar5 = bVar1 & 0x3f | (pbVar2[-4] & 7) << 6;
            }
            else {
              pbVar6 = pbVar2 + -3;
              uVar5 = bVar1 & 0xf;
            }
            uVar5 = bVar10 & 0x3f | uVar5 << 6;
          }
          else {
            pbVar6 = pbVar2 + -2;
            uVar5 = bVar10 & 0x1f;
          }
          uVar5 = (uint)(pbVar2[-1] & 0x3f) | uVar5 << 6;
        }
        else {
          pbVar6 = pbVar2 + -1;
        }
      } while ((uVar5 - 9 < 5) || (uVar5 == 0x20));
      if (uVar5 < 0x85) break;
      uVar8 = uVar5 >> 8;
      if (uVar8 < 0x20) {
        if (uVar8 == 0) {
          bVar10 = *(byte *)(_DAT_14808aa80 + ((ulong)uVar5 & 0xff));
        }
        else {
          if (uVar8 != 0x16) break;
          bVar10 = uVar5 == 0x1680;
        }
      }
      else if (uVar8 == 0x20) {
        bVar10 = *(byte *)(_DAT_14808aa80 + ((ulong)uVar5 & 0xff)) >> 1;
      }
      else {
        if (uVar8 != 0x30) break;
        bVar10 = uVar5 == 0x3000;
      }
    } while ((bVar10 & 1) != 0);
    pbVar4 = pbVar2 + ((long)pbVar4 - (long)pbVar7);
  }
  else {
    pbVar3 = (byte *)0x0;
    pbVar4 = param_4;
    do {
      bVar10 = *pbVar4;
      uVar9 = (ulong)bVar10;
      if ((char)bVar10 < '\0') {
        uVar5 = bVar10 & 0x1f;
        if (bVar10 < 0xe0) {
          pbVar7 = pbVar4 + 2;
          uVar9 = (ulong)(uVar5 << 6 | pbVar4[1] & 0x3f);
        }
        else {
          uVar8 = pbVar4[2] & 0x3f | (pbVar4[1] & 0x3f) << 6;
          if (bVar10 < 0xf0) {
            pbVar7 = pbVar4 + 3;
            uVar9 = (ulong)(uVar8 | uVar5 << 0xc);
          }
          else {
            pbVar7 = pbVar4 + 4;
            uVar9 = (ulong)(pbVar4[3] & 0x3f | uVar8 << 6 | (bVar10 & 7) << 0x12);
          }
        }
      }
      else {
        pbVar7 = pbVar4 + 1;
      }
      pbVar4 = pbVar3 + ((long)pbVar7 - (long)pbVar4);
      uVar5 = (uint)uVar9;
      if ((4 < uVar5 - 9) && (uVar5 != 0x20)) {
        if (uVar5 < 0x85) goto joined_r0x00014008935c;
        uVar8 = (uint)(uVar9 >> 8);
        if (uVar8 < 0x20) {
          if ((uVar9 & 0xffffff00) == 0) {
            bVar10 = *(byte *)(_DAT_14808aa80 + (uVar9 & 0xff));
          }
          else {
            if (uVar8 != 0x16) goto joined_r0x00014008935c;
            bVar10 = uVar5 == 0x1680;
          }
        }
        else if (uVar8 == 0x20) {
          bVar10 = *(byte *)(_DAT_14808aa80 + (uVar9 & 0xff)) >> 1;
        }
        else {
          if (uVar8 != 0x30) goto joined_r0x00014008935c;
          bVar10 = uVar5 == 0x3000;
        }
        if ((bVar10 & 1) == 0) goto joined_r0x00014008935c;
      }
      pbVar3 = pbVar4;
      pbVar4 = pbVar7;
    } while (pbVar7 != pbVar6);
    pbVar3 = (byte *)0x0;
    pbVar4 = (byte *)0x0;
  }
LAB_14008946e:
  auVar11._8_8_ = (long)pbVar4 - (long)pbVar3;
  auVar11._0_8_ = param_4 + (long)pbVar3;
  return auVar11;
}
