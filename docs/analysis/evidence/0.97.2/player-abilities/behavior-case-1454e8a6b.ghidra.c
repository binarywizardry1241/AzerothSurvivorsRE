
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 entry(long param_1,long *param_2)

{
  code *pcVar1;
  long lVar2;
  undefined8 uVar3;
  uint uVar4;
  ulong uVar5;
  long unaff_RBP;
  long lVar6;
  undefined8 *unaff_R14;
  long lVar7;
  ulong uVar8;
  
  *(undefined4 *)(unaff_RBP + 0xe8) = *(undefined4 *)(unaff_R14 + 1);
  *(undefined8 *)(unaff_RBP + 0xe0) = *unaff_R14;
  func_0x0001454ee2a0(param_1,param_2,param_1,unaff_RBP + 0x90,unaff_RBP + 0xe0);
  uVar8 = *(ulong *)(unaff_RBP + 0xa0);
  if (uVar8 == 0) {
    if (*(long *)(unaff_RBP + 0x90) != 0) {
      func_0x0001400021d0();
    }
    return 0;
  }
  if (*(char *)((long)param_2 + 0x75) == '\x01') {
    lVar2 = *(long *)(unaff_RBP + 0x98);
    *(undefined1 *)(unaff_RBP + 0x127) = 1;
    func_0x00014540cb60();
    if ((param_2[1] == 0xf) &&
       (*(long *)(*param_2 + 7) == 0x73656c697373696d && *(long *)*param_2 == 0x6d5f656e61637261)) {
      *(long *)(unaff_RBP + 0xe0) = lVar2;
      *(ulong *)(unaff_RBP + 0xe8) = lVar2 + uVar8 * 8;
      *(long *)(unaff_RBP + 0xf0) = param_1 + 0x4c0;
      *(undefined1 *)(unaff_RBP + 0x127) = 1;
      func_0x000145532630();
      if (*(long *)(unaff_RBP + -0x28) == 0) {
        if (*(long *)(unaff_RBP + -0x38) != 0) {
          func_0x0001400021d0();
        }
      }
      else {
        if (*(long *)(unaff_RBP + 0x90) != 0) {
          func_0x0001400021d0();
        }
        *(undefined4 *)(unaff_RBP + 0x90) = *(undefined4 *)(unaff_RBP + -0x38);
        *(undefined4 *)(unaff_RBP + 0x94) = *(undefined4 *)(unaff_RBP + -0x34);
        *(undefined4 *)(unaff_RBP + 0x98) = *(undefined4 *)(unaff_RBP + -0x30);
        *(undefined4 *)(unaff_RBP + 0x9c) = *(undefined4 *)(unaff_RBP + -0x2c);
        uVar8 = *(ulong *)(unaff_RBP + -0x28);
        *(ulong *)(unaff_RBP + 0xa0) = uVar8;
      }
    }
    if (0x7ffffffffffffff8 < uVar8 * 8 || uVar8 >> 0x3d != 0) {
LAB_1454eb237:
      *(undefined1 *)(unaff_RBP + 0x127) = 1;
      func_0x0001458e721b();
                    /* WARNING: Does not return */
      pcVar1 = (code *)invalidInstructionException();
      (*pcVar1)();
    }
    if (uVar8 * 8 == 0) {
      lVar2 = 8;
      uVar5 = 0;
    }
    else {
      func_0x000140002200();
      lVar2 = func_0x0001400021c0();
      uVar5 = uVar8;
      if (lVar2 == 0) goto LAB_1454eb237;
    }
    *(ulong *)(unaff_RBP + 0x50) = uVar5;
    *(long *)(unaff_RBP + 0x58) = lVar2;
    *(undefined8 *)(unaff_RBP + 0x60) = 0;
    if (uVar8 != 0) {
      func_0x000145756ddd();
      *(ulong *)(unaff_RBP + 0x60) = uVar8;
    }
    *(undefined8 *)(unaff_RBP + 0xe8) = 0;
    *(undefined8 *)(unaff_RBP + 0xf0) = 1;
    *(long *)(unaff_RBP + 0xe0) = unaff_RBP + 0x50;
    func_0x000145537560();
    if (*(long *)(unaff_RBP + 0x90) != 0) {
      func_0x0001400021d0();
    }
    *(undefined8 *)(unaff_RBP + 0xa0) = *(undefined8 *)(unaff_RBP + 200);
    *(undefined4 *)(unaff_RBP + 0x90) = *(undefined4 *)(unaff_RBP + 0xb8);
    *(undefined4 *)(unaff_RBP + 0x94) = *(undefined4 *)(unaff_RBP + 0xbc);
    *(undefined4 *)(unaff_RBP + 0x98) = *(undefined4 *)(unaff_RBP + 0xc0);
    *(undefined4 *)(unaff_RBP + 0x9c) = *(undefined4 *)(unaff_RBP + 0xc4);
    if (*(long *)(unaff_RBP + 0x50) != 0) {
      func_0x0001400021d0();
    }
    lVar2 = *(long *)(unaff_RBP + 0xa0);
LAB_1454eb32e:
    lVar7 = *(long *)(unaff_RBP + 0x90);
    lVar6 = *(long *)(unaff_RBP + 0x98);
    if (lVar2 == 0) goto LAB_1454eb572;
    *(long *)(unaff_RBP + 0x118) = lVar7;
    lVar2 = lVar6 + lVar2 * 8;
  }
  else {
    if (((param_2[1] == 10) && (*(long *)(param_1 + 0x7b0) != 0)) &&
       ((short)((long *)*param_2)[1] == 0x746f && *(long *)*param_2 == 0x68735f64656d6961)) {
      lVar2 = uVar8 * 8 + -8;
      lVar6 = 0;
      do {
        if (*(long *)(*(long *)(unaff_RBP + 0x98) + lVar6 * 8) == *(long *)(param_1 + 0x7b0)) {
          func_0x000145756dd1();
          *(ulong *)(unaff_RBP + 0xa0) = uVar8 - 1;
          *(undefined1 *)(unaff_RBP + 0x127) = 1;
          func_0x0001454bead0();
          uVar8 = *(ulong *)(unaff_RBP + 0xa0);
          break;
        }
        lVar6 = lVar6 + 1;
        lVar2 = lVar2 + -8;
      } while (lVar2 != -8);
    }
    lVar2 = 0;
    if (uVar8 == 0) goto LAB_1454eb32e;
    *(undefined8 *)(unaff_RBP + 0xa0) = 1;
    *(undefined8 *)(unaff_RBP + 0x118) = *(undefined8 *)(unaff_RBP + 0x90);
    lVar6 = *(long *)(unaff_RBP + 0x98);
    lVar2 = lVar6 + 8;
  }
  lVar7 = 0;
  *(long *)(unaff_RBP + 0x88) = lVar6;
  do {
    uVar4 = (int)param_2[0xd] - 1;
    if (uVar4 < 10) {
                    /* WARNING: Could not emulate address calculation at 0x0001454eb3e7 */
                    /* WARNING: Treating indirect jump as call */
      uVar3 = (*(code *)((long)*(int *)((ulong)uVar4 * 4 + 0x1469ad03c) + 0x1469ad03c))();
      return uVar3;
    }
    *(int *)(unaff_RBP + 0xc0) = (int)param_2[0xe];
    *(long *)(unaff_RBP + 0xb8) = param_2[0xd];
    *(undefined4 *)(unaff_RBP + 0xe0) = 0;
    func_0x0001454ef3b0();
    lVar6 = *(long *)(unaff_RBP + 0x88) + lVar7;
    lVar7 = lVar7 + 8;
  } while (lVar6 + 8 != lVar2);
  lVar7 = *(long *)(unaff_RBP + 0x118);
LAB_1454eb572:
  if (lVar7 != 0) {
    func_0x0001400021d0();
  }
  return 1;
}

