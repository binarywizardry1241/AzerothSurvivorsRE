void FUN_140105ab0(undefined8 param_1,undefined8 param_2,undefined8 param_3,long param_4)

{
  code *pcVar1;
  char cVar2;
  long lVar3;
  long lVar4;
  ulong uVar5;
  long lVar6;
  long lVar7;
  undefined1 auStack_a0 [24];
  long lStack_88;
  undefined4 uStack_80;
  undefined4 uStack_7c;
  undefined4 uStack_78;
  undefined4 uStack_74;
  undefined4 uStack_70;
  undefined4 uStack_6c;
  undefined4 uStack_68;
  undefined4 uStack_64;
  ulong uStack_60;
  undefined8 uStack_58;
  undefined1 uStack_49;
  undefined8 uStack_48;

  uStack_48 = 0xfffffffffffffffe;
  lVar4 = *(long *)(param_4 + 0x18);
  *(undefined8 *)(param_4 + 0x18) = 0xffffffffffffffff;
  if (lVar4 != -1) {
    uStack_80 = *(undefined4 *)(param_4 + 0x20);
    uStack_7c = *(undefined4 *)(param_4 + 0x24);
    uStack_78 = *(undefined4 *)(param_4 + 0x28);
    uStack_74 = *(undefined4 *)(param_4 + 0x2c);
    uStack_70 = *(undefined4 *)(param_4 + 0x30);
    uStack_6c = *(undefined4 *)(param_4 + 0x34);
    uStack_68 = *(undefined4 *)(param_4 + 0x38);
    uStack_64 = *(undefined4 *)(param_4 + 0x3c);
    uStack_60 = *(ulong *)(param_4 + 0x40);
    uStack_49 = 1;
    lStack_88 = lVar4;
    func_0x0001400af1a0(param_1,lVar4,&lStack_88,auStack_a0);
    if (0x7ffffffffffffffc < uStack_60 * 4 || uStack_60 >> 0x3e != 0) {
LAB_140105b65:
      func_0x000145d992bb();
                    /* WARNING: Does not return */
      pcVar1 = (code *)invalidInstructionException();
      (*pcVar1)();
    }
    uStack_58 = CONCAT44(uStack_64,uStack_68);
    uVar5 = uStack_60;
    if (uStack_60 * 4 != 0) {
      func_0x000140002200();
      lVar3 = func_0x0001400021c0();
      if (lVar3 == 0) goto LAB_140105b65;
    }
    if (uVar5 != 0) {
      func_0x000145bfa0e7();
    }
    uStack_49 = 1;
    cVar2 = func_0x0001458d8080();
    if (cVar2 == '\0') {
      lVar3 = CONCAT44(uStack_7c,uStack_80);
      lVar6 = CONCAT44(uStack_74,uStack_78);
      if (lVar6 != 0) {
        lVar7 = lVar3 + 8;
        do {
          if (*(long *)(lVar7 + -8) != 0) {
            func_0x0001400021d0();
          }
          lVar7 = lVar7 + 0x20;
          lVar6 = lVar6 + -1;
        } while (lVar6 != 0);
      }
      if (lVar4 != 0) {
        func_0x0001400021d0(0,lVar4 << 5,lVar4 << 5,lVar3,8);
      }
      if (CONCAT44(uStack_6c,uStack_70) != 0) {
        func_0x0001400021d0();
      }
    }
    else {
      uStack_49 = 0;
      func_0x0001401838a0();
    }
  }
  return;
}
