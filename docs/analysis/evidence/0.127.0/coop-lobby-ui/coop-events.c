
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long *param_3)

{
  long lVar1;
  char *pcVar2;
  long lVar3;
  undefined4 uStack_37c;
  long local_1e8;
  
  lVar3 = *param_3;
  if (*(long *)(lVar3 + 0x10) != 0) {
    uStack_37c = (undefined4)((ulong)param_3[3] >> 0x20);
    *(undefined4 *)param_3[2] = uStack_37c;
    local_1e8 = *(long *)(lVar3 + 8);
    lVar1 = *(long *)(lVar3 + 0x10);
    *(undefined8 *)(lVar3 + 0x10) = 0;
    lVar3 = lVar1 * 0x20 + local_1e8;
    while (local_1e8 != lVar3) {
      local_1e8 = local_1e8 + 0x20;
      pcVar2 = (char *)func_0x000142d23770();
      if (pcVar2 == (char *)0x0) {
        pcVar2 = _DAT_148634330;
      }
      if ((*pcVar2 == '\x03') && (*(long *)(pcVar2 + 0x18) - 4U < 5)) {
                    /* WARNING: Could not emulate address calculation at 0x0001402e14c8 */
                    /* WARNING: Treating indirect jump as call */
        (*(code *)((long)*(int *)((*(long *)(pcVar2 + 0x18) - 4U) * 4 + 0x14627aa18) + 0x14627aa18))
                  ();
        return;
      }
      func_0x000140004e00();
    }
    func_0x000140108480();
  }
  return;
}

