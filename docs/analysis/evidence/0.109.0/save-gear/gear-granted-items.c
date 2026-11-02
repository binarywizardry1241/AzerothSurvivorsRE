undefined8 * entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 *param_4)

{
  undefined4 uVar1;
  long lVar2;
  code *pcVar3;
  char cVar4;
  undefined4 *puVar5;
  long lVar6;
  long lVar7;
  long local_50;

  lVar2 = param_3[1];
  lVar6 = *param_3;
  do {
    lVar7 = lVar6;
    if (lVar7 == lVar2) {
      *param_4 = 0;
      param_4[1] = 4;
      param_4[2] = 0;
      return param_4;
    }
    lVar6 = lVar7 + 0x40;
    *param_3 = lVar6;
    cVar4 = func_0x0001458e4e20();
  } while (cVar4 == '\0');
  uVar1 = *(undefined4 *)(lVar7 + 0x30);
  func_0x000140002200();
  puVar5 = (undefined4 *)func_0x0001400021c0();
  if (puVar5 == (undefined4 *)0x0) {
    func_0x000145d992bb();
                    /* WARNING: Does not return */
    pcVar3 = (code *)invalidInstructionException();
    (*pcVar3)();
  }
  *puVar5 = uVar1;
  local_50 = 1;
  while (lVar7 = lVar6, lVar6 != lVar2) {
    while( true ) {
      cVar4 = func_0x0001458e4e20();
      lVar6 = lVar7 + 0x40;
      if (cVar4 == '\0') break;
      uVar1 = *(undefined4 *)(lVar7 + 0x30);
      if (local_50 == 4) {
        func_0x000145bfa970();
      }
      puVar5[local_50] = uVar1;
      local_50 = local_50 + 1;
      lVar7 = lVar6;
      if (lVar6 == lVar2) goto LAB_1459c327e;
    }
  }
LAB_1459c327e:
  param_4[2] = local_50;
  *param_4 = 4;
  param_4[1] = puVar5;
  return param_4;
}
