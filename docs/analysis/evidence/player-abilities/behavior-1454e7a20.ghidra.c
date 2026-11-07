
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long *param_3,long param_4)

{
  int *piVar1;
  int *piVar2;
  int *piVar3;
  int *piVar4;
  int iVar5;
  ulong uVar6;
  long lVar7;
  long lVar8;
  ulong uVar9;
  undefined1 auVar10 [16];
  undefined1 auVar11 [16];
  undefined1 auVar12 [16];
  undefined1 auVar13 [16];
  
  lVar8 = *param_3;
  lVar7 = *(long *)(param_4 + 0xe8);
  uVar6 = *(ulong *)(param_4 + 0xf0);
  iVar5 = *(int *)(lVar8 + 0x40);
  uVar9 = 0;
  do {
    if ((uVar6 & 0x1ffffffffffffff0) == uVar9) {
      uVar9 = 0;
      goto LAB_1454e7b40;
    }
    piVar1 = (int *)(lVar7 + uVar9 * 4);
    piVar2 = (int *)(lVar7 + 0x10 + uVar9 * 4);
    piVar3 = (int *)(lVar7 + 0x20 + uVar9 * 4);
    piVar4 = (int *)(lVar7 + 0x30 + uVar9 * 4);
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
    uVar9 = uVar9 + 0x10;
  } while ((((((((((((((((SUB161(auVar10 >> 7,0) & 1) == 0 && (SUB161(auVar10 >> 0xf,0) & 1) == 0)
                       && (SUB161(auVar10 >> 0x17,0) & 1) == 0) &&
                      (SUB161(auVar10 >> 0x1f,0) & 1) == 0) && (SUB161(auVar10 >> 0x27,0) & 1) == 0)
                    && (SUB161(auVar10 >> 0x2f,0) & 1) == 0) && (SUB161(auVar10 >> 0x37,0) & 1) == 0
                   ) && (SUB161(auVar10 >> 0x3f,0) & 1) == 0) &&
                 (SUB161(auVar10 >> 0x47,0) & 1) == 0) && (SUB161(auVar10 >> 0x4f,0) & 1) == 0) &&
               (SUB161(auVar10 >> 0x57,0) & 1) == 0) && (SUB161(auVar10 >> 0x5f,0) & 1) == 0) &&
             (SUB161(auVar10 >> 0x67,0) & 1) == 0) && (SUB161(auVar10 >> 0x6f,0) & 1) == 0) &&
           (SUB161(auVar10 >> 0x77,0) & 1) == 0) && -1 < auVar10[0xf]);
  goto LAB_1454e7b7b;
  while (piVar1 = (int *)(lVar7 + (uVar6 & 0x1ffffffffffffff0) * 4 + uVar9), uVar9 = uVar9 + 4,
        *piVar1 != iVar5) {
LAB_1454e7b40:
    if (((uint)uVar6 & 0xf) << 2 == uVar9) {
      if (uVar6 == *(ulong *)(param_4 + 0xe0)) {
        func_0x00014575b6b0();
        lVar7 = *(long *)(param_4 + 0xe8);
      }
      *(int *)(lVar7 + uVar6 * 4) = iVar5;
      *(ulong *)(param_4 + 0xf0) = uVar6 + 1;
      break;
    }
  }
LAB_1454e7b7b:
                    /* WARNING: Could not emulate address calculation at 0x0001454e7c3a */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)((long)*(int *)((ulong)*(byte *)(lVar8 + 0x75) * 4 + 0x1469acef4) + 0x1469acef4))();
  return;
}

