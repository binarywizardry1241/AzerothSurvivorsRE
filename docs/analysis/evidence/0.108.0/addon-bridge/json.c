long * FUN_1458e3d30(undefined8 param_1,undefined8 param_2,long param_3,long *param_4)

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
    func_0x0001458e49b0();
    FUN_1458dfba0();
    func_0x0001458e49b0();
    func_0x0001458e49b0();
    func_0x0001458e49b0();
    bVar1 = *(byte *)(param_3 + 0x40);
    func_0x0001458e4700();
    uVar5 = (ulong)bVar1 ^ 5;
    if ((ulong)(CONCAT44(uStack_74,local_78) - local_68) < uVar5) {
      func_0x000145bf4a90();
    }
    func_0x000145bf293b();
    lVar4 = local_68 + uVar5;
    local_58 = CONCAT44(uStack_74,local_78);
    uStack_50 = CONCAT44(uStack_6c,uStack_70);
    if (local_58 == lVar4) {
      func_0x000145bf4a90();
    }
    *(undefined1 *)(uStack_50 + lVar4) = 0x7d;
    param_4[2] = lVar4 + 1;
    *param_4 = local_58;
    param_4[1] = uStack_50;
    return param_4;
  }
  func_0x000145d934fb();
                    /* WARNING: Does not return */
  pcVar2 = (code *)invalidInstructionException();
  (*pcVar2)();
}
