longlong * FUN_145822670(longlong *param_1,longlong param_2)

{
  byte bVar1;
  char cVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  int iVar5;
  code *pcVar6;
  longlong lVar7;
  undefined *puVar8;
  undefined8 *puVar9;
  undefined4 *puVar10;
  uint *puVar11;
  longlong lVar12;
  undefined8 uStack_110;
  undefined8 uStack_108;
  undefined8 uStack_100;
  undefined8 uStack_f8;
  undefined8 uStack_f0;
  undefined8 uStack_e8;
  undefined8 uStack_e0;
  undefined8 uStack_d8;
  undefined8 uStack_d0;
  undefined8 uStack_c8;
  undefined8 uStack_c0;
  undefined8 uStack_b8;
  longlong lStack_b0;
  longlong lStack_a8;
  longlong lStack_a0;
  undefined4 *puStack_98;
  undefined8 *puStack_90;
  undefined8 *puStack_88;
  undefined4 *puStack_80;
  undefined4 uStack_78;
  undefined4 uStack_74;
  undefined4 uStack_70;
  undefined4 uStack_6c;
  longlong lStack_68;
  undefined8 *puStack_60;
  longlong lStack_58;
  undefined8 uStack_50;
  undefined8 uStack_48;

  uStack_48 = 0xfffffffffffffffe;
  lVar7 = FUN_1458095e0(*(undefined8 *)(param_2 + 0x2a8),*(undefined8 *)(param_2 + 0x2b0));
  cVar2 = *(char *)(param_2 + 0x32c);
  bVar1 = cVar2 - 2;
  if (bVar1 < 10) {
    puVar8 = *(undefined **)(&DAT_146ccadf8 + (ulonglong)bVar1 * 8);
  }
  else {
    puVar8 = &DAT_146cc3058;
  }
  FUN_1459d6f30(&lStack_b0,*(longlong *)(puVar8 + 0x30),
                *(longlong *)(puVar8 + 0x38) * 0x10 + *(longlong *)(puVar8 + 0x30));
  uVar3 = *(undefined4 *)(*(longlong *)(param_2 + 0x420) + 0x40);
  if (lStack_a0 == lStack_b0) {
    FUN_145d19840(&lStack_b0);
  }
  *(undefined4 *)(lStack_a8 + lStack_a0 * 4) = uVar3;
  lStack_a0 = lStack_a0 + 1;
  FUN_140002200();
  puVar9 = (undefined8 *)thunk_FUN_145cbdd70(0xe0,8);
  if (puVar9 == (undefined8 *)0x0) {
    FUN_145eb6fb1(8,0xe0);
  }
  else {
    lVar7 = lVar7 * 0xf0;
    uVar3 = *(undefined4 *)(&DAT_146cc0dc8 + lVar7);
    puStack_90 = puVar9;
    FUN_1459b1570(&uStack_d0,uVar3,param_2 + 0x4e0,*(undefined4 *)(&DAT_146cc0ddc + lVar7));
    FUN_145e98740(&uStack_f0);
    FUN_140002200();
    puVar10 = (undefined4 *)thunk_FUN_145cbdd70(0x20,1);
    if (puVar10 == (undefined4 *)0x0) {
      FUN_145eb6fcb(1,0x20);
    }
    else {
      puVar10[4] = 0xffffffff;
      puVar10[5] = 0xffffffff;
      puVar10[6] = 0xffffffff;
      puVar10[7] = 0xffffffff;
      *puVar10 = 0xffffffff;
      puVar10[1] = 0xffffffff;
      puVar10[2] = 0xffffffff;
      puVar10[3] = 0xffffffff;
      uVar4 = *(undefined4 *)(&DAT_146cc0dcc + lVar7);
      puStack_98 = puVar10;
      FUN_1459affb0(&uStack_110,param_2 + 0x4e0,uVar3,uVar4);
      FUN_1459adfa0(&lStack_68,lStack_a8,lStack_a0);
      FUN_1459b1bd0(&puStack_88);
      iVar5 = *(int *)(&DAT_146cc0de4 + lVar7);
      FUN_140002200();
      puVar11 = (uint *)thunk_FUN_145cbdd70(0x20,1);
      if (puVar11 != (uint *)0x0) {
        *puVar11 = iVar5 << 6 | 0x6539800;
        puVar11[1] = 0x3c888889;
        puStack_90[2] = uStack_c0;
        puStack_90[3] = uStack_b8;
        *puStack_90 = uStack_d0;
        puStack_90[1] = uStack_c8;
        puStack_90[4] = uStack_f0;
        puStack_90[5] = uStack_e8;
        puStack_90[6] = uStack_e0;
        puStack_90[7] = uStack_d8;
        puStack_90[8] = 0x20;
        puStack_90[9] = puStack_98;
        puStack_90[10] = 0x20;
        *(undefined2 *)(puStack_90 + 0xb) = 0xfd;
        puStack_90[0xe] = uStack_100;
        puStack_90[0xf] = uStack_f8;
        puStack_90[0xc] = uStack_110;
        puStack_90[0xd] = uStack_108;
        puStack_90[0x10] = lStack_68;
        puStack_90[0x11] = puStack_60;
        puStack_90[0x12] = lStack_58;
        puStack_90[0x13] = uStack_50;
        *(undefined4 *)(puStack_90 + 0x16) = uStack_78;
        *(undefined4 *)((longlong)puStack_90 + 0xb4) = uStack_74;
        *(undefined4 *)(puStack_90 + 0x17) = uStack_70;
        *(undefined4 *)((longlong)puStack_90 + 0xbc) = uStack_6c;
        puStack_90[0x14] = puStack_88;
        puStack_90[0x15] = puStack_80;
        puStack_90[0x18] = 0x20;
        puStack_90[0x19] = puVar11;
        puStack_90[0x1a] = 8;
        *(undefined2 *)(puStack_90 + 0x1b) = 0x42;
        lStack_68 = 7;
        puStack_60 = puStack_90;
        lStack_58 = 7;
        FUN_145908500(&puStack_88,param_2);
        lVar12 = 7;
        if (puStack_88 != (undefined8 *)0xffffffffffffffff) {
          puStack_90 = puStack_88;
          puStack_98 = puStack_80;
          FUN_145d14a10(&lStack_68,7,1,8,0x20);
          puStack_60[lStack_58 * 4] = puStack_90;
          puStack_60[lStack_58 * 4 + 1] = puStack_98;
          puStack_60[lStack_58 * 4 + 2] = CONCAT44(uStack_74,uStack_78);
          (puStack_60 + lStack_58 * 4 + 2)[1] = CONCAT44(uStack_6c,uStack_70);
          lVar12 = lStack_58 + 1;
        }
        lStack_58 = lVar12;
        FUN_14590e290(&puStack_88,param_2,1);
        if (lVar12 == lStack_68) {
          FUN_145d150f0(&lStack_68);
        }
        puVar9 = puStack_60 + lVar12 * 4 + 2;
        *(undefined4 *)puVar9 = uStack_78;
        *(undefined4 *)((longlong)puVar9 + 4) = uStack_74;
        *(undefined4 *)(puVar9 + 1) = uStack_70;
        *(undefined4 *)((longlong)puVar9 + 0xc) = uStack_6c;
        puStack_60[lVar12 * 4] = puStack_88;
        (puStack_60 + lVar12 * 4)[1] = puStack_80;
        lStack_58 = lVar12 + 1;
        FUN_1459b1230(&puStack_88,uVar3,uVar4);
        lVar12 = lStack_58;
        if (lStack_58 == lStack_68) {
          FUN_145d150f0(&lStack_68);
        }
        puVar9 = puStack_60 + lVar12 * 4 + 2;
        *(undefined4 *)puVar9 = uStack_78;
        *(undefined4 *)((longlong)puVar9 + 4) = uStack_74;
        *(undefined4 *)(puVar9 + 1) = uStack_70;
        *(undefined4 *)((longlong)puVar9 + 0xc) = uStack_6c;
        puStack_60[lVar12 * 4] = puStack_88;
        (puStack_60 + lVar12 * 4)[1] = puStack_80;
        lStack_58 = lVar12 + 1;
        FUN_1459b8160(&puStack_88,*(undefined4 *)(&DAT_146cc0dc0 + lVar7),
                      *(undefined4 *)(&DAT_146cc0dc4 + lVar7));
        lVar7 = lStack_58;
        if (lStack_58 == lStack_68) {
          FUN_145d150f0(&lStack_68);
        }
        puVar9 = puStack_60 + lVar7 * 4 + 2;
        *(undefined4 *)puVar9 = uStack_78;
        *(undefined4 *)((longlong)puVar9 + 4) = uStack_74;
        *(undefined4 *)(puVar9 + 1) = uStack_70;
        *(undefined4 *)((longlong)puVar9 + 0xc) = uStack_6c;
        puStack_60[lVar7 * 4] = puStack_88;
        (puStack_60 + lVar7 * 4)[1] = puStack_80;
        lStack_58 = lVar7 + 1;
        FUN_1459b5590(&puStack_88,*(undefined8 *)(param_2 + 0x478),*(undefined8 *)(param_2 + 0x1b8),
                      *(undefined8 *)(param_2 + 0x1c0),*(undefined1 *)(param_2 + 0x32d),
                      *(undefined1 *)(param_2 + 0x32e),cVar2);
        lVar7 = lStack_58;
        if (lStack_58 == lStack_68) {
          FUN_145d150f0(&lStack_68);
        }
        puVar9 = puStack_60 + lVar7 * 4 + 2;
        *(undefined4 *)puVar9 = uStack_78;
        *(undefined4 *)((longlong)puVar9 + 4) = uStack_74;
        *(undefined4 *)(puVar9 + 1) = uStack_70;
        *(undefined4 *)((longlong)puVar9 + 0xc) = uStack_6c;
        puStack_60[lVar7 * 4] = puStack_88;
        (puStack_60 + lVar7 * 4)[1] = puStack_80;
        lStack_58 = lVar7 + 1;
        param_1[2] = lStack_58;
        *param_1 = lStack_68;
        param_1[1] = (longlong)puStack_60;
        if (lStack_b0 != 0) {
          thunk_FUN_145cbddd0(lStack_a8,lStack_b0 << 2,4);
        }
        return param_1;
      }
      FUN_145eb6fcb(1,0x20);
    }
  }
                    /* WARNING: Does not return */
  pcVar6 = (code *)invalidInstructionException();
  (*pcVar6)();
}
