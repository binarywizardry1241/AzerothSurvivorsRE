
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,undefined8 *param_3,undefined8 param_4,
          long *param_5,undefined8 *param_6)

{
  uint *puVar1;
  undefined4 uVar2;
  ulong *puVar3;
  char cVar4;
  uint *puVar5;
  long lVar6;
  byte bVar7;
  long lVar8;
  long lVar9;
  long lVar10;
  long lVar11;
  ulong uVar12;
  long lVar13;
  uint uVar14;
  long lVar15;
  bool bVar16;
  long *in_stack_00000028;

  lVar8 = *in_stack_00000028;
  lVar9 = in_stack_00000028[1];
  uVar2 = *(undefined4 *)((long)in_stack_00000028 + 0x14);
  if (((*(char *)*param_3 == '\x02') || (*(char *)(*param_5 + 0x48) == '\x01')) &&
     (bVar7 = 1, *(int *)*param_6 - 3U < 0xfffffffe)) goto LAB_14088151d;
  if (_DAT_148078190 == 0) {
    LOCK();
    bVar16 = DAT_148078160 == '\0';
    if (bVar16) {
      DAT_148078160 = '\x01';
    }
    UNLOCK();
  }
  else {
    func_0x000145c4aa3e();
    LOCK();
    bVar16 = DAT_148078160 == '\0';
    if (bVar16) {
      DAT_148078160 = '\x01';
    }
    UNLOCK();
  }
  if (!bVar16) {
    func_0x000145dbc1f0();
  }
  puVar3 = _DAT_1480be9e8;
  if ((*_DAT_1480be9e8 & 0x7fffffffffffffff) == 0) {
    bVar7 = (DAT_14807818c ^ 1) & DAT_14807818d;
LAB_1408814fe:
    if (((*puVar3 & 0x7fffffffffffffff) != 0) && (cVar4 = func_0x000145dbcf80(), cVar4 == '\0')) {
      DAT_148078161 = 1;
    }
  }
  else {
    cVar4 = func_0x000145dbcf80();
    bVar7 = (DAT_14807818c ^ 1) & DAT_14807818d;
    if (cVar4 != '\0') goto LAB_1408814fe;
  }
  cVar4 = DAT_148078160;
  LOCK();
  DAT_148078160 = '\0';
  UNLOCK();
  if (cVar4 == '\x02') {
    func_0x000145dbc2b0();
  }
LAB_14088151d:
  puVar5 = *(uint **)(lVar8 + 0xf8);
  puVar1 = puVar5 + *(long *)(lVar8 + 0x100);
  if (*(char *)(lVar8 + 0x108) == '\0') {
    lVar6 = 0;
    lVar15 = 8;
    lVar11 = 0;
    uVar14 = 0;
    do {
      if (uVar14 == (uint)lVar6) {
        do {
          if (puVar5 == puVar1) {
            return;
          }
          uVar14 = *puVar5;
          puVar5 = puVar5 + 1;
          lVar6 = *(long *)(*(long *)(lVar9 + 0x108) + 0x58 + (ulong)uVar14 * 0xa0);
        } while (lVar6 == 0);
        lVar10 = *(long *)(lVar9 + 0x108) + (ulong)uVar14 * 0xa0;
        uVar12 = (ulong)*(uint *)(lVar10 + 0x94);
        lVar15 = *(long *)(*(long *)(lVar9 + 0x1a8) + 0x18 + uVar12 * 0x48);
        lVar13 = ~*(ulong *)(*(long *)(*(long *)(lVar9 + 0x1a8) + 0x38 + uVar12 * 0x48) +
                            *(long *)(lVar8 + 0x110) * 8) * 0x30;
        lVar11 = *(long *)(lVar15 + 0x10 + lVar13);
        param_6 = *(undefined8 **)(lVar15 + 0x28 + lVar13);
        lVar15 = *(long *)(lVar10 + 0x50);
        uVar14 = 0;
      }
      uVar12 = (ulong)uVar14;
      uVar14 = uVar14 + 1;
      uVar12 = (ulong)~*(uint *)(lVar15 + 8 + uVar12 * 0x10);
      lVar10 = uVar12 * 0x110;
      if (bVar7 != *(byte *)(lVar11 + 0x100 + lVar10)) {
        *(undefined4 *)((long)param_6 + uVar12 * 4) = uVar2;
        *(byte *)(lVar10 + lVar11 + 0x100) = bVar7;
      }
    } while( true );
  }
  lVar6 = 0;
  lVar11 = 0;
  uVar14 = 0;
  do {
    if (uVar14 == (uint)lVar6) {
      do {
        if (puVar5 == puVar1) {
          return;
        }
        uVar14 = *puVar5;
        puVar5 = puVar5 + 1;
        lVar6 = *(long *)(*(long *)(lVar9 + 0x1a8) + 0x10 + (ulong)uVar14 * 0x48);
      } while (lVar6 == 0);
      lVar11 = *(long *)(lVar9 + 0x1a8) + (ulong)uVar14 * 0x48;
      lVar15 = *(long *)(lVar11 + 0x18);
      lVar10 = ~*(ulong *)(*(long *)(lVar11 + 0x38) + *(long *)(lVar8 + 0x110) * 8) * 0x30;
      lVar11 = *(long *)(lVar15 + 0x10 + lVar10);
      param_5 = *(long **)(lVar15 + 0x28 + lVar10);
      uVar14 = 0;
    }
    uVar12 = (ulong)uVar14;
    uVar14 = uVar14 + 1;
    lVar15 = uVar12 * 0x110;
    if (bVar7 != *(byte *)(lVar11 + 0x100 + lVar15)) {
      *(undefined4 *)((long)param_5 + uVar12 * 4) = uVar2;
      *(byte *)(lVar15 + lVar11 + 0x100) = bVar7;
    }
  } while( true );
}
