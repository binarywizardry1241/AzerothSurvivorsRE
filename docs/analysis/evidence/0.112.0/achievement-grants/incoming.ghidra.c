
/* WARNING: Control flow encountered bad instruction data */

void entry(undefined8 param_1,long param_2)

{
  long *plVar1;
  int *piVar2;
  int *piVar3;
  int *piVar4;
  int *piVar5;
  int iVar6;
  long lVar7;
  long lVar8;
  long lVar9;
  ulong uVar10;
  ulong uVar11;
  long unaff_R13;
  undefined1 auVar12 [16];
  undefined1 auVar13 [16];
  undefined1 auVar14 [16];
  undefined1 auVar15 [16];

  lVar7 = *(long *)(unaff_R13 + 0x568);
  lVar8 = 0;
  lVar9 = lVar7;
  do {
    if (*(long *)(unaff_R13 + 0x570) * 0x1d8 - lVar8 == 0) {
      halt_baddata();
    }
    lVar8 = lVar8 + 0x1d8;
    plVar1 = (long *)(lVar9 + 0xf0);
    lVar9 = lVar9 + 0x1d8;
  } while (*plVar1 != param_2);
  if (*(long *)(lVar7 + -0x1c0 + lVar8) == -1) {
    halt_baddata();
  }
  iVar6 = *(int *)(*(long *)(lVar7 + -0x1a8 + lVar8) + 0x40);
  lVar9 = *(long *)(unaff_R13 + 0x730);
  uVar10 = *(ulong *)(unaff_R13 + 0x738);
  uVar11 = 0;
  do {
    if ((uVar10 & 0x1ffffffffffffff0) == uVar11) {
      uVar11 = 0;
      do {
        if (((uint)uVar10 & 0xf) << 2 == uVar11) {
          if (uVar10 == *(ulong *)(unaff_R13 + 0x728)) {
            func_0x000145c0f690();
            lVar9 = *(long *)(unaff_R13 + 0x730);
          }
          *(int *)(lVar9 + uVar10 * 4) = iVar6;
          *(ulong *)(unaff_R13 + 0x738) = uVar10 + 1;
          halt_baddata();
        }
        piVar2 = (int *)(lVar9 + (uVar10 & 0x1ffffffffffffff0) * 4 + uVar11);
        uVar11 = uVar11 + 4;
      } while (*piVar2 != iVar6);
                    /* WARNING: Bad instruction - Truncating control flow here */
      halt_baddata();
    }
    piVar2 = (int *)(lVar9 + uVar11 * 4);
    piVar3 = (int *)(lVar9 + 0x10 + uVar11 * 4);
    piVar4 = (int *)(lVar9 + 0x20 + uVar11 * 4);
    piVar5 = (int *)(lVar9 + 0x30 + uVar11 * 4);
    auVar14._0_4_ = -(uint)(*piVar3 == iVar6);
    auVar14._4_4_ = -(uint)(piVar3[1] == iVar6);
    auVar14._8_4_ = -(uint)(piVar3[2] == iVar6);
    auVar14._12_4_ = -(uint)(piVar3[3] == iVar6);
    auVar12._0_4_ = -(uint)(*piVar2 == iVar6);
    auVar12._4_4_ = -(uint)(piVar2[1] == iVar6);
    auVar12._8_4_ = -(uint)(piVar2[2] == iVar6);
    auVar12._12_4_ = -(uint)(piVar2[3] == iVar6);
    auVar12 = packssdw(auVar12,auVar14);
    auVar13._0_4_ = -(uint)(*piVar4 == iVar6);
    auVar13._4_4_ = -(uint)(piVar4[1] == iVar6);
    auVar13._8_4_ = -(uint)(piVar4[2] == iVar6);
    auVar13._12_4_ = -(uint)(piVar4[3] == iVar6);
    auVar15._0_4_ = -(uint)(*piVar5 == iVar6);
    auVar15._4_4_ = -(uint)(piVar5[1] == iVar6);
    auVar15._8_4_ = -(uint)(piVar5[2] == iVar6);
    auVar15._12_4_ = -(uint)(piVar5[3] == iVar6);
    auVar14 = packssdw(auVar13,auVar15);
    auVar12 = packsswb(auVar12,auVar14);
    uVar11 = uVar11 + 0x10;
  } while ((((((((((((((((SUB161(auVar12 >> 7,0) & 1) == 0 && (SUB161(auVar12 >> 0xf,0) & 1) == 0)
                       && (SUB161(auVar12 >> 0x17,0) & 1) == 0) &&
                      (SUB161(auVar12 >> 0x1f,0) & 1) == 0) && (SUB161(auVar12 >> 0x27,0) & 1) == 0)
                    && (SUB161(auVar12 >> 0x2f,0) & 1) == 0) && (SUB161(auVar12 >> 0x37,0) & 1) == 0
                   ) && (SUB161(auVar12 >> 0x3f,0) & 1) == 0) &&
                 (SUB161(auVar12 >> 0x47,0) & 1) == 0) && (SUB161(auVar12 >> 0x4f,0) & 1) == 0) &&
               (SUB161(auVar12 >> 0x57,0) & 1) == 0) && (SUB161(auVar12 >> 0x5f,0) & 1) == 0) &&
             (SUB161(auVar12 >> 0x67,0) & 1) == 0) && (SUB161(auVar12 >> 0x6f,0) & 1) == 0) &&
           (SUB161(auVar12 >> 0x77,0) & 1) == 0) && -1 < auVar12[0xf]);
  halt_baddata();
}
