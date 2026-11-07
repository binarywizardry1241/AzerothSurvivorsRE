/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_140c04c60(undefined8 param_1,undefined8 param_2,long param_3,undefined8 param_4,
                  undefined8 *param_5)

{
  undefined4 uVar1;
  long lVar2;
  byte *pbVar3;
  float fVar4;
  ulong uVar5;
  float *pfVar6;
  undefined4 *puVar7;
  float fVar8;

  lVar2 = *(long *)(param_3 + 8);
  if (((((*(long *)(lVar2 + 0x10) == 0xb) &&
        (pbVar3 = *(byte **)(lVar2 + 8),
        (byte)(((byte)(*pbVar3 + 0xbf) < 0x1a) << 5 | *pbVar3) == 0x72)) &&
       ((byte)(((byte)(pbVar3[1] + 0xbf) < 0x1a) << 5 | pbVar3[1]) == 0x65)) &&
      (((((byte)(((byte)(pbVar3[2] + 0xbf) < 0x1a) << 5 | pbVar3[2]) == 0x6e &&
         ((byte)(((byte)(pbVar3[3] + 0xbf) < 0x1a) << 5 | pbVar3[3]) == 100)) &&
        (((byte)(((byte)(pbVar3[4] + 0xbf) < 0x1a) << 5 | pbVar3[4]) == 0x65 &&
         (((byte)(((byte)(pbVar3[5] + 0xbf) < 0x1a) << 5 | pbVar3[5]) == 0x72 &&
          ((byte)(((byte)(pbVar3[6] + 0xbf) < 0x1a) << 5 | pbVar3[6]) == 0x73)))))) &&
       ((byte)(((byte)(pbVar3[7] + 0xbf) < 0x1a) << 5 | pbVar3[7]) == 99)))) &&
     ((((byte)(((byte)(pbVar3[8] + 0xbf) < 0x1a) << 5 | pbVar3[8]) == 0x61 &&
       ((byte)(((byte)(pbVar3[9] + 0xbf) < 0x1a) << 5 | pbVar3[9]) == 0x6c)) &&
      ((byte)(((byte)(pbVar3[10] + 0xbf) < 0x1a) << 5 | pbVar3[10]) == 0x65)))) {
    pfVar6 = (float *)*param_5;
    puVar7 = (undefined4 *)param_5[2];
    uVar1 = *(undefined4 *)((long)param_5 + 0x1c);
    func_0x000140089200(puVar7,pfVar6,*(undefined8 *)(lVar2 + 0x40),*(undefined8 *)(lVar2 + 0x38));
    uVar5 = func_0x000145bdb8d0();
    fVar4 = 0.0;
    if ((uVar5 & 1) == 0) {
      fVar4 = (float)(uVar5 >> 0x20);
    }
    fVar8 = _DAT_145dcce84;
    if (_DAT_145dcce84 <= fVar4) {
      fVar8 = fVar4;
    }
    fVar4 = _DAT_145d9d4c8;
    if (fVar8 <= _DAT_145d9d4c8) {
      fVar4 = fVar8;
    }
    *puVar7 = uVar1;
    *pfVar6 = fVar4;
  }
  return;
}
