
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,char *param_3,undefined8 *param_4,long param_5)

{
  char cVar1;
  int *piVar2;
  code *pcVar3;
  undefined4 uVar4;
  byte bVar5;
  ulong uVar7;
  char *pcVar8;
  long lVar9;
  long *plVar10;
  ulong uVar11;
  ulong uVar12;
  undefined1 (*pauVar13) [16];
  undefined1 uVar14;
  byte bVar15;
  uint uVar16;
  ulong uVar17;
  undefined8 uVar18;
  ulong uVar19;
  undefined1 auVar20 [16];
  undefined8 local_3a8;
  undefined8 uStack_3a0;
  undefined8 local_398;
  undefined8 local_390;
  undefined8 uStack_388;
  undefined8 local_380;
  undefined8 local_378;
  undefined8 uStack_370;
  undefined8 local_368;
  undefined8 local_360;
  undefined8 uStack_358;
  undefined8 local_350;
  undefined8 local_348;
  undefined8 uStack_340;
  undefined8 local_338;
  undefined8 uStack_330;
  undefined8 local_328;
  undefined8 uStack_320;
  undefined8 local_318;
  undefined8 uStack_310;
  undefined8 local_308;
  undefined8 uStack_300;
  undefined8 local_2f8;
  undefined8 local_2f0;
  undefined8 uStack_2e8;
  undefined8 local_2e0;
  undefined8 uStack_2d8;
  undefined8 local_2d0;
  undefined8 uStack_2c8;
  undefined8 local_2c0;
  undefined8 uStack_2b8;
  undefined8 local_2b0;
  undefined8 uStack_2a8;
  undefined8 local_2a0;
  undefined8 uStack_298;
  undefined8 local_290;
  undefined8 uStack_288;
  undefined8 local_280;
  undefined8 uStack_278;
  undefined1 local_268 [3] [16];
  undefined8 local_238;
  undefined8 uStack_230;
  undefined1 (*local_228) [16];
  undefined8 local_220;
  undefined8 local_218;
  undefined8 local_210;
  undefined1 (*local_208) [16];
  long *local_200;
  undefined1 (*local_1f8) [16];
  undefined4 local_1f0;
  undefined2 local_1ec;
  undefined1 local_1ea;
  undefined8 local_1e8;
  undefined8 uStack_1e0;
  undefined4 local_1d8;
  undefined8 local_1d4;
  undefined8 uStack_1cc;
  undefined4 local_1c4;
  undefined8 local_1c0;
  undefined8 local_f8;
  undefined8 uStack_f0;
  undefined4 local_e8;
  undefined8 local_e4;
  undefined1 local_dc;
  undefined8 local_d8;
  undefined4 local_d0;
  undefined2 local_cc;
  undefined4 local_ca;
  undefined2 local_c6;
  undefined4 local_c4;
  undefined2 local_c0;
  undefined4 local_be;
  undefined2 local_ba;
  undefined4 local_b8;
  undefined1 local_b4;
  undefined1 local_b3;
  undefined8 local_b0;
  ulong local_a8;
  long local_a0;
  ulong local_98;
  undefined8 local_90;
  undefined8 uStack_88;
  undefined8 local_80;
  undefined8 local_78;
  undefined8 uStack_70;
  undefined4 local_68;
  char *local_58;
  undefined1 local_49;
  undefined8 local_48;
  byte bVar6;
  
  local_48 = 0xfffffffffffffffe;
  piVar2 = *(int **)(param_5 + 0x30);
  uVar12 = *(ulong *)(param_5 + 0x38);
  if ((uVar12 < 7) || (*(int *)((long)piVar2 + 3) != 0x3a64656b || *piVar2 != 0x6b636f6c)) {
    if (uVar12 - 0xd < 0x24) {
                    /* WARNING: Could not emulate address calculation at 0x0001402bd294 */
                    /* WARNING: Treating indirect jump as call */
      (*(code *)((long)*(int *)((uVar12 - 0xd) * 4 + 0x14627a900) + 0x14627a900))();
      return;
    }
    if ((long)uVar12 < 0) {
LAB_1402bd8d2:
      func_0x00014620896b();
                    /* WARNING: Does not return */
      pcVar3 = (code *)invalidInstructionException();
      (*pcVar3)();
    }
    if (uVar12 == 0) {
      local_a8 = 0;
      local_a0 = 1;
      local_98 = 0;
    }
    else {
      func_0x000140002200();
      lVar9 = func_0x0001400021c0();
      if (lVar9 == 0) goto LAB_1402bd8d2;
      func_0x00014606171b();
      local_a8 = uVar12;
      local_a0 = lVar9;
      local_98 = uVar12;
    }
  }
  else {
    uVar19 = uVar12 - 7;
    uVar7 = 0;
    local_58 = param_3;
    do {
      if (uVar19 - uVar7 < 0x10) {
        uVar11 = 0;
        if (uVar19 == uVar7) break;
        while (uVar17 = uVar7, *(char *)((long)piVar2 + uVar11 + uVar7 + 7) != ':') {
          uVar11 = uVar11 + 1;
          if (uVar19 - uVar7 == uVar11) goto LAB_1402bd988;
        }
      }
      else {
        auVar20 = func_0x00014603cea0();
        uVar11 = auVar20._8_8_;
        uVar17 = uVar7;
        if (auVar20._0_8_ != 1) break;
      }
      param_3 = local_58;
      uVar7 = uVar11 + uVar17 + 1;
      if ((uVar11 + uVar17 < uVar19) && (*(char *)((long)piVar2 + uVar11 + uVar17 + 7) == ':')) {
        uVar19 = uVar19 - uVar7;
        if (uVar19 == 0) break;
        pcVar8 = (char *)((long)piVar2 + uVar11 + uVar17 + 8);
        if (uVar19 == 1) {
          cVar1 = *pcVar8;
          if ((cVar1 == '+') || (cVar1 == '-')) break;
        }
        else {
          cVar1 = *pcVar8;
        }
        uVar7 = (ulong)(cVar1 == '+');
        if (2 < uVar19 - uVar7) {
          lVar9 = uVar11 + uVar17;
          bVar5 = 0;
          goto LAB_1402bd95b;
        }
        if ((uVar19 == uVar7) ||
           (((byte)pcVar8[uVar7] - 0x30 < 10 &&
            ((uVar19 - uVar7 == 1 || ((byte)pcVar8[uVar7 + 1] - 0x30 < 10)))))) goto LAB_1402be0a7;
        break;
      }
    } while (uVar7 <= uVar19);
LAB_1402bd988:
    func_0x000145b05430();
    local_268[0] = func_0x000145af3890();
    func_0x000145be8220();
    local_238 = 0x14627899f;
    uStack_230 = 4;
    local_228 = local_268;
    local_220 = 0x146278c18;
    func_0x000145be86b0();
    param_3 = local_58;
  }
  goto LAB_1402bda18;
LAB_1402bd95b:
  if ((uVar12 - uVar7) + -8 == lVar9) goto LAB_1402be0a7;
  if ((char)((ushort)((ushort)bVar5 * 10) >> 8) != '\0') goto LAB_1402bd988;
  uVar16 = *(byte *)((long)piVar2 + lVar9 + uVar7 + 8) - 0x30;
  bVar6 = (byte)((ushort)bVar5 * 10);
  bVar15 = (byte)uVar16;
  bVar5 = bVar6 + bVar15;
  if ((9 < uVar16) || (lVar9 = lVar9 + 1, CARRY1(bVar6,bVar15))) goto LAB_1402bd988;
  goto LAB_1402bd95b;
LAB_1402be0a7:
  func_0x000145b05430();
  local_268[0] = func_0x000145af3890();
  func_0x000145be8220();
  func_0x000145b2cda0();
  func_0x000145b2cdb0();
  local_238 = 0x1462789a3;
  uStack_230 = 6;
  local_220 = 0x146278310;
  local_218 = 0x14627899f;
  local_210 = 4;
  local_208 = local_268;
  local_200 = (long *)0x146278c18;
  local_228 = (undefined1 (*) [16])&local_3a8;
  func_0x000145be86b0();
  if (local_3a8 != 0) {
    func_0x0001400021d0();
  }
LAB_1402bda18:
  uVar12 = *(long *)(param_5 + 0x20) - 5;
  if (uVar12 < 7) {
                    /* WARNING: Could not emulate address calculation at 0x0001402bda35 */
                    /* WARNING: Treating indirect jump as call */
    (*(code *)((long)*(int *)(uVar12 * 4 + 0x14627a990) + 0x14627a990))();
    return;
  }
  local_90 = 0;
  uStack_88 = 1;
  local_80 = 0;
  local_78 = _DAT_146278828;
  uStack_70 = uRam0000000146278830;
  local_68 = 0x3f800000;
  local_58 = (char *)0x0;
  local_b0 = 1;
  local_308 = 0;
  uStack_300 = 0;
  local_318 = 0;
  uStack_310 = 0;
  local_328 = 0;
  uStack_320 = 0;
  local_338 = 0;
  uStack_330 = 0;
  local_348 = 0;
  uStack_340 = 0;
  local_2f8 = 0;
  local_b4 = 0;
  local_b8 = 0;
  local_2f0 = _DAT_146277f50;
  uStack_2e8 = uRam0000000146277f58;
  local_2e0 = _DAT_146277f60;
  uStack_2d8 = uRam0000000146277f68;
  local_2d0 = _DAT_146277f70;
  uStack_2c8 = uRam0000000146277f78;
  local_2c0 = _DAT_146277f80;
  uStack_2b8 = uRam0000000146277f88;
  local_2a0 = _DAT_146277fa0;
  uStack_298 = uRam0000000146277fa8;
  local_2b0 = _DAT_146277f90;
  uStack_2a8 = uRam0000000146277f98;
  local_280 = _DAT_146277fc0;
  uStack_278 = uRam0000000146277fc8;
  local_290 = _DAT_146277fb0;
  uStack_288 = uRam0000000146277fb8;
  local_3a8 = _DAT_146277e98;
  uStack_3a0 = uRam0000000146277ea0;
  local_398 = 0;
  local_390 = _DAT_146277eb0;
  uStack_388 = uRam0000000146277eb8;
  local_380 = 0;
  local_378 = _DAT_146277ec8;
  uStack_370 = uRam0000000146277ed0;
  local_368 = 0;
  local_360 = _DAT_146277ee0;
  uStack_358 = uRam0000000146277ee8;
  local_350 = 0;
  uVar18 = *param_4;
  func_0x00014606171b(param_4 + 1,uVar18,&local_3a8,&uStack_230,0x138);
  local_f8 = _DAT_146232f50;
  uStack_f0 = uRam0000000146232f58;
  local_e8 = 1;
  local_e4 = 0;
  local_dc = 1;
  local_d8 = 0;
  local_d0 = 0x3f800000;
  local_cc = 0;
  local_ca = 0x10000;
  local_c6 = 0;
  local_c4 = 0x10000;
  local_c0 = 0;
  local_be = 0;
  local_ba = 0;
  local_b3 = 5;
  local_49 = 1;
  pauVar13 = local_268;
  local_238 = uVar18;
  func_0x0001402f4270();
  if (*param_3 == '\x01') {
    local_3a8._4_4_ = (undefined4)(CONCAT14(local_3a8._7_1_,*(undefined4 *)(param_3 + 4)) >> 8);
    local_3a8._0_4_ = *(undefined4 *)(param_3 + 1);
    plVar10 = *(long **)(param_3 + 8);
    pauVar13 = (undefined1 (*) [16])(ulong)(byte)param_3[0x10];
    uVar14 = 1;
  }
  else {
    plVar10 = *(long **)(param_3 + 8);
    LOCK();
    lVar9 = *plVar10;
    *plVar10 = *plVar10 + 1;
    UNLOCK();
    if (*plVar10 == 0 || SCARRY8(lVar9,1) != *plVar10 < 0) {
                    /* WARNING: Does not return */
      pcVar3 = (code *)invalidInstructionException();
      (*pcVar3)();
    }
    uVar14 = 0;
  }
  local_228 = (undefined1 (*) [16])local_80;
  local_238 = local_90;
  uStack_230 = uStack_88;
  local_220 = 0;
  local_218 = 4;
  local_210 = 0;
  uVar4 = (undefined4)local_3a8;
  local_208._0_5_ = CONCAT41(uVar4,uVar14);
  local_208 = (undefined1 (*) [16])CONCAT44(local_3a8._3_4_,local_208._0_4_);
  local_1f0 = 0x41600000;
  local_1ec = 400;
  local_1ea = 1;
  local_1d8 = local_68;
  local_1e8 = local_78;
  uStack_1e0 = uStack_70;
  local_1d4 = _DAT_146260860;
  uStack_1cc = uRam0000000146260868;
  local_1c4 = _DAT_146260870;
  local_1c0 = _DAT_146232f30;
  local_49 = 0;
  local_200 = plVar10;
  local_1f8 = pauVar13;
  func_0x0001403133a0();
  if (local_a8 != 0) {
    func_0x0001400021d0();
  }
  return;
}

