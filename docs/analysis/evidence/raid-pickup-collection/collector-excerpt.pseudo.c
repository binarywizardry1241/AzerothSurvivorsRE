undefined8 * entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 *param_4)

{
  long lVar1;
  long lVar2;
  code *pcVar3;
  long lVar4;
  long *plVar5;
  long lVar6;
  long lVar7;
  long lVar8;
  long lVar9;
  long local_50;

  lVar9 = *param_3;
  lVar1 = param_3[1];
  if (lVar9 != lVar1) {
    lVar2 = param_3[2];
    do {
      lVar6 = *(long *)(lVar9 + 0x28);
      lVar9 = lVar9 + 0x48;
      lVar7 = *(long *)(lVar2 + 0x960) * 0x70;
      lVar4 = *(long *)(lVar2 + 0x958);
      while (lVar8 = lVar4, lVar7 != 0) {
        lVar7 = lVar7 + -0x70;
        lVar4 = lVar8 + 0x70;
        if ((*(int *)(lVar8 + 0x18) == 1) && (*(long *)(lVar8 + 0x20) == lVar6)) {
          *param_3 = lVar9;
          func_0x000140002200();
          plVar5 = (long *)func_0x0001400021c0();
          if (plVar5 == (long *)0x0) {
            func_0x000145da94eb();
                    /* WARNING: Does not return */
            pcVar3 = (code *)invalidInstructionException();
            (*pcVar3)();
          }
          *plVar5 = lVar6;
          local_50 = 1;
joined_r0x0001459d4deb:
          if (lVar9 != lVar1) {
            do {
              lVar6 = *(long *)(lVar9 + 0x28);
              lVar9 = lVar9 + 0x48;
              lVar7 = *(long *)(lVar2 + 0x960) * 0x70;
              lVar4 = *(long *)(lVar2 + 0x958);
              while (lVar8 = lVar4, lVar7 != 0) {
                lVar7 = lVar7 + -0x70;
                lVar4 = lVar8 + 0x70;
                if ((*(int *)(lVar8 + 0x18) == 1) && (*(long *)(lVar8 + 0x20) == lVar6)) {
                  if (local_50 == 4) {
                    func_0x000145c0d470();
                  }
                  plVar5[local_50] = lVar6;
                  local_50 = local_50 + 1;
                  goto joined_r0x0001459d4deb;
                }
              }
            } while (lVar9 != lVar1);
          }
          param_4[2] = local_50;
          *param_4 = 4;
          param_4[1] = plVar5;
          return param_4;
        }
      }
    } while (lVar9 != lVar1);
  }
  *param_4 = 0;
  param_4[1] = 8;
  param_4[2] = 0;
  return param_4;
}
