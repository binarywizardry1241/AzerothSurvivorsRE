
void FUN_140169630(undefined8 param_1,undefined8 param_2,int *param_3,undefined8 *param_4,
                  long param_5)

{
  int *piVar1;
  int iVar2;
  int iVar3;
  ulong uVar4;
  long lVar5;
  ulong uVar6;
  long lVar7;
  code *pcVar8;
  undefined1 uStack_101;
  int *piStack_100;
  long lStack_f8;
  undefined8 uStack_f0;
  undefined8 uStack_e8;
  long lStack_e0;
  long lStack_d8;
  int iStack_d0;
  int iStack_cc;
  undefined8 uStack_c8;
  long lStack_c0;
  long lStack_b8;
  int iStack_b0;
  int iStack_ac;
  undefined8 uStack_a8;
  long lStack_a0;
  long lStack_98;
  int iStack_90;
  int iStack_8c;
  undefined8 uStack_88;
  long lStack_80;
  long lStack_78;
  int iStack_70;
  int iStack_6c;
  undefined8 uStack_68;
  long lStack_60;
  long lStack_58;
  int iStack_50;
  int iStack_4c;
  undefined8 *puStack_48;
  
  LOCK();
  piVar1 = (int *)(param_5 + 0x5b0);
  iVar2 = *piVar1;
  *piVar1 = *piVar1 + 1;
  UNLOCK();
  if (*(long *)(param_3 + 0x40) == -1) {
    func_0x0001461ae010(param_1,param_2,0x59,0x1461c6dd0,0x1461c6e30);
                    /* WARNING: Does not return */
    pcVar8 = (code *)invalidInstructionException();
    (*pcVar8)();
  }
  piStack_100 = *(int **)(param_5 + 0x5a0);
  if (*(int **)(param_3 + 2) == piStack_100) {
    iVar3 = *param_3;
    func_0x000140452f90(param_4,param_3,param_5,param_3 + 4);
    if ((*(ulong *)(param_3 + 0x4e) < *(ulong *)(param_5 + 0x218)) &&
       (uVar4 = *(ulong *)(*(long *)(param_5 + 0x210) + *(ulong *)(param_3 + 0x4e) * 8), uVar4 != 0)
       ) {
      lStack_e0 = ~uVar4 * 0x38;
      if (*(char *)(*(long *)(param_5 + 0x1e0) + 0x30 + lStack_e0) != '\0') {
        lStack_e0 = *(long *)(param_5 + 0x1e0) + lStack_e0;
        uStack_e8 = *(undefined8 *)(lStack_e0 + 0x10);
        if ((*(ulong *)(param_3 + 0x50) < *(ulong *)(param_5 + 0x218)) &&
           (uVar4 = *(ulong *)(*(long *)(param_5 + 0x210) + *(ulong *)(param_3 + 0x50) * 8),
           uVar4 != 0)) {
          lStack_c0 = ~uVar4 * 0x38;
          if (*(char *)(*(long *)(param_5 + 0x1e0) + 0x30 + lStack_c0) != '\0') {
            lStack_c0 = *(long *)(param_5 + 0x1e0) + lStack_c0;
            uStack_c8 = *(undefined8 *)(lStack_c0 + 0x10);
            uVar4 = *(ulong *)(param_5 + 0x218);
            if (*(ulong *)(param_3 + 0x52) < uVar4) {
              lVar5 = *(long *)(param_5 + 0x210);
              uVar6 = *(ulong *)(lVar5 + *(ulong *)(param_3 + 0x52) * 8);
              if (uVar6 != 0) {
                lVar7 = *(long *)(param_5 + 0x1e0);
                lStack_a0 = ~uVar6 * 0x38;
                if ((((*(char *)(lVar7 + 0x30 + lStack_a0) != '\0') &&
                     (*(ulong *)(param_3 + 0x54) < uVar4)) &&
                    (uVar6 = *(ulong *)(lVar5 + *(ulong *)(param_3 + 0x54) * 8), uVar6 != 0)) &&
                   (lStack_80 = ~uVar6 * 0x38, *(char *)(lVar7 + 0x30 + lStack_80) != '\0')) {
                  puStack_48 = param_4;
                  if (((*(ulong *)(param_3 + 0x56) < uVar4) &&
                      (uVar4 = *(ulong *)(lVar5 + *(ulong *)(param_3 + 0x56) * 8), uVar4 != 0)) &&
                     (lStack_58 = ~uVar4 * 0x38, *(char *)(lVar7 + 0x30 + lStack_58) != '\0')) {
                    lStack_a0 = lStack_a0 + lVar7;
                    uStack_a8 = *(undefined8 *)(lStack_a0 + 0x10);
                    lStack_80 = lStack_80 + lVar7;
                    uStack_88 = *(undefined8 *)(lStack_80 + 0x10);
                    lStack_58 = lStack_58 + lVar7;
                    uStack_68 = *(undefined8 *)(lStack_58 + 0x10);
                    piStack_100 = param_3 + 4;
                    uStack_f0 = (undefined1 *)CONCAT44(iVar2,iVar3);
                    lStack_d8 = lStack_e0 + 0x2c;
                    lStack_e0 = lStack_e0 + 0x28;
                    lStack_b8 = lStack_c0 + 0x2c;
                    lStack_c0 = lStack_c0 + 0x28;
                    lStack_98 = lStack_a0 + 0x2c;
                    lStack_a0 = lStack_a0 + 0x28;
                    lStack_78 = lStack_80 + 0x2c;
                    lStack_80 = lStack_80 + 0x28;
                    lStack_60 = lStack_58 + 0x28;
                    lStack_58 = lStack_58 + 0x2c;
                    lStack_f8 = param_5;
                    iStack_d0 = iVar3;
                    iStack_cc = iVar2;
                    iStack_b0 = iVar3;
                    iStack_ac = iVar2;
                    iStack_90 = iVar3;
                    iStack_8c = iVar2;
                    iStack_70 = iVar3;
                    iStack_6c = iVar2;
                    iStack_50 = iVar3;
                    iStack_4c = iVar2;
                    func_0x00014015f820();
                    *param_3 = iVar2;
                    *puStack_48 = 0xfffffffffffffffd;
                    return;
                  }
                }
              }
            }
            piStack_100 = param_3 + 1;
            lStack_f8 = 0x1451d9130;
            uStack_f0 = &uStack_101;
            uStack_e8 = 0x1451d9130;
            func_0x0001461ae2d0();
                    /* WARNING: Does not return */
            pcVar8 = (code *)invalidInstructionException();
            (*pcVar8)();
          }
        }
      }
    }
    piStack_100 = param_3 + 1;
    lStack_f8 = 0x1451d9130;
    uStack_f0 = &uStack_101;
    uStack_e8 = 0x1451d9130;
    func_0x0001461ae2d0();
                    /* WARNING: Does not return */
    pcVar8 = (code *)invalidInstructionException();
    (*pcVar8)();
  }
  func_0x0001461574ad(param_1,param_3 + 2,param_3 + 2,0,&piStack_100,0x1461c6e48);
                    /* WARNING: Does not return */
  pcVar8 = (code *)invalidInstructionException();
  (*pcVar8)();
}

