
long entry(undefined8 param_1,undefined8 param_2,int param_3,undefined8 *param_4,ulong param_5)

{
  int *piVar1;
  int *piVar2;
  int *piVar3;
  int *piVar4;
  char cVar5;
  long lVar6;
  long lVar7;
  ulong uVar8;
  ulong uVar9;
  bool bVar10;
  undefined1 auVar11 [16];
  undefined1 auVar12 [16];
  undefined1 auVar13 [16];
  undefined1 auVar14 [16];
  long local_a0;
  long local_88;
  byte local_38;
  char local_37;

  if (((param_3 - 0x15f9bU < 0xf) || (param_3 - 0x15f91U < 6)) && (param_5 == 0x12)) {
LAB_145ac20e9:
    lVar7 = param_4[1];
    uVar8 = param_4[2] & 0x1ffffffffffffff0;
    lVar6 = lVar7 + uVar8 * 4;
    uVar9 = 0;
    do {
      if (uVar8 == uVar9) {
        uVar8 = 0;
        do {
          bVar10 = ((uint)param_4[2] & 0xf) << 2 == uVar8;
          lVar7 = CONCAT71((int7)((ulong)lVar7 >> 8),!bVar10);
          if (bVar10) {
            return lVar7;
          }
          piVar1 = (int *)(lVar6 + uVar8);
          uVar8 = uVar8 + 4;
        } while (*piVar1 != param_3);
        return lVar7;
      }
      piVar1 = (int *)(lVar7 + uVar9 * 4);
      piVar2 = (int *)(lVar7 + 0x10 + uVar9 * 4);
      piVar3 = (int *)(lVar7 + 0x20 + uVar9 * 4);
      piVar4 = (int *)(lVar7 + 0x30 + uVar9 * 4);
      auVar13._0_4_ = -(uint)(*piVar2 == param_3);
      auVar13._4_4_ = -(uint)(piVar2[1] == param_3);
      auVar13._8_4_ = -(uint)(piVar2[2] == param_3);
      auVar13._12_4_ = -(uint)(piVar2[3] == param_3);
      auVar11._0_4_ = -(uint)(*piVar1 == param_3);
      auVar11._4_4_ = -(uint)(piVar1[1] == param_3);
      auVar11._8_4_ = -(uint)(piVar1[2] == param_3);
      auVar11._12_4_ = -(uint)(piVar1[3] == param_3);
      auVar11 = packssdw(auVar11,auVar13);
      auVar12._0_4_ = -(uint)(*piVar3 == param_3);
      auVar12._4_4_ = -(uint)(piVar3[1] == param_3);
      auVar12._8_4_ = -(uint)(piVar3[2] == param_3);
      auVar12._12_4_ = -(uint)(piVar3[3] == param_3);
      auVar14._0_4_ = -(uint)(*piVar4 == param_3);
      auVar14._4_4_ = -(uint)(piVar4[1] == param_3);
      auVar14._8_4_ = -(uint)(piVar4[2] == param_3);
      auVar14._12_4_ = -(uint)(piVar4[3] == param_3);
      auVar13 = packssdw(auVar12,auVar14);
      auVar11 = packsswb(auVar11,auVar13);
      uVar9 = uVar9 + 0x10;
    } while ((((((((((((((((SUB161(auVar11 >> 7,0) & 1) == 0 && (SUB161(auVar11 >> 0xf,0) & 1) == 0)
                         && (SUB161(auVar11 >> 0x17,0) & 1) == 0) &&
                        (SUB161(auVar11 >> 0x1f,0) & 1) == 0) &&
                       (SUB161(auVar11 >> 0x27,0) & 1) == 0) && (SUB161(auVar11 >> 0x2f,0) & 1) == 0
                      ) && (SUB161(auVar11 >> 0x37,0) & 1) == 0) &&
                    (SUB161(auVar11 >> 0x3f,0) & 1) == 0) && (SUB161(auVar11 >> 0x47,0) & 1) == 0)
                  && (SUB161(auVar11 >> 0x4f,0) & 1) == 0) && (SUB161(auVar11 >> 0x57,0) & 1) == 0)
                && (SUB161(auVar11 >> 0x5f,0) & 1) == 0) && (SUB161(auVar11 >> 0x67,0) & 1) == 0) &&
              (SUB161(auVar11 >> 0x6f,0) & 1) == 0) && (SUB161(auVar11 >> 0x77,0) & 1) == 0) &&
             -1 < auVar11[0xf]);
    lVar6 = CONCAT71((int7)((ulong)lVar7 >> 8),1);
  }
  else {
    func_0x000145ab6630();
    if (local_a0 != -1) {
      if (param_5 == local_38) {
        cVar5 = *(char *)*param_4;
        if (local_a0 != 0) {
          func_0x0001400021d0();
        }
        if (local_88 != 0) {
          func_0x0001400021d0();
        }
        if (local_37 == cVar5) goto LAB_145ac20e9;
      }
      else {
        if (local_a0 != 0) {
          func_0x0001400021d0();
        }
        if (local_88 != 0) {
          func_0x0001400021d0();
        }
      }
    }
    lVar6 = 0;
  }
  return lVar6;
}
