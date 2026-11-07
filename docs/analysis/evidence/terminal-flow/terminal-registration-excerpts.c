/* Ghidra raw owner 0x1402a0060: original decompiler lines 230..289. */
          (SUB161(auVar19 >> 0x67,0) & 1) != 0) || (SUB161(auVar19 >> 0x6f,0) & 1) != 0) ||
        (SUB161(auVar19 >> 0x77,0) & 1) != 0) || auVar19[0xf] < '\0') {
LAB_1402a0282:
      lVar3 = *(long *)param_3[4];
      *(long *)param_3[4] = lVar3 + 1;
      local_e0 = 1;
      lStack_d8 = _DAT_145dcd900;
      lStack_d0 = uRam0000000145dcd908;
      local_b8 = 1;
      lStack_b0 = 1;
      lStack_98 = 0;
      local_90 = CONCAT53(local_90._3_5_,0x10100);
      lStack_c8 = 2;
      lStack_c0 = 0x1400ba840;
      local_a8 = CONCAT71(local_a8._1_7_,2);
      func_0x00014000f330(param_3,param_4,lVar3,lVar2,&local_e0);
      func_0x00014000f180();
      lVar2 = param_3[2];
      if (lVar2 == *param_3) {
        func_0x000145bfab70();
      }
      *(long *)(param_3[1] + lVar2 * 8) = lVar3;
      param_3[2] = lVar2 + 1;
      local_e0 = 0;
      lStack_d8 = 8;
      lStack_d0 = 0;
      lStack_c8 = _DAT_145df1070;
      lStack_c0 = lRam0000000145df1078;
      local_b8 = _DAT_145df1080;
      lStack_b0 = lRam0000000145df1088;
      local_a8 = 0;
      lStack_a0 = 8;
      lStack_98 = 0;
      local_90 = _DAT_145df1070;
      lStack_88 = lRam0000000145df1078;
      local_80 = _DAT_145df1080;
      lStack_78 = lRam0000000145df1088;
      local_61 = 1;
      func_0x000144e44770();
      if (param_3[2] != 0) {
        param_3[2] = param_3[2] + -1;
      }
      local_70 = (long *)(lVar3 * 0x130 + *(long *)(param_3[3] + 8) + 0x58);
      func_0x00014000b310();
      local_70[0xc] = local_80;
      local_70[0xd] = lStack_78;
      local_70[10] = local_90;
      local_70[0xb] = lStack_88;
      local_70[8] = lStack_a0;
      local_70[9] = lStack_98;
      local_70[6] = lStack_b0;
      local_70[7] = local_a8;
      local_70[4] = lStack_c0;
      local_70[5] = local_b8;
      local_70[2] = lStack_d0;
      local_70[3] = lStack_c8;
      *local_70 = local_e0;
      local_70[1] = lStack_d8;
      local_70 = (long *)lVar3;
LAB_1402a045c:
