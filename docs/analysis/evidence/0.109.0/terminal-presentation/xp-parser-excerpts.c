/* Original Ghidra owner 0x1400c4070, lines24..137. */
  if (pcVar5 == (char *)0x0) {
    pcVar5 = _DAT_148060290;
  }
  uVar4 = 0;
  if (*pcVar5 == '\x02') {
    if (*(long *)(pcVar5 + 8) == 0) {
      dVar2 = ((double)CONCAT44(uRam0000000145dccf64,
                                (int)((ulong)*(undefined8 *)(pcVar5 + 0x10) >> 0x20)) -
              dRam0000000145dccf78) +
              ((double)CONCAT44(_DAT_145dccf60,(int)*(undefined8 *)(pcVar5 + 0x10)) - _DAT_145dccf70
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
    dVar2 = _DAT_145dd2d58;
    if (dVar3 <= _DAT_145dd2d58) {
      dVar2 = dVar3;
    }
    uVar4 = (uint)(long)dVar2;
  }
  pcVar5 = (char *)func_0x000142aeace0();
  if (pcVar5 == (char *)0x0) {
    pcVar5 = _DAT_148060290;
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
      dVar2 = ((double)CONCAT44(uRam0000000145dccf64,
                                (int)((ulong)*(undefined8 *)(pcVar5 + 0x10) >> 0x20)) -
              dRam0000000145dccf78) +
              ((double)CONCAT44(_DAT_145dccf60,(int)*(undefined8 *)(pcVar5 + 0x10)) - _DAT_145dccf70
              );
    }
    if (dVar2 <= 0.0) {
      dVar2 = 0.0;
    }
    dVar3 = 0.0;
    if (0.0 <= dVar2) {
      dVar3 = dVar2;
    }
    dVar2 = _DAT_145dd2d58;
    if (dVar3 <= _DAT_145dd2d58) {
      dVar2 = dVar3;
    }
    uVar10 = (ulong)((uint)(long)dVar2 - uVar4);
    if ((uint)(long)dVar2 < uVar4) {
      uVar10 = 0;
    }
  }
  pcVar5 = (char *)func_0x000142aeace0();
  dVar2 = (double)CONCAT44(extraout_XMM0_Db,extraout_XMM0_Da);
  if (pcVar5 == (char *)0x0) {
    pcVar5 = _DAT_148060290;
  }
  if (*pcVar5 == '\x02') {
    if (*(long *)(pcVar5 + 8) == 2) {
      dVar2 = *(double *)(pcVar5 + 0x10);
    }
    else if ((int)*(long *)(pcVar5 + 8) == 1) {
      dVar2 = (double)*(long *)(pcVar5 + 0x10);
    }
    else {
      dVar2 = ((double)CONCAT44(uRam0000000145dccf64,
                                (int)((ulong)*(undefined8 *)(pcVar5 + 0x10) >> 0x20)) -
              dRam0000000145dccf78) +
              ((double)CONCAT44(_DAT_145dccf60,(int)*(undefined8 *)(pcVar5 + 0x10)) - _DAT_145dccf70
              );
    }
  }
  dVar3 = 0.0;
  if (0.0 <= dVar2) {
    dVar3 = dVar2;
  }
  dVar2 = _DAT_145dd2d58;
  if (dVar3 <= _DAT_145dd2d58) {
    dVar2 = dVar3;
  }
  if (*pcVar5 == '\x02') {
    uVar10 = (long)dVar2 & 0xffffffff;
  }
  pcVar5 = (char *)func_0x000142aeace0();
  if (pcVar5 == (char *)0x0) {
    pcVar5 = _DAT_148060290;
  }
  if (*pcVar5 == '\x04') {
    func_0x0001400a3b50();
  }
  else {
    local_88 = 0;
    local_80 = 8;
    local_78 = 0;
  }
  pcVar5 = (char *)func_0x000142aeace0();
  if (pcVar5 == (char *)0x0) {
    pcVar5 = _DAT_148060290;
  }
  if (*pcVar5 == '\x03') {

/* Original Ghidra owner 0x1400c4070, lines173..197. */
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
