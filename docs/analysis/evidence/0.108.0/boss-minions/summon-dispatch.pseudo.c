
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_14595245b(undefined8 param_1,long param_2,undefined8 param_3,uint *param_4)

{
  uint uVar1;
  long lVar2;
  code *pcVar3;
  ulong uVar4;
  uint uVar5;
  long unaff_RBP;
  undefined4 uVar6;
  float fVar7;
  undefined4 extraout_XMM0_Da;
  float fVar8;
  float fVar9;
  float fVar10;
  float fVar11;
  float fVar12;
  float fVar13;

  if (*(ulong *)(unaff_RBP + 0xf0) < *(ulong *)(param_2 + 0x568)) {
    uVar1 = *param_4;
    func_0x000145906cb0();
    func_0x0001458e5790();
    func_0x0001458bc240();
    func_0x000141191d70();
    if (uVar1 != 0) {
      fVar9 = (float)uVar1;
      uVar5 = 0;
      fVar11 = _DAT_145da6230;
      fVar12 = _DAT_145ec1850;
      fVar13 = fRam0000000145ec1854;
      do {
        fVar10 = ((float)uVar5 / fVar9) * fVar11;
        fVar7 = (float)func_0x000145bf297d(fVar10);
        fVar10 = (float)func_0x000145bf2977(fVar10);
        fVar7 = fVar7 * fVar12 + *(float *)(unaff_RBP + 0x150);
        fVar8 = fVar10 * fVar13 + *(float *)(unaff_RBP + 0x154);
        lVar2 = *(long *)(param_2 + 0x998);
        uVar4 = func_0x0001458d0220(fVar10,fVar7,fVar8);
        uVar6 = extraout_XMM0_Da;
        if ((uVar4 & 1) == 0) {
          if ((*(long *)(lVar2 + 0x68) == -1) ||
             (func_0x0001458d5410(), *(int *)(unaff_RBP + 0x110) != 1)) {
            uVar6 = *(undefined4 *)(lVar2 + 0xb8);
          }
          else {
            uVar6 = *(undefined4 *)(unaff_RBP + 0x11c);
          }
        }
        uVar5 = uVar5 + 1;
        *(ulong *)(unaff_RBP + 0x114) = CONCAT44(fVar8,fVar7);
        *(undefined4 *)(unaff_RBP + 0x11c) = uVar6;
        *(undefined4 *)(unaff_RBP + 0x110) = 1;
        func_0x000145969870();
      } while (uVar1 != uVar5);
    }
    return;
  }
  func_0x000145d93893();
                    /* WARNING: Does not return */
  pcVar3 = (code *)invalidInstructionException();
  (*pcVar3)();
}
