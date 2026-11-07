/* Ghidra raw-binary import; external memory/callees absent; inferred ABI.
 * Original PE instructions govern Windows-x64 arguments and globals. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 * entry(undefined8 param_1,undefined8 param_2,long param_3,undefined8 *param_4)

{
  undefined4 uVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  undefined8 uVar5;
  undefined8 uVar6;
  undefined1 (*pauVar7) [16];
  undefined1 auVar8 [16];

  pauVar7 = (undefined1 (*) [16])func_0x000145f3d2b0();
  if (pauVar7[1][0] == '\x01') {
    auVar8 = *pauVar7;
  }
  else {
    auVar8 = func_0x000145f512f0();
    *pauVar7 = auVar8;
    pauVar7[1][0] = 1;
  }
  *(long *)*pauVar7 = auVar8._0_8_ + 1;
  uVar6 = uRam00000001472c7cd8;
  uVar5 = _DAT_1472c7cd0;
  uVar4 = uRam00000001472c7ccc;
  uVar3 = uRam00000001472c7cc8;
  uVar2 = uRam00000001472c7cc4;
  uVar1 = _DAT_1472c7cc0;
  if (*(long *)(param_3 + 0x18) != *(long *)(param_3 + 8)) {
    func_0x00014611a830();
  }
  func_0x000145c5b080();
  *(undefined1 (*) [16])(param_4 + 4) = auVar8;
  param_4[2] = uVar5;
  param_4[3] = uVar6;
  *param_4 = CONCAT44(uVar2,uVar1);
  param_4[1] = CONCAT44(uVar4,uVar3);
  return param_4;
}
