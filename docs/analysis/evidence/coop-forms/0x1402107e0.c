
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,char *param_3,undefined8 param_4,undefined8 param_5
          ,undefined8 param_6)

{
  char cVar1;
  long *plVar2;
  code *pcVar3;
  long lVar4;
  undefined1 auVar5 [16];
  long local_148;

  func_0x0001458dfee0(param_6,param_3,0xc,0x145f10f41);
  func_0x0001458e0370();
  func_0x0001458dfee0();
  func_0x00014020cb50();
  func_0x0001458dfee0();
  func_0x0001458dfee0();
  func_0x00014020cb50();
  func_0x000145d145fb();
  func_0x0001402b57b0();
  func_0x0001402f2930();
  func_0x000145d145fb();
  func_0x0001402b57b0();
  func_0x0001402f2b80();
  func_0x0001458dfee0();
  func_0x0001458dfee0();
  func_0x00014020cb50();
  auVar5 = func_0x0001458dfee0();
  if (auVar5._8_8_ < 0) {
LAB_140210da3:
    func_0x000145eb6fcb();
LAB_140211171:
                    /* WARNING: Does not return */
    pcVar3 = (code *)invalidInstructionException();
    (*pcVar3)();
  }
  if (auVar5._8_8_ == 0) {
    cVar1 = *param_3;
  }
  else {
    func_0x000140002200(auVar5._0_8_);
    lVar4 = func_0x0001400021c0();
    if (lVar4 == 0) goto LAB_140210da3;
    func_0x000145d145fb();
    cVar1 = *param_3;
  }
  if (cVar1 != '\x01') {
    plVar2 = *(long **)(param_3 + 8);
    LOCK();
    lVar4 = *plVar2;
    *plVar2 = *plVar2 + 1;
    UNLOCK();
    if (*plVar2 == 0 || SCARRY8(lVar4,1) != *plVar2 < 0) goto LAB_140211171;
  }
  func_0x0001402bacf0();
  func_0x000145d145fb();
  func_0x0001402b57b0();
  func_0x0001458dfee0();
  func_0x00014020dbd0();
  if (local_148 != 0) {
    func_0x0001400021d0();
  }
  return;
}
