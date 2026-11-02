
ulong entry(undefined8 param_1,ulong param_2,long param_3,long param_4)

{
  int *piVar1;
  int *piVar2;
  int *piVar3;
  int *piVar4;
  long lVar5;
  int iVar6;
  long lVar7;
  long lVar8;
  ulong uVar9;
  ulong uVar10;
  bool bVar11;
  undefined1 auVar12 [16];
  undefined1 auVar13 [16];
  undefined1 auVar14 [16];
  undefined1 auVar15 [16];

  if (*(long *)(param_3 + 0x20) == 0) {
    lVar8 = *(long *)(param_4 + 0x128);
    iVar6 = *(int *)(param_3 + 0x30);
    uVar10 = *(ulong *)(param_4 + 0x130) & 0x1ffffffffffffff0;
    uVar9 = 0;
    do {
      if (uVar10 == uVar9) {
        uVar9 = 0;
        goto LAB_145b4ab50;
      }
      piVar1 = (int *)(lVar8 + uVar9 * 4);
      piVar2 = (int *)(lVar8 + 0x10 + uVar9 * 4);
      piVar3 = (int *)(lVar8 + 0x20 + uVar9 * 4);
      piVar4 = (int *)(lVar8 + 0x30 + uVar9 * 4);
      auVar14._0_4_ = -(uint)(*piVar2 == iVar6);
      auVar14._4_4_ = -(uint)(piVar2[1] == iVar6);
      auVar14._8_4_ = -(uint)(piVar2[2] == iVar6);
      auVar14._12_4_ = -(uint)(piVar2[3] == iVar6);
      auVar12._0_4_ = -(uint)(*piVar1 == iVar6);
      auVar12._4_4_ = -(uint)(piVar1[1] == iVar6);
      auVar12._8_4_ = -(uint)(piVar1[2] == iVar6);
      auVar12._12_4_ = -(uint)(piVar1[3] == iVar6);
      auVar12 = packssdw(auVar12,auVar14);
      auVar13._0_4_ = -(uint)(*piVar3 == iVar6);
      auVar13._4_4_ = -(uint)(piVar3[1] == iVar6);
      auVar13._8_4_ = -(uint)(piVar3[2] == iVar6);
      auVar13._12_4_ = -(uint)(piVar3[3] == iVar6);
      auVar15._0_4_ = -(uint)(*piVar4 == iVar6);
      auVar15._4_4_ = -(uint)(piVar4[1] == iVar6);
      auVar15._8_4_ = -(uint)(piVar4[2] == iVar6);
      auVar15._12_4_ = -(uint)(piVar4[3] == iVar6);
      auVar14 = packssdw(auVar13,auVar15);
      auVar12 = packsswb(auVar12,auVar14);
      uVar9 = uVar9 + 0x10;
    } while ((((((((((((((((SUB161(auVar12 >> 7,0) & 1) == 0 && (SUB161(auVar12 >> 0xf,0) & 1) == 0)
                         && (SUB161(auVar12 >> 0x17,0) & 1) == 0) &&
                        (SUB161(auVar12 >> 0x1f,0) & 1) == 0) &&
                       (SUB161(auVar12 >> 0x27,0) & 1) == 0) && (SUB161(auVar12 >> 0x2f,0) & 1) == 0
                      ) && (SUB161(auVar12 >> 0x37,0) & 1) == 0) &&
                    (SUB161(auVar12 >> 0x3f,0) & 1) == 0) && (SUB161(auVar12 >> 0x47,0) & 1) == 0)
                  && (SUB161(auVar12 >> 0x4f,0) & 1) == 0) && (SUB161(auVar12 >> 0x57,0) & 1) == 0)
                && (SUB161(auVar12 >> 0x5f,0) & 1) == 0) && (SUB161(auVar12 >> 0x67,0) & 1) == 0) &&
              (SUB161(auVar12 >> 0x6f,0) & 1) == 0) && (SUB161(auVar12 >> 0x77,0) & 1) == 0) &&
             -1 < auVar12[0xf]);
    param_2 = CONCAT71((int7)(param_2 >> 8),1);
  }
  else {
    uVar10 = *(ulong *)(param_4 + 0xb8);
    param_2 = 0;
    if (uVar10 != 0) {
      lVar8 = *(long *)(param_3 + 0x28);
      lVar5 = *(long *)(param_4 + 0xb0);
      if (uVar10 != 1) {
        uVar9 = 0;
        do {
          param_2 = uVar9 + (uVar10 >> 1);
          lVar7 = *(long *)(lVar5 + 0x10 + param_2 * 0x18);
          iVar6 = func_0x000145f93ce7();
          lVar7 = lVar7 - lVar8;
          if (iVar6 != 0) {
            lVar7 = (long)iVar6;
          }
          if (0 < lVar7) {
            param_2 = uVar9;
          }
          uVar10 = uVar10 - (uVar10 >> 1);
          uVar9 = param_2;
        } while (1 < uVar10);
      }
      lVar8 = *(long *)(lVar5 + 0x10 + param_2 * 0x18) - lVar8;
      iVar6 = func_0x000145f93ce7();
      if (iVar6 != 0) {
        lVar8 = (long)iVar6;
      }
      param_2 = CONCAT71((int7)((ulong)lVar8 >> 8),lVar8 == 0);
    }
  }
  goto LAB_145b4ab63;
  while (piVar1 = (int *)(lVar8 + uVar10 * 4 + uVar9), uVar9 = uVar9 + 4, *piVar1 != iVar6) {
LAB_145b4ab50:
    bVar11 = ((uint)*(ulong *)(param_4 + 0x130) & 0xf) << 2 == uVar9;
    param_2 = CONCAT71((int7)(param_2 >> 8),!bVar11);
    if (bVar11) break;
  }
LAB_145b4ab63:
  return param_2 & 0xffffffff;
}
