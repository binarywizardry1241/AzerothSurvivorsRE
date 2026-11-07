
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(void)

{
  char cVar1;
  code *pcVar2;
  long lVar3;
  long in_RCX;
  undefined8 uVar4;
  undefined8 uVar5;
  long lVar6;
  undefined8 uVar7;
  undefined4 *puVar8;
  undefined4 *puVar9;
  float fVar10;
  float fVar11;
  undefined4 in_XMM6_Da;
  float fVar12;
  undefined4 in_XMM7_Da;
  undefined1 auVar13 [16];
  long local_188;
  undefined8 local_178;
  undefined1 local_170 [16];
  undefined8 local_160;
  undefined8 uStack_158;
  undefined4 *local_150;
  undefined8 local_148;
  undefined4 local_140;
  undefined4 uStack_13c;
  undefined4 *local_128;
  undefined4 *local_120;
  undefined4 *local_118;
  undefined8 local_110;
  undefined8 local_108;
  undefined8 local_100;
  long local_f8;
  undefined8 local_f0;
  undefined8 local_e8;
  undefined8 local_e0;
  long local_d8;
  undefined8 local_d0;
  undefined8 local_c8;
  undefined8 local_c0;
  long local_b8;
  undefined8 local_b0;
  undefined4 local_a8;
  undefined4 uStack_a4;
  undefined4 uStack_a0;
  undefined4 uStack_9c;
  undefined8 local_98;
  long local_90;
  long local_80;
  undefined4 *local_78;
  undefined8 local_70;
  undefined4 local_68;
  undefined4 local_58;

  local_70 = 0xfffffffffffffffe;
  if (*(char *)(in_RCX + 0x9a8) != '\x01') {
    return;
  }
  cVar1 = *(char *)(in_RCX + 0x9b9);
  if (cVar1 == '\x05') {
    uVar7 = 0x1469f7f48;
    uVar5 = 0x1b;
    uVar4 = 0x1b;
  }
  else if (*(char *)(in_RCX + 0x9a9) == '\0') {
    uVar7 = 0x1469f7f63;
    uVar5 = 0x10;
    uVar4 = 0x10;
  }
  else {
    uVar7 = 0x1469f7f73;
    uVar5 = 0x11;
    uVar4 = 0x11;
  }
  local_68 = in_XMM6_Da;
  local_58 = in_XMM7_Da;
  local_170 = func_0x000145457cb0(uVar7,in_RCX,uVar4,uVar7);
  auVar13._8_8_ = uVar5;
  auVar13._0_8_ = uVar7;
  if (local_170._0_8_ == 0) {
    local_170 = auVar13;
  }
  func_0x000145457cb0();
  fVar11 = *(float *)(in_RCX + 0x934) / _DAT_1459158a4;
  fVar12 = 0.0;
  local_140 = (int)(long)fVar11;
  if (fVar11 < 0.0) {
    local_140 = 0;
  }
  if (_DAT_14590752c < fVar11) {
    local_140 = 0xffffffff;
  }
  fVar11 = _DAT_14590752c;
  fVar10 = (float)func_0x00014577325f();
  local_a8 = (int)(long)fVar10;
  if (fVar10 < fVar12) {
    local_a8 = 0;
  }
  if (fVar11 < fVar10) {
    local_a8 = 0xffffffff;
  }
  local_128 = &local_140;
  local_120 = (undefined4 *)0x14573a450;
  local_110 = 0x14573a450;
  local_118 = &local_a8;
  func_0x000145728390();
  local_a8 = (undefined4)local_160;
  uStack_a4 = local_160._4_4_;
  uStack_a0 = (undefined4)uStack_158;
  uStack_9c = uStack_158._4_4_;
  local_98 = local_150;
  local_f8 = in_RCX + 0x410;
  local_d8 = in_RCX + 0x674;
  local_b8 = in_RCX + 0x680;
  local_128 = (undefined4 *)0x1469f6ae0;
  local_120 = (undefined4 *)0x4;
  local_110 = 0x1469f6c50;
  local_108 = 0x1469f6ae4;
  local_100 = 5;
  local_f0 = 0x1469f6450;
  local_e8 = 0x1469f6b0b;
  local_e0 = 5;
  local_d0 = 0x1469f6450;
  local_c8 = 0x1469f6b92;
  local_c0 = 6;
  local_b0 = 0x1469f6450;
  local_118 = &local_a8;
  func_0x000145458060();
  local_160 = local_170;
  uStack_158 = 0x1400020c0;
  local_148 = 0x1400020e0;
  local_150 = &local_140;
  func_0x000145728390();
  if (CONCAT44(uStack_13c,local_140) != 0) {
    func_0x0001400021d0();
  }
  if (CONCAT44(uStack_a4,local_a8) != 0) {
    func_0x0001400021d0();
  }
  local_90 = local_188;
  func_0x000140002200(local_178);
  local_78 = (undefined4 *)func_0x0001400021c0();
  if (local_78 == (undefined4 *)0x0) {
    func_0x000145903781();
    goto LAB_1454f0c5e;
  }
  auVar13 = func_0x000145457cb0();
  lVar6 = auVar13._8_8_;
  if (auVar13._0_8_ == 0) {
    lVar6 = 9;
  }
  if (lVar6 < 0) {
LAB_1454f094d:
    func_0x00014590379b();
    goto LAB_1454f0c5e;
  }
  if (lVar6 == 0) {
    lVar3 = 1;
  }
  else {
    func_0x000140002200();
    lVar3 = func_0x0001400021c0();
    if (lVar3 == 0) goto LAB_1454f094d;
    func_0x0001457731ed();
  }
  *local_78 = 0x14;
  *(undefined1 *)(local_78 + 1) = 0;
  *(long *)(local_78 + 2) = lVar6;
  *(long *)(local_78 + 4) = lVar3;
  *(long *)(local_78 + 6) = lVar6;
  local_128 = (undefined4 *)0x1;
  local_120 = local_78;
  local_118 = (undefined4 *)0x1;
  if (cVar1 == '\x05') {
    auVar13 = func_0x000145457cb0();
    puVar9 = auVar13._8_8_;
    if (auVar13._0_8_ == 0) {
      puVar9 = (undefined4 *)0x17;
    }
    if ((long)puVar9 < 0) {
LAB_1454f0a02:
      func_0x00014590379b();
      goto LAB_1454f0c5e;
    }
    local_78 = puVar9;
    if (puVar9 == (undefined4 *)0x0) {
      local_80 = 1;
      if (local_118 == local_128) {
LAB_1454f0a70:
        puVar9 = local_118;
        func_0x000145774710();
        local_118 = puVar9;
      }
    }
    else {
      func_0x000140002200();
      lVar6 = func_0x0001400021c0();
      if (lVar6 == 0) goto LAB_1454f0a02;
      local_80 = lVar6;
      func_0x0001457731ed();
      if (local_118 == local_128) goto LAB_1454f0a70;
    }
    local_120[(long)local_118 * 8] = 0x15;
    *(undefined1 *)(local_120 + (long)local_118 * 8 + 1) = 9;
    *(undefined4 **)(local_120 + (long)local_118 * 8 + 2) = local_78;
    *(long *)(local_120 + (long)local_118 * 8 + 4) = local_80;
    *(undefined4 **)(local_120 + (long)local_118 * 8 + 6) = local_78;
    local_118 = (undefined4 *)((long)local_118 + 1);
  }
  auVar13 = func_0x000145457cb0();
  puVar9 = auVar13._8_8_;
  if (auVar13._0_8_ == 0) {
    puVar9 = (undefined4 *)0x1a;
  }
  if ((long)puVar9 < 0) {
LAB_1454f0ae6:
    func_0x00014590379b();
LAB_1454f0c5e:
                    /* WARNING: Does not return */
    pcVar2 = (code *)invalidInstructionException();
    (*pcVar2)();
  }
  local_78 = puVar9;
  if (puVar9 == (undefined4 *)0x0) {
    local_80 = 1;
    if (local_118 != local_128) goto LAB_1454f0b5e;
  }
  else {
    func_0x000140002200();
    lVar6 = func_0x0001400021c0();
    if (lVar6 == 0) goto LAB_1454f0ae6;
    local_80 = lVar6;
    func_0x0001457731ed();
    if (local_118 != local_128) goto LAB_1454f0b5e;
  }
  puVar9 = local_118;
  func_0x000145774710();
  local_118 = puVar9;
LAB_1454f0b5e:
  local_120[(long)local_118 * 8] = 0x16;
  *(undefined1 *)(local_120 + (long)local_118 * 8 + 1) = 0;
  *(undefined4 **)(local_120 + (long)local_118 * 8 + 2) = local_78;
  *(long *)(local_120 + (long)local_118 * 8 + 4) = local_80;
  *(undefined4 **)(local_120 + (long)local_118 * 8 + 6) = local_78;
  local_118 = (undefined4 *)((long)local_118 + 1);
  func_0x0001454f9790();
  if (local_118 != (undefined4 *)0x0) {
    puVar8 = local_120 + 4;
    puVar9 = local_118;
    do {
      if (*(long *)(puVar8 + -2) != 0) {
        func_0x0001400021d0();
      }
      puVar8 = puVar8 + 8;
      puVar9 = (undefined4 *)((long)puVar9 + -1);
    } while (puVar9 != (undefined4 *)0x0);
  }
  if (local_128 != (undefined4 *)0x0) {
    func_0x0001400021d0();
  }
  if (local_90 != 0) {
    func_0x0001400021d0();
  }
  return;
}
