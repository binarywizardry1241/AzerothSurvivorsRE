
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,undefined8 param_4,long param_5,
          short *param_6,undefined8 *param_7)

{
  undefined4 uVar1;
  undefined4 *puVar2;
  undefined8 *puVar3;
  ulong uVar4;
  long lVar5;
  long lVar6;
  long in_GS_OFFSET;
  float fVar7;
  undefined4 in_XMM6_Da;
  undefined4 uVar8;
  undefined4 uVar9;
  undefined4 uVar10;
  undefined4 uVar11;
  undefined8 local_38;
  undefined4 local_30;
  undefined4 local_28;
  undefined8 uStack_10;
  undefined8 uStack_8;
  
  if (param_5 == 2 && param_6 != (short *)0x0) {
    if (*param_6 == 0x6e65) {
      uVar4 = 1;
      param_6 = (short *)0x0;
    }
    else {
      uVar4 = 1;
      if (*param_6 == 0x6c70) {
        param_6 = (short *)0x1;
      }
      else if (*param_6 == 0x7363) {
        param_6 = (short *)0x2;
      }
      else if (*param_6 == 0x6564) {
        param_6 = (short *)0x3;
      }
      else if (*param_6 == 0x7470) {
        param_6 = (short *)0x4;
      }
      else if (*param_6 == 0x7365) {
        param_6 = (short *)0x5;
      }
      else if (*param_6 == 0x7266) {
        param_6 = (short *)0x6;
      }
      else if (*param_6 == 0x6f72) {
        param_6 = (short *)0x7;
      }
      else if (*param_6 == 0x7274) {
        param_6 = (short *)0x8;
      }
      else if (*param_6 == 0x7572) {
        param_6 = (short *)0x9;
      }
      else if (*param_6 == 0x6b75) {
        param_6 = (short *)0xa;
      }
      else if (*param_6 == 0x687a) {
        param_6 = (short *)0xb;
      }
      else if (*param_6 == 0x616a) {
        param_6 = (short *)0xc;
      }
      else {
        uVar4 = (ulong)(*param_6 == 0x6f6b);
        param_6 = (short *)0xd;
      }
    }
  }
  else {
    uVar4 = 0;
  }
  lVar6 = *(long *)(*(long *)(in_GS_OFFSET + 0x58) + (ulong)_DAT_1485eb3e8 * 8);
  puVar2 = (undefined4 *)*param_7;
  lVar5 = param_7[4];
  puVar3 = (undefined8 *)param_7[1];
  uVar8 = *(undefined4 *)(lVar6 + 0x360);
  uVar9 = *(undefined4 *)(lVar6 + 0x364);
  uVar10 = *(undefined4 *)(lVar6 + 0x368);
  uVar11 = *(undefined4 *)(lVar6 + 0x36c);
  *(ulong *)(lVar6 + 0x360) = uVar4;
  *(short **)(lVar6 + 0x368) = param_6;
  *(undefined4 *)(lVar5 + 0xd10) = *puVar2;
  local_30 = *(undefined4 *)(puVar3 + 1);
  local_38 = *puVar3;
  uVar1 = *(undefined4 *)param_7[2];
  fVar7 = (float)*(uint *)param_7[3] / _DAT_1461c0c48;
  *(undefined4 *)(lVar5 + 0xbd0) = 1;
  *(float *)(lVar5 + 0xbd4) = fVar7;
  local_28 = in_XMM6_Da;
  uStack_10 = param_3;
  uStack_8 = param_4;
  func_0x000145b0a060(fVar7,param_2,uVar1,lVar6,lVar5,&local_38,lVar5);
  *(undefined4 *)(lVar5 + 0xbd0) = 0;
  *(undefined4 *)(lVar6 + 0x360) = uVar8;
  *(undefined4 *)(lVar6 + 0x364) = uVar9;
  *(undefined4 *)(lVar6 + 0x368) = uVar10;
  *(undefined4 *)(lVar6 + 0x36c) = uVar11;
  return;
}

