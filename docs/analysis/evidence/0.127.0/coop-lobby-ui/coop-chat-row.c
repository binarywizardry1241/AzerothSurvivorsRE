
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,char *param_3,undefined8 *param_4,
          undefined8 param_5,long param_6)

{
  byte bVar1;
  undefined4 uVar2;
  undefined8 uVar3;
  code *pcVar4;
  undefined8 *puVar5;
  long lVar6;
  undefined1 uVar7;
  long lVar8;
  uint uVar9;
  long lVar10;
  byte *pbVar11;
  byte *pbVar12;
  uint uVar13;
  long in_stack_00000028;
  undefined1 local_341;
  undefined2 uStack_340;
  undefined1 local_33e;
  undefined1 uStack_33d;
  undefined2 uStack_33c;
  undefined1 uStack_33a;
  undefined1 uStack_339;
  undefined2 uStack_338;
  undefined2 uStack_336;
  undefined2 uStack_334;
  undefined2 uStack_332;
  undefined2 uStack_330;
  undefined4 uStack_32e;
  undefined4 local_328;
  undefined4 uStack_324;
  undefined4 uStack_320;
  undefined4 uStack_31c;
  undefined4 local_318;
  undefined8 local_308;
  undefined8 uStack_300;
  undefined4 local_2f8;
  undefined5 uStack_2e6;
  undefined1 uStack_2e1;
  undefined2 uStack_2e0;
  undefined5 uStack_2de;
  undefined1 local_2d9;
  int local_2d8;
  undefined4 uStack_2d4;
  undefined4 uStack_2d0;
  undefined4 uStack_2cc;
  undefined4 local_2c8;
  undefined4 uStack_2c4;
  undefined4 *puStack_2c0;
  undefined1 *puStack_2b8;
  undefined8 uStack_2b0;
  undefined8 local_2a8;
  long *plStack_2a0;
  undefined8 *local_298;
  undefined8 uStack_290;
  undefined8 uStack_288;
  undefined8 uStack_280;
  undefined4 local_278;
  undefined8 local_274;
  undefined8 uStack_26c;
  undefined4 local_264;
  undefined8 local_260;
  undefined2 local_258;
  undefined8 local_1f8;
  undefined8 uStack_1f0;
  undefined8 local_1e8;
  undefined8 uStack_1e0;
  undefined8 local_1d8;
  undefined8 uStack_1d0;
  undefined8 local_1c8;
  undefined8 uStack_1c0;
  undefined8 local_1b8;
  undefined8 uStack_1b0;
  undefined8 local_1a8;
  undefined8 uStack_1a0;
  undefined8 local_198;
  undefined8 uStack_190;
  undefined4 local_188;
  ulong local_184;
  undefined1 local_17c;
  undefined5 uStack_178;
  undefined1 uStack_173;
  undefined2 uStack_172;
  undefined5 uStack_170;
  undefined1 uStack_16b;
  undefined4 local_16a;
  undefined2 local_166;
  undefined4 local_164;
  undefined2 local_160;
  undefined4 local_15e;
  undefined2 uStack_15a;
  undefined2 uStack_158;
  undefined2 uStack_156;
  undefined1 uStack_154;
  undefined1 uStack_153;
  undefined4 local_152;
  undefined4 uStack_14e;
  undefined4 uStack_14a;
  undefined2 uStack_146;
  undefined2 uStack_144;
  undefined6 uStack_142;
  undefined8 local_138;
  undefined8 uStack_130;
  undefined8 local_128;
  undefined8 uStack_120;
  undefined8 uStack_118;
  undefined8 uStack_110;
  undefined8 local_108;
  undefined8 uStack_100;
  undefined8 local_f8;
  undefined8 uStack_f0;
  undefined8 uStack_e8;
  undefined8 uStack_e0;
  undefined8 local_d8;
  undefined8 uStack_d0;
  undefined8 local_c8;
  undefined8 uStack_c0;
  undefined8 local_b8;
  undefined8 uStack_b0;
  undefined8 local_a8;
  undefined8 uStack_a0;
  undefined8 local_98;
  undefined8 uStack_90;
  undefined8 local_88;
  undefined8 local_80;
  undefined8 uStack_78;
  undefined8 local_70;
  undefined8 uStack_68;
  
  if (*(char *)(in_stack_00000028 + 0x39) == '\0') {
    if (*(long *)(in_stack_00000028 + 0x30) == 0) {
LAB_1402c0bb4:
      local_341 = 0;
      lVar6 = func_0x000145b059c0();
      lVar10 = 0;
      do {
        if (lVar10 == *(long *)(lVar6 + 0x58)) break;
        pbVar11 = (byte *)(lVar10 + *(long *)(lVar6 + 0x50));
        bVar1 = *pbVar11;
        uVar9 = (uint)bVar1;
        if ((char)bVar1 < '\0') {
          if (bVar1 < 0xe0) {
            pbVar12 = pbVar11 + 2;
            uVar9 = (uVar9 & 0x1f) << 6 | pbVar11[1] & 0x3f;
          }
          else {
            uVar13 = pbVar11[2] & 0x3f | (pbVar11[1] & 0x3f) << 6;
            if (bVar1 < 0xf0) {
              pbVar12 = pbVar11 + 3;
              uVar9 = uVar13 | (uVar9 & 0x1f) << 0xc;
            }
            else {
              pbVar12 = pbVar11 + 4;
              uVar9 = pbVar11[3] & 0x3f | uVar13 << 6 | (uVar9 & 7) << 0x12;
            }
          }
        }
        else {
          pbVar12 = pbVar11 + 1;
        }
        lVar10 = (long)pbVar12 - *(long *)(lVar6 + 0x50);
      } while (uVar9 == 0x23);
      func_0x000140056f40();
      if (local_2d8 == 1) {
        local_328 = (undefined4)_DAT_1462612dc;
        uStack_324 = (undefined4)((ulong)_DAT_1462612dc >> 0x20);
        uStack_320 = (undefined4)uRam00000001462612e4;
        uStack_31c = (undefined4)((ulong)uRam00000001462612e4 >> 0x20);
        local_318 = _DAT_1462612ec;
      }
      else {
        uStack_324 = uStack_2d4;
        uStack_320 = uStack_2d0;
        uStack_31c = uStack_2cc;
        local_318 = local_2c8;
        local_328 = 0;
      }
    }
    else {
      lVar6 = *(long *)(param_6 + 0x98) * 0x90;
      lVar10 = *(long *)(param_6 + 0x90);
      do {
        lVar8 = lVar10;
        if (lVar6 == 0) goto LAB_1402c0bb4;
        lVar6 = lVar6 + -0x90;
        lVar10 = lVar8 + 0x90;
      } while ((*(long *)(lVar8 + 0x80) != *(long *)(in_stack_00000028 + 0x30)) ||
              (*(long *)(lVar8 + 0x58) == 0));
      local_341 = 1;
      local_328 = (undefined4)_DAT_1462788ec;
      uStack_324 = (undefined4)((ulong)_DAT_1462788ec >> 0x20);
      uStack_320 = (undefined4)uRam00000001462788f4;
      uStack_31c = (undefined4)((ulong)uRam00000001462788f4 >> 0x20);
      local_318 = 0x3f800000;
    }
    local_2d8 = (int)_DAT_146277e98;
    uStack_2d4 = (undefined4)((ulong)_DAT_146277e98 >> 0x20);
    uStack_2d0 = (undefined4)uRam0000000146277ea0;
    uStack_2cc = (undefined4)((ulong)uRam0000000146277ea0 >> 0x20);
    local_2c8 = 0;
    uStack_2c4 = 0;
    puStack_2c0 = (undefined4 *)_DAT_146277eb0;
    puStack_2b8 = (undefined1 *)uRam0000000146277eb8;
    uStack_2b0 = 0;
    local_2a8 = _DAT_146277ec8;
    plStack_2a0 = (long *)uRam0000000146277ed0;
    local_298 = (undefined8 *)0x0;
    uStack_290 = CONCAT44(uRam0000000146277ee4,_DAT_146277ee0);
    uStack_288 = CONCAT44(uRam0000000146277eec,uRam0000000146277ee8);
    uStack_280 = 0;
    if (*(char *)(in_stack_00000028 + 0x38) == '\0') {
      local_308 = _DAT_146278850;
      uStack_300 = uRam0000000146278858;
      local_2f8 = 0;
    }
    else {
      local_308 = _DAT_146278f68;
      uStack_300 = uRam0000000146278f70;
      local_2f8 = 0x3d8f5c29;
    }
    uStack_e0 = 0;
    local_f8 = 0;
    local_138 = _DAT_146277e98;
    uStack_130 = uRam0000000146277ea0;
    local_108 = _DAT_146277ec8;
    uStack_100 = uRam0000000146277ed0;
    uStack_118 = uRam0000000146277eb8;
    uStack_110 = 0;
    local_128 = 0;
    uStack_120 = _DAT_146277eb0;
    local_d8 = 0;
    uStack_d0 = 0;
    local_c8 = 0;
    uStack_c0 = 0;
    local_b8 = 0;
    uStack_b0 = 0;
    local_a8 = 0;
    uStack_a0 = 0;
    local_98 = 0;
    uStack_90 = 0;
    local_88 = 0;
    local_70 = _DAT_146277f60;
    uStack_68 = uRam0000000146277f68;
    local_80 = _DAT_146277f50;
    uStack_78 = uRam0000000146277f58;
    uStack_2e6 = 0;
    uStack_2e1 = 0;
    uStack_2e0 = 0;
    uStack_2de = 0;
    local_2d9 = 0;
    local_33e = (undefined1)local_308;
    uStack_33d = (undefined1)((ulong)local_308 >> 8);
    uStack_33c = (undefined2)((ulong)local_308 >> 0x10);
    uStack_33a = (undefined1)((ulong)local_308 >> 0x20);
    uStack_339 = (undefined1)((ulong)local_308 >> 0x28);
    uStack_338 = (undefined2)((ulong)local_308 >> 0x30);
    uStack_336 = (undefined2)uStack_300;
    uStack_334 = (undefined2)((ulong)uStack_300 >> 0x10);
    uStack_332 = (undefined2)((ulong)uStack_300 >> 0x20);
    uStack_330 = (undefined2)((ulong)uStack_300 >> 0x30);
    uStack_32e = local_2f8;
    uVar3 = *param_4;
    uStack_f0 = uStack_290;
    uStack_e8 = uStack_288;
    func_0x00014606171b();
    local_1f8 = _DAT_14624c690;
    uStack_1f0 = uRam000000014624c698;
    local_1e8 = _DAT_146232fe0;
    uStack_1e0 = uRam0000000146232fe8;
    local_1d8 = _DAT_146277f90;
    uStack_1d0 = uRam0000000146277f98;
    local_1c8 = CONCAT44(uRam0000000146277fa4,_DAT_146277fa0);
    uStack_1c0 = CONCAT44(uRam0000000146277fac,uRam0000000146277fa8);
    local_1b8 = _DAT_146232fe0;
    uStack_1b0 = uRam0000000146232fe8;
    local_1a8 = _DAT_146232fe0;
    uStack_1a0 = uRam0000000146232fe8;
    local_198 = CONCAT44(uRam0000000146232f54,_DAT_146232f50);
    uStack_190 = CONCAT44(uRam0000000146232f5c,uRam0000000146232f58);
    local_188 = 1;
    local_184 = (ulong)_DAT_14624b5f0;
    local_17c = 1;
    uStack_16b = local_2d9;
    uStack_178 = uStack_2e6;
    uStack_173 = uStack_2e1;
    uStack_172 = uStack_2e0;
    uStack_170 = uStack_2de;
    local_16a = 0x10000;
    local_166 = 0;
    local_160 = 0;
    local_164 = 0x10000;
    local_15e = 0;
    uStack_15a = 0;
    uStack_158 = 0;
    uStack_156 = 3;
    uStack_154 = 0;
    uStack_153 = 0;
    local_152 = CONCAT13(uStack_33d,CONCAT12(local_33e,uStack_340));
    uStack_14e = CONCAT13(uStack_339,CONCAT12(uStack_33a,uStack_33c));
    uStack_14a = CONCAT22(uStack_336,uStack_338);
    uStack_146 = uStack_334;
    uStack_144 = uStack_332;
    uStack_142 = (undefined6)(CONCAT44(uStack_32e,CONCAT22(uStack_330,uStack_332)) >> 0x10);
    local_2d8 = (int)uVar3;
    uStack_2d4 = (undefined4)((ulong)uVar3 >> 0x20);
    func_0x0001402f68d0();
    local_2d8 = (int)param_5;
    uStack_2d4 = (undefined4)((ulong)param_5 >> 0x20);
    uStack_2d0 = (undefined4)in_stack_00000028;
    uStack_2cc = (undefined4)((ulong)in_stack_00000028 >> 0x20);
    local_2c8 = SUB84(param_3,0);
    uStack_2c4 = (undefined4)((ulong)param_3 >> 0x20);
    puStack_2c0 = &local_328;
    puStack_2b8 = &local_341;
    func_0x00014033eb50();
  }
  else {
    local_98 = 0;
    uStack_90 = 0;
    local_a8 = 0;
    uStack_a0 = 0;
    local_b8 = 0;
    uStack_b0 = 0;
    local_c8 = 0;
    uStack_c0 = 0;
    local_d8 = 0;
    uStack_d0 = 0;
    local_88 = 0;
    uStack_154 = 0;
    uStack_158 = 0;
    uStack_156 = 0;
    local_80 = _DAT_146277f50;
    uStack_78 = uRam0000000146277f58;
    local_70 = _DAT_146277f60;
    uStack_68 = uRam0000000146277f68;
    local_138 = _DAT_146277e98;
    uStack_130 = uRam0000000146277ea0;
    local_128 = 0;
    uStack_120 = _DAT_146277eb0;
    uStack_118 = uRam0000000146277eb8;
    uStack_110 = 0;
    local_108 = _DAT_146277ec8;
    uStack_100 = uRam0000000146277ed0;
    local_f8 = 0;
    uStack_f0 = CONCAT44(uRam0000000146277ee4,_DAT_146277ee0);
    uStack_e8 = CONCAT44(uRam0000000146277eec,uRam0000000146277ee8);
    uStack_e0 = 0;
    uVar3 = *param_4;
    func_0x00014606171b(in_stack_00000028,param_3,&local_138,&uStack_2d0,0xd8);
    local_1f8 = _DAT_146232f60;
    uStack_1f0 = uRam0000000146232f68;
    local_1e8 = _DAT_146232fa0;
    uStack_1e0 = uRam0000000146232fa8;
    local_1d8 = _DAT_146277f90;
    uStack_1d0 = uRam0000000146277f98;
    local_1c8 = CONCAT44(uRam0000000146277fa4,_DAT_146277fa0);
    uStack_1c0 = CONCAT44(uRam0000000146277fac,uRam0000000146277fa8);
    local_1b8 = _DAT_146277fb0;
    uStack_1b0 = uRam0000000146277fb8;
    local_1a8 = _DAT_146277fc0;
    uStack_1a0 = uRam0000000146277fc8;
    local_198 = CONCAT44(uRam0000000146232f54,_DAT_146232f50);
    uStack_190 = CONCAT44(uRam0000000146232f5c,uRam0000000146232f58);
    local_188 = 1;
    local_184 = 0;
    local_17c = 1;
    uStack_170 = 0;
    uStack_16b = 0;
    uStack_178 = 0;
    uStack_173 = 0;
    uStack_172 = 0;
    local_16a = 0x10000;
    local_166 = 0;
    local_160 = 0;
    local_164 = 0x10000;
    local_15e = 0;
    uStack_15a = 0;
    uStack_153 = 5;
    local_2d8 = (int)uVar3;
    uStack_2d4 = (undefined4)((ulong)uVar3 >> 0x20);
    func_0x0001402f4270();
    puVar5 = &local_138;
    func_0x000146034930();
    if (*param_3 == '\x01') {
      uVar2 = *(undefined4 *)(param_3 + 1);
      uStack_33c = (undefined2)((uint)*(undefined4 *)(param_3 + 4) >> 8);
      uStack_33a = (undefined1)((uint)*(undefined4 *)(param_3 + 4) >> 0x18);
      uStack_340 = (undefined2)uVar2;
      local_33e = (undefined1)((uint)uVar2 >> 0x10);
      uStack_33d = (undefined1)((uint)uVar2 >> 0x18);
      plStack_2a0 = *(long **)(param_3 + 8);
      puVar5 = (undefined8 *)(ulong)(byte)param_3[0x10];
      uVar7 = 1;
    }
    else {
      plStack_2a0 = *(long **)(param_3 + 8);
      LOCK();
      lVar6 = *plStack_2a0;
      *plStack_2a0 = *plStack_2a0 + 1;
      UNLOCK();
      if (*plStack_2a0 == 0 || SCARRY8(lVar6,1) != *plStack_2a0 < 0) {
                    /* WARNING: Does not return */
        pcVar4 = (code *)invalidInstructionException();
        (*pcVar4)();
      }
      uVar7 = 0;
    }
    local_2c8 = (undefined4)local_128;
    uStack_2c4 = (undefined4)((ulong)local_128 >> 0x20);
    local_2d8 = (int)local_138;
    uStack_2d4 = (undefined4)((ulong)local_138 >> 0x20);
    uStack_2d0 = (undefined4)uStack_130;
    uStack_2cc = (undefined4)((ulong)uStack_130 >> 0x20);
    puStack_2c0 = (undefined4 *)0x0;
    puStack_2b8 = (undefined1 *)0x4;
    uStack_2b0 = 0;
    local_2a8._0_5_ = CONCAT41(CONCAT13(uStack_33d,CONCAT12(local_33e,uStack_340)),uVar7);
    local_2a8 = CONCAT44(CONCAT13(uStack_33a,CONCAT21(uStack_33c,uStack_33d)),(undefined4)local_2a8)
    ;
    uStack_290 = CONCAT17(uStack_290._7_1_,0x1019041400000);
    uStack_288 = _DAT_146278828;
    uStack_280 = uRam0000000146278830;
    local_278 = 0x3f800000;
    local_274 = _DAT_146260860;
    uStack_26c = uRam0000000146260868;
    local_264 = _DAT_146260870;
    local_260 = _DAT_146232f30;
    local_258 = 1;
    local_298 = puVar5;
    func_0x000140313800();
  }
  return;
}

