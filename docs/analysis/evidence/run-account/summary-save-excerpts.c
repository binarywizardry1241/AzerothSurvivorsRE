/* Original owner 0x1458a33c0, Ghidra lines36..59. */
  local_38 = 0xfffffffffffffffe;
  func_0x0001458a4340(param_4,param_2,param_4,&local_80);
  local_58 = local_78;
  func_0x0001458f6c40();
  func_0x0001458f6950();
  if (local_268 == -1) {
LAB_1458a3480:
    local_68 = 0x146beb7f8;
    local_60 = 0x33;
    func_0x000145bb6590();
    func_0x0001458ef670();
  }
  else {
    if ((local_258 != local_70) || (iVar4 = func_0x000145bfa0e1(), iVar4 != 0)) {
      if (local_268 != 0) {
        func_0x0001400021d0();
      }
      goto LAB_1458a3480;
    }
    if (local_268 != 0) {
      func_0x0001400021d0();
    }
    func_0x0001458ef670();
  }

/* Original owner 0x1458a33c0, Ghidra lines126..148. */
      uVar8 = 0;
      lVar10 = 0;
      do {
        if (9 < (byte)pcVar6[lVar10 + uVar12] - 0x30) goto LAB_1458a3908;
        uVar8 = (ulong)((byte)pcVar6[lVar10 + uVar12] - 0x30) + uVar8 * 10;
        lVar10 = lVar10 + 1;
      } while (lVar10 != uVar9 + -uVar12);
    }
LAB_1458a3a1e:
    if (local_40 != 0) {
      func_0x0001400021d0();
    }
    if (uVar8 <= uVar11 && uVar11 - uVar8 < 0xe10) goto LAB_1458a3a5d;
  }
  cVar2 = func_0x0001458ef860();
  if (cVar2 != '\0') {
    func_0x000145bd3fa0();
    if (extraout_RDX < 0) {
LAB_1458a395f:
      func_0x000145d992bb();
                    /* WARNING: Does not return */
      pcVar1 = (code *)invalidInstructionException();
      (*pcVar1)();
