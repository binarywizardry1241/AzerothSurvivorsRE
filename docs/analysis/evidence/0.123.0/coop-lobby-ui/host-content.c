
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8
FUN_140288f10(undefined8 param_1,undefined8 param_2,undefined8 *param_3,undefined8 param_4)

{
  char cVar1;
  char *pcVar2;
  long lVar3;
  long *plVar4;
  code *pcVar5;
  long lVar6;
  
  if (*(char *)*param_3 == '\x01') {
    func_0x000145aaf610();
    func_0x00014014d5a0();
    func_0x0001428de760();
    func_0x00014600504b();
    func_0x00014025ab20();
  }
  func_0x00014600504b();
  func_0x0001402441d0();
  pcVar2 = (char *)param_3[7];
  lVar3 = param_3[1];
  if (*(long *)(param_3[8] + 8) < 0) {
LAB_1402894cd:
    func_0x0001461add5b();
                    /* WARNING: Does not return */
    pcVar5 = (code *)invalidInstructionException();
    (*pcVar5)();
  }
  if (*(long *)(param_3[8] + 8) == 0) {
    cVar1 = *pcVar2;
  }
  else {
    func_0x000140002200();
    lVar6 = func_0x0001400021c0();
    if (lVar6 == 0) goto LAB_1402894cd;
    func_0x00014600504b();
    cVar1 = *pcVar2;
  }
  if (cVar1 != '\x01') {
    plVar4 = *(long **)(pcVar2 + 8);
    LOCK();
    lVar6 = *plVar4;
    *plVar4 = *plVar4 + 1;
    UNLOCK();
    if (*plVar4 == 0 || SCARRY8(lVar6,1) != *plVar4 < 0) goto LAB_140289bfd;
  }
  func_0x00014025a890();
  if (*(long *)(lVar3 + 0x10) != 0) {
    func_0x000145fd8260();
    if (*pcVar2 != '\x01') {
      plVar4 = *(long **)(pcVar2 + 8);
      LOCK();
      lVar3 = *plVar4;
      *plVar4 = *plVar4 + 1;
      UNLOCK();
      if (*plVar4 == 0 || SCARRY8(lVar3,1) != *plVar4 < 0) goto LAB_140289bfd;
    }
    func_0x00014025a890();
  }
  func_0x00014600504b();
  func_0x0001402441d0();
  func_0x000145fd8260();
  if (*pcVar2 != '\x01') {
    plVar4 = *(long **)(pcVar2 + 8);
    LOCK();
    lVar3 = *plVar4;
    *plVar4 = *plVar4 + 1;
    UNLOCK();
    if (*plVar4 == 0 || SCARRY8(lVar3,1) != *plVar4 < 0) {
LAB_140289bfd:
                    /* WARNING: Does not return */
      pcVar5 = (code *)invalidInstructionException();
      (*pcVar5)();
    }
  }
  func_0x00014025a890();
  func_0x000140145800();
  if (*(char *)param_3[5] == '\x01') {
    func_0x000145bbfea0();
    func_0x0001401488f0();
  }
  return param_4;
}

