void FUN_14361df00(undefined8 param_1,undefined8 param_2,undefined8 *param_3,undefined8 *param_4)

{
  undefined1 auVar1 [16];
  undefined1 (*pauVar2) [16];
  long lVar3;
  undefined8 uVar4;

  pauVar2 = (undefined1 (*) [16])*param_3;
  lVar3 = param_3[1];
  auVar1 = *pauVar2;
  uVar4 = param_3[3];
  *param_4 = pauVar2;
  param_4[1] = pauVar2 + 1;
  param_4[2] = *pauVar2 + lVar3 + 1;
  *(ushort *)(param_4 + 3) =
       ~((ushort)(SUB161(auVar1 >> 7,0) & 1) | (ushort)(SUB161(auVar1 >> 0xf,0) & 1) << 1 |
         (ushort)(SUB161(auVar1 >> 0x17,0) & 1) << 2 | (ushort)(SUB161(auVar1 >> 0x1f,0) & 1) << 3 |
         (ushort)(SUB161(auVar1 >> 0x27,0) & 1) << 4 | (ushort)(SUB161(auVar1 >> 0x2f,0) & 1) << 5 |
         (ushort)(SUB161(auVar1 >> 0x37,0) & 1) << 6 | (ushort)(SUB161(auVar1 >> 0x3f,0) & 1) << 7 |
         (ushort)(SUB161(auVar1 >> 0x47,0) & 1) << 8 | (ushort)(SUB161(auVar1 >> 0x4f,0) & 1) << 9 |
         (ushort)(SUB161(auVar1 >> 0x57,0) & 1) << 10 |
         (ushort)(SUB161(auVar1 >> 0x5f,0) & 1) << 0xb |
         (ushort)(SUB161(auVar1 >> 0x67,0) & 1) << 0xc |
         (ushort)(SUB161(auVar1 >> 0x6f,0) & 1) << 0xd |
         (ushort)(SUB161(auVar1 >> 0x77,0) & 1) << 0xe | (ushort)(byte)(auVar1[0xf] >> 7) << 0xf);
  param_4[4] = uVar4;
  return;
}
