
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 entry(undefined8 param_1,undefined8 param_2,char *param_3,undefined8 param_4)

{
  code *pcVar1;
  long lVar2;
  long extraout_RDX;
  long *plVar3;
  char cVar4;

  func_0x0001458dfee0(param_3,param_4,10);
  if (extraout_RDX < 0) {
LAB_1402ef337:
    func_0x000145eb6fcb();
                    /* WARNING: Does not return */
    pcVar1 = (code *)invalidInstructionException();
    (*pcVar1)();
  }
  if (extraout_RDX == 0) {
    cVar4 = *param_3;
    if (cVar4 == '\x01') goto LAB_1402ef381;
LAB_1402ef3ab:
    plVar3 = *(long **)(param_3 + 8);
    LOCK();
    lVar2 = *plVar3;
    *plVar3 = *plVar3 + 1;
    UNLOCK();
    if (*plVar3 == 0 || SCARRY8(lVar2,1) != *plVar3 < 0) goto LAB_1402ef5f5;
  }
  else {
    func_0x000140002200();
    lVar2 = func_0x0001400021c0();
    if (lVar2 == 0) goto LAB_1402ef337;
    func_0x000145d145fb();
    cVar4 = *param_3;
    if (cVar4 != '\x01') goto LAB_1402ef3ab;
LAB_1402ef381:
    plVar3 = *(long **)(param_3 + 8);
  }
  func_0x0001402bacf0();
  func_0x000145ce7810();
  if (cVar4 == '\0') {
    LOCK();
    lVar2 = *plVar3;
    *plVar3 = *plVar3 + 1;
    UNLOCK();
    if (*plVar3 == 0 || SCARRY8(lVar2,1) != *plVar3 < 0) {
LAB_1402ef5f5:
                    /* WARNING: Does not return */
      pcVar1 = (code *)invalidInstructionException();
      (*pcVar1)();
    }
  }
  func_0x0001402bacf0();
  return param_4;
}
