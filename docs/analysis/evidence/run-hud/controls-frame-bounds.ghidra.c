void entry(undefined8 param_1,undefined8 param_2,long param_3,undefined4 *param_4)

{
  char *pcVar1;
  char *pcVar2;
  byte *pbVar3;
  uint uVar4;
  uint uVar5;
  undefined8 uVar6;
  ushort uVar7;
  ulong uVar8;
  long lVar9;
  ulong uVar10;
  long lVar11;
  uint uVar12;
  undefined1 auVar13 [16];
  undefined1 auVar14 [16];
  undefined1 auVar15 [16];

  if (*(long *)(param_3 + 0x90) != 0) {
    lVar9 = *(long *)(param_3 + 0x78);
    uVar10 = 0x30402193ab907194;
    lVar11 = 0;
    while( true ) {
      uVar10 = uVar10 & *(ulong *)(param_3 + 0x80);
      pcVar1 = (char *)(lVar9 + uVar10);
      auVar14[0] = -(*pcVar1 == DAT_145d6dce0);
      auVar14[1] = -(pcVar1[1] == cRam0000000145d6dce1);
      auVar14[2] = -(pcVar1[2] == cRam0000000145d6dce2);
      auVar14[3] = -(pcVar1[3] == cRam0000000145d6dce3);
      auVar14[4] = -(pcVar1[4] == cRam0000000145d6dce4);
      auVar14[5] = -(pcVar1[5] == cRam0000000145d6dce5);
      auVar14[6] = -(pcVar1[6] == cRam0000000145d6dce6);
      auVar14[7] = -(pcVar1[7] == cRam0000000145d6dce7);
      auVar14[8] = -(pcVar1[8] == cRam0000000145d6dce8);
      auVar14[9] = -(pcVar1[9] == cRam0000000145d6dce9);
      auVar14[10] = -(pcVar1[10] == cRam0000000145d6dcea);
      auVar14[0xb] = -(pcVar1[0xb] == cRam0000000145d6dceb);
      auVar14[0xc] = -(pcVar1[0xc] == cRam0000000145d6dcec);
      auVar14[0xd] = -(pcVar1[0xd] == cRam0000000145d6dced);
      auVar14[0xe] = -(pcVar1[0xe] == cRam0000000145d6dcee);
      auVar14[0xf] = -(pcVar1[0xf] == cRam0000000145d6dcef);
      uVar7 = (ushort)(SUB161(auVar14 >> 7,0) & 1) | (ushort)(SUB161(auVar14 >> 0xf,0) & 1) << 1 |
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
              (ushort)(SUB161(auVar14 >> 0x77,0) & 1) << 0xe | (ushort)(auVar14[0xf] >> 7) << 0xf;
      uVar12 = (uint)uVar7;
      while (uVar7 != 0) {
        uVar4 = 0;
        for (uVar5 = uVar12; (uVar5 & 1) == 0; uVar5 = uVar5 >> 1 | 0x80000000) {
          uVar4 = uVar4 + 1;
        }
        uVar8 = uVar4 + uVar10 & *(ulong *)(param_3 + 0x80);
        pcVar2 = (char *)(lVar9 + -0x18 + uVar8 * -0x18);
        auVar15[0] = -(*pcVar2 == DAT_145e5b870);
        auVar15[1] = -(pcVar2[1] == cRam0000000145e5b871);
        auVar15[2] = -(pcVar2[2] == cRam0000000145e5b872);
        auVar15[3] = -(pcVar2[3] == cRam0000000145e5b873);
        auVar15[4] = -(pcVar2[4] == cRam0000000145e5b874);
        auVar15[5] = -(pcVar2[5] == cRam0000000145e5b875);
        auVar15[6] = -(pcVar2[6] == cRam0000000145e5b876);
        auVar15[7] = -(pcVar2[7] == cRam0000000145e5b877);
        auVar15[8] = -(pcVar2[8] == cRam0000000145e5b878);
        auVar15[9] = -(pcVar2[9] == cRam0000000145e5b879);
        auVar15[10] = -(pcVar2[10] == cRam0000000145e5b87a);
        auVar15[0xb] = -(pcVar2[0xb] == cRam0000000145e5b87b);
        auVar15[0xc] = -(pcVar2[0xc] == cRam0000000145e5b87c);
        auVar15[0xd] = -(pcVar2[0xd] == cRam0000000145e5b87d);
        auVar15[0xe] = -(pcVar2[0xe] == cRam0000000145e5b87e);
        auVar15[0xf] = -(pcVar2[0xf] == cRam0000000145e5b87f);
        if ((ushort)((ushort)(SUB161(auVar15 >> 7,0) & 1) |
                     (ushort)(SUB161(auVar15 >> 0xf,0) & 1) << 1 |
                     (ushort)(SUB161(auVar15 >> 0x17,0) & 1) << 2 |
                     (ushort)(SUB161(auVar15 >> 0x1f,0) & 1) << 3 |
                     (ushort)(SUB161(auVar15 >> 0x27,0) & 1) << 4 |
                     (ushort)(SUB161(auVar15 >> 0x2f,0) & 1) << 5 |
                     (ushort)(SUB161(auVar15 >> 0x37,0) & 1) << 6 |
                     (ushort)(SUB161(auVar15 >> 0x3f,0) & 1) << 7 |
                     (ushort)(SUB161(auVar15 >> 0x47,0) & 1) << 8 |
                     (ushort)(SUB161(auVar15 >> 0x4f,0) & 1) << 9 |
                     (ushort)(SUB161(auVar15 >> 0x57,0) & 1) << 10 |
                     (ushort)(SUB161(auVar15 >> 0x5f,0) & 1) << 0xb |
                     (ushort)(SUB161(auVar15 >> 0x67,0) & 1) << 0xc |
                     (ushort)(SUB161(auVar15 >> 0x6f,0) & 1) << 0xd |
                     (ushort)(SUB161(auVar15 >> 0x77,0) & 1) << 0xe |
                    (ushort)(auVar15[0xf] >> 7) << 0xf) == 0xffff) {
          uVar10 = *(ulong *)(lVar9 + uVar8 * -0x18 + -8);
          if ((uVar10 < *(ulong *)(param_3 + 0x218)) &&
             (uVar10 = *(ulong *)(*(long *)(param_3 + 0x210) + uVar10 * 8), uVar10 != 0)) {
            lVar9 = ~uVar10 * 0x38;
            if ((*(char *)(*(long *)(param_3 + 0x1e0) + 0x30 + lVar9) == '\x01') &&
               (pbVar3 = *(byte **)(*(long *)(param_3 + 0x1e0) + lVar9 + 0x10), (*pbVar3 & 1) != 0))
            {
              uVar6 = *(undefined8 *)(pbVar3 + 0x18);
              *(undefined8 *)(param_4 + 1) = *(undefined8 *)(pbVar3 + 0x10);
              *(undefined8 *)(param_4 + 3) = uVar6;
              *param_4 = 1;
              return;
            }
          }
          goto LAB_140639b2d;
        }
        uVar7 = (ushort)(uVar12 - 1) & (ushort)uVar12;
        uVar12 = CONCAT22((short)(uVar12 - 1 >> 0x10),uVar7);
      }
      auVar13[0] = -(*pcVar1 == -1);
      auVar13[1] = -(pcVar1[1] == -1);
      auVar13[2] = -(pcVar1[2] == -1);
      auVar13[3] = -(pcVar1[3] == -1);
      auVar13[4] = -(pcVar1[4] == -1);
      auVar13[5] = -(pcVar1[5] == -1);
      auVar13[6] = -(pcVar1[6] == -1);
      auVar13[7] = -(pcVar1[7] == -1);
      auVar13[8] = -(pcVar1[8] == -1);
      auVar13[9] = -(pcVar1[9] == -1);
      auVar13[10] = -(pcVar1[10] == -1);
      auVar13[0xb] = -(pcVar1[0xb] == -1);
      auVar13[0xc] = -(pcVar1[0xc] == -1);
      auVar13[0xd] = -(pcVar1[0xd] == -1);
      auVar13[0xe] = -(pcVar1[0xe] == -1);
      auVar13[0xf] = -(pcVar1[0xf] == -1);
      if ((((((((((((((((SUB161(auVar13 >> 7,0) & 1) != 0 || (SUB161(auVar13 >> 0xf,0) & 1) != 0) ||
                      (SUB161(auVar13 >> 0x17,0) & 1) != 0) || (SUB161(auVar13 >> 0x1f,0) & 1) != 0)
                    || (SUB161(auVar13 >> 0x27,0) & 1) != 0) || (SUB161(auVar13 >> 0x2f,0) & 1) != 0
                   ) || (SUB161(auVar13 >> 0x37,0) & 1) != 0) ||
                 (SUB161(auVar13 >> 0x3f,0) & 1) != 0) || (SUB161(auVar13 >> 0x47,0) & 1) != 0) ||
               (SUB161(auVar13 >> 0x4f,0) & 1) != 0) || (SUB161(auVar13 >> 0x57,0) & 1) != 0) ||
             (SUB161(auVar13 >> 0x5f,0) & 1) != 0) || (SUB161(auVar13 >> 0x67,0) & 1) != 0) ||
           (SUB161(auVar13 >> 0x6f,0) & 1) != 0) || (SUB161(auVar13 >> 0x77,0) & 1) != 0) ||
          auVar13[0xf] < '\0') break;
      uVar10 = uVar10 + lVar11 + 0x10;
      lVar11 = lVar11 + 0x10;
    }
  }
LAB_140639b2d:
  *param_4 = 0;
  return;
}
