
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(long param_1,long param_2,long param_3)

{
  char *pcVar1;
  undefined1 auVar2 [16];
  code *pcVar3;
  uint uVar4;
  uint uVar5;
  undefined1 *puVar6;
  long lVar7;
  ulong uVar8;
  long unaff_RBX;
  long lVar9;
  uint uVar10;
  ushort uVar11;
  ulong uVar12;
  bool bVar13;
  undefined1 auVar14 [16];
  undefined1 auVar15 [16];
  undefined1 auVar16 [16];
  undefined1 *local_b0;
  long lStack_a8;
  long local_a0;
  undefined1 *local_98;
  undefined1 *puStack_90;
  undefined1 *local_88;
  undefined1 *local_80;
  undefined8 local_78;
  undefined1 *local_70;
  undefined8 local_68;
  undefined1 local_60;
  undefined2 local_58;
  undefined8 local_50;
  undefined1 *local_48;
  undefined1 local_39;
  undefined8 local_38;
  
  local_38 = 0xfffffffffffffffe;
  if (*(long *)(param_3 + 0x90) != 0) {
    lVar7 = *(long *)(param_3 + 0x78);
    uVar8 = 0x601d61bdae52bb63;
    lVar9 = 0;
    while( true ) {
      uVar8 = uVar8 & *(ulong *)(param_3 + 0x80);
      auVar2 = *(undefined1 (*) [16])(lVar7 + uVar8);
      auVar15[0] = -(auVar2[0] == DAT_146231d80);
      auVar15[1] = -(auVar2[1] == DAT_146231d80._1_1_);
      auVar15[2] = -(auVar2[2] == DAT_146231d80._2_1_);
      auVar15[3] = -(auVar2[3] == DAT_146231d80._3_1_);
      auVar15[4] = -(auVar2[4] == DAT_146231d80._4_1_);
      auVar15[5] = -(auVar2[5] == DAT_146231d80._5_1_);
      auVar15[6] = -(auVar2[6] == DAT_146231d80._6_1_);
      auVar15[7] = -(auVar2[7] == DAT_146231d80._7_1_);
      auVar15[8] = -(auVar2[8] == DAT_146231d80._8_1_);
      auVar15[9] = -(auVar2[9] == DAT_146231d80._9_1_);
      auVar15[10] = -(auVar2[10] == DAT_146231d80._10_1_);
      auVar15[0xb] = -(auVar2[0xb] == DAT_146231d80._11_1_);
      auVar15[0xc] = -(auVar2[0xc] == DAT_146231d80._12_1_);
      auVar15[0xd] = -(auVar2[0xd] == DAT_146231d80._13_1_);
      auVar15[0xe] = -(auVar2[0xe] == DAT_146231d80._14_1_);
      auVar15[0xf] = -(auVar2[0xf] == DAT_146231d80._15_1_);
      uVar11 = (ushort)(SUB161(auVar15 >> 7,0) & 1) | (ushort)(SUB161(auVar15 >> 0xf,0) & 1) << 1 |
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
               (ushort)(SUB161(auVar15 >> 0x77,0) & 1) << 0xe | (ushort)(auVar15[0xf] >> 7) << 0xf;
      uVar10 = (uint)uVar11;
      while (param_2 = param_3, uVar11 != 0) {
        uVar4 = 0;
        for (uVar5 = uVar10; (uVar5 & 1) == 0; uVar5 = uVar5 >> 1 | 0x80000000) {
          uVar4 = uVar4 + 1;
        }
        uVar12 = uVar4 + uVar8 & *(ulong *)(param_3 + 0x80);
        pcVar1 = (char *)(lVar7 + -0x18 + uVar12 * -0x18);
        auVar16[0] = -(*pcVar1 == DAT_146248ae0);
        auVar16[1] = -(pcVar1[1] == DAT_146248ae0._1_1_);
        auVar16[2] = -(pcVar1[2] == DAT_146248ae0._2_1_);
        auVar16[3] = -(pcVar1[3] == DAT_146248ae0._3_1_);
        auVar16[4] = -(pcVar1[4] == DAT_146248ae0._4_1_);
        auVar16[5] = -(pcVar1[5] == DAT_146248ae0._5_1_);
        auVar16[6] = -(pcVar1[6] == DAT_146248ae0._6_1_);
        auVar16[7] = -(pcVar1[7] == DAT_146248ae0._7_1_);
        auVar16[8] = -(pcVar1[8] == DAT_146248ae0._8_1_);
        auVar16[9] = -(pcVar1[9] == DAT_146248ae0._9_1_);
        auVar16[10] = -(pcVar1[10] == DAT_146248ae0._10_1_);
        auVar16[0xb] = -(pcVar1[0xb] == DAT_146248ae0._11_1_);
        auVar16[0xc] = -(pcVar1[0xc] == DAT_146248ae0._12_1_);
        auVar16[0xd] = -(pcVar1[0xd] == DAT_146248ae0._13_1_);
        auVar16[0xe] = -(pcVar1[0xe] == DAT_146248ae0._14_1_);
        auVar16[0xf] = -(pcVar1[0xf] == DAT_146248ae0._15_1_);
        if ((ushort)((ushort)(SUB161(auVar16 >> 7,0) & 1) |
                     (ushort)(SUB161(auVar16 >> 0xf,0) & 1) << 1 |
                     (ushort)(SUB161(auVar16 >> 0x17,0) & 1) << 2 |
                     (ushort)(SUB161(auVar16 >> 0x1f,0) & 1) << 3 |
                     (ushort)(SUB161(auVar16 >> 0x27,0) & 1) << 4 |
                     (ushort)(SUB161(auVar16 >> 0x2f,0) & 1) << 5 |
                     (ushort)(SUB161(auVar16 >> 0x37,0) & 1) << 6 |
                     (ushort)(SUB161(auVar16 >> 0x3f,0) & 1) << 7 |
                     (ushort)(SUB161(auVar16 >> 0x47,0) & 1) << 8 |
                     (ushort)(SUB161(auVar16 >> 0x4f,0) & 1) << 9 |
                     (ushort)(SUB161(auVar16 >> 0x57,0) & 1) << 10 |
                     (ushort)(SUB161(auVar16 >> 0x5f,0) & 1) << 0xb |
                     (ushort)(SUB161(auVar16 >> 0x67,0) & 1) << 0xc |
                     (ushort)(SUB161(auVar16 >> 0x6f,0) & 1) << 0xd |
                     (ushort)(SUB161(auVar16 >> 0x77,0) & 1) << 0xe |
                    (ushort)(auVar16[0xf] >> 7) << 0xf) == 0xffff) {
          uVar8 = *(ulong *)(lVar7 + uVar12 * -0x18 + -8);
          if ((uVar8 < *(ulong *)(param_3 + 0x218)) &&
             (uVar8 = *(ulong *)(*(long *)(param_3 + 0x210) + uVar8 * 8), uVar8 != 0)) {
            lVar7 = ~uVar8 * 0x38;
            if (*(char *)(*(long *)(param_3 + 0x1e0) + 0x30 + lVar7) != '\0') {
              if (*(char *)(*(long *)(*(long *)(param_3 + 0x1e0) + lVar7 + 0x10) + 0x80) == -1) {
                local_98 = (undefined1 *)0xffffffffffffffff;
                bVar13 = true;
              }
              else {
                func_0x000140664650(param_1,param_3,param_3,&local_98,0x146260c5a,0x11);
                local_48 = local_98;
                local_50 = puStack_90;
                if (local_98 == (undefined1 *)0xffffffffffffffff) {
                  local_88 = (undefined1 *)0x0;
                  local_48 = (undefined1 *)0x0;
                  local_50 = (undefined1 *)1;
                }
                local_98 = (undefined1 *)0x0;
                local_78 = 0;
                local_68 = 0x2c0000002c;
                local_60 = 1;
                local_58 = 1;
                puStack_90 = local_88;
                local_80 = local_88;
                local_88 = local_50;
                local_70 = local_80;
                func_0x0001400fea90();
                if (local_48 != (undefined1 *)0x0) {
                  func_0x0001400021d0();
                }
                local_98 = local_b0;
                bVar13 = local_b0 == (undefined1 *)0xffffffffffffffff;
                unaff_RBX = local_a0;
                param_1 = lStack_a8;
              }
              puVar6 = local_98;
              func_0x000140665800();
              if (!bVar13) {
                if (unaff_RBX != 0) {
                  param_1 = param_1 + 8;
                  do {
                    if (*(long *)(param_1 + -8) != 0) {
                      func_0x0001400021d0();
                    }
                    param_1 = param_1 + 0x18;
                    unaff_RBX = unaff_RBX + -1;
                  } while (unaff_RBX != 0);
                }
                if (puVar6 != (undefined1 *)0x0) {
                  func_0x0001400021d0();
                }
              }
              return;
            }
          }
          goto LAB_140213acb;
        }
        uVar11 = (ushort)(uVar10 - 1) & (ushort)uVar10;
        uVar10 = CONCAT22((short)(uVar10 - 1 >> 0x10),uVar11);
      }
      auVar14[0] = -(auVar2[0] == -1);
      auVar14[1] = -(auVar2[1] == -1);
      auVar14[2] = -(auVar2[2] == -1);
      auVar14[3] = -(auVar2[3] == -1);
      auVar14[4] = -(auVar2[4] == -1);
      auVar14[5] = -(auVar2[5] == -1);
      auVar14[6] = -(auVar2[6] == -1);
      auVar14[7] = -(auVar2[7] == -1);
      auVar14[8] = -(auVar2[8] == -1);
      auVar14[9] = -(auVar2[9] == -1);
      auVar14[10] = -(auVar2[10] == -1);
      auVar14[0xb] = -(auVar2[0xb] == -1);
      auVar14[0xc] = -(auVar2[0xc] == -1);
      auVar14[0xd] = -(auVar2[0xd] == -1);
      auVar14[0xe] = -(auVar2[0xe] == -1);
      auVar14[0xf] = -(auVar2[0xf] == -1);
      if ((((((((((((((((SUB161(auVar14 >> 7,0) & 1) != 0 || (SUB161(auVar14 >> 0xf,0) & 1) != 0) ||
                      (SUB161(auVar14 >> 0x17,0) & 1) != 0) || (SUB161(auVar14 >> 0x1f,0) & 1) != 0)
                    || (SUB161(auVar14 >> 0x27,0) & 1) != 0) || (SUB161(auVar14 >> 0x2f,0) & 1) != 0
                   ) || (SUB161(auVar14 >> 0x37,0) & 1) != 0) ||
                 (SUB161(auVar14 >> 0x3f,0) & 1) != 0) || (SUB161(auVar14 >> 0x47,0) & 1) != 0) ||
               (SUB161(auVar14 >> 0x4f,0) & 1) != 0) || (SUB161(auVar14 >> 0x57,0) & 1) != 0) ||
             (SUB161(auVar14 >> 0x5f,0) & 1) != 0) || (SUB161(auVar14 >> 0x67,0) & 1) != 0) ||
           (SUB161(auVar14 >> 0x6f,0) & 1) != 0) || (SUB161(auVar14 >> 0x77,0) & 1) != 0) ||
          auVar14[0xf] < '\0') break;
      uVar8 = uVar8 + lVar9 + 0x10;
      lVar9 = lVar9 + 0x10;
    }
  }
LAB_140213acb:
  local_98 = &local_39;
  puStack_90 = (undefined1 *)0x145221310;
  func_0x000146208ee0(param_1,param_2,&local_98,0x146260450,0x1462612b0);
                    /* WARNING: Does not return */
  pcVar3 = (code *)invalidInstructionException();
  (*pcVar3)();
}

