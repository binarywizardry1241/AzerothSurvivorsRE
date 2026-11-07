undefined8 *
FUN_1403db290(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 *param_4,long param_5)

{
  int *piVar1;
  int iVar2;
  undefined1 uVar3;
  undefined4 uVar4;
  ulong uVar5;
  ulong uVar6;
  undefined8 uVar7;
  undefined8 uVar8;
  undefined8 uVar9;
  code *pcVar10;
  long lVar11;
  undefined8 uVar12;
  long lVar13;
  long lVar14;
  long *plVar15;
  long lVar16;
  long lVar17;
  long lVar18;
  undefined8 uStack_250;
  long lStack_238;
  long *plStack_1b0;
  long lStack_1a8;
  long lStack_1a0;
  undefined8 uStack_198;
  long *plStack_190;
  undefined8 uStack_188;
  undefined8 uStack_180;
  ulong uStack_178;
  long lStack_170;
  undefined4 uStack_168;
  int iStack_164;
  undefined8 uStack_160;
  long lStack_158;
  long lStack_150;
  undefined4 uStack_148;
  int iStack_144;
  undefined8 uStack_140;
  long lStack_138;
  long lStack_130;
  undefined4 uStack_128;
  int iStack_124;
  undefined8 uStack_120;
  long lStack_118;
  long lStack_110;
  undefined4 uStack_108;
  int iStack_104;
  long *plStack_100;
  long lStack_f8;
  undefined4 uStack_f0;
  int iStack_ec;
  long *plStack_e8;
  long lStack_e0;
  undefined4 uStack_d8;
  undefined1 uStack_d4;
  int iStack_d0;
  long *plStack_c8;
  long lStack_c0;
  undefined4 uStack_b8;
  int iStack_b4;
  long *plStack_b0;
  long lStack_a8;
  undefined4 uStack_a0;
  int iStack_9c;
  long *plStack_98;
  long lStack_90;
  undefined4 uStack_88;
  int iStack_84;
  long *plStack_80;
  long lStack_78;
  undefined4 uStack_70;
  int iStack_6c;
  undefined8 uStack_68;
  long lStack_60;
  long lStack_58;
  undefined4 uStack_50;
  int iStack_4c;
  long *plStack_48;

  if (*param_3 == -1) {
    func_0x000145d99570(param_1,param_2,0x59,0x145dffc04,0x145dffe68);
                    /* WARNING: Does not return */
    pcVar10 = (code *)invalidInstructionException();
    (*pcVar10)();
  }
  lStack_1a8 = *(long *)(param_5 + 0x5a0);
  if (param_3[0x178] == lStack_1a8) {
    uVar5 = *(ulong *)(param_5 + 0x218);
    if ((ulong)param_3[0x170] < uVar5) {
      lVar11 = *(long *)(param_5 + 0x210);
      uVar6 = *(ulong *)(lVar11 + param_3[0x170] * 8);
      if (uVar6 != 0) {
        lVar18 = *(long *)(param_5 + 0x1e0);
        lVar14 = ~uVar6 * 0x38;
        if (((((*(char *)(lVar18 + 0x30 + lVar14) == '\x01') && ((ulong)param_3[0x172] < uVar5)) &&
             (uVar6 = *(ulong *)(lVar11 + param_3[0x172] * 8), uVar6 != 0)) &&
            ((((lVar16 = ~uVar6 * 0x38, *(char *)(lVar18 + 0x30 + lVar16) == '\x01' &&
               ((ulong)param_3[0x173] < uVar5)) &&
              ((uVar6 = *(ulong *)(lVar11 + param_3[0x173] * 8), uVar6 != 0 &&
               ((lVar17 = ~uVar6 * 0x38, *(char *)(lVar18 + 0x30 + lVar17) == '\x01' &&
                ((ulong)param_3[0x174] < uVar5)))))) &&
             (uVar6 = *(ulong *)(lVar11 + param_3[0x174] * 8), uVar6 != 0)))) &&
           (lVar13 = ~uVar6 * 0x38, *(char *)(lVar18 + 0x30 + lVar13) != '\0')) {
          lVar14 = lVar14 + lVar18;
          lVar16 = lVar16 + lVar18;
          lVar17 = lVar17 + lVar18;
          lVar13 = lVar13 + lVar18;
          LOCK();
          piVar1 = (int *)(param_5 + 0x5b0);
          iVar2 = *piVar1;
          *piVar1 = *piVar1 + 1;
          UNLOCK();
          uVar12 = *(undefined8 *)(lVar14 + 0x10);
          uVar4 = (undefined4)param_3[0x179];
          if ((((ulong)param_3[0x171] < uVar5) &&
              (uVar5 = *(ulong *)(lVar11 + param_3[0x171] * 8), uVar5 != 0)) &&
             (lVar11 = ~uVar5 * 0x38, *(char *)(lVar18 + 0x30 + lVar11) == '\x01')) {
            lVar18 = lVar18 + lVar11;
            uStack_250 = *(undefined8 *)(lVar18 + 0x10);
            lStack_238 = lVar18 + 0x28;
            lVar18 = lVar18 + 0x2c;
          }
          else {
            uStack_250 = 0;
          }
          uVar7 = *(undefined8 *)(lVar16 + 0x10);
          uVar8 = *(undefined8 *)(lVar17 + 0x10);
          lVar11 = param_5 + 0x18;
          plVar15 = param_3 + 0xde;
          uVar9 = *(undefined8 *)(lVar13 + 0x10);
          FUN_140382bb0(param_5,plVar15,param_5);
          uVar3 = *(undefined1 *)((long)param_3 + 0xbcc);
          FUN_140396cc0();
          FUN_140389400();
          FUN_14039eb40();
          FUN_140382bb0();
          uStack_68 = uStack_250;
          lStack_60 = lStack_238;
          plStack_1b0 = param_3 + 0x17a;
          uStack_198 = 0;
          lStack_1a8 = param_5;
          lStack_1a0 = lVar11;
          plStack_190 = param_3;
          uStack_180 = uVar12;
          uStack_178 = lVar14 + 0x28;
          lStack_170 = lVar14 + 0x2c;
          uStack_168 = uVar4;
          iStack_164 = iVar2;
          uStack_160 = uVar7;
          lStack_158 = lVar16 + 0x28;
          lStack_150 = lVar16 + 0x2c;
          uStack_148 = uVar4;
          iStack_144 = iVar2;
          uStack_140 = uVar8;
          lStack_138 = lVar17 + 0x28;
          lStack_130 = lVar17 + 0x2c;
          uStack_128 = uVar4;
          iStack_124 = iVar2;
          uStack_120 = uVar9;
          lStack_118 = lVar13 + 0x28;
          lStack_110 = lVar13 + 0x2c;
          uStack_108 = uVar4;
          iStack_104 = iVar2;
          plStack_100 = param_3 + 7;
          lStack_f8 = param_5;
          uStack_f0 = uVar4;
          iStack_ec = iVar2;
          plStack_e8 = param_3 + 0x2a;
          lStack_e0 = param_5;
          uStack_d8 = uVar4;
          uStack_d4 = uVar3;
          iStack_d0 = iVar2;
          plStack_c8 = plVar15;
          lStack_c0 = param_5;
          uStack_b8 = uVar4;
          iStack_b4 = iVar2;
          plStack_b0 = param_3 + 0x102;
          lStack_a8 = param_5;
          uStack_a0 = uVar4;
          iStack_9c = iVar2;
          plStack_98 = param_3 + 0x127;
          lStack_90 = param_5;
          uStack_88 = uVar4;
          iStack_84 = iVar2;
          plStack_80 = param_3 + 0x14d;
          lStack_78 = param_5;
          uStack_70 = uVar4;
          iStack_6c = iVar2;
          lStack_58 = lVar18;
          uStack_50 = uVar4;
          iStack_4c = iVar2;
          plStack_48 = param_3 + 0x175;
          func_0x00014028e670(&plStack_98,&plStack_e8,&lStack_1a8,&plStack_1b0,&uStack_180,
                              &uStack_68);
          *(int *)(param_3 + 0x179) = iVar2;
          *param_4 = 0xfffffffffffffffd;
          return param_4;
        }
      }
    }
    lStack_1a8 = -1;
    lStack_1a0 = 0x145dff0f8;
    uStack_198 = 0x17;
    plStack_190 = (long *)0xffffffffffffffff;
    uStack_188 = 1;
    uStack_180 = 0;
    uStack_178 = uStack_178 & 0xffffffffffffff00;
    uVar12 = func_0x000145bfc9e0();
    *param_4 = 0xfffffffffffffffe;
    param_4[1] = uVar12;
    param_4[2] = 0x17;
    param_4[3] = 0xffffffffffffffff;
    param_4[4] = 1;
    param_4[5] = 0;
    *(undefined1 *)(param_4 + 6) = 0;
    return param_4;
  }
  func_0x000145d4891d(param_5,param_2,param_3 + 0x178,0,&lStack_1a8,0x145dffce8);
                    /* WARNING: Does not return */
  pcVar10 = (code *)invalidInstructionException();
  (*pcVar10)();
}
