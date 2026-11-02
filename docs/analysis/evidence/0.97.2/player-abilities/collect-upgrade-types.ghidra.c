
long * entry(undefined8 param_1,undefined8 param_2,undefined8 *param_3,long *param_4)

{
  code *pcVar1;
  char cVar2;
  char *pcVar3;
  long lVar4;
  undefined8 *local_b8;
  undefined8 *puStack_b0;
  undefined8 *local_a8;
  undefined8 *puStack_a0;
  undefined8 *local_98;
  undefined8 uStack_90;
  undefined8 local_88;
  undefined8 uStack_80;
  undefined8 local_78;
  undefined8 uStack_70;
  long *local_68;
  long local_60;
  char *pcStack_58;
  long local_50;
  undefined8 local_48;
  
  local_48 = 0xfffffffffffffffe;
  local_98 = param_3 + 8;
  puStack_a0 = param_3 + 7;
  local_a8 = param_3 + 5;
  puStack_b0 = param_3 + 3;
  local_b8 = param_3 + 2;
  cVar2 = func_0x000145472190(param_1,param_4,&local_b8,param_3);
  local_68 = param_4;
  if (cVar2 == -1) {
    *param_4 = 0;
    param_4[1] = 1;
    param_4[2] = 0;
  }
  else {
    func_0x000140002200();
    lVar4 = 1;
    pcVar3 = (char *)func_0x0001400021c0();
    if (pcVar3 == (char *)0x0) {
      func_0x0001458e721b();
                    /* WARNING: Does not return */
      pcVar1 = (code *)invalidInstructionException();
      (*pcVar1)();
    }
    *pcVar3 = cVar2;
    local_60 = 8;
    local_50 = 1;
    local_78 = param_3[8];
    uStack_70 = param_3[9];
    local_b8 = (undefined8 *)*param_3;
    puStack_b0 = (undefined8 *)param_3[1];
    local_a8 = (undefined8 *)param_3[2];
    puStack_a0 = (undefined8 *)param_3[3];
    local_98 = (undefined8 *)param_3[4];
    uStack_90 = param_3[5];
    local_88 = param_3[6];
    uStack_80 = param_3[7];
    pcStack_58 = pcVar3;
    while( true ) {
      cVar2 = func_0x000145472190();
      if (cVar2 == -1) break;
      if (lVar4 == local_60) {
        func_0x000145757d40();
        pcVar3 = pcStack_58;
      }
      pcVar3[lVar4] = cVar2;
      lVar4 = lVar4 + 1;
      local_50 = lVar4;
    }
    local_68[2] = local_50;
    *local_68 = local_60;
    local_68[1] = (long)pcStack_58;
  }
  return local_68;
}

