/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,undefined8 *param_3,undefined8 param_4,
          long *param_5,undefined8 *param_6)

{
  char *pcVar1;
  byte bVar2;
  undefined4 uVar3;
  undefined4 *puVar4;
  uint uVar5;
  uint uVar6;
  double dVar7;
  undefined8 *puVar8;
  int *piVar9;
  uint uVar10;
  ulong uVar11;
  undefined8 *puVar12;
  long lVar13;
  long lVar14;
  ushort uVar15;
  undefined8 uVar16;
  undefined1 auVar17 [16];
  undefined1 auVar19 [16];
  undefined1 auVar20 [16];
  undefined4 in_XMM6_Da;
  float fVar21;
  float fVar22;
  undefined4 in_XMM7_Da;
  float fVar23;
  float fVar24;
  undefined4 uVar25;
  undefined4 uVar26;
  undefined4 uVar27;
  undefined4 uVar28;
  undefined4 uVar29;
  undefined4 uVar30;
  undefined4 *in_stack_00000028;
  undefined8 local_170;
  undefined8 uStack_168;
  long local_160;
  undefined8 local_158;
  ulong local_150;
  undefined8 *local_148;
  int *local_140;
  undefined8 *local_138;
  undefined8 local_130;
  long local_128;
  undefined8 local_120;
  undefined8 local_118;
  undefined8 uStack_110;
  undefined8 local_108;
  undefined8 local_100;
  undefined1 local_f8 [8];
  undefined4 local_f0;
  undefined8 local_e8;
  undefined8 local_e0;
  undefined8 local_d8;
  undefined4 local_d0;
  undefined8 local_c0;
  long local_b8;
  undefined8 local_b0;
  long local_a8;
  undefined8 local_a0;
  long local_98;
  undefined8 local_90;
  undefined4 local_88;
  undefined4 local_78;
  undefined1 auVar18 [16];

  local_90 = 0xfffffffffffffffe;
  puVar12 = (undefined8 *)*param_3;
  bVar2 = *(byte *)(puVar12 + 4);
  if (bVar2 == 2) {
    return;
  }
  puVar4 = (undefined4 *)param_3[2];
  uVar3 = *(undefined4 *)((long)param_3 + 0x1c);
  param_5 = (long *)*param_5;
  uVar25 = *in_stack_00000028;
  uVar26 = in_stack_00000028[1];
  uVar27 = in_stack_00000028[2];
  uVar28 = in_stack_00000028[3];
  uVar29 = (undefined4)*(undefined8 *)(in_stack_00000028 + 4);
  uVar30 = (undefined4)((ulong)*(undefined8 *)(in_stack_00000028 + 4) >> 0x20);
  fVar23 = (float)puVar12[3];
  fVar24 = (float)((ulong)puVar12[3] >> 0x20);
  fVar21 = (float)*(undefined8 *)((long)puVar12 + 0x24);
  fVar22 = (float)((ulong)*(undefined8 *)((long)puVar12 + 0x24) >> 0x20);
  local_88 = in_XMM6_Da;
  local_78 = in_XMM7_Da;
  if (param_5[3] != 0) {
    uVar11 = 0x5317300c6b349d75;
    lVar14 = 0;
    while( true ) {
      uVar11 = uVar11 & param_5[1];
      pcVar1 = (char *)(*param_5 + uVar11);
      auVar18[0] = -(*pcVar1 == DAT_145d6dcc0);
      auVar18[1] = -(pcVar1[1] == DAT_145d6dcc0._1_1_);
      auVar18[2] = -(pcVar1[2] == DAT_145d6dcc0._2_1_);
      auVar18[3] = -(pcVar1[3] == DAT_145d6dcc0._3_1_);
      auVar18[4] = -(pcVar1[4] == DAT_145d6dcc0._4_1_);
      auVar18[5] = -(pcVar1[5] == DAT_145d6dcc0._5_1_);
      auVar18[6] = -(pcVar1[6] == DAT_145d6dcc0._6_1_);
      auVar18[7] = -(pcVar1[7] == DAT_145d6dcc0._7_1_);
      auVar18[8] = -(pcVar1[8] == DAT_145d6dcc0._8_1_);
      auVar18[9] = -(pcVar1[9] == DAT_145d6dcc0._9_1_);
      auVar18[10] = -(pcVar1[10] == DAT_145d6dcc0._10_1_);
      auVar18[0xb] = -(pcVar1[0xb] == DAT_145d6dcc0._11_1_);
      auVar18[0xc] = -(pcVar1[0xc] == DAT_145d6dcc0._12_1_);
      auVar18[0xd] = -(pcVar1[0xd] == DAT_145d6dcc0._13_1_);
      auVar18[0xe] = -(pcVar1[0xe] == DAT_145d6dcc0._14_1_);
      auVar18[0xf] = -(pcVar1[0xf] == DAT_145d6dcc0._15_1_);
      uVar15 = (ushort)(SUB161(auVar18 >> 7,0) & 1) | (ushort)(SUB161(auVar18 >> 0xf,0) & 1) << 1 |
               (ushort)(SUB161(auVar18 >> 0x17,0) & 1) << 2 |
               (ushort)(SUB161(auVar18 >> 0x1f,0) & 1) << 3 |
               (ushort)(SUB161(auVar18 >> 0x27,0) & 1) << 4 |
               (ushort)(SUB161(auVar18 >> 0x2f,0) & 1) << 5 |
               (ushort)(SUB161(auVar18 >> 0x37,0) & 1) << 6 |
               (ushort)(SUB161(auVar18 >> 0x3f,0) & 1) << 7 |
               (ushort)(SUB161(auVar18 >> 0x47,0) & 1) << 8 |
               (ushort)(SUB161(auVar18 >> 0x4f,0) & 1) << 9 |
               (ushort)(SUB161(auVar18 >> 0x57,0) & 1) << 10 |
               (ushort)(SUB161(auVar18 >> 0x5f,0) & 1) << 0xb |
               (ushort)(SUB161(auVar18 >> 0x67,0) & 1) << 0xc |
               (ushort)(SUB161(auVar18 >> 0x6f,0) & 1) << 0xd |
               (ushort)(SUB161(auVar18 >> 0x77,0) & 1) << 0xe | (ushort)(auVar18[0xf] >> 7) << 0xf;
      uVar10 = (uint)uVar15;
      while (uVar15 != 0) {
        uVar5 = 0;
        for (uVar6 = uVar10; (uVar6 & 1) == 0; uVar6 = uVar6 >> 1 | 0x80000000) {
          uVar5 = uVar5 + 1;
        }
        if (*(short *)(*param_5 + (uVar5 + uVar11 & param_5[1]) * -4 + -4) == 0) goto LAB_140275794;
        uVar15 = (ushort)(uVar10 - 1) & (ushort)uVar10;
        uVar10 = CONCAT22((short)(uVar10 - 1 >> 0x10),uVar15);
      }
      auVar20[0] = -(*pcVar1 == -1);
      auVar20[1] = -(pcVar1[1] == -1);
      auVar20[2] = -(pcVar1[2] == -1);
      auVar20[3] = -(pcVar1[3] == -1);
      auVar20[4] = -(pcVar1[4] == -1);
      auVar20[5] = -(pcVar1[5] == -1);
      auVar20[6] = -(pcVar1[6] == -1);
      auVar20[7] = -(pcVar1[7] == -1);
      auVar20[8] = -(pcVar1[8] == -1);
      auVar20[9] = -(pcVar1[9] == -1);
      auVar20[10] = -(pcVar1[10] == -1);
      auVar20[0xb] = -(pcVar1[0xb] == -1);
      auVar20[0xc] = -(pcVar1[0xc] == -1);
      auVar20[0xd] = -(pcVar1[0xd] == -1);
      auVar20[0xe] = -(pcVar1[0xe] == -1);
      auVar20[0xf] = -(pcVar1[0xf] == -1);
      if ((((((((((((((((SUB161(auVar20 >> 7,0) & 1) != 0 || (SUB161(auVar20 >> 0xf,0) & 1) != 0) ||
                      (SUB161(auVar20 >> 0x17,0) & 1) != 0) || (SUB161(auVar20 >> 0x1f,0) & 1) != 0)
                    || (SUB161(auVar20 >> 0x27,0) & 1) != 0) || (SUB161(auVar20 >> 0x2f,0) & 1) != 0
                   ) || (SUB161(auVar20 >> 0x37,0) & 1) != 0) ||
                 (SUB161(auVar20 >> 0x3f,0) & 1) != 0) || (SUB161(auVar20 >> 0x47,0) & 1) != 0) ||
               (SUB161(auVar20 >> 0x4f,0) & 1) != 0) || (SUB161(auVar20 >> 0x57,0) & 1) != 0) ||
             (SUB161(auVar20 >> 0x5f,0) & 1) != 0) || (SUB161(auVar20 >> 0x67,0) & 1) != 0) ||
           (SUB161(auVar20 >> 0x6f,0) & 1) != 0) || (SUB161(auVar20 >> 0x77,0) & 1) != 0) ||
          auVar20[0xf] < '\0') break;
      uVar11 = uVar11 + lVar14 + 0x10;
      lVar14 = lVar14 + 0x10;
    }
  }
  func_0x000143608050(puVar12,*param_6,*param_6,&local_118);
  if (local_f8 == (undefined1  [8])0x0) {
    *puVar4 = uVar3;
    *(undefined1 *)(puVar12 + 4) = 2;
    local_b8 = 0;
    local_b0 = 1;
    local_a8 = 0;
    local_f0 = *(undefined4 *)(puVar12 + 1);
    local_f8 = (undefined1  [8])*puVar12;
    local_d8 = *(undefined8 *)((long)puVar12 + 0xc);
    local_d0 = *(undefined4 *)((long)puVar12 + 0x14);
    local_108 = 0x145dc0173;
    local_100 = 5;
    local_e8 = 0x145dc0178;
    local_e0 = 5;
    lVar14 = 0;
    for (lVar13 = 0; lVar13 != 2; lVar13 = lVar13 + 1) {
      if (*(uint *)(local_f8 + lVar13 * 0x20) == 2) break;
      local_170 = (&local_108)[lVar13 * 4];
      uStack_168 = (&local_100)[lVar13 * 4];
      if ((*(uint *)(local_f8 + lVar13 * 0x20) & 1) != 0) {
        local_148 = &local_170;
        local_140 = (int *)0x1400020c0;
        local_138 = &local_c0;
        local_130 = 0x145bad280;
        local_128 = (long)&local_c0 + 4;
        local_120 = 0x145bad280;
        local_c0 = *(undefined8 *)(local_f8 + lVar13 * 0x20 + 4);
        func_0x000145b9c4d0();
        uVar11 = local_150;
        local_98 = local_160;
        local_a0 = local_158;
        if ((ulong)(local_b8 - lVar14) < local_150) {
          func_0x000145bcb2d0();
          lVar14 = local_a8;
LAB_1402759f6:
          func_0x000145bc977b();
        }
        else if (local_150 != 0) goto LAB_1402759f6;
        lVar14 = lVar14 + uVar11;
        local_a8 = lVar14;
        if (local_98 != 0) {
          func_0x0001400021d0();
        }
      }
    }
    func_0x0001458dc8c0();
    if (local_b8 == 0) {
      return;
    }
    func_0x0001400021d0();
    return;
  }
  if ((ushort)local_100 == 0) {
    do {
      auVar18 = *uStack_110;
      uStack_110 = uStack_110 + 1;
    } while ((ushort)((ushort)(SUB161(auVar18 >> 7,0) & 1) |
                      (ushort)(SUB161(auVar18 >> 0xf,0) & 1) << 1 |
                      (ushort)(SUB161(auVar18 >> 0x17,0) & 1) << 2 |
                      (ushort)(SUB161(auVar18 >> 0x1f,0) & 1) << 3 |
                      (ushort)(SUB161(auVar18 >> 0x27,0) & 1) << 4 |
                      (ushort)(SUB161(auVar18 >> 0x2f,0) & 1) << 5 |
                      (ushort)(SUB161(auVar18 >> 0x37,0) & 1) << 6 |
                      (ushort)(SUB161(auVar18 >> 0x3f,0) & 1) << 7 |
                      (ushort)(SUB161(auVar18 >> 0x47,0) & 1) << 8 |
                      (ushort)(SUB161(auVar18 >> 0x4f,0) & 1) << 9 |
                      (ushort)(SUB161(auVar18 >> 0x57,0) & 1) << 10 |
                      (ushort)(SUB161(auVar18 >> 0x5f,0) & 1) << 0xb |
                      (ushort)(SUB161(auVar18 >> 0x67,0) & 1) << 0xc |
                      (ushort)(SUB161(auVar18 >> 0x6f,0) & 1) << 0xd |
                      (ushort)(SUB161(auVar18 >> 0x77,0) & 1) << 0xe |
                     (ushort)(byte)(auVar18[0xf] >> 7) << 0xf) == 0xffff);
  }
LAB_140275794:
  local_118 = CONCAT44(uVar26,uVar25);
  uStack_110 = (undefined1 (*) [16])CONCAT44(uVar28,uVar27);
  local_108 = CONCAT44(uVar30,uVar29);
  func_0x0001400118b0();
  if ((char)local_148 == '\x01') {
    return;
  }
  if (*local_140 == 1) {
    dVar7 = *(double *)(local_140 + 2);
    if ((((0.0 <= dVar7) && (0.0 <= *(double *)(local_140 + 4))) &&
        (dVar7 < (double)(uint)local_140[0x30])) &&
       (*(double *)(local_140 + 4) < (double)(uint)local_140[0x31])) {
      auVar17._0_4_ = (float)dVar7;
      auVar17._4_4_ = (float)*(double *)(local_140 + 4);
      auVar17._8_8_ = 0;
      piVar9 = local_140 + 0x32;
      if ((char)local_140[0x2e] != '\0') {
        piVar9 = local_140 + 0x2f;
      }
      auVar19._4_4_ = *piVar9;
      auVar19._0_4_ = *piVar9;
      auVar19._8_8_ = 0;
      auVar18 = divps(auVar17,auVar19);
      uVar16 = auVar18._0_8_;
      goto LAB_1402758b3;
    }
  }
  func_0x000143608050();
  if (local_f8 == (undefined1  [8])0x0) {
    return;
  }
  uVar10 = (uint)(ushort)local_100;
  if ((ushort)local_100 == 0) {
    do {
      auVar18 = *uStack_110;
      local_118 = local_118 + -0x880;
      uStack_110 = uStack_110 + 1;
      uVar10 = (ushort)((ushort)(SUB161(auVar18 >> 7,0) & 1) |
                        (ushort)(SUB161(auVar18 >> 0xf,0) & 1) << 1 |
                        (ushort)(SUB161(auVar18 >> 0x17,0) & 1) << 2 |
                        (ushort)(SUB161(auVar18 >> 0x1f,0) & 1) << 3 |
                        (ushort)(SUB161(auVar18 >> 0x27,0) & 1) << 4 |
                        (ushort)(SUB161(auVar18 >> 0x2f,0) & 1) << 5 |
                        (ushort)(SUB161(auVar18 >> 0x37,0) & 1) << 6 |
                        (ushort)(SUB161(auVar18 >> 0x3f,0) & 1) << 7 |
                        (ushort)(SUB161(auVar18 >> 0x47,0) & 1) << 8 |
                        (ushort)(SUB161(auVar18 >> 0x4f,0) & 1) << 9 |
                        (ushort)(SUB161(auVar18 >> 0x57,0) & 1) << 10 |
                        (ushort)(SUB161(auVar18 >> 0x5f,0) & 1) << 0xb |
                        (ushort)(SUB161(auVar18 >> 0x67,0) & 1) << 0xc |
                        (ushort)(SUB161(auVar18 >> 0x6f,0) & 1) << 0xd |
                        (ushort)(SUB161(auVar18 >> 0x77,0) & 1) << 0xe |
                       (ushort)(byte)(auVar18[0xf] >> 7) << 0xf) ^ 0xffff;
    } while (uVar10 == 0);
  }
  uVar5 = 0;
  for (; (uVar10 & 1) == 0; uVar10 = uVar10 >> 1 | 0x80000000) {
    uVar5 = uVar5 + 1;
  }
  uVar16 = *(undefined8 *)(local_118 + -8 + ((ulong)uVar5 * -0x80 - (ulong)(uVar5 << 3)));
LAB_1402758b3:
  *puVar4 = uVar3;
  puVar8 = (undefined8 *)((long)puVar12 + 0xc);
  if ((bVar2 & 1) == 0) {
    puVar8 = puVar12;
  }
  *(undefined4 *)puVar8 = 1;
  *(ulong *)((long)puVar8 + 4) =
       CONCAT44((fVar22 + (float)((ulong)uVar16 >> 0x20)) - fVar24,(fVar21 + (float)uVar16) - fVar23
               );
  return;
}
