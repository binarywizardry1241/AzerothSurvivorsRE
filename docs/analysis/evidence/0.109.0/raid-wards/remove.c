
void entry(undefined8 param_1,undefined8 param_2,long *param_3,long param_4)

{
  ulong uVar1;
  long lVar2;
  long *plVar3;
  long *plVar4;
  ulong uVar5;
  long lVar6;
  
  uVar1 = *(ulong *)(param_4 + 0x10);
  if (uVar1 != 0) {
    plVar3 = *(long **)(param_4 + 8);
    lVar2 = *param_3;
    uVar5 = 0;
    do {
      if (plVar3[0x1e] == lVar2) {
        func_0x0001459167c0();
        if (uVar5 + 1 < uVar1) {
          lVar6 = ~uVar5 + uVar1;
          do {
            plVar4 = plVar3 + 0x3b;
            if (plVar3[0x59] == lVar2) {
              if ((plVar3[0x3e] != -1) && (plVar3[0x3e] != 0)) {
                func_0x0001400021d0();
              }
              if (*plVar4 != 0) {
                func_0x0001400021d0();
              }
              if ((plVar4[0xb] != -1) && (plVar4[0xb] != 0)) {
                func_0x0001400021d0();
              }
            }
            else {
              func_0x000145bfa0e7();
              uVar5 = uVar5 + 1;
            }
            lVar6 = lVar6 + -1;
            plVar3 = plVar4;
          } while (lVar6 != 0);
        }
        *(ulong *)(param_4 + 0x10) = uVar5;
        return;
      }
      uVar5 = uVar5 + 1;
      plVar3 = plVar3 + 0x3b;
    } while (uVar1 != uVar5);
  }
  return;
}

