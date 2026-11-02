
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,char *param_3,undefined8 *param_4,long param_5)

{
  int *piVar1;
  long lVar2;
  undefined8 uVar3;
  code *pcVar4;
  undefined1 *puVar5;
  long lVar6;
  ulong uVar7;
  undefined1 local_3a8 [48];
  undefined1 local_378 [16];
  undefined8 local_368;
  undefined8 local_360;
  undefined8 uStack_358;
  undefined8 local_350;
  undefined8 local_348;
  undefined8 uStack_340;
  undefined8 local_338;
  undefined8 local_330;
  undefined8 uStack_328;
  undefined8 local_320;
  undefined8 local_318;
  undefined8 uStack_310;
  undefined8 local_308;
  undefined8 uStack_300;
  undefined8 local_2f8;
  undefined8 uStack_2f0;
  undefined8 local_2e8;
  undefined8 uStack_2e0;
  undefined8 local_2d8;
  undefined8 uStack_2d0;
  undefined8 local_2c8;
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
  undefined8 local_270;
  undefined8 uStack_268;
  undefined8 local_260;
  undefined8 uStack_258;
  undefined8 local_250;
  undefined8 uStack_248;
  undefined8 local_238;
  undefined8 uStack_230;
  undefined1 *local_228;
  undefined8 local_220;
  undefined8 local_218;
  undefined8 local_210;
  undefined1 local_208;
  undefined4 local_207;
  undefined3 uStack_203;
  long *local_200;
  undefined1 *local_1f8;
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
  undefined8 local_a8;
  undefined8 local_a0;
  ulong local_98;
  long local_90;
  ulong local_88;
  undefined8 local_80;
  undefined8 uStack_78;
  undefined8 local_70;
  undefined8 local_68;
  undefined8 uStack_60;
  undefined4 local_58;
  undefined1 local_49;
  undefined8 local_48;

  local_48 = 0xfffffffffffffffe;
  piVar1 = *(int **)(param_5 + 0x20);
  uVar7 = *(ulong *)(param_5 + 0x28);
  if ((uVar7 < 7) || (*(int *)((long)piVar1 + 3) != 0x3a64656b || *piVar1 != 0x6b636f6c)) {
    if (uVar7 - 0xd < 0x24) {
                    /* WARNING: Could not emulate address calculation at 0x00014020e997 */
                    /* WARNING: Treating indirect jump as call */
      (*(code *)((long)*(int *)((uVar7 - 0xd) * 4 + 0x145f14444) + 0x145f14444))();
      return;
    }
    if ((long)uVar7 < 0) {
LAB_14020f586:
      func_0x000145eb6fcb();
                    /* WARNING: Does not return */
      pcVar4 = (code *)invalidInstructionException();
      (*pcVar4)();
    }
    if (uVar7 == 0) {
      lVar6 = 1;
      uVar7 = 0;
    }
    else {
      func_0x000140002200();
      lVar6 = func_0x0001400021c0();
      if (lVar6 == 0) goto LAB_14020f586;
      func_0x000145d145fb();
    }
    lVar2 = *(long *)(param_5 + 0x10);
    local_90 = lVar6;
    local_98 = uVar7;
    local_88 = uVar7;
  }
  else {
    func_0x000145809710(param_4,param_3,uVar7 - 7,(long)piVar1 + 7);
    local_378 = func_0x000145809010();
    func_0x0001458dfee0();
    local_238 = 0x145f10e58;
    uStack_230 = 4;
    local_228 = local_378;
    local_220 = 0x145f10e38;
    func_0x0001458e0370();
    lVar2 = *(long *)(param_5 + 0x10);
  }
  if (lVar2 - 5U < 7) {
                    /* WARNING: Could not emulate address calculation at 0x00014020eee7 */
                    /* WARNING: Treating indirect jump as call */
    (*(code *)((long)*(int *)((lVar2 - 5U) * 4 + 0x145f144d4) + 0x145f144d4))();
    return;
  }
  local_80 = 0;
  uStack_78 = 1;
  local_70 = 0;
  local_58 = 0x3f800000;
  local_a0 = 0;
  local_a8 = 1;
  local_2d8 = 0;
  uStack_2d0 = 0;
  local_2e8 = 0;
  uStack_2e0 = 0;
  local_2f8 = 0;
  uStack_2f0 = 0;
  local_308 = 0;
  uStack_300 = 0;
  local_318 = 0;
  uStack_310 = 0;
  local_2c8 = 0;
  local_b4 = 0;
  local_b8 = 0;
  local_368 = 0;
  local_350 = 0;
  local_338 = 0;
  local_320 = 0;
  uVar3 = *param_4;
  local_378._0_8_ = _DAT_145f10948;
  local_378._8_8_ = uRam0000000145f10950;
  local_360 = _DAT_145f10960;
  uStack_358 = uRam0000000145f10968;
  local_348 = _DAT_145f10978;
  uStack_340 = uRam0000000145f10980;
  local_330 = _DAT_145f10990;
  uStack_328 = uRam0000000145f10998;
  local_2c0 = _DAT_145f10a00;
  uStack_2b8 = uRam0000000145f10a08;
  local_2b0 = _DAT_145f10a10;
  uStack_2a8 = uRam0000000145f10a18;
  local_2a0 = _DAT_145f10a20;
  uStack_298 = uRam0000000145f10a28;
  local_290 = _DAT_145f10a30;
  uStack_288 = uRam0000000145f10a38;
  local_280 = _DAT_145f10a40;
  uStack_278 = uRam0000000145f10a48;
  local_270 = _DAT_145f10a50;
  uStack_268 = uRam0000000145f10a58;
  local_260 = _DAT_145f10a60;
  uStack_258 = uRam0000000145f10a68;
  local_250 = _DAT_145f10a70;
  uStack_248 = uRam0000000145f10a78;
  local_68 = _DAT_145f104c8;
  uStack_60 = uRam0000000145f104d0;
  func_0x000145d145fb(param_4 + 1);
  local_f8 = _DAT_145edff00;
  uStack_f0 = uRam0000000145edff08;
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
  puVar5 = local_3a8;
  local_238 = uVar3;
  func_0x0001402b57b0();
  if (*param_3 == '\x01') {
    local_378._4_4_ = (undefined4)(CONCAT14(local_378[7],*(undefined4 *)(param_3 + 4)) >> 8);
    local_378._0_4_ = *(undefined4 *)(param_3 + 1);
    local_200 = *(long **)(param_3 + 8);
    puVar5 = (undefined1 *)(ulong)(byte)param_3[0x10];
    local_208 = 1;
  }
  else {
    local_200 = *(long **)(param_3 + 8);
    LOCK();
    lVar6 = *local_200;
    *local_200 = *local_200 + 1;
    UNLOCK();
    if (*local_200 == 0 || SCARRY8(lVar6,1) != *local_200 < 0) {
                    /* WARNING: Does not return */
      pcVar4 = (code *)invalidInstructionException();
      (*pcVar4)();
    }
    local_208 = 0;
  }
  local_228 = (undefined1 *)local_70;
  local_238 = local_80;
  uStack_230 = uStack_78;
  local_220 = 0;
  local_218 = 4;
  local_210 = 0;
  uStack_203 = SUB83(local_378._0_8_,4);
  local_1f0 = 0x41600000;
  local_1ec = 400;
  local_1ea = 1;
  local_1d8 = local_58;
  local_1e8 = local_68;
  uStack_1e0 = uStack_60;
  local_1d4 = _DAT_145f152d0;
  uStack_1cc = uRam0000000145f152d8;
  local_1c4 = _DAT_145f152e0;
  local_1c0 = _DAT_145edff70;
  local_49 = 0;
  local_207 = local_378._0_4_;
  local_1f8 = puVar5;
  func_0x0001402d2c30();
  if (local_98 != 0) {
    func_0x0001400021d0();
  }
  return;
}
