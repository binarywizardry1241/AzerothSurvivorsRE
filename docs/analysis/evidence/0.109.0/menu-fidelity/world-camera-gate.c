void FUN_140c14d90(undefined8 param_1,undefined8 param_2,undefined8 *param_3,undefined8 param_4,
                  long *param_5,undefined8 *param_6)

{
  uint *puVar1;
  undefined4 uVar2;
  char cVar3;
  uint *puVar4;
  long lVar5;
  long lVar6;
  long lVar7;
  long lVar8;
  long in_R10;
  long lVar9;
  ulong uVar10;
  long lVar11;
  uint uVar12;
  long lVar13;
  long *in_stack_00000028;

  lVar5 = *in_stack_00000028;
  lVar6 = in_stack_00000028[1];
  uVar2 = *(undefined4 *)((long)in_stack_00000028 + 0x14);
  if (((*(char *)*param_3 != '\x02') && (*(char *)(*param_5 + 0x48) != '\x01')) ||
     (cVar3 = '\x01', 0xfffffffd < *(int *)*param_6 - 3U)) {
    cVar3 = func_0x000140811980();
  }
  puVar4 = *(uint **)(lVar5 + 0xf8);
  puVar1 = puVar4 + *(long *)(lVar5 + 0x100);
  if (*(char *)(lVar5 + 0x108) != '\0') {
    lVar7 = 0;
    lVar9 = 0;
    uVar12 = 0;
    do {
      if (uVar12 == (uint)lVar7) {
        do {
          if (puVar4 == puVar1) {
            return;
          }
          uVar12 = *puVar4;
          puVar4 = puVar4 + 1;
          lVar7 = *(long *)(*(long *)(lVar6 + 0x1a8) + 0x10 + (ulong)uVar12 * 0x48);
        } while (lVar7 == 0);
        lVar9 = *(long *)(lVar6 + 0x1a8) + (ulong)uVar12 * 0x48;
        lVar13 = *(long *)(lVar9 + 0x18);
        lVar8 = ~*(ulong *)(*(long *)(lVar9 + 0x38) + *(long *)(lVar5 + 0x110) * 8) * 0x30;
        lVar9 = *(long *)(lVar13 + 0x10 + lVar8);
        param_6 = *(undefined8 **)(lVar13 + 0x28 + lVar8);
        uVar12 = 0;
      }
      uVar10 = (ulong)uVar12;
      uVar12 = uVar12 + 1;
      lVar13 = uVar10 * 0x110;
      if (cVar3 != *(char *)(lVar9 + 0x100 + lVar13)) {
        *(undefined4 *)((long)param_6 + uVar10 * 4) = uVar2;
        *(char *)(lVar13 + lVar9 + 0x100) = cVar3;
      }
    } while( true );
  }
  lVar7 = 0;
  lVar13 = 8;
  lVar9 = 0;
  uVar12 = 0;
  do {
    if (uVar12 == (uint)lVar7) {
      do {
        if (puVar4 == puVar1) {
          return;
        }
        uVar12 = *puVar4;
        puVar4 = puVar4 + 1;
        lVar7 = *(long *)(*(long *)(lVar6 + 0x108) + 0x58 + (ulong)uVar12 * 0xa0);
      } while (lVar7 == 0);
      lVar8 = *(long *)(lVar6 + 0x108) + (ulong)uVar12 * 0xa0;
      uVar10 = (ulong)*(uint *)(lVar8 + 0x94);
      lVar13 = *(long *)(*(long *)(lVar6 + 0x1a8) + 0x18 + uVar10 * 0x48);
      lVar11 = ~*(ulong *)(*(long *)(*(long *)(lVar6 + 0x1a8) + 0x38 + uVar10 * 0x48) +
                          *(long *)(lVar5 + 0x110) * 8) * 0x30;
      lVar9 = *(long *)(lVar13 + 0x10 + lVar11);
      in_R10 = *(long *)(lVar13 + 0x28 + lVar11);
      lVar13 = *(long *)(lVar8 + 0x50);
      uVar12 = 0;
    }
    uVar10 = (ulong)uVar12;
    uVar12 = uVar12 + 1;
    uVar10 = (ulong)~*(uint *)(lVar13 + 8 + uVar10 * 0x10);
    lVar8 = uVar10 * 0x110;
    if (cVar3 != *(char *)(lVar9 + 0x100 + lVar8)) {
      *(undefined4 *)(in_R10 + uVar10 * 4) = uVar2;
      *(char *)(lVar8 + lVar9 + 0x100) = cVar3;
    }
  } while( true );
}
