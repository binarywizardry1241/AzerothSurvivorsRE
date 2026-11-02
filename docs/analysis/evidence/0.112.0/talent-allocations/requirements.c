undefined8
FUN_1459924d0(undefined8 param_1,undefined8 param_2,undefined1 *param_3,int *param_4,long param_5)

{
  long lVar1;
  long lVar2;
  int iVar3;
  long lVar4;
  byte bVar5;
  long lVar6;
  long lVar7;
  long lVar8;
  undefined1 auVar9 [16];

  if (*param_4 == 1) {
    lVar7 = *(long *)(param_4 + 2);
    lVar1 = *(long *)(param_4 + 4);
    param_4[2] = 0;
    param_4[3] = 0;
    if (lVar7 != 0) {
      auVar9 = FUN_1459a2ab0(param_3,param_5,lVar7,*param_3,lVar1);
      lVar7 = auVar9._8_8_;
      if (lVar7 != 0) {
        lVar2 = *(long *)(param_5 + 0x10);
        if (lVar2 == 0) {
          if (*(char *)(lVar7 + 0x9a) == '\0') {
            return 1;
          }
        }
        else {
          lVar6 = *(long *)(param_5 + 8);
          lVar8 = 0;
          do {
            if ((*(long *)(*(long *)(lVar6 + lVar8) + 0x38) == lVar1) &&
               (iVar3 = func_0x000145c0a3e7(), iVar3 == 0)) {
              bVar5 = *(byte *)(lVar6 + 8 + lVar8);
              goto LAB_145992571;
            }
            lVar8 = lVar8 + 0x10;
          } while (lVar2 << 4 != lVar8);
          bVar5 = 0;
LAB_145992571:
          if (*(byte *)(lVar7 + 0x9a) <= bVar5) {
            return 1;
          }
        }
      }
    }
    param_4[0] = 0;
    param_4[1] = 0;
  }
  if ((char)param_4[6] != '\0') {
    lVar7 = *(long *)(param_4 + 8);
    lVar1 = *(long *)(param_4 + 10);
    param_4[8] = 0;
    param_4[9] = 0;
    if (lVar7 != 0) {
      auVar9 = FUN_1459a2ab0();
      lVar7 = auVar9._8_8_;
      if (lVar7 != 0) {
        lVar2 = *(long *)(param_5 + 0x10);
        if (lVar2 != 0) {
          lVar6 = *(long *)(param_5 + 8);
          lVar8 = 0;
          do {
            lVar4 = *(long *)(lVar6 + lVar8);
            if ((*(long *)(lVar4 + 0x38) == lVar1) &&
               (lVar4 = func_0x000145c0a3e7(), (int)lVar4 == 0)) {
              if (*(byte *)(lVar6 + 8 + lVar8) < *(byte *)(lVar7 + 0x9a)) {
                return 0;
              }
              return 1;
            }
            auVar9._8_8_ = lVar7;
            auVar9._0_8_ = lVar4;
            lVar8 = lVar8 + 0x10;
          } while (lVar2 << 4 != lVar8);
        }
        if (*(char *)(auVar9._8_8_ + 0x9a) == '\0') {
          return 1;
        }
      }
    }
  }
  return 0;
}
