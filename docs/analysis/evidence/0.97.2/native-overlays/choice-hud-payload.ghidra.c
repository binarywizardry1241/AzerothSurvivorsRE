
void entry(undefined8 param_1,undefined8 param_2,long param_3,undefined8 *param_4)

{
  byte bVar1;
  int iVar2;
  long lVar3;
  long lVar4;
  code *pcVar5;
  int iVar6;
  undefined1 *puVar7;
  undefined1 *puVar8;
  ulong uVar9;
  ulong uVar10;
  ulong uVar11;
  long lVar12;
  long lVar13;
  long local_180;
  long local_178;
  long local_170;
  long local_138;
  undefined1 *local_130;
  long local_128;
  long local_b8;
  undefined1 *puStack_b0;
  long local_a8;
  long local_78;
  long local_68;

  func_0x000140002200();
  puVar7 = (undefined1 *)func_0x0001400021c0();
  if (puVar7 == (undefined1 *)0x0) {
    func_0x0001458e721b();
                    /* WARNING: Does not return */
    pcVar5 = (code *)invalidInstructionException();
    (*pcVar5)();
  }
  *puVar7 = 0x5b;
  lVar3 = *(long *)(param_3 + 0x570);
  lVar12 = *(long *)(param_3 + 0x308);
  lVar13 = *(long *)(param_3 + 0x318);
  uVar9 = *(ulong *)(param_3 + 0x2b8);
  lVar4 = *(long *)(param_3 + 0x2b0);
  uVar10 = *(ulong *)(param_3 + 0x2a0);
  iVar2 = *(int *)(param_3 + 0x948);
  uVar11 = 0x8000000000000000;
  if (lVar3 == *(long *)(param_3 + 0x578) * 0xa0 + lVar3) {
    func_0x000140002200();
    puVar8 = (undefined1 *)func_0x0001400021c0();
    if (puVar8 != (undefined1 *)0x0) {
      *puVar8 = 0x7b;
      func_0x000145451620();
      func_0x000145451620();
      func_0x00014544e7c0();
      func_0x00014544e7c0();
      func_0x00014544e7c0();
      func_0x00014544e7c0();
      func_0x00014544e7c0();
      bVar1 = *(byte *)(param_3 + 0x20e);
      func_0x000145451370();
      if ((ulong)(local_b8 - local_a8) < ((ulong)bVar1 ^ 5)) {
        func_0x000145757d40();
      }
      func_0x000145756ddd();
      func_0x00014544e7c0();
      local_68 = 1;
      func_0x000145757d40();
      puVar7[1] = 0x5d;
      func_0x0001454514e0();
      func_0x000145757d40();
      puVar7[local_68] = 0x7d;
      param_4[2] = local_68 + 1;
      *param_4 = 1;
      param_4[1] = puVar7;
      return;
    }
    func_0x0001458e721b();
LAB_1454ddbdd:
                    /* WARNING: Does not return */
    pcVar5 = (code *)invalidInstructionException();
    (*pcVar5)();
  }
  func_0x000140002200();
  puVar7 = (undefined1 *)func_0x0001400021c0();
  if (puVar7 == (undefined1 *)0x0) {
    func_0x0001458e721b();
    goto LAB_1454ddbdd;
  }
  *puVar7 = 0x7b;
  uVar11 = *(ulong *)(lVar3 + 0x78) ^ uVar11;
  if (-1 < (long)*(ulong *)(lVar3 + 0x78)) {
    uVar11 = 1;
  }
  if (uVar11 == 1) {
    if (uVar10 <= *(ulong *)(lVar3 + 0x90)) {
LAB_1454dcfb0:
      local_b8 = 1;
      local_a8 = 1;
      puStack_b0 = puVar7;
      goto joined_r0x0001454dcfbc;
    }
    func_0x00014544e7c0();
  }
  else if (uVar11 == 2) {
    if (uVar9 != 0) {
      lVar12 = *(long *)(*(long *)(lVar3 + 0x80) + 8);
      lVar13 = 0;
      do {
        if ((*(long *)(*(long *)(lVar4 + lVar13) + 8) == lVar12) &&
           (iVar6 = func_0x000145756dd7(), iVar6 == 0)) {
          func_0x00014544e7c0();
          goto joined_r0x0001454dd16e;
        }
        lVar13 = lVar13 + 0x18;
      } while (uVar9 * 0x18 != lVar13);
      if (uVar9 != 1) {
        uVar10 = 0;
        do {
          uVar10 = uVar10 + 2;
        } while ((uVar9 & 0xfffffffffffffffe) != uVar10);
      }
    }
    func_0x00014544e7c0();
  }
  else {
    if ((uVar11 != 3) || (lVar12 == -1)) goto LAB_1454dcfb0;
    if ((lVar13 == *(long *)(*(long *)(lVar3 + 0x80) + 0x10)) &&
       (iVar6 = func_0x000145756dd7(), iVar6 == 0)) {
      func_0x00014544e7c0();
    }
    else {
      func_0x000145451620();
      func_0x000145414120();
      func_0x000145455eb0();
      func_0x000145451620();
      func_0x000145451620();
      func_0x00014544e7c0();
      func_0x00014544e7c0();
      func_0x0001400021d0();
      if (local_170 != 0) {
        lVar12 = local_178 + 8;
        do {
          if (*(long *)(lVar12 + -8) != 0) {
            func_0x0001400021d0();
          }
          lVar12 = lVar12 + 0x18;
          local_170 = local_170 + -1;
        } while (local_170 != 0);
      }
      puStack_b0 = local_130;
      local_b8 = local_138;
      local_a8 = local_128;
      if (local_180 != 0) {
        func_0x0001400021d0();
        local_a8 = local_128;
      }
    }
  }
joined_r0x0001454dd16e:
  local_78 = 1;
joined_r0x0001454dcfbc:
  if ((iVar2 != 0) && (func_0x0001454da3d0(), local_78 != -1)) {
    if (local_78 != 0) {
      func_0x0001400021d0();
    }
    func_0x000145451370();
    if ((ulong)(local_b8 - local_a8) < 4) {
      func_0x000145757d40();
    }
    *(undefined4 *)(puStack_b0 + local_a8) = 0x65757274;
  }
  func_0x000145451620();
  func_0x000145451620();
  func_0x000145455eb0();
  uVar9 = 0;
  func_0x000145451620();
  func_0x000145451620();
  func_0x000145451620();
  func_0x00014544e7c0();
  func_0x000145458e00();
  func_0x000145451620();
  uVar9 = *(ulong *)(lVar3 + 0x78) ^ uVar9;
  if (-1 < (long)*(ulong *)(lVar3 + 0x78)) {
    uVar9 = 1;
  }
                    /* WARNING: Could not recover jumptable at 0x0001454dd4d9. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)((long)*(int *)(uVar9 * 4 + 0x1469ace0c) + 0x1469ace0c))();
  return;
}
