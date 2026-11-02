
/* WARNING: Control flow encountered bad instruction data */

void entry(undefined8 param_1,undefined8 param_2,ulong param_3,long param_4)

{
  long lVar1;
  int iVar2;
  long lVar3;
  long local_58;
  undefined8 local_50;
  undefined8 local_48;
  undefined8 local_40;
  long local_38;
  undefined8 local_30;

  local_30 = 0xfffffffffffffffe;
  iVar2 = *(int *)(param_4 + 0x948);
  if (((iVar2 != 0 && *(char *)(param_4 + 0x95f) == '\x02') && (*(char *)(param_4 + 0x95d) != -1))
     && (param_3 < *(ulong *)(param_4 + 0x578))) {
    func_0x0001454da3d0(iVar2,param_4,param_4,&local_58,param_3 * 0xa0 + *(long *)(param_4 + 0x570))
    ;
    local_38 = local_58;
    if (local_58 != -1) {
      local_40 = local_50;
      *(int *)(param_4 + 0x948) = iVar2 + -1;
      lVar3 = *(long *)(param_4 + 0x818);
      if (lVar3 == *(long *)(param_4 + 0x808)) {
        func_0x000145757f60();
      }
      lVar1 = *(long *)(param_4 + 0x810);
      *(long *)(lVar1 + lVar3 * 0x18) = local_38;
      *(undefined8 *)(lVar1 + 8 + lVar3 * 0x18) = local_40;
      *(undefined8 *)(lVar1 + 0x10 + lVar3 * 0x18) = local_48;
      *(long *)(param_4 + 0x818) = lVar3 + 1;
                    /* WARNING: Bad instruction - Truncating control flow here */
      halt_baddata();
    }
  }
  return;
}
