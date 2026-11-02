
undefined8
entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,long *param_4,ulong *param_5)

{
  int *piVar1;
  ulong uVar2;
  ulong uVar3;
  undefined8 uVar4;
  undefined8 uVar5;
  ulong uVar6;
  ulong uVar7;
  ulong uVar8;
  bool bVar9;
  undefined1 auVar10 [16];
  undefined8 local_58;
  long local_48;

  uVar5 = param_3;
  if (*(char *)((long)param_4 + 0x41) == '\0') {
    do {
      func_0x000145c20150();
      if ((int)local_58 == 1) {
        *param_4 = local_48;
      }
      else {
        if (*(char *)((long)param_4 + 0x41) != '\0') {
          return 0;
        }
        *(undefined1 *)((long)param_4 + 0x41) = 1;
        if ((param_4[1] != *param_4 | *(byte *)(param_4 + 8)) != 1) {
          return 0;
        }
      }
      auVar10 = func_0x00014012c290();
      piVar1 = auVar10._0_8_;
      uVar4 = uVar5;
      if ((6 < auVar10._8_8_) && (*(int *)((long)piVar1 + 3) == 0x7c647261 && *piVar1 == 0x61626174)
         ) {
        uVar7 = (long)piVar1 + 7;
        uVar8 = auVar10._8_8_ - 7;
        *param_5 = 0;
        param_5[1] = uVar8;
        param_5[2] = uVar7;
        param_5[3] = uVar8;
        param_5[4] = 0;
        param_5[5] = uVar8;
        param_5[6] = 0x2c0000002c;
        *(undefined1 *)(param_5 + 7) = 1;
        *(undefined2 *)(param_5 + 8) = 1;
        uVar6 = 0;
        bVar9 = false;
        while (uVar4 = param_3, local_58 = uVar5, uVar2 = uVar6, !bVar9) {
          do {
            if (uVar8 < uVar2) {
LAB_145c0e604:
              *(undefined1 *)((long)param_5 + 0x41) = 1;
              bVar9 = true;
              uVar6 = uVar2;
              goto LAB_145c0e614;
            }
            if (uVar8 - uVar2 < 0x10) {
              uVar3 = 0;
              if (uVar8 == uVar2) {
LAB_145c0e5fd:
                param_5[4] = uVar8;
                uVar2 = uVar8;
                goto LAB_145c0e604;
              }
              while (*(char *)(uVar7 + uVar2 + uVar3) != ',') {
                uVar3 = uVar3 + 1;
                if (uVar8 - uVar2 == uVar3) goto LAB_145c0e5fd;
              }
            }
            else {
              auVar10 = func_0x000145f6f460();
              uVar3 = auVar10._8_8_;
              if (auVar10._0_8_ != 1) goto LAB_145c0e5fd;
            }
            uVar6 = uVar3 + uVar2 + 1;
            param_5[4] = uVar6;
            uVar3 = uVar3 + uVar2;
            uVar2 = uVar6;
          } while ((uVar8 <= uVar3) || (*(char *)(uVar7 + uVar3) != ','));
          *param_5 = uVar6;
          bVar9 = false;
LAB_145c0e614:
          uVar2 = func_0x000145b2bbd0();
          if ((uVar2 & 1) != 0) {
            return 1;
          }
        }
      }
      uVar5 = uVar4;
    } while (*(char *)((long)param_4 + 0x41) != '\x01');
  }
  return 0;
}
