
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 *
entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 *param_4,undefined8 *param_5)

{
  long lVar1;
  undefined8 uVar2;
  char *pcVar3;
  code *pcVar4;
  undefined8 uVar5;
  long *plVar6;
  undefined1 uVar7;
  ulong uVar8;
  ulong extraout_RDX;
  long lVar9;
  undefined8 *puVar10;
  undefined8 *puVar11;
  long lVar12;
  undefined4 in_XMM6_Da;
  undefined4 uVar13;
  undefined4 in_XMM7_Da;
  undefined4 uVar14;
  undefined4 uVar15;
  undefined4 uVar16;
  undefined4 uVar17;
  undefined4 uVar18;
  undefined4 local_1e0;
  undefined3 uStack_1dc;
  undefined4 local_1d8;
  undefined4 uStack_1d4;
  undefined4 uStack_1d0;
  undefined4 uStack_1cc;
  undefined1 local_1ad [8];
  undefined5 uStack_1a5;
  undefined3 uStack_1a0;
  undefined5 uStack_19d;
  undefined8 local_198;
  undefined8 local_190;
  undefined8 uStack_188;
  undefined8 local_180;
  undefined8 uStack_178;
  undefined8 local_170;
  undefined8 local_168;
  undefined8 local_160 [2];
  undefined4 local_14c;
  undefined8 local_130;
  undefined8 local_128;
  undefined8 local_120;
  undefined1 local_118;
  long *local_110;
  ulong local_108;
  undefined4 local_100;
  undefined2 local_fc;
  undefined1 local_fa;
  undefined8 local_d0;
  undefined8 local_c8;
  undefined8 uStack_c0;
  undefined8 local_b8;
  undefined4 local_98;
  undefined4 local_88;

  uVar2 = *param_4;
  local_170 = param_4[5];
  local_190 = param_4[1];
  uStack_188 = param_4[2];
  local_180 = param_4[3];
  uStack_178 = param_4[4];
  lVar12 = *(long *)(*param_3 + 0x10);
  if (lVar12 != 0) {
    pcVar3 = (char *)*param_5;
    lVar9 = *(long *)(*param_3 + 8);
    lVar12 = lVar12 << 5;
    puVar11 = (undefined8 *)(local_1ad + 1);
    puVar10 = local_160;
    uVar14 = (undefined4)_DAT_1459157d0;
    uVar15 = (undefined4)((ulong)_DAT_1459157d0 >> 0x20);
    uVar13 = _DAT_14593f980;
    uVar16 = _DAT_14593f924;
    local_198 = uVar2;
    local_98 = in_XMM6_Da;
    local_88 = in_XMM7_Da;
    do {
      if (*(char *)(lVar9 + 0x18) == '\0') {
        local_1d8 = _DAT_145940688;
        uStack_1d4 = uRam000000014594068c;
        uStack_1d0 = uRam0000000145940690;
        uStack_1cc = uRam0000000145940694;
        uVar17 = uVar16;
      }
      else {
        local_1d8 = _DAT_1459406e8;
        uStack_1d4 = uRam00000001459406ec;
        uStack_1d0 = uRam00000001459406f0;
        uStack_1cc = uRam00000001459406f4;
        uVar17 = uVar13;
      }
      uVar18 = *(undefined4 *)(lVar9 + 0x1c);
      func_0x000145728850();
      if (*pcVar3 == '\x01') {
        local_1e0 = *(undefined4 *)(pcVar3 + 1);
        uStack_1dc = (undefined3)((uint)*(undefined4 *)(pcVar3 + 4) >> 8);
        plVar6 = *(long **)(pcVar3 + 8);
        uVar8 = (ulong)(byte)pcVar3[0x10];
        uVar7 = 1;
      }
      else {
        plVar6 = *(long **)(pcVar3 + 8);
        LOCK();
        lVar1 = *plVar6;
        *plVar6 = *plVar6 + 1;
        UNLOCK();
        if (*plVar6 == 0 || SCARRY8(lVar1,1) != *plVar6 < 0) {
                    /* WARNING: Does not return */
          pcVar4 = (code *)invalidInstructionException();
          (*pcVar4)();
        }
        uVar7 = 0;
        uVar8 = extraout_RDX;
      }
      lVar9 = lVar9 + 0x20;
      puVar10[5] = local_b8;
      uVar5 = uStack_c0;
      puVar10[3] = local_c8;
      puVar10[4] = uVar5;
      *(uint *)((long)puVar10 + 0x4c) = CONCAT31(uStack_1dc,local_1e0._3_1_);
      *(undefined4 *)((long)puVar10 + 0x49) = local_1e0;
      *(undefined4 *)(puVar11 + 2) = 0x3f800000;
      *puVar11 = CONCAT44(uStack_1d4,local_1d8);
      puVar11[1] = CONCAT44(uStack_1cc,uStack_1d0);
      *(undefined4 *)(puVar10 + 2) = 0x3f800000;
      *puVar10 = CONCAT44(uStack_1d4,local_1d8);
      puVar10[1] = CONCAT44(uStack_1cc,uStack_1d0);
      local_130 = 0;
      local_128 = 4;
      local_120 = 0;
      local_fc = 400;
      local_fa = 1;
      *(ulong *)((long)puVar10 + 0x74) = CONCAT53(uStack_19d,uStack_1a0);
      *(undefined1 (*) [8])((long)puVar10 + 0x67) = local_1ad;
      *(ulong *)((long)puVar10 + 0x6f) = CONCAT35(uStack_1a0,uStack_1a5);
      *(undefined4 *)((long)puVar10 + 0x8c) = _DAT_145919180;
      *(undefined4 *)((long)puVar10 + 0x7c) = _DAT_145919170;
      *(undefined4 *)(puVar10 + 0x10) = uRam0000000145919174;
      *(undefined4 *)((long)puVar10 + 0x84) = uRam0000000145919178;
      *(undefined4 *)(puVar10 + 0x11) = uRam000000014591917c;
      local_d0 = CONCAT44(uVar15,uVar14);
      local_168 = uVar2;
      local_14c = uVar18;
      local_118 = uVar7;
      local_110 = plVar6;
      local_108 = uVar8;
      local_100 = uVar17;
      func_0x0001400dcfa0();
      lVar12 = lVar12 + -0x20;
    } while (lVar12 != 0);
  }
  return param_4;
}
