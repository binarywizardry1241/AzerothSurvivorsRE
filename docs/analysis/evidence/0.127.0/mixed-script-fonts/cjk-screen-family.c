
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

ulong entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,undefined8 param_4,
           undefined8 param_5)

{
  long lVar1;
  char cVar2;
  int iVar3;
  ulong uVar4;
  ulong uVar5;
  long lVar6;
  long lVar7;
  long lVar8;
  bool bVar9;
  undefined1 auVar10 [16];
  long local_78;
  byte local_50;
  
  auVar10 = func_0x000145cc3390(param_1,param_2,param_5,param_3);
  if (auVar10._0_8_ == 0) {
    uVar4 = 0;
  }
  else {
    LOCK();
    bVar9 = DAT_1486150c8 == '\0';
    if (bVar9) {
      DAT_1486150c8 = '\x01';
    }
    UNLOCK();
    if (!bVar9) {
      func_0x000146207010();
    }
    if ((*_DAT_14865eb68 & 0x7fffffffffffffff) == 0) {
      local_50 = 0;
    }
    else {
      local_50 = func_0x000146207da0();
      local_50 = local_50 ^ 1;
    }
    lVar1 = _DAT_1486150e0;
    lVar7 = _DAT_1486150d8;
    lVar6 = _DAT_1486150e0 * 0x10;
    if (_DAT_1486150e0 != 0) {
      lVar8 = 0;
      do {
        if ((*(long *)(lVar7 + 8 + lVar8) == auVar10._8_8_) &&
           (iVar3 = func_0x000146061721(), iVar3 == 0)) {
          if ((local_50 == 0) &&
             (((*_DAT_14865eb68 & 0x7fffffffffffffff) != 0 &&
              (cVar2 = func_0x000146207da0(), cVar2 == '\0')))) {
            DAT_1486150c9 = 1;
          }
          LOCK();
          UNLOCK();
          uVar5 = 0;
          uVar4 = 0;
          goto joined_r0x00014028a672;
        }
        lVar8 = lVar8 + 0x10;
      } while (lVar6 != lVar8);
    }
    if (lVar1 == _DAT_1486150d0) {
      func_0x000146062030();
      lVar7 = _DAT_1486150d8;
    }
    *(long *)(lVar7 + lVar6) = auVar10._0_8_;
    *(long *)(lVar7 + 8 + lVar6) = auVar10._8_8_;
    _DAT_1486150e0 = lVar1 + 1;
    func_0x000145cc71a0();
    if (local_78 != -1) {
      func_0x000143637c50();
      func_0x0001437abd10();
    }
    func_0x000140666530();
    if (((local_50 == 0) && ((*_DAT_14865eb68 & 0x7fffffffffffffff) != 0)) &&
       (cVar2 = func_0x000146207da0(), cVar2 == '\0')) {
      DAT_1486150c9 = 1;
    }
    LOCK();
    UNLOCK();
    uVar5 = 1;
    uVar4 = 1;
joined_r0x00014028a672:
    bVar9 = DAT_1486150c8 == '\x02';
    DAT_1486150c8 = '\0';
    if (bVar9) {
      DAT_1486150c8 = '\0';
      func_0x0001462070d0();
      uVar4 = uVar5 & 0xffffffff;
    }
  }
  return uVar4;
}

