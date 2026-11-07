
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_14595b75c(undefined8 param_1,long param_2,undefined8 param_3,undefined8 *param_4)

{
  undefined2 uVar1;
  undefined8 uVar2;
  undefined8 uVar3;
  code *pcVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  undefined4 uVar8;
  undefined4 uVar9;
  undefined4 uVar10;
  long unaff_RBX;
  long lVar11;
  long unaff_RBP;
  char cVar12;
  long lVar13;
  long unaff_R14;
  undefined4 uVar14;
  
  uVar1 = *(undefined2 *)((long)param_4 + 0x2e);
  uVar2 = *param_4;
  uVar3 = param_4[1];
  *(undefined4 *)(unaff_RBP + 0x178) = *(undefined4 *)(param_4 + 2);
  func_0x0001459577f0(param_1,param_2,*(undefined8 *)(unaff_RBP + 0x180),param_2);
  cVar12 = (char)param_1;
  func_0x000145957320();
  if (cVar12 != '\x02') {
    uVar14 = *(undefined4 *)(unaff_R14 + 0x14);
    uVar5 = *(undefined4 *)(unaff_R14 + 0x18);
    uVar6 = *(undefined4 *)(unaff_R14 + 0x1c);
    uVar7 = *(undefined4 *)(unaff_R14 + 0x20);
    uVar8 = *(undefined4 *)(unaff_R14 + 0x21);
    uVar9 = *(undefined4 *)(unaff_R14 + 0x25);
    uVar10 = *(undefined4 *)(unaff_R14 + 0x29);
    *(undefined4 *)(unaff_RBP + 0x119) = *(undefined4 *)(unaff_R14 + 0x1d);
    *(undefined4 *)(unaff_RBP + 0x11d) = uVar8;
    *(undefined4 *)(unaff_RBP + 0x121) = uVar9;
    *(undefined4 *)(unaff_RBP + 0x125) = uVar10;
    *(undefined4 *)(unaff_RBP + 0x110) = uVar14;
    *(undefined4 *)(unaff_RBP + 0x114) = uVar5;
    *(undefined4 *)(unaff_RBP + 0x118) = uVar6;
    *(undefined4 *)(unaff_RBP + 0x11c) = uVar7;
    *(char *)(unaff_RBP + 0x129) = cVar12;
    *(undefined2 *)(unaff_RBP + 0x12a) = uVar1;
    func_0x00014594d490();
  }
  if (*(ulong *)(unaff_RBP + 0xf0) < *(ulong *)(param_2 + 0x568)) {
    lVar11 = *(long *)(param_2 + 0x560);
    lVar13 = lVar11 + unaff_RBX;
    uVar14 = func_0x0001459ca8d0();
    if (*(long *)(lVar11 + 0x18 + unaff_RBX) != -1) {
      *(undefined8 *)(lVar13 + 0x38) = uVar2;
      *(undefined8 *)(lVar13 + 0x40) = uVar3;
      *(undefined1 *)(unaff_RBP + 0x177) = 1;
      func_0x000144945530();
      lVar11 = unaff_RBX + lVar11;
      if (*(long *)(lVar11 + 0x18) != 0) {
        func_0x0001400021d0();
      }
      *(undefined8 *)(lVar11 + 0x28) = *(undefined8 *)(unaff_RBP + 0x120);
      uVar14 = *(undefined4 *)(unaff_RBP + 0x110);
      uVar5 = *(undefined4 *)(unaff_RBP + 0x114);
      uVar6 = *(undefined4 *)(unaff_RBP + 0x118);
      uVar7 = *(undefined4 *)(unaff_RBP + 0x11c);
      *(undefined4 *)(lVar11 + 0x18) = uVar14;
      *(undefined4 *)(lVar11 + 0x1c) = uVar5;
      *(undefined4 *)(lVar11 + 0x20) = uVar6;
      *(undefined4 *)(lVar11 + 0x24) = uVar7;
    }
    if (*(long *)(lVar13 + 0x58) == -1) {
      *(undefined1 *)(unaff_RBP + 0x177) = 1;
      func_0x00014594e230(uVar14,_DAT_145d9d2a0);
      if (*(long *)(unaff_RBP + 0x18) != 0) {
        func_0x0001400021d0();
      }
    }
    else {
      *(undefined8 *)(lVar13 + 0x80) = uVar2;
      *(undefined8 *)(lVar13 + 0x88) = uVar3;
      if (*(long *)(lVar13 + 0x58) != 0) {
        func_0x0001400021d0();
      }
      *(undefined8 *)(lVar13 + 0x68) = *(undefined8 *)(unaff_RBP + 0x28);
      uVar14 = *(undefined4 *)(unaff_RBP + 0x18);
      uVar5 = *(undefined4 *)(unaff_RBP + 0x1c);
      uVar6 = *(undefined4 *)(unaff_RBP + 0x20);
      uVar7 = *(undefined4 *)(unaff_RBP + 0x24);
      *(undefined4 *)(lVar13 + 0x58) = uVar14;
      *(undefined4 *)(lVar13 + 0x5c) = uVar5;
      *(undefined4 *)(lVar13 + 0x60) = uVar6;
      *(undefined4 *)(lVar13 + 100) = uVar7;
      *(undefined1 *)(unaff_RBP + 0x177) = 0;
      func_0x00014594e230(uVar14,_DAT_145d9d2a0);
    }
    return;
  }
  func_0x000145d99653();
                    /* WARNING: Does not return */
  pcVar4 = (code *)invalidInstructionException();
  (*pcVar4)();
}

