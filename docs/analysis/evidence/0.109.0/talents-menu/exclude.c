long FUN_14590fb00(undefined8 param_1,undefined8 param_2,undefined4 param_3,long param_4,
                  undefined8 param_5,long param_6)

{
  byte bVar1;
  long lVar2;
  long lVar3;
  int iVar4;
  long lVar5;
  byte bVar6;
  ulong uVar7;
  long lVar8;
  long lVar9;
  long lVar10;
  undefined1 auVar11 [16];

  auVar11 = FUN_145912d90(param_1,param_6,param_5,param_3,param_6);
  lVar10 = auVar11._8_8_;
  if (lVar10 != 0) {
    bVar1 = *(byte *)(lVar10 + 0x70);
    uVar7 = (ulong)bVar1;
    if ((((bVar1 == 6) || (*(char *)(lVar10 + 0x73) == '\x01')) &&
        (bVar6 = (char)param_3 - 1, bVar6 < 0xb)) && ((0x5dfU >> (bVar6 & 0x1f) & 1) != 0)) {
      lVar10 = *(long *)((ulong)bVar6 * 8 + 0x1472293d8);
      lVar5 = auVar11._0_8_ * 0x40;
      lVar2 = *(long *)(lVar10 + 0x38 + lVar5);
      if ((lVar2 != 0) && (*(long *)(param_4 + 0x10) != 0)) {
        lVar10 = *(long *)(lVar10 + 0x30 + lVar5);
        lVar5 = lVar2 * 0x78 + lVar10;
        lVar2 = *(long *)(param_4 + 8);
        lVar9 = *(long *)(param_4 + 0x10) << 4;
        if (bVar1 != 6) {
          do {
            if (((*(char *)(lVar10 + 0x70) == (char)uVar7) &&
                ((lVar3 = *(long *)(lVar10 + 0x28), lVar3 != param_6 ||
                 (iVar4 = func_0x000145bfa0e1(), iVar4 != 0)))) &&
               (*(char *)(lVar10 + 0x73) == '\x01')) {
              lVar8 = 0;
              do {
                if ((*(long *)(*(long *)(lVar2 + lVar8) + 0x28) == lVar3) &&
                   (iVar4 = func_0x000145bfa0e1(), iVar4 == 0)) {
                  if (*(char *)(lVar2 + 8 + lVar8) != '\0') {
                    return lVar10;
                  }
                  break;
                }
                lVar8 = lVar8 + 0x10;
              } while (lVar9 != lVar8);
            }
            lVar10 = lVar10 + 0x78;
            if (lVar10 == lVar5) {
              return 0;
            }
          } while( true );
        }
        do {
          if ((*(char *)(lVar10 + 0x70) == '\x06') &&
             ((lVar3 = *(long *)(lVar10 + 0x28), lVar3 != param_6 ||
              (iVar4 = func_0x000145bfa0e1(), iVar4 != 0)))) {
            lVar8 = 0;
            do {
              if ((*(long *)(*(long *)(lVar2 + lVar8) + 0x28) == lVar3) &&
                 (iVar4 = func_0x000145bfa0e1(), iVar4 == 0)) {
                if (*(char *)(lVar2 + 8 + lVar8) != '\0') {
                  return lVar10;
                }
                break;
              }
              lVar8 = lVar8 + 0x10;
            } while (lVar9 != lVar8);
          }
          lVar10 = lVar10 + 0x78;
          if (lVar10 == lVar5) {
            return 0;
          }
        } while( true );
      }
    }
  }
  return 0;
}
