
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,uint param_3,long param_4,undefined8 param_5,
          undefined8 *param_6)

{
  undefined1 auVar1 [16];
  long lVar2;
  ulong uVar3;
  float fVar4;
  undefined4 extraout_XMM0_Dc;
  float fVar5;
  float fVar6;
  float fVar7;
  undefined1 auVar8 [16];
  
  lVar2 = func_0x000145aaef50(param_4,param_2,*(undefined8 *)(param_4 + 0x2d8),
                              *(undefined8 *)(param_4 + 0x2d0));
  lVar2 = lVar2 * 0xf0;
  fVar6 = (float)*(undefined8 *)(lVar2 + 0x146fd9038);
  fVar7 = (float)((ulong)*(undefined8 *)(lVar2 + 0x146fd9038) >> 0x20);
  auVar8._0_4_ = (float)*param_6 - fVar6;
  auVar8._4_4_ = (float)((ulong)*param_6 >> 0x20) - fVar7;
  auVar8._8_8_ = 0;
  fVar4 = (float)func_0x000146005081(auVar8._0_4_,auVar8._4_4_);
  fVar5 = *(float *)(lVar2 + 0x146fd9048) + _DAT_146218684;
  if (fVar5 <= _DAT_1461b2200) {
    fVar5 = _DAT_1461b2200;
  }
  if (fVar5 < fVar4) {
    auVar1._4_4_ = fVar4;
    auVar1._0_4_ = fVar4;
    auVar1._8_4_ = extraout_XMM0_Dc;
    auVar1._12_4_ = extraout_XMM0_Dc;
    auVar8 = divps(auVar8,auVar1);
    fVar4 = fVar5 * auVar8._0_4_;
    lVar2 = *(long *)(param_4 + 0xbf0);
    uVar3 = func_0x000145bee7c0(fVar4,fVar6 + fVar4,fVar7 + fVar5 * auVar8._4_4_);
    if (((uVar3 & 1) == 0) && (*(long *)(lVar2 + 0x68) != -1)) {
      func_0x000145bf1d00();
    }
  }
                    /* WARNING: Could not recover jumptable at 0x000145b58ddc. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)((long)*(int *)((ulong)param_3 * 4 + 0x14732e63c) + 0x14732e63c))();
  return;
}

