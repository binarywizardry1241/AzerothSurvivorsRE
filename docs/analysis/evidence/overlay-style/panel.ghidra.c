/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

long entry(void)

{
  code *pcVar1;
  uint uVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  undefined4 uVar8;
  undefined4 uVar9;
  undefined4 *puVar10;
  undefined8 *puVar11;
  long in_RCX;
  undefined4 uVar12;
  undefined4 uVar13;
  undefined4 uVar14;
  undefined4 uVar15;
  undefined4 local_78;
  undefined4 uStack_74;
  undefined4 uStack_70;
  undefined4 uStack_6c;
  undefined4 uStack_44;

  uVar9 = uRam0000000145dd6794;
  uVar8 = uRam0000000145dd6790;
  uVar7 = uRam0000000145dd678c;
  uVar6 = _DAT_145dd6788;
  func_0x000140002200();
  puVar10 = (undefined4 *)func_0x0001400021c0();
  if (puVar10 == (undefined4 *)0x0) {
    func_0x000145d992a1();
  }
  else {
    func_0x000144c7dcf0();
    uVar5 = uRam0000000145dd4bfc;
    uVar4 = uRam0000000145dd4bf8;
    uVar3 = uRam0000000145dd4bf4;
    uVar2 = _DAT_145dd4bf0;
    uVar12 = local_78;
    uVar13 = uStack_74;
    uVar14 = uStack_70;
    uVar15 = uStack_6c;
    func_0x000144c7dcf0();
    *puVar10 = 0;
    puVar10[2] = 1;
    puVar10[3] = uVar12;
    puVar10[4] = uVar13;
    puVar10[5] = uVar14;
    puVar10[6] = uVar15;
    *(undefined8 *)(puVar10 + 7) = 0x3f000000;
    puVar10[10] = 1;
    puVar10[0xb] = local_78;
    puVar10[0xc] = uStack_74;
    puVar10[0xd] = uStack_70;
    puVar10[0xe] = uStack_6c;
    puVar10[0xf] = 0x3f000000;
    func_0x000140002200();
    puVar11 = (undefined8 *)func_0x0001400021c0();
    if (puVar11 != (undefined8 *)0x0) {
      puVar11[1] = 2;
      puVar11[2] = puVar10;
      puVar11[3] = 2;
      *(undefined4 *)(puVar11 + 4) = 0x40490fdb;
      *(undefined1 *)((long)puVar11 + 0x24) = 0;
      *puVar11 = 0x8000000000000000;
      func_0x000144c7dcf0();
      func_0x000142649b80();
      func_0x000145bfa0e7();
      *(ulong *)(in_RCX + 0x1d8) = CONCAT44(uVar8,uVar7);
      *(ulong *)(in_RCX + 0x1e0) = CONCAT44(0x3f800000,uVar9);
      *(ulong *)(in_RCX + 0x1c8) = CONCAT44(uVar9,uVar8);
      *(ulong *)(in_RCX + 0x1d0) = CONCAT44(uVar6,0x3f800000);
      *(ulong *)(in_RCX + 0x1b8) = CONCAT44(0x3f800000,uVar9);
      *(ulong *)(in_RCX + 0x1c0) = CONCAT44(uVar7,uVar6);
      *(ulong *)(in_RCX + 0x1a8) = CONCAT44(uVar6,0x3f800000);
      *(ulong *)(in_RCX + 0x1b0) = CONCAT44(uVar8,uVar7);
      *(ulong *)(in_RCX + 0x198) = CONCAT44(uVar7,uVar6);
      *(ulong *)(in_RCX + 0x1a0) = CONCAT44(uVar9,uVar8);
      *(undefined8 *)(in_RCX + 0x180) = 1;
      *(undefined8 **)(in_RCX + 0x188) = puVar11;
      *(undefined8 *)(in_RCX + 400) = 1;
      *(ulong *)(in_RCX + 0x1e8) = (ulong)uVar2 << 0x20;
      *(ulong *)(in_RCX + 0x1f0) = CONCAT44(uVar4,uVar3);
      *(ulong *)(in_RCX + 0x1f8) = CONCAT44(uStack_44,uVar5);
      return in_RCX;
    }
    func_0x000145d992a1();
  }
                    /* WARNING: Does not return */
  pcVar1 = (code *)invalidInstructionException();
  (*pcVar1)();
}
