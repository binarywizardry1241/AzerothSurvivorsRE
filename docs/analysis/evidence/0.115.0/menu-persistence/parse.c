
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

ulong entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,undefined8 param_4)

{
  undefined1 auVar1 [14];
  undefined1 auVar2 [14];
  undefined1 auVar3 [14];
  undefined1 auVar4 [14];
  uint uVar5;
  uint uVar6;
  undefined8 *puVar7;
  undefined4 uVar8;
  short sVar15;
  short sVar16;
  undefined1 auVar10 [16];
  undefined1 auVar11 [16];
  undefined1 auVar12 [16];
  undefined1 auVar13 [16];
  undefined1 auVar17 [16];
  undefined1 auVar18 [16];
  ulong uVar19;
  long local_68;
  undefined8 *local_60;
  long local_58;
  undefined8 local_50;
  undefined8 local_48;
  undefined8 local_40;
  undefined8 local_38;
  undefined8 local_30;
  undefined8 local_28;
  undefined8 local_20;
  undefined1 local_18;
  undefined2 local_10;
  undefined8 uStack_8;
  long lVar9;
  short sVar14;
  
  local_50 = 0;
  local_30 = 0;
  local_20 = 0x2c0000002c;
  local_18 = 1;
  local_10 = 1;
  local_48 = param_3;
  local_40 = param_4;
  local_38 = param_3;
  local_28 = param_3;
  uStack_8 = param_2;
  func_0x0001459ce220(param_1,param_2,&local_50,&local_68);
  if (local_58 == 4) {
    puVar7 = (undefined8 *)*local_60;
    if (local_68 != 0) {
      func_0x0001400021d0(param_1,puVar7,local_68 * 2,local_60,2);
    }
  }
  else {
    puVar7 = local_60;
    if (local_68 != -1) {
      if (local_68 != 0) {
        func_0x0001400021d0(param_1,local_60,local_68 * 2,local_60,2);
      }
      puVar7 = (undefined8 *)0x64006400640064;
    }
  }
  auVar11._8_8_ = 0;
  auVar11._0_8_ = (ulong)puVar7 >> 0x10 & 0xffff | ((ulong)puVar7 >> 0x20 & 0xffff) << 0x10;
  auVar18._8_8_ = 0;
  auVar18._0_8_ =
       (ulong)puVar7 >> 0x30 | ((ulong)puVar7 >> 0x20 & 0xffff) << 0x10 |
       ((ulong)puVar7 >> 0x10 & 0xffff) << 0x20 | (long)puVar7 << 0x30;
  auVar10 = psubusw(auVar18,_DAT_146ccb1f0);
  auVar12._0_2_ = ((short)((ulong)puVar7 >> 0x30) - auVar10._0_2_) + _DAT_146ccb200;
  auVar12._2_2_ = ((short)((ulong)puVar7 >> 0x20) - auVar10._2_2_) + sRam0000000146ccb202;
  auVar12._4_2_ = ((short)((ulong)puVar7 >> 0x10) - auVar10._4_2_) + sRam0000000146ccb204;
  auVar12._6_2_ = ((ushort)puVar7 - auVar10._6_2_) + sRam0000000146ccb206;
  auVar12._8_2_ = sRam0000000146ccb208 - auVar10._8_2_;
  auVar12._10_2_ = sRam0000000146ccb20a - auVar10._10_2_;
  auVar12._12_2_ = sRam0000000146ccb20c - auVar10._12_2_;
  auVar12._14_2_ = sRam0000000146ccb20e - auVar10._14_2_;
  auVar10._8_8_ = 0;
  auVar10._0_8_ =
       (ulong)((uint)((ulong)puVar7 >> 0x32) < 0x19) |
       (ulong)(ushort)-(ushort)(SUB162(auVar11 ^ _DAT_145f6d3b0,2) < sRam0000000146ccb1e2) << 0x10 |
       (ulong)(ushort)-(ushort)(SUB162(auVar11 ^ _DAT_145f6d3b0,0) < _DAT_146ccb1e0) << 0x20 |
       (ulong)((ushort)puVar7 < 100) << 0x30;
  auVar11 = psllw(auVar10,0xf);
  auVar11 = psraw(auVar11,0xf);
  auVar12 = ~auVar11 & auVar12;
  uVar5 = (uint)auVar12._4_2_ * 0x47af >> 0x10;
  uVar6 = (uint)auVar12._6_2_ * 0x47af >> 0x10;
  sVar14 = (auVar12._2_2_ / 5 & 0xfffe) * 5 + sRam0000000146ccb212;
  uVar8 = CONCAT22(sVar14,(short)((auVar12._0_4_ & 0xffff) / 5) * 5 + _DAT_146ccb210);
  sVar15 = (short)(((auVar12._4_2_ - uVar5 & 0xffff) >> 1) + uVar5 >> 4) * 0x19 +
           sRam0000000146ccb214;
  sVar16 = (short)(((auVar12._6_2_ - uVar6 & 0xffff) >> 1) + uVar6 >> 4) * 0x19 +
           sRam0000000146ccb216;
  lVar9 = CONCAT26(sVar16,CONCAT24(sVar15,uVar8));
  auVar1._8_2_ = auVar12._8_2_ + sRam0000000146ccb218;
  auVar1._0_8_ = lVar9;
  auVar1._10_2_ = 0;
  auVar1._12_2_ = sVar16;
  auVar2._8_2_ = sVar15;
  auVar2._0_8_ = lVar9;
  auVar2._10_4_ = auVar1._10_4_;
  auVar4._6_8_ = 0;
  auVar4._0_6_ = auVar2._8_6_;
  auVar3._4_2_ = sVar14;
  auVar3._0_4_ = uVar8;
  auVar3._6_8_ = SUB148(auVar4 << 0x40,6);
  uVar19 = (ulong)auVar2._8_6_ & 0xffffffff;
  auVar13._0_8_ = lVar9 << 0x30;
  auVar13._8_4_ = 0;
  auVar13._12_4_ = auVar3._4_4_;
  auVar17._0_4_ = (undefined4)(uVar19 << 0x10);
  auVar17._4_4_ = (undefined4)(uVar19 >> 0x10);
  auVar17._8_2_ = sVar16;
  auVar17._10_6_ = 0;
  return SUB168(auVar17 | auVar13,8) | SUB168(auVar17 | auVar13,0);
}

