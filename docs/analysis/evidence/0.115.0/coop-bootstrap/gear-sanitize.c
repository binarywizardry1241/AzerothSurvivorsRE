undefined8
FUN_14582a070(undefined8 param_1,longlong param_2,longlong param_3,ulonglong param_4,
             undefined1 param_5)

{
  int *piVar1;
  int *piVar2;
  int *piVar3;
  int *piVar4;
  int iVar5;
  undefined8 uVar6;
  char cVar7;
  ulonglong uVar8;
  ulonglong uVar9;
  undefined1 auVar10 [16];
  undefined1 auVar11 [16];
  undefined1 auVar12 [16];
  undefined1 auVar13 [16];
  undefined1 uStack_b1;
  undefined8 uStack_b0;
  undefined1 *puStack_a8;
  longlong lStack_a0;
  ulonglong uStack_98;
  int aiStack_8c [19];

  uStack_b1 = *(undefined1 *)(param_2 + 0xe4);
  puStack_a8 = &uStack_b1;
  uVar9 = 0;
  uStack_b0 = param_1;
  lStack_a0 = param_3;
  uStack_98 = param_4;
LAB_14582a0ed:
  iVar5 = *(int *)(param_2 + 0x98 + uVar9 * 4);
  if ((iVar5 != 0) && (cVar7 = FUN_145829af0(&puStack_a8,iVar5,uVar9), cVar7 == '\0')) {
    *(undefined4 *)(param_2 + 0x98 + uVar9 * 4) = 0;
  }
  if (*(int *)(param_2 + uVar9 * 8) == 1) {
    iVar5 = *(int *)(param_2 + 4 + uVar9 * 8);
    FUN_1458cf0d0(aiStack_8c,param_5,uStack_b1);
    if (((iVar5 != 0) && (aiStack_8c[uVar9] != iVar5)) &&
       (cVar7 = FUN_145829af0(&puStack_a8,iVar5,uVar9), cVar7 == '\0')) {
      if ((iVar5 - 0x15ff5U < 7) &&
         (uVar9 == *(byte *)(*(longlong *)(&DAT_146ccc160 + (ulonglong)(iVar5 - 0x15ff5U) * 8) +
                            0x3c))) {
        uVar8 = 0;
        do {
          if ((param_4 & 0x1ffffffffffffff0) == uVar8) {
            uVar8 = 0;
            goto LAB_14582a1e0;
          }
          piVar1 = (int *)(param_3 + uVar8 * 4);
          piVar2 = (int *)(param_3 + 0x10 + uVar8 * 4);
          piVar3 = (int *)(param_3 + 0x20 + uVar8 * 4);
          piVar4 = (int *)(param_3 + 0x30 + uVar8 * 4);
          auVar12._0_4_ = -(uint)(*piVar2 == iVar5);
          auVar12._4_4_ = -(uint)(piVar2[1] == iVar5);
          auVar12._8_4_ = -(uint)(piVar2[2] == iVar5);
          auVar12._12_4_ = -(uint)(piVar2[3] == iVar5);
          auVar10._0_4_ = -(uint)(*piVar1 == iVar5);
          auVar10._4_4_ = -(uint)(piVar1[1] == iVar5);
          auVar10._8_4_ = -(uint)(piVar1[2] == iVar5);
          auVar10._12_4_ = -(uint)(piVar1[3] == iVar5);
          auVar10 = packssdw(auVar10,auVar12);
          auVar11._0_4_ = -(uint)(*piVar3 == iVar5);
          auVar11._4_4_ = -(uint)(piVar3[1] == iVar5);
          auVar11._8_4_ = -(uint)(piVar3[2] == iVar5);
          auVar11._12_4_ = -(uint)(piVar3[3] == iVar5);
          auVar13._0_4_ = -(uint)(*piVar4 == iVar5);
          auVar13._4_4_ = -(uint)(piVar4[1] == iVar5);
          auVar13._8_4_ = -(uint)(piVar4[2] == iVar5);
          auVar13._12_4_ = -(uint)(piVar4[3] == iVar5);
          auVar12 = packssdw(auVar11,auVar13);
          auVar10 = packsswb(auVar10,auVar12);
          uVar8 = uVar8 + 0x10;
        } while ((((((((((((((((SUB161(auVar10 >> 7,0) & 1) == 0 &&
                              (SUB161(auVar10 >> 0xf,0) & 1) == 0) &&
                             (SUB161(auVar10 >> 0x17,0) & 1) == 0) &&
                            (SUB161(auVar10 >> 0x1f,0) & 1) == 0) &&
                           (SUB161(auVar10 >> 0x27,0) & 1) == 0) &&
                          (SUB161(auVar10 >> 0x2f,0) & 1) == 0) &&
                         (SUB161(auVar10 >> 0x37,0) & 1) == 0) &&
                        (SUB161(auVar10 >> 0x3f,0) & 1) == 0) &&
                       (SUB161(auVar10 >> 0x47,0) & 1) == 0) && (SUB161(auVar10 >> 0x4f,0) & 1) == 0
                      ) && (SUB161(auVar10 >> 0x57,0) & 1) == 0) &&
                    (SUB161(auVar10 >> 0x5f,0) & 1) == 0) && (SUB161(auVar10 >> 0x67,0) & 1) == 0)
                  && (SUB161(auVar10 >> 0x6f,0) & 1) == 0) && (SUB161(auVar10 >> 0x77,0) & 1) == 0)
                 && -1 < auVar10[0xf]);
      }
      else {
LAB_14582a0d2:
        *(undefined4 *)(param_2 + uVar9 * 8) = 0;
      }
    }
  }
  goto LAB_14582a0e0;
  while (piVar1 = (int *)(param_3 + (param_4 & 0x1ffffffffffffff0) * 4 + uVar8), uVar8 = uVar8 + 4,
        *piVar1 != iVar5) {
LAB_14582a1e0:
    if (((uint)param_4 & 0xf) << 2 == uVar8) goto LAB_14582a0d2;
  }
LAB_14582a0e0:
  uVar6 = uStack_b0;
  uVar9 = uVar9 + 1;
  if (uVar9 == 0x13) {
    func_0x000145d145fb(uStack_b0,param_2,0xe8);
    return uVar6;
  }
  goto LAB_14582a0ed;
}
