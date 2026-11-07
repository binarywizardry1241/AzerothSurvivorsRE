/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(float param_1,long param_2,undefined8 param_3,long *param_4,undefined8 param_5,
          undefined8 *param_6,long *param_7)

{
  uint *puVar1;
  byte bVar2;
  char cVar3;
  undefined2 uVar4;
  undefined4 *puVar5;
  long lVar6;
  long lVar7;
  ulong uVar8;
  ulong uVar9;
  float fVar10;
  uint uVar11;
  undefined8 uVar12;
  long lVar13;
  long lVar14;
  uint uVar15;
  float *pfVar16;
  undefined1 uVar17;
  int iVar18;
  uint uVar19;
  long lVar20;
  ulong uVar21;
  long lVar22;
  bool bVar23;
  float fVar24;
  float fVar25;
  undefined4 uVar26;
  undefined4 in_XMM6_Da;
  float fVar27;
  undefined4 in_XMM7_Da;
  float fVar28;
  float fVar29;
  float fVar30;
  undefined8 *in_stack_00000028;
  undefined8 *in_stack_00000030;
  long *in_stack_00000038;
  long *in_stack_00000040;
  int *in_stack_00000048;
  undefined4 local_208 [96];
  undefined4 local_88;
  undefined4 local_78;

  puVar5 = (undefined4 *)*in_stack_00000030;
  local_88 = in_XMM6_Da;
  local_78 = in_XMM7_Da;
  if (((byte *)*param_6)[0xd] == 1) {
    param_2 = *param_4;
    lVar20 = *param_7;
    lVar14 = *in_stack_00000038;
    lVar13 = in_stack_00000038[1];
    lVar6 = *in_stack_00000040;
    lVar7 = in_stack_00000040[1];
    bVar2 = *(byte *)*param_6;
    cVar3 = *(char *)(param_2 + 0x72);
    if (cVar3 == '\x01') {
      bVar23 = *(char *)(param_2 + 0x76) != '\0';
      param_2 = CONCAT71((int7)((ulong)param_2 >> 8),bVar23 | bVar2);
      if (!bVar23 && (bVar2 & 1) == 0) {
LAB_1401613bb:
        if (*in_stack_00000048 == 0) {
LAB_140161402:
          func_0x0001458a3e40(local_208,cVar3,*in_stack_00000028,local_208,
                              *(undefined1 *)(lVar20 + 0x38),*(undefined1 *)(lVar20 + 0x39));
          func_0x0001459a4710();
          uVar12 = func_0x0001459a2280();
          uVar17 = (undefined1)((ulong)uVar12 >> 0x20);
          uVar4 = *(undefined2 *)(lVar20 + 0x39);
          func_0x0001401a5d80();
          *in_stack_00000048 = 1;
          pfVar16 = (float *)(in_stack_00000048 + 1);
          param_1 = (float)func_0x000145bfa0e7();
          *(undefined2 *)(in_stack_00000048 + 0x27) = uVar4;
          *(char *)((long)in_stack_00000048 + 0x9e) = (char)uVar12;
          *(char *)((long)in_stack_00000048 + 0x9f) = (char)((ulong)uVar12 >> 8);
          *(char *)(in_stack_00000048 + 0x28) = (char)((ulong)uVar12 >> 0x10);
          *(char *)((long)in_stack_00000048 + 0xa1) = (char)((ulong)uVar12 >> 0x18);
          *(undefined1 *)((long)in_stack_00000048 + 0xa2) = uVar17;
        }
        else {
          uVar19 = *(int *)((long)param_7 + 0x1c) - (int)param_7[3];
          if (0xc233afff < uVar19) {
            uVar19 = 0xc233b000;
          }
          if ((uint)(*(int *)((long)param_7 + 0x1c) - *(int *)param_7[2]) < uVar19)
          goto LAB_140161402;
          uVar15 = *(int *)((long)in_stack_00000028 + 0x1c) - *(int *)in_stack_00000028[2];
          pfVar16 = (float *)(ulong)uVar15;
          uVar11 = *(int *)((long)in_stack_00000028 + 0x1c) - *(int *)(in_stack_00000028 + 3);
          uVar19 = 0xc233b000;
          if (uVar11 < 0xc233b000) {
            uVar19 = uVar11;
          }
          if (uVar15 < uVar19) goto LAB_140161402;
        }
        if (cVar3 == '\0') {
          if (*(char *)(lVar6 + 0x108) == '\0') {
            lVar20 = 0;
            do {
              if (*(long *)(lVar6 + 0x100) << 2 == lVar20) goto LAB_14016186b;
              uVar21 = (ulong)*(uint *)(*(long *)(lVar6 + 0xf8) + lVar20);
              pfVar16 = *(float **)(lVar7 + 0x108);
              lVar20 = lVar20 + 4;
            } while (*(long *)(pfVar16 + uVar21 * 0x28 + 0x16) == 0);
            lVar20 = *(long *)(lVar7 + 0x1a8) + (ulong)(uint)pfVar16[uVar21 * 0x28 + 0x25] * 0x48;
            uVar8 = *(ulong *)(*(long *)(lVar7 + 0x1a8) + 0x40 +
                              (ulong)(uint)pfVar16[uVar21 * 0x28 + 0x25] * 0x48);
            if ((*(ulong *)(lVar6 + 0x110) < uVar8) &&
               (uVar9 = *(ulong *)(*(long *)(lVar20 + 0x38) + *(ulong *)(lVar6 + 0x110) * 8),
               uVar9 != 0)) {
              lVar14 = *(long *)(*(long *)(lVar20 + 0x18) + 0x10 + ~uVar9 * 0x30);
            }
            else {
              lVar14 = 0;
            }
            if ((*(ulong *)(lVar6 + 0x118) < uVar8) &&
               (uVar8 = *(ulong *)(*(long *)(lVar20 + 0x38) + *(ulong *)(lVar6 + 0x118) * 8),
               uVar8 != 0)) {
              lVar20 = *(long *)(*(long *)(lVar20 + 0x18) + 0x10 + ~uVar8 * 0x30);
            }
            else {
              lVar20 = 0;
            }
            lVar14 = lVar14 + (ulong)~*(uint *)(*(long *)(pfVar16 + uVar21 * 0x28 + 0x14) + 8) *
                              0x68;
            pfVar16 = (float *)((ulong)~*(uint *)(*(long *)(pfVar16 + uVar21 * 0x28 + 0x14) + 8) *
                                0x20 + lVar20);
          }
          else {
            pfVar16 = (float *)0x0;
            do {
              if ((float *)(*(long *)(lVar6 + 0x100) << 2) == pfVar16) goto LAB_14016186b;
              uVar21 = (ulong)*(uint *)(*(long *)(lVar6 + 0xf8) + (long)pfVar16);
              pfVar16 = pfVar16 + 1;
            } while (*(long *)(*(long *)(lVar7 + 0x1a8) + 0x10 + uVar21 * 0x48) == 0);
            lVar20 = *(long *)(lVar7 + 0x1a8) + uVar21 * 0x48;
            if ((*(ulong *)(lVar6 + 0x110) < *(ulong *)(lVar20 + 0x40)) &&
               (uVar21 = *(ulong *)(*(long *)(lVar20 + 0x38) + *(ulong *)(lVar6 + 0x110) * 8),
               uVar21 != 0)) {
              lVar14 = *(long *)(*(long *)(lVar20 + 0x18) + 0x10 + ~uVar21 * 0x30);
            }
            else {
              lVar14 = 0;
            }
            if ((*(ulong *)(lVar6 + 0x118) < *(ulong *)(lVar20 + 0x40)) &&
               (uVar21 = *(ulong *)(*(long *)(lVar20 + 0x38) + *(ulong *)(lVar6 + 0x118) * 8),
               uVar21 != 0)) {
              pfVar16 = *(float **)(*(long *)(lVar20 + 0x18) + 0x10 + ~uVar21 * 0x30);
            }
            else {
              pfVar16 = (float *)0x0;
            }
          }
          goto LAB_140161a80;
        }
        if (*(char *)(lVar14 + 0x108) == '\0') {
          lVar20 = 0;
          do {
            if (*(long *)(lVar14 + 0x100) << 2 == lVar20) goto LAB_1401617d2;
            uVar21 = (ulong)*(uint *)(*(long *)(lVar14 + 0xf8) + lVar20);
            pfVar16 = *(float **)(lVar13 + 0x108);
            lVar20 = lVar20 + 4;
          } while (*(long *)(pfVar16 + uVar21 * 0x28 + 0x16) == 0);
          lVar20 = *(long *)(lVar13 + 0x1a8) + (ulong)(uint)pfVar16[uVar21 * 0x28 + 0x25] * 0x48;
          uVar8 = *(ulong *)(*(long *)(lVar13 + 0x1a8) + 0x40 +
                            (ulong)(uint)pfVar16[uVar21 * 0x28 + 0x25] * 0x48);
          if ((*(ulong *)(lVar14 + 0x110) < uVar8) &&
             (uVar9 = *(ulong *)(*(long *)(lVar20 + 0x38) + *(ulong *)(lVar14 + 0x110) * 8),
             uVar9 != 0)) {
            lVar13 = *(long *)(*(long *)(lVar20 + 0x18) + 0x10 + ~uVar9 * 0x30);
          }
          else {
            lVar13 = 0;
          }
          if ((*(ulong *)(lVar14 + 0x118) < uVar8) &&
             (uVar8 = *(ulong *)(*(long *)(lVar20 + 0x38) + *(ulong *)(lVar14 + 0x118) * 8),
             uVar8 != 0)) {
            lVar20 = *(long *)(*(long *)(lVar20 + 0x18) + 0x10 + ~uVar8 * 0x30);
          }
          else {
            lVar20 = 0;
          }
          lVar13 = lVar13 + (ulong)~*(uint *)(*(long *)(pfVar16 + uVar21 * 0x28 + 0x14) + 8) * 0x68;
          pfVar16 = (float *)((ulong)~*(uint *)(*(long *)(pfVar16 + uVar21 * 0x28 + 0x14) + 8) *
                              0x20 + lVar20);
        }
        else {
          pfVar16 = (float *)0x0;
          do {
            if ((float *)(*(long *)(lVar14 + 0x100) << 2) == pfVar16) goto LAB_1401617d2;
            uVar21 = (ulong)*(uint *)(*(long *)(lVar14 + 0xf8) + (long)pfVar16);
            pfVar16 = pfVar16 + 1;
          } while (*(long *)(*(long *)(lVar13 + 0x1a8) + 0x10 + uVar21 * 0x48) == 0);
          lVar20 = *(long *)(lVar13 + 0x1a8) + uVar21 * 0x48;
          if ((*(ulong *)(lVar14 + 0x110) < *(ulong *)(lVar20 + 0x40)) &&
             (uVar21 = *(ulong *)(*(long *)(lVar20 + 0x38) + *(ulong *)(lVar14 + 0x110) * 8),
             uVar21 != 0)) {
            lVar13 = *(long *)(*(long *)(lVar20 + 0x18) + 0x10 + ~uVar21 * 0x30);
          }
          else {
            lVar13 = 0;
          }
          if ((*(ulong *)(lVar14 + 0x118) < *(ulong *)(lVar20 + 0x40)) &&
             (uVar21 = *(ulong *)(*(long *)(lVar20 + 0x38) + *(ulong *)(lVar14 + 0x118) * 8),
             uVar21 != 0)) {
            pfVar16 = *(float **)(*(long *)(lVar20 + 0x18) + 0x10 + ~uVar21 * 0x30);
          }
          else {
            pfVar16 = (float *)0x0;
          }
        }
        goto LAB_140161959;
      }
    }
    else if (bVar2 == 0) {
      param_2 = *(long *)(lVar6 + 0xf8);
      if (*(char *)(lVar6 + 0x108) == '\0') {
        lVar22 = 0;
        do {
          if (*(long *)(lVar6 + 0x100) << 2 == lVar22) goto LAB_1401615a1;
          puVar1 = (uint *)(param_2 + lVar22);
          lVar22 = lVar22 + 4;
        } while (*(long *)(*(long *)(lVar7 + 0x108) + 0x58 + (ulong)*puVar1 * 0xa0) == 0);
      }
      else {
        lVar22 = 0;
        do {
          if (*(long *)(lVar6 + 0x100) << 2 == lVar22) goto LAB_1401615a1;
          puVar1 = (uint *)(param_2 + lVar22);
          lVar22 = lVar22 + 4;
        } while (*(long *)(*(long *)(lVar7 + 0x1a8) + 0x10 + (ulong)*puVar1 * 0x48) == 0);
      }
      goto LAB_1401613bb;
    }
  }
LAB_1401615a1:
  local_208[0] = 0;
  iVar18 = *in_stack_00000048;
  param_1 = (float)func_0x000145bfa0e7(param_2,iVar18,local_208,in_stack_00000048,0xa4);
  if (iVar18 != 1) {
    return;
  }
  uVar26 = *puVar5;
  fVar27 = _DAT_145d9d2a0;
  goto LAB_140161ba1;
LAB_14016186b:
  lVar14 = 0;
LAB_140161a80:
  if (lVar14 == 0) {
    uVar19 = 0;
    uVar11 = 0;
    fVar27 = _DAT_145d9d2a0;
  }
  else {
    fVar27 = *(float *)(lVar14 + 0x30);
    fVar28 = *(float *)(lVar14 + 0x34);
    fVar29 = *pfVar16;
    fVar30 = pfVar16[1];
    fVar24 = pfVar16[2];
    fVar10 = pfVar16[3];
    fVar25 = fVar10 * fVar29 - fVar24 * fVar30;
    uVar19 = -(uint)NAN(fVar25);
    fVar29 = SQRT(fVar30 * fVar30 + fVar29 * fVar29) *
             (float)(_DAT_145dd2dd0 & uVar19 |
                    ~uVar19 & ((uint)fVar25 & _DAT_145dcd0a0 | _DAT_145d9d290));
    fVar30 = SQRT(fVar24 * fVar24 + fVar10 * fVar10);
    func_0x000145bfa123((uint)pfVar16[2] ^ _DAT_145dcd0a0);
    fVar30 = fVar30 * fVar28;
    fVar29 = (float)func_0x000145bfa10b(fVar29 * fVar27);
    param_1 = (float)func_0x000145bfa10b(fVar30);
    uVar11 = (uint)(long)fVar29;
    if (fVar29 < 0.0) {
      uVar11 = 0;
    }
    if (_DAT_145dd2e40 < fVar29) {
      uVar11 = 0xffffffff;
    }
    uVar19 = (uint)(long)param_1;
    if (param_1 < 0.0) {
      uVar19 = 0;
    }
    if (_DAT_145dd2e40 < param_1) {
      uVar19 = 0xffffffff;
    }
    if (fVar28 <= _DAT_145d9d2a0) {
      fVar28 = _DAT_145d9d2a0;
    }
    fVar27 = fVar27 / fVar28;
  }
  if (uVar11 < uVar19) {
    uVar19 = uVar11;
  }
  uVar26 = _DAT_145dd2e38;
  if (uVar19 == 0) {
    return;
  }
  goto LAB_140161ba1;
LAB_1401617d2:
  lVar13 = 0;
LAB_140161959:
  if (lVar13 == 0) {
    uVar11 = 0;
    uVar19 = 0;
  }
  else {
    fVar27 = *pfVar16;
    fVar28 = pfVar16[1];
    fVar29 = pfVar16[2];
    fVar30 = pfVar16[3];
    fVar24 = fVar30 * fVar27 - fVar29 * fVar28;
    uVar19 = -(uint)NAN(fVar24);
    fVar27 = SQRT(fVar28 * fVar28 + fVar27 * fVar27) *
             (float)(_DAT_145dd2dd0 & uVar19 |
                    ~uVar19 & ((uint)fVar24 & _DAT_145dcd0a0 | _DAT_145d9d290)) *
             *(float *)(lVar13 + 0x30);
    fVar28 = SQRT(fVar29 * fVar29 + fVar30 * fVar30) * *(float *)(lVar13 + 0x34);
    func_0x000145bfa123((uint)pfVar16[2] ^ _DAT_145dcd0a0);
    fVar27 = (float)func_0x000145bfa10b(fVar27);
    param_1 = (float)func_0x000145bfa10b(fVar28);
    uVar11 = (uint)(long)fVar27;
    if (fVar27 < 0.0) {
      uVar11 = 0;
    }
    if (_DAT_145dd2e40 < fVar27) {
      uVar11 = 0xffffffff;
    }
    uVar19 = (uint)(long)param_1;
    if (param_1 < 0.0) {
      uVar19 = 0;
    }
    if (_DAT_145dd2e40 < param_1) {
      uVar19 = 0xffffffff;
    }
  }
  if (uVar11 < uVar19) {
    uVar19 = uVar11;
  }
  if (uVar19 == 0) {
    return;
  }
  uVar26 = *puVar5;
  fVar27 = _DAT_145de24a4;
LAB_140161ba1:
  func_0x00014058d2a0(param_1,uVar26,fVar27);
  return;
}
