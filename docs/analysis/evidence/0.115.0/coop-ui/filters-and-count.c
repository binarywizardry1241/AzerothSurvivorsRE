
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 *
entry(undefined8 param_1,undefined8 param_2,char *param_3,undefined8 *param_4,long param_5)

{
  char cVar1;
  char cVar2;
  ulong uVar3;
  code *pcVar4;
  undefined4 uVar5;
  int iVar6;
  undefined8 *puVar7;
  byte *pbVar8;
  long lVar9;
  ulong uVar10;
  ulong uVar11;
  ulong uVar12;
  char *pcVar13;
  long lVar14;
  long *plVar15;
  ulong uVar16;
  undefined1 auVar17 [16];
  undefined8 local_1c8;
  long *plStack_1c0;
  undefined8 local_1b8;
  undefined8 local_198;
  undefined8 local_190;
  undefined8 uStack_188;
  undefined4 local_180;
  undefined4 uStack_17c;
  undefined4 uStack_178;
  undefined4 uStack_174;
  undefined8 local_170;
  long local_168 [2];
  ulong *local_158;
  undefined8 local_150;
  undefined8 local_148;
  undefined8 local_140;
  ulong *local_138;
  undefined8 local_130;
  undefined1 local_125;
  undefined7 uStack_124;
  undefined1 uStack_11d;
  undefined4 uStack_11c;
  undefined4 uStack_118;
  undefined4 uStack_114;
  undefined8 local_110;
  undefined8 local_108;
  long *plStack_100;
  undefined8 local_f8;
  undefined8 local_f0;
  undefined8 local_e8;
  undefined8 local_e0;
  undefined1 local_d8;
  undefined4 local_d7;
  undefined3 uStack_d3;
  long *local_d0;
  undefined8 *local_c8;
  undefined4 local_c0;
  undefined2 local_bc;
  undefined1 local_ba;
  undefined8 local_b9;
  undefined5 uStack_b1;
  undefined3 uStack_ac;
  undefined5 uStack_a9;
  undefined8 local_a4;
  undefined8 uStack_9c;
  undefined4 local_94;
  undefined8 local_90;
  ulong local_88;
  ulong local_80;
  long local_78;
  long local_70;
  long local_68;
  char *local_60;
  undefined4 uStack_58;
  undefined3 uStack_54;
  long local_50;
  undefined8 local_48;

  local_48 = 0xfffffffffffffffe;
  local_198 = *param_4;
  local_170 = param_4[5];
  local_190 = param_4[1];
  uStack_188 = param_4[2];
  local_180 = *(undefined4 *)(param_4 + 3);
  uStack_17c = *(undefined4 *)((long)param_4 + 0x1c);
  uStack_178 = *(undefined4 *)(param_4 + 4);
  uStack_174 = *(undefined4 *)((long)param_4 + 0x24);
  local_110._0_1_ = 0xb;
  func_0x0001458dfee0(param_1,param_4,0xe,0x145f27b3e);
  cVar1 = *(char *)(param_5 + 0x12e);
  func_0x00014020e190();
  local_110 = CONCAT71(local_110._1_7_,0xc);
  func_0x0001458dfee0();
  cVar2 = *(char *)(param_5 + 0x12f);
  func_0x00014020e190();
  lVar9 = *(long *)(param_5 + 0x108);
  local_60 = param_3;
  if (lVar9 == -1) {
    auVar17 = func_0x0001458dfee0();
    local_78 = auVar17._8_8_;
    if (local_78 < 0) {
LAB_1402f10bb:
      func_0x000145eb6fcb();
                    /* WARNING: Does not return */
      pcVar4 = (code *)invalidInstructionException();
      (*pcVar4)();
    }
    local_68 = local_78;
    if (local_78 == 0) {
      local_70 = 1;
    }
    else {
      local_50 = auVar17._0_8_;
      func_0x000140002200();
      lVar14 = func_0x0001400021c0();
      if (lVar14 == 0) goto LAB_1402f10bb;
      func_0x000145d145fb();
      local_70 = lVar14;
    }
  }
  else {
    local_168[0] = param_5 + 0x108;
    func_0x0001458dfee0();
    local_110 = 0x145f249b0;
    local_108 = 4;
    plStack_100 = local_168;
    local_f8 = 0x145f27b70;
    func_0x0001458e0370();
  }
  local_110 = CONCAT71(local_110._1_7_,0xd);
  local_50 = local_70;
  func_0x00014020e190();
  uVar3 = *(ulong *)(param_5 + 0x70);
  if (uVar3 == 0) {
    uVar16 = 0;
  }
  else {
    lVar14 = *(long *)(param_5 + 0x68);
    if (lVar9 == -1) {
      if (cVar1 == '\0') {
        if (cVar2 == '\0') goto LAB_1402f13bd;
        uVar10 = (ulong)((uint)uVar3 & 3);
        if (uVar3 < 4) {
          uVar11 = 0;
          uVar16 = 0;
        }
        else {
          pbVar8 = (byte *)(lVar14 + 0x3b9);
          uVar11 = 0;
          uVar16 = 0;
          do {
            uVar16 = ((ulong)*pbVar8 ^ 1) +
                     ((ulong)pbVar8[-0xf0] ^ 1) + ((ulong)pbVar8[-0x1e0] ^ 1) +
                     ((ulong)pbVar8[-0x2d0] ^ 1) + uVar16;
            uVar11 = uVar11 + 4;
            pbVar8 = pbVar8 + 0x3c0;
          } while ((uVar3 & 0xfffffffffffffffc) != uVar11);
          if (uVar10 == 0) goto LAB_1402f1205;
        }
        lVar9 = 0;
        do {
          uVar16 = uVar16 + ((ulong)*(byte *)(uVar11 * 0xf0 + lVar14 + 0xe9 + lVar9) ^ 1);
          lVar9 = lVar9 + 0xf0;
        } while (uVar10 * 0xf0 - lVar9 != 0);
      }
      else if (cVar2 == '\0') {
        uVar10 = (ulong)((uint)uVar3 & 3);
        if (uVar3 < 4) {
          uVar11 = 0;
          uVar16 = 0;
        }
        else {
          pbVar8 = (byte *)(lVar14 + 0x3b8);
          uVar11 = 0;
          uVar16 = 0;
          do {
            uVar16 = (ulong)*pbVar8 +
                     (ulong)pbVar8[-0xf0] + (ulong)pbVar8[-0x1e0] + pbVar8[-0x2d0] + uVar16;
            uVar11 = uVar11 + 4;
            pbVar8 = pbVar8 + 0x3c0;
          } while ((uVar3 & 0xfffffffffffffffc) != uVar11);
          if (uVar10 == 0) goto LAB_1402f1205;
        }
        lVar9 = 0;
        do {
          uVar16 = uVar16 + *(byte *)(uVar11 * 0xf0 + lVar14 + 0xe8 + lVar9);
          lVar9 = lVar9 + 0xf0;
        } while (uVar10 * 0xf0 - lVar9 != 0);
      }
      else {
        if (uVar3 == 1) {
          uVar10 = 0;
          uVar16 = 0;
        }
        else {
          pbVar8 = (byte *)(lVar14 + 0x1d9);
          uVar10 = 0;
          uVar16 = 0;
          do {
            if (pbVar8[-0xf1] == 1) {
              uVar11 = (ulong)pbVar8[-0xf0] ^ 1;
              if (pbVar8[-1] == 1) goto LAB_1402f15b0;
LAB_1402f15f9:
              uVar12 = 0;
            }
            else {
              uVar11 = 0;
              if (pbVar8[-1] != 1) goto LAB_1402f15f9;
LAB_1402f15b0:
              uVar12 = (ulong)*pbVar8 ^ 1;
            }
            uVar16 = uVar16 + uVar11 + uVar12;
            uVar10 = uVar10 + 2;
            pbVar8 = pbVar8 + 0x1e0;
          } while ((uVar3 & 0xfffffffffffffffe) != uVar10);
          if ((uVar3 & 1) == 0) goto LAB_1402f1205;
        }
        if (*(char *)(lVar14 + 0xe8 + uVar10 * 0xf0) == '\x01') {
          uVar10 = (ulong)*(byte *)(lVar14 + uVar10 * 0xf0 + 0xe9) ^ 1;
        }
        else {
          uVar10 = 0;
        }
        uVar16 = uVar16 + uVar10;
      }
    }
    else {
      lVar9 = *(long *)(param_5 + 0x118);
      if (cVar1 == '\0') {
        if (cVar2 == '\0') {
          plVar15 = (long *)(lVar14 + 0xa0);
          uVar16 = 0;
          uVar10 = uVar3;
          do {
            while (lVar9 == *plVar15) {
              iVar6 = func_0x000145d14601();
              uVar16 = uVar16 + (iVar6 == 0);
              plVar15 = plVar15 + 0x1e;
              uVar10 = uVar10 - 1;
              if (uVar10 == 0) goto LAB_1402f1205;
            }
            plVar15 = plVar15 + 0x1e;
            uVar10 = uVar10 - 1;
          } while (uVar10 != 0);
        }
        else {
          lVar14 = lVar14 + 0x98;
          uVar16 = 0;
          uVar10 = uVar3;
          do {
            while ((*(char *)(lVar14 + 0x51) != '\0' || (lVar9 != *(long *)(lVar14 + 8)))) {
              lVar14 = lVar14 + 0xf0;
              uVar10 = uVar10 - 1;
              if (uVar10 == 0) goto LAB_1402f1205;
            }
            iVar6 = func_0x000145d14601();
            uVar16 = uVar16 + (iVar6 == 0);
            lVar14 = lVar14 + 0xf0;
            uVar10 = uVar10 - 1;
          } while (uVar10 != 0);
        }
      }
      else if (cVar2 == '\0') {
        lVar14 = lVar14 + 0x98;
        uVar16 = 0;
        uVar10 = uVar3;
        do {
          while ((*(char *)(lVar14 + 0x50) != '\x01' || (lVar9 != *(long *)(lVar14 + 8)))) {
            lVar14 = lVar14 + 0xf0;
            uVar10 = uVar10 - 1;
            if (uVar10 == 0) goto LAB_1402f1205;
          }
          iVar6 = func_0x000145d14601();
          uVar16 = uVar16 + (iVar6 == 0);
          lVar14 = lVar14 + 0xf0;
          uVar10 = uVar10 - 1;
        } while (uVar10 != 0);
      }
      else {
        pcVar13 = (char *)(lVar14 + 0xe9);
        uVar16 = 0;
        uVar10 = uVar3;
        do {
          while (((pcVar13[-1] != '\x01' || (*pcVar13 != '\0')) ||
                 (lVar9 != *(long *)(pcVar13 + -0x49)))) {
            pcVar13 = pcVar13 + 0xf0;
            uVar10 = uVar10 - 1;
            if (uVar10 == 0) goto LAB_1402f1205;
          }
          iVar6 = func_0x000145d14601();
          uVar16 = uVar16 + (iVar6 == 0);
          pcVar13 = pcVar13 + 0xf0;
          uVar10 = uVar10 - 1;
        } while (uVar10 != 0);
      }
    }
  }
LAB_1402f1205:
  local_80 = uVar16;
  if (uVar16 < uVar3) {
    func_0x0001458dfee0();
    local_168[0] = 0x145f27ba6;
    local_168[1] = 5;
    local_158 = &local_80;
    local_150 = 0x145f246b8;
    local_148 = 0x145f246dc;
    local_140 = 3;
    local_138 = &local_88;
    local_130 = 0x145f246b8;
    puVar7 = &local_1c8;
    pcVar13 = local_60;
    local_88 = uVar3;
    func_0x0001458e0370();
    if (*pcVar13 == '\x01') {
      uStack_58 = *(undefined4 *)(pcVar13 + 1);
      uStack_54 = (undefined3)((uint)*(undefined4 *)(pcVar13 + 4) >> 8);
      local_d0 = *(long **)(pcVar13 + 8);
      puVar7 = (undefined8 *)(ulong)(byte)pcVar13[0x10];
      local_d8 = 1;
    }
    else {
      local_d0 = *(long **)(pcVar13 + 8);
      LOCK();
      lVar9 = *local_d0;
      *local_d0 = *local_d0 + 1;
      UNLOCK();
      if (*local_d0 == 0 || SCARRY8(lVar9,1) != *local_d0 < 0) {
                    /* WARNING: Does not return */
        pcVar4 = (code *)invalidInstructionException();
        (*pcVar4)();
      }
      local_d8 = 0;
    }
    local_f8 = local_1b8;
    local_108 = local_1c8;
    plStack_100 = plStack_1c0;
    uStack_124 = (undefined7)_DAT_145f2443c;
    uStack_11d = (undefined1)((ulong)_DAT_145f2443c >> 0x38);
    uStack_11c = (undefined4)uRam0000000145f24444;
    uStack_118 = (undefined4)((ulong)uRam0000000145f24444 >> 0x20);
    uVar5 = uStack_118;
    uStack_114 = 0x3f800000;
    local_f0 = 0;
    local_e8 = 4;
    local_e0 = 0;
    local_d7 = uStack_58;
    uStack_d3 = uStack_54;
    local_c0 = 0x41500000;
    local_bc = 400;
    local_ba = 1;
    uStack_a9 = (undefined5)(CONCAT44(0x3f800000,uStack_118) >> 0x18);
    local_b9 = CONCAT71(uStack_124,local_125);
    uStack_b1 = CONCAT41(uStack_11c,uStack_11d);
    uStack_118._0_3_ = (undefined3)((ulong)uRam0000000145f24444 >> 0x20);
    uStack_ac = (undefined3)uStack_118;
    local_94 = _DAT_145f152e0;
    local_a4 = _DAT_145f152d0;
    uStack_9c = uRam0000000145f152d8;
    local_90 = _DAT_145edff70;
    local_110 = local_198;
    uStack_118 = uVar5;
    local_c8 = puVar7;
    func_0x0001402bacf0();
  }
LAB_1402f13bd:
  if (local_78 != 0) {
    func_0x0001400021d0();
  }
  return param_4;
}
