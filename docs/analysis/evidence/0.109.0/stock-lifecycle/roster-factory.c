/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long param_3,undefined8 *param_4)

{
  undefined1 uVar1;
  undefined1 uVar2;
  undefined1 uVar3;
  undefined1 uVar4;
  undefined4 uVar5;
  code *pcVar6;
  uint uVar7;
  undefined8 local_60;
  long lStack_58;
  long local_50;
  long local_48;
  ulong local_40;
  undefined8 *local_28;
  undefined8 local_20;
  undefined8 local_18;
  undefined8 uStack_10;

  local_20 = 0xfffffffffffffffe;
  local_18 = param_1;
  uStack_10 = param_2;
  if (*(char *)(param_3 + 0x1161) == '\0') {
    lStack_58 = 0;
    if (*(long *)(param_3 + 0xee0) != -1) {
      lStack_58 = param_3 + 0xee0;
    }
    local_50 = *(long *)(param_3 + 0xb28);
    local_48 = *(long *)(param_3 + 0xb30) * 0x38 + local_50;
    local_60 = 1;
    func_0x0001459c9650(param_1,param_3,&local_60);
  }
  else {
    func_0x000140002200();
    local_28 = (undefined8 *)func_0x0001400021c0();
    if (local_28 == (undefined8 *)0x0) {
      func_0x000145d992a1();
                    /* WARNING: Does not return */
      pcVar6 = (code *)invalidInstructionException();
      (*pcVar6)();
    }
    func_0x000145bcd2f0();
    uVar7 = _DAT_145deb120;
    uVar1 = *(undefined1 *)(param_3 + 0xd28);
    uVar2 = *(undefined1 *)(param_3 + 0xd29);
    uVar3 = *(undefined1 *)(param_3 + 0xd2a);
    uVar4 = *(undefined1 *)(param_3 + 0xd2f);
    uVar5 = *(undefined4 *)(param_3 + 0xd2b);
    *local_28 = local_60;
    local_28[1] = lStack_58;
    local_28[2] = local_50;
    local_28[3] = 0xfffffe;
    local_40 = (ulong)uVar7;
    local_28[4] = local_40;
    local_28[5] = 0;
    local_28[6] = CONCAT17(uVar4,CONCAT43(uVar5,CONCAT12(uVar3,CONCAT11(uVar1,uVar2))));
    *param_4 = 1;
    param_4[1] = local_28;
    param_4[2] = 1;
  }
  return;
}
