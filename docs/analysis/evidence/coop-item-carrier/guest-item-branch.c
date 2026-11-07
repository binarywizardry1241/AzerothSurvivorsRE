
/* WARNING: Control flow encountered bad instruction data */

void entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,undefined8 param_4)

{
  undefined4 uVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  long lVar4;
  long unaff_RBP;
  long lVar5;
  undefined8 in_XMM6_Qa;
  
  lVar4 = *(long *)(unaff_RBP + 0x560);
  *(undefined8 *)(unaff_RBP + 0x520) = *(undefined8 *)(lVar4 + 0x18);
  uVar1 = *(undefined4 *)(lVar4 + 0xc);
  uVar2 = *(undefined4 *)(lVar4 + 0x10);
  uVar3 = *(undefined4 *)(lVar4 + 0x14);
  *(undefined4 *)(unaff_RBP + 0x510) = *(undefined4 *)(lVar4 + 8);
  *(undefined4 *)(unaff_RBP + 0x514) = uVar1;
  *(undefined4 *)(unaff_RBP + 0x518) = uVar2;
  *(undefined4 *)(unaff_RBP + 0x51c) = uVar3;
  lVar5 = *(long *)(lVar4 + 0x28);
  lVar4 = *(long *)(lVar4 + 0x30);
  func_0x000145b53260(lVar5,param_4,unaff_RBP + 0x510,unaff_RBP + 0x430,lVar5,lVar4);
  if (*(long *)(unaff_RBP + 0x430) != -1) {
    *(undefined8 *)(unaff_RBP + -0x28) = *(undefined8 *)(unaff_RBP + 0x440);
    *(undefined4 *)(unaff_RBP + -0x38) = *(undefined4 *)(unaff_RBP + 0x430);
    *(undefined4 *)(unaff_RBP + -0x34) = *(undefined4 *)(unaff_RBP + 0x434);
    *(undefined4 *)(unaff_RBP + -0x30) = *(undefined4 *)(unaff_RBP + 0x438);
    *(undefined4 *)(unaff_RBP + -0x2c) = *(undefined4 *)(unaff_RBP + 0x43c);
    *(undefined2 *)(unaff_RBP + -0x20) = 0x58;
    *(undefined8 *)(unaff_RBP + -0x40) = 0x8000000000000006;
    func_0x000145bd7b40(*(undefined4 *)(unaff_RBP + 0x430),param_2,in_XMM6_Qa);
  }
  if (lVar4 != 0) {
    lVar5 = lVar5 + 8;
    do {
      if (*(long *)(lVar5 + -8) != 0) {
        func_0x0001400021d0();
      }
      lVar5 = lVar5 + 0x18;
      lVar4 = lVar4 + -1;
    } while (lVar4 != 0);
  }
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}

