
undefined8 * entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 *param_4)

{
  long *plVar1;
  long lVar2;
  code *pcVar3;
  long lVar4;
  long *plVar5;
  long lVar6;
  long lVar7;
  long lVar8;
  long *plVar9;
  long local_50;
  
  plVar9 = (long *)*param_3;
  plVar1 = (long *)param_3[1];
  if (plVar9 != plVar1) {
    lVar2 = param_3[2];
    do {
      lVar6 = *plVar9;
      plVar9 = plVar9 + 1;
      lVar7 = *(long *)(lVar2 + 0x10) * 0x160;
      lVar4 = *(long *)(lVar2 + 8);
      while (lVar8 = lVar4, lVar7 != 0) {
        lVar7 = lVar7 + -0x160;
        lVar4 = lVar8 + 0x160;
        if ((*(long *)(lVar8 + 0x88) == lVar6) && ((*(byte *)(lVar8 + 0x68) & 1) == 0)) {
          *param_3 = (long)plVar9;
          func_0x000140002200();
          plVar5 = (long *)func_0x0001400021c0();
          if (plVar5 == (long *)0x0) {
            func_0x0001458e721b();
                    /* WARNING: Does not return */
            pcVar3 = (code *)invalidInstructionException();
            (*pcVar3)();
          }
          *plVar5 = lVar6;
          local_50 = 1;
joined_r0x0001455322bb:
          if (plVar9 != plVar1) {
            do {
              lVar6 = *plVar9;
              plVar9 = plVar9 + 1;
              lVar7 = *(long *)(lVar2 + 0x10) * 0x160;
              lVar4 = *(long *)(lVar2 + 8);
              while (lVar8 = lVar4, lVar7 != 0) {
                lVar7 = lVar7 + -0x160;
                lVar4 = lVar8 + 0x160;
                if ((*(long *)(lVar8 + 0x88) == lVar6) && ((*(byte *)(lVar8 + 0x68) & 1) == 0)) {
                  if (local_50 == 4) {
                    func_0x000145757d40();
                  }
                  plVar5[local_50] = lVar6;
                  local_50 = local_50 + 1;
                  goto joined_r0x0001455322bb;
                }
              }
            } while (plVar9 != plVar1);
          }
          param_4[2] = local_50;
          *param_4 = 4;
          param_4[1] = plVar5;
          return param_4;
        }
      }
    } while (plVar9 != plVar1);
  }
  *param_4 = 0;
  param_4[1] = 8;
  param_4[2] = 0;
  return param_4;
}

