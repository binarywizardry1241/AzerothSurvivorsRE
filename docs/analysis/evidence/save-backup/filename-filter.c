/* WARNING: Removing unreachable block (ram,0x0001458f0760) */
/* WARNING: Removing unreachable block (ram,0x0001458f0766) */

undefined8 * entry(void)

{
  long *plVar1;
  long lVar2;
  undefined8 *in_RCX;
  undefined8 *in_R8;
  undefined1 local_500 [584];
  long *local_2b8;
  int *local_2b0;
  ulong local_2a8;
  undefined4 local_60;
  undefined4 uStack_5c;
  undefined4 uStack_58;
  undefined4 uStack_54;
  undefined8 local_50;
  undefined8 uStack_48;
  long *local_38;
  undefined8 local_30;

  local_30 = 0xfffffffffffffffe;
  plVar1 = (long *)*in_R8;
  local_2b0 = (int *)in_R8[1];
  if (plVar1 == (long *)0x0) {
    if ((1 < ((uint)local_2b0 & 3) - 2) && (((ulong)local_2b0 & 3) != 0)) {
      local_2b0 = (int *)((long)local_2b0 + -1);
      local_2b8 = (long *)CONCAT71(local_2b8._1_7_,3);
      func_0x000145bdf7c0();
    }
    *in_RCX = 0xffffffffffffffff;
  }
  else {
    func_0x000145bfa0e7(in_R8 + 2,in_RCX,in_R8 + 2,local_500,0x248);
    func_0x000145bfa0e7();
    local_2b8 = plVar1;
    local_38 = plVar1;
    func_0x000145bae010();
    LOCK();
    *local_38 = *local_38 + -1;
    UNLOCK();
    if (*local_38 == 0) {
      func_0x000144ae0f90();
    }
    local_38 = (long *)CONCAT44(uStack_5c,local_60);
    lVar2 = func_0x000145ba70a0();
    if (lVar2 != 0) {
      func_0x000145bd5650();
      if (((((int)local_2b8 != 1) && (6 < local_2a8)) &&
          (*(int *)((long)local_2b0 + 3) == 0x2070756b && *local_2b0 == 0x6b636142)) &&
         (*(int *)((long)local_2b0 + (local_2a8 - 4)) == 0x7661732e)) {
        in_RCX[2] = local_50;
        in_RCX[3] = uStack_48;
        *(undefined4 *)in_RCX = local_60;
        *(undefined4 *)((long)in_RCX + 4) = uStack_5c;
        *(undefined4 *)(in_RCX + 1) = uStack_58;
        *(undefined4 *)((long)in_RCX + 0xc) = uStack_54;
        return in_RCX;
      }
    }
    *in_RCX = 0xffffffffffffffff;
    if (local_38 != (long *)0x0) {
      func_0x0001400021d0();
    }
  }
  return in_RCX;
}
