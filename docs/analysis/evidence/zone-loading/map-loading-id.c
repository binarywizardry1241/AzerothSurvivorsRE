undefined4 FUN_145aa75a0(undefined8 param_1,undefined8 param_2,int param_3,long param_4)

{
  char *pcVar1;
  uint uVar2;
  uint uVar3;
  ulong uVar4;
  uint uVar5;
  ushort uVar6;
  long lVar7;
  byte bVar8;
  undefined1 auVar9 [16];
  undefined1 auVar10 [16];
  undefined1 auVar11 [16];
  int local_14;
  undefined8 uStack_10;
  undefined8 uStack_8;

  if (*(long *)(param_4 + 0x78) != 0) {
    local_14 = param_3;
    uStack_10 = param_1;
    uStack_8 = param_2;
    uVar4 = func_0x000140f96f70(param_4,param_3,&local_14,param_4 + 0x80);
    bVar8 = (byte)(uVar4 >> 0x39);
    auVar9 = ZEXT216(CONCAT11(bVar8,bVar8));
    auVar9 = pshuflw(auVar9,auVar9,0);
    lVar7 = 0;
    while( true ) {
      uVar4 = uVar4 & *(ulong *)(param_4 + 0x68);
      pcVar1 = (char *)(*(long *)(param_4 + 0x60) + uVar4);
      auVar11[0] = -(*pcVar1 == auVar9[0]);
      auVar11[1] = -(pcVar1[1] == auVar9[1]);
      auVar11[2] = -(pcVar1[2] == auVar9[2]);
      auVar11[3] = -(pcVar1[3] == auVar9[3]);
      auVar11[4] = -(pcVar1[4] == auVar9[4]);
      auVar11[5] = -(pcVar1[5] == auVar9[5]);
      auVar11[6] = -(pcVar1[6] == auVar9[6]);
      auVar11[7] = -(pcVar1[7] == auVar9[7]);
      auVar11[8] = -(pcVar1[8] == auVar9[0]);
      auVar11[9] = -(pcVar1[9] == auVar9[1]);
      auVar11[10] = -(pcVar1[10] == auVar9[2]);
      auVar11[0xb] = -(pcVar1[0xb] == auVar9[3]);
      auVar11[0xc] = -(pcVar1[0xc] == auVar9[4]);
      auVar11[0xd] = -(pcVar1[0xd] == auVar9[5]);
      auVar11[0xe] = -(pcVar1[0xe] == auVar9[6]);
      auVar11[0xf] = -(pcVar1[0xf] == auVar9[7]);
      uVar6 = (ushort)(SUB161(auVar11 >> 7,0) & 1) | (ushort)(SUB161(auVar11 >> 0xf,0) & 1) << 1 |
              (ushort)(SUB161(auVar11 >> 0x17,0) & 1) << 2 |
              (ushort)(SUB161(auVar11 >> 0x1f,0) & 1) << 3 |
              (ushort)(SUB161(auVar11 >> 0x27,0) & 1) << 4 |
              (ushort)(SUB161(auVar11 >> 0x2f,0) & 1) << 5 |
              (ushort)(SUB161(auVar11 >> 0x37,0) & 1) << 6 |
              (ushort)(SUB161(auVar11 >> 0x3f,0) & 1) << 7 |
              (ushort)(SUB161(auVar11 >> 0x47,0) & 1) << 8 |
              (ushort)(SUB161(auVar11 >> 0x4f,0) & 1) << 9 |
              (ushort)(SUB161(auVar11 >> 0x57,0) & 1) << 10 |
              (ushort)(SUB161(auVar11 >> 0x5f,0) & 1) << 0xb |
              (ushort)(SUB161(auVar11 >> 0x67,0) & 1) << 0xc |
              (ushort)(SUB161(auVar11 >> 0x6f,0) & 1) << 0xd |
              (ushort)(SUB161(auVar11 >> 0x77,0) & 1) << 0xe | (ushort)(auVar11[0xf] >> 7) << 0xf;
      uVar5 = (uint)uVar6;
      while (uVar6 != 0) {
        uVar2 = 0;
        for (uVar3 = uVar5; (uVar3 & 1) == 0; uVar3 = uVar3 >> 1 | 0x80000000) {
          uVar2 = uVar2 + 1;
        }
        if (param_3 ==
            *(int *)(*(long *)(param_4 + 0x60) + (uVar2 + uVar4 & *(ulong *)(param_4 + 0x68)) * -8 +
                    -8)) {
          return 1;
        }
        uVar6 = (ushort)(uVar5 - 1) & (ushort)uVar5;
        uVar5 = CONCAT22((short)(uVar5 - 1 >> 0x10),uVar6);
      }
      auVar10[0] = -(*pcVar1 == -1);
      auVar10[1] = -(pcVar1[1] == -1);
      auVar10[2] = -(pcVar1[2] == -1);
      auVar10[3] = -(pcVar1[3] == -1);
      auVar10[4] = -(pcVar1[4] == -1);
      auVar10[5] = -(pcVar1[5] == -1);
      auVar10[6] = -(pcVar1[6] == -1);
      auVar10[7] = -(pcVar1[7] == -1);
      auVar10[8] = -(pcVar1[8] == -1);
      auVar10[9] = -(pcVar1[9] == -1);
      auVar10[10] = -(pcVar1[10] == -1);
      auVar10[0xb] = -(pcVar1[0xb] == -1);
      auVar10[0xc] = -(pcVar1[0xc] == -1);
      auVar10[0xd] = -(pcVar1[0xd] == -1);
      auVar10[0xe] = -(pcVar1[0xe] == -1);
      auVar10[0xf] = -(pcVar1[0xf] == -1);
      if ((((((((((((((((SUB161(auVar10 >> 7,0) & 1) != 0 || (SUB161(auVar10 >> 0xf,0) & 1) != 0) ||
                      (SUB161(auVar10 >> 0x17,0) & 1) != 0) || (SUB161(auVar10 >> 0x1f,0) & 1) != 0)
                    || (SUB161(auVar10 >> 0x27,0) & 1) != 0) || (SUB161(auVar10 >> 0x2f,0) & 1) != 0
                   ) || (SUB161(auVar10 >> 0x37,0) & 1) != 0) ||
                 (SUB161(auVar10 >> 0x3f,0) & 1) != 0) || (SUB161(auVar10 >> 0x47,0) & 1) != 0) ||
               (SUB161(auVar10 >> 0x4f,0) & 1) != 0) || (SUB161(auVar10 >> 0x57,0) & 1) != 0) ||
             (SUB161(auVar10 >> 0x5f,0) & 1) != 0) || (SUB161(auVar10 >> 0x67,0) & 1) != 0) ||
           (SUB161(auVar10 >> 0x6f,0) & 1) != 0) || (SUB161(auVar10 >> 0x77,0) & 1) != 0) ||
          auVar10[0xf] < '\0') break;
      uVar4 = uVar4 + lVar7 + 0x10;
      lVar7 = lVar7 + 0x10;
    }
  }
  return 0;
}
