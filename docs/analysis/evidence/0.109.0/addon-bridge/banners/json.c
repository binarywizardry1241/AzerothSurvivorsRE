long * FUN_1458eaaa0(undefined8 param_1,undefined8 param_2,long param_3,long *param_4)

{
  byte bVar1;
  code *pcVar2;
  undefined1 *puVar3;
  long lVar4;
  ulong uVar5;
  undefined4 local_78;
  undefined4 uStack_74;
  undefined4 uStack_70;
  undefined4 uStack_6c;
  long local_68;
  undefined8 local_58;
  undefined8 uStack_50;

  func_0x000140002200();
  puVar3 = (undefined1 *)func_0x0001400021c0();
  if (puVar3 != (undefined1 *)0x0) {
    *puVar3 = 0x7b;
    FUN_1458eb720();
    FUN_1458e6910();
    FUN_1458eb720();
    FUN_1458eb720();
    FUN_1458eb720();
    bVar1 = *(byte *)(param_3 + 0x40);
    FUN_1458eb470();
    uVar5 = (ulong)bVar1 ^ 5;
    if ((ulong)(CONCAT44(uStack_74,local_78) - local_68) < uVar5) {
      func_0x000145bfa970();
    }
    func_0x000145bfa0e7();
    lVar4 = local_68 + uVar5;
    local_58 = CONCAT44(uStack_74,local_78);
    uStack_50 = CONCAT44(uStack_6c,uStack_70);
    if (local_58 == lVar4) {
      func_0x000145bfa970();
    }
    *(undefined1 *)(uStack_50 + lVar4) = 0x7d;
    param_4[2] = lVar4 + 1;
    *param_4 = local_58;
    param_4[1] = uStack_50;
    return param_4;
  }
  func_0x000145d992bb();
                    /* WARNING: Does not return */
  pcVar2 = (code *)invalidInstructionException();
  (*pcVar2)();
}
