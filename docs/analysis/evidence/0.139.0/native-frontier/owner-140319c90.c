/* WARNING: Removing unreachable block (ram,0x000140319f14) */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,undefined8 *param_3,undefined8 param_4,
          undefined8 *param_5,undefined8 *param_6)

{
  uint *puVar1;
  int iVar2;
  undefined8 uVar3;
  undefined4 uVar4;
  undefined8 uVar5;
  undefined8 uVar6;
  long lVar7;
  undefined8 uVar8;
  undefined4 *puVar9;
  undefined8 uVar10;
  int *piVar11;
  undefined4 *puVar12;
  long lVar13;
  bool bVar14;
  long lVar15;
  undefined4 *puVar16;
  ulong uVar17;
  uint uVar18;
  long *plVar19;
  long lVar20;
  long lVar21;
  long lVar22;
  uint *puVar23;
  undefined8 *in_stack_00000028;
  long *in_stack_00000030;
  long *in_stack_00000038;
  undefined8 local_338;
  undefined4 uStack_2c4;
  undefined4 uStack_284;
  long local_1e8;
  undefined8 uStack_1e0;
  undefined8 local_1d8;
  long local_1d0;
  undefined8 local_1c8;
  undefined8 local_1c0;
  long local_1b8;
  undefined8 uStack_1b0;
  undefined8 local_1a8;
  long local_1a0;
  undefined8 local_198;
  undefined8 uStack_190;
  undefined8 local_188;
  undefined8 uStack_180;
  undefined8 local_178;
  undefined8 uStack_170;
  undefined8 local_168;
  undefined8 local_160;
  undefined8 uStack_158;
  undefined8 local_150;
  undefined8 uStack_148;
  undefined8 local_140;
  undefined8 uStack_138;
  undefined8 local_130;
  undefined8 uStack_128;
  undefined8 local_120;
  undefined8 uStack_118;
  undefined8 local_110;
  undefined8 uStack_108;
  undefined8 local_100;
  undefined8 uStack_f8;
  undefined8 local_f0;
  undefined8 uStack_e8;
  undefined8 local_e0;
  undefined8 uStack_d8;
  undefined8 local_d0;
  undefined8 uStack_c8;
  undefined8 local_c0;
  undefined8 uStack_b8;
  undefined4 local_b0;
  undefined4 uStack_ac;
  undefined4 uStack_a8;
  undefined4 uStack_a4;
  undefined4 local_a0;
  undefined8 local_9c;
  undefined1 local_94;
  undefined8 local_90;
  undefined4 local_88;
  undefined2 local_84;
  undefined4 local_82;
  undefined2 local_7e;
  undefined4 local_7c;
  undefined2 local_78;
  undefined2 local_76;
  undefined8 local_74;
  undefined2 local_6c;
  undefined8 local_68;
  undefined8 uStack_60;
  undefined8 local_58;
  undefined2 local_50;

  uVar3 = param_3[4];
  uVar5 = *param_3;
  uVar6 = param_3[1];
  lVar7 = param_3[2];
  uVar8 = param_3[3];
  plVar19 = (long *)*param_5;
  puVar9 = (undefined4 *)param_5[2];
  uVar10 = param_5[3];
  piVar11 = (int *)*in_stack_00000028;
  puVar12 = (undefined4 *)in_stack_00000028[2];
  lVar13 = *in_stack_00000030;
  puVar16 = (undefined4 *)in_stack_00000030[2];
  uVar4 = *(undefined4 *)((long)in_stack_00000030 + 0x1c);
  lVar20 = *in_stack_00000038;
  lVar15 = in_stack_00000038[1];
  uStack_284 = (undefined4)((ulong)in_stack_00000028[3] >> 0x20);
  if ((int)*plVar19 == 1) {
    func_0x000140151930(param_1,plVar19,*param_6,&local_1e8);
    if (local_1e8 == -1) {
      uStack_2c4 = (undefined4)((ulong)uVar10 >> 0x20);
      *puVar9 = uStack_2c4;
      *plVar19 = 0;
      iVar2 = *piVar11;
      goto joined_r0x00014031a3f9;
    }
    if (local_1e8 != 0) {
      func_0x0001400021d0();
    }
    if (local_1d0 != 0) {
      func_0x0001400021d0();
    }
    if (local_1b8 != 0) {
      func_0x0001400021d0();
    }
    if (local_1a0 != 0) {
      func_0x0001400021d0();
    }
    bVar14 = true;
    if (*plVar19 == 0) goto LAB_140319e08;
  }
  else {
LAB_140319e08:
    iVar2 = *piVar11;
joined_r0x00014031a3f9:
    if (iVar2 != 0) {
      *puVar12 = uStack_284;
      *piVar11 = 0;
    }
    bVar14 = false;
  }
  puVar23 = *(uint **)(lVar20 + 0xf8);
  lVar21 = *(long *)(lVar20 + 0x100) * 4;
  lVar22 = 0;
  if (*(char *)(lVar20 + 0x108) == '\0') {
    do {
      if (lVar21 - lVar22 == 0) goto LAB_140319ecd;
      puVar1 = (uint *)((long)puVar23 + lVar22);
      lVar22 = lVar22 + 4;
    } while (*(long *)(*(long *)(lVar15 + 0x108) + 0x58 + (ulong)*puVar1 * 0xa0) == 0);
  }
  else {
    do {
      if (lVar21 - lVar22 == 0) goto LAB_140319ecd;
      puVar1 = (uint *)((long)puVar23 + lVar22);
      lVar22 = lVar22 + 4;
    } while (*(long *)(*(long *)(lVar15 + 0x1a8) + 0x10 + (ulong)*puVar1 * 0x48) == 0);
  }
  if (bVar14) {
    return;
  }
LAB_140319ed5:
  puVar1 = puVar23 + *(long *)(lVar20 + 0x100);
  if (*(char *)(lVar20 + 0x108) == '\0') {
LAB_14031a020:
    if (puVar23 != puVar1) {
      uVar18 = *puVar23;
      puVar23 = puVar23 + 1;
      lVar20 = *(long *)(*(long *)(lVar15 + 0x108) + 0x58 + (ulong)uVar18 * 0xa0);
      if (lVar20 != 0) {
        lVar21 = *(long *)(*(long *)(lVar15 + 0x108) + (ulong)uVar18 * 0xa0 + 0x50);
        uVar18 = 0;
        do {
          while( true ) {
            uVar17 = (ulong)uVar18;
            uVar18 = uVar18 + 1;
            local_1e8 = *(long *)(lVar21 + uVar17 * 0x10);
            if ((int)local_1e8 == 0) break;
            if (lVar7 != 0) {
              local_338 = uVar3;
            }
            uStack_1e0 = uVar5;
            local_1d8 = uVar6;
            local_1d0 = lVar7;
            local_1c8 = uVar8;
            local_1c0 = local_338;
            func_0x000145bcc400();
            if (uVar18 == (uint)lVar20) goto LAB_14031a020;
          }
        } while (uVar18 != (uint)lVar20);
      }
      goto LAB_14031a020;
    }
  }
  else {
LAB_140319f30:
    if (puVar23 != puVar1) {
      uVar18 = *puVar23;
      puVar23 = puVar23 + 1;
      lVar20 = *(long *)(*(long *)(lVar15 + 0x1a8) + 0x10 + (ulong)uVar18 * 0x48);
      if (lVar20 != 0) {
        lVar21 = *(long *)(*(long *)(lVar15 + 0x1a8) + (ulong)uVar18 * 0x48 + 8);
        uVar18 = 0;
        do {
          while( true ) {
            uVar17 = (ulong)uVar18;
            uVar18 = uVar18 + 1;
            local_1e8 = *(long *)(lVar21 + uVar17 * 8);
            if ((int)local_1e8 == 0) break;
            if (lVar7 != 0) {
              local_338 = uVar3;
            }
            uStack_1e0 = uVar5;
            local_1d8 = uVar6;
            local_1d0 = lVar7;
            local_1c8 = uVar8;
            local_1c0 = local_338;
            func_0x000145bcc400();
            if (uVar18 == (uint)lVar20) goto LAB_140319f30;
          }
        } while (uVar18 != (uint)lVar20);
      }
      goto LAB_140319f30;
    }
  }
  if (bVar14) {
    *(undefined8 *)(lVar13 + 0x70) = 0;
    *puVar16 = uVar4;
    *(undefined1 *)(lVar13 + 0x8f) = 0xff;
    *puVar12 = uStack_284;
    piVar11[0x2c] = 0x3f1c28f6;
    local_1e8 = _DAT_146543248;
    uStack_1e0 = uRam0000000146543250;
    local_1d8 = 0;
    local_1d0 = _DAT_146543260;
    local_1c8 = uRam0000000146543268;
    local_1c0 = 0;
    local_1b8 = _DAT_146543278;
    uStack_1b0 = uRam0000000146543280;
    local_1a8 = 0;
    local_1a0 = CONCAT44(uRam0000000146543294,_DAT_146543290);
    local_198 = CONCAT44(uRam000000014654329c,uRam0000000146543298);
    uStack_190 = 0;
    local_178 = 0;
    uStack_170 = 0;
    local_188 = 0;
    uStack_180 = 0;
    local_168 = 0;
    local_160 = _DAT_1464d5c70;
    uStack_158 = uRam00000001464d5c78;
    local_140 = 0;
    uStack_138 = 0;
    local_150 = 0;
    uStack_148 = 0;
    local_120 = _DAT_146543310;
    uStack_118 = uRam0000000146543318;
    local_130 = _DAT_146543300;
    uStack_128 = uRam0000000146543308;
    local_100 = _DAT_146543330;
    uStack_f8 = uRam0000000146543338;
    local_110 = _DAT_146543320;
    uStack_108 = uRam0000000146543328;
    local_e0 = _DAT_146543350;
    uStack_d8 = uRam0000000146543358;
    local_f0 = _DAT_146543340;
    uStack_e8 = uRam0000000146543348;
    local_c0 = _DAT_146543370;
    uStack_b8 = uRam0000000146543378;
    local_d0 = _DAT_146543360;
    uStack_c8 = uRam0000000146543368;
    local_b0 = _DAT_1464d5bb0;
    uStack_ac = uRam00000001464d5bb4;
    uStack_a8 = uRam00000001464d5bb8;
    uStack_a4 = uRam00000001464d5bbc;
    local_a0 = 1;
    local_9c = 0;
    local_94 = 1;
    local_90 = 0;
    local_88 = 0x3f800000;
    local_84 = 0;
    local_7e = 0;
    local_82 = 0x10000;
    local_78 = 0;
    local_7c = 0x10000;
    local_76 = 0x100;
    local_6c = 0;
    local_74 = 0;
    local_68 = 0;
    uStack_60 = 0;
    local_58 = 0x15e03f4ccccd;
    local_50 = 2;
    func_0x00014035a560();
    func_0x0001403e8f00();
  }
  return;
LAB_140319ecd:
  if (!bVar14) {
    return;
  }
  goto LAB_140319ed5;
}
