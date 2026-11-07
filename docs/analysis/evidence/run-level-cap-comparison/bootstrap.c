
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

long * entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,undefined8 param_4)

{
  long lVar1;
  code *pcVar2;
  long *plVar3;

  func_0x000145b2a470(param_4,param_3);
  func_0x000145a79e10();
  func_0x000145b2c880();
  func_0x000145a760a0();
  func_0x000145a89d40();
  func_0x000145b46540();
  func_0x000145b44190();
  func_0x000145b38a70();
  func_0x000145b456c0();
  func_0x000145ae03e0();
  func_0x000145b45d30();
  plVar3 = (long *)func_0x000145b1e190();
  LOCK();
  lVar1 = *plVar3;
  *plVar3 = *plVar3 + 1;
  UNLOCK();
  if (*plVar3 != 0 && SCARRY8(lVar1,1) == *plVar3 < 0) {
    func_0x000145a9ea60();
    return plVar3;
  }
                    /* WARNING: Does not return */
  pcVar2 = (code *)invalidInstructionException();
  (*pcVar2)();
}
