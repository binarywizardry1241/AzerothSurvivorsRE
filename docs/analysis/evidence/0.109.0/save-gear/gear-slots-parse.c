/* WARNING: Removing unreachable block (ram,0x0001459c0494) */

long * entry(undefined8 param_1,undefined8 param_2,ulong *param_3,long *param_4)

{
  char cVar1;
  code *pcVar2;
  ulong uVar3;
  ulong uVar4;
  ulong uVar5;
  undefined1 auVar6 [16];
  ulong uVar7;
  int iVar8;
  ulong uVar9;
  ulong uVar10;
  ulong uVar11;
  undefined8 uVar12;
  ulong uVar13;
  undefined4 uVar14;
  ulong uVar15;
  undefined1 auVar16 [16];
  undefined8 local_e0;
  undefined4 local_d8;
  undefined8 *local_c0;
  ulong local_b8;
  undefined4 uStack_b0;
  undefined4 uStack_ac;
  ulong local_a8;
  ulong local_98;
  undefined8 uStack_90;
  ulong local_88;
  ulong uStack_80;
  undefined8 local_78;
  long local_68;
  undefined8 *local_60;
  long local_58;
  long local_50;
  undefined8 local_48;

  local_48 = 0xfffffffffffffffe;
  cVar1 = *(char *)((long)param_3 + 0x41);
  while (cVar1 == '\0') {
    func_0x0001459c7330();
    if ((int)local_b8 == 1) {
      *param_3 = local_a8;
    }
    else if ((*(char *)((long)param_3 + 0x41) != '\0') ||
            (*(undefined1 *)((long)param_3 + 0x41) = 1,
            (byte)(param_3[1] != *param_3 | (byte)param_3[8]) != 1)) break;
    func_0x0001458a9410();
    if ((char)local_b8 != '\0') {
      uVar12 = CONCAT44(uStack_ac,uStack_b0);
      func_0x000140002200();
      local_c0 = (undefined8 *)func_0x0001400021c0();
      if (local_c0 == (undefined8 *)0x0) {
        func_0x000145d992bb();
                    /* WARNING: Does not return */
        pcVar2 = (code *)invalidInstructionException();
        (*pcVar2)();
      }
      *local_c0 = uVar12;
      *(undefined4 *)(local_c0 + 1) = (undefined4)local_a8;
      local_68 = 4;
      local_60 = local_c0;
      local_58 = 1;
      local_78 = param_3[8];
      uVar7 = local_78;
      local_b8 = *param_3;
      uVar5 = param_3[1];
      uVar3 = param_3[2];
      uVar4 = param_3[3];
      local_98 = param_3[4];
      uStack_90 = param_3[5];
      local_88 = param_3[6];
      uStack_80 = param_3[7];
      local_78._1_1_ = (char)(param_3[8] >> 8);
      if (local_78._1_1_ != '\0') goto LAB_1459c0324;
      local_50 = 1;
      local_78 = uVar7;
      goto LAB_1459c0350;
    }
    cVar1 = *(char *)((long)param_3 + 0x41);
  }
  *param_4 = 0;
  param_4[1] = 8;
  param_4[2] = 0;
  return param_4;
LAB_1459c0350:
  uVar7 = uStack_90;
  uVar15 = local_98;
  if (local_98 <= uStack_90 && uStack_90 <= uVar4) {
    uVar11 = uStack_80 & 0xff;
    cVar1 = *(char *)((long)&uStack_90 + uVar11 + 7);
    uVar13 = uVar4;
    if (uVar11 < 5) {
      do {
        if (uVar7 - local_98 < 0x10) {
          uVar15 = 0;
          if (uVar7 == local_98) goto LAB_1459c04a0;
          while (*(char *)(local_98 + uVar3 + uVar15) != cVar1) {
            uVar15 = uVar15 + 1;
            if (uVar7 - local_98 == uVar15) goto LAB_1459c04a0;
          }
        }
        else {
          auVar16 = func_0x000145bd5860();
          uVar15 = auVar16._8_8_;
          if (auVar16._0_8_ != 1) goto LAB_1459c04a0;
        }
        uVar15 = local_98 + uVar15 + 1;
        local_98 = uVar15;
        if ((uVar15 <= uVar13 && uVar11 <= uVar15) &&
           (iVar8 = func_0x000145bfa0e1(), uVar10 = local_98, iVar8 == 0)) goto LAB_1459c04cf;
      } while (local_98 <= uVar7);
    }
    else {
      do {
        uVar15 = uVar7 - local_98;
        if (uVar15 < 0x10) {
          uVar9 = 0;
          uVar10 = uVar9;
          if (uVar15 != 0) {
            do {
              if (*(char *)(local_98 + uVar3 + uVar9) == cVar1) {
                auVar16._8_8_ = uVar9;
                auVar16._0_8_ = 1;
                goto LAB_1459c03c7;
              }
              uVar9 = uVar9 + 1;
              uVar10 = uVar15;
            } while (uVar15 != uVar9);
          }
          auVar6._8_8_ = 0;
          auVar6._0_8_ = uVar10;
          auVar16 = auVar6 << 0x40;
        }
        else {
          auVar16 = func_0x000145bd5860();
        }
LAB_1459c03c7:
        if (auVar16._0_8_ != 1) goto LAB_1459c04a0;
        local_98 = local_98 + auVar16._8_8_ + 1;
        if (local_98 <= uVar13 && uVar11 <= local_98) {
          func_0x000145d99860();
                    /* WARNING: Does not return */
          pcVar2 = (code *)invalidInstructionException();
          (*pcVar2)();
        }
        uVar15 = local_98;
      } while (local_98 <= uVar7);
    }
  }
  goto LAB_1459c04a4;
LAB_1459c04a0:
  local_98 = uVar7;
  uVar15 = local_98;
LAB_1459c04a4:
  local_98 = uVar15;
  uVar7 = local_78;
  if (local_78._1_1_ != '\0') goto LAB_1459c0324;
  local_78._0_2_ = CONCAT11(1,(undefined1)local_78);
  uVar10 = local_b8;
  uVar15 = local_98;
  if (uVar5 == local_b8 && (uVar7 & 1) == 0) goto LAB_1459c0324;
LAB_1459c04cf:
  local_98 = uVar15;
  local_b8 = uVar10;
  func_0x0001458a9410();
  if ((char)param_3 == -0x48) {
  }
  else {
    uVar12 = local_e0;
    uVar14 = local_d8;
    if (local_50 == local_68) {
      func_0x000145bfa970();
      local_c0 = local_60;
    }
    local_c0[local_50 * 2] = uVar12;
    *(undefined4 *)(local_c0 + local_50 * 2 + 1) = uVar14;
    local_50 = local_50 + 1;
    local_58 = local_50;
  }
  if (local_78._1_1_ != '\0') {
LAB_1459c0324:
    param_4[2] = local_58;
    *param_4 = local_68;
    param_4[1] = (long)local_60;
    return param_4;
  }
  goto LAB_1459c0350;
}
