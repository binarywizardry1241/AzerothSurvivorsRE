long * FUN_1458f6950(undefined8 param_1,undefined8 param_2,undefined8 param_3,long *param_4,
                    undefined8 param_5)

{
  char *pcVar1;
  undefined4 uVar2;
  code *pcVar3;
  long lVar4;
  long lVar5;
  undefined1 auVar6 [16];
  undefined1 auVar7 [16];
  char cStack_b8;
  char cStack_9c;
  char cStack_9b;
  char cStack_9a;
  char cStack_99;
  char cStack_98;
  char cStack_97;
  char cStack_96;
  char cStack_95;
  char cStack_94;
  char cStack_93;
  char cStack_92;
  char cStack_91;
  char cStack_90;
  char cStack_8f;
  char cStack_8e;
  char cStack_8d;
  undefined4 uStack_8c;
  long lStack_88;
  long lStack_80;
  ulong uStack_78;

  auVar7 = func_0x000140089200(param_1,param_4,param_5,param_3);
  if (((auVar7._8_8_ < 5) || ((char)auVar7._0_8_[1] != ':' || *auVar7._0_8_ != 0x31455352)) ||
     (FUN_1458e7920(), lStack_88 == -1)) {
    *param_4 = -1;
  }
  else {
    if (uStack_78 < 0x24) {
      *param_4 = -1;
    }
    else {
      lVar4 = lStack_80 + 0x10;
      lVar5 = uStack_78 - 0x24;
      FUN_1458f6280();
      pcVar1 = (char *)(lVar4 + lVar5);
      auVar7[0] = -(*pcVar1 == cStack_9c);
      auVar7[1] = -(pcVar1[1] == cStack_9b);
      auVar7[2] = -(pcVar1[2] == cStack_9a);
      auVar7[3] = -(pcVar1[3] == cStack_99);
      auVar7[4] = -(pcVar1[4] == cStack_98);
      auVar7[5] = -(pcVar1[5] == cStack_97);
      auVar7[6] = -(pcVar1[6] == cStack_96);
      auVar7[7] = -(pcVar1[7] == cStack_95);
      auVar7[8] = -(pcVar1[8] == cStack_94);
      auVar7[9] = -(pcVar1[9] == cStack_93);
      auVar7[10] = -(pcVar1[10] == cStack_92);
      auVar7[0xb] = -(pcVar1[0xb] == cStack_91);
      auVar7[0xc] = -(pcVar1[0xc] == cStack_90);
      auVar7[0xd] = -(pcVar1[0xd] == cStack_8f);
      auVar7[0xe] = -(pcVar1[0xe] == cStack_8e);
      auVar7[0xf] = -(pcVar1[0xf] == cStack_8d);
      uVar2 = *(undefined4 *)(lVar4 + 0x10 + lVar5);
      auVar6[0] = -((char)uVar2 == (char)uStack_8c);
      auVar6[1] = -((char)((uint)uVar2 >> 8) == (char)((uint)uStack_8c >> 8));
      auVar6[2] = -((char)((uint)uVar2 >> 0x10) == (char)((uint)uStack_8c >> 0x10));
      auVar6[3] = -((char)((uint)uVar2 >> 0x18) == (char)((uint)uStack_8c >> 0x18));
      auVar6[4] = 0xff;
      auVar6[5] = 0xff;
      auVar6[6] = 0xff;
      auVar6[7] = 0xff;
      auVar6[8] = 0xff;
      auVar6[9] = 0xff;
      auVar6[10] = 0xff;
      auVar6[0xb] = 0xff;
      auVar6[0xc] = 0xff;
      auVar6[0xd] = 0xff;
      auVar6[0xe] = 0xff;
      auVar6[0xf] = 0xff;
      auVar6 = auVar6 & auVar7;
      if ((ushort)((ushort)(SUB161(auVar6 >> 7,0) & 1) | (ushort)(SUB161(auVar6 >> 0xf,0) & 1) << 1
                   | (ushort)(SUB161(auVar6 >> 0x17,0) & 1) << 2 |
                   (ushort)(SUB161(auVar6 >> 0x1f,0) & 1) << 3 |
                   (ushort)(SUB161(auVar6 >> 0x27,0) & 1) << 4 |
                   (ushort)(SUB161(auVar6 >> 0x2f,0) & 1) << 5 |
                   (ushort)(SUB161(auVar6 >> 0x37,0) & 1) << 6 |
                   (ushort)(SUB161(auVar6 >> 0x3f,0) & 1) << 7 |
                   (ushort)(SUB161(auVar6 >> 0x47,0) & 1) << 8 |
                   (ushort)(SUB161(auVar6 >> 0x4f,0) & 1) << 9 |
                   (ushort)(SUB161(auVar6 >> 0x57,0) & 1) << 10 |
                   (ushort)(SUB161(auVar6 >> 0x5f,0) & 1) << 0xb |
                   (ushort)(SUB161(auVar6 >> 0x67,0) & 1) << 0xc |
                   (ushort)(SUB161(auVar6 >> 0x6f,0) & 1) << 0xd |
                   (ushort)(SUB161(auVar6 >> 0x77,0) & 1) << 0xe |
                  (ushort)(byte)(auVar6[0xf] >> 7) << 0xf) == 0xffff) {
        if (lVar5 == 0) {
          lVar4 = 1;
        }
        else {
          func_0x000140002200();
          lVar4 = func_0x0001400021c0();
          if (lVar4 == 0) {
            func_0x000145d992bb();
                    /* WARNING: Does not return */
            pcVar3 = (code *)invalidInstructionException();
            (*pcVar3)();
          }
          func_0x000145bfa0e7();
        }
        FUN_1458f6000();
        func_0x000145bd5650();
        if (cStack_b8 == '\0') {
          param_4[2] = lVar5;
          *param_4 = lVar5;
          param_4[1] = lVar4;
        }
        else {
          *param_4 = -1;
          func_0x000140cb2820();
        }
      }
      else {
        *param_4 = -1;
      }
    }
    if (lStack_88 != 0) {
      func_0x0001400021d0();
    }
  }
  return param_4;
}
