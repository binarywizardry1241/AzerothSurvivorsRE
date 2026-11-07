
undefined8 entry(undefined8 param_1,undefined8 param_2,int *param_3,undefined8 param_4,long param_5)

{
  long lVar1;
  long lVar2;
  code *pcVar3;
  undefined8 uVar4;
  undefined8 uVar5;
  undefined8 uVar6;
  long local_2b0 [18];
  undefined4 local_220;
  long local_188;
  undefined8 local_180;
  undefined8 local_178;
  long local_170;
  long local_168;
  int *local_60;
  undefined8 local_58;
  undefined8 local_50;
  undefined8 local_48;
  
  local_48 = 0xfffffffffffffffe;
  if (*(long *)(param_3 + 0x40) == -1) {
    local_60 = param_3;
    func_0x000140469b90(param_5,param_4,param_5,local_2b0);
    lVar1 = param_5 + 0x40;
    lVar2 = param_5 + 0x5a8;
    local_188 = 0;
    local_180 = 8;
    local_178 = 0;
    local_170 = lVar1;
    local_168 = lVar2;
    uVar4 = func_0x00014030f080();
    if (local_188 != 0) {
      func_0x0001400021d0();
    }
    local_188 = 0;
    local_180 = 8;
    local_178 = 0;
    local_170 = lVar1;
    local_168 = lVar2;
    uVar5 = func_0x000140312300();
    if (local_188 != 0) {
      func_0x0001400021d0();
    }
    local_188 = 0;
    local_180 = 8;
    local_178 = 0;
    local_170 = lVar1;
    local_168 = lVar2;
    local_50 = func_0x000140311100();
    local_58 = uVar5;
    if (local_188 != 0) {
      func_0x0001400021d0();
    }
    uVar5 = func_0x00014032e2a0();
    uVar6 = func_0x00014032f060();
    func_0x00014600504b();
    param_3 = local_60;
    *(undefined8 *)(local_60 + 2) = *(undefined8 *)(param_5 + 0x5a0);
    func_0x00014600504b();
    *(undefined8 *)(param_3 + 0x4e) = uVar4;
    *(undefined8 *)(param_3 + 0x50) = local_58;
    *(undefined8 *)(param_3 + 0x52) = local_50;
    *(undefined8 *)(param_3 + 0x54) = uVar5;
    *(undefined8 *)(param_3 + 0x56) = uVar6;
  }
  else {
    local_2b0[0] = *(long *)(param_5 + 0x5a0);
    if (*(long *)(param_3 + 2) != local_2b0[0]) {
      func_0x0001461574ad(param_5,param_4,param_3 + 2,0,local_2b0,0x1461c6d70);
                    /* WARNING: Does not return */
      pcVar3 = (code *)invalidInstructionException();
      (*pcVar3)();
    }
  }
  *param_3 = *(int *)(param_5 + 0x5b0) + 0x3dcc5000;
  local_2b0[3] = 0x10;
  local_2b0[4] = 0;
  local_2b0[5] = 0;
  local_2b0[6] = 0x10;
  local_2b0[7] = 0;
  local_2b0[8] = 0;
  local_2b0[9] = 0x10;
  local_2b0[10] = 0;
  local_2b0[0xb] = 0;
  local_2b0[0xc] = 0x10;
  local_2b0[0xd] = 0;
  local_2b0[0xe] = 0;
  local_2b0[0xf] = 0x10;
  local_2b0[0] = 0;
  local_2b0[0x10] = 0;
  local_2b0[0x11] = 0;
  local_220 = 0;
  local_2b0[1] = 8;
  local_2b0[2] = 0;
  func_0x0001401790b0();
  func_0x00014600504b();
  return param_4;
}

