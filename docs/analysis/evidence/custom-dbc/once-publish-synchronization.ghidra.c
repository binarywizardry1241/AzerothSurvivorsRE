/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,char param_3,uint *param_4,undefined8 param_5,
          long param_6)

{
  code *pcVar1;
  uint uVar2;
  uint uVar3;
  int iVar4;
  code *UNRECOVERED_JUMPTABLE;
  bool bVar5;

  pcVar1 = _DAT_145d6a8f0;
  UNRECOVERED_JUMPTABLE = _DAT_145d6a2d8;
  uVar2 = *param_4;
  if (param_3 == '\0') {
    UNRECOVERED_JUMPTABLE =
         (code *)((long)*(int *)((ulong)(uVar2 & 3) * 4 + 0x1471e81f4) + 0x1471e81f4);
                    /* WARNING: Could not emulate address calculation at 0x000145d6807b */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE)(param_5,param_6,UNRECOVERED_JUMPTABLE,uVar2 & 4);
    return;
  }
LAB_145d67fcb:
  do {
    while( true ) {
      if (1 < (uVar2 & 3) - 2) break;
      LOCK();
      uVar3 = *param_4;
      bVar5 = uVar2 == uVar3;
      if (bVar5) {
        *param_4 = uVar2 & 4 | 1;
        uVar3 = uVar2;
      }
      uVar2 = uVar3;
      UNLOCK();
      if (bVar5) {
        (**(code **)(param_6 + 0x20))();
        LOCK();
        uVar2 = *param_4;
        *param_4 = 0;
        UNLOCK();
        if ((uVar2 & 4) != 0) {
          (*_DAT_145d6a2e0)();
        }
        return;
      }
    }
    if ((uVar2 & 3) != 1) {
      return;
    }
    if ((uVar2 & 4) == 0) {
      uVar3 = uVar2 | 4;
      LOCK();
      uVar2 = *param_4;
      bVar5 = uVar2 == 1;
      if (bVar5) {
        *param_4 = uVar3;
        uVar2 = 1;
      }
      UNLOCK();
      if (!bVar5) goto LAB_145d67fcb;
    }
    iVar4 = (*UNRECOVERED_JUMPTABLE)();
    if (iVar4 != 1) {
      (*pcVar1)();
    }
    uVar2 = *param_4;
  } while( true );
}
