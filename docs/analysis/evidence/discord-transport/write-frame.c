undefined8
FUN_14006b080(undefined8 param_1,undefined8 param_2,undefined4 param_3,undefined8 param_4,
             undefined8 param_5)

{
  code *pcVar1;
  long lVar2;
  char cVar3;
  undefined8 uVar4;
  long lVar5;
  long *plStack_a0;
  undefined8 uStack_98;
  undefined8 uStack_90;
  long lStack_88;
  undefined8 uStack_80;
  long lStack_78;
  long lStack_70;
  undefined8 uStack_68;
  long lStack_60;
  undefined4 *puStack_58;
  undefined8 uStack_48;

  uStack_48 = 0xfffffffffffffffe;
  lStack_88 = 0;
  uStack_80 = 1;
  lStack_78 = 0;
  uStack_90 = 0x60000020;
  plStack_a0 = &lStack_88;
  uStack_98 = 0x145dd0810;
  cVar3 = func_0x000142aeb950(param_3,param_4,&plStack_a0,param_5);
  lVar2 = lStack_78;
  if (cVar3 == '\0') {
    lVar5 = lStack_78 + 8;
    lStack_70 = lStack_88;
    uStack_68 = uStack_80;
    if (-1 < lVar5) {
      func_0x000140002200();
      puStack_58 = (undefined4 *)func_0x0001400021c0();
      if (puStack_58 != (undefined4 *)0x0) {
        *puStack_58 = param_3;
        puStack_58[1] = (int)lVar2;
        if (lVar2 != 0) {
          func_0x000145bfa0e7();
        }
        lStack_60 = lVar5;
        uVar4 = FUN_1400b2680();
        func_0x0001400021d0();
        if (lStack_70 != 0) {
          func_0x0001400021d0();
        }
        return uVar4;
      }
    }
    func_0x000145d992bb();
  }
  else {
    func_0x000145d995d0();
  }
                    /* WARNING: Does not return */
  pcVar1 = (code *)invalidInstructionException();
  (*pcVar1)();
}
