/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,undefined8 param_3)

{
  undefined1 auVar1 [16];
  double dVar2;
  char cVar3;
  char *in_RCX;
  char *pcVar4;
  undefined4 uVar5;
  char **ppcVar6;
  undefined8 uVar7;
  undefined1 auVar8 [16];
  undefined1 auVar9 [16];
  undefined4 in_XMM6_Da;
  undefined4 uVar10;
  undefined4 uVar13;
  double dVar11;
  double dVar12;
  undefined4 in_XMM7_Da;
  undefined4 uVar14;
  undefined4 uVar16;
  double dVar15;
  undefined1 auVar17 [12];
  undefined1 auVar18 [12];
  double local_f8;
  undefined8 *local_f0;
  undefined8 local_e8;
  undefined8 local_e0;
  char **local_d8;
  char *local_d0;
  undefined8 **local_c8;
  double *local_c0;
  long local_b8;
  char *local_b0;
  undefined8 **local_a8;
  double *local_a0;
  long local_98;
  double *local_90;
  undefined8 local_88;
  double *local_80;
  undefined8 local_78;
  double *local_70;
  undefined8 local_68;
  double local_60;
  double local_58;
  double local_50;
  undefined4 local_48;
  undefined4 local_38;

  uVar10 = (undefined4)param_3;
  uVar13 = (undefined4)((ulong)param_3 >> 0x20);
  local_48 = in_XMM6_Da;
  local_38 = in_XMM7_Da;
  cVar3 = func_0x000141510d30();
  uVar7 = func_0x000141510d60();
  uVar14 = (undefined4)uVar7;
  uVar16 = (undefined4)((ulong)uVar7 >> 0x20);
  auVar17 = func_0x000145b73920();
  uVar5 = auVar17._8_4_;
  pcVar4 = auVar17._0_8_;
  local_a8 = (undefined8 **)CONCAT44(local_a8._4_4_,uVar5);
  if ((cVar3 == '\0') || (cVar3 == '\x05')) {
    if (*in_RCX == '\0') {
      in_RCX[0] = '\x01';
      in_RCX[1] = '\0';
      *(ulong *)(in_RCX + 8) = CONCAT44(uVar16,uVar14);
      *(undefined1 (*) [12])(in_RCX + 0x10) = auVar17;
      return;
    }
    local_b0 = pcVar4;
    if (*in_RCX == '\x01') {
      cVar3 = in_RCX[1];
      uVar10 = (undefined4)*(undefined8 *)(in_RCX + 8);
      uVar13 = (undefined4)((ulong)*(undefined8 *)(in_RCX + 8) >> 0x20);
      auVar17 = func_0x000145b73770();
      auVar8._8_4_ = auVar17._4_4_;
      auVar8._0_8_ = auVar17._0_8_;
      auVar8._12_4_ = uRam0000000145d74074;
      dVar11 = (double)auVar17._8_4_ / _DAT_145d74090 +
               (auVar8._8_8_ - dRam0000000145d74088) +
               ((double)CONCAT44(_DAT_145d74070,auVar17._0_4_) - _DAT_145d74080);
      if ((double)CONCAT44(uVar16,uVar14) < (double)CONCAT44(uVar13,uVar10) ||
          (double)CONCAT44(uVar16,uVar14) == (double)CONCAT44(uVar13,uVar10)) {
        if (cVar3 != '\0') {
          return;
        }
        if (dVar11 <= _DAT_145f4eb48) {
          return;
        }
        in_RCX[0] = '\x01';
        in_RCX[1] = '\x01';
        if (3 < *_DAT_147ff6fa8) {
          return;
        }
        local_f8 = dVar11;
        if (1 < DAT_147fbe148 - 1) {
          if (DAT_147fbe148 == 0) {
            return;
          }
          cVar3 = func_0x000145d15470();
          if (cVar3 == '\0') {
            return;
          }
        }
        cVar3 = func_0x000144c46ce0();
        if (cVar3 == '\0') {
          return;
        }
        local_e0 = 0x145f53220;
        local_98 = _DAT_147fbe138;
      }
      else {
        *in_RCX = '\x02';
        *(ulong *)(in_RCX + 8) = CONCAT44(uVar16,uVar14);
        *(char **)(in_RCX + 0x10) = pcVar4;
        *(undefined4 *)(in_RCX + 0x18) = uVar5;
        in_RCX[0x30] = '\0';
        in_RCX[0x31] = '\0';
        in_RCX[0x32] = '\0';
        in_RCX[0x33] = '\0';
        in_RCX[0x34] = '\0';
        in_RCX[0x35] = '\0';
        in_RCX[0x36] = '\0';
        in_RCX[0x37] = '\0';
        in_RCX[0x38] = '\0';
        in_RCX[0x39] = '\0';
        in_RCX[0x3a] = '\0';
        in_RCX[0x3b] = '\0';
        in_RCX[0x3c] = '\0';
        in_RCX[0x3d] = '\0';
        in_RCX[0x3e] = '\0';
        in_RCX[0x3f] = '\0';
        if (1 < *_DAT_147ff6fa8) {
          return;
        }
        if (1 < DAT_147fbe130 - 1) {
          if (DAT_147fbe130 == 0) {
            return;
          }
          cVar3 = func_0x000145d15470();
          if (cVar3 == '\0') {
            return;
          }
        }
        cVar3 = func_0x000144c46ce0();
        if (cVar3 == '\0') {
          return;
        }
        local_f8 = dVar11 * _DAT_145d9ddc0;
        local_e0 = 0x145f53294;
        local_98 = _DAT_147fbe120;
      }
      local_c0 = &local_f8;
      local_d0 = in_RCX + 0x20;
      local_b8 = 0x145badb10;
      local_c8 = (undefined8 **)0x1400020c0;
      local_98 = local_98 + 0x30;
      local_d8 = &local_d0;
      local_f0 = &local_e0;
      local_e8 = 0x145f51b20;
      local_b0 = (char *)0x1;
      local_a8 = &local_f0;
      local_a0 = (double *)0x1;
      func_0x000144c48500();
      return;
    }
    dVar11 = *(double *)(in_RCX + 8);
    if (dVar11 < (double)CONCAT44(uVar16,uVar14) || dVar11 == (double)CONCAT44(uVar16,uVar14)) {
      dVar12 = (double)CONCAT44(uVar13,uVar10) + *(double *)(in_RCX + 0x30);
      dVar11 = ((double)CONCAT44(uVar16,uVar14) - dVar11) + *(double *)(in_RCX + 0x38);
      auVar1._8_4_ = SUB84(dVar11,0);
      auVar1._0_8_ = dVar12;
      auVar1._12_4_ = (int)((ulong)dVar11 >> 0x20);
      *(undefined1 (*) [16])(in_RCX + 0x30) = auVar1;
      *in_RCX = '\x02';
      *(ulong *)(in_RCX + 8) = CONCAT44(uVar16,uVar14);
      if (dVar12 < _DAT_145d9ddb0) {
        return;
      }
      ppcVar6 = &local_b0;
      pcVar4 = in_RCX;
      auVar18 = func_0x000145b73770();
      *pcVar4 = '\x02';
      *(ulong *)(pcVar4 + 8) = CONCAT44(uVar16,uVar14);
      dVar2 = _DAT_145f4eb40;
      dVar15 = dVar12 - dVar11;
      *(undefined1 (*) [12])(pcVar4 + 0x10) = auVar17;
      in_RCX[0x30] = '\0';
      in_RCX[0x31] = '\0';
      in_RCX[0x32] = '\0';
      in_RCX[0x33] = '\0';
      in_RCX[0x34] = '\0';
      in_RCX[0x35] = '\0';
      in_RCX[0x36] = '\0';
      in_RCX[0x37] = '\0';
      in_RCX[0x38] = '\0';
      in_RCX[0x39] = '\0';
      in_RCX[0x3a] = '\0';
      in_RCX[0x3b] = '\0';
      in_RCX[0x3c] = '\0';
      in_RCX[0x3d] = '\0';
      in_RCX[0x3e] = '\0';
      in_RCX[0x3f] = '\0';
      if (dVar15 <= dVar2) {
        return;
      }
      auVar9._8_4_ = auVar18._4_4_;
      auVar9._0_8_ = auVar18._0_8_;
      auVar9._12_4_ = uRam0000000145d74074;
      local_50 = (double)auVar18._8_4_ / _DAT_145d74090 +
                 (auVar9._8_8_ - dRam0000000145d74088) +
                 ((double)CONCAT44(_DAT_145d74070,auVar18._0_4_) - _DAT_145d74080);
      if (3 < *_DAT_147ff6fa8) {
        return;
      }
      local_60 = dVar12;
      local_58 = dVar11;
      if (1 < DAT_147fbe118 - 1) {
        if (DAT_147fbe118 == 0) {
          return;
        }
        cVar3 = func_0x000145d15470();
        if (cVar3 == '\0') {
          return;
        }
      }
      cVar3 = func_0x000144c46ce0();
      if (cVar3 == '\0') {
        return;
      }
      local_b8 = _DAT_147fbe108 + 0x30;
      local_b0 = pcVar4 + 0x20;
      local_f8 = dVar15 * _DAT_145d9ddc0;
      local_a8 = (undefined8 **)0x1400020c0;
      local_a0 = &local_f8;
      local_98 = 0x145badb10;
      local_90 = &local_50;
      local_88 = 0x145badb10;
      local_80 = &local_60;
      local_78 = 0x145badb10;
      local_70 = &local_58;
      local_68 = 0x145badb10;
      local_e0 = 0x145f53170;
      local_f0 = &local_e0;
      local_e8 = 0x145f51b20;
      local_d0 = (char *)0x1;
      local_c8 = &local_f0;
      local_c0 = (double *)0x1;
      local_d8 = ppcVar6;
      func_0x000144c48500();
      return;
    }
    in_RCX[0] = '\x01';
    in_RCX[1] = '\0';
    *(ulong *)(in_RCX + 8) = CONCAT44(uVar16,uVar14);
    *(undefined1 (*) [12])(in_RCX + 0x10) = auVar17;
  }
  else {
    *in_RCX = '\0';
  }
  in_RCX[0x30] = '\0';
  in_RCX[0x31] = '\0';
  in_RCX[0x32] = '\0';
  in_RCX[0x33] = '\0';
  in_RCX[0x34] = '\0';
  in_RCX[0x35] = '\0';
  in_RCX[0x36] = '\0';
  in_RCX[0x37] = '\0';
  in_RCX[0x38] = '\0';
  in_RCX[0x39] = '\0';
  in_RCX[0x3a] = '\0';
  in_RCX[0x3b] = '\0';
  in_RCX[0x3c] = '\0';
  in_RCX[0x3d] = '\0';
  in_RCX[0x3e] = '\0';
  in_RCX[0x3f] = '\0';
  return;
}
