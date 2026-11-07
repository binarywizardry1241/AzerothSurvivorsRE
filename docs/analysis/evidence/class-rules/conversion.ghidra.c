/* WARNING: Control flow encountered bad instruction data */

void entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,undefined8 param_4,
          undefined8 param_5,undefined8 param_6,undefined8 param_7,undefined4 param_8)

{
  float fVar1;
  float fVar2;
  undefined1 uVar3;
  long lVar4;
  long lVar5;
  char cVar6;
  long unaff_RBP;
  long lVar7;
  undefined8 unaff_R15;
  undefined8 extraout_XMM0_Qa;

  *(int *)(unaff_RBP + 0x158) = (int)*(undefined8 *)(unaff_RBP + 0x208);
  *(undefined4 *)(unaff_RBP + 0x15c) = param_8;
  *(undefined8 *)(unaff_RBP + 0x160) = param_3;
  *(undefined8 *)(unaff_RBP + 0x168) = unaff_R15;
  *(undefined8 *)(unaff_RBP + 0x170) = param_4;
  cVar6 = func_0x000145929aa0(param_3,param_4,unaff_RBP + 0x158,param_6,
                              *(undefined8 *)(unaff_RBP + 0x1c8));
  lVar4 = *(long *)(unaff_RBP + 0x218);
  if ((cVar6 != '\0') && (*(long *)(lVar4 + 0x568) != 0)) {
    fVar1 = *(float *)(unaff_RBP + 0x1f0);
    lVar5 = *(long *)(lVar4 + 0x560);
    lVar7 = 0;
    do {
      if ((*(long *)(lVar5 + 0x88 + lVar7) == *(long *)(unaff_RBP + 0x1d8)) &&
         (*(int *)(lVar5 + 0x68 + lVar7) != 1)) {
        fVar2 = *(float *)(lVar5 + 0xf4 + lVar7);
        uVar3 = *(undefined1 *)(lVar4 + 0x195);
        *(undefined1 *)(lVar4 + 0x195) = 3;
        func_0x000145933ec0(extraout_XMM0_Qa,param_2,fVar1 * fVar2);
        *(undefined1 *)(*(long *)(unaff_RBP + 0x218) + 0x195) = uVar3;
        halt_baddata();
      }
      lVar7 = lVar7 + 0x160;
    } while (*(long *)(lVar4 + 0x568) * 0x160 - lVar7 != 0);
  }
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}
