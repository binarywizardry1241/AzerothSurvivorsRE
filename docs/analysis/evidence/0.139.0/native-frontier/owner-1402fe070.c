/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,undefined8 param_4)

{
  code *pcVar1;
  long lVar2;
  undefined4 *puVar3;
  undefined8 local_288;
  undefined8 uStack_280;
  undefined8 local_278;
  undefined8 uStack_270;
  undefined8 local_268;
  undefined8 uStack_260;
  undefined8 local_258;
  undefined8 uStack_250;
  undefined8 local_248;
  undefined8 uStack_240;
  undefined8 local_238;
  undefined8 uStack_230;
  undefined8 local_228;
  undefined8 uStack_220;
  undefined8 local_218;
  undefined8 uStack_210;
  undefined8 local_208;
  undefined8 uStack_200;
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
  undefined4 local_c0;
  undefined1 local_bc;
  undefined4 local_b8;
  undefined1 local_b4;
  undefined4 local_a8;
  undefined4 uStack_a4;
  undefined4 uStack_a0;
  undefined4 uStack_9c;
  undefined4 local_98;
  undefined4 uStack_94;
  undefined4 uStack_90;
  undefined4 uStack_8c;
  undefined4 local_88;
  undefined4 uStack_84;
  undefined4 uStack_80;
  undefined4 uStack_7c;
  undefined4 local_78;
  undefined4 uStack_74;
  undefined4 uStack_70;
  undefined4 uStack_6c;
  undefined8 local_68;
  undefined8 uStack_60;
  undefined8 local_58;
  undefined8 uStack_50;
  undefined8 local_48;
  undefined8 uStack_40;
  undefined8 *local_30;
  undefined8 local_20;
  undefined8 uStack_18;
  undefined8 uStack_10;

  local_20 = 0xfffffffffffffffe;
  local_218 = 0x146543640;
  uStack_210 = 0x13;
  local_208 = (undefined8 *)0x1402fe5a0;
  uStack_18 = param_1;
  uStack_10 = param_2;
  func_0x00014013fd20(param_1,param_4,&local_218,param_4,0x146543658);
  func_0x000140002200();
  local_30 = (undefined8 *)func_0x0001400021c0();
  if (local_30 == (undefined8 *)0x0) {
    func_0x0001464ce061();
                    /* WARNING: Does not return */
    pcVar1 = (code *)invalidInstructionException();
    (*pcVar1)();
  }
  local_218 = 0xffffffffffffffff;
  local_b8 = 0;
  local_b4 = 0;
  func_0x000140002200();
  lVar2 = func_0x0001400021c0();
  if (lVar2 == 0) {
    func_0x0001464ce061();
  }
  else {
    func_0x000146325eeb(lVar2);
    func_0x000145b8c840();
    local_218 = 2;
    local_c0 = 0;
    local_bc = 0;
    func_0x000140002200();
    lVar2 = func_0x0001400021c0();
    if (lVar2 == 0) {
      func_0x0001464ce061();
    }
    else {
      func_0x000146325eeb(lVar2);
      func_0x000145b8c840();
      func_0x000140002200();
      puVar3 = (undefined4 *)func_0x0001400021c0();
      if (puVar3 != (undefined4 *)0x0) {
        *puVar3 = 0;
        *(undefined1 *)(puVar3 + 1) = 0;
        *(undefined1 *)(puVar3 + 2) = 0;
        func_0x000145b8c840();
        local_30[0xc] = local_228;
        local_30[0xd] = uStack_220;
        local_30[10] = local_238;
        local_30[0xb] = uStack_230;
        local_30[8] = local_248;
        local_30[9] = uStack_240;
        local_30[6] = local_258;
        local_30[7] = uStack_250;
        local_30[4] = local_268;
        local_30[5] = uStack_260;
        local_30[2] = local_278;
        local_30[3] = uStack_270;
        *local_30 = local_288;
        local_30[1] = uStack_280;
        local_30[0xe] = CONCAT44(uStack_a4,local_a8);
        local_30[0xf] = CONCAT44(uStack_9c,uStack_a0);
        local_30[0x10] = CONCAT44(uStack_94,local_98);
        local_30[0x11] = CONCAT44(uStack_8c,uStack_90);
        local_30[0x12] = CONCAT44(uStack_84,local_88);
        local_30[0x13] = CONCAT44(uStack_7c,uStack_80);
        local_30[0x14] = CONCAT44(uStack_74,local_78);
        local_30[0x15] = CONCAT44(uStack_6c,uStack_70);
        local_30[0x16] = local_68;
        local_30[0x17] = uStack_60;
        local_30[0x18] = local_58;
        local_30[0x19] = uStack_50;
        local_30[0x1a] = local_48;
        local_30[0x1b] = uStack_40;
        local_30[0x1c] = local_218;
        local_30[0x1d] = uStack_210;
        *(undefined4 *)(local_30 + 0x1e) = (undefined4)local_208;
        *(undefined4 *)((long)local_30 + 0xf4) = local_208._4_4_;
        *(undefined4 *)(local_30 + 0x1f) = (undefined4)uStack_200;
        *(undefined4 *)((long)local_30 + 0xfc) = uStack_200._4_4_;
        *(undefined4 *)(local_30 + 0x20) = (undefined4)local_1f8;
        *(undefined4 *)((long)local_30 + 0x104) = local_1f8._4_4_;
        *(undefined4 *)(local_30 + 0x21) = (undefined4)uStack_1f0;
        *(undefined4 *)((long)local_30 + 0x10c) = uStack_1f0._4_4_;
        *(undefined4 *)(local_30 + 0x22) = (undefined4)local_1e8;
        *(undefined4 *)((long)local_30 + 0x114) = local_1e8._4_4_;
        *(undefined4 *)(local_30 + 0x23) = (undefined4)uStack_1e0;
        *(undefined4 *)((long)local_30 + 0x11c) = uStack_1e0._4_4_;
        local_30[0x24] = local_1d8;
        local_30[0x25] = uStack_1d0;
        local_30[0x26] = local_1c8;
        local_30[0x27] = uStack_1c0;
        local_30[0x28] = local_1b8;
        local_30[0x29] = uStack_1b0;
        uStack_210 = 3;
        local_208 = local_30;
        uStack_200 = 3;
        local_1f8 = 0;
        uStack_1f0 = 8;
        local_1e8 = 0;
        uStack_1e0 = 0;
        local_218 = 0xffffffffffffffff;
        func_0x000145bfc5f0();
        local_48 = local_1b8;
        uStack_40 = uStack_1b0;
        local_58 = local_1c8;
        uStack_50 = uStack_1c0;
        local_68 = local_1d8;
        uStack_60 = uStack_1d0;
        local_78 = (undefined4)local_1e8;
        uStack_74 = local_1e8._4_4_;
        uStack_70 = (undefined4)uStack_1e0;
        uStack_6c = uStack_1e0._4_4_;
        local_88 = (undefined4)local_1f8;
        uStack_84 = local_1f8._4_4_;
        uStack_80 = (undefined4)uStack_1f0;
        uStack_7c = uStack_1f0._4_4_;
        local_98 = (undefined4)local_208;
        uStack_94 = local_208._4_4_;
        uStack_90 = (undefined4)uStack_200;
        uStack_8c = uStack_200._4_4_;
        local_a8 = (undefined4)local_218;
        uStack_a4 = local_218._4_4_;
        uStack_a0 = (undefined4)uStack_210;
        uStack_9c = uStack_210._4_4_;
        func_0x0001400d5730();
        func_0x000140241690();
        local_1b8 = local_48;
        uStack_1b0 = uStack_40;
        local_1c8 = local_58;
        uStack_1c0 = uStack_50;
        local_1d8 = local_68;
        uStack_1d0 = uStack_60;
        local_1e8 = CONCAT44(uStack_74,local_78);
        uStack_1e0 = CONCAT44(uStack_6c,uStack_70);
        local_1f8 = CONCAT44(uStack_84,local_88);
        uStack_1f0 = CONCAT44(uStack_7c,uStack_80);
        local_208 = (undefined8 *)CONCAT44(uStack_94,local_98);
        uStack_200 = CONCAT44(uStack_8c,uStack_90);
        local_218 = CONCAT44(uStack_a4,local_a8);
        uStack_210 = CONCAT44(uStack_9c,uStack_a0);
        func_0x0001401417d0();
        return;
      }
      func_0x0001464ce061();
    }
  }
                    /* WARNING: Does not return */
  pcVar1 = (code *)invalidInstructionException();
  (*pcVar1)();
}
