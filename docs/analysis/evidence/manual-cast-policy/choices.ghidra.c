
void entry(void)

{
  char cVar1;
  ulong uVar2;
  code *pcVar3;
  long lVar4;
  uint uVar5;
  uint uVar6;
  long in_RCX;
  long lVar7;
  uint uVar8;
  undefined8 uVar9;
  long lVar10;
  long lVar11;
  undefined8 uVar12;
  ulong *puVar13;
  bool bVar14;
  undefined1 auVar15 [16];
  ulong local_d0;
  long local_c8;
  undefined8 local_c0;
  long local_b8;
  long local_b0;
  long local_a8;
  long *local_a0;
  undefined8 local_98;
  ulong *local_90;
  undefined8 local_88;
  undefined8 local_80;
  undefined8 uStack_78;
  long local_70;
  undefined4 local_68;
  undefined4 uStack_64;
  undefined4 uStack_60;
  undefined4 uStack_5c;
  long local_58;
  ulong *local_48;
  long local_40;
  undefined8 local_38;

  local_38 = 0xfffffffffffffffe;
  cVar1 = *(char *)(in_RCX + 0x9b7);
  if (cVar1 == -1) {
    return;
  }
  if (*(char *)(in_RCX + 0x9a8) == '\0') {
    return;
  }
  if (cVar1 == '\0') {
    func_0x000145457cb0(0x1469f7da0,in_RCX,0x46,0x1469f7da0);
    local_90 = (ulong *)(in_RCX + 0x410);
    local_a0 = (long *)0x1469f6ae4;
    local_98 = 5;
    local_88 = 0x1469f6450;
    func_0x000145458060();
  }
  else {
    if (cVar1 == '\x02') {
      uVar12 = 0x1469f7de6;
      lVar10 = 0x38;
      uVar9 = 0x38;
    }
    else {
      uVar12 = 0x1469f7e1e;
      lVar10 = 0x3c;
      uVar9 = 0x3c;
    }
    auVar15 = func_0x000145457cb0(uVar12,in_RCX,uVar9,uVar12);
    lVar11 = auVar15._8_8_;
    if (auVar15._0_8_ == 0) {
      lVar11 = lVar10;
    }
    if (lVar11 < 0) {
LAB_1454ee56e:
      func_0x00014590379b();
                    /* WARNING: Does not return */
      pcVar3 = (code *)invalidInstructionException();
      (*pcVar3)();
    }
    if (lVar11 == 0) {
      local_b0 = 1;
      local_b8 = lVar11;
      local_a8 = lVar11;
    }
    else {
      func_0x000140002200();
      lVar10 = func_0x0001400021c0();
      if (lVar10 == 0) goto LAB_1454ee56e;
      func_0x0001457731ed();
      local_b8 = lVar11;
      local_b0 = lVar10;
      local_a8 = lVar11;
    }
  }
  local_d0 = *(ulong *)(in_RCX + 0x588);
  lVar10 = *(long *)(in_RCX + 0x590);
  local_c8 = lVar10 * 0xa0 + local_d0;
  local_c0 = 0;
  if (lVar10 == 0) {
    uStack_78 = (ulong *)0x8;
  }
  else {
    func_0x000140002200(lVar10 << 5);
    uStack_78 = (ulong *)func_0x0001400021c0();
    if (uStack_78 == (ulong *)0x0) {
      func_0x00014590379b();
                    /* WARNING: Does not return */
      pcVar3 = (code *)invalidInstructionException();
      (*pcVar3)();
    }
  }
  local_a0 = &local_70;
  local_70 = 0;
  local_98 = 0;
  puVar13 = &local_d0;
  local_90 = uStack_78;
  local_80 = lVar10;
  func_0x00014554a860();
  local_68 = (undefined4)local_80;
  uStack_64 = local_80._4_4_;
  uStack_60 = (undefined4)uStack_78;
  uStack_5c = uStack_78._4_4_;
  local_58 = local_70;
  if (*(char *)(in_RCX + 0x226) != '\0') {
    func_0x000145457cb0();
    uVar6 = *(uint *)(in_RCX + 0x980) >> 2;
    uVar8 = 10;
    if (10 < uVar6) {
      uVar8 = uVar6;
    }
    local_d0 = CONCAT44(local_d0._4_4_,uVar8);
    local_a0 = (long *)0x1469f7e72;
    local_98 = 9;
    local_88 = 0x1469f6450;
    local_90 = puVar13;
    func_0x000145458060();
    lVar11 = local_58;
    lVar10 = local_70;
    local_40 = local_80;
    local_48 = uStack_78;
    if (local_58 == CONCAT44(uStack_64,local_68)) {
      func_0x000145774710();
    }
    lVar4 = CONCAT44(uStack_5c,uStack_60);
    lVar7 = lVar11 * 0x20;
    *(undefined4 *)(lVar4 + lVar7) = 10;
    *(undefined1 *)(lVar4 + 4 + lVar7) = 0;
    *(long *)(lVar4 + 8 + lVar7) = local_40;
    *(ulong **)(lVar4 + 0x10 + lVar7) = local_48;
    *(long *)(lVar4 + 0x18 + lVar7) = lVar10;
    local_58 = lVar11 + 1;
  }
  if (*(int *)(in_RCX + 0x4c4) == 0) {
    uVar8 = *(uint *)(in_RCX + 0x4c8);
    uVar6 = 1;
    if ((((uVar8 == 0) || (((uVar8 & 1) != 0 && (uVar6 = 3, uVar8 == 1)))) ||
        (((uVar8 & 2) != 0 && (uVar6 = uVar6 * 9, (uVar8 & 0xfffffffe) == 2)))) ||
       ((((uVar8 & 4) != 0 && (uVar6 = uVar6 * 0x51, (uVar8 & 0xfffffffc) == 4)) ||
        (((uVar8 & 8) != 0 && (uVar6 = uVar6 * 0x19a1, (uVar8 & 0xfffffff8) == 8)))))) {
LAB_1454ee887:
      bVar14 = (int)((ulong)uVar6 * 100 >> 0x20) != 0;
      uVar5 = (uint)((ulong)uVar6 * 100);
    }
    else {
      bVar14 = true;
      uVar5 = 0xffffff9c;
      if ((uVar8 & 0x10) != 0) {
        uVar2 = (ulong)uVar6;
        uVar6 = (uint)(uVar2 * 0x290d741);
        if (((uVar8 & 0xfffffff0) == 0x10) && ((int)(uVar2 * 0x290d741 >> 0x20) == 0))
        goto LAB_1454ee887;
      }
    }
    if (bVar14) {
      local_d0 = CONCAT44(local_d0._4_4_,0xffffffff);
      if (*(int *)(in_RCX + 0x420) != -1) goto LAB_1454ee986;
    }
    else {
      local_d0 = CONCAT44(local_d0._4_4_,uVar5);
      if (*(uint *)(in_RCX + 0x420) < uVar5) goto LAB_1454ee986;
    }
    func_0x000145457cb0();
    local_a0 = (long *)0x1469f7e8f;
    local_98 = 4;
    local_88 = 0x1469f6450;
    local_90 = puVar13;
    func_0x000145458060();
    lVar10 = local_58;
    local_40 = local_80;
    local_48 = uStack_78;
    lVar11 = local_70;
    if (local_58 == CONCAT44(uStack_64,local_68)) {
      func_0x000145774710();
    }
  }
  else {
    local_d0 = local_d0 & 0xffffffff00000000;
    func_0x000145457cb0();
    local_90 = (ulong *)(in_RCX + 0x4c4);
    local_a0 = (long *)0x1469f6b17;
    local_98 = 7;
    local_88 = 0x1469f6450;
    func_0x000145458060();
    lVar10 = local_58;
    local_40 = local_80;
    local_48 = uStack_78;
    lVar11 = local_70;
    if (local_58 == CONCAT44(uStack_64,local_68)) {
      func_0x000145774710();
    }
  }
  lVar4 = CONCAT44(uStack_5c,uStack_60);
  lVar7 = lVar10 * 0x20;
  *(undefined4 *)(lVar4 + lVar7) = 9;
  *(undefined1 *)(lVar4 + 4 + lVar7) = 0;
  *(long *)(lVar4 + 8 + lVar7) = local_40;
  *(ulong **)(lVar4 + 0x10 + lVar7) = local_48;
  *(long *)(lVar4 + 0x18 + lVar7) = lVar11;
  local_58 = lVar10 + 1;
LAB_1454ee986:
  func_0x0001454f9790();
  if (local_58 != 0) {
    lVar11 = CONCAT44(uStack_5c,uStack_60) + 0x10;
    lVar10 = local_58;
    do {
      if (*(long *)(lVar11 + -8) != 0) {
        func_0x0001400021d0();
      }
      lVar11 = lVar11 + 0x20;
      lVar10 = lVar10 + -1;
    } while (lVar10 != 0);
  }
  if (CONCAT44(uStack_64,local_68) != 0) {
    func_0x0001400021d0();
  }
  if (local_b8 != 0) {
    func_0x0001400021d0();
  }
  return;
}
