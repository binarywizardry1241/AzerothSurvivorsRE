undefined8 * entry(undefined8 param_1,undefined8 param_2,long param_3,undefined8 *param_4)

{
  char cVar1;
  byte bVar2;
  long lVar3;
  long extraout_RDX;
  long lVar4;
  long *plVar5;
  long lVar6;
  undefined1 *puVar7;
  undefined1 auVar8 [16];
  undefined8 local_260;
  undefined8 local_258;
  long local_250;
  undefined4 local_248;
  undefined4 uStack_244;
  undefined4 uStack_240;
  undefined4 uStack_23c;
  undefined8 local_238;
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
  undefined8 local_1d0;
  undefined8 uStack_1c8;
  long local_1c0;
  undefined8 local_1b8;
  long local_1b0;
  undefined8 local_1a8;
  long local_1a0;
  undefined8 local_198;
  long local_190;
  undefined8 local_188;
  long local_180;
  undefined8 local_178;
  long local_170;
  undefined8 local_168;
  undefined8 *local_160;
  undefined8 local_158;
  undefined8 *local_150;
  undefined8 local_148;
  long local_140;
  undefined8 local_138;
  long local_130;
  undefined8 local_128;
  long local_120;
  undefined8 local_118;
  undefined1 *local_110;
  undefined8 local_108;
  undefined4 *local_100;
  undefined8 local_f8;
  long local_f0;
  undefined8 local_e8;
  undefined4 *local_e0;
  undefined8 local_d8;
  undefined4 *local_d0;
  undefined8 local_c8;
  undefined4 *local_c0;
  undefined8 local_b8;
  long local_b0;
  undefined8 local_a8;
  long *local_a0;
  undefined8 local_98;
  undefined8 local_90;
  undefined8 local_88;
  undefined8 *local_80;
  long local_78;
  undefined8 uStack_70;
  undefined8 local_68;
  undefined8 local_58;
  undefined1 local_49;
  undefined8 local_48;

  local_48 = 0xfffffffffffffffe;
  if (*(char *)(param_3 + 0xa73) == '\x04') {
    if (*(char *)(param_3 + 0xa63) == '\0') {
      local_90 = 0x146e788a1;
      local_88 = 6;
    }
    else {
      local_90 = 0x146e788a7;
      local_88 = 4;
    }
  }
  else {
    if (*(char *)(param_3 + 0xa73) != '\x05') {
      *param_4 = 0;
      param_4[1] = 1;
      param_4[2] = 0;
      return param_4;
    }
    local_90 = 0x146e788ab;
    local_88 = 7;
  }
  local_80 = param_4;
  lVar3 = func_0x0001458753b0(param_3,param_2,*(undefined8 *)(param_3 + 0x298),
                              *(undefined8 *)(param_3 + 0x290));
  bVar2 = *(char *)(param_3 + 0x304) - 2;
  if (bVar2 < 10) {
    lVar6 = *(long *)((ulong)bVar2 * 8 + 0x146e7b190);
    cVar1 = *(char *)(param_3 + 0x305);
  }
  else {
    lVar6 = 0x146bab7a8;
    cVar1 = *(char *)(param_3 + 0x305);
  }
  if ((byte)(cVar1 - 2U) < 7) {
    puVar7 = *(undefined1 **)((ulong)(byte)(cVar1 - 2U) * 8 + 0x146e7b120);
  }
  else {
    puVar7 = &DAT_146baa610;
  }
  local_258 = func_0x000145bc97db((int)*(undefined8 *)(param_3 + 0x6c0));
  local_260 = func_0x000145bc97db((int)*(undefined8 *)(param_3 + 0x6c8));
  local_49 = *(undefined1 *)(param_3 + 0xa64);
  local_1d0 = (undefined8 *)0x0;
  uStack_1c8 = 1;
  local_1c0 = 0;
  if (*(long *)(param_3 + 0x1a8) != 0) {
    func_0x000145bcb2d0();
  }
  func_0x0001459b9b70();
  local_1d8 = local_1c0;
  local_1e8 = (undefined4)local_1d0;
  uStack_1e4 = local_1d0._4_4_;
  uStack_1e0 = (undefined4)uStack_1c8;
  uStack_1dc = uStack_1c8._4_4_;
  local_250 = lVar6 + 0x10;
  uStack_70 = 0x1400020c0;
  local_78 = local_250;
  func_0x000145b9c4d0();
  lVar6 = *(long *)(lVar6 + 0x28);
  local_58 = uStack_1c8;
  auVar8 = func_0x0001458da590();
  lVar4 = auVar8._8_8_;
  if (local_1d0 != (undefined8 *)0x0) {
    func_0x0001400021d0();
  }
  if (auVar8._0_8_ == 0) {
    lVar4 = lVar6;
  }
  local_1d0 = (undefined8 *)0x0;
  uStack_1c8 = 1;
  local_1c0 = 0;
  if (lVar4 != 0) {
    func_0x000145bcb2d0();
  }
  func_0x0001459b9b70();
  local_1f8 = local_1c0;
  local_208 = (undefined4)local_1d0;
  uStack_204 = local_1d0._4_4_;
  uStack_200 = (undefined4)uStack_1c8;
  uStack_1fc = uStack_1c8._4_4_;
  local_1d0 = (undefined8 *)0x0;
  uStack_1c8 = 1;
  local_1c0 = 0;
  if (*(long *)(puVar7 + 8) != 0) {
    func_0x000145bcb2d0();
  }
  func_0x0001459b9b70();
  local_218 = local_1c0;
  local_228 = (undefined4)local_1d0;
  uStack_224 = local_1d0._4_4_;
  uStack_220 = (undefined4)uStack_1c8;
  uStack_21c = uStack_1c8._4_4_;
  func_0x000145873f20();
  local_1d0 = (undefined8 *)0x0;
  uStack_1c8 = 1;
  local_1c0 = 0;
  if (extraout_RDX != 0) {
    func_0x000145bcb2d0();
  }
  func_0x0001459b9b70();
  local_238 = local_1c0;
  local_248 = (undefined4)local_1d0;
  uStack_244 = local_1d0._4_4_;
  uStack_240 = (undefined4)uStack_1c8;
  uStack_23c = uStack_1c8._4_4_;
  lVar6 = lVar3 * 0xf0 + 0x146ba9458;
  uStack_70 = 0x1400020c0;
  plVar5 = &local_78;
  local_78 = lVar6;
  func_0x000145b9c4d0();
  lVar3 = *(long *)(lVar3 * 0xf0 + 0x146ba9470);
  local_58 = uStack_1c8;
  auVar8 = func_0x0001458da590();
  lVar4 = auVar8._8_8_;
  if (local_1d0 != (undefined8 *)0x0) {
    func_0x0001400021d0();
  }
  if (auVar8._0_8_ == 0) {
    lVar4 = lVar3;
  }
  local_1d0 = (undefined8 *)0x0;
  uStack_1c8 = 1;
  local_1c0 = 0;
  if (lVar4 != 0) {
    func_0x000145bcb2d0();
  }
  func_0x0001459b9b70();
  uStack_70 = uStack_1c8;
  local_1b0 = param_3 + 0x4d8;
  local_68 = local_1c0;
  local_1a0 = param_3 + 0x70c;
  uStack_1c8 = 0x1400020c0;
  local_1b8 = 0x145bad280;
  local_190 = param_3 + 0x710;
  local_1a8 = 0x145badf80;
  local_180 = param_3 + 0x714;
  local_198 = 0x145badf80;
  local_170 = param_3 + 0x718;
  local_188 = 0x145badf80;
  local_178 = 0x145badf80;
  local_168 = 0x145badf80;
  local_160 = &local_258;
  local_158 = 0x145badb10;
  local_150 = &local_260;
  local_148 = 0x145badb10;
  local_140 = param_3 + 0x71c;
  local_130 = param_3 + 0x720;
  local_138 = 0x145badf80;
  local_120 = param_3 + 0x724;
  local_128 = 0x145badf80;
  local_118 = 0x145badf80;
  local_110 = &local_49;
  local_108 = 0x145baa8b0;
  local_100 = &local_1e8;
  local_f8 = 0x1400020e0;
  local_f0 = local_250;
  local_e8 = 0x1400020c0;
  local_d8 = 0x1400020e0;
  local_d0 = &local_228;
  local_c8 = 0x1400020e0;
  local_c0 = &local_248;
  local_b8 = 0x1400020e0;
  local_a8 = 0x1400020c0;
  local_98 = 0x1400020e0;
  local_78 = (long)local_1d0;
  local_1d0 = &local_90;
  local_1c0 = param_3 + 0x9ec;
  local_e0 = &local_208;
  local_b0 = lVar6;
  local_a0 = plVar5;
  func_0x000145b9c4d0();
  if (local_78 != 0) {
    func_0x0001400021d0();
  }
  if (CONCAT44(uStack_244,local_248) != 0) {
    func_0x0001400021d0();
  }
  if (CONCAT44(uStack_224,local_228) != 0) {
    func_0x0001400021d0();
  }
  if (CONCAT44(uStack_204,local_208) != 0) {
    func_0x0001400021d0();
  }
  if (CONCAT44(uStack_1e4,local_1e8) != 0) {
    func_0x0001400021d0();
  }
  return local_80;
}
