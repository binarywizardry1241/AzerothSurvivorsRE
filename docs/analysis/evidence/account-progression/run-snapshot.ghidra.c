
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long param_3,undefined4 *param_4)

{
  ulong uVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  uint uVar5;
  undefined1 auVar6 [14];
  undefined1 auVar7 [14];
  undefined1 auVar8 [14];
  undefined1 auVar9 [14];
  float fVar10;
  float fVar11;
  float fVar12;
  undefined1 uVar13;
  undefined4 uVar14;
  undefined4 uVar15;
  float fVar17;
  undefined1 auVar16 [16];
  float fVar18;
  undefined1 auVar19 [16];
  undefined1 auVar20 [16];
  float fVar21;
  undefined1 auVar22 [16];
  undefined1 auVar23 [16];
  undefined1 auVar24 [16];

  uVar13 = 2;
  if ((((*(int *)(param_3 + 0x10) != 2) && (*(long *)(param_3 + 0xf80) != 0xffffff)) &&
      (*(char *)(param_3 + 0x9c2) == '\0')) && (*(char *)(param_3 + 0x9c9) != '\0')) {
    uVar1 = *(ulong *)(param_3 + 600);
    auVar6._8_4_ = 0;
    auVar6._0_8_ = uVar1;
    auVar6._12_2_ = (short)(uVar1 >> 0x30);
    auVar7._8_2_ = (short)(uVar1 >> 0x20);
    auVar7._0_8_ = uVar1;
    auVar7._10_4_ = auVar6._10_4_;
    auVar9._6_8_ = 0;
    auVar9._0_6_ = auVar7._8_6_;
    auVar8._4_2_ = (short)(uVar1 >> 0x10);
    auVar8._0_4_ = (uint)uVar1;
    auVar8._6_8_ = SUB148(auVar9 << 0x40,6);
    fVar18 = (float)((uint)uVar1 & 0xffff);
    fVar21 = (float)*(uint *)(param_3 + 0x684) / (fVar18 / _DAT_14590753c);
    uVar15 = 0;
    if (0.0 <= fVar21) {
      uVar15 = (undefined4)(long)fVar21;
    }
    iVar2 = *(int *)(param_3 + 0x264);
    uVar14 = 0xffffffff;
    if (fVar21 <= _DAT_14590752c) {
      uVar14 = uVar15;
    }
    iVar3 = *(int *)(param_3 + 0x260);
    iVar4 = *(int *)(param_3 + 0x268);
    auVar24._0_4_ = -(uint)(*(int *)(param_3 + 0x29c) == 0);
    auVar24._4_4_ = -(uint)(*(int *)(param_3 + 0x2a0) == 0);
    auVar24._8_4_ = -(uint)(*(int *)(param_3 + 0x2a4) == 0);
    auVar24._12_4_ = -(uint)(*(int *)(param_3 + 0x2a8) == 0);
    auVar22._0_4_ = -(uint)(*(int *)(param_3 + 0x28c) == 0);
    auVar22._4_4_ = -(uint)(*(int *)(param_3 + 0x290) == 0);
    auVar22._8_4_ = -(uint)(*(int *)(param_3 + 0x294) == 0);
    auVar22._12_4_ = -(uint)(*(int *)(param_3 + 0x298) == 0);
    auVar23 = packssdw(auVar22,auVar24);
    auVar20._0_4_ = -(uint)(*(int *)(param_3 + 0x27c) == 0);
    auVar20._4_4_ = -(uint)(*(int *)(param_3 + 0x280) == 0);
    auVar20._8_4_ = -(uint)(*(int *)(param_3 + 0x284) == 0);
    auVar20._12_4_ = -(uint)(*(int *)(param_3 + 0x288) == 0);
    auVar19._0_4_ = -(uint)(*(int *)(param_3 + 0x26c) == 0);
    auVar19._4_4_ = -(uint)(*(int *)(param_3 + 0x270) == 0);
    auVar19._8_4_ = -(uint)(*(int *)(param_3 + 0x274) == 0);
    auVar19._12_4_ = -(uint)(*(int *)(param_3 + 0x278) == 0);
    auVar19 = packssdw(auVar19,auVar20);
    auVar20 = packsswb(auVar19,auVar23);
    *param_4 = *(undefined4 *)(param_3 + 0x944);
    param_4[1] = uVar14;
    uVar5 = *(uint *)(param_3 + 0x25c);
    uVar13 = *(undefined1 *)(param_3 + 0x880);
    *(ulong *)(param_4 + 2) =
         CONCAT44(*(undefined4 *)(param_3 + 0x698),*(undefined4 *)(param_3 + 0x68c));
    *(undefined1 *)(param_4 + 4) = uVar13;
    fVar12 = fRam000000014673deec;
    fVar11 = fRam000000014673dee8;
    fVar10 = fRam000000014673dee4;
    fVar21 = _DAT_14673dee0;
    auVar19 = _DAT_146644ee0;
    auVar16._0_4_ = fVar18 + _DAT_14673dee0;
    auVar16._4_4_ = (float)auVar8._4_4_ + fRam000000014673dee4;
    auVar16._8_4_ = (float)auVar7._8_4_ + fRam000000014673dee8;
    auVar16._12_4_ = (float)(auVar6._10_4_ >> 0x10) + fRam000000014673deec;
    auVar23 = divps(auVar16,_DAT_146644ee0);
    fVar18 = auVar23._0_4_ * _DAT_14673def0;
    fVar17 = auVar23._4_4_ * fRam000000014673def4;
    *(byte *)((long)param_4 + 0x11) =
         (byte)((byte)((ushort)((ushort)(SUB161(auVar20 >> 0x4f,0) & 1) << 9) >> 8) &
                (SUB161(auVar20 >> 0x37,0) & 1 & (SUB161(auVar20 >> 0x3f,0) & 1) != 0 &
                SUB161(auVar20 >> 0x47,0) & 1) << 1 &
                (SUB161(auVar20 >> 0x17,0) & 1 & SUB161(auVar20 >> 0xf,0) & 1 &
                 SUB161(auVar20 >> 7,0) & 1 & ((iVar2 == 0 && iVar3 == 0) && iVar4 == 0) &
                SUB161(auVar20 >> 0x1f,0) & 1 & SUB161(auVar20 >> 0x27,0) & 1 &
                SUB161(auVar20 >> 0x2f,0) & 1) << 1 &
               ((byte)((byte)((ushort)((ushort)(byte)(auVar20[0xf] >> 7) << 0xf) >> 8) &
                      ((byte)((byte)((ushort)((ushort)(SUB161(auVar20 >> 0x57,0) & 1) << 10) >> 8) &
                              (byte)((ushort)((ushort)(SUB161(auVar20 >> 0x5f,0) & 1) << 0xb) >> 0xb
                                    ) << 2 &
                              (byte)((ushort)((ushort)(SUB161(auVar20 >> 0x67,0) & 1) << 0xc) >> 0xc
                                    ) << 2 &
                              (byte)((ushort)((ushort)(SUB161(auVar20 >> 0x6f,0) & 1) << 0xd) >> 0xd
                                    ) << 2 &
                             (byte)((ushort)((ushort)(SUB161(auVar20 >> 0x77,0) & 1) << 0xe) >> 0xe)
                             << 2) >> 2) << 7) >> 7) << 1) >> 1;
    auVar23._0_4_ = (float)(uVar5 & 0xffff) + fVar21;
    auVar23._4_4_ = (float)(uVar5 >> 0x10) + fVar10;
    auVar23._8_4_ = fVar11 + 0.0;
    auVar23._12_4_ = fVar12 + 0.0;
    auVar19 = divps(auVar23,auVar19);
    fVar18 = auVar19._4_4_ * fRam000000014673df04 + fVar17 + fVar18 + auVar19._0_4_ * _DAT_14673df00
             + _DAT_145907490;
    if (_DAT_1459132f4 <= fVar18) {
      fVar18 = _DAT_1459132f4;
    }
    uVar13 = _DAT_14673df10 <= fVar18;
  }
  *(undefined1 *)((long)param_4 + 0x12) = uVar13;
  return;
}
