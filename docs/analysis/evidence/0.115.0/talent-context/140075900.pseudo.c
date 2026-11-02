/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

long * entry(undefined8 param_1,undefined8 param_2,long *param_3,long *param_4)

{
  long lVar1;
  code *pcVar2;
  char *pcVar3;
  char *pcVar4;
  long lVar5;
  double dVar6;
  double dVar7;
  undefined4 uVar8;
  undefined4 uVar9;
  undefined4 uVar10;
  undefined4 uVar11;
  undefined4 uVar12;
  undefined4 uVar13;
  undefined4 uVar14;
  undefined4 uVar15;
  long local_90;
  long local_88;

  pcVar3 = _DAT_1481ea210;
  lVar5 = *param_3;
  lVar1 = param_3[1];
  if (lVar5 != lVar1) {
    uVar8 = (undefined4)_DAT_145ee0620;
    uVar9 = (undefined4)((ulong)_DAT_145ee0620 >> 0x20);
    uVar14 = (undefined4)_DAT_145ee3c58;
    uVar15 = (undefined4)((ulong)_DAT_145ee3c58 >> 0x20);
    uVar10 = _DAT_145ee0630;
    uVar11 = uRam0000000145ee0634;
    uVar12 = uRam0000000145ee0638;
    uVar13 = uRam0000000145ee063c;
    do {
      lVar5 = lVar5 + 0x20;
      *param_3 = lVar5;
      pcVar4 = (char *)func_0x000142a769a0();
      if (pcVar4 == (char *)0x0) {
        pcVar4 = pcVar3;
      }
      if (*pcVar4 == '\x03') {
        local_88 = *(long *)(pcVar4 + 0x18);
        if (local_88 < 0) {
          func_0x000145eb6fcb();
                    /* WARNING: Does not return */
          pcVar2 = (code *)invalidInstructionException();
          (*pcVar2)();
        }
        if (local_88 == 0) goto LAB_1400759e0;
        func_0x000140002200();
        local_90 = func_0x0001400021c0();
        if (local_90 == 0) {
          func_0x000145eb6fcb();
                    /* WARNING: Does not return */
          pcVar2 = (code *)invalidInstructionException();
          (*pcVar2)();
        }
        func_0x000145d145fb();
      }
      else {
LAB_1400759e0:
        local_90 = 1;
        local_88 = 0;
      }
      pcVar4 = (char *)func_0x000142a769a0();
      if (pcVar4 == (char *)0x0) {
        pcVar4 = pcVar3;
      }
      if (*pcVar4 == '\x02') {
        if (*(long *)(pcVar4 + 8) == 0) {
          dVar6 = ((double)CONCAT44(uVar9,(int)((ulong)*(undefined8 *)(pcVar4 + 0x10) >> 0x20)) -
                  (double)CONCAT44(uVar13,uVar12)) +
                  ((double)CONCAT44(uVar8,(int)*(undefined8 *)(pcVar4 + 0x10)) -
                  (double)CONCAT44(uVar11,uVar10));
        }
        else if ((int)*(long *)(pcVar4 + 8) == 1) {
          dVar6 = (double)*(long *)(pcVar4 + 0x10);
        }
        else {
          dVar6 = *(double *)(pcVar4 + 0x10);
        }
        dVar7 = 0.0;
        if (0.0 <= dVar6) {
          dVar7 = dVar6;
        }
        dVar6 = (double)CONCAT44(uVar15,uVar14);
        if (dVar7 <= (double)CONCAT44(uVar15,uVar14)) {
          dVar6 = dVar7;
        }
        if ((int)(long)dVar6 != 0) {
          param_4[1] = local_90;
          param_4[2] = local_88;
          *(int *)(param_4 + 3) = (int)(long)dVar6;
          goto LAB_140075a90;
        }
      }
      if (local_88 != 0) {
        func_0x0001400021d0();
      }
    } while (lVar5 != lVar1);
  }
  local_88 = -1;
LAB_140075a90:
  *param_4 = local_88;
  return param_4;
}
