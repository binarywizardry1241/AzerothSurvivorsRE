
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,undefined8 *param_3,long param_4)

{
  long *plVar1;
  undefined4 *puVar2;
  undefined8 *puVar3;
  long lVar4;
  long lVar5;
  code *pcVar6;
  int iVar7;
  long lVar8;
  long lVar9;
  long lVar10;
  long lVar11;
  undefined4 uVar12;
  undefined4 uVar13;
  undefined4 uVar14;
  undefined4 uVar15;
  undefined4 uVar16;
  undefined4 uVar17;
  undefined4 uVar18;
  undefined4 uVar19;
  undefined4 uVar20;
  undefined4 uVar21;
  uint uVar22;
  uint uVar23;
  undefined4 uVar24;
  undefined4 uVar25;
  undefined4 uVar26;
  undefined4 uVar27;
  undefined4 uVar28;
  undefined4 uVar29;
  undefined4 uVar30;
  undefined4 uVar31;
  undefined4 uVar32;
  undefined4 uVar33;
  undefined4 uVar34;
  undefined4 uStack_bc;

  lVar11 = *(long *)(param_4 + 8);
  lVar4 = *(long *)(param_4 + 0x18);
  lVar10 = param_3[2];
  uVar12 = 0;
  uVar14 = 0;
  uVar16 = 0;
  uVar18 = 0;
  uVar20 = (int)((ulong)_DAT_1459186d0 >> 0x20);
  uVar22 = (uint)_DAT_145907550;
  uVar24 = (int)((ulong)_DAT_145907550 >> 0x20);
  uVar26 = _DAT_1459186e0;
  uVar28 = uRam00000001459186e4;
  uVar30 = uRam00000001459186e8;
  uVar32 = uRam00000001459186ec;
  do {
    if (lVar11 == lVar4) {
      if (*(long *)(param_4 + 0x10) != 0) {
        func_0x0001400021d0();
      }
      *(undefined8 *)*param_3 = param_3[1];
      return;
    }
    lVar5 = *(long *)(lVar11 + 8);
    uVar34 = *(undefined4 *)(lVar11 + 0x10);
    lVar11 = lVar11 + 0x18;
    lVar9 = 0;
    while ((*(long *)(lVar9 + 0x146736b50) != lVar5 || (iVar7 = func_0x0001457731e7(), iVar7 != 0)))
    {
      lVar9 = lVar9 + 0x78;
      if (lVar9 == 0x3480) {
        func_0x000145903d10();
                    /* WARNING: Does not return */
        pcVar6 = (code *)invalidInstructionException();
        (*pcVar6)();
      }
    }
    uVar13 = uVar12;
    uVar15 = uVar14;
    uVar17 = uVar16;
    uVar19 = uVar18;
    uVar21 = uVar20;
    uVar23 = uVar22;
    uVar25 = uVar24;
    uVar27 = uVar26;
    uVar29 = uVar28;
    uVar31 = uVar30;
    uVar33 = uVar32;
    func_0x000145451c30();
    lVar5 = param_3[1];
    lVar8 = lVar5 * 0x60;
    *(ulong *)(lVar10 + 0x50 + lVar8) = CONCAT44(uStack_bc,uVar32);
    puVar2 = (undefined4 *)(lVar10 + 0x40 + lVar8);
    *puVar2 = 0;
    puVar2[1] = uVar26;
    puVar2[2] = uVar28;
    puVar2[3] = uVar30;
    puVar2 = (undefined4 *)(lVar10 + 0x30 + lVar8);
    *puVar2 = uVar18;
    puVar2[1] = 0;
    puVar2[2] = uVar22;
    puVar2[3] = uVar24;
    puVar2 = (undefined4 *)(lVar10 + 0x20 + lVar8);
    *puVar2 = uVar24;
    puVar2[1] = uVar12;
    puVar2[2] = uVar14;
    puVar2[3] = uVar16;
    puVar3 = (undefined8 *)(lVar10 + 0x10 + lVar8);
    *puVar3 = CONCAT44(0x3f800000,uVar20);
    puVar3[1] = (ulong)uVar22 << 0x20;
    plVar1 = (long *)(lVar10 + lVar8);
    *plVar1 = lVar9 + 0x146736b48;
    *(undefined4 *)(plVar1 + 1) = 1;
    *(undefined4 *)((long)plVar1 + 0xc) = 0x3fc00000;
    *(undefined4 *)(lVar10 + 0x58 + lVar8) = uVar34;
    param_3[1] = lVar5 + 1;
    uVar12 = uVar13;
    uVar14 = uVar15;
    uVar16 = uVar17;
    uVar18 = uVar19;
    uVar20 = uVar21;
    uVar22 = uVar23;
    uVar24 = uVar25;
    uVar26 = uVar27;
    uVar28 = uVar29;
    uVar30 = uVar31;
    uVar32 = uVar33;
  } while( true );
}
