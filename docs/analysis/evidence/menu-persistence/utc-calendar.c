
undefined8 entry(undefined8 param_1,undefined8 param_2,ulong param_3,undefined8 param_4)

{
  uint uVar1;
  ulong uVar2;
  long lVar3;
  long lVar4;
  long lVar5;
  ulong uVar6;
  long lVar7;
  long lVar8;
  long local_a8;
  long local_a0;
  long local_98;
  ulong local_90;
  ulong local_88;
  ulong local_80;
  long *local_78;
  undefined8 local_70;
  long *local_68;
  undefined8 local_60;
  long *local_58;
  undefined8 local_50;
  ulong *local_48;
  undefined8 local_40;
  ulong *local_38;
  undefined8 local_30;
  ulong *local_28;
  undefined8 local_20;
  
  uVar6 = param_3 % 0x15180;
  uVar2 = (param_3 / 0x15180 + 0xafa6c) / 0x23ab1;
  lVar7 = param_3 / 0x15180 + uVar2 * -0x23ab1 + 0xafa6c;
  lVar3 = SUB168(SEXT816(lVar7) * SEXT816(-0x2ce33e6c02ce33e7),8);
  lVar4 = SUB168(SEXT816(lVar7) * SEXT816(0x1a537e05fff1a537),8) - lVar7;
  lVar5 = ((lVar4 >> 0x11) - (lVar4 >> 0x3f)) +
          lVar7 / 0x8eac + ((lVar3 >> 8) - (lVar3 >> 0x3f)) + lVar7;
  lVar3 = SUB168(SEXT816(lVar5) * SEXT816(-0x2ce33e6c02ce33e7),8);
  lVar8 = ((lVar3 >> 8) - (lVar3 >> 0x3f)) + lVar7 + lVar5 / 0x8e94 + (lVar5 / 0x16d) * -0x16d;
  lVar4 = lVar8 * 5 + 2;
  lVar3 = lVar4 >> 0x3f;
  lVar7 = -lVar3;
  lVar3 = lVar4 / 0x99 + lVar3;
  lVar4 = SUB168(SEXT816((lVar3 + lVar7) * 0x99 + 2) * SEXT816(-0x6666666666666667),8);
  local_a8 = lVar8 + ((lVar4 >> 1) - (lVar4 >> 0x3f)) + 1;
  local_a0 = lVar3 + -9;
  if (lVar8 < 0x132) {
    local_a0 = lVar3 + 3;
  }
  local_a0 = local_a0 + lVar7;
  local_98 = (ulong)(local_a0 < 3) + uVar2 * 400 + lVar5 / 0x16d;
  local_90 = uVar6 / 0xe10;
  uVar1 = (uint)(uVar6 / 0x3c);
  local_88 = (ulong)(uVar1 % 0x3c);
  local_80 = (ulong)((int)uVar6 + uVar1 * -0x3c);
  local_78 = &local_98;
  local_70 = 0x145cf9dc0;
  local_68 = &local_a0;
  local_60 = 0x145cf9dc0;
  local_58 = &local_a8;
  local_50 = 0x145cf9dc0;
  local_48 = &local_90;
  local_40 = 0x145cf9cf0;
  local_38 = &local_88;
  local_30 = 0x145cf9cf0;
  local_28 = &local_80;
  local_20 = 0x145cf9cf0;
  func_0x000145ce7350(lVar7,param_4,0x146ccbe26,param_4,&local_78);
  return param_4;
}

