void FUN_145cd5c00(longlong param_1,longlong param_2,undefined8 *param_3)

{
  undefined8 *puVar1;
  longlong *plVar2;
  longlong *plVar3;
  longlong lVar4;
  longlong lVar5;
  longlong *plVar6;
  undefined8 uStack_178;
  undefined8 uStack_170;
  undefined8 uStack_168;
  longlong *plStack_160;
  undefined *puStack_158;
  longlong *plStack_150;
  code *pcStack_148;
  longlong *plStack_140;
  undefined *puStack_138;
  undefined *puStack_130;
  code *pcStack_128;
  longlong *plStack_120;
  undefined *puStack_118;
  float *pfStack_110;
  undefined *puStack_108;
  longlong *plStack_100;
  undefined *puStack_f8;
  longlong **pplStack_f0;
  undefined *puStack_e8;
  longlong lStack_e0;
  longlong lStack_d8;
  longlong lStack_d0;
  longlong lStack_c8;
  longlong lStack_c0;
  longlong lStack_b8;
  longlong lStack_b0;
  undefined *puStack_a8;
  longlong *plStack_a0;
  longlong *plStack_98;
  undefined *puStack_90;
  undefined8 uStack_88;
  float afStack_74 [13];
  
  afStack_74[1] = -NAN;
  afStack_74[2] = -NAN;
  plStack_a0 = (longlong *)*param_3;
  lStack_b0 = param_3[1];
  if (param_1 != param_2) {
    lStack_c8 = param_3[2];
    lStack_c0 = ((ulonglong)(param_2 - param_1) >> 3) * -0x5555555555555555;
    lStack_d0 = 0;
    lStack_b8 = param_1;
    do {
      lStack_d8 = lStack_b8 + lStack_d0 * 0x18 + 8;
      lStack_e0 = lStack_b8 + 0x10 + lStack_d0 * 0x18;
      plVar2 = *(longlong **)(lStack_b8 + lStack_d0 * 0x18);
      plVar3 = (longlong *)*plVar2;
      afStack_74[0] =
           *(float *)(plVar3 + 0xb) * 1.4 * *(float *)(plVar2 + 4) * *(float *)(plVar2 + 9);
      if (((plVar3[1] == 0xd) &&
          (*(longlong *)(*plVar3 + 5) == 0x646c656968735f65 &&
           *(longlong *)*plVar3 == 0x735f656e69766964)) && (6.0 <= afStack_74[0])) {
        afStack_74[0] = 6.0;
      }
      puStack_90 = &DAT_1400020c0;
      plStack_98 = plVar3;
      FUN_145fe4b70(&plStack_160,&DAT_146fdaab5,&plStack_98);
      lVar4 = plVar3[2];
      plVar2 = (longlong *)plVar3[3];
      puStack_a8 = puStack_158;
      plVar6 = plStack_150;
      lVar5 = FUN_145af9cd0();
      if (plStack_160 != (longlong *)0x0) {
        func_0x0001400021d0(puStack_a8,plStack_160,1);
      }
      if (lVar5 == 0) {
        plVar6 = plVar2;
        lVar5 = lVar4;
      }
      plStack_160 = (longlong *)0x0;
      puStack_158 = (undefined *)0x1;
      plStack_150 = (longlong *)0x0;
      if (plVar6 != (longlong *)0x0) {
        FUN_1460157c0(&plStack_160,0,
                      (((ulonglong)plVar6 >> 2) + 1) - (ulonglong)(((ulonglong)plVar6 & 3) == 0),1,1
                     );
      }
      FUN_145cd6850(lVar5,(longlong)plVar6 + lVar5,&plStack_160);
      puStack_90 = puStack_158;
      uStack_88 = plStack_150;
      plStack_150 = plVar3 + 8;
      puStack_158 = &DAT_1400020c0;
      plStack_100 = plVar3 + 4;
      pcStack_148 = FUN_145ff6620;
      plStack_140 = &lStack_d8;
      puStack_138 = &DAT_14168a0c0;
      puStack_130 = &DAT_1476cb4d0;
      pcStack_128 = FUN_145ff7510;
      plStack_120 = &lStack_e0;
      puStack_118 = &DAT_1411afb20;
      pfStack_110 = afStack_74;
      puStack_108 = &DAT_145ff5920;
      plStack_98 = plStack_160;
      puStack_f8 = &DAT_1400020c0;
      pplStack_f0 = &plStack_98;
      puStack_e8 = &DAT_1400020e0;
      plStack_160 = plVar3;
      FUN_145fe4b70(&uStack_178,&DAT_1476cb4d8,&plStack_160);
      if (plStack_98 != (longlong *)0x0) {
        func_0x0001400021d0(puStack_90,plStack_98,1);
      }
      *(undefined8 *)(lStack_c8 + 0x10 + lStack_b0 * 0x18) = uStack_168;
      puVar1 = (undefined8 *)(lStack_c8 + lStack_b0 * 0x18);
      *puVar1 = uStack_178;
      puVar1[1] = uStack_170;
      lStack_b0 = lStack_b0 + 1;
      lStack_d0 = lStack_d0 + 1;
    } while (lStack_d0 != lStack_c0);
  }
  *plStack_a0 = lStack_b0;
  return;
}
