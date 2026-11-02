void FUN_1458dda90(undefined8 param_1,undefined8 param_2,undefined4 param_3,long param_4,
                  undefined4 *param_5)

{
  byte *pbVar1;
  byte bVar2;
  code *pcVar3;
  ulong uVar4;
  uint uVar5;
  uint uVar6;
  uint uVar7;
  byte *pbVar8;
  long lVar9;
  uint uVar10;
  long lVar11;
  long lVar12;
  byte bVar13;
  undefined8 *puVar14;
  ulong uVar15;
  int iVar16;
  long lVar17;
  long lVar18;
  undefined4 uStack_a8;
  undefined4 uStack_a4;
  undefined4 uStack_a0;
  undefined4 uStack_9c;
  undefined8 uStack_98;
  undefined8 uStack_90;
  long lStack_88;
  ulong uStack_80;
  long lStack_78;
  long lStack_70;
  ulong uStack_68;
  long lStack_60;
  long lStack_58;
  undefined1 uStack_49;
  undefined8 uStack_48;

  uStack_48 = 0xfffffffffffffffe;
  uStack_98 = *(undefined8 *)(param_5 + 4);
  uStack_a8 = *param_5;
  uStack_a4 = param_5[1];
  uStack_a0 = param_5[2];
  uStack_9c = param_5[3];
  lVar17 = *(long *)(param_4 + 0x68);
  lVar12 = *(long *)(param_4 + 0x70);
  lVar18 = lVar12 * 0x20;
  uVar7 = 0;
  lVar11 = 0;
  do {
    bVar13 = (byte)param_3;
    if (lVar18 == lVar11) goto LAB_1458ddaf8;
    lVar9 = lVar11 + 0x20;
    pbVar1 = (byte *)(lVar17 + 4 + lVar11);
    lVar11 = lVar9;
  } while (*pbVar1 != bVar13);
  uVar7 = *(uint *)(lVar17 + -0x20 + lVar9);
LAB_1458ddaf8:
  uVar10 = 0x6e;
  iVar16 = 2;
  do {
    uVar5 = uVar7 - (uVar10 - 0x1e);
    if (uVar7 < uVar10 - 0x1e) {
      iVar16 = iVar16 + -2;
      goto LAB_1458ddb42;
    }
    uVar6 = uVar5 - (uVar10 - 0xf);
    if (uVar5 < uVar10 - 0xf) {
      iVar16 = iVar16 + -1;
      goto LAB_1458ddb42;
    }
    uVar7 = uVar6 - uVar10;
    if (uVar6 < uVar10) goto LAB_1458ddb42;
    uVar10 = uVar10 + 0x2d;
    iVar16 = iVar16 + 3;
  } while (uVar10 != 0x36b);
  iVar16 = 0x33;
LAB_1458ddb42:
  FUN_14599fe20(param_1,param_4,&uStack_a8,&uStack_90,param_3,iVar16);
  uVar4 = uStack_80;
  lVar11 = *(long *)(param_4 + 0x88) * 0x50;
  pbVar1 = (byte *)(*(long *)(param_4 + 0x80) + -0x4f);
  do {
    pbVar8 = pbVar1;
    if (lVar11 == 0) goto LAB_1458ddc7e;
    lVar11 = lVar11 + -0x50;
    pbVar1 = pbVar8 + 0x50;
  } while (pbVar8[0x4f] != bVar13);
  lStack_58 = lStack_88;
  lStack_60 = lVar12;
  if (uStack_80 << 4 < 0x7ffffffffffffff9 && uStack_80 >> 0x3c == 0) {
    if (uStack_80 << 4 == 0) {
      lStack_70 = 8;
      uStack_68 = 0;
      uVar15 = uStack_68;
    }
    else {
      func_0x000140002200();
      lStack_70 = func_0x0001400021c0();
      uVar15 = uVar4;
      if (lStack_70 == 0) goto LAB_1458ddbc0;
    }
    uStack_68 = uVar15;
    if (uVar4 != 0) {
      func_0x000145c0a3db();
    }
    bVar2 = pbVar8[0x50];
    uVar15 = (ulong)bVar2;
    if (uVar15 < 3) {
      lVar12 = (ulong)((uint)bVar2 * 8) * 3;
      if (*(long *)(pbVar8 + lVar12 + 0x57) != 0) {
        lStack_58 = lVar12;
        func_0x0001400021d0();
        lVar12 = lStack_58;
      }
      *(ulong *)(pbVar8 + lVar12 + 0x57) = uStack_68;
      *(long *)(pbVar8 + uVar15 * 0x18 + 0x5f) = lStack_70;
      *(ulong *)(pbVar8 + uVar15 * 0x18 + 0x67) = uVar4;
      lVar12 = lStack_60;
LAB_1458ddc7e:
      lVar9 = 0;
      lVar11 = lVar17;
      do {
        if (lVar18 == lVar9) {
          if (lVar12 == *(long *)(param_4 + 0x60)) {
            lStack_60 = uStack_90;
            lStack_58 = lStack_88;
            func_0x000145c0dbd0();
            lVar17 = *(long *)(param_4 + 0x68);
            lStack_88 = lStack_58;
            uStack_90 = lStack_60;
          }
          *(undefined4 *)(lVar17 + lVar18) = 0;
          *(byte *)(lVar17 + 4 + lVar18) = bVar13;
          *(long *)(lVar17 + 8 + lVar18) = uStack_90;
          *(long *)(lVar17 + 0x10 + lVar18) = lStack_88;
          *(ulong *)(lVar17 + 0x18 + lVar18) = uStack_80;
          *(long *)(param_4 + 0x70) = lVar12 + 1;
          return;
        }
        lVar9 = lVar9 + 0x20;
        pbVar1 = (byte *)(lVar11 + 4);
        lVar11 = lVar11 + 0x20;
      } while (*pbVar1 != bVar13);
      puVar14 = (undefined8 *)(lVar17 + lVar9 + -0x18);
      if (*(long *)(lVar17 + -0x18 + lVar9) != 0) {
        func_0x0001400021d0();
      }
      puVar14[2] = uStack_80;
      *puVar14 = uStack_90;
      puVar14[1] = lStack_88;
      return;
    }
    func_0x000145da9883();
  }
  else {
LAB_1458ddbc0:
    lStack_78 = lStack_58;
    uStack_49 = 1;
    func_0x000145da94eb();
  }
                    /* WARNING: Does not return */
  pcVar3 = (code *)invalidInstructionException();
  (*pcVar3)();
}
