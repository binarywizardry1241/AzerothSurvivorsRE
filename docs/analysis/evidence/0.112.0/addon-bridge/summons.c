
long * FUN_1458e3ff0(undefined8 param_1,undefined8 param_2,long param_3,long *param_4)

{
  long lVar1;
  code *pcVar2;
  long lVar3;
  long lVar4;
  long lVar5;
  long local_40 [2];
  undefined8 local_30;

  local_30 = 0xfffffffffffffffe;
  lVar1 = *(long *)(param_3 + 0xd8);
  if (lVar1 == 0) {
    lVar3 = 8;
  }
  else {
    func_0x000140002200(lVar1 * 0x18);
    lVar3 = func_0x0001400021c0();
    if (lVar3 == 0) {
      func_0x000145da94eb();
                    /* WARNING: Does not return */
      pcVar2 = (code *)invalidInstructionException();
      (*pcVar2)();
    }
  }
  local_40[0] = 0;
  func_0x0001459f8900();
  lVar4 = local_40[0];
  lVar5 = lVar3;
  func_0x00014599b620();
  param_4[2] = lVar3;
  *param_4 = (long)local_40;
  *(undefined4 *)(param_4 + 1) = 0;
  *(undefined4 *)((long)param_4 + 0xc) = 0;
  if (lVar4 != 0) {
    lVar5 = lVar5 + 8;
    do {
      if (*(long *)(lVar5 + -8) != 0) {
        func_0x0001400021d0();
      }
      lVar5 = lVar5 + 0x18;
      lVar4 = lVar4 + -1;
    } while (lVar4 != 0);
  }
  if (lVar1 != 0) {
    func_0x0001400021d0();
  }
  return param_4;
}
