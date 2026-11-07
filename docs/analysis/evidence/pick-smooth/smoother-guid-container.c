
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_145bde900(undefined8 param_1,undefined8 param_2,undefined8 *param_3,undefined8 *param_4,
                  long param_5,undefined8 *param_6)

{
  undefined1 auVar1 [16];
  ulong uVar2;
  uint uVar3;
  undefined8 uVar4;
  undefined8 uVar5;
  undefined8 uVar6;
  bool bVar7;
  uint uVar8;
  ulong uVar9;
  undefined1 (*pauVar10) [16];
  undefined8 uVar11;
  byte bVar12;
  ushort uVar13;
  undefined8 *puVar14;
  long lVar15;
  ulong uVar16;
  uint uVar17;
  byte bVar18;
  undefined1 auVar19 [16];
  undefined1 auVar20 [16];
  undefined1 auVar21 [16];
  long lStack_40;
  
  puVar14 = param_6;
  lStack_40 = param_5;
  uVar9 = func_0x000140051b90(param_6,param_4,&lStack_40,param_3 + 4);
  if (param_3[2] == 0) {
    puVar14 = (undefined8 *)CONCAT71((int7)((ulong)puVar14 >> 8),1);
    func_0x00014618eda0();
  }
  pauVar10 = (undefined1 (*) [16])*param_3;
  uVar2 = param_3[1];
  bVar12 = (byte)(uVar9 >> 0x38);
  bVar18 = bVar12 >> 1;
  auVar19 = ZEXT216(CONCAT11(bVar18,bVar18));
  auVar19 = pshuflw(auVar19,auVar19,0);
  bVar7 = false;
  lVar15 = 0;
  do {
    uVar9 = uVar9 & uVar2;
    auVar1 = *(undefined1 (*) [16])(*pauVar10 + uVar9);
    auVar21[0] = -(auVar1[0] == auVar19[0]);
    auVar21[1] = -(auVar1[1] == auVar19[1]);
    auVar21[2] = -(auVar1[2] == auVar19[2]);
    auVar21[3] = -(auVar1[3] == auVar19[3]);
    auVar21[4] = -(auVar1[4] == auVar19[4]);
    auVar21[5] = -(auVar1[5] == auVar19[5]);
    auVar21[6] = -(auVar1[6] == auVar19[6]);
    auVar21[7] = -(auVar1[7] == auVar19[7]);
    auVar21[8] = -(auVar1[8] == auVar19[0]);
    auVar21[9] = -(auVar1[9] == auVar19[1]);
    auVar21[10] = -(auVar1[10] == auVar19[2]);
    auVar21[0xb] = -(auVar1[0xb] == auVar19[3]);
    auVar21[0xc] = -(auVar1[0xc] == auVar19[4]);
    auVar21[0xd] = -(auVar1[0xd] == auVar19[5]);
    bVar18 = auVar1[0xf];
    auVar21[0xe] = -(auVar1[0xe] == auVar19[6]);
    auVar21[0xf] = -(bVar18 == auVar19[7]);
    uVar13 = (ushort)(SUB161(auVar21 >> 7,0) & 1) | (ushort)(SUB161(auVar21 >> 0xf,0) & 1) << 1 |
             (ushort)(SUB161(auVar21 >> 0x17,0) & 1) << 2 |
             (ushort)(SUB161(auVar21 >> 0x1f,0) & 1) << 3 |
             (ushort)(SUB161(auVar21 >> 0x27,0) & 1) << 4 |
             (ushort)(SUB161(auVar21 >> 0x2f,0) & 1) << 5 |
             (ushort)(SUB161(auVar21 >> 0x37,0) & 1) << 6 |
             (ushort)(SUB161(auVar21 >> 0x3f,0) & 1) << 7 |
             (ushort)(SUB161(auVar21 >> 0x47,0) & 1) << 8 |
             (ushort)(SUB161(auVar21 >> 0x4f,0) & 1) << 9 |
             (ushort)(SUB161(auVar21 >> 0x57,0) & 1) << 10 |
             (ushort)(SUB161(auVar21 >> 0x5f,0) & 1) << 0xb |
             (ushort)(SUB161(auVar21 >> 0x67,0) & 1) << 0xc |
             (ushort)(SUB161(auVar21 >> 0x6f,0) & 1) << 0xd |
             (ushort)(SUB161(auVar21 >> 0x77,0) & 1) << 0xe | (ushort)(auVar21[0xf] >> 7) << 0xf;
    uVar17 = (uint)uVar13;
    while (uVar13 != 0) {
      uVar8 = 0;
      for (uVar3 = uVar17; (uVar3 & 1) == 0; uVar3 = uVar3 >> 1 | 0x80000000) {
        uVar8 = uVar8 + 1;
      }
      uVar16 = uVar8 + uVar9 & uVar2;
      if (param_5 == *(long *)pauVar10[uVar16 * -3 + -3]) {
        pauVar10 = pauVar10 + uVar16 * -3;
        param_4[5] = *(undefined8 *)(pauVar10[-1] + 8);
        uVar11 = *(undefined8 *)(pauVar10[-3] + 8);
        uVar4 = *(undefined8 *)pauVar10[-2];
        uVar5 = *(undefined8 *)pauVar10[-1];
        param_4[3] = *(undefined8 *)(pauVar10[-2] + 8);
        param_4[4] = uVar5;
        param_4[1] = uVar11;
        param_4[2] = uVar4;
        uVar11 = 1;
        goto LAB_145bdea76;
      }
      uVar13 = (ushort)(uVar17 - 1) & (ushort)uVar17;
      uVar17 = CONCAT22((short)(uVar17 - 1 >> 0x10),uVar13);
    }
    if (bVar7) goto LAB_145bde9cb;
    uVar13 = (ushort)(SUB161(auVar1 >> 7,0) & 1) | (ushort)(SUB161(auVar1 >> 0xf,0) & 1) << 1 |
             (ushort)(SUB161(auVar1 >> 0x17,0) & 1) << 2 |
             (ushort)(SUB161(auVar1 >> 0x1f,0) & 1) << 3 |
             (ushort)(SUB161(auVar1 >> 0x27,0) & 1) << 4 |
             (ushort)(SUB161(auVar1 >> 0x2f,0) & 1) << 5 |
             (ushort)(SUB161(auVar1 >> 0x37,0) & 1) << 6 |
             (ushort)(SUB161(auVar1 >> 0x3f,0) & 1) << 7 |
             (ushort)(SUB161(auVar1 >> 0x47,0) & 1) << 8 |
             (ushort)(SUB161(auVar1 >> 0x4f,0) & 1) << 9 |
             (ushort)(SUB161(auVar1 >> 0x57,0) & 1) << 10 |
             (ushort)(SUB161(auVar1 >> 0x5f,0) & 1) << 0xb |
             (ushort)(SUB161(auVar1 >> 0x67,0) & 1) << 0xc |
             (ushort)(SUB161(auVar1 >> 0x6f,0) & 1) << 0xd |
             (ushort)(SUB161(auVar1 >> 0x77,0) & 1) << 0xe | (ushort)(bVar18 >> 7) << 0xf;
    if (uVar13 == 0) {
      bVar7 = false;
      puVar14 = (undefined8 *)0x0;
    }
    else {
      uVar17 = 0;
      for (uVar8 = (uint)uVar13; (uVar8 & 1) == 0; uVar8 = uVar8 >> 1 | 0x80000000) {
        uVar17 = uVar17 + 1;
      }
      puVar14 = (undefined8 *)(uVar17 + uVar9 & uVar2);
LAB_145bde9cb:
      auVar20[0] = -(auVar1[0] == -1);
      auVar20[1] = -(auVar1[1] == -1);
      auVar20[2] = -(auVar1[2] == -1);
      auVar20[3] = -(auVar1[3] == -1);
      auVar20[4] = -(auVar1[4] == -1);
      auVar20[5] = -(auVar1[5] == -1);
      auVar20[6] = -(auVar1[6] == -1);
      auVar20[7] = -(auVar1[7] == 0xff);
      auVar20[8] = -(auVar1[8] == -1);
      auVar20[9] = -(auVar1[9] == -1);
      auVar20[10] = -(auVar1[10] == -1);
      auVar20[0xb] = -(auVar1[0xb] == -1);
      auVar20[0xc] = -(auVar1[0xc] == -1);
      auVar20[0xd] = -(auVar1[0xd] == -1);
      auVar20[0xe] = -(auVar1[0xe] == -1);
      auVar20[0xf] = -(bVar18 == 0xff);
      if ((((((((((((((((SUB161(auVar20 >> 7,0) & 1) != 0 || (SUB161(auVar20 >> 0xf,0) & 1) != 0) ||
                      (SUB161(auVar20 >> 0x17,0) & 1) != 0) || (SUB161(auVar20 >> 0x1f,0) & 1) != 0)
                    || (SUB161(auVar20 >> 0x27,0) & 1) != 0) || (SUB161(auVar20 >> 0x2f,0) & 1) != 0
                   ) || (SUB161(auVar20 >> 0x37,0) & 1) != 0) ||
                 (SUB161(auVar20 >> 0x3f,0) & 1) != 0) || (SUB161(auVar20 >> 0x47,0) & 1) != 0) ||
               (SUB161(auVar20 >> 0x4f,0) & 1) != 0) || (SUB161(auVar20 >> 0x57,0) & 1) != 0) ||
             (SUB161(auVar20 >> 0x5f,0) & 1) != 0) || (SUB161(auVar20 >> 0x67,0) & 1) != 0) ||
           (SUB161(auVar20 >> 0x6f,0) & 1) != 0) || (SUB161(auVar20 >> 0x77,0) & 1) != 0) ||
          auVar20[0xf] < '\0') {
        bVar18 = (*pauVar10)[(long)puVar14];
        if (-1 < (char)bVar18) {
          auVar19 = *pauVar10;
          uVar17 = 0;
          for (uVar8 = (uint)(ushort)((ushort)(SUB161(auVar19 >> 7,0) & 1) |
                                      (ushort)(SUB161(auVar19 >> 0xf,0) & 1) << 1 |
                                      (ushort)(SUB161(auVar19 >> 0x17,0) & 1) << 2 |
                                      (ushort)(SUB161(auVar19 >> 0x1f,0) & 1) << 3 |
                                      (ushort)(SUB161(auVar19 >> 0x27,0) & 1) << 4 |
                                      (ushort)(SUB161(auVar19 >> 0x2f,0) & 1) << 5 |
                                      (ushort)(SUB161(auVar19 >> 0x37,0) & 1) << 6 |
                                      (ushort)(SUB161(auVar19 >> 0x3f,0) & 1) << 7 |
                                      (ushort)(SUB161(auVar19 >> 0x47,0) & 1) << 8 |
                                      (ushort)(SUB161(auVar19 >> 0x4f,0) & 1) << 9 |
                                      (ushort)(SUB161(auVar19 >> 0x57,0) & 1) << 10 |
                                      (ushort)(SUB161(auVar19 >> 0x5f,0) & 1) << 0xb |
                                      (ushort)(SUB161(auVar19 >> 0x67,0) & 1) << 0xc |
                                      (ushort)(SUB161(auVar19 >> 0x6f,0) & 1) << 0xd |
                                      (ushort)(SUB161(auVar19 >> 0x77,0) & 1) << 0xe |
                                     (ushort)(byte)(auVar19[0xf] >> 7) << 0xf); (uVar8 & 1) == 0;
              uVar8 = uVar8 >> 1 | 0x80000000) {
            uVar17 = uVar17 + 1;
          }
          puVar14 = (undefined8 *)(ulong)uVar17;
          bVar18 = (*pauVar10)[(long)puVar14];
        }
        bVar12 = bVar12 >> 1;
        (*pauVar10)[(long)puVar14] = bVar12;
        pauVar10[1][(ulong)(puVar14 + -2) & uVar2] = bVar12;
        lVar15 = param_3[3] - _DAT_1461b2178;
        param_3[2] = param_3[2] - (ulong)(bVar18 & 1);
        param_3[3] = lVar15;
        *(long *)pauVar10[(long)puVar14 * -3 + -3] = param_5;
        pauVar10 = pauVar10 + (long)puVar14 * -3;
        uVar11 = 0;
LAB_145bdea76:
        *(undefined8 *)(pauVar10[-1] + 8) = param_6[4];
        uVar4 = *param_6;
        uVar5 = param_6[1];
        uVar6 = param_6[3];
        *(undefined8 *)(pauVar10[-2] + 8) = param_6[2];
        *(undefined8 *)pauVar10[-1] = uVar6;
        *(undefined8 *)(pauVar10[-3] + 8) = uVar4;
        *(undefined8 *)pauVar10[-2] = uVar5;
        *param_4 = uVar11;
        return;
      }
      bVar7 = true;
    }
    uVar9 = uVar9 + lVar15 + 0x10;
    lVar15 = lVar15 + 0x10;
  } while( true );
}

