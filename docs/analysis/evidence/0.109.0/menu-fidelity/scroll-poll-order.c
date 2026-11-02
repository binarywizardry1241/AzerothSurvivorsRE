undefined8 *
FUN_14019e4f0(undefined8 param_1,undefined8 param_2,int *param_3,undefined8 *param_4,long param_5)

{
  int *piVar1;
  int iVar2;
  ulong uVar3;
  long lVar4;
  code *pcVar5;
  undefined1 local_e1;
  int *local_e0;
  long local_d8;
  undefined1 *local_d0;
  undefined8 local_c8;
  undefined8 local_c0;
  long local_b8;
  long local_b0;
  int local_a8;
  int local_a4;
  undefined8 local_a0;
  long local_98;
  long local_90;
  int local_88;
  int local_84;
  undefined8 local_80;
  long local_78;
  long local_70;
  int local_68;
  int local_64;
  undefined8 local_60;
  long local_58;
  long local_50;
  int local_48;
  int local_44;

  LOCK();
  piVar1 = (int *)(param_5 + 0x5b0);
  iVar2 = *piVar1;
  *piVar1 = *piVar1 + 1;
  UNLOCK();
  if (*param_3 != 1) {
    func_0x000145d99570(param_1,param_2,0x59,0x145de7068,0x145de70c8);
                    /* WARNING: Does not return */
    pcVar5 = (code *)invalidInstructionException();
    (*pcVar5)();
  }
  local_e0 = *(int **)(param_5 + 0x5a0);
  if (*(int **)(param_3 + 0xc) != local_e0) {
    func_0x000145d4891d(param_1,param_3 + 0xc,param_3 + 0xc,0,&local_e0,0x145de70e0);
                    /* WARNING: Does not return */
    pcVar5 = (code *)invalidInstructionException();
    (*pcVar5)();
  }
  if (*(ulong *)(param_3 + 2) < *(ulong *)(param_5 + 0x218)) {
    uVar3 = *(ulong *)(*(long *)(param_5 + 0x210) + *(ulong *)(param_3 + 2) * 8);
    if (uVar3 != 0) {
      lVar4 = *(long *)(param_5 + 0x1e0);
      local_d8 = ~uVar3 * 0x38;
      if (*(char *)(lVar4 + 0x30 + local_d8) != '\0') {
        if (((*(ulong *)(param_3 + 4) < *(ulong *)(param_5 + 0x218)) &&
            (uVar3 = *(ulong *)(*(long *)(param_5 + 0x210) + *(ulong *)(param_3 + 4) * 8),
            uVar3 != 0)) && (local_b8 = ~uVar3 * 0x38, *(char *)(lVar4 + 0x30 + local_b8) != '\0'))
        {
          local_d8 = local_d8 + lVar4;
          local_e0 = *(int **)(local_d8 + 0x10);
          local_a8 = param_3[0xe];
          local_b8 = local_b8 + lVar4;
          local_c0 = *(undefined8 *)(local_b8 + 0x10);
          if ((*(ulong *)(param_3 + 6) < *(ulong *)(param_5 + 0x218)) &&
             (uVar3 = *(ulong *)(*(long *)(param_5 + 0x210) + *(ulong *)(param_3 + 6) * 8),
             uVar3 != 0)) {
            local_98 = ~uVar3 * 0x38;
            if (*(char *)(*(long *)(param_5 + 0x1e0) + 0x30 + local_98) != '\0') {
              local_98 = *(long *)(param_5 + 0x1e0) + local_98;
              local_a0 = *(undefined8 *)(local_98 + 0x10);
              if ((*(ulong *)(param_3 + 8) < *(ulong *)(param_5 + 0x218)) &&
                 (uVar3 = *(ulong *)(*(long *)(param_5 + 0x210) + *(ulong *)(param_3 + 8) * 8),
                 uVar3 != 0)) {
                local_78 = ~uVar3 * 0x38;
                if (*(char *)(*(long *)(param_5 + 0x1e0) + 0x30 + local_78) != '\0') {
                  local_78 = *(long *)(param_5 + 0x1e0) + local_78;
                  local_80 = *(undefined8 *)(local_78 + 0x10);
                  if ((*(ulong *)(param_3 + 10) < *(ulong *)(param_5 + 0x218)) &&
                     (uVar3 = *(ulong *)(*(long *)(param_5 + 0x210) + *(ulong *)(param_3 + 10) * 8),
                     uVar3 != 0)) {
                    local_50 = ~uVar3 * 0x38;
                    if (*(char *)(*(long *)(param_5 + 0x1e0) + 0x30 + local_50) != '\0') {
                      local_50 = *(long *)(param_5 + 0x1e0) + local_50;
                      local_60 = *(undefined8 *)(local_50 + 0x10);
                      local_d0 = (undefined1 *)(local_d8 + 0x2c);
                      local_d8 = local_d8 + 0x28;
                      local_c8 = CONCAT44(iVar2,local_a8);
                      local_b0 = local_b8 + 0x2c;
                      local_b8 = local_b8 + 0x28;
                      local_90 = local_98 + 0x2c;
                      local_98 = local_98 + 0x28;
                      local_70 = local_78 + 0x2c;
                      local_78 = local_78 + 0x28;
                      local_58 = local_50 + 0x28;
                      local_50 = local_50 + 0x2c;
                      local_a4 = iVar2;
                      local_88 = local_a8;
                      local_84 = iVar2;
                      local_68 = local_a8;
                      local_64 = iVar2;
                      local_48 = local_a8;
                      local_44 = iVar2;
                      func_0x000140191820(param_4,param_3,&local_e0,&local_80,&local_c0,&local_a0);
                      param_3[0xe] = iVar2;
                      *param_4 = 0xfffffffffffffffd;
                      return param_4;
                    }
                  }
                  goto LAB_14019e83d;
                }
              }
            }
          }
        }
        local_e0 = param_3 + 0xf;
        local_d8 = 0x144ffd300;
        local_d0 = &local_e1;
        local_c8 = 0x144ffd300;
        func_0x000145d99830(param_4,local_e0,&local_e0,0x145de6dc8,0x145de6e80);
                    /* WARNING: Does not return */
        pcVar5 = (code *)invalidInstructionException();
        (*pcVar5)();
      }
    }
  }
LAB_14019e83d:
  local_e0 = param_3 + 0xf;
  local_d8 = 0x144ffd300;
  local_d0 = &local_e1;
  local_c8 = 0x144ffd300;
  func_0x000145d99830(param_4,local_e0,&local_e0,0x145de6dc8,0x145de6e68);
                    /* WARNING: Does not return */
  pcVar5 = (code *)invalidInstructionException();
  (*pcVar5)();
}
