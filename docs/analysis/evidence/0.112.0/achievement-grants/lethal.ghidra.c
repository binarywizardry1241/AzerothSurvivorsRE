
/* WARNING: Control flow encountered bad instruction data */

void entry(long param_1,undefined8 param_2)

{
  int iVar1;
  long lVar2;
  long lVar3;
  undefined4 unaff_EBX;
  int iVar4;
  long unaff_RBP;
  char cVar5;
  undefined1 uVar6;
  long unaff_R15;
  float in_XMM11_Da;
  float in_XMM12_Da;

  *(undefined8 *)(unaff_RBP + 0x150) = param_2;
  if (unaff_R15 == -1) {
    halt_baddata();
  }
  if (in_XMM12_Da < in_XMM11_Da) {
    halt_baddata();
  }
  iVar4 = *(int *)(unaff_RBP + 0x160);
  if (iVar4 == 0x3ea6) {
    iVar4 = 0x209d;
  }
  else if (iVar4 == 0x376a) {
    iVar4 = 0x832;
  }
  else if (iVar4 == 0x14bc) {
    iVar4 = 0x50a7;
  }
  lVar3 = *(long *)(param_1 + 0x708);
  if (lVar3 == *(long *)(param_1 + 0x6f8)) {
    func_0x000145c16470();
  }
  lVar2 = *(long *)(param_1 + 0x700);
  *(undefined4 *)(unaff_RBP + 0x158) = unaff_EBX;
  *(undefined4 *)(lVar2 + lVar3 * 8) = unaff_EBX;
  *(int *)(lVar2 + 4 + lVar3 * 8) = iVar4;
  *(long *)(param_1 + 0x708) = lVar3 + 1;
  cVar5 = *(char *)(param_1 + 0x1ad);
  iVar4 = 0;
  uVar6 = 0;
  if (cVar5 == '\0') {
    iVar1 = *(int *)(unaff_RBP + 0x160);
    if (iVar1 == 0) {
      uVar6 = 1;
      cVar5 = '\0';
      goto LAB_14593f61d;
    }
    for (lVar3 = 0xed;
        (((*(int *)(lVar3 + 0x146bf5e03) != iVar1 || (*(char *)(lVar3 + 0x146bf5e37) != '\0')) ||
         (7 < *(byte *)(lVar3 + 0x146bf5e38))) ||
        (((0xa4U >> (*(byte *)(lVar3 + 0x146bf5e38) & 0x1f) & 1) == 0 ||
         (*(float *)(lVar3 + 0x146bf5e07) <= 0.0)))); lVar3 = lVar3 + 0xf0) {
      if (lVar3 == 0x356d) {
        uVar6 = 0;
        goto LAB_14593f5e9;
      }
      if (((*(int *)(lVar3 + 0x146bf5e7b) == iVar1) && (*(char *)(lVar3 + 0x146bf5eaf) == '\0')) &&
         ((*(byte *)(lVar3 + 0x146bf5eb0) < 8 &&
          (((0xa4U >> (*(byte *)(lVar3 + 0x146bf5eb0) & 0x1f) & 1) != 0 &&
           (0.0 < *(float *)(lVar3 + 0x146bf5e7f))))))) break;
    }
    uVar6 = 1;
LAB_14593f5e9:
    cVar5 = '\0';
  }
  iVar4 = *(int *)(unaff_RBP + 0x160);
  if (iVar4 == 0x3ea6) {
    iVar4 = 0x209d;
  }
  else if (iVar4 == 0x376a) {
    iVar4 = 0x832;
  }
  else if (iVar4 == 0x14bc) {
    iVar4 = 0x50a7;
  }
LAB_14593f61d:
  lVar3 = *(long *)(param_1 + 0x720);
  if (lVar3 == *(long *)(param_1 + 0x710)) {
    func_0x000145c16320();
  }
  lVar2 = *(long *)(param_1 + 0x718);
  *(undefined4 *)(lVar2 + lVar3 * 0xc) = *(undefined4 *)(unaff_RBP + 0x158);
  *(int *)(lVar2 + 4 + lVar3 * 0xc) = iVar4;
  *(undefined1 *)(lVar2 + 8 + lVar3 * 0xc) = *(undefined1 *)(unaff_RBP + 0x280);
  *(char *)(lVar2 + 9 + lVar3 * 0xc) = cVar5;
  *(undefined1 *)(lVar2 + 10 + lVar3 * 0xc) = uVar6;
  *(long *)(param_1 + 0x720) = lVar3 + 1;
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}
