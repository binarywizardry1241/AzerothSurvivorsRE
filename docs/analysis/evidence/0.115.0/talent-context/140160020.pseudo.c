/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,undefined8 param_4)

{
  code *pcVar1;
  double dVar2;
  double dVar3;
  uint uVar4;
  char *pcVar5;
  long lVar6;
  uint uVar7;
  long lVar8;
  uint uVar9;
  ulong uVar10;
  undefined4 extraout_XMM0_Da;
  undefined4 extraout_XMM0_Db;
  long local_88;
  long local_80;
  long local_78;

  pcVar5 = (char *)func_0x000142a769a0(param_4,param_3,2,0x145f01e17);
  if (pcVar5 == (char *)0x0) {
    pcVar5 = _DAT_1481ea210;
  }
  uVar4 = 0;
  if (*pcVar5 == '\x02') {
    if (*(long *)(pcVar5 + 8) == 0) {
      dVar2 = ((double)CONCAT44(uRam0000000145ee0624,
                                (int)((ulong)*(undefined8 *)(pcVar5 + 0x10) >> 0x20)) -
              dRam0000000145ee0638) +
              ((double)CONCAT44(_DAT_145ee0620,(int)*(undefined8 *)(pcVar5 + 0x10)) - _DAT_145ee0630
              );
    }
    else if ((int)*(long *)(pcVar5 + 8) == 1) {
      dVar2 = (double)*(long *)(pcVar5 + 0x10);
    }
    else {
      dVar2 = *(double *)(pcVar5 + 0x10);
    }
    if (dVar2 <= 0.0) {
      dVar2 = 0.0;
    }
    dVar3 = 0.0;
    if (0.0 <= dVar2) {
      dVar3 = dVar2;
    }
    dVar2 = _DAT_145ee3c58;
    if (dVar3 <= _DAT_145ee3c58) {
      dVar2 = dVar3;
    }
    uVar4 = (uint)(long)dVar2;
  }
  pcVar5 = (char *)func_0x000142a769a0();
  if (pcVar5 == (char *)0x0) {
    pcVar5 = _DAT_1481ea210;
  }
  uVar10 = 0;
  if (*pcVar5 == '\x02') {
    if (*(long *)(pcVar5 + 8) == 2) {
      dVar2 = *(double *)(pcVar5 + 0x10);
    }
    else if ((int)*(long *)(pcVar5 + 8) == 1) {
      dVar2 = (double)*(long *)(pcVar5 + 0x10);
    }
    else {
      dVar2 = ((double)CONCAT44(uRam0000000145ee0624,
                                (int)((ulong)*(undefined8 *)(pcVar5 + 0x10) >> 0x20)) -
              dRam0000000145ee0638) +
              ((double)CONCAT44(_DAT_145ee0620,(int)*(undefined8 *)(pcVar5 + 0x10)) - _DAT_145ee0630
              );
    }
    if (dVar2 <= 0.0) {
      dVar2 = 0.0;
    }
    dVar3 = 0.0;
    if (0.0 <= dVar2) {
      dVar3 = dVar2;
    }
    dVar2 = _DAT_145ee3c58;
    if (dVar3 <= _DAT_145ee3c58) {
      dVar2 = dVar3;
    }
    uVar10 = (ulong)((uint)(long)dVar2 - uVar4);
    if ((uint)(long)dVar2 < uVar4) {
      uVar10 = 0;
    }
  }
  pcVar5 = (char *)func_0x000142a769a0();
  dVar2 = (double)CONCAT44(extraout_XMM0_Db,extraout_XMM0_Da);
  if (pcVar5 == (char *)0x0) {
    pcVar5 = _DAT_1481ea210;
  }
  if (*pcVar5 == '\x02') {
    if (*(long *)(pcVar5 + 8) == 2) {
      dVar2 = *(double *)(pcVar5 + 0x10);
    }
    else if ((int)*(long *)(pcVar5 + 8) == 1) {
      dVar2 = (double)*(long *)(pcVar5 + 0x10);
    }
    else {
      dVar2 = ((double)CONCAT44(uRam0000000145ee0624,
                                (int)((ulong)*(undefined8 *)(pcVar5 + 0x10) >> 0x20)) -
              dRam0000000145ee0638) +
              ((double)CONCAT44(_DAT_145ee0620,(int)*(undefined8 *)(pcVar5 + 0x10)) - _DAT_145ee0630
              );
    }
  }
  dVar3 = 0.0;
  if (0.0 <= dVar2) {
    dVar3 = dVar2;
  }
  dVar2 = _DAT_145ee3c58;
  if (dVar3 <= _DAT_145ee3c58) {
    dVar2 = dVar3;
  }
  if (*pcVar5 == '\x02') {
    uVar10 = (long)dVar2 & 0xffffffff;
  }
  pcVar5 = (char *)func_0x000142a769a0();
  if (pcVar5 == (char *)0x0) {
    pcVar5 = _DAT_1481ea210;
  }
  if (*pcVar5 == '\x04') {
    func_0x0001400e0890();
  }
  else {
    local_88 = 0;
    local_80 = 8;
    local_78 = 0;
  }
  pcVar5 = (char *)func_0x000142a769a0();
  if (pcVar5 == (char *)0x0) {
    pcVar5 = _DAT_1481ea210;
  }
  if (*pcVar5 == '\x03') {
    lVar8 = *(long *)(pcVar5 + 0x18);
    if (lVar8 < 0) {
LAB_14016028c:
      func_0x000145eb6fcb();
                    /* WARNING: Does not return */
      pcVar1 = (code *)invalidInstructionException();
      (*pcVar1)();
    }
    if (lVar8 != 0) {
      func_0x000140002200();
      lVar6 = func_0x0001400021c0();
      if (lVar6 == 0) goto LAB_14016028c;
      func_0x000145d145fb();
      goto LAB_1401602dd;
    }
  }
  lVar8 = 0;
LAB_1401602dd:
  uVar4 = 0x6e;
  do {
    uVar7 = (uint)uVar10 - (uVar4 - 0x1e);
    if ((((uint)uVar10 < uVar4 - 0x1e) || (uVar9 = uVar7 - (uVar4 - 0xf), uVar7 < uVar4 - 0xf)) ||
       (uVar10 = (ulong)(uVar9 - uVar4), uVar9 < uVar4)) break;
    uVar4 = uVar4 + 0x2d;
  } while (uVar4 != 0x36b);
  func_0x000145ce7810();
  func_0x0001402c7900();
  func_0x0001403366e0();
  if (lVar8 != 0) {
    func_0x0001400021d0();
  }
  if (local_78 != 0) {
    lVar8 = local_80 + 8;
    do {
      if (*(long *)(lVar8 + -8) != 0) {
        func_0x0001400021d0();
      }
      lVar8 = lVar8 + 0x20;
      local_78 = local_78 + -1;
    } while (local_78 != 0);
  }
  if (local_88 != 0) {
    func_0x0001400021d0();
  }
  return;
}
