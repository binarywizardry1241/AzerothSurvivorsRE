undefined1  [16] entry(undefined8 param_1,undefined8 param_2,int param_3,long param_4,int param_5)

{
  ulong uVar1;
  long lVar2;
  code *pcVar3;
  long lVar4;
  ulong uVar5;
  undefined8 uVar6;
  ulong uVar7;
  undefined8 uVar8;
  long lVar9;
  undefined1 auVar10 [16];
  char local_18 [8];
  undefined8 local_10;
  undefined8 local_8;

  uVar1 = *(ulong *)(param_4 + 0x10);
  uVar7 = (ulong)(uint)(param_3 * *(int *)(param_4 + 0x28) + param_5 * 4);
  if (uVar1 < uVar7 + 0x18) {
    func_0x000145d699f0();
                    /* WARNING: Does not return */
    pcVar3 = (code *)invalidInstructionException();
    (*pcVar3)();
  }
  lVar2 = *(long *)(param_4 + 8);
  uVar7 = (ulong)*(uint *)(lVar2 + 0x14 + uVar7) + *(long *)(param_4 + 0x18);
  if (uVar1 < uVar7) {
    func_0x000145d699f0(param_1,param_2,uVar1,uVar7,uVar1,0x146ba0cd0);
                    /* WARNING: Does not return */
    pcVar3 = (code *)invalidInstructionException();
    (*pcVar3)();
  }
  uVar5 = uVar1;
  if (uVar7 != uVar1) {
    lVar9 = 0;
    lVar4 = lVar2;
    do {
      if (*(char *)(lVar4 + uVar7) == '\0') {
        uVar5 = uVar7 - lVar9;
        break;
      }
      lVar9 = lVar9 + -1;
      lVar4 = lVar4 + 1;
    } while (uVar7 - uVar1 != lVar9);
  }
  if ((uVar7 <= uVar5) && (uVar5 <= uVar1)) {
    func_0x000145ba4cf0(param_1,param_2,lVar2 + uVar7,local_18,uVar5 - uVar7);
    uVar8 = 0;
    if (local_18[0] == '\0') {
      uVar8 = local_8;
    }
    uVar6 = 1;
    if (local_18[0] == '\0') {
      uVar6 = local_10;
    }
    auVar10._8_8_ = uVar8;
    auVar10._0_8_ = uVar6;
    return auVar10;
  }
  func_0x000145d699f0(param_1,param_2,uVar5,uVar7,uVar1,0x146ba0cb8);
                    /* WARNING: Does not return */
  pcVar3 = (code *)invalidInstructionException();
  (*pcVar3)();
}
