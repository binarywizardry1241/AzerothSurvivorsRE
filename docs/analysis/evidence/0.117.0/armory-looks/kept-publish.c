
undefined8 * entry(undefined8 param_1,undefined8 param_2,undefined8 *param_3,undefined8 *param_4)

{
  long *plVar1;
  long *plVar2;
  long lVar3;
  undefined8 uVar4;
  undefined8 uVar5;
  undefined8 uVar6;
  undefined8 uVar7;
  long lVar8;

  uVar7 = param_3[1];
  uVar6 = func_0x000144fd0450();
  plVar1 = (long *)param_3[2];
  plVar2 = (long *)param_3[3];
  if (plVar1 == (long *)0x0) {
    func_0x000145f93cdb();
    lVar3 = plVar2[2];
    if ((ulong)(*plVar2 - lVar3) < 0x1b0) {
      func_0x000145f940f0();
    }
    lVar8 = plVar2[1];
    *(undefined8 *)(lVar8 + lVar3) = 0x140367930;
    func_0x000145f93cdb();
    *(undefined8 *)(lVar8 + 0x1a8 + lVar3) = uVar6;
    plVar2[2] = lVar3 + 0x1b0;
  }
  else {
    func_0x000145f93cdb();
    lVar3 = plVar1[2];
    if ((ulong)(*plVar1 - lVar3) < 0x1b0) {
      func_0x000145f940f0();
    }
    lVar8 = plVar1[1];
    *(undefined8 *)(lVar8 + lVar3) = 0x140367930;
    func_0x000145f93cdb();
    *(undefined8 *)(lVar8 + 0x1a8 + lVar3) = uVar6;
    plVar1[2] = lVar3 + 0x1b0;
  }
  uVar4 = *param_3;
  uVar5 = param_3[4];
  *param_4 = uVar6;
  param_4[1] = uVar4;
  param_4[2] = uVar7;
  param_4[3] = plVar1;
  param_4[4] = plVar2;
  param_4[5] = uVar5;
  return param_4;
}
