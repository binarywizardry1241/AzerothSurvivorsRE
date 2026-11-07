
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long param_3,undefined4 *param_4)

{
  long *plVar1;
  long *plVar2;
  long lVar3;
  long lVar4;
  long lVar5;
  long lVar6;
  long lVar7;
  ulong uVar8;
  long lVar9;
  undefined4 uStack_168;
  undefined4 uStack_164;
  undefined4 local_160;
  long local_128;
  long *local_120;
  long local_118;
  long local_e0;
  ulong local_d0;

  func_0x000145925c80();
  lVar9 = *(long *)(param_3 + 0x560);
  lVar6 = *(long *)(param_3 + 0x568);
  func_0x0001459992c0();
  if (local_118 != 0) {
    plVar2 = local_120 + local_118;
    lVar4 = 0x18;
    do {
      lVar4 = lVar4 + -1;
      lVar3 = *local_120;
      local_120 = local_120 + 1;
      lVar5 = 0;
      lVar7 = lVar9;
      while (lVar6 * 0x160 - lVar5 != 0) {
        lVar5 = lVar5 + 0x160;
        plVar1 = (long *)(lVar7 + 0x88);
        lVar7 = lVar7 + 0x160;
        if (*plVar1 == lVar3) {
          if (local_d0 != 0) {
            if (local_d0 < 5) {
              lVar6 = 0;
            }
            else {
              uVar8 = 4;
              if ((local_d0 & 3) != 0) {
                uVar8 = (ulong)((uint)local_d0 & 3);
              }
              lVar6 = local_d0 - uVar8;
              lVar9 = lVar6;
              do {
                lVar9 = lVar9 + -4;
              } while (lVar9 != 0);
            }
            lVar6 = local_d0 - lVar6;
            do {
              lVar6 = lVar6 + -1;
            } while (lVar6 != 0);
          }
          func_0x0001459ae710();
          param_4[3] = local_160;
          *(ulong *)(param_4 + 1) = CONCAT44(uStack_164,uStack_168);
          *param_4 = 1;
          if (local_e0 == 0) goto LAB_145927bd1;
          goto LAB_145927bba;
        }
      }
    } while ((lVar4 != 0) && (local_120 != plVar2));
  }
  *param_4 = 0;
  if (local_e0 != 0) {
LAB_145927bba:
    func_0x0001400021d0();
  }
LAB_145927bd1:
  if (local_128 != 0) {
    func_0x0001400021d0();
  }
  return;
}
