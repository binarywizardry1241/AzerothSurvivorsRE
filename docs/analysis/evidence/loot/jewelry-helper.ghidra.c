
void entry(void)

{
  int iVar1;
  code *pcVar2;
  undefined8 *in_RCX;
  long lVar3;
  ulong uVar4;
  ulong uVar5;
  undefined1 uVar6;
  ulong uVar7;
  long local_b0;
  long local_a8;
  ulong local_a0;
  undefined8 local_80;
  long local_50;

  func_0x000140106870();
  local_50 = 0;
  if (local_a0 != 0) {
    uVar7 = 0;
    do {
      iVar1 = *(int *)(local_a8 + uVar7 * 4);
      if ((iVar1 - 0x30U < 10) ||
         ((((uVar5 = uVar7, iVar1 == 0x2b || (iVar1 == 0x2d)) && (uVar7 + 1 < local_a0)) &&
          (*(int *)(local_a8 + 4 + uVar7 * 4) - 0x30U < 10)))) {
        uVar4 = uVar7 + 1;
        uVar5 = uVar4;
        uVar6 = 1;
        if (uVar4 < local_a0) {
          do {
            iVar1 = *(int *)(local_a8 + uVar4 * 4);
            if (((9 < iVar1 - 0x30U) && (iVar1 != 0x25)) &&
               (uVar5 = uVar4, uVar6 = 1, iVar1 != 0x2e)) break;
            uVar4 = uVar4 + 1;
            uVar5 = local_a0;
            uVar6 = 1;
          } while (local_a0 != uVar4);
        }
      }
      else {
        do {
          iVar1 = *(int *)(local_a8 + uVar5 * 4);
          if ((iVar1 - 0x30U < 10) ||
             (((uVar4 = uVar5 + 1, iVar1 == 0x2d || (iVar1 == 0x2b)) &&
              ((uVar4 < local_a0 && (*(int *)(local_a8 + uVar4 * 4) - 0x30U < 10)))))) {
            uVar6 = 0;
            goto LAB_1454191ae;
          }
          uVar5 = uVar4;
        } while (local_a0 != uVar4);
        uVar5 = local_a0;
        uVar6 = 0;
      }
LAB_1454191ae:
      if ((uVar5 < uVar7) || (local_a0 < uVar5)) {
        func_0x0001458e77c0();
                    /* WARNING: Does not return */
        pcVar2 = (code *)invalidInstructionException();
        (*pcVar2)();
      }
      local_80 = 0;
      if (uVar5 != uVar7) {
        func_0x000145757d40();
      }
      func_0x00014008acf0();
      if (local_50 == 0) {
        func_0x0001457580b0();
      }
      lVar3 = local_50 * 0x20;
      *(undefined8 *)(lVar3 + 8) = 0;
      *(undefined8 *)(lVar3 + 0x10) = 1;
      *(undefined8 *)(lVar3 + 0x18) = local_80;
      *(undefined1 *)(lVar3 + 0x20) = uVar6;
      local_50 = local_50 + 1;
      uVar7 = uVar5;
    } while (uVar5 < local_a0);
  }
  in_RCX[2] = local_50;
  *in_RCX = 0;
  in_RCX[1] = 8;
  if (local_b0 != 0) {
    func_0x0001400021d0();
  }
  return;
}
