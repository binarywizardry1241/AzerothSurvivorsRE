
void entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,long *param_4)

{
  long lVar1;
  ulong uVar2;
  undefined4 local_98;
  undefined4 uStack_94;
  undefined4 uStack_90;
  undefined4 uStack_8c;
  long local_88;
  long local_80;
  undefined8 local_78;
  long local_68;
  undefined8 local_60;
  long local_50;
  undefined8 local_48;
  undefined8 local_38;
  undefined8 local_30;
  undefined8 local_28;
  undefined8 local_20;
  undefined8 uStack_18;
  undefined8 uStack_10;
  
  local_20 = 0xfffffffffffffffe;
  uStack_18 = param_1;
  uStack_10 = param_2;
  func_0x000145b449c0(param_4[1],param_4,param_4[1],&local_80,param_4[2],0x14706eee8);
  local_38 = local_78;
  func_0x000145b449c0();
  local_30 = local_60;
  func_0x000145b449c0();
  local_28 = local_48;
  func_0x000145b449c0();
  if (*param_4 != 0) {
    func_0x0001400021d0();
  }
  param_4[2] = local_88;
  *(undefined4 *)param_4 = local_98;
  *(undefined4 *)((long)param_4 + 4) = uStack_94;
  *(undefined4 *)(param_4 + 1) = uStack_90;
  *(undefined4 *)((long)param_4 + 0xc) = uStack_8c;
  if (local_50 != 0) {
    func_0x0001400021d0();
  }
  if (local_68 != 0) {
    func_0x0001400021d0();
  }
  if (local_80 != 0) {
    func_0x0001400021d0();
  }
  if (0x1000 < (ulong)param_4[2]) {
    lVar1 = param_4[1];
    uVar2 = 0x1000;
    do {
      if (-0x41 < *(char *)(lVar1 + uVar2)) {
joined_r0x000145b54e86:
        if ((ulong)param_4[2] < uVar2) {
          return;
        }
        goto LAB_145b54e88;
      }
      if (-0x41 < *(char *)(lVar1 + -1 + uVar2)) {
        uVar2 = uVar2 - 1;
        goto joined_r0x000145b54e86;
      }
      if (-0x41 < *(char *)(lVar1 + -2 + uVar2)) {
        uVar2 = uVar2 - 2;
        goto joined_r0x000145b54e86;
      }
      if (-0x41 < *(char *)(lVar1 + -3 + uVar2)) {
        uVar2 = uVar2 - 3;
        goto joined_r0x000145b54e86;
      }
      uVar2 = uVar2 - 4;
    } while (uVar2 != 0);
    uVar2 = 0;
LAB_145b54e88:
    param_4[2] = uVar2;
  }
  return;
}

