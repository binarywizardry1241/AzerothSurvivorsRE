
undefined8 * entry(undefined8 param_1,undefined8 param_2,long param_3,undefined8 *param_4)

{
  long *plVar1;
  code *pcVar2;
  undefined8 *puVar3;
  long lVar4;
  long lVar5;
  long lVar6;
  long lVar7;
  long local_38;

  func_0x000140002200();
  puVar3 = (undefined8 *)func_0x0001400021c0();
  if (puVar3 == (undefined8 *)0x0) {
    func_0x000145da94d1();
                    /* WARNING: Does not return */
    pcVar2 = (code *)invalidInstructionException();
    (*pcVar2)();
  }
  *puVar3 = 0x14723ebc0;
  puVar3[1] = 0x14723edc0;
  local_38 = 2;
  if (*(long *)(param_3 + 0x10) != 0) {
    lVar6 = *(long *)(param_3 + 8);
    lVar5 = *(long *)(param_3 + 0x10) << 4;
    lVar7 = 0;
    do {
      if ((*(long *)(*(long *)(lVar6 + lVar7) + 0x38) == 0xd) &&
         (plVar1 = *(long **)(*(long *)(lVar6 + lVar7) + 0x30),
         *(long *)((long)plVar1 + 5) == 0x726572756f766564 && *plVar1 == 0x7665645f6c756f73)) {
        if (*(char *)(lVar6 + 8 + lVar7) != '\0') {
          func_0x000145c0d930();
          puVar3[2] = 0x14723ee60;
          local_38 = 3;
          lVar7 = 3;
          goto LAB_1459a3370;
        }
        break;
      }
      lVar7 = lVar7 + 0x10;
    } while (lVar5 != lVar7);
    lVar7 = 2;
LAB_1459a3370:
    lVar4 = 0;
    do {
      if (*(long *)(*(long *)(lVar6 + lVar4) + 0x38) == 9) {
        plVar1 = *(long **)(*(long *)(lVar6 + lVar4) + 0x30);
        if ((char)plVar1[1] == 'k' && *plVar1 == 0x6e696c5f6c756f73) {
          if (*(char *)(lVar6 + 8 + lVar4) != '\0') {
            if (lVar7 == 2) {
              func_0x000145c0d930();
            }
            puVar3[lVar7] = 0x147221848;
            local_38 = lVar7 + 1;
          }
          break;
        }
      }
      lVar4 = lVar4 + 0x10;
    } while (lVar5 != lVar4);
  }
  param_4[2] = local_38;
  *param_4 = 2;
  param_4[1] = puVar3;
  return param_4;
}
