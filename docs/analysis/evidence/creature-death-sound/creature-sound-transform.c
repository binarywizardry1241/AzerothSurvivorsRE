undefined8 *
entry(undefined8 param_1,undefined8 param_2,int *param_3,undefined8 *param_4,ulong param_5)

{
  uint uVar1;
  code *pcVar2;
  ulong uVar3;
  ulong uVar4;
  ulong uVar5;
  int local_50 [2];
  undefined8 local_48;
  long local_40;

  if ((((3 < param_5) && (*param_3 == 0x43424457)) && (7 < param_5)) &&
     (((0xb < param_5 && (0xf < param_5)) &&
      (uVar4 = (ulong)(uint)param_3[3],
      (ulong)(uint)param_3[2] << 2 <= uVar4 && 6 < (ulong)(uint)param_3[2])))) {
    uVar1 = param_3[1];
    uVar5 = (ulong)uVar1;
    if (uVar4 * uVar5 + 0x14 <= param_5) {
      func_0x0001400156a0(param_1,param_2,param_5,local_50,0,1);
      if (local_50[0] == 1) {
        func_0x00014613b1bb();
                    /* WARNING: Does not return */
        pcVar2 = (code *)invalidInstructionException();
        (*pcVar2)();
      }
      func_0x000145f941db(local_40,local_48,param_3,local_40,param_5);
      if (uVar1 != 0) {
        uVar3 = 0x30;
        do {
          if (param_5 < uVar3) {
            *param_4 = 0xffffffffffffffff;
            func_0x0001400021d0();
            return param_4;
          }
          if (*(int *)(local_40 + -4 + uVar3) == 0x2101) {
            *(undefined4 *)(local_40 + -4 + uVar3) = 0;
          }
          uVar3 = uVar3 + uVar4;
          uVar5 = uVar5 - 1;
        } while (uVar5 != 0);
      }
      *param_4 = local_48;
      param_4[1] = local_40;
      param_4[2] = param_5;
      return param_4;
    }
  }
  *param_4 = 0xffffffffffffffff;
  return param_4;
}
