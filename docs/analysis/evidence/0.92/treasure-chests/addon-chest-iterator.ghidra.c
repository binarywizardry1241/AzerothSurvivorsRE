/* Static Ghidra pseudocode from unmodified 0.92 EXE bytes.
   Evidence: ev_65d4fb8564577e3873db242a819e870b36383a6919ae9ee5a94b535d7cb404b7
   Generic GCC raw-image ABI; verify Win64 arguments against original disassembly.
   This is recovered analysis, not original source or gameplay implementation. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

long * entry(undefined8 param_1,undefined8 param_2,long *param_3,long *param_4)

{
  long lVar1;
  int *piVar2;
  code *pcVar3;
  undefined1 auVar4 [16];
  float fVar5;
  float fVar6;
  long lVar7;
  long lVar8;
  undefined8 **ppuVar9;
  long lVar10;
  long lVar11;
  long *plVar12;
  undefined8 uVar13;
  undefined1 auVar14 [16];
  undefined1 auVar15 [16];
  undefined1 auVar16 [16];
  undefined4 in_XMM6_Da;
  undefined4 uVar17;
  undefined4 uVar18;
  undefined8 *local_118;
  undefined8 local_110;
  long *local_108;
  undefined8 local_100;
  undefined4 *local_f8;
  undefined8 local_f0;
  undefined4 *local_e8;
  undefined8 local_e0;
  long *local_d8;
  undefined8 local_d0;
  long local_c8 [3];
  undefined4 local_ac;
  long local_a8;
  long *local_a0;
  long local_98;
  int *local_90;
  long local_88;
  undefined8 local_80;
  undefined4 local_78;
  undefined4 uStack_74;
  long local_70;
  undefined4 local_68;
  undefined1 local_64 [4];
  undefined8 local_60;
  undefined4 local_58;

  local_60 = 0xfffffffffffffffe;
  lVar7 = *param_3;
  lVar1 = param_3[1];
  do {
    if (lVar7 == lVar1) {
LAB_1454dc5ac:
      *param_4 = 0;
      param_4[1] = 8;
      param_4[2] = 0;
      return param_4;
    }
    lVar10 = lVar7 + 0x48;
    if (*(int *)(lVar7 + 0x20) == 2) {
      *param_3 = lVar10;
      piVar2 = (int *)param_3[2];
      local_64 = *(undefined1 (*) [4])(lVar7 + 0x28);
      local_78 = *(undefined4 *)(lVar7 + 0x3c);
      local_80 = *(long *)(lVar7 + 0x34);
      local_108 = (long *)((long)&local_80 + 4);
      if (*piVar2 == 1) {
        fVar5 = (float)piVar2[3];
        fVar6 = (float)piVar2[4];
        auVar14._0_4_ = fVar5 - (float)local_80;
        auVar14._4_4_ = (float)piVar2[1] - (float)((ulong)local_80 >> 0x20);
        auVar14._8_4_ = fVar5 - 0.0;
        auVar14._12_4_ = fVar6 - 0.0;
        auVar15._4_4_ = (float)piVar2[1] - (float)piVar2[2];
        auVar15._0_4_ = fVar5 - fVar6;
        auVar15._8_4_ = fVar5 - fVar5;
        auVar15._12_4_ = fVar6 - fVar6;
        auVar15 = divps(auVar14,auVar15);
        uVar13 = auVar15._0_8_;
      }
      else {
        uVar13 = CONCAT44(uRam00000001458bd0c4,_DAT_1458bd0c0);
      }
      local_68 = (undefined4)((ulong)uVar13 >> 0x20);
      local_a8 = CONCAT44(local_a8._4_4_,(int)uVar13);
      local_f8 = &local_78;
      local_118 = &local_80;
      local_110 = 0x1456daf00;
      local_100 = 0x1456daf00;
      local_f0 = 0x1456daf00;
      local_e8 = &local_68;
      local_e0 = 0x1456daf00;
      local_d8 = &local_a8;
      local_d0 = 0x1456daf00;
      local_58 = in_XMM6_Da;
      func_0x0001456c9ba0(param_1,param_4,0x1468b25cb,local_c8,&local_118);
      local_118 = (undefined8 *)local_64;
      local_110 = 0x1456dbc60;
      local_100 = 0x1400020e0;
      local_108 = local_c8;
      func_0x0001456c9ba0();
      if (local_c8[0] != 0) {
        func_0x0001400021d0();
      }
      lVar7 = local_70;
      if (local_80 != -1) {
        lVar11 = CONCAT44(uStack_74,local_78);
        lVar8 = local_80;
        local_90 = piVar2;
        func_0x000140002200();
        local_a0 = (long *)func_0x0001400021c0();
        if (local_a0 == (long *)0x0) {
          local_90 = (int *)lVar8;
          local_88 = lVar11;
          func_0x0001458a3b8b();
                    /* WARNING: Does not return */
          pcVar3 = (code *)invalidInstructionException();
          (*pcVar3)();
        }
        *local_a0 = lVar8;
        local_a0[1] = lVar11;
        local_a0[2] = lVar7;
        local_a8 = 4;
        local_98 = 1;
        if (lVar10 == lVar1) goto LAB_1454dc593;
        ppuVar9 = &local_118;
        uVar18 = uRam00000001458bd0c4;
        uVar17 = _DAT_1458bd0c0;
        plVar12 = local_a0;
        break;
      }
      goto LAB_1454dc5ac;
    }
    lVar7 = lVar7 + 0x48;
  } while( true );
  do {
    lVar7 = local_98;
    lVar11 = lVar10 + 0x48;
    if (*(int *)(lVar10 + 0x20) == 2) {
      local_ac = *(undefined4 *)(lVar10 + 0x28);
      local_78 = *(undefined4 *)(lVar10 + 0x3c);
      local_80 = *(long *)(lVar10 + 0x34);
      uVar13 = CONCAT44(uVar18,uVar17);
      if (*local_90 == 1) {
        fVar5 = (float)local_90[3];
        fVar6 = (float)local_90[4];
        auVar16._0_4_ = fVar5 - (float)local_80;
        auVar16._4_4_ = (float)local_90[1] - (float)((ulong)local_80 >> 0x20);
        auVar16._8_4_ = fVar5 - 0.0;
        auVar16._12_4_ = fVar6 - 0.0;
        auVar4._4_4_ = (float)local_90[1] - (float)local_90[2];
        auVar4._0_4_ = fVar5 - fVar6;
        auVar4._8_4_ = fVar5 - fVar5;
        auVar4._12_4_ = fVar6 - fVar6;
        auVar15 = divps(auVar16,auVar4);
        uVar13 = auVar15._0_8_;
      }
      local_64 = SUB84((ulong)uVar13 >> 0x20,0);
      local_68 = (undefined4)uVar13;
      local_118 = &local_80;
      local_110 = 0x1456daf00;
      local_108 = (long *)((long)&local_80 + 4);
      local_100 = 0x1456daf00;
      local_f8 = &local_78;
      local_f0 = 0x1456daf00;
      local_e8 = (undefined4 *)local_64;
      local_e0 = 0x1456daf00;
      local_d8 = (long *)&local_68;
      local_d0 = 0x1456daf00;
      func_0x0001456c9ba0(ppuVar9);
      local_118 = (undefined8 *)&local_ac;
      local_110 = 0x1456dbc60;
      local_100 = 0x1400020e0;
      local_108 = local_c8;
      func_0x0001456c9ba0();
      if (local_c8[0] != 0) {
        func_0x0001400021d0();
      }
      lVar10 = local_70;
      if (local_80 == -1) break;
      local_88 = local_80;
      lVar8 = CONCAT44(uStack_74,local_78);
      if (lVar7 == local_a8) {
        func_0x000145717840();
        plVar12 = local_a0;
      }
      plVar12[lVar7 * 3] = local_88;
      plVar12[lVar7 * 3 + 1] = lVar8;
      plVar12[lVar7 * 3 + 2] = lVar10;
      local_98 = lVar7 + 1;
    }
    lVar10 = lVar11;
  } while (lVar11 != lVar1);
LAB_1454dc593:
  param_4[2] = local_98;
  *param_4 = local_a8;
  param_4[1] = (long)local_a0;
  return param_4;
}
