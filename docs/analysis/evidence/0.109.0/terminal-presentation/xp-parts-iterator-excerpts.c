/* Original Ghidra owner 0x14012a2e0, lines30..119. */
    uVar9 = (undefined4)((ulong)_DAT_145dccf60 >> 0x20);
    uVar14 = (undefined4)_DAT_145dd2d58;
    uVar15 = (undefined4)((ulong)_DAT_145dd2d58 >> 0x20);
    uVar10 = _DAT_145dccf70;
    uVar11 = uRam0000000145dccf74;
    uVar12 = uRam0000000145dccf78;
    uVar13 = uRam0000000145dccf7c;
    do {
      lVar5 = lVar5 + 0x20;
      *param_3 = lVar5;
      pcVar4 = (char *)func_0x000142aeace0();
      if (pcVar4 == (char *)0x0) {
        pcVar4 = pcVar3;
      }
      if (*pcVar4 == '\x03') {
        local_88 = *(long *)(pcVar4 + 0x18);
        if (local_88 < 0) {
          func_0x000145d992bb();
                    /* WARNING: Does not return */
          pcVar2 = (code *)invalidInstructionException();
          (*pcVar2)();
        }
        if (local_88 == 0) goto LAB_14012a3c0;
        func_0x000140002200();
        local_90 = func_0x0001400021c0();
        if (local_90 == 0) {
          func_0x000145d992bb();
                    /* WARNING: Does not return */
          pcVar2 = (code *)invalidInstructionException();
          (*pcVar2)();
        }
        func_0x000145bfa0e7();
      }
      else {
LAB_14012a3c0:
        local_90 = 1;
        local_88 = 0;
      }
      pcVar4 = (char *)func_0x000142aeace0();
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
          goto LAB_14012a470;
        }
      }
      if (local_88 != 0) {
        func_0x0001400021d0();
      }
    } while (lVar5 != lVar1);
  }
  local_88 = -1;
LAB_14012a470:
  *param_4 = local_88;
  return param_4;
}
