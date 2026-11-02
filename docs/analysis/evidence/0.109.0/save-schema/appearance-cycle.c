undefined8
entry(undefined8 param_1,undefined8 param_2,undefined4 param_3,undefined8 param_4,undefined8 param_5
     ,ulong param_6)

{
  code *pcVar1;
  undefined8 uVar2;
  long lVar3;
  ulong uVar4;
  uint uVar5;
  int in_stack_00000028;
  undefined4 local_28;
  undefined4 local_24;
  undefined4 local_20;
  undefined1 local_1c;

  uVar2 = func_0x0001459a2280(param_3);
  local_28 = (undefined4)uVar2;
  local_24 = CONCAT31(local_24._1_3_,(char)((ulong)uVar2 >> 0x20));
  lVar3 = func_0x0001459a29c0();
  if (lVar3 != 0) {
    uVar4 = func_0x000145a7d6b0();
    if ((uVar4 & 1) != 0) {
      local_1c = (char)(uVar4 >> 0x28);
      local_20 = (int)(uVar4 >> 8);
      if (4 < param_6) {
        func_0x000145d99653();
                    /* WARNING: Does not return */
        pcVar1 = (code *)invalidInstructionException();
        (*pcVar1)();
      }
      uVar5 = (uint)(byte)(*(char *)((long)&local_20 + param_6) +
                          (*(char *)((long)&local_20 + param_6) == '\0'));
      goto LAB_1459a2218;
    }
  }
  uVar5 = 1;
  if (4 < param_6) {
    func_0x000145d99653();
                    /* WARNING: Does not return */
    pcVar1 = (code *)invalidInstructionException();
    (*pcVar1)();
  }
LAB_1459a2218:
  lVar3 = (long)(int)((uint)*(byte *)((long)&local_28 + param_6) + in_stack_00000028) %
          (long)(int)uVar5;
  *(byte *)((long)&local_28 + param_6) =
       ((char)((ulong)lVar3 >> 0x18) >> 7 & (byte)uVar5) + (char)lVar3;
  return CONCAT44(local_24,local_28);
}
