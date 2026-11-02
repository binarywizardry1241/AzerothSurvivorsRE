undefined8 *
entry(undefined8 *param_1,undefined8 param_2,int *param_3,undefined8 *param_4,long param_5)

{
  int *piVar1;
  int iVar2;
  ulong uVar3;
  long lVar4;
  char *pcVar5;
  code *pcVar6;
  char cVar7;
  long lVar8;
  long lVar9;
  undefined1 local_49;
  int *local_48;
  undefined8 local_40;
  undefined1 *local_38;
  undefined8 local_30;

  LOCK();
  piVar1 = (int *)(param_5 + 0x5b0);
  iVar2 = *piVar1;
  *piVar1 = *piVar1 + 1;
  UNLOCK();
  if (*param_3 != 1) {
    func_0x000145d99570(param_1,param_2,0x59,0x145ee2c30,0x145ee2c90);
                    /* WARNING: Does not return */
    pcVar6 = (code *)invalidInstructionException();
    (*pcVar6)();
  }
  local_48 = *(int **)(param_5 + 0x5a0);
  if (*(int **)(param_3 + 6) != local_48) {
    func_0x000145d4891d(param_1,param_3 + 6,param_3 + 6,0,&local_48,0x145ee2ca8);
                    /* WARNING: Does not return */
    pcVar6 = (code *)invalidInstructionException();
    (*pcVar6)();
  }
  if (*(ulong *)(param_5 + 0x218) <= *(ulong *)(param_3 + 2)) {
LAB_1409ac105:
    local_48 = param_3 + 9;
    local_40 = 0x144ffd300;
    local_38 = &local_49;
    local_30 = 0x144ffd300;
    func_0x000145d99830(param_1,local_48,&local_48,0x145ee26c5,0x145ee2768);
                    /* WARNING: Does not return */
    pcVar6 = (code *)invalidInstructionException();
    (*pcVar6)();
  }
  uVar3 = *(ulong *)(*(long *)(param_5 + 0x210) + *(ulong *)(param_3 + 2) * 8);
  param_1 = param_4;
  if (uVar3 == 0) goto LAB_1409ac105;
  lVar4 = *(long *)(param_5 + 0x1e0);
  lVar8 = ~uVar3 * 0x38;
  if (*(char *)(lVar4 + 0x30 + lVar8) == '\0') goto LAB_1409ac105;
  if (((*(ulong *)(param_5 + 0x218) <= *(ulong *)(param_3 + 4)) ||
      (uVar3 = *(ulong *)(*(long *)(param_5 + 0x210) + *(ulong *)(param_3 + 4) * 8), uVar3 == 0)) ||
     (lVar9 = ~uVar3 * 0x38, *(char *)(lVar4 + 0x30 + lVar9) == '\0')) {
    local_48 = param_3 + 9;
    local_40 = 0x144ffd300;
    local_38 = &local_49;
    local_30 = 0x144ffd300;
    func_0x000145d99830(param_4,local_48,&local_48,0x145ee26c5,0x145ee27e0);
                    /* WARNING: Does not return */
    pcVar6 = (code *)invalidInstructionException();
    (*pcVar6)();
  }
  lVar9 = lVar9 + lVar4;
  pcVar5 = *(char **)(lVar9 + 0x10);
  if (**(char **)(lVar8 + lVar4 + 0x10) == '\x02') {
    cVar7 = '\x01';
    if (*pcVar5 != '\0') goto LAB_1409ac0a1;
  }
  else {
    cVar7 = func_0x000140811780();
    if (cVar7 == *pcVar5) goto LAB_1409ac0a1;
  }
  *(int *)(lVar9 + 0x2c) = iVar2;
  *pcVar5 = cVar7;
LAB_1409ac0a1:
  param_3[8] = iVar2;
  *param_4 = 0xfffffffffffffffd;
  return param_4;
}
