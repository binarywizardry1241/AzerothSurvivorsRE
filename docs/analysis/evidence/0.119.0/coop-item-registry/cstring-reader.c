longlong * FUN_145cc58f0(longlong *param_1,undefined8 *param_2)

{
  char cVar1;
  code *pcVar2;
  longlong lVar3;
  longlong lVar4;
  undefined8 uVar5;
  char *pcVar6;
  longlong lStack_78;
  longlong lStack_70;
  longlong lStack_68;
  longlong lStack_60;
  longlong lStack_58;
  longlong lStack_50;
  undefined8 uStack_48;

  uStack_48 = 0xfffffffffffffffe;
  lStack_60 = 0;
  lStack_58 = 1;
  pcVar6 = (char *)*param_2;
  lVar4 = param_2[1];
  lVar3 = 0;
  do {
    lStack_50 = lVar3;
    if (lVar4 == 0) {
      *param_2 = pcVar6;
      param_2[1] = 0;
      param_1[1] = (longlong)&DAT_1475fb400;
      *param_1 = -1;
      if (lStack_60 != 0) {
LAB_145cc59a1:
        func_0x0001400021d0(lStack_58,lStack_60,1);
      }
      return param_1;
    }
    lVar4 = lVar4 + -1;
    cVar1 = *pcVar6;
    pcVar6 = pcVar6 + 1;
    *param_2 = pcVar6;
    param_2[1] = lVar4;
    if (cVar1 == '\0') {
      FUN_145f64930(&lStack_78,lStack_58,lVar3);
      lVar4 = lStack_70;
      if (lStack_78 == -1) {
        if (lStack_68 < 0) {
          uVar5 = 0;
LAB_145cc5a05:
          FUN_14613b1bb(uVar5,lStack_68);
                    /* WARNING: Does not return */
          pcVar2 = (code *)invalidInstructionException();
          (*pcVar2)();
        }
        if (lStack_68 == 0) {
          lVar4 = 1;
          lStack_78 = 0;
          lStack_68 = 0;
        }
        else {
          func_0x000140002200();
          uVar5 = 1;
          lVar4 = func_0x0001400021c0(lStack_68,1);
          if (lVar4 == 0) goto LAB_145cc5a05;
          func_0x000145f941db(lVar4,lStack_70,lStack_68);
          lStack_78 = lStack_68;
        }
      }
      *param_1 = lStack_78;
      param_1[1] = lVar4;
      param_1[2] = lStack_68;
      if (lStack_60 == 0) {
        return param_1;
      }
      goto LAB_145cc59a1;
    }
    if (lVar3 == lStack_60) {
      FUN_14613b0b0(&lStack_60);
    }
    *(char *)(lStack_58 + lVar3) = cVar1;
    lVar3 = lVar3 + 1;
  } while( true );
}
