/* WARNING: Type propagation algorithm not settling */

void FUN_1458f6000(undefined8 param_1,undefined8 param_2,byte *param_3,undefined8 param_4,
                  ulong param_5)

{
  long lVar1;
  ulong uVar2;
  byte bStack_94;
  byte bStack_93;
  byte bStack_92;
  byte bStack_91;
  byte bStack_90;
  byte bStack_8f;
  byte bStack_8e;
  byte bStack_8d;
  byte bStack_8c;
  byte bStack_8b;
  byte bStack_8a;
  byte bStack_89;
  byte bStack_88;
  byte bStack_87;
  byte bStack_86;
  byte bStack_85;
  byte bStack_84;
  byte bStack_83;
  byte bStack_82;
  byte bStack_81;
  undefined8 uStack_80;
  long alStack_78 [4];
  undefined8 uStack_58;
  long *plStack_50;
  undefined8 uStack_48;

  if (param_5 != 0) {
    lVar1 = 0;
    uStack_80 = param_4;
    do {
      uVar2 = 0x14;
      if (param_5 < 0x14) {
        uVar2 = param_5;
      }
      alStack_78[1] = 0x146ed3240;
      alStack_78[2] = 2;
      alStack_78[3] = uStack_80;
      uStack_58 = 0x10;
      plStack_50 = alStack_78;
      uStack_48 = 8;
      alStack_78[0] = lVar1;
      FUN_1458f6280(param_3,param_5,alStack_78 + 1,&bStack_94);
      *param_3 = *param_3 ^ bStack_94;
      if (((((((param_5 != 1) && (param_3[1] = param_3[1] ^ bStack_93, param_5 != 2)) &&
             (param_3[2] = param_3[2] ^ bStack_92, param_5 != 3)) &&
            ((param_3[3] = param_3[3] ^ bStack_91, param_5 != 4 &&
             (param_3[4] = param_3[4] ^ bStack_90, param_5 != 5)))) &&
           ((param_3[5] = param_3[5] ^ bStack_8f, param_5 != 6 &&
            ((param_3[6] = param_3[6] ^ bStack_8e, param_5 != 7 &&
             (param_3[7] = param_3[7] ^ bStack_8d, param_5 != 8)))))) &&
          (param_3[8] = param_3[8] ^ bStack_8c, param_5 != 9)) &&
         (((((param_3[9] = param_3[9] ^ bStack_8b, param_5 != 10 &&
             (param_3[10] = param_3[10] ^ bStack_8a, param_5 != 0xb)) &&
            (param_3[0xb] = param_3[0xb] ^ bStack_89, param_5 != 0xc)) &&
           (((param_3[0xc] = param_3[0xc] ^ bStack_88, param_5 != 0xd &&
             (param_3[0xd] = param_3[0xd] ^ bStack_87, param_5 != 0xe)) &&
            ((param_3[0xe] = param_3[0xe] ^ bStack_86, param_5 != 0xf &&
             ((param_3[0xf] = param_3[0xf] ^ bStack_85, param_5 != 0x10 &&
              (param_3[0x10] = param_3[0x10] ^ bStack_84, param_5 != 0x11)))))))) &&
          ((param_3[0x11] = param_3[0x11] ^ bStack_83, param_5 != 0x12 &&
           (param_3[0x12] = param_3[0x12] ^ bStack_82, param_5 != 0x13)))))) {
        param_3[0x13] = param_3[0x13] ^ bStack_81;
      }
      param_3 = param_3 + uVar2;
      param_5 = param_5 - uVar2;
      lVar1 = lVar1 + 1;
    } while (param_5 != 0);
  }
  return;
}
