void FUN_14029c710(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 *param_4,
                  long param_5)

{
  int *piVar1;
  undefined4 uVar2;
  ulong uVar3;
  ulong uVar4;
  long lVar5;
  code *pcVar6;
  long lVar7;
  long lVar8;
  undefined8 uVar9;
  long lVar10;
  long lVar11;
  undefined1 uStack_20a;
  undefined1 uStack_209;
  long lStack_208;
  long lStack_200;
  long lStack_1f8;
  long lStack_1f0;
  undefined8 uStack_1e8;
  undefined8 uStack_1e0;
  long lStack_1d8;
  undefined8 uStack_1d0;
  long lStack_1c8;
  undefined8 uStack_1c0;
  undefined8 uStack_1b8;
  undefined8 *puStack_1b0;
  long lStack_1a8;
  long lStack_1a0;
  undefined1 *puStack_198;
  long *plStack_190;
  undefined8 uStack_180;
  long lStack_178;
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

  LOCK();
  piVar1 = (int *)(param_5 + 0x5b0);
  iStack_164 = *piVar1;
  *piVar1 = *piVar1 + 1;
  UNLOCK();
  if (*param_3 == -1) {
    func_0x000145d99570(iStack_164,param_2,0x59,0x145df2538,0x145df2598);
                    /* WARNING: Does not return */
    pcVar6 = (code *)invalidInstructionException();
    (*pcVar6)();
  }
  lStack_1a8 = *(long *)(param_5 + 0x5a0);
  if (param_3[0x178] == lStack_1a8) {
    uVar3 = *(ulong *)(param_5 + 0x218);
    if ((ulong)param_3[0x170] < uVar3) {
      lVar7 = *(long *)(param_5 + 0x210);
      uVar4 = *(ulong *)(lVar7 + param_3[0x170] * 8);
      if (uVar4 != 0) {
        lVar5 = *(long *)(param_5 + 0x1e0);
        lVar10 = ~uVar4 * 0x38;
        if (*(char *)(lVar5 + 0x30 + lVar10) != '\0') {
          if ((((ulong)param_3[0x171] < uVar3) &&
              (uVar4 = *(ulong *)(lVar7 + param_3[0x171] * 8), uVar4 != 0)) &&
             (lVar8 = ~uVar4 * 0x38, *(char *)(lVar5 + 0x30 + lVar8) == '\x01')) {
            lVar8 = lVar8 + lVar5;
            uVar9 = *(undefined8 *)(lVar8 + 0x10);
            lStack_208 = lVar8 + 0x28;
            lStack_200 = lVar8 + 0x2c;
          }
          else {
            uVar9 = 0;
          }
          if (((((ulong)param_3[0x172] < uVar3) &&
               (uVar4 = *(ulong *)(lVar7 + param_3[0x172] * 8), uVar4 != 0)) &&
              ((lVar8 = ~uVar4 * 0x38, *(char *)(lVar5 + 0x30 + lVar8) != '\0' &&
               (((ulong)param_3[0x173] < uVar3 &&
                (uVar4 = *(ulong *)(lVar7 + param_3[0x173] * 8), uVar4 != 0)))))) &&
             (lVar11 = ~uVar4 * 0x38, *(char *)(lVar5 + 0x30 + lVar11) != '\0')) {
            uStack_1b8 = uVar9;
            puStack_1b0 = param_4;
            if ((((ulong)param_3[0x174] < uVar3) &&
                (uVar3 = *(ulong *)(lVar7 + param_3[0x174] * 8), uVar3 != 0)) &&
               (lVar7 = ~uVar3 * 0x38, *(char *)(lVar5 + 0x30 + lVar7) != '\0')) {
              lVar10 = lVar10 + lVar5;
              uStack_1e0 = *(undefined8 *)(lVar10 + 0x10);
              uVar2 = (undefined4)param_3[0x179];
              lVar8 = lVar8 + lVar5;
              uStack_1d0 = *(undefined8 *)(lVar8 + 0x10);
              lVar11 = lVar11 + lVar5;
              uStack_1c0 = *(undefined8 *)(lVar11 + 0x10);
              lVar7 = lVar7 + lVar5;
              lStack_1c8 = lVar11 + 0x2c;
              lStack_1d8 = lVar8 + 0x2c;
              lStack_1f8 = lVar10 + 0x2c;
              uStack_1e8 = *(undefined8 *)(lVar7 + 0x10);
              lStack_1f0 = lVar7 + 0x28;
              FUN_140382bb0(iStack_164,param_3,param_5,param_3 + 7);
              uStack_209 = *(undefined1 *)((long)param_3 + 0xbcc);
              FUN_140396cc0();
              FUN_140389400();
              FUN_14039eb40();
              FUN_140382bb0();
              lStack_1a0 = param_5 + 0x18;
              puStack_198 = (undefined1 *)0x0;
              uStack_180 = uStack_1e0;
              lStack_170 = lStack_1f8;
              uStack_68 = uStack_1b8;
              lStack_60 = lStack_208;
              lStack_58 = lStack_200;
              uStack_160 = uStack_1d0;
              lStack_150 = lStack_1d8;
              uStack_140 = uStack_1c0;
              lStack_130 = lStack_1c8;
              uStack_120 = uStack_1e8;
              lStack_118 = lStack_1f0;
              plStack_100 = param_3 + 7;
              plStack_e8 = param_3 + 0x2a;
              uStack_d4 = uStack_209;
              plStack_c8 = param_3 + 0xde;
              plStack_b0 = param_3 + 0x102;
              plStack_98 = param_3 + 0x127;
              plStack_80 = param_3 + 0x14d;
              plStack_48 = param_3 + 0x175;
              lStack_1a8 = param_5;
              plStack_190 = param_3;
              lStack_178 = lVar10 + 0x28;
              uStack_168 = uVar2;
              lStack_158 = lVar8 + 0x28;
              uStack_148 = uVar2;
              iStack_144 = iStack_164;
              lStack_138 = lVar11 + 0x28;
              uStack_128 = uVar2;
              iStack_124 = iStack_164;
              lStack_110 = lVar7 + 0x2c;
              uStack_108 = uVar2;
              iStack_104 = iStack_164;
              lStack_f8 = param_5;
              uStack_f0 = uVar2;
              iStack_ec = iStack_164;
              lStack_e0 = param_5;
              uStack_d8 = uVar2;
              iStack_d0 = iStack_164;
              lStack_c0 = param_5;
              uStack_b8 = uVar2;
              iStack_b4 = iStack_164;
              lStack_a8 = param_5;
              uStack_a0 = uVar2;
              iStack_9c = iStack_164;
              lStack_90 = param_5;
              uStack_88 = uVar2;
              iStack_84 = iStack_164;
              lStack_78 = param_5;
              uStack_70 = uVar2;
              iStack_6c = iStack_164;
              uStack_50 = uVar2;
              iStack_4c = iStack_164;
              func_0x00014028e670();
              *(int *)(param_3 + 0x179) = iStack_164;
              *puStack_1b0 = 0xfffffffffffffffd;
              return;
            }
          }
        }
      }
    }
    lStack_1a8 = (long)param_3 + 0xbcc;
    lStack_1a0 = 0x144ffd300;
    puStack_198 = &uStack_20a;
    plStack_190 = (long *)0x144ffd300;
    func_0x000145d99830(iStack_164,lStack_1a8,&lStack_1a8,0x145df2268,0x145df2308);
                    /* WARNING: Does not return */
    pcVar6 = (code *)invalidInstructionException();
    (*pcVar6)();
  }
  func_0x000145d4891d(iStack_164,param_3 + 0x178,param_3 + 0x178,0,&lStack_1a8,0x145df25b0);
                    /* WARNING: Does not return */
  pcVar6 = (code *)invalidInstructionException();
  (*pcVar6)();
}
