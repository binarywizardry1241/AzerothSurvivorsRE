
ulong * entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,ulong *param_4,ulong param_5)

{
  code *pcVar1;
  ulong uVar2;
  ulong uVar3;
  long lVar4;
  ulong local_90;
  ulong local_88;
  long local_78;
  undefined8 local_70;
  ulong uStack_68;
  ulong local_60;
  ulong uStack_58;
  ulong local_50;
  undefined8 local_48;

  local_48 = 0xfffffffffffffffe;
  local_70 = param_3;
  uStack_68 = param_5;
  func_0x000145cf7c50(param_1,param_4,&local_70,&local_90);
  uVar2 = local_88;
  if (local_90 == 0) {
    local_90 = 1;
    local_88 = 0;
LAB_145ce4dcf:
    param_4[1] = local_90;
    param_4[2] = local_88;
    *param_4 = 0xffffffffffffffff;
    return param_4;
  }
  if (local_78 == 0) goto LAB_145ce4dcf;
  if (param_5 == 0) {
    uVar3 = 1;
  }
  else {
    func_0x000140002200();
    uVar3 = func_0x0001400021c0();
    if (uVar3 == 0) {
      func_0x000145eb6fcb();
                    /* WARNING: Does not return */
      pcVar1 = (code *)invalidInstructionException();
      (*pcVar1)();
    }
  }
  local_50 = 0;
  local_60 = param_5;
  uStack_58 = uVar3;
  if (param_5 < uVar2) {
    func_0x000145eb6e40();
  }
  else {
    lVar4 = 0;
    if (uVar2 == 0) goto LAB_145ce4e18;
  }
  uVar3 = uStack_58;
  param_5 = local_60;
  func_0x000145d145fb();
  lVar4 = local_50;
LAB_145ce4e18:
  local_50 = lVar4 + uVar2;
  if (param_5 - local_50 < 3) {
    func_0x000145eb6e40();
    uVar3 = uStack_58;
  }
  *(undefined1 *)(uVar3 + 2 + local_50) = 0xbd;
  *(undefined2 *)(uVar3 + local_50) = 0xbfef;
  local_50 = local_50 + 3;
  do {
    uVar3 = local_50;
    func_0x000145cf7c50();
    lVar4 = local_78;
    uVar2 = local_88;
    if (local_90 == 0) {
      param_4[2] = local_50;
      *param_4 = local_60;
      param_4[1] = uStack_58;
      return param_4;
    }
    if (local_60 - uVar3 < local_88) {
      func_0x000145eb6e40();
      uVar3 = local_50;
LAB_145ce4e92:
      func_0x000145d145fb();
    }
    else if (local_88 != 0) goto LAB_145ce4e92;
    local_50 = uVar3 + uVar2;
    if (lVar4 != 0) {
      if (local_60 - local_50 < 3) {
        func_0x000145eb6e40();
      }
      *(undefined1 *)(uStack_58 + 2 + local_50) = 0xbd;
      *(undefined2 *)(uStack_58 + local_50) = 0xbfef;
      local_50 = local_50 + 3;
    }
  } while( true );
}
