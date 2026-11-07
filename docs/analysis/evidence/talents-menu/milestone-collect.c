undefined8 *
FUN_1400a2ea0(undefined8 param_1,undefined8 param_2,long param_3,undefined8 *param_4,long param_5)

{
  long lVar1;
  code *pcVar2;
  char cVar3;
  long *plVar4;
  long local_50;

  if (param_3 != param_5) {
    do {
      cVar3 = func_0x00014590f1f0();
      if (cVar3 != '\0') {
        func_0x000140002200();
        plVar4 = (long *)func_0x0001400021c0();
        if (plVar4 != (long *)0x0) {
          *plVar4 = param_3;
          param_3 = param_3 + 0x78;
          local_50 = 1;
          if (param_3 != param_5) {
            do {
              cVar3 = func_0x00014590f1f0();
              lVar1 = param_3 + 0x78;
              if (cVar3 != '\0') {
                if (local_50 == 4) {
                  func_0x000145bfa970();
                }
                plVar4[local_50] = param_3;
                local_50 = local_50 + 1;
              }
              param_3 = lVar1;
            } while (lVar1 != param_5);
          }
          param_4[2] = local_50;
          *param_4 = 4;
          param_4[1] = plVar4;
          return param_4;
        }
        func_0x000145d992bb();
                    /* WARNING: Does not return */
        pcVar2 = (code *)invalidInstructionException();
        (*pcVar2)();
      }
      param_3 = param_3 + 0x78;
    } while (param_3 != param_5);
  }
  *param_4 = 0;
  param_4[1] = 8;
  param_4[2] = 0;
  return param_4;
}
