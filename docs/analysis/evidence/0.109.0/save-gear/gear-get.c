undefined8 entry(undefined8 param_1,undefined8 param_2,long param_3,undefined8 param_4,char param_5)

{
  char *pcVar1;
  int iVar2;
  code *pcVar3;
  char cVar4;
  long lVar5;
  undefined8 uVar6;
  ulong uVar7;
  long lVar8;
  ulong uVar9;
  int local_1d0 [4];
  long local_1c0;
  int local_180 [4];
  undefined4 local_170;
  undefined4 local_168;
  undefined4 local_160;
  undefined4 local_158;
  undefined4 local_150;
  undefined4 local_148;
  undefined4 local_140;
  undefined4 local_138;
  undefined4 local_130;
  undefined4 local_128;
  undefined4 local_120;
  undefined4 local_118;
  undefined4 local_110;
  undefined4 local_108;
  undefined4 local_100;
  undefined4 local_f8;
  undefined4 local_f0;
  int local_e8 [19];
  char local_9c;
  undefined8 local_98;
  ulong *local_90;
  long local_88;
  ulong local_80;
  ulong local_78;
  ulong local_70;
  long local_68;
  ulong local_60;
  long local_58;
  ulong local_50;
  undefined8 local_48;

  local_48 = 0xfffffffffffffffe;
  lVar5 = 0;
  do {
    if (*(long *)(param_3 + 0x58) * 0xe8 - lVar5 == 0) {
      local_e8[0x10] = 0;
      local_e8[0x11] = 0;
      local_e8[0x12] = 0;
      local_e8[0xc] = 0;
      local_e8[0xd] = 0;
      local_e8[0xe] = 0;
      local_e8[0xf] = 0;
      local_e8[8] = 0;
      local_e8[9] = 0;
      local_e8[10] = 0;
      local_e8[0xb] = 0;
      local_e8[4] = 0;
      local_e8[5] = 0;
      local_e8[6] = 0;
      local_e8[7] = 0;
      local_e8[0] = 0;
      local_e8[1] = 0;
      local_e8[2] = 0;
      local_e8[3] = 0;
      local_180[0] = 0;
      local_180[2] = 0;
      local_170 = 0;
      local_168 = 0;
      local_160 = 0;
      local_158 = 0;
      local_150 = 0;
      local_148 = 0;
      local_140 = 0;
      local_138 = 0;
      local_130 = 0;
      local_128 = 0;
      local_120 = 0;
      local_118 = 0;
      local_110 = 0;
      local_108 = 0;
      local_100 = 0;
      local_f8 = 0;
      local_f0 = 0;
      local_9c = param_5;
      goto LAB_1458a3f70;
    }
    pcVar1 = (char *)(*(long *)(param_3 + 0x50) + 0xe4 + lVar5);
    lVar5 = lVar5 + 0xe8;
  } while (*pcVar1 != param_5);
  func_0x000145bfa0e7();
LAB_1458a3f70:
  uVar7 = *(ulong *)(param_3 + 0x40);
  if (0x7ffffffffffffffc < uVar7 * 4 || uVar7 >> 0x3e != 0) {
LAB_1458a3f9d:
    func_0x000145d992bb();
                    /* WARNING: Does not return */
    pcVar3 = (code *)invalidInstructionException();
    (*pcVar3)();
  }
  local_98 = param_4;
  if (uVar7 * 4 == 0) {
    lVar5 = 4;
    uVar9 = 0;
  }
  else {
    func_0x000140002200();
    lVar5 = func_0x0001400021c0();
    uVar9 = uVar7;
    if (lVar5 == 0) goto LAB_1458a3f9d;
  }
  local_60 = 0;
  local_70 = uVar9;
  local_68 = lVar5;
  if (uVar7 != 0) {
    func_0x000145bfa0e7();
    local_60 = uVar7;
  }
  local_1d0[0] = 0x46bf0350;
  local_1d0[1] = 1;
  local_1d0[2] = 0x46bf0850;
  local_1d0[3] = 1;
  local_1c0 = param_3;
  local_78 = uVar9;
  func_0x0001459c3150();
  if (uVar9 - uVar7 < local_80) {
    local_58 = local_88;
    local_50 = (ulong)local_90;
    func_0x000145bfa970();
    lVar5 = local_68;
    uVar7 = local_60;
    local_90 = (ulong *)local_50;
  }
  else if (local_80 == 0) goto LAB_1458a4086;
  func_0x000145bfa0e7();
LAB_1458a4086:
  lVar8 = uVar7 + local_80;
  if (local_90 != (ulong *)0x0) {
    func_0x0001400021d0();
  }
  local_50 = local_70;
  local_70 = CONCAT71(local_70._1_7_,local_9c);
  local_90 = &local_70;
  local_58 = lVar5;
  local_88 = lVar5;
  local_80 = lVar8;
  lVar5 = 0;
  uVar6 = local_98;
  do {
    if ((local_e8[lVar5] != 0) && (cVar4 = func_0x00014589bc20(), cVar4 == '\0')) {
      local_e8[lVar5] = 0;
    }
    if (local_180[lVar5 * 2] == 1) {
      iVar2 = local_180[lVar5 * 2 + 1];
      func_0x0001459a3e80();
      if (((iVar2 != 0) && (local_1d0[lVar5] != iVar2)) &&
         (cVar4 = func_0x00014589bc20(), cVar4 == '\0')) {
        local_180[lVar5 * 2] = 0;
      }
    }
    lVar5 = lVar5 + 1;
  } while (lVar5 != 0x13);
  func_0x000145bfa0e7();
  if (local_50 != 0) {
    func_0x0001400021d0();
  }
  return uVar6;
}
