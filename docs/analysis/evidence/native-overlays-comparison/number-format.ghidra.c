
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

long * entry(undefined8 param_1,float param_2,undefined8 param_3,undefined8 param_4,
            undefined8 param_5,long *param_6)

{
  code *pcVar1;
  long lVar2;
  long lVar3;
  bool bVar4;
  long local_70;
  long local_68;
  ulong local_60;
  undefined8 local_58;
  undefined8 uStack_50;
  long local_48;
  float local_3c [3];

  local_3c[1] = -NAN;
  local_3c[2] = -NAN;
  local_58 = local_3c;
  local_3c[0] = param_2;
  if (_DAT_14698ebd4 <= param_2) {
    uStack_50 = 0x14571d2e0;
    func_0x00014570bf80(param_3,param_6,0x1469a9685,param_6,&local_58);
  }
  else {
    uStack_50 = 0x14571d2e0;
    func_0x00014570bf80(param_3,param_6,0x1469a68b0,&local_70,&local_58);
    if (local_60 < 2) {
      bVar4 = false;
    }
    else {
      bVar4 = *(short *)(local_68 + -2 + local_60) == 0x302e;
    }
    func_0x00014570c440();
    if (bVar4) {
      lVar3 = local_60 - 2;
      if (lVar3 < 0) {
LAB_14547cda5:
        func_0x0001458e721b();
                    /* WARNING: Does not return */
        pcVar1 = (code *)invalidInstructionException();
        (*pcVar1)();
      }
      if (lVar3 == 0) {
        lVar2 = 1;
      }
      else {
        func_0x000140002200();
        lVar2 = func_0x0001400021c0();
        if (lVar2 == 0) goto LAB_14547cda5;
        func_0x000145756ddd();
      }
      *param_6 = lVar3;
      param_6[1] = lVar2;
      param_6[2] = lVar3;
      if (local_58 != (float *)0x0) {
        func_0x0001400021d0();
      }
    }
    else {
      param_6[2] = local_48;
      *(undefined4 *)param_6 = (undefined4)local_58;
      *(undefined4 *)((long)param_6 + 4) = local_58._4_4_;
      *(undefined4 *)(param_6 + 1) = (undefined4)uStack_50;
      *(undefined4 *)((long)param_6 + 0xc) = uStack_50._4_4_;
    }
    if (local_70 != 0) {
      func_0x0001400021d0();
    }
  }
  return param_6;
}
