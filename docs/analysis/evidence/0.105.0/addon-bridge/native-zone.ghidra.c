/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 FUN_1458eb170(undefined8 param_1,undefined8 param_2,long param_3,undefined8 param_4)

{
  byte bVar1;
  long lVar2;
  long lVar3;
  long extraout_RDX;
  long lVar4;
  long lVar5;
  undefined8 uVar6;
  undefined1 auVar7 [16];
  undefined8 local_2a8;
  undefined8 local_2a0;
  undefined8 local_298;
  long local_290;
  long local_288;
  undefined8 uStack_280;
  undefined4 local_278;
  undefined4 uStack_274;
  undefined4 uStack_270;
  undefined4 uStack_26c;
  undefined4 local_268;
  undefined4 uStack_264;
  undefined4 uStack_260;
  undefined4 uStack_25c;
  undefined4 local_258;
  undefined4 uStack_254;
  undefined4 uStack_250;
  undefined4 uStack_24c;
  undefined8 local_248;
  long lStack_240;
  undefined8 local_238;
  undefined8 uStack_230;
  undefined4 local_228;
  undefined4 uStack_224;
  undefined4 uStack_220;
  undefined4 uStack_21c;
  undefined8 local_218;
  undefined4 local_208;
  undefined4 uStack_204;
  undefined4 uStack_200;
  undefined4 uStack_1fc;
  undefined8 local_1f8;
  undefined4 local_1e8;
  undefined4 uStack_1e4;
  undefined4 uStack_1e0;
  undefined4 uStack_1dc;
  undefined8 local_1d8;
  undefined4 local_1c8;
  undefined4 uStack_1c4;
  undefined4 uStack_1c0;
  undefined4 uStack_1bc;
  undefined8 local_1b8;
  undefined4 local_1a8;
  undefined4 uStack_1a4;
  undefined4 uStack_1a0;
  undefined4 uStack_19c;
  undefined8 local_198;
  undefined4 local_188;
  undefined4 uStack_184;
  undefined4 uStack_180;
  undefined4 uStack_17c;
  undefined8 local_178;
  undefined4 local_168;
  undefined4 uStack_164;
  undefined4 uStack_160;
  undefined4 uStack_15c;
  undefined8 local_158;
  undefined8 local_148;
  undefined8 uStack_140;
  undefined8 local_138;
  undefined8 uStack_130;
  undefined8 local_128;
  undefined8 uStack_120;
  undefined8 local_118;
  undefined8 uStack_110;
  float *local_108;
  long lStack_100;
  undefined8 *local_f8;
  undefined8 uStack_f0;
  long local_e8;
  undefined8 local_e0;
  undefined4 *local_d8;
  undefined8 local_d0;
  undefined4 *local_c8;
  undefined8 local_c0;
  undefined4 *local_b8;
  undefined8 local_b0;
  undefined4 *local_a8;
  undefined8 local_a0;
  long local_98;
  undefined8 local_90;
  long local_88;
  undefined8 local_80;
  undefined4 *local_78;
  undefined8 local_70;
  float local_64;
  undefined1 *local_60;
  undefined8 local_58;
  undefined8 local_50;
  undefined8 local_48;

  local_48 = 0xfffffffffffffffe;
  local_58 = *(undefined8 *)(param_3 + 0x290);
  local_2a0 = *(undefined8 *)(param_3 + 0x298);
  local_298 = param_4;
  lVar2 = func_0x0001458753b0();
  bVar1 = *(char *)(param_3 + 0x304) - 2;
  if (bVar1 < 10) {
    lVar4 = *(long *)((ulong)bVar1 * 8 + 0x146e7b190);
  }
  else {
    lVar4 = 0x146bab7a8;
  }
  lVar5 = lVar2 * 0xf0 + 0x146ba9450;
  bVar1 = *(char *)(param_3 + 0x305) - 2;
  if (bVar1 < 7) {
    local_60 = *(undefined1 **)((ulong)bVar1 * 8 + 0x146e7b120);
  }
  else {
    local_60 = &DAT_146baa610;
  }
  local_290 = lVar2 * 0xf0 + 0x146ba9458;
  uStack_280 = 0x1400020c0;
  local_288 = local_290;
  func_0x000145b9c4d0();
  lVar2 = *(long *)(lVar5 + 0x20);
  local_50 = uStack_140;
  auVar7 = func_0x0001458da590();
  lVar3 = auVar7._8_8_;
  if (local_148 != 0) {
    func_0x0001400021d0();
  }
  if (auVar7._0_8_ == 0) {
    lVar3 = lVar2;
  }
  local_148 = 0;
  uStack_140 = 1;
  local_138 = (undefined4 *)0x0;
  if (lVar3 != 0) {
    func_0x000145bcb2d0();
  }
  func_0x0001459b9b70();
  local_158 = local_138;
  local_168 = (undefined4)local_148;
  uStack_164 = local_148._4_4_;
  uStack_160 = (undefined4)uStack_140;
  uStack_15c = uStack_140._4_4_;
  local_288 = lVar5 + 8;
  uStack_280 = 0x1400020c0;
  func_0x000145b9c4d0();
  lVar2 = *(long *)(lVar5 + 0x30);
  local_50 = uStack_140;
  auVar7 = func_0x0001458da590();
  lVar3 = auVar7._8_8_;
  if (local_148 != 0) {
    func_0x0001400021d0();
  }
  if (auVar7._0_8_ == 0) {
    lVar3 = lVar2;
  }
  local_148 = 0;
  uStack_140 = 1;
  local_138 = (undefined4 *)0x0;
  if (lVar3 != 0) {
    func_0x000145bcb2d0();
  }
  func_0x0001459b9b70();
  local_178 = local_138;
  local_188 = (undefined4)local_148;
  uStack_184 = local_148._4_4_;
  uStack_180 = (undefined4)uStack_140;
  uStack_17c = uStack_140._4_4_;
  lVar2 = func_0x0001458753b0();
  lVar2 = *(long *)(lVar2 * 0xf0 + 0x146ba94d8);
  if (*(char *)(lVar2 + 0x54) == '\0') {
    if (*(char *)(lVar2 + 0xac) == '\0') {
      if (*(char *)(lVar2 + 0x104) == '\0') {
        if (*(char *)(lVar2 + 0x15c) == '\0') {
          local_64 = _DAT_145d73d14;
          if (*(char *)(lVar2 + 0x1b4) != '\x01') goto LAB_1458eb453;
          lVar2 = lVar2 + 0x160;
        }
        else {
          lVar2 = lVar2 + 0x108;
        }
      }
      else {
        lVar2 = lVar2 + 0xb0;
      }
    }
    else {
      lVar2 = lVar2 + 0x58;
    }
  }
  local_64 = *(float *)(lVar2 + 0x40) * _DAT_145dbf580;
LAB_1458eb453:
  local_2a8 = 5;
  uStack_280 = 0x1400020c0;
  local_288 = lVar4 + 0x10;
  func_0x000145b9c4d0();
  lVar2 = *(long *)(lVar4 + 0x28);
  local_58 = uStack_140;
  auVar7 = func_0x0001458da590();
  lVar3 = auVar7._8_8_;
  if (local_148 != 0) {
    func_0x0001400021d0();
  }
  if (auVar7._0_8_ == 0) {
    lVar3 = lVar2;
  }
  local_148 = 0;
  uStack_140 = 1;
  local_138 = (undefined4 *)0x0;
  if (lVar3 != 0) {
    func_0x000145bcb2d0();
  }
  func_0x0001459b9b70();
  local_198 = local_138;
  local_1a8 = (undefined4)local_148;
  uStack_1a4 = local_148._4_4_;
  uStack_1a0 = (undefined4)uStack_140;
  uStack_19c = uStack_140._4_4_;
  local_148 = 0;
  uStack_140 = 1;
  local_138 = (undefined4 *)0x0;
  if (*(long *)(local_60 + 8) != 0) {
    func_0x000145bcb2d0();
  }
  func_0x0001459b9b70();
  local_1b8 = local_138;
  local_1c8 = (undefined4)local_148;
  uStack_1c4 = local_148._4_4_;
  uStack_1c0 = (undefined4)uStack_140;
  uStack_1bc = uStack_140._4_4_;
  func_0x000145873f20();
  local_148 = 0;
  uStack_140 = 1;
  local_138 = (undefined4 *)0x0;
  if (extraout_RDX != 0) {
    func_0x000145bcb2d0();
  }
  func_0x0001459b9b70();
  local_1d8 = local_138;
  local_1e8 = (undefined4)local_148;
  uStack_1e4 = local_148._4_4_;
  uStack_1e0 = (undefined4)uStack_140;
  uStack_1dc = uStack_140._4_4_;
  local_148 = 0;
  uStack_140 = 1;
  local_138 = (undefined4 *)0x0;
  if (*(long *)(param_3 + 0x1a8) != 0) {
    func_0x000145bcb2d0();
  }
  func_0x0001459b9b70();
  local_1f8 = local_138;
  local_208 = (undefined4)local_148;
  uStack_204 = local_148._4_4_;
  uStack_200 = (undefined4)uStack_140;
  uStack_1fc = uStack_140._4_4_;
  func_0x000145893870();
  local_238 = local_f8;
  uStack_230 = uStack_f0;
  local_248 = local_108;
  lStack_240 = lStack_100;
  local_258 = (undefined4)local_118;
  uStack_254 = local_118._4_4_;
  uStack_250 = (undefined4)uStack_110;
  uStack_24c = uStack_110._4_4_;
  local_268 = (undefined4)local_128;
  uStack_264 = local_128._4_4_;
  uStack_260 = (undefined4)uStack_120;
  uStack_25c = uStack_120._4_4_;
  local_278 = (undefined4)local_138;
  uStack_274 = local_138._4_4_;
  uStack_270 = (undefined4)uStack_130;
  uStack_26c = uStack_130._4_4_;
  local_288 = local_148;
  uStack_280 = uStack_140;
  func_0x0001458b82d0();
  local_118 = lVar5 + 0xe0;
  local_98 = param_3 + 0x306;
  local_88 = lVar5 + 0xc0;
  local_218 = local_138;
  local_228 = (undefined4)local_148;
  uStack_224 = local_148._4_4_;
  uStack_220 = (undefined4)uStack_140;
  uStack_21c = uStack_140._4_4_;
  local_148 = local_290;
  uStack_140 = 0x1400020c0;
  local_138 = &local_168;
  uStack_130 = 0x1400020e0;
  local_128 = &local_188;
  uStack_120 = 0x1400020e0;
  uStack_110 = 0x145bad280;
  local_108 = &local_64;
  lStack_100 = 0x145bad280;
  local_f8 = &local_2a8;
  uStack_f0 = 0x145baee70;
  local_e0 = 0x1400020c0;
  local_d8 = &local_1a8;
  local_d0 = 0x1400020e0;
  local_c8 = &local_1c8;
  local_c0 = 0x1400020e0;
  local_b8 = &local_1e8;
  local_b0 = 0x1400020e0;
  local_a8 = &local_208;
  local_a0 = 0x1400020e0;
  local_90 = 0x145baa8b0;
  local_80 = 0x145badf80;
  local_78 = &local_228;
  local_70 = 0x1400020e0;
  uVar6 = local_298;
  local_e8 = lVar4 + 0x10;
  func_0x000145b9c4d0(local_98,local_298,0x146e78b18,local_298,&local_148);
  if (CONCAT44(uStack_224,local_228) != 0) {
    func_0x0001400021d0();
  }
  if (local_288 != 0) {
    func_0x0001400021d0();
  }
  if (CONCAT44(uStack_26c,uStack_270) != 0) {
    func_0x0001400021d0();
  }
  if (CONCAT44(uStack_254,local_258) != 0) {
    func_0x0001400021d0();
  }
  if (lStack_240 != 0) {
    func_0x0001400021d0();
  }
  if (CONCAT44(uStack_204,local_208) != 0) {
    func_0x0001400021d0();
  }
  if (CONCAT44(uStack_1e4,local_1e8) != 0) {
    func_0x0001400021d0();
  }
  if (CONCAT44(uStack_1c4,local_1c8) != 0) {
    func_0x0001400021d0();
  }
  if (CONCAT44(uStack_1a4,local_1a8) != 0) {
    func_0x0001400021d0();
  }
  if (CONCAT44(uStack_184,local_188) != 0) {
    func_0x0001400021d0();
  }
  if (CONCAT44(uStack_164,local_168) != 0) {
    func_0x0001400021d0();
  }
  return uVar6;
}
