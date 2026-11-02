uVar9 = 0;
  do {
    uVar4 = 0;
    bVar11 = uVar9 < uStack_158;
    if (bVar11) {
      puStack_b0 = puStack_a0;
      puStack_b8 = puStack_a8;
      uStack_49 = 1;
      uVar4 = FUN_145b5cb20(*(undefined8 *)(lStack_160 + 8 + uVar9 * 0x18),
                            *(undefined8 *)(lStack_160 + 0x10 + uVar9 * 0x18));
    }
    uStack_78 = puStack_a8;
    uStack_70 = puStack_a0;
    puStack_68 = (undefined8 *)lStack_f8;
    uStack_60 = uStack_f0;
    if ((ulonglong)((longlong)puStack_a8 - lStack_f8) < 4) {
      FUN_145f945f0(&uStack_78,lStack_f8,4,1,1);
    }
    *(undefined4 *)((longlong)uStack_70 + (longlong)puStack_68) = uVar4;
    puStack_88 = (undefined8 *)((longlong)puStack_68 + 4);
    uStack_98 = uStack_78;
    uStack_90 = uStack_70;
    uStack_80 = uStack_60;
    if ((ulonglong)((longlong)uStack_78 - (longlong)puStack_88) < 4) {
      puStack_68 = puStack_88;
      FUN_145f945f0(&uStack_98,puStack_88,4,1,1);
    }
    *(uint *)((longlong)uStack_90 + (longlong)puStack_88) = (uint)bVar11;
    puStack_68 = (undefined8 *)((longlong)puStack_88 + 4);
    uStack_78 = uStack_98;
    uStack_70 = uStack_90;
    uStack_60 = uStack_80;
    if ((ulonglong)((longlong)uStack_98 - (longlong)puStack_68) < 4) {
      puStack_88 = puStack_68;
      FUN_145f945f0(&uStack_78,puStack_68,4,1,1);
    }
    *(undefined4 *)((longlong)uStack_70 + (longlong)puStack_68) = 0;
    puStack_88 = (undefined8 *)((longlong)puStack_68 + 4);
    uStack_98 = uStack_78;
    uStack_90 = uStack_70;
    uStack_80 = uStack_60;
    if ((ulonglong)((longlong)uStack_78 - (longlong)puStack_88) < 4) {
      puStack_68 = puStack_88;
      FUN_145f945f0(&uStack_98,puStack_88,4,1,1);
    }
    *(undefined4 *)((longlong)uStack_90 + (longlong)puStack_88) = 0xffffffff;
    puStack_68 = (undefined8 *)((longlong)puStack_88 + 4);
    uStack_78 = uStack_98;
    uStack_70 = uStack_90;
    uStack_60 = uStack_80;
    puStack_88 = puStack_68;
    if ((ulonglong)((longlong)uStack_98 - (longlong)puStack_68) < 4) {
      FUN_145f945f0(&uStack_78,puStack_68,4,1,1);
    }
    *(undefined4 *)((longlong)uStack_70 + (longlong)puStack_68) = 0;
    lStack_d8 = (longlong)puStack_68 + 4;
    uStack_e8 = (undefined4)uStack_78;
    uStack_e4 = uStack_78._4_4_;
    uStack_e0 = (undefined4)uStack_70;
    uStack_dc = uStack_70._4_4_;
    uStack_d0 = uStack_60;
    puVar6 = uStack_78;
    puStack_68 = (undefined8 *)lStack_d8;
    if ((ulonglong)((longlong)uStack_78 - lStack_d8) < 4) {
      FUN_145f945f0(&uStack_e8,lStack_d8,4,1,1);
      puVar6 = (undefined8 *)CONCAT44(uStack_e4,uStack_e8);
    }
    uVar9 = uVar9 + 1;
    puStack_a0 = (undefined8 *)CONCAT44(uStack_dc,uStack_e0);
    *(undefined4 *)((longlong)puStack_a0 + lStack_d8) = 0xffffffff;
    puVar5 = (undefined8 *)(lStack_d8 + 4);
    uStack_f0 = uStack_d0;
    lStack_f8 = (longlong)puVar5;
    lStack_d8 = (longlong)puVar5;
    puStack_a8 = puVar6;
  } while (uVar9 < 5);
