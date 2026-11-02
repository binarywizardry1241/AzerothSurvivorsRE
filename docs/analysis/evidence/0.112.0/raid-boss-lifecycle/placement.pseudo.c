/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,undefined4 param_3,undefined4 param_4,
          undefined8 param_5,undefined8 param_6,long param_7,undefined8 *param_8)

{
  float *pfVar1;
  ushort uVar2;
  code *pcVar3;
  undefined1 auVar4 [16];
  undefined1 auVar5 [16];
  int iVar6;
  ulong uVar7;
  long lVar8;
  long lVar9;
  ulong uVar10;
  ulong uVar11;
  ulong uVar12;
  long lVar13;
  ulong uVar14;
  int iVar15;
  float fVar16;
  float extraout_XMM0_Da;
  float fVar17;
  float extraout_XMM0_Da_00;
  undefined8 uVar18;
  undefined8 uVar19;
  float extraout_XMM0_Dc;
  float fVar20;
  float fVar21;
  float fVar22;
  float fVar23;
  float fVar24;
  float fVar25;
  float fVar26;
  float fVar27;
  float fVar28;
  float fVar29;
  float fVar30;
  float fVar31;
  float fVar32;
  float fVar33;
  undefined8 uVar34;
  undefined1 auVar35 [16];
  undefined1 auVar36 [16];
  float fVar37;
  float in_stack_00000028;
  float local_108;

  fVar25 = (float)*(undefined8 *)(param_7 + 0x9e0);
  fVar22 = (float)((ulong)*(undefined8 *)(param_7 + 0x9e0) >> 0x20);
  fVar25 = fVar22 * fVar22 + fVar25 * fVar25;
  if (_DAT_145db6b34 < fVar25) {
    local_108 = (float)func_0x000145c0a447(fVar22);
  }
  iVar15 = 0;
  fVar22 = _DAT_145db17a0;
  fVar31 = _DAT_145db1368;
  fVar37 = _DAT_145db14c4;
  do {
    uVar11 = *(ulong *)(param_7 + 0x9b8);
    uVar7 = *(ulong *)(param_7 + 0x9c0);
    uVar12 = *(ulong *)(param_7 + 0x9d0);
    uVar10 = *(ulong *)(param_7 + 0x9c8);
    if (fVar25 <= _DAT_145db6b34) {
LAB_14593d710:
      do {
        lVar13 = ((uVar11 + uVar12) * 0x800000 | uVar11 + uVar12 >> 0x29) + uVar11;
        uVar14 = uVar7 << 0x11;
        uVar10 = uVar10 ^ uVar11;
        uVar12 = uVar12 ^ uVar7;
        uVar7 = uVar7 ^ uVar10;
        uVar11 = uVar11 ^ uVar12;
        uVar12 = uVar12 << 0x2d | uVar12 >> 0x13;
        uVar10 = uVar10 ^ uVar14;
        fVar33 = ((float)((uint)((ulong)lVar13 >> 0x29) | 0x3f800000) + fVar31) * fVar22;
      } while (fVar22 <= fVar33);
      fVar16 = 0.0;
      fVar33 = fVar33 + 0.0;
      *(ulong *)(param_7 + 0x9b8) = uVar11;
      *(ulong *)(param_7 + 0x9d0) = uVar12;
      *(ulong *)(param_7 + 0x9c0) = uVar7;
      *(ulong *)(param_7 + 0x9c8) = uVar10;
    }
    else {
      lVar13 = ((uVar12 + uVar11) * 0x800000 | uVar12 + uVar11 >> 0x29) + uVar11;
      uVar14 = uVar7 << 0x11;
      uVar10 = uVar10 ^ uVar11;
      uVar12 = uVar12 ^ uVar7;
      uVar7 = uVar7 ^ uVar10;
      uVar11 = uVar11 ^ uVar12;
      uVar12 = uVar12 << 0x2d | uVar12 >> 0x13;
      uVar10 = uVar10 ^ uVar14;
      fVar16 = (float)(uint)((ulong)lVar13 >> 0x28) * _DAT_145ec2a40;
      if (in_stack_00000028 <= fVar16) goto LAB_14593d710;
      do {
        lVar13 = ((uVar11 + uVar12) * 0x800000 | uVar11 + uVar12 >> 0x29) + uVar11;
        uVar14 = uVar7 << 0x11;
        uVar10 = uVar10 ^ uVar11;
        uVar12 = uVar12 ^ uVar7;
        uVar7 = uVar7 ^ uVar10;
        uVar11 = uVar11 ^ uVar12;
        uVar10 = uVar10 ^ uVar14;
        uVar12 = uVar12 << 0x2d | uVar12 >> 0x13;
        fVar33 = ((float)((uint)((ulong)lVar13 >> 0x29) | 0x3f800000) + fVar31) * _DAT_145dbab84 +
                 _DAT_146c08c68;
      } while (_DAT_145dbb100 <= fVar33);
      *(ulong *)(param_7 + 0x9b8) = uVar11;
      *(ulong *)(param_7 + 0x9d0) = uVar12;
      *(ulong *)(param_7 + 0x9c0) = uVar7;
      *(ulong *)(param_7 + 0x9c8) = uVar10;
      fVar33 = fVar33 + local_108;
    }
    fVar16 = (float)func_0x0001459c2d90(fVar16,param_3,param_4);
    if (fVar37 <= fVar16) {
      fVar27 = (float)*(undefined8 *)(param_7 + 0x4d0);
      fVar28 = (float)((ulong)*(undefined8 *)(param_7 + 0x4d0) >> 0x20);
      fVar29 = 0.0;
      fVar30 = 0.0;
      fVar32 = extraout_XMM0_Dc;
      uVar18 = func_0x000145c0a417(fVar33);
      uVar19 = func_0x000145c0a411(fVar33);
      fVar33 = *(float *)(param_7 + 0x4d8);
      lVar13 = *(long *)(param_7 + 0x9b0);
      lVar9 = *(long *)(param_7 + 0x9d8);
      if (lVar9 == 0) {
        do {
          auVar36._0_4_ = fVar16 * (float)uVar18 + fVar27;
          auVar36._4_4_ = fVar16 * (float)uVar19 + fVar28;
          auVar36._8_4_ = fVar32 * (float)((ulong)uVar18 >> 0x20) + fVar29;
          auVar36._12_4_ = fVar32 * (float)((ulong)uVar19 >> 0x20) + fVar30;
          fVar21 = auVar36._4_4_;
          fVar26 = auVar36._4_4_;
          lVar9 = func_0x000145898dc0();
          lVar9 = lVar9 * 0xf0;
          fVar17 = (float)func_0x000145c0a42f(auVar36._0_4_ - *(float *)(lVar9 + 0x146bf26f8),
                                              CONCAT44(fVar26,fVar21 - *(float *)(lVar9 +
                                                  0x146bf26fc)));
          fVar26 = *(float *)(lVar9 + 0x146bf2708);
          if (fVar17 <= fVar26 + _DAT_145db1724) {
            uVar11 = func_0x0001458a0b40(fVar26 + _DAT_145db1724,auVar36._0_8_,fVar21);
            uVar34 = auVar36._0_8_;
            if (((uVar11 & 1) != 0) &&
               (fVar21 = (float)((uint)(extraout_XMM0_Da_00 - fVar33) & _DAT_145db8870),
               pfVar1 = (float *)((ulong)(fVar26 < fVar17) * 4 + 0x146c08c70),
               fVar21 < *pfVar1 || fVar21 == *pfVar1)) {
              fVar20 = extraout_XMM0_Da_00;
              if (*(long *)(lVar13 + 0x40) == -1) {
LAB_14593dc7d:
                *param_8 = uVar34;
                *(float *)(param_8 + 1) = fVar20;
                return;
              }
              fVar21 = auVar36._0_4_ - (float)*(undefined8 *)(lVar13 + 0x60);
              fVar24 = auVar36._4_4_ - (float)((ulong)*(undefined8 *)(lVar13 + 0x60) >> 0x20);
              auVar4._4_4_ = -(uint)(fVar21 < 0.0);
              auVar4._0_4_ = -(uint)(fVar21 < 0.0);
              auVar4._8_4_ = -(uint)(fVar24 < 0.0);
              auVar4._12_4_ = -(uint)(fVar24 < 0.0);
              iVar6 = movmskpd((uint)(fVar26 < fVar17),auVar4);
              if (iVar6 != 0) goto LAB_14593dc7d;
              uVar11 = (long)fVar21 >> 0x3f & (long)(fVar21 - _DAT_145db6940) | (long)fVar21;
              if (fVar21 < 0.0) {
                uVar11 = 0;
              }
              if (_DAT_145db6944 < fVar21) {
                uVar11 = 0xffffffffffffffff;
              }
              uVar7 = (long)fVar24 >> 0x3f & (long)(fVar24 - _DAT_145db6940) | (long)fVar24;
              if (fVar24 < 0.0) {
                uVar7 = 0;
              }
              if (_DAT_145db6944 < fVar24) {
                uVar7 = 0xffffffffffffffff;
              }
              uVar12 = *(ulong *)(lVar13 + 0x58);
              if ((uVar12 <= uVar11) || (uVar12 <= uVar7)) goto LAB_14593dc7d;
              uVar11 = uVar12 * uVar7 + uVar11;
              if (*(ulong *)(lVar13 + 0x50) <= uVar11) {
LAB_14593dd69:
                func_0x000145da9883();
                    /* WARNING: Does not return */
                pcVar3 = (code *)invalidInstructionException();
                (*pcVar3)();
              }
              if (*(char *)(*(long *)(lVar13 + 0x48) + uVar11) != '\x01') goto LAB_14593dc7d;
            }
          }
          fVar16 = fVar16 + _DAT_145dc9ac4;
        } while (fVar37 <= fVar16);
      }
      else {
        do {
          auVar35._0_4_ = fVar16 * (float)uVar18 + fVar27;
          auVar35._4_4_ = fVar16 * (float)uVar19 + fVar28;
          auVar35._8_4_ = fVar32 * (float)((ulong)uVar18 >> 0x20) + fVar29;
          auVar35._12_4_ = fVar32 * (float)((ulong)uVar19 >> 0x20) + fVar30;
          fVar21 = auVar35._4_4_;
          fVar26 = auVar35._4_4_;
          lVar8 = func_0x000145898dc0();
          lVar8 = lVar8 * 0xf0;
          fVar17 = (float)func_0x000145c0a42f(auVar35._0_4_ - *(float *)(lVar8 + 0x146bf26f8),
                                              CONCAT44(fVar26,fVar21 - *(float *)(lVar8 +
                                                  0x146bf26fc)));
          fVar26 = *(float *)(lVar8 + 0x146bf2708);
          if (fVar17 <= fVar26 + _DAT_145db1724) {
            uVar11 = func_0x0001458a0b40(fVar26 + _DAT_145db1724,auVar35._0_8_,fVar21);
            uVar34 = auVar35._0_8_;
            if (((uVar11 & 1) != 0) &&
               (fVar20 = (float)((uint)(extraout_XMM0_Da - fVar33) & _DAT_145db8870),
               pfVar1 = (float *)((ulong)(fVar26 < fVar17) * 4 + 0x146c08c70),
               fVar20 < *pfVar1 || fVar20 == *pfVar1)) {
              fVar20 = extraout_XMM0_Da;
              if (*(long *)(lVar13 + 0x40) == -1) goto LAB_14593dc7d;
              fVar24 = auVar35._0_4_ - (float)*(undefined8 *)(lVar13 + 0x60);
              fVar23 = auVar35._4_4_ - (float)((ulong)*(undefined8 *)(lVar13 + 0x60) >> 0x20);
              auVar5._4_4_ = -(uint)(fVar24 < 0.0);
              auVar5._0_4_ = -(uint)(fVar24 < 0.0);
              auVar5._8_4_ = -(uint)(fVar23 < 0.0);
              auVar5._12_4_ = -(uint)(fVar23 < 0.0);
              iVar6 = movmskpd((uint)(fVar26 < fVar17),auVar5);
              if (iVar6 == 0) {
                uVar11 = (long)fVar24 >> 0x3f & (long)(fVar24 - _DAT_145db6940) | (long)fVar24;
                if (fVar24 < 0.0) {
                  uVar11 = 0;
                }
                if (_DAT_145db6944 < fVar24) {
                  uVar11 = 0xffffffffffffffff;
                }
                uVar7 = (long)fVar23 >> 0x3f & (long)(fVar23 - _DAT_145db6940) | (long)fVar23;
                if (fVar23 < 0.0) {
                  uVar7 = 0;
                }
                if (_DAT_145db6944 < fVar23) {
                  uVar7 = 0xffffffffffffffff;
                }
                uVar12 = *(ulong *)(lVar13 + 0x58);
                if (uVar7 < uVar12 && uVar11 < uVar12) {
                  uVar11 = uVar12 * uVar7 + uVar11;
                  if (*(ulong *)(lVar13 + 0x50) <= uVar11) goto LAB_14593dd69;
                  if (*(char *)(*(long *)(lVar13 + 0x48) + uVar11) != '\0') goto LAB_14593d800;
                }
              }
              if (*(ulong *)(lVar9 + 0x30) < 0x191) goto LAB_14593dc7d;
              fVar26 = auVar35._4_4_ - fVar28;
              fVar26 = (float)func_0x000145c0a42f(auVar35._0_4_ - fVar27,CONCAT44(fVar26,fVar26));
              uVar34 = auVar35._0_8_;
              fVar17 = auVar35._0_4_ - *(float *)(lVar13 + 0x60);
              if ((0.0 <= fVar17) && (fVar21 = fVar21 - *(float *)(lVar13 + 100), 0.0 <= fVar21)) {
                uVar11 = (long)fVar17 >> 0x3f & (long)(fVar17 - _DAT_145db6940) | (long)fVar17;
                if (fVar17 < 0.0) {
                  uVar11 = 0;
                }
                if (_DAT_145db6944 < fVar17) {
                  uVar11 = 0xffffffffffffffff;
                }
                uVar7 = (long)fVar21 >> 0x3f & (long)(fVar21 - _DAT_145db6940) | (long)fVar21;
                if (fVar21 < 0.0) {
                  uVar7 = 0;
                }
                if (_DAT_145db6944 < fVar21) {
                  uVar7 = 0xffffffffffffffff;
                }
                uVar12 = *(ulong *)(lVar13 + 0x58);
                if ((uVar11 < uVar12) && (uVar7 < uVar12)) {
                  uVar11 = uVar12 * uVar7 + uVar11;
                  if (*(ulong *)(lVar9 + 0x20) <= uVar11) {
                    func_0x000145da9883();
                    /* WARNING: Does not return */
                    pcVar3 = (code *)invalidInstructionException();
                    (*pcVar3)();
                  }
                  uVar2 = *(ushort *)(*(long *)(lVar9 + 0x18) + uVar11 * 2);
                  if ((uVar2 != 0xffff) && ((float)uVar2 <= fVar26 * _DAT_145dbb098 + fVar37))
                  goto LAB_14593dc7d;
                }
              }
            }
          }
LAB_14593d800:
          fVar16 = fVar16 + _DAT_145dc9ac4;
        } while (fVar37 <= fVar16);
      }
    }
    iVar15 = iVar15 + 1;
    if (iVar15 == 0x10) {
                    /* WARNING: Bad instruction - Truncating control flow here */
      halt_baddata();
    }
  } while( true );
}
