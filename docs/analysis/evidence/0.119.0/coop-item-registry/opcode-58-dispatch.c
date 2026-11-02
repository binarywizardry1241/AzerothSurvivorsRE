case 0x58:
    apuStack_af0[0] = &UNK_145caa0e3;
    FUN_145c8e500(&uStack_318,&pauStack_110);
    uVar25 = uStack_318;
    pauVar32 = (undefined1 (*) [16])CONCAT44(uStack_314,uStack_318);
    if (CONCAT44(uStack_30c,uStack_310) == -2) goto code_r0x000145cb3f22;
    param_2 = (undefined1 (*) [16])&uStack_308;
    pauVar24 = (undefined1 (*) [16])auStack_818;
    apuStack_af0[0] = &UNK_145caa114;
    func_0x000145f941db(pauVar24,param_2,0x150);
    if (CONCAT44(uStack_30c,uStack_310) == -1) {
      pauVar28 = (undefined1 (*) [16])0x0;
      unaff_RBX = (undefined1 (*) [16])0xffffffffffffffff;
      pauStack_f8 = in_R8;
    }
    else {
      uStack_318 = uStack_310;
      uStack_314 = uStack_30c;
      apuStack_af0[0] = &UNK_145caa145;
      pauStack_f8 = in_R8;
      func_0x000145f941db(&uStack_310,auStack_818,0x150);
      apuStack_af0[0] = &UNK_145caa150;
      unaff_RBX = (undefined1 (*) [16])FUN_142d03e60(0x158);
      param_2 = (undefined1 (*) [16])&uStack_318;
      apuStack_af0[0] = &UNK_145caa169;
      pauVar24 = unaff_RBX;
      func_0x000145f941db(unaff_RBX,param_2,0x158);
      pauVar28 = unaff_RBX;
    }
    unaff_XMM6._8_4_ = uVar25;
    unaff_XMM6._0_8_ = (ulonglong)pauVar28;
    unaff_XMM6._12_4_ = 0;
    pauVar22 = (undefined1 (*) [16])0x8000000000000048;
    unaff_R14 = in_R8;
    break;
