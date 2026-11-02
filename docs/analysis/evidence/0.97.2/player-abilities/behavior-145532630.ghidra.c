
undefined8 * entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 *param_4)

{
  long *plVar1;
  long lVar2;
  long lVar3;
  code *pcVar4;
  long *plVar5;
  long lVar6;
  long lVar7;
  long *plVar8;
  long local_50;
  
  plVar8 = (long *)*param_3;
  plVar1 = (long *)param_3[1];
  if (plVar8 != plVar1) {
    lVar2 = param_3[2];
    if (*(long *)(lVar2 + 0x10) != 0) {
      lVar3 = *(long *)(lVar2 + 8);
      do {
        lVar6 = *plVar8;
        plVar8 = plVar8 + 1;
        lVar7 = 0;
        do {
          if ((*(long *)(lVar3 + 0x88 + lVar7) == lVar6) &&
             ((*(long *)(lVar3 + 0x18 + lVar7) != -1 || (*(char *)(lVar3 + 0x158 + lVar7) != '\0')))
             ) {
            *param_3 = (long)plVar8;
            func_0x000140002200();
            plVar5 = (long *)func_0x0001400021c0();
            if (plVar5 == (long *)0x0) {
              func_0x0001458e721b();
                    /* WARNING: Does not return */
              pcVar4 = (code *)invalidInstructionException();
              (*pcVar4)();
            }
            *plVar5 = lVar6;
            local_50 = 1;
joined_r0x00014553271b:
            if ((plVar8 != plVar1) && (*(long *)(lVar2 + 0x10) != 0)) {
              lVar3 = *(long *)(lVar2 + 8);
              do {
                lVar6 = *plVar8;
                plVar8 = plVar8 + 1;
                lVar7 = 0;
                do {
                  if ((*(long *)(lVar3 + 0x88 + lVar7) == lVar6) &&
                     ((*(long *)(lVar3 + 0x18 + lVar7) != -1 ||
                      (*(char *)(lVar3 + 0x158 + lVar7) != '\0')))) {
                    if (local_50 == 4) {
                      func_0x000145757d40();
                    }
                    plVar5[local_50] = lVar6;
                    local_50 = local_50 + 1;
                    goto joined_r0x00014553271b;
                  }
                  lVar7 = lVar7 + 0x160;
                } while (*(long *)(lVar2 + 0x10) * 0x160 - lVar7 != 0);
              } while (plVar8 != plVar1);
            }
            param_4[2] = local_50;
            *param_4 = 4;
            param_4[1] = plVar5;
            return param_4;
          }
          lVar7 = lVar7 + 0x160;
        } while (*(long *)(lVar2 + 0x10) * 0x160 - lVar7 != 0);
      } while (plVar8 != plVar1);
    }
  }
  *param_4 = 0;
  param_4[1] = 8;
  param_4[2] = 0;
  return param_4;
}

