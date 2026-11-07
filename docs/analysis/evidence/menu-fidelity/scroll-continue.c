/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,long param_2,undefined8 *param_3,undefined8 param_4,long *param_5,
          undefined8 *param_6)

{
  char *pcVar1;
  double dVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  int *piVar5;
  undefined4 *puVar6;
  undefined8 uVar7;
  long lVar8;
  long lVar9;
  undefined8 uVar10;
  undefined8 uVar11;
  uint uVar12;
  uint uVar13;
  float fVar14;
  undefined1 (*pauVar15) [16];
  ulong uVar16;
  float *pfVar17;
  int *piVar18;
  ulong uVar19;
  long lVar20;
  uint uVar21;
  long lVar22;
  ulong uVar23;
  ushort uVar24;
  long lVar25;
  char cVar26;
  float fVar27;
  float fVar28;
  undefined1 auVar29 [16];
  undefined1 auVar30 [16];
  float fVar31;
  float fVar32;
  undefined4 in_XMM6_Da;
  float fVar33;
  undefined4 in_XMM7_Da;
  float fVar34;
  undefined8 *in_stack_00000028;
  long *in_stack_00000030;
  long *in_stack_00000038;
  long local_a0;
  undefined1 (*local_98) [16];
  ushort local_88;
  long local_80;
  char local_78;
  int *local_70;
  undefined4 local_68;
  undefined4 local_58;

  piVar5 = (int *)*param_3;
  if (*piVar5 == 0) {
    return;
  }
  puVar6 = (undefined4 *)param_3[2];
  uVar3 = *(undefined4 *)((long)param_3 + 0x1c);
  param_5 = (long *)*param_5;
  uVar7 = *param_6;
  lVar22 = *in_stack_00000030;
  lVar25 = in_stack_00000030[1];
  lVar8 = *in_stack_00000038;
  lVar9 = in_stack_00000038[1];
  uVar4 = *(undefined4 *)((long)in_stack_00000038 + 0x14);
  uVar10 = *(undefined8 *)piVar5;
  uVar11 = *(undefined8 *)(piVar5 + 2);
  fVar34 = (float)piVar5[4];
  fVar33 = (float)piVar5[5];
  local_68 = in_XMM6_Da;
  local_58 = in_XMM7_Da;
  if (param_5[3] != 0) {
    uVar23 = 0x5317300c6b349d75;
    param_2 = 0;
    while( true ) {
      uVar23 = uVar23 & param_5[1];
      pcVar1 = (char *)(*param_5 + uVar23);
      auVar30[0] = -(*pcVar1 == DAT_145dcd180);
      auVar30[1] = -(pcVar1[1] == DAT_145dcd180._1_1_);
      auVar30[2] = -(pcVar1[2] == DAT_145dcd180._2_1_);
      auVar30[3] = -(pcVar1[3] == DAT_145dcd180._3_1_);
      auVar30[4] = -(pcVar1[4] == DAT_145dcd180._4_1_);
      auVar30[5] = -(pcVar1[5] == DAT_145dcd180._5_1_);
      auVar30[6] = -(pcVar1[6] == DAT_145dcd180._6_1_);
      auVar30[7] = -(pcVar1[7] == DAT_145dcd180._7_1_);
      auVar30[8] = -(pcVar1[8] == DAT_145dcd180._8_1_);
      auVar30[9] = -(pcVar1[9] == DAT_145dcd180._9_1_);
      auVar30[10] = -(pcVar1[10] == DAT_145dcd180._10_1_);
      auVar30[0xb] = -(pcVar1[0xb] == DAT_145dcd180._11_1_);
      auVar30[0xc] = -(pcVar1[0xc] == DAT_145dcd180._12_1_);
      auVar30[0xd] = -(pcVar1[0xd] == DAT_145dcd180._13_1_);
      auVar30[0xe] = -(pcVar1[0xe] == DAT_145dcd180._14_1_);
      auVar30[0xf] = -(pcVar1[0xf] == DAT_145dcd180._15_1_);
      uVar24 = (ushort)(SUB161(auVar30 >> 7,0) & 1) | (ushort)(SUB161(auVar30 >> 0xf,0) & 1) << 1 |
               (ushort)(SUB161(auVar30 >> 0x17,0) & 1) << 2 |
               (ushort)(SUB161(auVar30 >> 0x1f,0) & 1) << 3 |
               (ushort)(SUB161(auVar30 >> 0x27,0) & 1) << 4 |
               (ushort)(SUB161(auVar30 >> 0x2f,0) & 1) << 5 |
               (ushort)(SUB161(auVar30 >> 0x37,0) & 1) << 6 |
               (ushort)(SUB161(auVar30 >> 0x3f,0) & 1) << 7 |
               (ushort)(SUB161(auVar30 >> 0x47,0) & 1) << 8 |
               (ushort)(SUB161(auVar30 >> 0x4f,0) & 1) << 9 |
               (ushort)(SUB161(auVar30 >> 0x57,0) & 1) << 10 |
               (ushort)(SUB161(auVar30 >> 0x5f,0) & 1) << 0xb |
               (ushort)(SUB161(auVar30 >> 0x67,0) & 1) << 0xc |
               (ushort)(SUB161(auVar30 >> 0x6f,0) & 1) << 0xd |
               (ushort)(SUB161(auVar30 >> 0x77,0) & 1) << 0xe | (ushort)(auVar30[0xf] >> 7) << 0xf;
      uVar21 = (uint)uVar24;
      while (uVar24 != 0) {
        uVar12 = 0;
        for (uVar13 = uVar21; (uVar13 & 1) == 0; uVar13 = uVar13 >> 1 | 0x80000000) {
          uVar12 = uVar12 + 1;
        }
        cVar26 = true;
        if (*(short *)(*param_5 + (uVar12 + uVar23 & param_5[1]) * -4 + -4) == 0)
        goto LAB_140196f54;
        uVar24 = (ushort)(uVar21 - 1) & (ushort)uVar21;
        uVar21 = CONCAT22((short)(uVar21 - 1 >> 0x10),uVar24);
      }
      auVar29[0] = -(*pcVar1 == -1);
      auVar29[1] = -(pcVar1[1] == -1);
      auVar29[2] = -(pcVar1[2] == -1);
      auVar29[3] = -(pcVar1[3] == -1);
      auVar29[4] = -(pcVar1[4] == -1);
      auVar29[5] = -(pcVar1[5] == -1);
      auVar29[6] = -(pcVar1[6] == -1);
      auVar29[7] = -(pcVar1[7] == -1);
      auVar29[8] = -(pcVar1[8] == -1);
      auVar29[9] = -(pcVar1[9] == -1);
      auVar29[10] = -(pcVar1[10] == -1);
      auVar29[0xb] = -(pcVar1[0xb] == -1);
      auVar29[0xc] = -(pcVar1[0xc] == -1);
      auVar29[0xd] = -(pcVar1[0xd] == -1);
      auVar29[0xe] = -(pcVar1[0xe] == -1);
      auVar29[0xf] = -(pcVar1[0xf] == -1);
      if ((((((((((((((((SUB161(auVar29 >> 7,0) & 1) != 0 || (SUB161(auVar29 >> 0xf,0) & 1) != 0) ||
                      (SUB161(auVar29 >> 0x17,0) & 1) != 0) || (SUB161(auVar29 >> 0x1f,0) & 1) != 0)
                    || (SUB161(auVar29 >> 0x27,0) & 1) != 0) || (SUB161(auVar29 >> 0x2f,0) & 1) != 0
                   ) || (SUB161(auVar29 >> 0x37,0) & 1) != 0) ||
                 (SUB161(auVar29 >> 0x3f,0) & 1) != 0) || (SUB161(auVar29 >> 0x47,0) & 1) != 0) ||
               (SUB161(auVar29 >> 0x4f,0) & 1) != 0) || (SUB161(auVar29 >> 0x57,0) & 1) != 0) ||
             (SUB161(auVar29 >> 0x5f,0) & 1) != 0) || (SUB161(auVar29 >> 0x67,0) & 1) != 0) ||
           (SUB161(auVar29 >> 0x6f,0) & 1) != 0) || (SUB161(auVar29 >> 0x77,0) & 1) != 0) ||
          auVar29[0xf] < '\0') break;
      uVar23 = uVar23 + param_2 + 0x10;
      param_2 = param_2 + 0x10;
    }
  }
  func_0x00014361df00(*in_stack_00000028,param_2,uVar7,&local_a0);
  cVar26 = local_80 != 0;
  if (((bool)cVar26) && (pauVar15 = local_98, local_88 == 0)) {
    do {
      auVar30 = *pauVar15;
      pauVar15 = pauVar15 + 1;
    } while ((ushort)((ushort)(SUB161(auVar30 >> 7,0) & 1) |
                      (ushort)(SUB161(auVar30 >> 0xf,0) & 1) << 1 |
                      (ushort)(SUB161(auVar30 >> 0x17,0) & 1) << 2 |
                      (ushort)(SUB161(auVar30 >> 0x1f,0) & 1) << 3 |
                      (ushort)(SUB161(auVar30 >> 0x27,0) & 1) << 4 |
                      (ushort)(SUB161(auVar30 >> 0x2f,0) & 1) << 5 |
                      (ushort)(SUB161(auVar30 >> 0x37,0) & 1) << 6 |
                      (ushort)(SUB161(auVar30 >> 0x3f,0) & 1) << 7 |
                      (ushort)(SUB161(auVar30 >> 0x47,0) & 1) << 8 |
                      (ushort)(SUB161(auVar30 >> 0x4f,0) & 1) << 9 |
                      (ushort)(SUB161(auVar30 >> 0x57,0) & 1) << 10 |
                      (ushort)(SUB161(auVar30 >> 0x5f,0) & 1) << 0xb |
                      (ushort)(SUB161(auVar30 >> 0x67,0) & 1) << 0xc |
                      (ushort)(SUB161(auVar30 >> 0x6f,0) & 1) << 0xd |
                      (ushort)(SUB161(auVar30 >> 0x77,0) & 1) << 0xe |
                     (ushort)(byte)(auVar30[0xf] >> 7) << 0xf) == 0xffff);
  }
LAB_140196f54:
  func_0x000140180b10();
  uVar23 = (ulong)~(uint)uVar11;
  piVar18 = (int *)(uVar23 * 0x18 + *(long *)(lVar25 + 8));
  if (*(ulong *)(lVar25 + 0x10) <= uVar23) {
    piVar18 = (int *)&DAT_145de5448;
  }
  if ((piVar18[4] != (int)((ulong)uVar11 >> 0x20)) || (*piVar18 == 0)) goto LAB_140197041;
  uVar23 = *(ulong *)(piVar18 + 1);
  if ((*(ulong *)(lVar22 + 0x38) <= uVar23 >> 0x20) ||
     ((*(ulong *)(*(long *)(lVar22 + 0x28) + (uVar23 >> 0x26) * 8) >> (uVar23 >> 0x20 & 0x3f) & 1)
      == 0)) goto LAB_140197041;
  if (*(ulong *)(lVar22 + 0x110) <
      *(ulong *)(*(long *)(lVar25 + 0x1a8) + 0x40 + (ulong)(uint)piVar18[3] * 0x48)) {
    lVar25 = *(long *)(lVar25 + 0x1a8) + (ulong)(uint)piVar18[3] * 0x48;
    uVar19 = *(ulong *)(*(long *)(lVar25 + 0x38) + *(ulong *)(lVar22 + 0x110) * 8);
    if (uVar19 == 0) goto LAB_140197077;
    lVar22 = *(long *)(*(long *)(lVar25 + 0x18) + 0x10 + ~uVar19 * 0x30);
  }
  else {
LAB_140197077:
    lVar22 = 0;
  }
  uVar19 = (ulong)~(uint)uVar10;
  piVar18 = (int *)&DAT_145de5448;
  if (uVar19 < *(ulong *)(lVar9 + 0x10)) {
    piVar18 = (int *)(uVar19 * 0x18 + *(long *)(lVar9 + 8));
  }
  if ((piVar18[4] == (int)((ulong)uVar10 >> 0x20)) && (*piVar18 != 0)) {
    uVar19 = *(ulong *)(piVar18 + 1);
    if ((uVar19 >> 0x20 < *(ulong *)(lVar8 + 0x38)) &&
       ((*(ulong *)(*(long *)(lVar8 + 0x28) + (uVar19 >> 0x26) * 8) >> (uVar19 >> 0x20 & 0x3f) & 1)
        != 0)) {
      uVar16 = (ulong)(uint)piVar18[3];
      lVar25 = *(long *)(lVar9 + 0x1a8);
      lVar9 = *(long *)(lVar25 + 0x18 + uVar16 * 0x48);
      lVar20 = *(long *)(lVar25 + 0x38 + uVar16 * 0x48);
      if ((*(ulong *)(lVar8 + 0x118) < *(ulong *)(lVar25 + 0x40 + uVar16 * 0x48)) &&
         (uVar16 = *(ulong *)(lVar20 + *(ulong *)(lVar8 + 0x118) * 8), uVar16 != 0)) {
        lVar25 = *(long *)(lVar9 + 0x10 + ~uVar16 * 0x30);
      }
      else {
        lVar25 = 0;
      }
      if ((local_78 != '\x01') && (cVar26 != '\0')) {
        lVar20 = ~*(ulong *)(lVar20 + *(long *)(lVar8 + 0x110) * 8) * 0x30;
        lVar8 = *(long *)(lVar9 + 0x10 + lVar20);
        lVar9 = *(long *)(lVar9 + 0x28 + lVar20);
        if (((*local_70 != 1) ||
            (((*(double *)(local_70 + 2) < 0.0 || (dVar2 = *(double *)(local_70 + 4), dVar2 < 0.0))
             || ((double)(uint)local_70[0x30] <= *(double *)(local_70 + 2))))) ||
           ((double)(uint)local_70[0x31] <= dVar2)) {
          func_0x00014361df00(uVar23,local_70,uVar7,&local_a0);
          if (local_80 == 0) {
            return;
          }
          uVar21 = (uint)local_88;
          if (local_88 == 0) {
            do {
              auVar30 = *local_98;
              local_a0 = local_a0 + -0x880;
              local_98 = local_98 + 1;
              uVar21 = (ushort)((ushort)(SUB161(auVar30 >> 7,0) & 1) |
                                (ushort)(SUB161(auVar30 >> 0xf,0) & 1) << 1 |
                                (ushort)(SUB161(auVar30 >> 0x17,0) & 1) << 2 |
                                (ushort)(SUB161(auVar30 >> 0x1f,0) & 1) << 3 |
                                (ushort)(SUB161(auVar30 >> 0x27,0) & 1) << 4 |
                                (ushort)(SUB161(auVar30 >> 0x2f,0) & 1) << 5 |
                                (ushort)(SUB161(auVar30 >> 0x37,0) & 1) << 6 |
                                (ushort)(SUB161(auVar30 >> 0x3f,0) & 1) << 7 |
                                (ushort)(SUB161(auVar30 >> 0x47,0) & 1) << 8 |
                                (ushort)(SUB161(auVar30 >> 0x4f,0) & 1) << 9 |
                                (ushort)(SUB161(auVar30 >> 0x57,0) & 1) << 10 |
                                (ushort)(SUB161(auVar30 >> 0x5f,0) & 1) << 0xb |
                                (ushort)(SUB161(auVar30 >> 0x67,0) & 1) << 0xc |
                                (ushort)(SUB161(auVar30 >> 0x6f,0) & 1) << 0xd |
                                (ushort)(SUB161(auVar30 >> 0x77,0) & 1) << 0xe |
                               (ushort)(byte)(auVar30[0xf] >> 7) << 0xf) ^ 0xffff;
            } while (uVar21 == 0);
          }
          uVar12 = 0;
          for (; (uVar21 & 1) == 0; uVar21 = uVar21 >> 1 | 0x80000000) {
            uVar12 = uVar12 + 1;
          }
          fVar27 = *(float *)(local_a0 + -4 + ((ulong)uVar12 * -0x80 - (ulong)(uVar12 << 3)));
        }
        else {
          pfVar17 = (float *)(local_70 + 0x32);
          if ((char)local_70[0x2e] != '\0') {
            pfVar17 = (float *)(local_70 + 0x2f);
          }
          fVar27 = (float)dVar2 / *pfVar17;
        }
        uVar19 = (ulong)~(uint)uVar19;
        lVar25 = lVar25 + uVar19 * 0x68;
        fVar31 = *(float *)(lVar25 + 0x34) * *(float *)(lVar25 + 100);
        fVar28 = *(float *)(lVar25 + 100) * *(float *)(lVar25 + 0x3c);
        fVar32 = fVar28;
        if (fVar28 <= _DAT_145d9d2a0) {
          fVar32 = _DAT_145d9d2a0;
        }
        fVar32 = fVar31 / fVar32;
        fVar14 = _DAT_145dd4ac8;
        if (_DAT_145dd4ac8 <= fVar32) {
          fVar14 = fVar32;
        }
        fVar32 = _DAT_145d9d2a0;
        if (fVar14 <= _DAT_145d9d2a0) {
          fVar32 = fVar14;
        }
        fVar32 = (_DAT_145d9d2a0 - fVar32) * *(float *)(lVar22 + (ulong)~(uint)uVar23 * 0x68 + 0x34)
        ;
        if (fVar32 <= 0.0) {
          return;
        }
        fVar28 = fVar28 - fVar31;
        if (fVar28 <= 0.0) {
          fVar28 = 0.0;
        }
        pfVar17 = (float *)(local_70 + 0x32);
        if ((char)local_70[0x2e] != '\0') {
          pfVar17 = (float *)(local_70 + 0x2f);
        }
        fVar33 = fVar33 + (((fVar27 - fVar34) * *pfVar17) / fVar32) * fVar28;
        fVar34 = 0.0;
        if (0.0 <= fVar33) {
          fVar34 = fVar33;
        }
        if (fVar34 <= fVar28) {
          fVar28 = fVar34;
        }
        fVar34 = *(float *)(lVar8 + 4 + uVar19 * 8);
        if ((fVar34 == fVar28) && (!NAN(fVar34) && !NAN(fVar28))) {
          return;
        }
        *(undefined4 *)(lVar9 + uVar19 * 4) = uVar4;
        *(float *)(lVar8 + 4 + uVar19 * 8) = fVar28;
        return;
      }
    }
  }
LAB_140197041:
  *puVar6 = uVar3;
  *piVar5 = 0;
  return;
}
