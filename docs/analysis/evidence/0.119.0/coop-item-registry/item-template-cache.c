pauStack_70 = (undefined1 (*) [16])CONCAT44(pauStack_70._4_4_,uStack_760);
  if (pauStack_768 == (undefined1 (*) [16])0x0) {
    pauStack_650 = (undefined1 (*) [16])0xffffffffffffffff;
    uVar12 = *DAT_148509058;
  }
  else {
    func_0x000145f941db(&uStack_218,pauStack_768,0x158);
    func_0x0001400021d0(pauStack_768,0x158,8);
    func_0x000145f941db(&pauStack_650,&uStack_218,0x158);
    uVar12 = *DAT_148509058;
  }
  if (uVar12 < 2) {
    uVar16 = (uint)DAT_1484d1380;
    if (uVar16 - 1 < 2) {
LAB_140ac9ce2:
      uStack_61 = 1;
      cVar11 = FUN_144e0f4b0(DAT_1484d1370,uVar16);
      if (cVar11 != '\0') {
        uStack_200 = (code *)(DAT_1484d1370 + 0x30);
        pauStack_3a8 = (undefined1 (*) [16])&pauStack_70;
        pauStack_3a0 = (undefined1 (*) [16])FUN_145f789e0;
        ppauStack_398 = &pauStack_650;
        pcStack_390 = FUN_140b00ca0;
        apauStack_4f8[0] = (undefined1 (*) [16])&DAT_14625fa0a;
        apauStack_4f8[1] = (undefined1 (*) [16])&pauStack_3a8;
        pauStack_80 = (undefined1 (*) [16])apauStack_4f8;
        puStack_78 = &DAT_14625cff8;
        uStack_218 = (undefined1 (*) [16])0x1;
        pauStack_210 = (undefined1 (*) [16])&pauStack_80;
        ppauStack_208 = (undefined1 (**) [16])0x1;
        uStack_61 = 1;
        FUN_144e10cd0(DAT_1484d1370,&uStack_218);
      }
    }
    else if (uVar16 != 0) {
      uStack_61 = 1;
      uVar16 = FUN_1460e2140(&DAT_1484d1370);
      if ((char)uVar16 != '\0') goto LAB_140ac9ce2;
    }
  }
  pauVar3 = pauStack_650;
  if (pauStack_650 == (undefined1 (*) [16])0xffffffffffffffff) {
    bVar25 = false;
  }
  else {
    pauStack_3a8 = (undefined1 (*) [16])CONCAT44(pauStack_3a8._4_4_,(int)pauStack_70);
    uStack_218 = (undefined1 (*) [16])0x0;
    uStack_61 = 1;
    lVar15 = FUN_140497360(pauStack_9e0[4] + 8,(ulonglong)pauStack_70 & 0xffffffff,0);
    bVar25 = lVar15 == 0;
  }
  pauVar4 = pauStack_650;
  pauVar22 = pauStack_9e0;
  *puStack_9d0 = uStack_9c4;
  func_0x000145f941db(apauStack_4f8,&ppauStack_648,0x150);
  pauVar10 = pauStack_70;
  uVar9 = (int)pauStack_70;
  if (pauVar4 == (undefined1 (*) [16])0xffffffffffffffff) {
    uStack_61 = 0;
    FUN_1405186c0(pauVar22[4] + 8,(ulonglong)pauStack_70 & 0xffffffff);
  }
  else {
    pauStack_3a8 = pauVar4;
    func_0x000145f941db(&pauStack_3a0,&ppauStack_648,0x150);
    lVar15 = *(longlong *)pauVar22[1];
    if (lVar15 == *(longlong *)*pauVar22) {
      uStack_63 = 1;
      FUN_145fcc1d0(pauVar22);
    }
    *(undefined4 *)(*(longlong *)(*pauVar22 + 8) + lVar15 * 4) = uVar9;
    *(longlong *)pauVar22[1] = lVar15 + 1;
    uStack_218 = pauVar4;
    func_0x000145f941db(&pauStack_210,apauStack_4f8,0x150);
    uStack_63 = 0;
    FUN_140518440(pauVar22[4] + 8,(ulonglong)pauVar10 & 0xffffffff,&uStack_218);
  }
  *puStack_9d0 = uStack_9c4;
  pauStack_3a8 = (undefined1 (*) [16])CONCAT44(pauStack_3a8._4_4_,(int)pauStack_70);
  uStack_218 = (undefined1 (*) [16])0x0;
  pauStack_210 = (undefined1 (*) [16])&DAT_00000008;
  ppauStack_208 = (undefined1 (**) [16])0x0;
  FUN_140b372c0(pauStack_9e0 + 3,&pauStack_3a8,&uStack_218);
