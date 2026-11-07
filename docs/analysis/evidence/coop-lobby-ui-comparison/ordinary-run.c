
void FUN_14016f440(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 *param_4,
                  long param_5)

{
  int *piVar1;
  int iVar2;
  undefined4 uVar3;
  ulong uVar4;
  long lVar5;
  code *pcVar6;
  undefined8 uVar7;
  long lVar8;
  long lVar9;
  undefined1 uStack_d9;
  long lStack_d8;
  long lStack_d0;
  undefined1 *puStack_c8;
  long *plStack_c0;
  undefined8 uStack_b0;
  long lStack_a8;
  long lStack_a0;
  undefined4 uStack_98;
  int iStack_94;
  undefined8 uStack_90;
  long lStack_88;
  long lStack_80;
  undefined4 uStack_78;
  int iStack_74;
  long *plStack_70;
  long lStack_68;
  undefined4 uStack_60;
  int iStack_5c;
  long lStack_58;
  undefined8 uStack_50;
  undefined8 *puStack_48;
  
  LOCK();
  piVar1 = (int *)(param_5 + 0x5b0);
  iVar2 = *piVar1;
  *piVar1 = *piVar1 + 1;
  UNLOCK();
  if (*param_3 == -1) {
    func_0x0001461ae010(param_1,param_2,0x59,0x1461c6dd0,0x1461c6e30);
                    /* WARNING: Does not return */
    pcVar6 = (code *)invalidInstructionException();
    (*pcVar6)();
  }
  lStack_d8 = *(long *)(param_5 + 0x5a0);
  if (param_3[0x2c] == lStack_d8) {
    if ((ulong)param_3[7] < *(ulong *)(param_5 + 0x218)) {
      uVar4 = *(ulong *)(*(long *)(param_5 + 0x210) + param_3[7] * 8);
      if (uVar4 != 0) {
        lVar5 = *(long *)(param_5 + 0x1e0);
        lVar9 = ~uVar4 * 0x38;
        if (*(char *)(lVar5 + 0x30 + lVar9) != '\0') {
          puStack_48 = param_4;
          if ((((ulong)param_3[8] < *(ulong *)(param_5 + 0x218)) &&
              (uVar4 = *(ulong *)(*(long *)(param_5 + 0x210) + param_3[8] * 8), uVar4 != 0)) &&
             (lVar8 = ~uVar4 * 0x38, *(char *)(lVar5 + 0x30 + lVar8) != '\0')) {
            lVar9 = lVar9 + lVar5;
            uStack_50 = *(undefined8 *)(lVar9 + 0x10);
            uVar3 = (undefined4)param_3[0x2d];
            lVar8 = lVar8 + lVar5;
            lStack_58 = lVar9 + 0x2c;
            uVar7 = *(undefined8 *)(lVar8 + 0x10);
            func_0x0001404407e0(uVar7,param_3,param_5,param_3 + 9);
            lStack_d0 = param_5 + 0x18;
            puStack_c8 = (undefined1 *)0x0;
            uStack_b0 = uStack_50;
            lStack_a0 = lStack_58;
            plStack_70 = param_3 + 9;
            lStack_d8 = param_5;
            plStack_c0 = param_3;
            lStack_a8 = lVar9 + 0x28;
            uStack_98 = uVar3;
            iStack_94 = iVar2;
            uStack_90 = uVar7;
            lStack_88 = lVar8 + 0x28;
            lStack_80 = lVar8 + 0x2c;
            uStack_78 = uVar3;
            iStack_74 = iVar2;
            lStack_68 = param_5;
            uStack_60 = uVar3;
            iStack_5c = iVar2;
            func_0x000140164ad0();
            *(int *)(param_3 + 0x2d) = iVar2;
            *puStack_48 = 0xfffffffffffffffd;
            return;
          }
          lStack_d8 = (long)param_3 + 0x16c;
          lStack_d0 = 0x1451d9130;
          puStack_c8 = &uStack_d9;
          plStack_c0 = (long *)0x1451d9130;
          func_0x0001461ae2d0(param_1,lStack_d8,&lStack_d8,0x1461c68c0,0x1461c6978);
                    /* WARNING: Does not return */
          pcVar6 = (code *)invalidInstructionException();
          (*pcVar6)();
        }
      }
    }
    lStack_d8 = (long)param_3 + 0x16c;
    lStack_d0 = 0x1451d9130;
    puStack_c8 = &uStack_d9;
    plStack_c0 = (long *)0x1451d9130;
    func_0x0001461ae2d0(param_1,lStack_d8,&lStack_d8,0x1461c68c0,0x1461c6960);
                    /* WARNING: Does not return */
    pcVar6 = (code *)invalidInstructionException();
    (*pcVar6)();
  }
  func_0x0001461574ad(param_1,param_3 + 0x2c,param_3 + 0x2c,0,&lStack_d8,0x1461c6e48);
                    /* WARNING: Does not return */
  pcVar6 = (code *)invalidInstructionException();
  (*pcVar6)();
}

