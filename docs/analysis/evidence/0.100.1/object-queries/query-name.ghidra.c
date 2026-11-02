long entry(void)

{
  long lVar1;
  int in_ECX;
  long lVar2;
  uint uVar3;
  undefined8 *local_70;
  undefined8 local_68;
  long local_60;
  undefined8 local_58;
  undefined8 local_48;
  undefined8 local_40;
  undefined8 local_38;
  undefined8 local_30;

  local_30 = 0xfffffffffffffffe;
  uVar3 = in_ECX - 0x2329;
  if (uVar3 < 3) {
    local_40 = 0x14672ba10;
    local_38 = 2;
  }
  else {
    if (in_ECX - 0x232cU < 10) {
                    /* WARNING: Could not emulate address calculation at 0x00014542091f */
                    /* WARNING: Treating indirect jump as call */
      lVar2 = (*(code *)((long)*(int *)((ulong)(in_ECX - 0x232cU) * 4 + 0x14673a258) + 0x14673a258))
                        ();
      return lVar2;
    }
    if (in_ECX - 0x2331U < 3) {
      local_40 = 0x14672ba3d;
    }
    else {
      local_40 = 0x14672ba50;
    }
    local_38 = 6;
  }
  local_70 = &local_40;
  local_68 = 0x1400020c0;
  func_0x000145728390(uVar3,in_ECX,0x14672ba56,&local_60,&local_70);
  if (uVar3 < 3) {
    lVar2 = 0x146735dea;
  }
  else {
    uVar3 = in_ECX - 0x232c;
    if ((uVar3 < 10 & (byte)(799 >> ((byte)uVar3 & 0x1f))) == 0) {
      lVar2 = 0x146735dde;
      if (in_ECX - 0x2331U < 3) {
        lVar2 = 0x146735de4;
      }
    }
    else {
      lVar2 = *(long *)((ulong)uVar3 * 8 + 0x14673a1b8);
    }
  }
  local_48 = local_58;
  lVar1 = func_0x000145457cb0();
  if (local_60 != 0) {
    func_0x0001400021d0();
  }
  if (lVar1 == 0) {
    lVar1 = lVar2;
  }
  return lVar1;
}
