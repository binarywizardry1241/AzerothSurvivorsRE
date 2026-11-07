
/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Possible PIC construction at 0x0001402de1ca: Changing call to branch */

void entry(undefined8 param_1,undefined8 param_2,undefined8 *param_3,undefined8 param_4,
          long *param_5,undefined4 *param_6)

{
  undefined4 *puVar1;
  undefined8 *puVar2;
  byte bVar3;
  int iVar4;
  ulong *puVar5;
  long lVar6;
  long lVar7;
  long lVar8;
  int *piVar9;
  int *piVar10;
  undefined1 uVar11;
  ulong uVar12;
  int *piVar13;
  undefined8 uVar14;
  int *piVar15;
  long lVar16;
  ulong uVar17;
  int *piVar18;
  undefined4 *puVar19;
  ulong uVar20;
  ulong uVar21;
  ulong uVar22;
  int *piVar23;
  long lVar24;
  undefined4 in_XMM6_Da;
  undefined4 uVar25;
  undefined4 uVar26;
  undefined4 uVar27;
  undefined4 uVar28;
  undefined4 in_XMM7_Da;
  undefined4 uVar29;
  undefined4 uVar30;
  byte local_170 [8];
  undefined8 local_168;
  undefined4 uStack_160;
  undefined4 uStack_15c;
  undefined7 uStack_158;
  undefined4 local_148;
  undefined8 local_144;
  undefined4 uStack_13c;
  undefined8 uStack_138;
  undefined8 uStack_130;
  undefined4 *local_128;
  ulong local_120;
  undefined4 local_118;
  undefined4 uStack_114;
  undefined4 uStack_110;
  undefined4 uStack_10c;
  undefined4 uStack_108;
  undefined4 uStack_104;
  undefined8 uStack_100;
  undefined8 uStack_f8;
  undefined1 local_f0;
  undefined4 local_ef;
  undefined4 uStack_eb;
  undefined4 uStack_e7;
  undefined4 uStack_e3;
  undefined7 uStack_df;
  undefined8 local_d8;
  undefined4 uStack_d0;
  undefined4 uStack_cc;
  undefined4 uStack_c8;
  byte bStack_c4;
  undefined1 uStack_c3;
  undefined2 uStack_c2;
  long local_b8;
  undefined8 local_b0;
  long local_a8;
  long local_a0;
  undefined8 local_98;
  ulong local_90;
  undefined4 local_84;
  undefined8 local_80;
  undefined8 local_78;
  undefined8 local_70;
  undefined4 local_68;
  undefined4 local_58;
  
  local_70 = 0xfffffffffffffffe;
  puVar5 = (ulong *)*param_3;
  lVar24 = param_3[1];
  lVar6 = *param_5;
  local_128 = (undefined4 *)param_5[2];
  local_84 = *(undefined4 *)((long)param_5 + 0x1c);
  uVar25 = *param_6;
  uVar26 = param_6[1];
  uVar27 = param_6[2];
  uVar28 = param_6[3];
  local_a0 = 0;
  local_98 = 1;
  local_90 = 0;
  uVar17 = *puVar5;
  uVar20 = 0;
  uVar12 = uVar17 - *(ulong *)(lVar24 + 0x18);
  if (uVar17 < *(ulong *)(lVar24 + 0x18)) {
    uVar12 = uVar20;
  }
  uVar21 = uVar17 - *(ulong *)(lVar24 + 0x38);
  if (uVar17 < *(ulong *)(lVar24 + 0x38)) {
    uVar21 = uVar20;
  }
  piVar15 = (int *)(uVar12 * 0x40 + *(long *)(lVar24 + 8));
  uVar17 = *(ulong *)(lVar24 + 0x10);
  uVar22 = uVar17 - uVar12;
  if (uVar17 < uVar12) {
    uVar22 = uVar20;
  }
  uVar29 = (undefined4)*(undefined8 *)(param_6 + 4);
  uVar30 = (undefined4)((ulong)*(undefined8 *)(param_6 + 4) >> 0x20);
  if (uVar17 < uVar12) {
    piVar15 = (int *)&DAT_00000008;
  }
  piVar13 = (int *)(uVar21 * 0x40 + *(long *)(lVar24 + 0x28));
  uVar17 = *(ulong *)(lVar24 + 0x30) - uVar21;
  if (*(ulong *)(lVar24 + 0x30) < uVar21) {
    piVar13 = (int *)&DAT_00000008;
    uVar17 = uVar20;
  }
  *puVar5 = (*(long *)(lVar24 + 0x40) - uVar17) - uVar22;
  piVar23 = piVar15 + uVar22 * 0x10;
  piVar18 = piVar13 + uVar17 * 0x10;
  local_80 = 1;
  local_68 = in_XMM6_Da;
  local_58 = in_XMM7_Da;
  if (piVar15 != (int *)0x0) goto LAB_1402ddf2a;
LAB_1402ddf2f:
  if ((piVar13 == (int *)0x0) || (piVar13 == piVar18)) {
    func_0x00014019ad00();
    if ((local_a8 != 0) &&
       (local_118 = uVar25, uStack_114 = uVar26, uStack_110 = uVar27, uStack_10c = uVar28,
       uStack_108 = uVar29, uStack_104 = uVar30, uVar14 = func_0x0001402af600(), (int)uVar14 != 0))
    {
      local_170[0] = 1;
      local_170[1] = 0;
      puVar19 = (undefined4 *)((long)&local_144 + 4);
      local_78 = local_b0;
      for (lVar24 = 0; lVar24 != 2; lVar24 = lVar24 + 1) {
        bVar3 = local_170[lVar24];
        func_0x000140198090();
        *(ulong *)(puVar19 + 4) = CONCAT44(uStack_104,uStack_108);
        uVar27 = uStack_10c;
        uVar26 = uStack_110;
        uVar25 = uStack_114;
        *puVar19 = local_118;
        puVar19[1] = uVar25;
        puVar19[2] = uVar26;
        puVar19[3] = uVar27;
        local_148 = 0;
        uVar11 = 0xff;
        if (bVar3 != 0) {
          func_0x000140198090();
          local_168 = CONCAT17((undefined1)uStack_110,CONCAT43(uStack_114,local_118._1_3_));
          uStack_160 = (undefined4)CONCAT43(uStack_10c,uStack_110._1_3_);
          uStack_15c = CONCAT13((char)uStack_108,(int3)((uint)uStack_10c >> 8));
          uStack_158 = (undefined7)(CONCAT44(uStack_104,uStack_108) >> 8);
          uVar11 = (undefined1)local_118;
        }
        uStack_110 = local_148;
        uStack_104 = uStack_13c;
        uStack_100 = uStack_138;
        uStack_f8 = uStack_130;
        uStack_10c = (undefined4)local_144;
        uStack_108 = (undefined4)((ulong)local_144 >> 0x20);
        bStack_c4 = bVar3 ^ 1;
        uStack_df = uStack_158;
        local_ef = (undefined4)local_168;
        uStack_eb = local_168._4_4_;
        uStack_e7 = uStack_160;
        uStack_e3 = uStack_15c;
        *local_128 = local_84;
        local_118 = (undefined4)*(undefined8 *)(lVar6 + 0x40);
        uStack_114 = (undefined4)((ulong)*(undefined8 *)(lVar6 + 0x40) >> 0x20);
        uStack_d0 = 0;
        uStack_cc = 0;
        uStack_c8 = 0;
        uStack_c3 = 0;
        lVar8 = *(long *)(lVar6 + 0x30);
        local_f0 = uVar11;
        local_d8 = uVar14;
        if (lVar8 == *(long *)(lVar6 + 0x20)) {
          func_0x0001460666a0();
        }
        lVar7 = *(long *)(lVar6 + 0x28);
        lVar16 = lVar8 * 0x58;
        *(ulong *)(lVar7 + 0x50 + lVar16) =
             CONCAT26(uStack_c2,CONCAT15(uStack_c3,CONCAT14(bStack_c4,uStack_c8)));
        puVar2 = (undefined8 *)(lVar7 + 0x40 + lVar16);
        *puVar2 = local_d8;
        puVar2[1] = CONCAT44(uStack_cc,uStack_d0);
        puVar2 = (undefined8 *)(lVar7 + 0x30 + lVar16);
        *puVar2 = CONCAT35((undefined3)uStack_e3,CONCAT41(uStack_e7,uStack_eb._3_1_));
        puVar2[1] = CONCAT71(uStack_df,uStack_e3._3_1_);
        puVar2 = (undefined8 *)(lVar7 + 0x20 + lVar16);
        *puVar2 = uStack_f8;
        puVar2[1] = CONCAT35((undefined3)uStack_eb,CONCAT41(local_ef,local_f0));
        puVar2 = (undefined8 *)(lVar7 + 0x10 + lVar16);
        *puVar2 = CONCAT44(uStack_104,uStack_108);
        puVar2[1] = uStack_100;
        puVar1 = (undefined4 *)(lVar7 + lVar16);
        *puVar1 = local_118;
        puVar1[1] = uStack_114;
        puVar1[2] = uStack_110;
        puVar1[3] = uStack_10c;
        *(long *)(lVar6 + 0x30) = lVar8 + 1;
        *(long *)(lVar6 + 0x40) = *(long *)(lVar6 + 0x40) + 1;
      }
    }
    if ((local_b8 == 0) && (local_a0 == 0)) {
      return;
    }
                    /* WARNING: Bad instruction - Truncating control flow here */
    halt_baddata();
  }
  *puVar5 = *puVar5 + 1;
  iVar4 = *piVar13;
  piVar10 = piVar13 + 0x10;
  piVar9 = piVar13;
  piVar15 = (int *)0x0;
  do {
    piVar13 = piVar10;
    if (iVar4 == 2) {
      local_78 = *(undefined8 *)(piVar9 + 4);
      uVar17 = *(ulong *)(piVar9 + 6);
      if (local_a0 - uVar20 < uVar17) {
        func_0x000146061b30();
        local_80 = local_98;
        uVar20 = local_90;
LAB_1402ddf7b:
        local_120 = uVar20;
        func_0x00014606171b();
        uVar20 = local_120;
      }
      else if (uVar17 != 0) goto LAB_1402ddf7b;
      uVar20 = uVar20 + uVar17;
      local_90 = uVar20;
    }
    if (piVar15 == (int *)0x0) goto LAB_1402ddf2f;
LAB_1402ddf2a:
    if (piVar15 == piVar23) goto LAB_1402ddf2f;
    *puVar5 = *puVar5 + 1;
    iVar4 = *piVar15;
    piVar10 = piVar13;
    piVar9 = piVar15;
    piVar15 = piVar15 + 0x10;
  } while( true );
}

