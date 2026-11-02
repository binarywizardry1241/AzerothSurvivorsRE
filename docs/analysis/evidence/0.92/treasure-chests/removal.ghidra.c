/* Static Ghidra pseudocode from unmodified 0.92 EXE bytes.
   Evidence: ev_c83a0ee1c9eb3f6f22e2c464e6370a9c2e172cd435e19d665c1eb0c3c0a17678
   Generic GCC raw-image ABI; verify Win64 arguments against original disassembly.
   This is recovered analysis, not original source or gameplay implementation. */

/* WARNING: Control flow encountered bad instruction data */

void entry(undefined8 param_1,undefined8 param_2,ulong param_3,long param_4)

{
  ulong uVar1;
  long lVar2;
  long lVar3;
  long lVar4;
  undefined8 uVar5;
  long lVar6;
  code *pcVar7;
  undefined8 *puVar8;
  long lVar9;
  long lVar10;
  long lVar11;

  uVar1 = *(ulong *)(param_4 + 0x530);
  if (param_3 < uVar1) {
    lVar11 = *(long *)(param_4 + 0x528);
    lVar2 = *(long *)(lVar11 + param_3 * 0x48);
    lVar3 = *(long *)(lVar11 + 8 + param_3 * 0x48);
    lVar4 = *(long *)(lVar11 + 0x10 + param_3 * 0x48);
    uVar5 = *(undefined8 *)(lVar11 + 0x28 + param_3 * 0x48);
    func_0x0001457149f1(param_3,param_4,lVar11 + param_3 * 0x48 + 0x48,lVar11 + param_3 * 0x48,
                        (~param_3 + uVar1) * 0x48);
    *(ulong *)(param_4 + 0x530) = uVar1 - 1;
    if (lVar2 != -1) {
      func_0x000140002200();
      puVar8 = (undefined8 *)func_0x0001400021c0();
      if (puVar8 == (undefined8 *)0x0) {
        func_0x0001458a3b8b();
LAB_1454a5f6b:
                    /* WARNING: Does not return */
        pcVar7 = (code *)invalidInstructionException();
        (*pcVar7)();
      }
      *puVar8 = uVar5;
      lVar11 = *(long *)(param_4 + 0x548);
      if (lVar11 == *(long *)(param_4 + 0x538)) {
        func_0x000145717d60();
      }
      lVar6 = *(long *)(param_4 + 0x540);
      lVar9 = lVar11 * 0x20;
      *(undefined8 *)(lVar6 + lVar9) = 0x20;
      *(undefined8 **)(lVar6 + 8 + lVar9) = puVar8;
      *(undefined8 *)(lVar6 + 0x10 + lVar9) = 8;
      *(undefined2 *)(lVar6 + 0x18 + lVar9) = 0xaa;
      *(long *)(param_4 + 0x548) = lVar11 + 1;
      if (lVar4 != 0) {
        lVar11 = 0;
        do {
          uVar5 = *(undefined8 *)(lVar3 + lVar11);
          func_0x000140002200();
          puVar8 = (undefined8 *)func_0x0001400021c0();
          if (puVar8 == (undefined8 *)0x0) {
            func_0x0001458a3b8b();
            goto LAB_1454a5f6b;
          }
          *puVar8 = uVar5;
          lVar6 = *(long *)(param_4 + 0x548);
          if (lVar6 == *(long *)(param_4 + 0x538)) {
            func_0x000145717d60();
          }
          lVar9 = *(long *)(param_4 + 0x540);
          lVar10 = lVar6 * 0x20;
          *(undefined8 *)(lVar9 + lVar10) = 0x20;
          *(undefined8 **)(lVar9 + 8 + lVar10) = puVar8;
          *(undefined8 *)(lVar9 + 0x10 + lVar10) = 8;
          *(undefined2 *)(lVar9 + 0x18 + lVar10) = 0xaa;
          *(long *)(param_4 + 0x548) = lVar6 + 1;
          lVar11 = lVar11 + 8;
        } while (lVar4 << 3 != lVar11);
      }
      if (lVar2 != 0) {
                    /* WARNING: Bad instruction - Truncating control flow here */
        halt_baddata();
      }
      return;
    }
  }
  func_0x0001458a3c5b();
                    /* WARNING: Does not return */
  pcVar7 = (code *)invalidInstructionException();
  (*pcVar7)();
}
