void entry(undefined8 param_1,undefined8 param_2,undefined8 *param_3,undefined8 param_4,
          undefined8 *param_5,long *param_6)

{
  char cVar1;
  byte bVar2;
  byte bVar3;
  undefined4 uVar4;
  ulong *puVar5;
  undefined4 *puVar6;
  code *pcVar7;
  long lVar8;
  int iVar9;
  ulong uVar10;
  long lVar11;
  ulong uVar12;
  long lVar13;
  ulong uVar14;
  ulong uVar15;
  byte *pbVar16;
  byte *pbVar17;
  long *plVar18;
  uint uVar19;
  ulong uVar20;
  long lVar21;
  long lVar22;
  long lVar23;
  long *in_stack_00000028;
  undefined8 *in_stack_00000030;
  long *in_stack_00000038;
  undefined4 local_98;
  undefined4 uStack_94;
  undefined4 uStack_90;
  undefined4 uStack_8c;
  long local_88;
  long local_70;
  long local_68;
  long local_60;

  puVar5 = (ulong *)*param_3;
  lVar11 = param_3[1];
  if ((((((char *)*param_5)[0xd] == '\0') || (*(char *)*param_5 != '\0')) ||
      (*(char *)(*param_6 + 0x72) != '\0')) ||
     ((*(char *)(*in_stack_00000028 + 0x1c0) != '\0' || (*(char *)*in_stack_00000030 != '\0')))) {
    *puVar5 = *(ulong *)(lVar11 + 0x40);
    return;
  }
  plVar18 = (long *)*in_stack_00000038;
  puVar6 = (undefined4 *)in_stack_00000038[2];
  uVar4 = *(undefined4 *)((long)in_stack_00000038 + 0x1c);
  func_0x000145bcd2f0();
  uVar14 = *puVar5;
  uVar20 = 0;
  uVar12 = uVar14 - *(ulong *)(lVar11 + 0x18);
  if (uVar14 < *(ulong *)(lVar11 + 0x18)) {
    uVar12 = uVar20;
  }
  uVar10 = uVar14 - *(ulong *)(lVar11 + 0x38);
  if (uVar14 < *(ulong *)(lVar11 + 0x38)) {
    uVar10 = uVar20;
  }
  lVar21 = uVar12 * 0x58 + *(long *)(lVar11 + 8);
  uVar14 = *(ulong *)(lVar11 + 0x10);
  uVar15 = uVar14 - uVar12;
  if (uVar14 < uVar12) {
    uVar15 = uVar20;
  }
  if (uVar14 < uVar12) {
    lVar21 = 8;
  }
  lVar23 = uVar10 * 0x58 + *(long *)(lVar11 + 0x28);
  uVar14 = *(ulong *)(lVar11 + 0x30) - uVar10;
  if (*(ulong *)(lVar11 + 0x30) < uVar10) {
    lVar23 = 8;
    uVar14 = uVar20;
  }
  *puVar5 = (*(long *)(lVar11 + 0x40) - uVar14) - uVar15;
  lVar22 = uVar15 * 0x58 + lVar21;
  lVar11 = uVar14 * 0x58 + lVar23;
  do {
    if ((lVar21 == 0) || (lVar21 == lVar22)) {
      if ((lVar23 == 0) || (lVar23 == lVar11)) {
        if ((local_60 != plVar18[2]) || (iVar9 = func_0x000145bfa0e1(), iVar9 != 0)) {
          func_0x0001458a8fa0();
          *puVar6 = uVar4;
          if (*plVar18 != 0) {
            func_0x0001400021d0();
          }
          plVar18[2] = local_88;
          *(undefined4 *)plVar18 = local_98;
          *(undefined4 *)((long)plVar18 + 4) = uStack_94;
          *(undefined4 *)(plVar18 + 1) = uStack_90;
          *(undefined4 *)((long)plVar18 + 0xc) = uStack_8c;
        }
        if (local_70 == 0) {
          return;
        }
        func_0x0001400021d0();
        return;
      }
      *puVar5 = *puVar5 + 1;
      cVar1 = *(char *)(lVar23 + 0x54);
      lVar13 = 0;
      lVar8 = lVar23;
      lVar23 = lVar23 + 0x58;
    }
    else {
      *puVar5 = *puVar5 + 1;
      cVar1 = *(char *)(lVar21 + 0x54);
      lVar13 = lVar21 + 0x58;
      lVar8 = lVar21;
    }
    lVar21 = lVar13;
    if (cVar1 == '\0') {
      iVar9 = *(int *)(lVar8 + 8);
      if (iVar9 == 0x1c) {
        if (local_60 != 0) {
          uVar14 = 0xffffffffffffffff;
          if (*(char *)(local_68 + -1 + local_60) < '\0') {
            bVar3 = *(byte *)(local_68 + -2 + local_60);
            if ((char)bVar3 < -0x40) {
              bVar2 = *(byte *)(local_68 + -3 + local_60);
              if ((char)bVar2 < -0x40) {
                uVar19 = bVar2 & 0x3f | (*(byte *)(local_68 + -4 + local_60) & 7) << 6;
              }
              else {
                uVar19 = bVar2 & 0xf;
              }
              uVar19 = bVar3 & 0x3f | uVar19 << 6;
            }
            else {
              uVar19 = bVar3 & 0x1f;
            }
            if ((1 < uVar19) && (uVar14 = 0xfffffffffffffffe, 0x1f < uVar19)) {
              uVar14 = (ulong)(uVar19 < 0x400) | 0xfffffffffffffffc;
            }
          }
          local_60 = uVar14 + local_60;
        }
      }
      else if (iVar9 == 0x13) {
        func_0x000140067e90();
      }
      else if (iVar9 == 0) {
        uVar14 = (ulong)*(byte *)(lVar8 + 0x10);
        lVar13 = uVar14 - 0x17;
        if (uVar14 < 0x18) {
          lVar13 = 0;
        }
        if (lVar13 == 0) {
          if (0x17 < *(byte *)(lVar8 + 0x10)) {
            func_0x000145d99860();
                    /* WARNING: Does not return */
            pcVar7 = (code *)invalidInstructionException();
            (*pcVar7)();
          }
          pbVar17 = (byte *)(lVar8 + 0x11);
        }
        else if ((int)lVar13 == 1) {
          pbVar17 = *(byte **)(lVar8 + 0x18);
          uVar14 = *(ulong *)(lVar8 + 0x20);
        }
        else {
          uVar14 = *(ulong *)(lVar8 + 0x20);
          pbVar17 = (byte *)(*(long *)(lVar8 + 0x18) + 0x10);
        }
        pbVar16 = pbVar17 + uVar14;
        while (pbVar17 != pbVar16) {
          bVar3 = *pbVar17;
          if ((char)bVar3 < '\0') {
            if (bVar3 < 0xe0) {
              pbVar17 = pbVar17 + 2;
            }
            else if (bVar3 < 0xf0) {
              pbVar17 = pbVar17 + 3;
            }
            else {
              pbVar17 = pbVar17 + 4;
            }
          }
          else {
            pbVar17 = pbVar17 + 1;
          }
          func_0x000140067e90();
        }
      }
    }
  } while( true );
}
