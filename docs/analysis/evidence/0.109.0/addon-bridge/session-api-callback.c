undefined1  [16]
FUN_1455f9f80(undefined8 param_1,undefined8 param_2,long param_3,char *param_4,ulong param_5)

{
  char cVar1;
  long lVar2;
  code *pcVar3;
  char cVar4;
  long *plVar5;
  ulong extraout_RDX;
  ulong uVar7;
  undefined8 extraout_RDX_00;
  undefined8 extraout_RDX_01;
  undefined8 extraout_RDX_02;
  undefined8 extraout_RDX_03;
  undefined1 uVar8;
  undefined8 uVar9;
  undefined8 uVar10;
  long unaff_R13;
  ulong uVar11;
  undefined1 uVar12;
  ulong uVar13;
  undefined7 uVar14;
  undefined1 auVar15 [16];
  undefined1 auVar16 [16];
  long **local_110;
  ulong local_108;
  undefined4 local_100;
  undefined4 uStack_fc;
  undefined4 uStack_f8;
  undefined4 uStack_f4;
  ulong local_e0;
  long *local_d8;
  undefined8 local_d0;
  long *local_c8;
  long *local_c0;
  uint local_84;
  long local_80;
  ulong local_78;
  ulong local_70;
  long local_68;
  long *local_60;
  undefined1 local_51;
  undefined8 local_50;
  long *plVar6;

  local_50 = 0xfffffffffffffffe;
  local_e0 = param_5;
  local_60 = (long *)FUN_145824ef0();
  *(int *)(local_60 + 10) = (int)local_60[10] + 1;
  uVar11 = local_60[3];
  lVar2 = local_60[9];
  local_60[3] = param_3;
  plVar5 = (long *)FUN_14581e650();
  plVar6 = local_60;
  local_100 = (undefined4)*plVar5;
  uStack_fc = *(undefined4 *)((long)plVar5 + 4);
  uStack_f8 = (undefined4)plVar5[1];
  uStack_f4 = *(undefined4 *)((long)plVar5 + 0xc);
  *plVar5 = lVar2;
  plVar5[1] = param_3;
  local_110 = &local_60;
  local_108 = uVar11;
  if (param_5 < 9) {
    local_51 = 0;
    plVar5 = (long *)FUN_14581e650();
    if (((*plVar5 != plVar6[9]) && (*(char *)((long)plVar6 + 0x54) != '\0')) &&
       ((int)plVar6[10] == 0)) {
      local_d0 = (long *)0x146bc7450;
      local_c8 = (long *)0x1400020c0;
      local_51 = 0;
      func_0x000145d99830();
      goto LAB_1455fa41a;
    }
    local_51 = 0;
    FUN_145843cc0();
    if (param_5 != extraout_RDX) {
      local_51 = 0;
      func_0x000145d99a20();
      goto LAB_1455fa41a;
    }
    uVar13 = 0;
  }
  else {
    local_51 = 0;
    plVar5 = (long *)FUN_14581e650();
    if (((*plVar5 != plVar6[9]) && (*(char *)((long)plVar6 + 0x54) != '\0')) &&
       ((int)plVar6[10] == 0)) {
      local_d0 = (long *)0x146bc7450;
      local_c8 = (long *)0x1400020c0;
      local_51 = 0;
      func_0x000145d99830();
      goto LAB_1455fa41a;
    }
    local_51 = 0;
    auVar15 = FUN_145843cc0();
    uVar7 = auVar15._8_8_;
    if (0x7ffffffffffffff8 < uVar7 * 8 || uVar7 >> 0x3d != 0) {
LAB_1455fa0b1:
      local_51 = 0;
      func_0x000145d992bb();
      goto LAB_1455fa41a;
    }
    if (uVar7 * 8 == 0) {
      unaff_R13 = 8;
      uVar14 = (undefined7)((ulong)lVar2 >> 8);
      uVar11 = 0;
    }
    else {
      func_0x000140002200();
      unaff_R13 = func_0x0001400021c0();
      if (unaff_R13 == 0) goto LAB_1455fa0b1;
      uVar14 = auVar15._1_7_;
      uVar11 = uVar7;
    }
    uVar13 = CONCAT71(uVar14,1);
    if (uVar7 != 0) {
      func_0x000145bfa0e7();
    }
  }
  cVar1 = *param_4;
  uVar12 = (undefined1)uVar13;
  if (cVar1 == '\x05') {
    local_70 = uVar11;
    local_68 = unaff_R13;
    local_51 = uVar12;
    cVar4 = FUN_1451bb330();
    auVar15._8_8_ = extraout_RDX_00;
    auVar15._0_8_ = local_c0;
    if (cVar4 != '\0') goto LAB_1455fa13c;
  }
  else {
LAB_1455fa13c:
    local_70 = uVar11;
    local_68 = unaff_R13;
    local_51 = uVar12;
    auVar15 = FUN_14534b8d0();
    plVar6 = auVar15._0_8_;
    if (plVar6 == (long *)0x0) {
      local_70 = uVar11;
      local_68 = unaff_R13;
      local_51 = uVar12;
      func_0x000145d99570();
LAB_1455fa41a:
                    /* WARNING: Does not return */
      pcVar3 = (code *)invalidInstructionException();
      (*pcVar3)();
    }
    local_84 = (uint)uVar13;
    local_80 = unaff_R13;
    local_78 = uVar11;
    if (plVar6[2] != 0) {
      local_d8 = plVar6;
      local_d0 = plVar6;
      func_0x000145d994f0();
      goto LAB_1455fa41a;
    }
    local_c8 = plVar6 + 2;
    plVar6[2] = -1;
    local_d0 = plVar6 + 3;
    lVar2 = plVar6[0x9a0];
    if (lVar2 == plVar6[0x99e]) {
      local_c0 = plVar6;
      func_0x000145bffce0();
      auVar15._8_8_ = extraout_RDX_01;
      auVar15._0_8_ = local_c0;
    }
    uVar11 = local_78;
    local_c0 = auVar15._0_8_;
    *(char *)(plVar6[0x99f] + lVar2) = cVar1;
    plVar6[0x9a0] = lVar2 + 1;
    plVar6[2] = plVar6[2] + 1;
    *plVar6 = *plVar6 + -1;
    uVar13 = (ulong)local_84;
    if (*plVar6 == 0) {
      local_68 = local_80;
      local_70 = local_78;
      local_51 = (undefined1)local_84;
      FUN_1450c79a0();
      auVar15._8_8_ = extraout_RDX_02;
      auVar15._0_8_ = local_c0;
    }
  }
  local_c0 = auVar15._0_8_;
  if (param_5 < 8000) {
    uVar12 = 0xff;
    if ((char)uVar13 != '\0') {
LAB_1455fa218:
      uVar8 = uVar12;
      if (uVar11 != 0) {
        func_0x0001400021d0();
        auVar15._8_8_ = extraout_RDX_03;
        auVar15._0_8_ = local_c0;
      }
      if (7999 < param_5) goto LAB_1455fa244;
    }
    uVar9 = 0;
    uVar10 = 0;
  }
  else {
    uVar8 = 4;
    uVar12 = 4;
    if ((char)uVar13 != '\0') goto LAB_1455fa218;
LAB_1455fa244:
    local_d0 = (long *)CONCAT35((int3)((ulong)&local_e0 >> 0x28),
                                CONCAT41((int)((ulong)&local_e0 >> 8),uVar8));
    local_c8 = (long *)0x0;
    local_c0 = (long *)param_4;
    auVar16 = FUN_145822820();
    auVar15._8_8_ = auVar16._8_8_;
    auVar15._0_8_ = local_c0;
    uVar9 = auVar16._0_8_;
    uVar10 = 1;
  }
  local_c0 = auVar15._0_8_;
  FUN_1458280b0(uVar10,uVar9,auVar15._8_8_,&local_110);
  *local_60 = *local_60 + -1;
  if (*local_60 == 0) {
    FUN_14581dd90();
  }
  auVar16._8_8_ = uVar9;
  auVar16._0_8_ = uVar10;
  return auVar16;
}
