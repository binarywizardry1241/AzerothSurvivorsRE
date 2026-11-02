/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,undefined8 *param_3,undefined8 param_4,
          long *param_5,undefined8 *param_6)

{
  uint *puVar1;
  undefined8 uVar2;
  undefined8 uVar3;
  undefined8 uVar4;
  undefined8 uVar5;
  long lVar6;
  undefined8 uVar7;
  undefined4 *puVar8;
  char cVar9;
  int iVar10;
  char *pcVar11;
  long lVar12;
  char *pcVar13;
  char *pcVar14;
  char cVar15;
  long lVar16;
  uint uVar17;
  ulong uVar18;
  ulong uVar19;
  long lVar20;
  long lVar21;
  uint *puVar22;
  long lVar23;
  bool bVar24;
  long *in_stack_00000028;
  undefined8 *in_stack_00000030;
  undefined4 *in_stack_00000038;
  int *in_stack_00000040;
  int *in_stack_00000048;
  undefined8 local_368;
  undefined4 uStack_274;
  undefined8 local_270;
  undefined8 uStack_268;
  undefined4 local_260;
  undefined4 uStack_25c;
  undefined4 uStack_258;
  undefined4 uStack_254;
  undefined4 local_250;
  undefined4 uStack_24c;
  undefined4 uStack_248;
  undefined4 uStack_244;
  undefined8 local_240;
  int *local_238;
  long local_230;
  long lStack_228;
  long local_220;
  long lStack_218;
  int *local_210;
  undefined4 *local_208;
  undefined8 *puStack_200;
  char *local_1f8;
  long local_1f0;
  undefined8 local_1e8;
  undefined8 local_1e0;
  undefined8 local_1d8;
  undefined8 uStack_1d0;
  undefined8 local_1c8;
  undefined8 local_1c0;
  undefined8 local_1b8;
  undefined8 uStack_1b0;
  undefined8 local_1a8;
  undefined8 uStack_1a0;
  undefined8 local_198;
  undefined8 uStack_190;
  undefined8 local_188;
  undefined8 local_180;
  undefined8 uStack_178;
  undefined8 local_170;
  undefined8 uStack_168;
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
  undefined4 local_d0;
  undefined4 uStack_cc;
  undefined4 uStack_c8;
  undefined4 uStack_c4;
  undefined4 local_c0;
  undefined8 local_bc;
  undefined1 local_b4;
  undefined8 local_b0;
  undefined4 local_a8;
  undefined2 local_a4;
  undefined4 local_a2;
  undefined2 local_9e;
  undefined4 local_9c;
  undefined2 local_98;
  undefined2 local_96;
  undefined8 local_94;
  undefined2 local_8c;
  undefined8 local_88;
  undefined8 uStack_80;
  undefined8 local_78;
  undefined2 local_70;
  undefined4 local_68;
  undefined4 uStack_64;
  undefined4 uStack_60;
  undefined4 uStack_5c;
  long local_58;
  long lStack_50;

  uVar2 = param_3[4];
  uVar4 = *param_3;
  uVar5 = param_3[1];
  lVar6 = param_3[2];
  uVar7 = param_3[3];
  lVar20 = *param_5;
  pcVar13 = (char *)*param_6;
  puVar8 = (undefined4 *)param_6[2];
  uVar3 = param_6[3];
  local_230 = *in_stack_00000028;
  lStack_228 = in_stack_00000028[1];
  local_220 = in_stack_00000028[2];
  lStack_218 = in_stack_00000028[3];
  local_270 = *in_stack_00000030;
  uStack_268 = in_stack_00000030[1];
  local_260 = *(undefined4 *)(in_stack_00000030 + 2);
  uStack_25c = *(undefined4 *)((long)in_stack_00000030 + 0x14);
  uStack_258 = *(undefined4 *)(in_stack_00000030 + 3);
  uStack_254 = *(undefined4 *)((long)in_stack_00000030 + 0x1c);
  local_250 = *in_stack_00000038;
  uStack_24c = in_stack_00000038[1];
  uStack_248 = in_stack_00000038[2];
  uStack_244 = in_stack_00000038[3];
  local_240 = *(undefined8 *)(in_stack_00000038 + 4);
  local_238 = in_stack_00000040;
  local_210 = in_stack_00000048;
  iVar10 = *(int *)(lVar20 + 0xe4);
  if ((*in_stack_00000048 == *(int *)(lVar20 + 0xe4)) &&
     (iVar10 = *in_stack_00000048, *(char *)(lVar20 + 0xa0) != -1)) {
    func_0x000143868070(in_stack_00000040,lVar20,5,0x146510f24,lVar20 + 0xa0);
    pcVar14 = _DAT_1489c1ab8;
    pcVar11 = (char *)func_0x000143868070();
    if (pcVar11 == (char *)0x0) {
      pcVar11 = pcVar14;
    }
    if (*pcVar11 == '\x05') {
      cVar9 = *pcVar13;
      iVar10 = *(int *)(lVar20 + 0xe4);
      cVar15 = (char)in_stack_00000040[1];
      goto joined_r0x0001401788f0;
    }
    iVar10 = *(int *)(lVar20 + 0xe4);
  }
  *in_stack_00000048 = iVar10;
  uStack_274 = (undefined4)((ulong)uVar3 >> 0x20);
  *puVar8 = uStack_274;
  *pcVar13 = '\0';
  cVar9 = '\0';
  iVar10 = *(int *)(lVar20 + 0xe4);
  cVar15 = (char)in_stack_00000040[1];
joined_r0x0001401788f0:
  if (((cVar15 == '\x02') || (cVar15 != cVar9)) || (*in_stack_00000040 != iVar10)) {
    if (local_230 == 0) {
      return;
    }
    lVar21 = CONCAT44(uStack_24c,local_250);
    puVar22 = *(uint **)(lVar21 + 0xf8);
    lVar16 = *(long *)(lVar21 + 0x100);
    cVar15 = *(char *)(lVar21 + 0x108);
  }
  else {
    lVar21 = CONCAT44(uStack_24c,local_250);
    puVar22 = *(uint **)(lVar21 + 0xf8);
    lVar16 = *(long *)(lVar21 + 0x100);
    cVar15 = *(char *)(lVar21 + 0x108);
    lVar21 = 0;
    if (cVar15 == '\0') {
      do {
        bVar24 = lVar16 * 4 - lVar21 == 0;
        if (bVar24) break;
        puVar1 = (uint *)((long)puVar22 + lVar21);
        lVar21 = lVar21 + 4;
      } while (*(long *)(*(long *)(CONCAT44(uStack_244,uStack_248) + 0x108) + 0x58 +
                        (ulong)*puVar1 * 0xa0) == 0);
    }
    else {
      do {
        bVar24 = lVar16 * 4 - lVar21 == 0;
        if (bVar24) break;
        puVar1 = (uint *)((long)puVar22 + lVar21);
        lVar21 = lVar21 + 4;
      } while (*(long *)(*(long *)(CONCAT44(uStack_244,uStack_248) + 0x1a8) + 0x10 +
                        (ulong)*puVar1 * 0x48) == 0);
    }
    if (bVar24 != (bool)cVar9) {
      return;
    }
    if (local_230 == 0) {
      return;
    }
  }
  lVar23 = CONCAT44(uStack_244,uStack_248);
  local_68 = (undefined4)*in_stack_00000028;
  uStack_64 = *(undefined4 *)((long)in_stack_00000028 + 4);
  uStack_60 = (undefined4)in_stack_00000028[1];
  uStack_5c = *(undefined4 *)((long)in_stack_00000028 + 0xc);
  local_58 = in_stack_00000028[2];
  lStack_50 = in_stack_00000028[3];
  *in_stack_00000040 = iVar10;
  *(char *)(in_stack_00000040 + 1) = cVar9;
  puVar1 = puVar22 + lVar16;
  lVar21 = 0;
  lVar16 = 8;
  uVar18 = 0;
  if (cVar15 == '\0') {
LAB_140178b49:
    if ((int)uVar18 != (int)lVar21) goto LAB_140178b39;
    while (puVar22 != puVar1) {
      uVar17 = *puVar22;
      puVar22 = puVar22 + 1;
      lVar16 = *(long *)(lVar23 + 0x108);
      lVar21 = *(long *)(lVar16 + 0x58 + (ulong)uVar17 * 0xa0);
      if (lVar21 != 0) {
        lVar16 = *(long *)(lVar16 + (ulong)uVar17 * 0xa0 + 0x50);
        uVar18 = 0;
LAB_140178b39:
        do {
          lVar12 = uVar18 * 0x10;
          uVar17 = (int)uVar18 + 1;
          uVar18 = (ulong)uVar17;
          uVar3 = *(undefined8 *)(lVar16 + lVar12);
          if ((int)uVar3 == 0) goto LAB_140178b49;
          if (lVar6 != 0) {
            local_368 = uVar2;
          }
          local_208 = (undefined4 *)uVar3;
          puStack_200 = (undefined8 *)uVar4;
          local_1f8 = (char *)uVar5;
          local_1f0 = lVar6;
          local_1e8 = uVar7;
          local_1e0 = local_368;
          func_0x000145bcc400();
        } while (uVar17 != (uint)lVar21);
      }
    }
  }
  else {
LAB_140178a66:
    uVar19 = uVar18;
    if ((int)uVar18 != (int)lVar21) goto LAB_140178a5a;
    while (puVar22 != puVar1) {
      uVar17 = *puVar22;
      puVar22 = puVar22 + 1;
      lVar16 = *(long *)(lVar23 + 0x1a8);
      lVar21 = *(long *)(lVar16 + 0x10 + (ulong)uVar17 * 0x48);
      if (lVar21 != 0) {
        lVar16 = *(long *)(lVar16 + (ulong)uVar17 * 0x48 + 8);
        uVar19 = 0;
LAB_140178a5a:
        do {
          uVar17 = (int)uVar19 + 1;
          uVar18 = (ulong)uVar17;
          uVar3 = *(undefined8 *)(lVar16 + uVar19 * 8);
          if ((int)uVar3 == 0) goto LAB_140178a66;
          if (lVar6 != 0) {
            local_368 = uVar2;
          }
          local_208 = (undefined4 *)uVar3;
          puStack_200 = (undefined8 *)uVar4;
          local_1f8 = (char *)uVar5;
          local_1f0 = lVar6;
          local_1e8 = uVar7;
          local_1e0 = local_368;
          func_0x000145bcc400();
          uVar19 = uVar18;
        } while (uVar17 != (uint)lVar21);
      }
    }
  }
  if ((*pcVar13 == '\x01') && (*(char *)(lVar20 + 0xa0) != -1)) {
    pcVar13 = (char *)func_0x000143868070();
    if (pcVar13 == (char *)0x0) {
      pcVar13 = _DAT_1489c1ab8;
    }
    pcVar11 = _DAT_1489c1ab8;
    pcVar14 = (char *)func_0x000143868070(_DAT_1489c1ab8,pcVar13,6,0x146510f29,pcVar13);
    if (pcVar14 == (char *)0x0) {
      pcVar14 = pcVar11;
    }
    if (*pcVar14 == '\x05') {
      local_208 = (undefined4 *)_DAT_14650fe90;
      puStack_200 = (undefined8 *)uRam000000014650fe98;
      local_1d8 = _DAT_14650fec0;
      uStack_1d0 = uRam000000014650fec8;
      local_1f8 = (char *)0x0;
      local_1f0 = _DAT_14650fea8;
      local_1e8 = uRam000000014650feb0;
      local_1e0 = 0;
      local_1c8 = 0;
      local_1c0 = CONCAT44(uRam000000014650fedc,_DAT_14650fed8);
      local_1b8 = CONCAT44(uRam000000014650fee4,uRam000000014650fee0);
      uStack_1b0 = 0;
      local_198 = 0;
      uStack_190 = 0;
      local_1a8 = 0;
      uStack_1a0 = 0;
      local_188 = 0;
      local_180 = _DAT_1464d5c70;
      uStack_178 = uRam00000001464d5c78;
      local_160 = 0;
      uStack_158 = 0;
      local_170 = 0;
      uStack_168 = 0;
      local_140 = _DAT_14650ff58;
      uStack_138 = uRam000000014650ff60;
      local_150 = _DAT_14650ff48;
      uStack_148 = uRam000000014650ff50;
      local_120 = _DAT_14650ff78;
      uStack_118 = uRam000000014650ff80;
      local_130 = _DAT_14650ff68;
      uStack_128 = uRam000000014650ff70;
      local_100 = _DAT_14650ff98;
      uStack_f8 = uRam000000014650ffa0;
      local_110 = _DAT_14650ff88;
      uStack_108 = uRam000000014650ff90;
      local_e0 = _DAT_14650ffb8;
      uStack_d8 = uRam000000014650ffc0;
      local_f0 = _DAT_14650ffa8;
      uStack_e8 = uRam000000014650ffb0;
      local_d0 = _DAT_1464d5bb0;
      uStack_cc = uRam00000001464d5bb4;
      uStack_c8 = uRam00000001464d5bb8;
      uStack_c4 = uRam00000001464d5bbc;
      local_c0 = 1;
      local_bc = 0;
      local_b4 = 1;
      local_b0 = 0;
      local_a8 = 0x3f800000;
      local_a4 = 0;
      local_9e = 0;
      local_a2 = 0x10000;
      local_98 = 0;
      local_9c = 0x10000;
      local_96 = 0x100;
      local_8c = 0;
      local_94 = 0;
      local_88 = 0;
      uStack_80 = 0;
      local_78 = 0x19c83f47ae14;
      local_70 = 2;
      func_0x000140357f90();
      local_208 = &local_68;
      puStack_200 = &local_270;
      local_1f8 = pcVar13;
      func_0x0001403add50();
    }
  }
  return;
}
