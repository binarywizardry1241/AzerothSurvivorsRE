undefined8 *
FUN_1458ecac0(undefined8 param_1,undefined8 param_2,long param_3,undefined8 *param_4,long param_5)

{
  code *pcVar1;
  undefined8 *puVar2;
  long lVar3;
  long lVar4;
  long extraout_RDX;
  long lVar5;
  undefined8 **local_d8;
  undefined8 uStack_d0;
  undefined4 *local_c8;
  undefined8 local_c0;
  undefined8 **local_b8;
  undefined8 local_b0;
  float *local_a8;
  undefined8 local_a0;
  long local_98;
  undefined8 local_90;
  undefined1 *local_88;
  undefined8 local_80;
  undefined1 *local_78;
  undefined8 local_70;
  long *local_68;
  undefined8 uStack_60;
  undefined8 local_58;
  float local_50;
  undefined4 local_4c;
  undefined1 *local_48;
  undefined8 local_40;
  undefined1 local_32;
  undefined1 local_31;
  undefined8 local_30;

  local_30 = 0xfffffffffffffffe;
  if (param_5 == 0) {
    func_0x000140002200();
    puVar2 = (undefined8 *)func_0x0001400021c0();
    if (puVar2 != (undefined8 *)0x0) {
      *puVar2 = 0x6e6f6e3d646e696b;
      *(undefined1 *)(puVar2 + 1) = 0x65;
      *param_4 = 9;
      param_4[1] = puVar2;
      param_4[2] = 9;
      return param_4;
    }
    func_0x000145d6944b();
                    /* WARNING: Does not return */
    pcVar1 = (code *)invalidInstructionException();
    (*pcVar1)();
  }
  if (param_5 == *(long *)(param_3 + 0x460)) {
    func_0x000140002200();
    puVar2 = (undefined8 *)func_0x0001400021c0();
    if (puVar2 != (undefined8 *)0x0) {
      *puVar2 = 0x616c703d646e696b;
      *(undefined4 *)((long)puVar2 + 7) = 0x72657961;
      *param_4 = 0xb;
      param_4[1] = puVar2;
      param_4[2] = 0xb;
      return param_4;
    }
    func_0x000145d6944b();
                    /* WARNING: Does not return */
    pcVar1 = (code *)invalidInstructionException();
    (*pcVar1)();
  }
  lVar4 = *(long *)(param_3 + 0x568) * 0x160;
  lVar5 = *(long *)(param_3 + 0x560) + -0x160;
  do {
    lVar3 = lVar5;
    if (lVar4 == 0) {
      func_0x000140002200();
      puVar2 = (undefined8 *)func_0x0001400021c0();
      if (puVar2 != (undefined8 *)0x0) {
        *puVar2 = 0x68746f3d646e696b;
        *(undefined2 *)(puVar2 + 1) = 0x7265;
        *param_4 = 10;
        param_4[1] = puVar2;
        param_4[2] = 10;
        return param_4;
      }
      func_0x000145d6944b();
                    /* WARNING: Does not return */
      pcVar1 = (code *)invalidInstructionException();
      (*pcVar1)();
    }
    lVar5 = lVar3 + 0x160;
    lVar4 = lVar4 + -0x160;
  } while (*(long *)(lVar3 + 0x1e8) != param_5);
  local_4c = (undefined4)param_5;
  if (*(int *)(lVar3 + 0x1c8) != 0) {
    local_68 = (long *)CONCAT44(local_68._4_4_,local_4c);
    local_d8 = &local_68;
    uStack_d0 = 0x145badf80;
    func_0x000145b9c4d0(lVar5,param_4,0x146e78b95,param_4,&local_d8);
    return param_4;
  }
  if (*(long *)(lVar3 + 0x178) == -1) {
    if (*(long *)(lVar3 + 0x1a0) != -1) {
      local_48 = (undefined1 *)0x146e78afb;
      local_40 = 8;
      goto LAB_1458ecca2;
    }
    if (*(char *)(lVar3 + 700) == '\0') {
      local_48 = (undefined1 *)0x146e78b03;
      local_40 = 6;
      goto LAB_1458ecca2;
    }
    local_48 = &DAT_146e78b09;
  }
  else {
    if (*(char *)(*(long *)(lVar3 + 400) + 0x54) == '\0') {
      local_48 = (undefined1 *)0x146e78b0e;
      local_40 = 4;
      goto LAB_1458ecca2;
    }
    local_48 = &DAT_146e78b12;
  }
  local_40 = 5;
LAB_1458ecca2:
  func_0x0001458dfb70();
  local_d8 = (undefined8 **)0x0;
  uStack_d0 = 1;
  local_c8 = (undefined4 *)0x0;
  if (extraout_RDX != 0) {
    func_0x000145bcb2d0();
  }
  func_0x0001459b9b70();
  local_58 = local_c8;
  local_68 = (long *)local_d8;
  uStack_60 = uStack_d0;
  local_50 = *(float *)(lVar5 + 0xf0);
  if (local_50 <= 0.0) {
    local_50 = 0.0;
  }
  local_98 = lVar5 + 0xf4;
  lVar4 = 0x38;
  if ((*(long *)(lVar5 + 0x18) == -1) && (lVar4 = 0x60, *(long *)(lVar5 + 0x40) == -1)) {
    local_31 = 0;
  }
  else {
    local_31 = *(undefined1 *)(lVar5 + lVar4);
  }
  local_32 = *(undefined1 *)(lVar5 + 0x15c);
  local_d8 = (undefined8 **)&local_48;
  uStack_d0 = 0x1400020c0;
  local_c8 = &local_4c;
  local_c0 = 0x145badf80;
  local_b8 = &local_68;
  local_b0 = 0x1400020e0;
  local_a8 = &local_50;
  local_a0 = 0x145bad280;
  local_90 = 0x145bad280;
  local_88 = &local_31;
  local_80 = 0x145baa8b0;
  local_78 = &local_32;
  local_70 = 0x145baa8b0;
  func_0x000145b9c4d0();
  if ((undefined8 **)local_68 != (undefined8 **)0x0) {
    func_0x0001400021d0();
  }
  return param_4;
}
