
undefined1  [16] entry(undefined8 param_1,undefined8 param_2,long param_3,short *param_4)

{
  long *plVar1;
  code *pcVar2;
  long lVar3;
  undefined8 uVar4;
  undefined1 auVar5 [16];
  long local_38 [3];
  
  if (param_3 == 2) {
    if (*param_4 == 0x687a) {
      lVar3 = 0x1473e5e88;
    }
    else if (*param_4 == 0x616a) {
      lVar3 = 0x1473e5eb8;
    }
    else {
      if (*param_4 != 0x6f6b) goto LAB_145cc3474;
      lVar3 = 0x1473e5ee8;
    }
    uVar4 = *(undefined8 *)(lVar3 + 0x10);
    param_1 = *(undefined8 *)(lVar3 + 0x18);
    plVar1 = *(long **)(lVar3 + 0x20);
    lVar3 = *(long *)(lVar3 + 0x28);
    func_0x000145f42ab0(param_1,uVar4,uVar4,local_38,param_1);
    if (local_38[0] != -1) {
      if (local_38[0] != 0) {
        func_0x0001400021d0();
      }
      goto LAB_145cc3476;
    }
    if (lVar3 == 10) {
      if ((short)plVar1[1] == 0x6674 && *plVar1 == 0x742e63735f737a61) {
        func_0x000140002200();
        lVar3 = func_0x0001400021c0();
        if (lVar3 == 0) {
          func_0x00014620896b();
                    /* WARNING: Does not return */
          pcVar2 = (code *)invalidInstructionException();
          (*pcVar2)();
        }
      }
      else if ((short)plVar1[1] == 0x6674 && *plVar1 == 0x742e706a5f737a61) {
        func_0x000140002200();
        lVar3 = func_0x0001400021c0();
        if (lVar3 == 0) {
          func_0x00014620896b();
                    /* WARNING: Does not return */
          pcVar2 = (code *)invalidInstructionException();
          (*pcVar2)();
        }
      }
      else {
        if ((short)plVar1[1] != 0x6674 || *plVar1 != 0x742e726b5f737a61) goto LAB_145cc3474;
        func_0x000140002200();
        lVar3 = func_0x0001400021c0();
        if (lVar3 == 0) {
          func_0x00014620896b();
                    /* WARNING: Does not return */
          pcVar2 = (code *)invalidInstructionException();
          (*pcVar2)();
        }
      }
      func_0x00014606171b();
      func_0x000145f432c0();
      goto LAB_145cc3476;
    }
  }
LAB_145cc3474:
  uVar4 = 0;
LAB_145cc3476:
  auVar5._8_8_ = param_1;
  auVar5._0_8_ = uVar4;
  return auVar5;
}

