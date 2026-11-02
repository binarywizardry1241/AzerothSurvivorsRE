
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 *param_4,char *param_5)

{
  byte *pbVar1;
  char cVar2;
  code *pcVar3;
  bool bVar4;
  int *piVar5;
  uint uVar6;
  uint uVar7;
  long lVar8;
  ulong uVar9;
  undefined4 uVar11;
  ulong uVar10;
  undefined4 uVar12;
  char *pcVar13;
  ulong uVar14;
  int local_a0;
  undefined4 uStack_9c;
  char *local_98;
  ulong local_90;
  char *local_88;
  char *local_80;
  ulong local_78;
  char *local_70;
  undefined8 local_68;
  char *local_60;
  undefined8 local_58;
  undefined1 local_50;
  undefined2 local_48;
  
  if (param_5 < (char *)0x9) {
    return;
  }
  if (DAT_14734c8b0 != (char)param_3[1] || _DAT_14734c8a8 != *param_3) {
    return;
  }
  local_80 = param_5 + -9;
  uVar10 = (long)param_3 + 9;
  local_88 = (char *)0x0;
  local_68 = 0;
  local_58 = 0x2200000022;
  local_50 = 1;
  local_48 = 1;
  local_78 = uVar10;
  local_70 = local_80;
  local_60 = local_80;
  func_0x000145bb3770(param_3,param_5,&local_78,&local_a0);
  if (local_a0 == 1) {
    lVar8 = (long)local_98 - (long)local_88;
  }
  else {
    if (local_48._1_1_ != '\0') {
      return;
    }
    lVar8 = (long)local_80 - (long)local_88;
    uVar10 = local_78;
    if ((lVar8 != 0 | (byte)local_48) != 1) {
      return;
    }
  }
  piVar5 = (int *)((long)local_88 + uVar10);
  if (lVar8 == 6) {
    if ((short)piVar5[1] != 0x656d || *piVar5 != 0x75736572) {
      return;
    }
    if ((param_4[2] != -1) && (param_4[2] != 0)) {
      func_0x0001400021d0();
    }
    param_4[2] = 0xffffffffffffffff;
    *param_4 = 0;
    return;
  }
  if (lVar8 != 7) {
    return;
  }
  if (*(int *)((long)piVar5 + 3) != 0x73656369 || *piVar5 != 0x696f6863) {
    return;
  }
  func_0x000140002200();
  lVar8 = func_0x0001400021c0();
  if (lVar8 == 0) {
    func_0x0001461add5b();
                    /* WARNING: Does not return */
    pcVar3 = (code *)invalidInstructionException();
    (*pcVar3)();
  }
  func_0x00014600504b();
  if ((param_4[2] != -1) && (param_4[2] != 0)) {
    func_0x0001400021d0();
  }
  param_4[2] = param_5;
  param_4[3] = lVar8;
  param_4[4] = param_5;
  *param_4 = 0;
  func_0x000145fdef40();
  func_0x000145be5b20();
  uVar12 = 0;
  if (local_a0 != 1) goto LAB_145bd7467;
  pcVar13 = local_98 + 8;
  if (pcVar13 != (char *)0x0) {
    if (pcVar13 < param_5) {
      if (*(char *)((long)param_3 + (long)pcVar13) < -0x40) {
LAB_145bd71bb:
        func_0x0001461adf70();
                    /* WARNING: Does not return */
        pcVar3 = (code *)invalidInstructionException();
        (*pcVar3)();
      }
    }
    else if (pcVar13 != param_5) goto LAB_145bd71bb;
  }
  local_88 = pcVar13 + (long)param_3;
  local_80 = param_5 + (long)param_3;
  local_78 = local_78 & 0xffffffffffffff00;
  func_0x000145ab27f0();
  if (local_90 == 0) {
    uVar11 = 0;
    bVar4 = true;
  }
  else {
    if (local_90 == 1) {
      cVar2 = *local_98;
      uVar11 = 0;
      bVar4 = true;
      if ((cVar2 == '+') || (cVar2 == '-')) goto LAB_145bd7445;
    }
    else {
      cVar2 = *local_98;
    }
    uVar10 = (ulong)(cVar2 == '+');
    uVar14 = local_90 - uVar10;
    pbVar1 = (byte *)(local_98 + uVar10);
    if (uVar14 < 9) {
      if (local_90 == uVar10) {
        uVar9 = 0;
      }
      else {
        uVar6 = *pbVar1 - 0x30;
        uVar9 = (ulong)uVar6;
        uVar11 = 0;
        bVar4 = true;
        if (9 < uVar6) goto LAB_145bd7445;
        if (uVar14 != 1) {
          if (9 < pbVar1[1] - 0x30) goto LAB_145bd7445;
          uVar6 = (pbVar1[1] - 0x30) + uVar6 * 10;
          uVar9 = (ulong)uVar6;
          if (uVar14 != 2) {
            if (9 < pbVar1[2] - 0x30) goto LAB_145bd7445;
            uVar6 = (pbVar1[2] - 0x30) + uVar6 * 10;
            uVar9 = (ulong)uVar6;
            if (uVar14 != 3) {
              if (9 < pbVar1[3] - 0x30) goto LAB_145bd7445;
              uVar6 = (pbVar1[3] - 0x30) + uVar6 * 10;
              uVar9 = (ulong)uVar6;
              if (uVar14 != 4) {
                if (9 < pbVar1[4] - 0x30) goto LAB_145bd7445;
                uVar6 = (pbVar1[4] - 0x30) + uVar6 * 10;
                uVar9 = (ulong)uVar6;
                if (uVar14 != 5) {
                  if (9 < pbVar1[5] - 0x30) goto LAB_145bd7445;
                  uVar6 = (pbVar1[5] - 0x30) + uVar6 * 10;
                  uVar9 = (ulong)uVar6;
                  if (uVar14 != 6) {
                    if (9 < pbVar1[6] - 0x30) goto LAB_145bd7445;
                    uVar6 = (pbVar1[6] - 0x30) + uVar6 * 10;
                    uVar9 = (ulong)uVar6;
                    if (uVar14 != 7) {
                      if (9 < pbVar1[7] - 0x30) goto LAB_145bd7445;
                      uVar9 = (ulong)((pbVar1[7] - 0x30) + uVar6 * 10);
                    }
                  }
                }
              }
            }
          }
        }
      }
LAB_145bd743e:
      uVar11 = (undefined4)uVar9;
      bVar4 = false;
    }
    else {
      uVar9 = 0;
      lVar8 = 0;
      do {
        if (lVar8 == local_90 - uVar10) goto LAB_145bd743e;
        uVar6 = (uint)(uVar9 * 10);
        if ((int)(uVar9 * 10 >> 0x20) != 0) {
          uVar11 = 0;
          bVar4 = true;
          goto LAB_145bd7445;
        }
        uVar7 = pbVar1[lVar8] - 0x30;
        if (9 < uVar7) {
          uVar11 = 0;
          bVar4 = true;
          goto LAB_145bd7445;
        }
        lVar8 = lVar8 + 1;
        uVar9 = (ulong)(uVar7 + uVar6);
      } while (!CARRY4(uVar7,uVar6));
      uVar11 = 0;
      bVar4 = true;
    }
  }
LAB_145bd7445:
  uVar12 = 0;
  if (!bVar4) {
    uVar12 = uVar11;
  }
  if (CONCAT44(uStack_9c,local_a0) != 0) {
    func_0x0001400021d0();
  }
LAB_145bd7467:
  *(undefined4 *)(param_4 + 5) = uVar12;
  return;
}

