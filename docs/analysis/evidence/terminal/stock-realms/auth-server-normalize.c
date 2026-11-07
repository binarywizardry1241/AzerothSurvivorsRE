
long * entry(undefined8 param_1,undefined8 param_2,long param_3,long *param_4)

{
  byte *pbVar1;
  code *pcVar2;
  long lVar3;
  byte bVar4;
  uint uVar5;
  uint uVar6;
  long lVar7;
  long lVar8;
  byte *pbVar9;
  byte *pbVar10;

  lVar8 = *(long *)(param_3 + 0x10);
  if (lVar8 - 0x11U < 0xfffffffffffffff0) {
    *(undefined4 *)(param_4 + 1) = 0xffffffff;
    *param_4 = -1;
  }
  else {
    pbVar10 = *(byte **)(param_3 + 8);
    func_0x000140002200();
    lVar3 = func_0x0001400021c0();
    if (lVar3 == 0) {
      func_0x000145d6944b();
                    /* WARNING: Does not return */
      pcVar2 = (code *)invalidInstructionException();
      (*pcVar2)();
    }
    pbVar9 = pbVar10 + lVar8;
    lVar7 = 0;
    do {
      bVar4 = *pbVar10;
      uVar6 = (uint)bVar4;
      if ((char)bVar4 < '\0') {
        pbVar1 = pbVar10 + 1;
        if (bVar4 < 0xe0) {
          pbVar10 = pbVar10 + 2;
          uVar6 = (uVar6 & 0x1f) << 6 | *pbVar1 & 0x3f;
        }
        else {
          uVar5 = pbVar10[2] & 0x3f | (*pbVar1 & 0x3f) << 6;
          if (bVar4 < 0xf0) {
            pbVar10 = pbVar10 + 3;
            uVar6 = uVar5 | (uVar6 & 0x1f) << 0xc;
          }
          else {
            pbVar1 = pbVar10 + 3;
            pbVar10 = pbVar10 + 4;
            uVar6 = *pbVar1 & 0x3f | uVar5 << 6 | (uVar6 & 7) << 0x12;
          }
        }
        if (0x7f < uVar6) goto LAB_1458de9e2;
      }
      else {
        pbVar10 = pbVar10 + 1;
      }
      if ((uVar6 < 0x20) || (uVar6 == 0x7f)) {
LAB_1458de9e2:
        *(uint *)(param_4 + 1) = uVar6;
        *param_4 = -1;
        if (lVar8 == 0) {
          return param_4;
        }
        func_0x0001400021d0();
        return param_4;
      }
      if (lVar7 == lVar8) {
        func_0x000145bcb2d0();
      }
      bVar4 = (byte)uVar6 & 0x5f;
      if (0x19 < uVar6 - 0x61) {
        bVar4 = (byte)uVar6;
      }
      *(byte *)(lVar3 + lVar7) = bVar4;
      lVar7 = lVar7 + 1;
    } while (pbVar10 != pbVar9);
    param_4[2] = lVar7;
    *param_4 = lVar8;
    param_4[1] = lVar3;
  }
  return param_4;
}
