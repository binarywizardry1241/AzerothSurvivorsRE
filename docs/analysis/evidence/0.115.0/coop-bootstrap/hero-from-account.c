/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 *
entry(undefined8 param_1,undefined8 param_2,long param_3,undefined8 *param_4,long param_5,
     undefined8 param_6)

{
  char *pcVar1;
  char cVar2;
  undefined1 uVar3;
  undefined1 uVar4;
  code *pcVar5;
  undefined4 uVar6;
  long lVar7;
  ulong uVar8;
  undefined2 *puVar9;
  long lVar10;
  ulong uVar11;
  undefined2 *puVar12;
  undefined1 uVar13;
  ulong uVar14;
  long in_GS_OFFSET;
  undefined8 local_130;
  undefined8 uStack_128;
  undefined4 local_120;
  undefined4 uStack_11c;
  undefined4 uStack_118;
  undefined4 uStack_114;
  undefined4 local_110;
  undefined4 uStack_10c;
  undefined4 uStack_108;
  undefined4 uStack_104;
  undefined4 local_100;
  undefined4 uStack_fc;
  undefined4 uStack_f8;
  undefined4 uStack_f4;
  undefined4 uStack_f0;
  undefined4 uStack_ec;
  undefined4 uStack_e8;
  undefined4 local_e0;
  undefined4 uStack_dc;
  undefined4 uStack_d8;
  undefined4 uStack_d4;
  undefined4 local_d0;
  undefined4 uStack_cc;
  undefined4 uStack_c8;
  undefined4 uStack_c4;
  undefined4 local_c0;
  undefined4 uStack_bc;
  undefined4 uStack_b8;
  undefined4 uStack_b4;
  undefined8 local_98;
  undefined8 uStack_90;
  undefined8 local_88;
  undefined8 local_78;
  undefined8 uStack_70;
  undefined8 local_68;

  cVar2 = *(char *)(param_5 + 0x38);
  uVar3 = *(undefined1 *)(param_5 + 0x39);
  func_0x000145832890();
  func_0x000145ce7810();
  uVar4 = *(undefined1 *)(param_5 + 0x3a);
  uVar14 = 0;
  lVar10 = 0;
  lVar7 = *(long *)(param_3 + 0x68);
  do {
    if (*(long *)(param_3 + 0x70) << 5 == lVar10) goto LAB_145816674;
    lVar10 = lVar10 + 0x20;
    pcVar1 = (char *)(lVar7 + 4);
    lVar7 = lVar7 + 0x20;
  } while (*pcVar1 != cVar2);
  uVar8 = *(ulong *)(*(long *)(param_3 + 0x68) + -8 + lVar10);
  if (uVar8 << 4 < 0x7ffffffffffffff9 && uVar8 >> 0x3c == 0) {
    if (uVar8 << 4 == 0) {
      uVar14 = 0;
    }
    else {
      func_0x000140002200();
      lVar7 = func_0x0001400021c0();
      uVar14 = uVar8;
      if (lVar7 == 0) goto LAB_1458165e2;
    }
    if (uVar8 != 0) {
      func_0x000145d145fb();
    }
LAB_145816674:
    func_0x0001458575c0();
    func_0x0001458c3320();
    uVar6 = func_0x0001458cbba0();
    lVar7 = 0;
    do {
      if (*(long *)(param_3 + 0x28) << 4 == lVar7) {
        uVar13 = 1;
        goto LAB_145816716;
      }
      lVar10 = lVar7 + 0x10;
      pcVar1 = (char *)(*(long *)(param_3 + 0x20) + lVar7);
      lVar7 = lVar10;
    } while (*pcVar1 != cVar2);
    uVar8 = *(ulong *)(*(long *)(param_3 + 0x20) + -8 + lVar10);
    uVar11 = 0xc;
    if (uVar8 < 0xc) {
      uVar11 = uVar8;
    }
    uVar13 = 1;
    if (uVar8 != 0) {
      uVar13 = (undefined1)uVar11;
    }
LAB_145816716:
    lVar7 = *(long *)(*(long *)(in_GS_OFFSET + 0x58) + (ulong)_DAT_1482172f0 * 8);
    uVar8 = _DAT_148217160;
    if (*(char *)(lVar7 + 0x330) != '\0') {
      uVar8 = *(ulong *)(lVar7 + 0x338);
    }
    uVar11 = 0xd;
    if (uVar8 < 0xd) {
      uVar11 = uVar8;
    }
    puVar12 = *(undefined2 **)(uVar11 * 0x38 + 0x14732e768);
    func_0x000140002200();
    puVar9 = (undefined2 *)func_0x0001400021c0();
    if (puVar9 != (undefined2 *)0x0) {
      *puVar9 = *puVar12;
      param_4[0x30] = param_6;
      *param_4 = local_78;
      param_4[1] = uStack_70;
      param_4[2] = local_68;
      *(char *)((long)param_4 + 0x1db) = cVar2;
      *(undefined1 *)((long)param_4 + 0x1dc) = uVar3;
      *(undefined1 *)((long)param_4 + 0x1dd) = uVar4;
      *(undefined4 *)((long)param_4 + 0x1de) = *(undefined4 *)(param_5 + 0x3b);
      *(undefined1 *)((long)param_4 + 0x1e2) = *(undefined1 *)(param_5 + 0x3f);
      param_4[0x31] = local_130;
      param_4[0x32] = uStack_128;
      *(undefined4 *)(param_4 + 0x33) = local_120;
      *(undefined4 *)((long)param_4 + 0x19c) = uStack_11c;
      *(undefined4 *)(param_4 + 0x34) = uStack_118;
      *(undefined4 *)((long)param_4 + 0x1a4) = uStack_114;
      *(undefined4 *)(param_4 + 0x35) = local_110;
      *(undefined4 *)((long)param_4 + 0x1ac) = uStack_10c;
      *(undefined4 *)(param_4 + 0x36) = uStack_108;
      *(undefined4 *)((long)param_4 + 0x1b4) = uStack_104;
      *(undefined4 *)(param_4 + 0x37) = local_100;
      *(undefined4 *)((long)param_4 + 0x1bc) = uStack_fc;
      *(undefined4 *)(param_4 + 0x38) = uStack_f8;
      *(undefined4 *)((long)param_4 + 0x1c4) = uStack_f4;
      *(undefined4 *)((long)param_4 + 0x1c4) = uStack_f4;
      *(undefined4 *)(param_4 + 0x39) = uStack_f0;
      *(undefined4 *)((long)param_4 + 0x1cc) = uStack_ec;
      *(undefined4 *)(param_4 + 0x3a) = uStack_e8;
      func_0x000145d145fb();
      param_4[3] = local_98;
      param_4[4] = uStack_90;
      param_4[5] = local_88;
      *(undefined4 *)(param_4 + 0x2e) = local_c0;
      *(undefined4 *)((long)param_4 + 0x174) = uStack_bc;
      *(undefined4 *)(param_4 + 0x2f) = uStack_b8;
      *(undefined4 *)((long)param_4 + 0x17c) = uStack_b4;
      *(undefined4 *)(param_4 + 0x2a) = local_e0;
      *(undefined4 *)((long)param_4 + 0x154) = uStack_dc;
      *(undefined4 *)(param_4 + 0x2b) = uStack_d8;
      *(undefined4 *)((long)param_4 + 0x15c) = uStack_d4;
      *(undefined4 *)(param_4 + 0x2c) = local_d0;
      *(undefined4 *)((long)param_4 + 0x164) = uStack_cc;
      *(undefined4 *)(param_4 + 0x2d) = uStack_c8;
      *(undefined4 *)((long)param_4 + 0x16c) = uStack_c4;
      *(undefined2 *)(param_4 + 0x3b) = 0;
      *(undefined1 *)((long)param_4 + 0x1da) = 1;
      param_4[9] = 0xffffffffffffffff;
      *(undefined4 *)((long)param_4 + 0x1d4) = uVar6;
      *(undefined1 *)((long)param_4 + 0x1e3) = uVar13;
      param_4[6] = 2;
      param_4[7] = puVar9;
      param_4[8] = 2;
      if (uVar14 != 0) {
        func_0x0001400021d0();
      }
      return param_4;
    }
    func_0x000145eb6fcb();
  }
  else {
LAB_1458165e2:
    func_0x000145eb6fcb();
  }
                    /* WARNING: Does not return */
  pcVar5 = (code *)invalidInstructionException();
  (*pcVar5)();
}
