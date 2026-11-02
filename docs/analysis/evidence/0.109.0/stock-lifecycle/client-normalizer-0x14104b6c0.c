long * entry(undefined8 param_1,undefined8 param_2,byte *param_3,long *param_4,long param_5)

{
  byte *pbVar1;
  code *pcVar2;
  long lVar3;
  byte bVar4;
  uint uVar5;
  uint uVar6;
  byte *pbVar7;
  long lVar8;

  if (param_5 - 0x11U < 0xfffffffffffffff0) {
    *(undefined4 *)(param_4 + 1) = 0xffffffff;
    *param_4 = -1;
  }
  else {
    func_0x000140002200();
    lVar3 = func_0x0001400021c0();
    if (lVar3 == 0) {
      func_0x000145d992bb();
                    /* WARNING: Does not return */
      pcVar2 = (code *)invalidInstructionException();
      (*pcVar2)();
    }
    pbVar7 = param_3 + param_5;
    lVar8 = 0;
    do {
      bVar4 = *param_3;
      uVar6 = (uint)bVar4;
      if ((char)bVar4 < '\0') {
        pbVar1 = param_3 + 1;
        if (bVar4 < 0xe0) {
          param_3 = param_3 + 2;
          uVar6 = (uVar6 & 0x1f) << 6 | *pbVar1 & 0x3f;
        }
        else {
          uVar5 = param_3[2] & 0x3f | (*pbVar1 & 0x3f) << 6;
          if (bVar4 < 0xf0) {
            param_3 = param_3 + 3;
            uVar6 = uVar5 | (uVar6 & 0x1f) << 0xc;
          }
          else {
            pbVar1 = param_3 + 3;
            param_3 = param_3 + 4;
            uVar6 = *pbVar1 & 0x3f | uVar5 << 6 | (uVar6 & 7) << 0x12;
          }
        }
        if (0x7f < uVar6) goto LAB_14104b853;
      }
      else {
        param_3 = param_3 + 1;
      }
      if ((uVar6 < 0x20) || (uVar6 == 0x7f)) {
LAB_14104b853:
        *(uint *)(param_4 + 1) = uVar6;
        *param_4 = -1;
        if (param_5 == 0) {
          return param_4;
        }
        func_0x0001400021d0();
        return param_4;
      }
      if (lVar8 == param_5) {
        func_0x000145bfa970();
      }
      bVar4 = (byte)uVar6 & 0x5f;
      if (0x19 < uVar6 - 0x61) {
        bVar4 = (byte)uVar6;
      }
      *(byte *)(lVar3 + lVar8) = bVar4;
      lVar8 = lVar8 + 1;
    } while (param_3 != pbVar7);
    param_4[2] = lVar8;
    *param_4 = param_5;
    param_4[1] = lVar3;
  }
  return param_4;
}
