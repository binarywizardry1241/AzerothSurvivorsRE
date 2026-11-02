
/* WARNING: Removing unreachable block (ram,0x000145b90aac) */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 *
entry(undefined8 param_1,undefined8 param_2,long param_3,undefined4 *param_4,long param_5)

{
  long *plVar1;
  byte bVar2;
  ulong uVar3;
  code *pcVar4;
  bool bVar5;
  undefined1 *puVar6;
  long lVar7;
  ulong uVar8;
  long lVar9;
  long lVar10;
  undefined1 *puVar11;
  long lVar12;
  long extraout_RDX;
  long *plVar13;
  long lVar14;
  ulong uVar15;
  ulong uVar16;
  long lVar17;
  long lVar18;
  long local_188;
  undefined1 *local_180;
  long local_178;
  long local_b8;
  undefined8 local_a8;
  undefined8 uStack_a0;
  long local_98;
  
  func_0x000140002200();
  puVar6 = (undefined1 *)func_0x0001400021c0();
  if (puVar6 == (undefined1 *)0x0) {
    func_0x00014620896b();
                    /* WARNING: Does not return */
    pcVar4 = (code *)invalidInstructionException();
    (*pcVar4)();
  }
  *puVar6 = 0x5b;
  lVar17 = *(long *)(param_3 + 8);
  uVar3 = *(ulong *)(param_3 + 0x10);
  lVar7 = uVar3 * 0xb8 + lVar17;
  uVar8 = (ulong)((uint)uVar3 & 3);
  uVar16 = uVar3 & 0xfffffffffffffffc;
  plVar1 = (long *)(lVar17 + 0x2c8);
  lVar12 = lVar17 + 0xa0;
  local_b8 = 0;
  lVar9 = 1;
  lVar18 = 1;
  do {
    if (lVar17 == lVar7) {
      func_0x000140002200();
      puVar11 = (undefined1 *)func_0x0001400021c0();
      if (puVar11 != (undefined1 *)0x0) {
        *puVar11 = 0x7b;
        func_0x000145b7eac0();
        if (lVar18 == lVar9) {
          func_0x000146061b30();
        }
        puVar6[lVar9] = 0x5d;
        func_0x000145b7e980();
        lVar12 = func_0x000145b05300();
        func_0x000146034470();
        func_0x000145be82d0();
        if (local_a8 != 0) {
          func_0x0001400021d0();
        }
        func_0x000145b7eac0();
        func_0x000145b77380();
        func_0x000145b2cdb0();
        func_0x000145b7eac0();
        if (local_a8 == local_98) {
          func_0x000146061b30();
        }
        uStack_a0[local_98] = 0x7d;
        *(long *)(param_4 + 4) = local_98 + 1;
        *param_4 = (undefined4)local_a8;
        param_4[1] = local_a8._4_4_;
        param_4[2] = (undefined4)uStack_a0;
        param_4[3] = uStack_a0._4_4_;
        if (lVar12 * 0xf0 != -0x14703a5b8) {
          func_0x0001400021d0();
        }
        return param_4;
      }
      func_0x00014620896b();
LAB_145b910a0:
                    /* WARNING: Does not return */
      pcVar4 = (code *)invalidInstructionException();
      (*pcVar4)();
    }
    func_0x000140002200();
    uStack_a0 = (undefined1 *)func_0x0001400021c0();
    if (uStack_a0 == (undefined1 *)0x0) {
      func_0x00014620896b();
      goto LAB_145b910a0;
    }
    *uStack_a0 = 0x7b;
    func_0x000145b7eac0();
    func_0x00014603b5e0();
    if (extraout_RDX < 0) {
LAB_145b90cf3:
      func_0x00014620896b();
      goto LAB_145b910a0;
    }
    if (extraout_RDX != 0) {
      func_0x000140002200();
      lVar9 = func_0x0001400021c0();
      if (lVar9 == 0) goto LAB_145b90cf3;
      func_0x00014606171b();
    }
    func_0x000145b7eac0();
    func_0x000146034470();
    func_0x000145be82d0();
    if (local_a8 != 0) {
      func_0x0001400021d0();
    }
    func_0x000145b7eac0();
    func_0x000145af24d0();
    func_0x000145b7eac0();
    func_0x000145b77380();
    func_0x000145b77500();
    bVar2 = *(byte *)(lVar17 + 0xb0);
    func_0x000145b7e810();
    uVar15 = (ulong)bVar2 ^ 5;
    if (uVar15 != 0) {
      func_0x000146061b30();
    }
    func_0x00014606171b();
    lVar9 = uVar15 + 1;
    func_0x000145b77080();
    func_0x000145b7eac0();
    func_0x000145b7e810();
    uVar15 = 5 - (ulong)(local_b8 == 0);
    if (1U - lVar9 < uVar15) {
      func_0x000146061b30();
    }
    func_0x00014606171b();
    lVar9 = lVar9 + uVar15;
    lVar18 = *(long *)(lVar17 + 0xa0);
    func_0x000145b7e810();
    uVar15 = (ulong)(lVar18 == param_5) ^ 5;
    if (1U - lVar9 < uVar15) {
      func_0x000146061b30();
    }
    func_0x00014606171b();
    lVar9 = lVar9 + uVar15;
    if (uVar3 == 0) {
      bVar5 = false;
    }
    else {
      if (*(long *)(lVar17 + 0x30) != -1) {
        lVar18 = *(long *)(lVar17 + 0xa0);
        if (uVar3 - 1 < 3) {
          uVar15 = 0;
          lVar10 = 0;
LAB_145b90a43:
          lVar14 = 0;
          do {
            lVar10 = lVar10 + (ulong)(*(long *)(uVar15 * 0xb8 + lVar12 + lVar14) == lVar18);
            lVar14 = lVar14 + 0xb8;
          } while (uVar8 * 0xb8 - lVar14 != 0);
        }
        else {
          uVar15 = 0;
          lVar10 = 0;
          plVar13 = plVar1;
          do {
            lVar10 = (ulong)(*plVar13 == lVar18) +
                     (ulong)(plVar13[-0x17] == lVar18) + (ulong)(plVar13[-0x2e] == lVar18) +
                     (ulong)(plVar13[-0x45] == lVar18) + lVar10;
            uVar15 = uVar15 + 4;
            plVar13 = plVar13 + 0x5c;
          } while (uVar16 != uVar15);
          if (uVar8 != 0) goto LAB_145b90a43;
        }
        if (lVar10 == 1) {
          func_0x00014600efe0();
          func_0x00014600ef90();
          func_0x000145b05cc0();
          bVar5 = true;
          goto LAB_145b90b56;
        }
      }
      bVar5 = false;
    }
LAB_145b90b56:
    func_0x000145b7eac0();
    if (lVar9 == 1) {
      func_0x000146061b30();
    }
    uStack_a0[lVar9] = 0x7d;
    local_98 = lVar9 + 1;
    local_a8 = 1;
    func_0x000145b7e380();
    puVar6 = local_180;
    if (bVar5) {
      func_0x0001400021d0();
    }
    lVar17 = lVar17 + 0xb8;
    local_b8 = local_b8 + 1;
    lVar9 = local_178;
    lVar18 = local_188;
    if (extraout_RDX != 0) {
      func_0x0001400021d0();
    }
  } while( true );
}

