/* WARNING: Removing unreachable block (ram,0x0001459b3629) */

undefined4 * entry(undefined8 param_1,undefined8 param_2,long param_3,undefined4 *param_4)

{
  ulong uVar1;
  code *pcVar2;
  long lVar3;
  undefined8 uVar4;
  long lVar5;
  undefined8 uVar6;
  long *plVar7;
  long lVar8;
  undefined8 *puVar9;
  undefined4 uVar10;
  ulong uVar11;
  int iVar12;
  ulong local_130;
  long local_128;
  ulong local_120;
  long local_108;
  long lStack_100;
  undefined8 *local_f8;
  long local_f0;
  undefined8 *local_e8;
  long local_e0;
  long local_d8;
  undefined8 uStack_d0;
  long local_c8;
  undefined8 *local_c0;
  long local_b8;
  undefined8 *local_b0;
  undefined8 *local_a8;
  undefined8 *local_a0;
  undefined8 local_98;
  undefined8 uStack_90;
  long local_88;
  undefined8 uStack_80;
  long local_78;
  undefined8 *puStack_70;
  long local_68;
  undefined8 uStack_60;
  undefined1 local_4a;
  undefined1 local_49;
  undefined8 local_48;

  local_48 = 0xfffffffffffffffe;
  func_0x000140002200();
  uStack_90 = (undefined8 *)func_0x0001400021c0();
  uVar6 = uStack_60;
  if (uStack_90 == (undefined8 *)0x0) {
    func_0x000145eb6fcb();
                    /* WARNING: Does not return */
    pcVar2 = (code *)invalidInstructionException();
    (*pcVar2)();
  }
  *uStack_90 = *(undefined8 *)(param_3 + 0x30);
  local_78 = 0x20;
  uStack_60 = CONCAT62(uStack_60._2_6_,0x58);
  uVar4 = uStack_60;
  *(undefined4 *)(uStack_90 + 1) = *(undefined4 *)(param_3 + 0x38);
  lVar5 = 0xc;
  local_98 = 0x20;
  uStack_60._2_4_ = SUB84(uVar6,2);
  uStack_60._6_2_ = SUB82(uVar6,6);
  uStack_80 = CONCAT26(uStack_60._6_2_,CONCAT42(uStack_60._2_4_,0x58));
  uVar1 = *(ulong *)(param_3 + 8);
  lVar8 = 0x20;
  local_68 = lVar5;
  puStack_70 = uStack_90;
  local_88 = lVar5;
  uStack_60 = uVar4;
  if (uVar1 < 0x15) {
    if (uVar1 != 0) goto LAB_1459b1e90;
  }
  else {
    func_0x000145d14a10();
LAB_1459b1e90:
    lVar5 = local_88;
    lVar8 = local_98;
    func_0x000145d145fb();
  }
  lVar5 = lVar5 + uVar1;
  if (lVar5 == lVar8) {
    local_88 = lVar5;
    func_0x000145eb6ec0();
  }
  *(undefined1 *)((long)uStack_90 + lVar5) = 0;
  lVar5 = lVar5 + 1;
  local_78 = local_98;
  puStack_70 = uStack_90;
  uStack_60 = uStack_80;
  if (lVar5 == local_98) {
    local_88 = lVar5;
    local_68 = lVar5;
    func_0x000145eb6ec0();
  }
  *(undefined1 *)((long)puStack_70 + lVar5) = 0;
  lVar5 = lVar5 + 1;
  local_98 = local_78;
  uStack_90 = puStack_70;
  uStack_80 = uStack_60;
  if (lVar5 == local_78) {
    local_88 = lVar5;
    local_68 = lVar5;
    func_0x000145eb6ec0();
  }
  *(undefined1 *)((long)uStack_90 + lVar5) = 0;
  lVar5 = lVar5 + 1;
  local_78 = local_98;
  puStack_70 = uStack_90;
  uStack_60 = uStack_80;
  if (lVar5 == local_98) {
    local_88 = lVar5;
    local_68 = lVar5;
    func_0x000145eb6ec0();
  }
  *(undefined1 *)((long)puStack_70 + lVar5) = 0;
  local_88 = lVar5 + 1;
  local_98 = local_78;
  uStack_90 = puStack_70;
  uStack_80 = uStack_60;
  uVar10 = *(undefined4 *)(param_3 + 0x3c);
  if ((ulong)(local_78 - local_88) < 4) {
    local_68 = local_88;
    func_0x000145d14a10();
  }
  *(undefined4 *)((long)uStack_90 + local_88) = uVar10;
  local_68 = local_88 + 4;
  local_78 = local_98;
  puStack_70 = uStack_90;
  uStack_60 = uStack_80;
  uVar10 = *(undefined4 *)(param_3 + 0x40);
  if ((ulong)(local_98 - local_68) < 4) {
    local_88 = local_68;
    func_0x000145d14a10();
  }
  *(undefined4 *)((long)puStack_70 + local_68) = uVar10;
  local_88 = local_68 + 4;
  local_98 = local_78;
  uStack_90 = puStack_70;
  uStack_80 = uStack_60;
  if ((ulong)(local_78 - local_88) < 4) {
    local_68 = local_88;
    func_0x000145d14a10();
  }
  *(undefined4 *)((long)uStack_90 + local_88) = 0;
  local_68 = local_88 + 4;
  local_78 = local_98;
  puStack_70 = uStack_90;
  uStack_60 = uStack_80;
  if ((ulong)(local_98 - local_68) < 4) {
    local_88 = local_68;
    func_0x000145d14a10();
  }
  *(undefined4 *)((long)puStack_70 + local_68) = 0;
  local_88 = local_68 + 4;
  local_98 = local_78;
  uStack_90 = puStack_70;
  uStack_80 = uStack_60;
  if ((ulong)(local_78 - local_88) < 4) {
    local_68 = local_88;
    func_0x000145d14a10();
  }
  *(undefined4 *)((long)uStack_90 + local_88) = 0;
  local_68 = local_88 + 4;
  local_78 = local_98;
  puStack_70 = uStack_90;
  uStack_60 = uStack_80;
  uVar10 = *(undefined4 *)(param_3 + 0x44);
  if ((ulong)(local_98 - local_68) < 4) {
    local_88 = local_68;
    func_0x000145d14a10();
  }
  *(undefined4 *)((long)puStack_70 + local_68) = uVar10;
  local_88 = local_68 + 4;
  local_98 = local_78;
  uStack_90 = puStack_70;
  uStack_80 = uStack_60;
  if ((ulong)(local_78 - local_88) < 4) {
    local_68 = local_88;
    func_0x000145d14a10();
  }
  *(undefined4 *)((long)uStack_90 + local_88) = 0xffffffff;
  local_68 = local_88 + 4;
  local_78 = local_98;
  puStack_70 = uStack_90;
  uStack_60 = uStack_80;
  if ((ulong)(local_98 - local_68) < 4) {
    local_88 = local_68;
    func_0x000145d14a10();
  }
  *(undefined4 *)((long)puStack_70 + local_68) = 0xffffffff;
  local_88 = local_68 + 4;
  local_98 = local_78;
  uStack_90 = puStack_70;
  uStack_80 = uStack_60;
  if ((ulong)(local_78 - local_88) < 4) {
    local_68 = local_88;
    func_0x000145d14a10();
  }
  *(undefined4 *)((long)uStack_90 + local_88) = 0x3c;
  local_68 = local_88 + 4;
  local_78 = local_98;
  puStack_70 = uStack_90;
  uStack_60 = uStack_80;
  local_a0 = (undefined8 *)local_98;
  local_88 = local_68;
  if ((ulong)(local_98 - local_68) < 4) {
    func_0x000145d14a10();
    local_a0 = (undefined8 *)local_78;
  }
  *(undefined4 *)((long)puStack_70 + local_68) = 0;
  local_68 = local_68 + 4;
  uStack_d0 = uStack_60;
  local_a8 = puStack_70;
  if ((ulong)((long)local_a0 - local_68) < 4) {
    local_e8 = puStack_70;
    local_e0 = (long)local_a0;
    local_d8 = local_68;
    local_78 = (long)local_a0;
    func_0x000145d14a10();
    local_a0 = (undefined8 *)local_78;
    local_a8 = puStack_70;
  }
  *(undefined4 *)((long)local_a8 + local_68) = 0;
  local_68 = local_68 + 4;
  uStack_d0 = CONCAT44(uStack_60._4_4_,(undefined4)uStack_60);
  if ((ulong)((long)local_a0 - local_68) < 4) {
    local_e8 = local_a8;
    local_e0 = (long)local_a0;
    local_d8 = local_68;
    local_78 = (long)local_a0;
    puStack_70 = local_a8;
    func_0x000145d14a10();
    local_a0 = (undefined8 *)local_78;
    local_a8 = puStack_70;
  }
  *(undefined4 *)((long)local_a8 + local_68) = 0;
  local_68 = local_68 + 4;
  uStack_d0 = CONCAT44(uStack_60._4_4_,(undefined4)uStack_60);
  if ((ulong)((long)local_a0 - local_68) < 4) {
    local_e8 = local_a8;
    local_e0 = (long)local_a0;
    local_d8 = local_68;
    local_78 = (long)local_a0;
    puStack_70 = local_a8;
    func_0x000145d14a10();
    local_a0 = (undefined8 *)local_78;
    local_a8 = puStack_70;
  }
  *(undefined4 *)((long)local_a8 + local_68) = 0;
  local_68 = local_68 + 4;
  uStack_d0 = CONCAT44(uStack_60._4_4_,(undefined4)uStack_60);
  if ((ulong)((long)local_a0 - local_68) < 4) {
    local_e8 = local_a8;
    local_e0 = (long)local_a0;
    local_d8 = local_68;
    local_78 = (long)local_a0;
    puStack_70 = local_a8;
    func_0x000145d14a10();
    local_a0 = (undefined8 *)local_78;
    local_a8 = puStack_70;
  }
  *(undefined4 *)((long)local_a8 + local_68) = 0;
  local_68 = local_68 + 4;
  uStack_d0 = CONCAT44(uStack_60._4_4_,(undefined4)uStack_60);
  if ((ulong)((long)local_a0 - local_68) < 4) {
    local_e8 = local_a8;
    local_e0 = (long)local_a0;
    local_d8 = local_68;
    local_78 = (long)local_a0;
    puStack_70 = local_a8;
    func_0x000145d14a10();
    local_a0 = (undefined8 *)local_78;
    local_a8 = puStack_70;
  }
  *(undefined4 *)((long)local_a8 + local_68) = 0;
  local_68 = local_68 + 4;
  uStack_d0 = CONCAT44(uStack_60._4_4_,(undefined4)uStack_60);
  if ((ulong)((long)local_a0 - local_68) < 4) {
    local_e8 = local_a8;
    local_e0 = (long)local_a0;
    local_d8 = local_68;
    local_78 = (long)local_a0;
    puStack_70 = local_a8;
    func_0x000145d14a10();
    local_a0 = (undefined8 *)local_78;
    local_a8 = puStack_70;
  }
  *(undefined4 *)((long)local_a8 + local_68) = 0;
  local_68 = local_68 + 4;
  uStack_d0 = CONCAT44(uStack_60._4_4_,(undefined4)uStack_60);
  if ((ulong)((long)local_a0 - local_68) < 4) {
    local_e8 = local_a8;
    local_e0 = (long)local_a0;
    local_d8 = local_68;
    local_78 = (long)local_a0;
    puStack_70 = local_a8;
    func_0x000145d14a10();
    local_a0 = (undefined8 *)local_78;
    local_a8 = puStack_70;
  }
  *(undefined4 *)((long)local_a8 + local_68) = 0;
  local_68 = local_68 + 4;
  uStack_d0 = CONCAT44(uStack_60._4_4_,(undefined4)uStack_60);
  if ((ulong)((long)local_a0 - local_68) < 4) {
    local_e8 = local_a8;
    local_e0 = (long)local_a0;
    local_d8 = local_68;
    local_78 = (long)local_a0;
    puStack_70 = local_a8;
    func_0x000145d14a10();
    local_a0 = (undefined8 *)local_78;
    local_a8 = puStack_70;
  }
  *(undefined4 *)((long)local_a8 + local_68) = 0;
  local_68 = local_68 + 4;
  uStack_d0 = CONCAT44(uStack_60._4_4_,(undefined4)uStack_60);
  local_d8 = local_68;
  local_78 = (long)local_a0;
  puStack_70 = local_a8;
  if ((ulong)((long)local_a0 - local_68) < 4) {
    func_0x000145d14a10();
  }
  *(undefined4 *)((long)puStack_70 + local_68) = 1;
  local_88 = local_68 + 4;
  local_98 = local_78;
  uStack_90 = puStack_70;
  uStack_80 = uStack_60;
  if ((ulong)(local_78 - local_88) < 4) {
    local_68 = local_88;
    func_0x000145d14a10();
  }
  plVar7 = &local_88;
  *(undefined4 *)((long)uStack_90 + local_88) = 0;
  local_68 = local_88 + 4;
  local_d8 = local_68;
  uStack_d0 = uStack_80;
  local_78 = local_98;
  puStack_70 = uStack_90;
  uStack_60 = uStack_80;
  local_a8 = uStack_90;
  local_a0 = (undefined8 *)local_98;
  if ((ulong)(local_98 - local_68) < 4) {
    local_88 = local_68;
    func_0x000145d14a10();
  }
  *(undefined4 *)((long)puStack_70 + local_68) = 1;
  local_88 = local_68 + 4;
  local_68 = local_88;
  local_98 = local_78;
  uStack_90 = puStack_70;
  uStack_80 = uStack_60;
  uVar10 = *(undefined4 *)(param_3 + 0x50);
  if ((ulong)(local_78 - local_88) < 4) {
    func_0x000145d14a10();
  }
  *(undefined4 *)((long)uStack_90 + local_88) = uVar10;
  local_88 = local_88 + 4;
  local_d8 = *plVar7;
  uStack_d0 = plVar7[1];
  iVar12 = 9;
  do {
    local_78 = local_98;
    puStack_70 = uStack_90;
    local_68 = local_d8;
    uStack_60 = uStack_d0;
    local_a8 = (undefined8 *)local_98;
    local_a0 = uStack_90;
    if ((ulong)(local_98 - local_d8) < 4) {
      func_0x000145d14a10();
    }
    *(undefined4 *)((long)puStack_70 + local_68) = 0;
    local_88 = local_68 + 4;
    local_68 = local_88;
    local_98 = local_78;
    uStack_90 = puStack_70;
    uStack_80 = uStack_60;
    if ((ulong)(local_78 - local_88) < 4) {
      func_0x000145d14a10();
    }
    *(undefined4 *)((long)uStack_90 + local_88) = 0;
    local_88 = local_88 + 4;
    local_d8 = *plVar7;
    uStack_d0 = plVar7[1];
    iVar12 = iVar12 + -1;
  } while (iVar12 != 0);
  iVar12 = 5;
  plVar7 = &local_108;
  lVar8 = local_98;
  puVar9 = uStack_90;
  do {
    local_78 = lVar8;
    puStack_70 = puVar9;
    local_68 = local_d8;
    uStack_60 = uStack_d0;
    local_a8 = (undefined8 *)lVar8;
    local_a0 = puVar9;
    if ((ulong)(lVar8 - local_d8) < 4) {
      func_0x000145d14a10();
    }
    *(undefined4 *)((long)puStack_70 + local_68) = 0;
    local_88 = local_68 + 4;
    local_68 = local_88;
    local_98 = local_78;
    uStack_90 = puStack_70;
    uStack_80 = uStack_60;
    if ((ulong)(local_78 - local_88) < 4) {
      func_0x000145d14a10();
    }
    puVar9 = uStack_90;
    lVar8 = local_98;
    *(undefined4 *)((long)uStack_90 + local_88) = 0;
    local_108 = local_88 + 4;
    local_88 = local_108;
    lStack_100 = uStack_80;
    if ((ulong)(local_98 - local_108) < 4) {
      func_0x000145d14a10();
    }
    puStack_70 = puVar9;
    *(undefined4 *)((long)puVar9 + local_108) = 0;
    local_108 = local_108 + 4;
    local_68 = *plVar7;
    lVar5 = plVar7[1];
    local_d8 = local_68;
    uStack_d0 = lVar5;
    lVar5 = uStack_d0;
    iVar12 = iVar12 + -1;
  } while (iVar12 != 0);
  uStack_d0._4_4_ = (undefined4)((ulong)lVar5 >> 0x20);
  uStack_60._0_4_ = (undefined4)lVar5;
  uStack_60._4_4_ = uStack_d0._4_4_;
  uVar10 = *(undefined4 *)(param_3 + 0x4c);
  local_78 = lVar8;
  local_a8 = (undefined8 *)lVar8;
  if ((ulong)(lVar8 - local_68) < 4) {
    uStack_d0 = lVar5;
    local_a0 = puStack_70;
    func_0x000145d14a10();
  }
  *(undefined4 *)((long)puStack_70 + local_68) = uVar10;
  local_68 = local_68 + 4;
  uStack_d0 = CONCAT44(uStack_60._4_4_,(undefined4)uStack_60);
  if ((ulong)(local_78 - local_68) < 4) {
    local_f8 = puStack_70;
    local_f0 = local_78;
    local_d8 = local_68;
    func_0x000145d14a10();
  }
  *(undefined4 *)((long)puStack_70 + local_68) = 0;
  local_68 = local_68 + 4;
  uStack_d0 = CONCAT44(uStack_60._4_4_,(undefined4)uStack_60);
  if ((ulong)(local_78 - local_68) < 4) {
    local_f8 = puStack_70;
    local_f0 = local_78;
    local_d8 = local_68;
    func_0x000145d14a10();
  }
  *(undefined4 *)((long)puStack_70 + local_68) = 0;
  local_68 = local_68 + 4;
  uStack_d0 = CONCAT44(uStack_60._4_4_,(undefined4)uStack_60);
  if ((ulong)(local_78 - local_68) < 4) {
    local_f8 = puStack_70;
    local_f0 = local_78;
    local_d8 = local_68;
    func_0x000145d14a10();
  }
  *(undefined4 *)((long)puStack_70 + local_68) = 0;
  local_68 = local_68 + 4;
  uStack_d0 = CONCAT44(uStack_60._4_4_,(undefined4)uStack_60);
  if ((ulong)(local_78 - local_68) < 4) {
    local_f8 = puStack_70;
    local_f0 = local_78;
    local_d8 = local_68;
    func_0x000145d14a10();
  }
  *(undefined4 *)((long)puStack_70 + local_68) = 0;
  local_68 = local_68 + 4;
  uStack_d0 = CONCAT44(uStack_60._4_4_,(undefined4)uStack_60);
  if ((ulong)(local_78 - local_68) < 4) {
    local_f8 = puStack_70;
    local_f0 = local_78;
    local_d8 = local_68;
    func_0x000145d14a10();
  }
  *(undefined4 *)((long)puStack_70 + local_68) = 0;
  local_68 = local_68 + 4;
  uStack_d0 = CONCAT44(uStack_60._4_4_,(undefined4)uStack_60);
  if ((ulong)(local_78 - local_68) < 4) {
    local_f8 = puStack_70;
    local_f0 = local_78;
    local_d8 = local_68;
    func_0x000145d14a10();
    puStack_70 = puStack_70;
  }
  local_a0 = puStack_70;
  *(undefined4 *)((long)local_a0 + local_68) = 0;
  local_68 = local_68 + 4;
  uStack_d0 = CONCAT44(uStack_60._4_4_,(undefined4)uStack_60);
  local_d8 = local_68;
  local_a8 = (undefined8 *)local_78;
  puStack_70 = local_a0;
  if ((ulong)(local_78 - local_68) < 4) {
    func_0x000145d14a10();
  }
  *(undefined4 *)((long)puStack_70 + local_68) = 2000;
  local_88 = local_68 + 4;
  local_98 = local_78;
  uStack_90 = puStack_70;
  uStack_80 = uStack_60;
  if ((ulong)(local_78 - local_88) < 4) {
    local_68 = local_88;
    func_0x000145d14a10();
  }
  *(undefined4 *)((long)uStack_90 + local_88) = 0;
  local_68 = local_88 + 4;
  local_78 = local_98;
  puStack_70 = uStack_90;
  uStack_60 = uStack_80;
  local_88 = local_68;
  if ((ulong)(local_98 - local_68) < 4) {
    func_0x000145d14a10();
    local_78 = local_78;
  }
  local_a0 = (undefined8 *)local_78;
  puVar9 = puStack_70;
  *(undefined4 *)((long)puStack_70 + local_68) = 0;
  local_d8 = local_68 + 4;
  uStack_d0 = uStack_60;
  local_78 = *(long *)(param_3 + 0x10);
  uVar1 = *(ulong *)(param_3 + 0x18);
  local_68 = 4;
  local_c0 = puStack_70;
  local_c8 = (long)local_a0;
  local_4a = 1;
  puStack_70 = (undefined8 *)(local_78 + uVar1 * 0x18);
  func_0x0001459d45e0();
  local_a8 = puVar9;
  if (4 < uVar1) {
    local_b0 = puVar9;
    local_b8 = (long)local_a0;
    local_49 = 1;
    func_0x0001458c01f0();
    lVar5 = local_68;
    puVar9 = puStack_70;
    lVar8 = local_78;
    if (local_120 == local_130) {
      func_0x000145d14e50();
    }
    *(long *)(local_128 + local_120 * 0x18) = lVar8;
    *(undefined8 **)(local_128 + 8 + local_120 * 0x18) = puVar9;
    *(long *)(local_128 + 0x10 + local_120 * 0x18) = lVar5;
    local_120 = local_120 + 1;
  }
  uVar11 = 0;
  do {
    uVar10 = 0;
    if (uVar11 < local_120) {
      local_b0 = local_a8;
      local_b8 = (long)local_a0;
      local_49 = 1;
      uVar10 = func_0x0001459a8f50();
    }
    local_78 = (long)local_a0;
    puStack_70 = local_a8;
    local_68 = local_d8;
    uStack_60 = uStack_d0;
    if ((ulong)((long)local_a0 - local_d8) < 4) {
      func_0x000145d14a10();
    }
    *(undefined4 *)((long)puStack_70 + local_68) = uVar10;
    local_88 = local_68 + 4;
    local_98 = local_78;
    uStack_90 = puStack_70;
    uStack_80 = uStack_60;
    if ((ulong)(local_78 - local_88) < 4) {
      local_68 = local_88;
      func_0x000145d14a10();
    }
    *(uint *)((long)uStack_90 + local_88) = (uint)(uVar11 < local_120);
    local_68 = local_88 + 4;
    local_78 = local_98;
    puStack_70 = uStack_90;
    uStack_60 = uStack_80;
    if ((ulong)(local_98 - local_68) < 4) {
      local_88 = local_68;
      func_0x000145d14a10();
    }
    *(undefined4 *)((long)puStack_70 + local_68) = 0;
    local_88 = local_68 + 4;
    local_98 = local_78;
    uStack_90 = puStack_70;
    uStack_80 = uStack_60;
    if ((ulong)(local_78 - local_88) < 4) {
      local_68 = local_88;
      func_0x000145d14a10();
    }
    *(undefined4 *)((long)uStack_90 + local_88) = 0xffffffff;
    local_68 = local_88 + 4;
    local_88 = local_68;
    local_78 = local_98;
    puStack_70 = uStack_90;
    uStack_60 = uStack_80;
    if ((ulong)(local_98 - local_68) < 4) {
      func_0x000145d14a10();
    }
    puVar9 = puStack_70;
    lVar8 = local_78;
    *(undefined4 *)((long)puStack_70 + local_68) = 0;
    local_108 = local_68 + 4;
    local_68 = local_108;
    lStack_100 = uStack_60;
    if ((ulong)(local_78 - local_108) < 4) {
      func_0x000145d14a10();
    }
    uVar11 = uVar11 + 1;
    local_a8 = puVar9;
    *(undefined4 *)((long)puVar9 + local_108) = 0xffffffff;
    local_108 = local_108 + 4;
    lVar5 = *plVar7;
    lVar3 = plVar7[1];
    local_d8 = *plVar7;
    uStack_d0 = plVar7[1];
    local_a0 = (undefined8 *)lVar8;
  } while (uVar11 < 5);
  uVar6 = 0;
  local_78 = lVar8;
  puStack_70 = puVar9;
  uStack_60 = lVar3;
  if ((ulong)(lVar8 - lVar5) < 4) {
    local_68 = lVar5;
    func_0x000145d14a10();
    lVar5 = local_68;
  }
  *(int *)((long)puStack_70 + lVar5) = (int)CONCAT71((int7)((ulong)uVar6 >> 8),uVar1 != 0);
  lVar5 = lVar5 + 4;
  local_98 = local_78;
  uStack_90 = puStack_70;
  uStack_80 = uStack_60;
  uVar1 = *(ulong *)(param_3 + 0x28);
  local_68 = lVar5;
  local_88 = lVar5;
  if ((ulong)(local_78 - lVar5) < uVar1) {
    func_0x000145d14a10();
  }
  else {
    lVar8 = local_78;
    if (uVar1 == 0) goto LAB_1459b311e;
  }
  lVar5 = local_88;
  lVar8 = local_98;
  func_0x000145d145fb();
LAB_1459b311e:
  lVar5 = lVar5 + uVar1;
  if (lVar5 == lVar8) {
    local_88 = lVar5;
    func_0x000145eb6ec0();
  }
  *(undefined1 *)((long)uStack_90 + lVar5) = 0;
  local_68 = lVar5 + 1;
  local_78 = local_98;
  puStack_70 = uStack_90;
  uStack_60 = uStack_80;
  if ((ulong)(local_98 - local_68) < 4) {
    local_88 = local_68;
    func_0x000145d14a10();
  }
  *(undefined4 *)((long)puStack_70 + local_68) = 0;
  local_88 = local_68 + 4;
  local_98 = local_78;
  uStack_90 = puStack_70;
  uStack_80 = uStack_60;
  if ((ulong)(local_78 - local_88) < 4) {
    local_68 = local_88;
    func_0x000145d14a10();
  }
  *(undefined4 *)((long)uStack_90 + local_88) = 0;
  local_68 = local_88 + 4;
  local_78 = local_98;
  puStack_70 = uStack_90;
  uStack_60 = uStack_80;
  if ((ulong)(local_98 - local_68) < 4) {
    local_88 = local_68;
    func_0x000145d14a10();
  }
  *(undefined4 *)((long)puStack_70 + local_68) = 0;
  local_88 = local_68 + 4;
  local_98 = local_78;
  uStack_90 = puStack_70;
  uStack_80 = uStack_60;
  if ((ulong)(local_78 - local_88) < 4) {
    local_68 = local_88;
    func_0x000145d14a10();
  }
  *(undefined4 *)((long)uStack_90 + local_88) = 0;
  local_68 = local_88 + 4;
  local_78 = local_98;
  puStack_70 = uStack_90;
  uStack_60 = uStack_80;
  if ((ulong)(local_98 - local_68) < 4) {
    local_88 = local_68;
    func_0x000145d14a10();
  }
  *(undefined4 *)((long)puStack_70 + local_68) = 0;
  local_88 = local_68 + 4;
  local_98 = local_78;
  uStack_90 = puStack_70;
  uStack_80 = uStack_60;
  if ((ulong)(local_78 - local_88) < 4) {
    local_68 = local_88;
    func_0x000145d14a10();
  }
  *(undefined4 *)((long)uStack_90 + local_88) = 0;
  local_68 = local_88 + 4;
  local_78 = local_98;
  puStack_70 = uStack_90;
  uStack_60 = uStack_80;
  uVar10 = *(undefined4 *)(param_3 + 0x48);
  if ((ulong)(local_98 - local_68) < 4) {
    local_88 = local_68;
    func_0x000145d14a10();
  }
  *(undefined4 *)((long)puStack_70 + local_68) = uVar10;
  local_88 = local_68 + 4;
  local_98 = local_78;
  uStack_90 = puStack_70;
  uStack_80 = uStack_60;
  if ((ulong)(local_78 - local_88) < 4) {
    local_68 = local_88;
    func_0x000145d14a10();
  }
  *(undefined4 *)((long)uStack_90 + local_88) = 0;
  local_68 = local_88 + 4;
  local_78 = local_98;
  puStack_70 = uStack_90;
  uStack_60 = uStack_80;
  if ((ulong)(local_98 - local_68) < 4) {
    local_88 = local_68;
    func_0x000145d14a10();
  }
  *(undefined4 *)((long)puStack_70 + local_68) = 0;
  local_88 = local_68 + 4;
  local_98 = local_78;
  uStack_90 = puStack_70;
  uStack_80 = uStack_60;
  if ((ulong)(local_78 - local_88) < 4) {
    local_68 = local_88;
    func_0x000145d14a10();
  }
  *(undefined4 *)((long)uStack_90 + local_88) = 0;
  local_68 = local_88 + 4;
  local_78 = local_98;
  puStack_70 = uStack_90;
  uStack_60 = uStack_80;
  if ((ulong)(local_98 - local_68) < 4) {
    local_88 = local_68;
    func_0x000145d14a10();
  }
  *(undefined4 *)((long)puStack_70 + local_68) = 0;
  local_88 = local_68 + 4;
  local_98 = local_78;
  uStack_90 = puStack_70;
  uStack_80 = uStack_60;
  if ((ulong)(local_78 - local_88) < 4) {
    local_68 = local_88;
    func_0x000145d14a10();
  }
  *(undefined4 *)((long)uStack_90 + local_88) = 0;
  local_68 = local_88 + 4;
  local_78 = local_98;
  puStack_70 = uStack_90;
  uStack_60 = uStack_80;
  if ((ulong)(local_98 - local_68) < 4) {
    local_88 = local_68;
    func_0x000145d14a10();
  }
  *(undefined4 *)((long)puStack_70 + local_68) = 0;
  local_88 = local_68 + 4;
  local_98 = local_78;
  uStack_90 = puStack_70;
  uStack_80 = uStack_60;
  local_68 = local_88;
  if ((ulong)(local_78 - local_88) < 4) {
    func_0x000145d14a10();
  }
  *(undefined4 *)((long)uStack_90 + local_88) = 0;
  local_88 = local_88 + 4;
  *param_4 = (undefined4)local_98;
  param_4[1] = local_98._4_4_;
  param_4[2] = (undefined4)uStack_90;
  param_4[3] = uStack_90._4_4_;
  *(long *)(param_4 + 4) = local_88;
  *(long *)(param_4 + 6) = uStack_80;
  if (local_120 != 0) {
    lVar8 = local_128 + 8;
    do {
      if (*(long *)(lVar8 + -8) != 0) {
        func_0x0001400021d0();
      }
      lVar8 = lVar8 + 0x18;
      local_120 = local_120 - 1;
    } while (local_120 != 0);
  }
  if (local_130 != 0) {
    func_0x0001400021d0();
  }
  return param_4;
}
