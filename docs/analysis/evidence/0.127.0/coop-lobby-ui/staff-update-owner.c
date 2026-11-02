
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 param_4,long *param_5)

{
  char cVar1;
  undefined4 uVar2;
  uint uVar3;
  long lVar4;
  long lVar5;
  ulong uVar6;
  undefined4 *puVar7;
  long lVar8;
  ulong uVar9;
  long lVar10;
  ulong uVar11;
  ulong uVar12;
  long lVar13;
  uint *puVar14;
  ulong uVar15;
  uint *puVar16;
  uint *puVar17;
  float fVar18;
  float fVar19;
  uint local_bc;
  undefined4 uStack_b8;
  undefined8 uStack_b4;
  uint local_ac;
  long local_a8;
  long local_a0;
  long local_80;
  
  lVar4 = *param_5;
  lVar5 = param_5[1];
  uVar2 = *(undefined4 *)((long)param_5 + 0x14);
  puVar16 = *(uint **)(lVar4 + 0xf8);
  puVar14 = puVar16 + *(long *)(lVar4 + 0x100);
  cVar1 = *(char *)(lVar4 + 0x108);
  fVar18 = *(float *)(*param_3 + 0x5c) * _DAT_14624fc2c;
  uVar15 = 0;
  lVar13 = 8;
  local_80 = 8;
  local_a8 = 0;
  uVar11 = 0;
  fVar19 = _DAT_1462330e8;
  while( true ) {
    if (cVar1 == '\0') {
      uVar6 = uVar15 & 0xffffffff;
      do {
        if ((int)uVar11 == (int)uVar6) {
          do {
            if (puVar16 == puVar14) {
              return;
            }
            uVar3 = *puVar16;
            puVar16 = puVar16 + 1;
            uVar6 = *(ulong *)(*(long *)(lVar5 + 0x108) + 0x58 + (ulong)uVar3 * 0xa0);
          } while (uVar6 == 0);
          lVar8 = *(long *)(lVar5 + 0x108) + (ulong)uVar3 * 0xa0;
          uVar11 = (ulong)*(uint *)(lVar8 + 0x94);
          lVar13 = *(long *)(*(long *)(lVar5 + 0x1a8) + 0x18 + uVar11 * 0x48);
          lVar10 = ~*(ulong *)(*(long *)(*(long *)(lVar5 + 0x1a8) + 0x38 + uVar11 * 0x48) +
                              *(long *)(lVar4 + 0x110) * 8) * 0x30;
          local_a8 = *(long *)(lVar13 + 0x10 + lVar10);
          local_a0 = *(long *)(lVar13 + 0x28 + lVar10);
          lVar13 = *(long *)(lVar8 + 0x50);
          uVar11 = 0;
          uVar15 = uVar6 & 0xffffffff;
        }
        lVar8 = uVar11 * 0x10;
        uVar11 = (ulong)((int)uVar11 + 1);
        uVar9 = *(ulong *)(lVar13 + lVar8);
      } while ((int)uVar9 == 0);
      uVar6 = (ulong)~*(uint *)(lVar13 + lVar8 + 8);
      puVar17 = (uint *)(local_a8 + uVar6 * 0x14);
      puVar7 = (undefined4 *)(local_a0 + uVar6 * 4);
    }
    else {
      uVar6 = uVar15 & 0xffffffff;
      do {
        uVar12 = uVar11;
        if ((int)uVar12 == (int)uVar6) {
          do {
            if (puVar16 == puVar14) {
              return;
            }
            uVar3 = *puVar16;
            puVar16 = puVar16 + 1;
            uVar6 = *(ulong *)(*(long *)(lVar5 + 0x1a8) + 0x10 + (ulong)uVar3 * 0x48);
          } while (uVar6 == 0);
          lVar8 = *(long *)(lVar5 + 0x1a8) + (ulong)uVar3 * 0x48;
          local_80 = *(long *)(lVar8 + 8);
          lVar10 = ~*(ulong *)(*(long *)(lVar8 + 0x38) + *(long *)(lVar4 + 0x110) * 8) * 0x30;
          local_a8 = *(long *)(*(long *)(lVar8 + 0x18) + 0x10 + lVar10);
          local_a0 = *(long *)(*(long *)(lVar8 + 0x18) + 0x28 + lVar10);
          uVar12 = 0;
          uVar15 = uVar6 & 0xffffffff;
        }
        uVar11 = (ulong)((int)uVar12 + 1);
        uVar9 = *(ulong *)(local_80 + uVar12 * 8);
      } while ((int)uVar9 == 0);
      puVar17 = (uint *)(local_a8 + uVar12 * 0x14);
      puVar7 = (undefined4 *)(local_a0 + uVar12 * 4);
    }
    if ((int)uVar9 == 0) break;
    func_0x000146061751((float)((int)(uVar9 / 7) * -7 + (int)uVar9) * fVar19 + fVar18);
    func_0x000144eaabf0();
    if (*puVar17 == local_bc) {
                    /* WARNING: Could not recover jumptable at 0x0001402de654. Too many branches */
                    /* WARNING: Treating indirect jump as call */
      (*(code *)((long)*(int *)((ulong)*puVar17 * 4 + 0x14627a9ac) + 0x14627a9ac))
                (puVar17[1],uStack_b8);
      return;
    }
    *puVar7 = uVar2;
    puVar17[4] = local_ac;
    *(ulong *)puVar17 = CONCAT44(uStack_b8,local_bc);
    *(undefined8 *)(puVar17 + 2) = uStack_b4;
  }
  return;
}

