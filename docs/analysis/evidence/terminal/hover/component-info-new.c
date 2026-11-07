/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,undefined8 *param_4,
          undefined8 *param_5)

{
  undefined8 uVar1;
  undefined8 uVar2;
  undefined8 uVar3;
  undefined8 uVar4;
  undefined8 uVar5;
  undefined8 uVar6;
  undefined8 uVar7;

  param_4[0x20] = param_3;
  uVar1 = param_5[1];
  uVar2 = param_5[2];
  uVar3 = param_5[3];
  uVar4 = param_5[4];
  uVar5 = param_5[5];
  uVar6 = param_5[6];
  uVar7 = param_5[7];
  *param_4 = *param_5;
  param_4[1] = uVar1;
  param_4[2] = uVar2;
  param_4[3] = uVar3;
  param_4[4] = uVar4;
  param_4[5] = uVar5;
  param_4[6] = uVar6;
  param_4[7] = uVar7;
  uVar1 = param_5[9];
  param_4[8] = param_5[8];
  param_4[9] = uVar1;
  param_4[10] = param_5[10];
  param_4[0xb] = 0;
  param_4[0x21] = 0;
  param_4[0x22] = 0;
  param_4[0x23] = 0;
  param_4[0x24] = 0;
  param_4[0x25] = 0;
  param_4[0xc] = 8;
  param_4[0xd] = 0;
  uVar2 = uRam0000000146b13dd8;
  uVar1 = _DAT_146b13dd0;
  param_4[0xe] = _DAT_146b13dd0;
  param_4[0xf] = uVar2;
  uVar4 = uRam0000000146b13de8;
  uVar3 = _DAT_146b13de0;
  param_4[0x10] = _DAT_146b13de0;
  param_4[0x11] = uVar4;
  param_4[0x12] = 0;
  param_4[0x13] = 8;
  param_4[0x14] = 0;
  param_4[0x17] = uVar3;
  param_4[0x18] = uVar4;
  param_4[0x15] = uVar1;
  param_4[0x16] = uVar2;
  param_4[0x19] = 0;
  param_4[0x1a] = 8;
  param_4[0x1b] = 0;
  param_4[0x1e] = uVar3;
  param_4[0x1f] = uVar4;
  param_4[0x1c] = uVar1;
  param_4[0x1d] = uVar2;
  return;
}
