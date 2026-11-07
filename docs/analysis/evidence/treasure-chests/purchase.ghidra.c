/* Static Ghidra pseudocode from unmodified 0.92 EXE bytes.
   Evidence: ev_181dbc6741c80532e3ae2e214fc9b243dbc969522a10a9d895d135ce0684e9c1
   Generic GCC raw-image ABI; verify Win64 arguments against original disassembly.
   This is recovered analysis, not original source or gameplay implementation. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

bool entry(ulong param_1,undefined8 param_2,undefined8 param_3,long param_4,undefined8 param_5,
          ulong param_6)

{
  undefined4 *puVar1;
  ushort uVar2;
  uint uVar3;
  uint uVar4;
  long lVar5;
  long lVar6;
  code *pcVar7;
  undefined1 *puVar8;
  undefined4 uVar9;
  long lVar10;
  undefined4 uVar11;
  ulong uVar12;
  ulong uVar13;
  bool bVar14;
  float fVar15;
  undefined1 local_b8 [32];
  long local_98;
  undefined8 local_90;
  undefined1 *local_80;
  undefined8 local_78;
  long local_70;
  undefined8 local_68;
  undefined8 uStack_60;
  undefined8 local_58;
  undefined8 uStack_50;
  undefined8 local_48;
  undefined8 local_40;

  local_40 = 0xfffffffffffffffe;
  uVar3 = *(uint *)(param_4 + 0x408);
  uVar4 = *(uint *)(param_4 + 0x920);
  if (uVar3 < uVar4) {
    if (_DAT_1458ab3dc < *(float *)(param_4 + 0x8d4) - *(float *)(param_4 + 0x92c)) {
      lVar10 = param_4 + 0x920;
      *(float *)(param_4 + 0x92c) = *(float *)(param_4 + 0x8d4);
      func_0x00014541f0e0(0x146aafed0,param_4,0x1a,0x146aafed0);
      local_68 = 0x146aaf118;
      uStack_60 = (undefined1 *)0x1;
      uStack_50 = 0x146aaf0f8;
      local_58 = lVar10;
      func_0x00014541f400();
      local_78 = local_90;
      func_0x0001454378d0();
      lVar10 = *(long *)(param_4 + 0x548);
      if (lVar10 == *(long *)(param_4 + 0x538)) {
        func_0x000145717d60();
      }
      lVar5 = *(long *)(param_4 + 0x540);
      puVar1 = (undefined4 *)(lVar5 + 0x10 + lVar10 * 0x20);
      *puVar1 = (undefined4)local_58;
      puVar1[1] = local_58._4_4_;
      puVar1[2] = (undefined4)uStack_50;
      puVar1[3] = uStack_50._4_4_;
      puVar1 = (undefined4 *)(lVar5 + lVar10 * 0x20);
      *puVar1 = (undefined4)local_68;
      puVar1[1] = local_68._4_4_;
      puVar1[2] = (undefined4)uStack_60;
      puVar1[3] = uStack_60._4_4_;
      *(long *)(param_4 + 0x548) = lVar10 + 1;
      func_0x000140002200();
      puVar8 = (undefined1 *)func_0x0001400021c0();
      if (puVar8 == (undefined1 *)0x0) {
        func_0x0001458a3b8b();
                    /* WARNING: Does not return */
        pcVar7 = (code *)invalidInstructionException();
        (*pcVar7)();
      }
      *puVar8 = 0x7b;
      local_68 = 1;
      local_58 = 1;
      uStack_50 = CONCAT71(uStack_50._1_7_,1);
      uStack_60 = puVar8;
      func_0x000145426da0();
      func_0x000145426da0();
      lVar10 = local_58;
      if (local_68 == local_58) {
        func_0x000145717840();
      }
      local_70 = local_68;
      local_80 = uStack_60;
      uStack_60[lVar10] = 0x7d;
      lVar5 = *(long *)(param_4 + 0x560);
      if (lVar5 == *(long *)(param_4 + 0x550)) {
        func_0x000145717c10();
      }
      lVar6 = *(long *)(param_4 + 0x558);
      *(long *)(lVar6 + lVar5 * 0x18) = local_70;
      *(undefined1 **)(lVar6 + 8 + lVar5 * 0x18) = local_80;
      *(long *)(lVar6 + 0x10 + lVar5 * 0x18) = lVar10 + 1;
      *(long *)(param_4 + 0x560) = lVar5 + 1;
      if (local_98 != 0) {
        func_0x0001400021d0();
      }
    }
  }
  else {
    fVar15 = (float)uVar4 * _DAT_146aaecb8 + _DAT_1458b9aa0;
    uVar9 = (int)(long)fVar15;
    if (fVar15 < 0.0) {
      uVar9 = 0;
    }
    *(uint *)(param_4 + 0x408) = uVar3 - uVar4;
    uVar11 = 0xffffffff;
    if (fVar15 <= _DAT_1458ab444) {
      uVar11 = uVar9;
    }
    *(undefined4 *)(param_4 + 0x920) = uVar11;
    uStack_60 = *(undefined1 **)(param_4 + 0x8a8);
    if (uStack_60 != (undefined1 *)0x0) {
      lVar10 = *(long *)(param_4 + 0x8b0);
      do {
        uVar13 = (ulong)((uint)*(ushort *)((long)uStack_60 + 0x36) * 2);
        uVar12 = 0xffffffffffffffff;
        do {
          param_6 = (ulong)*(ushort *)((long)uStack_60 + 0x36);
          if (uVar13 == 0) goto LAB_1454a8293;
          uVar2 = *(ushort *)((long)uStack_60 + 0x3a + uVar12 * 2);
          param_1 = (ulong)uVar2;
          param_6 = uVar12 + 1;
          uVar13 = uVar13 - 2;
          uVar12 = param_6;
        } while ((char)((uVar2 < 0x498) - (0x498 < uVar2)) == '\x01');
        if (uVar2 < 0x498 == 0x498 < uVar2) {
          *(uint *)((long)uStack_60 + 8 + param_6 * 4) = (uVar3 - uVar4) * 10000;
          goto LAB_1454a84df;
        }
LAB_1454a8293:
        bVar14 = lVar10 == 0;
        lVar10 = lVar10 + -1;
        if (bVar14) goto LAB_1454a84b0;
        uStack_60 = *(undefined1 **)((long)uStack_60 + 0x50 + param_6 * 8);
      } while( true );
    }
    uStack_60 = (undefined1 *)0x0;
LAB_1454a84b0:
    local_68 = param_4 + 0x8a8;
    local_58 = 0;
    local_48 = 0x498;
    uStack_50 = param_6;
    func_0x000145408070(param_1,param_4,&local_68,local_b8);
LAB_1454a84df:
    *(int *)(param_4 + 0x670) = *(int *)(param_4 + 0x670) + 1;
    *(int *)(param_4 + 0x8e0) = *(int *)(param_4 + 0x8e0) + 1;
  }
  return uVar4 <= uVar3;
}
