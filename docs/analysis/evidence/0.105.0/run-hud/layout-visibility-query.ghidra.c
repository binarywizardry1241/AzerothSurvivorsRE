/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 entry(undefined8 param_1,undefined8 param_2,long param_3,undefined8 param_4)

{
  char *pcVar1;
  undefined1 auVar2 [16];
  long lVar3;
  code *pcVar4;
  uint uVar5;
  uint uVar6;
  ulong uVar7;
  long lVar8;
  uint uVar9;
  ushort uVar10;
  ulong uVar11;
  undefined1 auVar12 [16];
  undefined1 auVar13 [16];
  undefined1 auVar14 [16];
  long local_2c8;
  ulong local_2b8;
  char local_250;

  uVar7 = func_0x00014029b440();
  func_0x0001402a38d0();
  func_0x0001402a1de0();
  func_0x0001402a5e70();
  func_0x0001402a63d0();
  func_0x0001402a0860();
  func_0x0001402a38d0();
  func_0x0001402a1de0();
  func_0x0001402a5e70();
  func_0x0001402a2e00();
  func_0x00014029fd90();
  func_0x0001402a5910();
  func_0x000144e68fa0();
  if (uVar7 < local_2b8) {
    if ((bool)local_250 != ((*(ulong *)(local_2c8 + (uVar7 >> 6) * 8) >> (uVar7 & 0x3f) & 1) != 0))
    {
LAB_140390b47:
      func_0x000145d699c0();
                    /* WARNING: Does not return */
      pcVar4 = (code *)invalidInstructionException();
      (*pcVar4)();
    }
  }
  else if (local_250 != '\0') goto LAB_140390b47;
  func_0x000144e62910();
  func_0x000144e61a00();
  func_0x000144e61a00();
  func_0x000144e61a00();
  func_0x000144e68fa0();
  func_0x00014027e020();
  func_0x000144e629e0();
  if (*(long *)(param_3 + 0x90) != 0) {
    lVar3 = *(long *)(param_3 + 0x78);
    uVar7 = 0xe592096a8ce4219;
    lVar8 = 0;
    while( true ) {
      uVar7 = uVar7 & *(ulong *)(param_3 + 0x80);
      auVar2 = *(undefined1 (*) [16])(lVar3 + uVar7);
      auVar13[0] = -(auVar2[0] == DAT_145dc2f10);
      auVar13[1] = -(auVar2[1] == DAT_145dc2f10._1_1_);
      auVar13[2] = -(auVar2[2] == DAT_145dc2f10._2_1_);
      auVar13[3] = -(auVar2[3] == DAT_145dc2f10._3_1_);
      auVar13[4] = -(auVar2[4] == DAT_145dc2f10._4_1_);
      auVar13[5] = -(auVar2[5] == DAT_145dc2f10._5_1_);
      auVar13[6] = -(auVar2[6] == DAT_145dc2f10._6_1_);
      auVar13[7] = -(auVar2[7] == DAT_145dc2f10._7_1_);
      auVar13[8] = -(auVar2[8] == DAT_145dc2f10._8_1_);
      auVar13[9] = -(auVar2[9] == DAT_145dc2f10._9_1_);
      auVar13[10] = -(auVar2[10] == DAT_145dc2f10._10_1_);
      auVar13[0xb] = -(auVar2[0xb] == DAT_145dc2f10._11_1_);
      auVar13[0xc] = -(auVar2[0xc] == DAT_145dc2f10._12_1_);
      auVar13[0xd] = -(auVar2[0xd] == DAT_145dc2f10._13_1_);
      auVar13[0xe] = -(auVar2[0xe] == DAT_145dc2f10._14_1_);
      auVar13[0xf] = -(auVar2[0xf] == DAT_145dc2f10._15_1_);
      uVar10 = (ushort)(SUB161(auVar13 >> 7,0) & 1) | (ushort)(SUB161(auVar13 >> 0xf,0) & 1) << 1 |
               (ushort)(SUB161(auVar13 >> 0x17,0) & 1) << 2 |
               (ushort)(SUB161(auVar13 >> 0x1f,0) & 1) << 3 |
               (ushort)(SUB161(auVar13 >> 0x27,0) & 1) << 4 |
               (ushort)(SUB161(auVar13 >> 0x2f,0) & 1) << 5 |
               (ushort)(SUB161(auVar13 >> 0x37,0) & 1) << 6 |
               (ushort)(SUB161(auVar13 >> 0x3f,0) & 1) << 7 |
               (ushort)(SUB161(auVar13 >> 0x47,0) & 1) << 8 |
               (ushort)(SUB161(auVar13 >> 0x4f,0) & 1) << 9 |
               (ushort)(SUB161(auVar13 >> 0x57,0) & 1) << 10 |
               (ushort)(SUB161(auVar13 >> 0x5f,0) & 1) << 0xb |
               (ushort)(SUB161(auVar13 >> 0x67,0) & 1) << 0xc |
               (ushort)(SUB161(auVar13 >> 0x6f,0) & 1) << 0xd |
               (ushort)(SUB161(auVar13 >> 0x77,0) & 1) << 0xe | (ushort)(auVar13[0xf] >> 7) << 0xf;
      uVar9 = (uint)uVar10;
      while (uVar10 != 0) {
        uVar5 = 0;
        for (uVar6 = uVar9; (uVar6 & 1) == 0; uVar6 = uVar6 >> 1 | 0x80000000) {
          uVar5 = uVar5 + 1;
        }
        uVar11 = uVar5 + uVar7 & *(ulong *)(param_3 + 0x80);
        pcVar1 = (char *)(lVar3 + -0x18 + uVar11 * -0x18);
        auVar14[0] = -(*pcVar1 == DAT_145dcda30);
        auVar14[1] = -(pcVar1[1] == DAT_145dcda30._1_1_);
        auVar14[2] = -(pcVar1[2] == DAT_145dcda30._2_1_);
        auVar14[3] = -(pcVar1[3] == DAT_145dcda30._3_1_);
        auVar14[4] = -(pcVar1[4] == DAT_145dcda30._4_1_);
        auVar14[5] = -(pcVar1[5] == DAT_145dcda30._5_1_);
        auVar14[6] = -(pcVar1[6] == DAT_145dcda30._6_1_);
        auVar14[7] = -(pcVar1[7] == DAT_145dcda30._7_1_);
        auVar14[8] = -(pcVar1[8] == DAT_145dcda30._8_1_);
        auVar14[9] = -(pcVar1[9] == DAT_145dcda30._9_1_);
        auVar14[10] = -(pcVar1[10] == DAT_145dcda30._10_1_);
        auVar14[0xb] = -(pcVar1[0xb] == DAT_145dcda30._11_1_);
        auVar14[0xc] = -(pcVar1[0xc] == DAT_145dcda30._12_1_);
        auVar14[0xd] = -(pcVar1[0xd] == DAT_145dcda30._13_1_);
        auVar14[0xe] = -(pcVar1[0xe] == DAT_145dcda30._14_1_);
        auVar14[0xf] = -(pcVar1[0xf] == DAT_145dcda30._15_1_);
        if ((ushort)((ushort)(SUB161(auVar14 >> 7,0) & 1) |
                     (ushort)(SUB161(auVar14 >> 0xf,0) & 1) << 1 |
                     (ushort)(SUB161(auVar14 >> 0x17,0) & 1) << 2 |
                     (ushort)(SUB161(auVar14 >> 0x1f,0) & 1) << 3 |
                     (ushort)(SUB161(auVar14 >> 0x27,0) & 1) << 4 |
                     (ushort)(SUB161(auVar14 >> 0x2f,0) & 1) << 5 |
                     (ushort)(SUB161(auVar14 >> 0x37,0) & 1) << 6 |
                     (ushort)(SUB161(auVar14 >> 0x3f,0) & 1) << 7 |
                     (ushort)(SUB161(auVar14 >> 0x47,0) & 1) << 8 |
                     (ushort)(SUB161(auVar14 >> 0x4f,0) & 1) << 9 |
                     (ushort)(SUB161(auVar14 >> 0x57,0) & 1) << 10 |
                     (ushort)(SUB161(auVar14 >> 0x5f,0) & 1) << 0xb |
                     (ushort)(SUB161(auVar14 >> 0x67,0) & 1) << 0xc |
                     (ushort)(SUB161(auVar14 >> 0x6f,0) & 1) << 0xd |
                     (ushort)(SUB161(auVar14 >> 0x77,0) & 1) << 0xe |
                    (ushort)(auVar14[0xf] >> 7) << 0xf) == 0xffff) {
          uVar7 = *(ulong *)(lVar3 + uVar11 * -0x18 + -8);
          if (((uVar7 < *(ulong *)(param_3 + 0x218)) &&
              (uVar7 = *(ulong *)(*(long *)(param_3 + 0x210) + uVar7 * 8), uVar7 != 0)) &&
             (*(char *)(*(long *)(param_3 + 0x1e0) + 0x30 + ~uVar7 * 0x38) == '\x01')) {
            func_0x000144df2410();
            func_0x000144df2570();
          }
          goto LAB_140390be1;
        }
        uVar10 = (ushort)(uVar9 - 1) & (ushort)uVar9;
        uVar9 = CONCAT22((short)(uVar9 - 1 >> 0x10),uVar10);
      }
      auVar12[0] = -(auVar2[0] == -1);
      auVar12[1] = -(auVar2[1] == -1);
      auVar12[2] = -(auVar2[2] == -1);
      auVar12[3] = -(auVar2[3] == -1);
      auVar12[4] = -(auVar2[4] == -1);
      auVar12[5] = -(auVar2[5] == -1);
      auVar12[6] = -(auVar2[6] == -1);
      auVar12[7] = -(auVar2[7] == -1);
      auVar12[8] = -(auVar2[8] == -1);
      auVar12[9] = -(auVar2[9] == -1);
      auVar12[10] = -(auVar2[10] == -1);
      auVar12[0xb] = -(auVar2[0xb] == -1);
      auVar12[0xc] = -(auVar2[0xc] == -1);
      auVar12[0xd] = -(auVar2[0xd] == -1);
      auVar12[0xe] = -(auVar2[0xe] == -1);
      auVar12[0xf] = -(auVar2[0xf] == -1);
      if ((((((((((((((((SUB161(auVar12 >> 7,0) & 1) != 0 || (SUB161(auVar12 >> 0xf,0) & 1) != 0) ||
                      (SUB161(auVar12 >> 0x17,0) & 1) != 0) || (SUB161(auVar12 >> 0x1f,0) & 1) != 0)
                    || (SUB161(auVar12 >> 0x27,0) & 1) != 0) || (SUB161(auVar12 >> 0x2f,0) & 1) != 0
                   ) || (SUB161(auVar12 >> 0x37,0) & 1) != 0) ||
                 (SUB161(auVar12 >> 0x3f,0) & 1) != 0) || (SUB161(auVar12 >> 0x47,0) & 1) != 0) ||
               (SUB161(auVar12 >> 0x4f,0) & 1) != 0) || (SUB161(auVar12 >> 0x57,0) & 1) != 0) ||
             (SUB161(auVar12 >> 0x5f,0) & 1) != 0) || (SUB161(auVar12 >> 0x67,0) & 1) != 0) ||
           (SUB161(auVar12 >> 0x6f,0) & 1) != 0) || (SUB161(auVar12 >> 0x77,0) & 1) != 0) ||
          auVar12[0xf] < '\0') break;
      uVar7 = uVar7 + lVar8 + 0x10;
      lVar8 = lVar8 + 0x10;
    }
  }
LAB_140390be1:
  func_0x000145bc977b();
  func_0x0001403721e0();
  func_0x000140390490();
  func_0x000145bc977b();
  return param_4;
}
