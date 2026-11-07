/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

long entry(undefined8 param_1,long param_2,undefined8 param_3,long param_4)

{
  char *pcVar1;
  undefined1 auVar2 [16];
  code *pcVar3;
  uint uVar4;
  uint uVar5;
  undefined8 uVar6;
  long lVar7;
  ulong uVar8;
  long lVar9;
  uint uVar10;
  ushort uVar11;
  ulong uVar12;
  undefined1 auVar13 [16];
  undefined1 auVar14 [16];
  undefined1 auVar15 [16];
  undefined1 local_a9;
  long local_a8;
  undefined1 *local_88;
  undefined8 local_80;

  if (*(long *)(param_4 + 0x90) != 0) {
    lVar7 = *(long *)(param_4 + 0x78);
    uVar8 = 0x722e4192a073d16;
    lVar9 = 0;
    while( true ) {
      uVar8 = uVar8 & *(ulong *)(param_4 + 0x80);
      auVar2 = *(undefined1 (*) [16])(lVar7 + uVar8);
      auVar14[0] = -(auVar2[0] == DAT_145db5da0);
      auVar14[1] = -(auVar2[1] == DAT_145db5da0._1_1_);
      auVar14[2] = -(auVar2[2] == DAT_145db5da0._2_1_);
      auVar14[3] = -(auVar2[3] == DAT_145db5da0._3_1_);
      auVar14[4] = -(auVar2[4] == DAT_145db5da0._4_1_);
      auVar14[5] = -(auVar2[5] == DAT_145db5da0._5_1_);
      auVar14[6] = -(auVar2[6] == DAT_145db5da0._6_1_);
      auVar14[7] = -(auVar2[7] == DAT_145db5da0._7_1_);
      auVar14[8] = -(auVar2[8] == DAT_145db5da0._8_1_);
      auVar14[9] = -(auVar2[9] == DAT_145db5da0._9_1_);
      auVar14[10] = -(auVar2[10] == DAT_145db5da0._10_1_);
      auVar14[0xb] = -(auVar2[0xb] == DAT_145db5da0._11_1_);
      auVar14[0xc] = -(auVar2[0xc] == DAT_145db5da0._12_1_);
      auVar14[0xd] = -(auVar2[0xd] == DAT_145db5da0._13_1_);
      auVar14[0xe] = -(auVar2[0xe] == DAT_145db5da0._14_1_);
      auVar14[0xf] = -(auVar2[0xf] == DAT_145db5da0._15_1_);
      uVar11 = (ushort)(SUB161(auVar14 >> 7,0) & 1) | (ushort)(SUB161(auVar14 >> 0xf,0) & 1) << 1 |
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
      uVar10 = (uint)uVar11;
      while (param_2 = param_4, uVar11 != 0) {
        uVar4 = 0;
        for (uVar5 = uVar10; (uVar5 & 1) == 0; uVar5 = uVar5 >> 1 | 0x80000000) {
          uVar4 = uVar4 + 1;
        }
        uVar12 = uVar4 + uVar8 & *(ulong *)(param_4 + 0x80);
        pcVar1 = (char *)(lVar7 + -0x18 + uVar12 * -0x18);
        auVar15[0] = -(*pcVar1 == DAT_145db5db0);
        auVar15[1] = -(pcVar1[1] == DAT_145db5db0._1_1_);
        auVar15[2] = -(pcVar1[2] == DAT_145db5db0._2_1_);
        auVar15[3] = -(pcVar1[3] == DAT_145db5db0._3_1_);
        auVar15[4] = -(pcVar1[4] == DAT_145db5db0._4_1_);
        auVar15[5] = -(pcVar1[5] == DAT_145db5db0._5_1_);
        auVar15[6] = -(pcVar1[6] == DAT_145db5db0._6_1_);
        auVar15[7] = -(pcVar1[7] == DAT_145db5db0._7_1_);
        auVar15[8] = -(pcVar1[8] == DAT_145db5db0._8_1_);
        auVar15[9] = -(pcVar1[9] == DAT_145db5db0._9_1_);
        auVar15[10] = -(pcVar1[10] == DAT_145db5db0._10_1_);
        auVar15[0xb] = -(pcVar1[0xb] == DAT_145db5db0._11_1_);
        auVar15[0xc] = -(pcVar1[0xc] == DAT_145db5db0._12_1_);
        auVar15[0xd] = -(pcVar1[0xd] == DAT_145db5db0._13_1_);
        auVar15[0xe] = -(pcVar1[0xe] == DAT_145db5db0._14_1_);
        auVar15[0xf] = -(pcVar1[0xf] == DAT_145db5db0._15_1_);
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
          uVar8 = *(ulong *)(lVar7 + uVar12 * -0x18 + -8);
          if ((uVar8 < *(ulong *)(param_4 + 0x218)) &&
             (uVar8 = *(ulong *)(*(long *)(param_4 + 0x210) + uVar8 * 8), uVar8 != 0)) {
            lVar7 = ~uVar8 * 0x38;
            if (*(char *)(*(long *)(param_4 + 0x1e0) + 0x30 + lVar7) != '\0') {
              *(undefined4 *)(*(long *)(param_4 + 0x1e0) + lVar7 + 0x2c) =
                   *(undefined4 *)(param_4 + 0x5b0);
              uVar6 = func_0x000140003c40();
              func_0x00014006cdd0(uVar6);
              func_0x000140008db0();
              if (local_a8 != 0) {
                func_0x0001400021d0();
              }
              return param_4;
            }
          }
          goto LAB_140159361;
        }
        uVar11 = (ushort)(uVar10 - 1) & (ushort)uVar10;
        uVar10 = CONCAT22((short)(uVar10 - 1 >> 0x10),uVar11);
      }
      auVar13[0] = -(auVar2[0] == -1);
      auVar13[1] = -(auVar2[1] == -1);
      auVar13[2] = -(auVar2[2] == -1);
      auVar13[3] = -(auVar2[3] == -1);
      auVar13[4] = -(auVar2[4] == -1);
      auVar13[5] = -(auVar2[5] == -1);
      auVar13[6] = -(auVar2[6] == -1);
      auVar13[7] = -(auVar2[7] == -1);
      auVar13[8] = -(auVar2[8] == -1);
      auVar13[9] = -(auVar2[9] == -1);
      auVar13[10] = -(auVar2[10] == -1);
      auVar13[0xb] = -(auVar2[0xb] == -1);
      auVar13[0xc] = -(auVar2[0xc] == -1);
      auVar13[0xd] = -(auVar2[0xd] == -1);
      auVar13[0xe] = -(auVar2[0xe] == -1);
      auVar13[0xf] = -(auVar2[0xf] == -1);
      if ((((((((((((((((SUB161(auVar13 >> 7,0) & 1) != 0 || (SUB161(auVar13 >> 0xf,0) & 1) != 0) ||
                      (SUB161(auVar13 >> 0x17,0) & 1) != 0) || (SUB161(auVar13 >> 0x1f,0) & 1) != 0)
                    || (SUB161(auVar13 >> 0x27,0) & 1) != 0) || (SUB161(auVar13 >> 0x2f,0) & 1) != 0
                   ) || (SUB161(auVar13 >> 0x37,0) & 1) != 0) ||
                 (SUB161(auVar13 >> 0x3f,0) & 1) != 0) || (SUB161(auVar13 >> 0x47,0) & 1) != 0) ||
               (SUB161(auVar13 >> 0x4f,0) & 1) != 0) || (SUB161(auVar13 >> 0x57,0) & 1) != 0) ||
             (SUB161(auVar13 >> 0x5f,0) & 1) != 0) || (SUB161(auVar13 >> 0x67,0) & 1) != 0) ||
           (SUB161(auVar13 >> 0x6f,0) & 1) != 0) || (SUB161(auVar13 >> 0x77,0) & 1) != 0) ||
          auVar13[0xf] < '\0') break;
      uVar8 = uVar8 + lVar9 + 0x10;
      lVar9 = lVar9 + 0x10;
    }
  }
LAB_140159361:
  local_88 = &local_a9;
  local_80 = 0x144fe6670;
  func_0x000145d699c0(param_1,param_2,&local_88,0x145db61d0,0x145db61b8);
                    /* WARNING: Does not return */
  pcVar3 = (code *)invalidInstructionException();
  (*pcVar3)();
}
