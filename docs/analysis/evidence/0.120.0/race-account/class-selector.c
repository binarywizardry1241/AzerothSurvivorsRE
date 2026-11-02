ulong entry(undefined8 param_1,undefined8 param_2,undefined4 param_3,undefined8 param_4,
           ulong param_5)

{
  code *pcVar1;
  bool bVar2;
  undefined1 auVar3 [16];
  ulong uVar4;
  ulong uVar5;
  byte bVar6;
  ulong uVar7;
  undefined1 auVar8 [16];
  long local_40;
  byte *local_38;
  ulong local_30;
  byte *local_28;
  undefined8 local_20;
  undefined8 local_18;
  undefined8 uStack_10;

  local_20 = 0xfffffffffffffffe;
  param_5 = param_5 & 0xffffffff;
  local_18 = param_1;
  uStack_10 = param_2;
  func_0x000145a97aa0(param_5,param_2,param_4,&local_40,param_3);
  local_28 = local_38;
  if (local_30 < 0x10) {
    auVar3._8_8_ = 0;
    auVar3._0_8_ = local_38;
    auVar8._8_8_ = 0;
    auVar8._0_8_ = local_38;
    auVar8 = auVar8 << 0x40;
    if (local_30 != 0) {
      uVar5 = 0;
      do {
        if (local_38[uVar5] == (byte)param_5) goto joined_r0x000145a8c08c;
        uVar5 = uVar5 + 1;
        auVar8 = auVar3 << 0x40;
      } while (local_30 != uVar5);
    }
  }
  else {
    auVar8 = func_0x000145f7f230();
  }
  uVar5 = auVar8._8_8_;
  if (auVar8._0_8_ == 1) goto joined_r0x000145a8c08c;
  if ((byte)param_5 < 8) {
    bVar2 = true;
    uVar5 = 0x9a;
    if ((0x9aU >> ((uint)param_5 & 0x1f) & 1) == 0) goto LAB_145a8c097;
  }
  else {
LAB_145a8c097:
    bVar2 = false;
  }
  uVar4 = 0;
  do {
    while( true ) {
      uVar7 = uVar4;
      bVar6 = (byte)uVar5;
      if (local_30 == uVar7) goto LAB_145a8c074;
      bVar6 = local_28[uVar7];
      uVar5 = (ulong)bVar6;
      if ((7 < bVar6) || ((0x9aU >> (bVar6 & 0x1f) & 1) == 0)) break;
      uVar4 = uVar7 + 1;
      if (bVar2) goto LAB_145a8c074;
    }
    uVar4 = uVar7 + 1;
  } while (bVar2);
LAB_145a8c074:
  if (local_30 == 0) {
    func_0x00014614b103();
                    /* WARNING: Does not return */
    pcVar1 = (code *)invalidInstructionException();
    (*pcVar1)();
  }
  if (local_30 == uVar7) {
    bVar6 = *local_28;
  }
  param_5 = (ulong)bVar6;
joined_r0x000145a8c08c:
  if (local_40 != 0) {
    func_0x0001400021d0();
  }
  return param_5 & 0xffffffff;
}
