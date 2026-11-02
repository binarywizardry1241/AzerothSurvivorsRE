/* Original owner 0x1458af69f, Ghidra lines989..1003. */
    bVar39 = *(byte *)((long)local_80 + 0xad7);
    if (((bVar39 & 6) == 4) && (*(byte *)((long)local_80 + 0x1166) != bVar39)) {
      *(byte *)((long)local_80 + 0x1166) = bVar39;
      func_0x0001458b8620();
      if (*(int *)((long)ppppppuVar41 + 0x10) == 2) goto LAB_1458af477;
      if ((*(long *)((long)ppppppuVar41 + 0x10a0) != 0xffffff) &&
         ((char)*(int *)((long)ppppppuVar41 + 0xad0) == '\0')) {
        uVar33 = *(uint *)((long)ppppppuVar41 + 0x764);
        uVar40 = *(uint *)((long)ppppppuVar41 + 0x774);
        uVar5 = *(uint *)((long)ppppppuVar41 + 0x76c);
        uVar6 = *(uint *)((long)ppppppuVar41 + 0x770);
        uVar7 = *(uint *)((long)ppppppuVar41 + 0x778);
        func_0x00014588d0d0();
        uVar9 = uVar33 - *(uint *)((long)ppppppuVar41 + 0x1124);
        if (uVar33 < *(uint *)((long)ppppppuVar41 + 0x1124)) {

/* Original owner 0x1458af69f, Ghidra lines1043..1113. */
        if (CARRY8((ulong)uVar9,*(ulong *)((long)ppppppuVar41 + 0xce0))) {
          lVar34 = -1;
        }
        *(long *)((long)ppppppuVar41 + 0xce0) = lVar34;
        *(uint *)((long)ppppppuVar41 + 0x1124) = uVar33;
        *(uint *)((long)ppppppuVar41 + 0x1128) = uVar40;
        *(uint *)((long)ppppppuVar41 + 0x112c) = uVar5;
        *(uint *)((long)ppppppuVar41 + 0x1130) = uVar6;
        *(uint *)((long)ppppppuVar41 + 0x1134) = uVar7;
        if (*(int *)((long)ppppppuVar41 + 0x980) != 0) {
          func_0x00014589d440();
        }
        func_0x0001458beb60();
        if (local_228 == (uint *******)0xffffffffffffffff) {
          local_178 = (uint *******)0x0;
          pppppppuStack_170 = (uint *******)0x8;
          local_168 = (uint *******)0x0;
          plVar38 = local_e0;
        }
        else {
          local_4e8 = local_208;
          uStack_4e0 = uStack_200;
          local_4f8 = local_218;
          uStack_4f0 = uStack_210;
          local_508 = local_228;
          uStack_500 = uStack_220;
          func_0x0001458e3f70();
          plVar38 = local_e0;
          if (local_508 != (uint *******)0x0) {
            func_0x0001400021d0();
          }
          local_178 = local_d8;
          pppppppuStack_170 = pppppppuStack_d0;
          local_168 = local_c8;
        }
        local_89 = 1;
        uVar47 = func_0x000145ba7ef0();
        local_228 = (uint *******)CONCAT44(extraout_EDX_01,uVar47);
        local_89 = 1;
        func_0x000145ba7ea0();
        local_89 = 1;
        func_0x0001458e4330();
        pppppppuVar45 = local_4f8;
        if ((uint *******)((long)local_178 - (long)local_168) < local_4f8) {
          local_98 = uStack_500;
          local_88 = local_508;
          func_0x000145bfa970();
          plVar38 = local_e0;
          pppppppuVar36 = local_88;
LAB_1458b063b:
          pppppppuVar43 = local_168;
          func_0x000145bfa0e7();
        }
        else {
          pppppppuVar43 = local_168;
          pppppppuVar36 = local_508;
          if (local_4f8 != (uint *******)0x0) goto LAB_1458b063b;
        }
        local_168 = (uint *******)((long)pppppppuVar43 + (long)pppppppuVar45);
        if (pppppppuVar36 != (uint *******)0x0) {
          func_0x0001400021d0();
        }
        local_89 = 1;
        func_0x0001458a33c0();
        local_89 = 0;
        func_0x0001458bda60();
        ppppppuVar41 = local_80;
        if (*plVar38 == 2) goto LAB_1458af477;
      }
      func_0x000145993230();
      if (*plVar38 == 2) goto LAB_1458af477;
