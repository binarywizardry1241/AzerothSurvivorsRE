
/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Possible PIC construction at 0x00014594f1fa: Changing call to branch */
/* WARNING: Possible PIC construction at 0x00014594f236: Changing call to branch */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long param_3,undefined4 *param_4)

{
  undefined4 uVar1;
  long lVar2;
  long lVar3;
  char *pcVar4;
  long local_78 [3];
  long local_60;
  long local_48;
  char *local_40;
  long local_38;
  long local_30;
  long local_28;
  long local_20;

  func_0x0001458e3800(param_1,param_4,param_3 + 0x1b0,local_78);
  uVar1 = 0;
  if (local_38 != 0) {
    pcVar4 = local_40 + local_38 * 0x40;
    do {
      if ((((*local_40 == '\x06') && (*(int *)(local_40 + 0x10) == 0)) && (local_40[0x18] == '\x01')
          ) && ((*(long *)(local_40 + 0x28) == 0xb &&
                (*(long *)((long)*(long **)(local_40 + 0x20) + 3) ==
                 CONCAT35(uRam00000001471b51d4,_DAT_1471b51cf) &&
                 **(long **)(local_40 + 0x20) == CONCAT53(_DAT_1471b51cf,_DAT_1471b51cc))))) {
        uVar1 = *(undefined4 *)(local_40 + 8);
        param_4[1] = *(undefined4 *)(local_40 + 4);
        param_4[2] = uVar1;
        uVar1 = 1;
        break;
      }
      local_40 = local_40 + 0x40;
    } while (local_40 != pcVar4);
  }
  *param_4 = uVar1;
  if (local_48 == 0) {
    if (local_78[0] != 0) {
      func_0x0001400021d0();
    }
    if (local_60 == 0) {
      if (local_20 != 0) {
        lVar2 = local_28 + 8;
        lVar3 = local_20;
        do {
          if ((*(long *)(lVar2 + -8) != -1) && (*(long *)(lVar2 + -8) != 0)) {
            func_0x0001400021d0();
          }
          lVar2 = lVar2 + 0x28;
          lVar3 = lVar3 + -1;
        } while (lVar3 != 0);
      }
      if (local_30 == 0) {
        return;
      }
    }
  }
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}
