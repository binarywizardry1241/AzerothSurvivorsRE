/* Static Ghidra pseudocode from unmodified 0.92 EXE bytes.
   Evidence: ev_cda8549e8685a1a0a1dc1f11c83afcfc27073f5d082046172f17dfc72b0cc929
   Generic GCC raw-image ABI; verify Win64 arguments against original disassembly.
   This is recovered analysis, not original source or gameplay implementation. */

/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long param_3,long param_4)

{
  undefined8 uVar1;
  code *pcVar2;
  char cVar3;
  undefined4 *puVar4;
  long lVar5;
  long lVar6;
  long lVar7;
  float fVar8;
  float fVar9;

  if ((*(char *)(param_4 + 0x94e) == '\x01') && (*(long *)(param_4 + 0x530) != 0)) {
    lVar7 = *(long *)(param_4 + 0x528);
    lVar6 = 0;
    lVar5 = 0;
    do {
      if ((*(long *)(lVar7 + 0x28 + lVar5) == param_3) && (*(int *)(lVar7 + 0x20 + lVar5) == 2)) {
        uVar1 = *(undefined8 *)(lVar7 + 0x34 + lVar5);
        fVar8 = (float)uVar1 - (float)*(undefined8 *)(param_4 + 1000);
        fVar9 = (float)((ulong)uVar1 >> 0x20) -
                (float)((ulong)*(undefined8 *)(param_4 + 1000) >> 0x20);
        if (_DAT_1458a85d0 < SQRT(fVar9 * fVar9 + fVar8 * fVar8)) {
          return;
        }
        cVar3 = func_0x0001454a81a0(param_4,lVar6);
        if (cVar3 == '\0') {
          return;
        }
        func_0x0001454a5d50();
        func_0x000140002200();
        puVar4 = (undefined4 *)func_0x0001400021c0();
        if (puVar4 == (undefined4 *)0x0) {
          func_0x0001458a3b8b();
                    /* WARNING: Does not return */
          pcVar2 = (code *)invalidInstructionException();
          (*pcVar2)();
        }
        *puVar4 = 0x4b4;
        lVar7 = *(long *)(param_4 + 0x548);
        if (lVar7 == *(long *)(param_4 + 0x538)) {
          func_0x000145717d60();
        }
        lVar6 = *(long *)(param_4 + 0x540);
        lVar5 = lVar7 * 0x20;
        *(undefined8 *)(lVar6 + lVar5) = 0x20;
        *(undefined4 **)(lVar6 + 8 + lVar5) = puVar4;
        *(undefined8 *)(lVar6 + 0x10 + lVar5) = 4;
        *(undefined2 *)(lVar6 + 0x18 + lVar5) = 0x2d2;
        *(long *)(param_4 + 0x548) = lVar7 + 1;
        if (*(char *)(param_4 + 0x94e) != '\x01') {
          return;
        }
        if (*(int *)(param_4 + 0x8e0) == 0) {
          return;
        }
        if (*(char *)(param_4 + 0x947) != '\0') {
          return;
        }
                    /* WARNING: Bad instruction - Truncating control flow here */
        halt_baddata();
      }
      lVar6 = lVar6 + 1;
      lVar5 = lVar5 + 0x48;
    } while (*(long *)(param_4 + 0x530) * 0x48 != lVar5);
  }
  return;
}
