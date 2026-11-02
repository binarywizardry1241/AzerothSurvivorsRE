undefined8 *
FUN_14019bd00(undefined8 param_1,undefined8 param_2,int *param_3,undefined8 *param_4,long param_5)

{
  int *piVar1;
  int *piVar2;
  int iVar3;
  int iVar4;
  code *pcVar5;
  int *local_58;
  long local_50;
  int local_48;
  int local_44;
  int *local_40;

  LOCK();
  piVar1 = (int *)(param_5 + 0x5b0);
  iVar3 = *piVar1;
  *piVar1 = *piVar1 + 1;
  UNLOCK();
  if (*(long *)(param_3 + 0x40) == -1) {
    func_0x000145d99570(param_1,param_2,0x59,0x145de7068,0x145de70c8);
                    /* WARNING: Does not return */
    pcVar5 = (code *)invalidInstructionException();
    (*pcVar5)();
  }
  local_58 = *(int **)(param_5 + 0x5a0);
  if (*(int **)(param_3 + 2) == local_58) {
    piVar1 = param_3 + 4;
    iVar4 = *param_3;
    piVar2 = param_3 + 0x4a;
    func_0x000140382bb0(param_4,param_3,param_5,piVar1);
    if ((char)param_3[0x4a] == '\0') {
      local_58 = piVar1;
      local_50 = param_5;
      local_48 = iVar4;
      local_44 = iVar3;
      local_40 = piVar2;
      local_58 = (int *)FUN_1401808f0();
      if ((int)local_58 != 0) {
        entry();
      }
    }
    *param_3 = iVar3;
    *param_4 = 0xfffffffffffffffd;
    return param_4;
  }
  func_0x000145d4891d(param_1,param_3 + 2,param_3 + 2,0,&local_58,0x145de70e0);
                    /* WARNING: Does not return */
  pcVar5 = (code *)invalidInstructionException();
  (*pcVar5)();
}
