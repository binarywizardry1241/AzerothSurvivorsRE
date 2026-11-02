
/* WARNING: Type propagation algorithm not settling */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 param_4,long *param_5)

{
  undefined4 uVar1;
  undefined4 uVar2;
  long *plVar3;
  undefined4 *puVar4;
  undefined4 *puVar5;
  undefined4 *puVar6;
  int *piVar7;
  long lVar8;
  code *pcVar9;
  char *pcVar10;
  long lVar11;
  char cVar12;
  long lVar13;
  long lVar14;
  long lVar15;
  undefined8 *in_stack_00000028;
  ulong local_80;
  ulong local_78;
  long local_70;
  long local_60;
  long local_50;

  lVar15 = *param_3;
  if (*(long *)(lVar15 + 0x10) == 0) {
    return;
  }
  plVar3 = (long *)*param_5;
  puVar4 = (undefined4 *)param_5[2];
  uVar1 = *(undefined4 *)((long)param_5 + 0x1c);
  puVar5 = (undefined4 *)*in_stack_00000028;
  puVar6 = (undefined4 *)in_stack_00000028[2];
  uVar2 = *(undefined4 *)((long)in_stack_00000028 + 0x1c);
  *(undefined4 *)param_3[2] = *(undefined4 *)((long)param_3 + 0x1c);
  lVar14 = *(long *)(lVar15 + 8);
  lVar13 = *(long *)(lVar15 + 0x10);
  *(undefined8 *)(lVar15 + 0x10) = 0;
  lVar15 = lVar13 * 0x20 + lVar14;
  do {
    while( true ) {
      if (lVar14 == lVar15) {
        func_0x0001400e61a0();
        return;
      }
      lVar14 = lVar14 + 0x20;
      pcVar10 = (char *)func_0x000142a769a0();
      if (pcVar10 == (char *)0x0) {
        pcVar10 = _DAT_1481ea210;
      }
      if (*pcVar10 == '\x03') break;
LAB_14021bc50:
      func_0x000140023810();
    }
    piVar7 = *(int **)(pcVar10 + 0x10);
    lVar13 = *(long *)(pcVar10 + 0x18);
    if (lVar13 == 7) {
      if (*(int *)((long)piVar7 + 3) == 0x73656962 && *piVar7 == 0x62626f6c) {
        *puVar4 = uVar1;
        *(undefined1 *)((long)plVar3 + 0x12d) = 1;
        pcVar10 = (char *)func_0x000142a769a0();
        if (pcVar10 == (char *)0x0) {
          pcVar10 = _DAT_1481ea210;
        }
        if (*pcVar10 == '\x04') {
          local_78 = *(ulong *)(pcVar10 + 0x18);
          if (0x88888888888888 < local_78) {
LAB_14021c5c2:
            func_0x000145eb6fcb();
LAB_14021c611:
                    /* WARNING: Does not return */
            pcVar9 = (code *)invalidInstructionException();
            (*pcVar9)();
          }
          if (local_78 * 0xf0 == 0) {
            local_50 = 8;
            local_78 = 0;
          }
          else {
            func_0x000140002200();
            local_50 = func_0x0001400021c0();
            if (local_50 == 0) goto LAB_14021c5c2;
          }
          func_0x0001400749a0();
        }
        else {
          local_50 = 8;
          local_78 = 0;
        }
        *puVar4 = uVar1;
        lVar13 = plVar3[0xe];
        local_70 = 0;
        while (lVar13 != local_70) {
          local_70 = local_70 + 1;
          func_0x0001400cd080();
        }
        if (plVar3[0xc] != 0) {
          func_0x0001400021d0();
        }
        plVar3[0xc] = local_78;
        plVar3[0xd] = local_50;
        plVar3[0xe] = 0;
        *puVar4 = uVar1;
        if (1 < (ulong)plVar3[0xe]) {
          if ((ulong)plVar3[0xe] < 0x15) {
            func_0x0001401f67f0();
          }
          else {
            func_0x00014006c3c0();
          }
        }
        goto LAB_14021c202;
      }
      goto LAB_14021bc50;
    }
    if (lVar13 == 5) {
      if ((char)piVar7[1] == 'y' && *piVar7 == 0x74726170) {
        pcVar10 = (char *)func_0x000142a769a0();
        if (pcVar10 == (char *)0x0) {
          pcVar10 = _DAT_1481ea210;
        }
        if (*pcVar10 == '\x04') {
          local_80 = *(ulong *)(pcVar10 + 0x18);
          if (0x124924924924924 < local_80) {
LAB_14021c5d2:
            func_0x000145eb6fcb();
            goto LAB_14021c611;
          }
          if (local_80 * 0x70 == 0) {
            local_50 = 8;
            local_80 = 0;
          }
          else {
            func_0x000140002200();
            local_50 = func_0x0001400021c0();
            if (local_50 == 0) goto LAB_14021c5d2;
          }
          func_0x000140074260();
        }
        else {
          local_50 = 8;
          local_80 = 0;
        }
        *puVar4 = uVar1;
        func_0x0001400f1030();
        if (plVar3[0xf] != 0) {
          func_0x0001400021d0();
        }
        plVar3[0xf] = local_80;
        plVar3[0x10] = local_50;
        plVar3[0x11] = 0;
        goto LAB_14021c202;
      }
      goto LAB_14021bc50;
    }
    if ((lVar13 != 4) || (*piVar7 != 0x706f6f63)) goto LAB_14021bc50;
    pcVar10 = (char *)func_0x000142a769a0();
    if (pcVar10 == (char *)0x0) {
      pcVar10 = _DAT_1481ea210;
    }
    if (*pcVar10 == '\x03') {
      local_50 = *(long *)(pcVar10 + 0x18);
      if (local_50 < 0) {
LAB_14021c5b1:
        func_0x000145eb6fcb();
        goto LAB_14021c611;
      }
      if (local_50 == 0) goto LAB_14021bd6f;
      func_0x000140002200();
      local_60 = func_0x0001400021c0();
      if (local_60 == 0) goto LAB_14021c5b1;
      func_0x000145d145fb();
    }
    else {
LAB_14021bd6f:
      local_60 = 1;
      local_50 = 0;
    }
    pcVar10 = (char *)func_0x000142a769a0();
    if (pcVar10 == (char *)0x0) {
      pcVar10 = _DAT_1481ea210;
    }
    if (*pcVar10 == '\x03') {
      lVar13 = *(long *)(pcVar10 + 0x18);
      if (lVar13 < 0) {
LAB_14021c5e2:
        func_0x000145eb6fcb();
        goto LAB_14021c611;
      }
      if (lVar13 == 0) {
        lVar11 = 1;
        lVar13 = 0;
      }
      else {
        func_0x000140002200();
        lVar11 = func_0x0001400021c0();
        if (lVar11 == 0) goto LAB_14021c5e2;
        func_0x000145d145fb();
      }
      *puVar4 = uVar1;
      lVar8 = plVar3[3];
    }
    else {
      lVar11 = 1;
      lVar13 = 0;
      *puVar4 = uVar1;
      lVar8 = plVar3[3];
    }
    if (lVar8 != 0) {
      func_0x0001400021d0();
    }
    plVar3[3] = lVar13;
    plVar3[4] = lVar11;
    plVar3[5] = lVar13;
    pcVar10 = (char *)func_0x000142a769a0();
    if (pcVar10 == (char *)0x0) {
      pcVar10 = _DAT_1481ea210;
    }
    cVar12 = '\x05';
    if ((*pcVar10 == '\x02') && (*(long *)(pcVar10 + 8) == 0)) {
      cVar12 = pcVar10[0x10];
    }
    *puVar4 = uVar1;
    *(char *)((long)plVar3 + 0x134) = cVar12;
    pcVar10 = (char *)func_0x000142a769a0();
    if (pcVar10 == (char *)0x0) {
      pcVar10 = _DAT_1481ea210;
    }
    if (*pcVar10 == '\x03') {
      lVar13 = *(long *)(pcVar10 + 0x18);
      if (lVar13 < 0) {
LAB_14021c5f3:
        func_0x000145eb6fcb();
        goto LAB_14021c611;
      }
      if (lVar13 == 0) {
        lVar11 = 1;
        lVar13 = 0;
      }
      else {
        func_0x000140002200();
        lVar11 = func_0x0001400021c0();
        if (lVar11 == 0) goto LAB_14021c5f3;
        func_0x000145d145fb();
      }
      *puVar4 = uVar1;
      lVar8 = plVar3[6];
    }
    else {
      lVar11 = 1;
      lVar13 = 0;
      *puVar4 = uVar1;
      lVar8 = plVar3[6];
    }
    if (lVar8 != 0) {
      func_0x0001400021d0();
    }
    plVar3[6] = lVar13;
    plVar3[7] = lVar11;
    plVar3[8] = lVar13;
    pcVar10 = (char *)func_0x000142a769a0();
    if (pcVar10 == (char *)0x0) {
      pcVar10 = _DAT_1481ea210;
    }
    if (*pcVar10 == '\x03') {
      lVar13 = *(long *)(pcVar10 + 0x18);
      if (lVar13 < 0) {
LAB_14021c604:
        func_0x000145eb6fcb();
        goto LAB_14021c611;
      }
      if (lVar13 == 0) {
        lVar11 = 1;
        lVar13 = 0;
      }
      else {
        func_0x000140002200();
        lVar11 = func_0x0001400021c0();
        if (lVar11 == 0) goto LAB_14021c604;
        func_0x000145d145fb();
      }
      *puVar4 = uVar1;
      lVar8 = plVar3[9];
    }
    else {
      lVar11 = 1;
      lVar13 = 0;
      *puVar4 = uVar1;
      lVar8 = plVar3[9];
    }
    if (lVar8 != 0) {
      func_0x0001400021d0();
    }
    plVar3[9] = lVar13;
    plVar3[10] = lVar11;
    plVar3[0xb] = lVar13;
    if (local_50 - 3U < 9) {
                    /* WARNING: Could not emulate address calculation at 0x00014021c278 */
                    /* WARNING: Treating indirect jump as call */
      (*(code *)((long)*(int *)((local_50 - 3U) * 4 + 0x145f14564) + 0x145f14564))();
      return;
    }
    if ((6 < (ulong)plVar3[5]) &&
       (*(int *)(plVar3[4] + 3) == 0x3a64656b && *(int *)plVar3[4] == 0x6b636f6c)) {
      *puVar4 = uVar1;
      *(undefined1 *)((long)plVar3 + 300) = 1;
      *puVar6 = uVar2;
      *puVar5 = 0;
    }
    *puVar4 = uVar1;
    lVar13 = local_50;
    if (*plVar3 != 0) {
      func_0x0001400021d0();
    }
    *plVar3 = local_50;
    plVar3[1] = local_60;
    plVar3[2] = lVar13;
LAB_14021c202:
    *puVar4 = uVar1;
    plVar3[0x24] = plVar3[0x24] + 1;
    func_0x000140023810();
  } while( true );
}
