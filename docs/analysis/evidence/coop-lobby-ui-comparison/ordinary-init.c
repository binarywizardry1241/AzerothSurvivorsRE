
undefined8
entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 param_4,long param_5)

{
  long lVar1;
  code *pcVar2;
  long lVar3;
  long lVar4;
  undefined4 local_1d0;
  undefined4 uStack_1cc;
  undefined4 uStack_1c8;
  undefined4 uStack_1c4;
  undefined4 local_1c0;
  undefined4 uStack_1bc;
  undefined4 uStack_1b8;
  undefined4 uStack_1b4;
  undefined4 local_1b0;
  undefined4 uStack_1ac;
  undefined4 uStack_1a8;
  undefined4 uStack_1a4;
  long local_1a0;
  undefined4 local_198;
  undefined4 uStack_194;
  undefined4 uStack_190;
  undefined4 uStack_18c;
  undefined4 local_188;
  undefined4 uStack_184;
  undefined4 uStack_180;
  undefined4 uStack_17c;
  undefined4 local_178;
  undefined4 uStack_174;
  undefined4 uStack_170;
  undefined4 uStack_16c;
  long local_168;
  long local_160 [18];
  undefined4 local_d0;
  undefined8 local_48;
  
  local_48 = 0xfffffffffffffffe;
  if (*param_3 == -1) {
    func_0x00014505f610(param_3,param_4,param_5,&local_1d0,0x1461c4658);
    local_160[0] = 0;
    local_160[1] = 8;
    local_160[2] = 0;
    local_160[3] = param_5 + 0x40;
    local_160[4] = param_5 + 0x5a8;
    lVar3 = func_0x00014030dee0();
    if (local_160[0] != 0) {
      func_0x0001400021d0();
    }
    local_160[0] = 0;
    local_160[1] = 8;
    local_160[2] = 0;
    local_160[3] = param_5 + 0x40;
    local_160[4] = param_5 + 0x5a8;
    lVar4 = func_0x000140312300();
    if (local_160[0] != 0) {
      func_0x0001400021d0();
    }
    func_0x000140444940();
    local_168 = local_1a0;
    local_178 = local_1b0;
    uStack_174 = uStack_1ac;
    uStack_170 = uStack_1a8;
    uStack_16c = uStack_1a4;
    local_188 = local_1c0;
    uStack_184 = uStack_1bc;
    uStack_180 = uStack_1b8;
    uStack_17c = uStack_1b4;
    local_198 = local_1d0;
    uStack_194 = uStack_1cc;
    uStack_190 = uStack_1c8;
    uStack_18c = uStack_1c4;
    func_0x00014600504b();
    lVar1 = *(long *)(param_5 + 0x5a0);
    param_3[6] = local_168;
    *(undefined4 *)(param_3 + 4) = local_178;
    *(undefined4 *)((long)param_3 + 0x24) = uStack_174;
    *(undefined4 *)(param_3 + 5) = uStack_170;
    *(undefined4 *)((long)param_3 + 0x2c) = uStack_16c;
    *(undefined4 *)(param_3 + 2) = local_188;
    *(undefined4 *)((long)param_3 + 0x14) = uStack_184;
    *(undefined4 *)(param_3 + 3) = uStack_180;
    *(undefined4 *)((long)param_3 + 0x1c) = uStack_17c;
    *(undefined4 *)param_3 = local_198;
    *(undefined4 *)((long)param_3 + 4) = uStack_194;
    *(undefined4 *)(param_3 + 1) = uStack_190;
    *(undefined4 *)((long)param_3 + 0xc) = uStack_18c;
    param_3[7] = lVar3;
    param_3[8] = lVar4;
    func_0x00014600504b();
    param_3[0x2c] = lVar1;
  }
  else {
    local_160[0] = *(long *)(param_5 + 0x5a0);
    if (param_3[0x2c] != local_160[0]) {
      func_0x0001461574ad(param_3 + 0x2c,param_4,param_3 + 0x2c,0,local_160,0x1461c6d70);
                    /* WARNING: Does not return */
      pcVar2 = (code *)invalidInstructionException();
      (*pcVar2)();
    }
  }
  *(int *)(param_3 + 0x2d) = *(int *)(param_5 + 0x5b0) + 0x3dcc5000;
  local_160[3] = 0x10;
  local_160[4] = 0;
  local_160[5] = 0;
  local_160[6] = 0x10;
  local_160[7] = 0;
  local_160[8] = 0;
  local_160[9] = 0x10;
  local_160[10] = 0;
  local_160[0xb] = 0;
  local_160[0xc] = 0x10;
  local_160[0xd] = 0;
  local_160[0xe] = 0;
  local_160[0xf] = 0x10;
  local_160[0] = 0;
  local_160[0x10] = 0;
  local_160[0x11] = 0;
  local_d0 = 0;
  local_160[1] = 8;
  local_160[2] = 0;
  func_0x0001402fe0e0();
  func_0x00014600504b();
  return param_4;
}

