void entry(undefined8 param_1,undefined8 param_2,long *param_3,long param_4)

{
  uint uVar1;
  code *pcVar2;
  uint uVar3;
  ulong uVar4;
  long lVar5;
  uint uVar6;

  uVar6 = *(uint *)(param_3 + 1);
  uVar1 = *(uint *)((long)param_3 + 0xc);
  uVar3 = uVar1 - uVar6;
  if (uVar1 < uVar6) {
    uVar3 = 0;
  }
  lVar5 = *param_3;
  uVar4 = (ulong)(uVar3 & 1) + (ulong)(uVar3 >> 1);
  if (*(long *)(param_4 + 0x18) == 0) {
    uVar4 = (ulong)uVar3;
  }
  if (*(ulong *)(param_4 + 0x10) < uVar4) {
    func_0x000145d4e060(lVar5,param_4,uVar4,param_4,param_4 + 0x20,1);
  }
  if (uVar6 < uVar1) {
    do {
      if (*(ulong *)(lVar5 + 0x10) < (ulong)(*(int *)(lVar5 + 0x28) * uVar6) + 0x18) {
        func_0x000145d699f0();
                    /* WARNING: Does not return */
        pcVar2 = (code *)invalidInstructionException();
        (*pcVar2)();
      }
      uVar6 = uVar6 + 1;
      func_0x000145873b10();
      func_0x0001458ba8b0();
    } while (uVar1 != uVar6);
  }
  return;
}
