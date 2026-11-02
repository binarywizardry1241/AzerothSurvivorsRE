
long * entry(undefined8 param_1,undefined8 param_2,ulong *param_3,long *param_4,long param_5)

{
  ulong uVar1;
  undefined4 uVar2;
  code *pcVar3;
  ulong *puVar4;
  long lVar5;
  long lVar6;
  undefined4 auStack_440 [4];
  undefined4 local_430 [120];
  undefined4 local_250 [120];
  long local_70;
  long local_68;
  long local_60;
  undefined2 local_58;
  undefined4 local_56;
  undefined2 local_52;
  undefined4 local_50;
  undefined2 local_4c;
  undefined8 local_48;

  local_48 = 0xfffffffffffffffe;
  func_0x000145756dcb(param_3,param_4,0,local_250,0x1e0);
  if (param_5 != 0) {
    uVar1 = param_5 * 0x10 - 0x10;
    puVar4 = param_3;
    if ((uVar1 & 0x10) == 0) {
      puVar4 = param_3 + 2;
      if (*param_3 < 0x78) {
        local_250[*param_3] = (int)param_3[1];
      }
    }
    if (uVar1 != 0) {
      do {
        if (*puVar4 < 0x78) {
          local_250[*puVar4] = (int)puVar4[1];
          uVar1 = puVar4[2];
        }
        else {
          uVar1 = puVar4[2];
        }
        if (uVar1 < 0x78) {
          local_250[uVar1] = (int)puVar4[3];
        }
        puVar4 = puVar4 + 4;
      } while (puVar4 != param_3 + param_5 * 2);
    }
  }
  func_0x000140002200();
  lVar5 = func_0x0001400021c0();
  if (lVar5 != 0) {
    func_0x000145756ddd();
    local_58 = 0x129;
    lVar6 = 4;
    local_60 = 0;
    local_68 = lVar5;
    local_70 = 0x20;
    do {
      uVar2 = auStack_440[lVar6];
      local_52 = local_4c;
      local_56 = local_50;
      if ((ulong)(local_70 - local_60) < 4) {
        func_0x000145757d40();
      }
      *(undefined4 *)(local_68 + local_60) = uVar2;
      local_60 = local_60 + 4;
      local_4c = local_52;
      local_50 = local_56;
      lVar6 = lVar6 + 1;
    } while (lVar6 != 0x7c);
    *param_4 = local_70;
    param_4[1] = local_68;
    param_4[2] = local_60;
    *(undefined2 *)(param_4 + 3) = local_58;
    *(undefined4 *)((long)param_4 + 0x1a) = local_56;
    *(undefined2 *)((long)param_4 + 0x1e) = local_52;
    return param_4;
  }
  func_0x0001458e721b();
                    /* WARNING: Does not return */
  pcVar3 = (code *)invalidInstructionException();
  (*pcVar3)();
}
