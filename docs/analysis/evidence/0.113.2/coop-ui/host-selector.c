/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 *
entry(undefined8 param_1,undefined8 param_2,char *param_3,undefined8 *param_4,long param_5)

{
  long *plVar1;
  code *pcVar2;
  long lVar3;
  undefined1 *puVar4;
  undefined7 uVar5;
  long extraout_RDX;
  long lVar6;
  long extraout_RDX_00;
  byte bVar7;
  ulong uVar8;
  bool bVar9;
  undefined1 local_158 [48];
  undefined8 local_128;
  undefined8 local_120;
  undefined8 uStack_118;
  undefined4 local_110;
  undefined4 uStack_10c;
  undefined4 uStack_108;
  undefined4 uStack_104;
  undefined8 local_100;
  undefined8 local_f8;
  undefined8 uStack_f0;
  undefined8 local_e8;
  undefined8 uStack_e0;
  undefined8 uStack_d8;
  undefined8 uStack_d0;
  undefined8 local_c8;
  undefined8 uStack_c0;
  undefined8 local_b8;
  undefined8 uStack_b0;
  undefined8 uStack_a8;
  undefined8 local_a0;
  undefined7 uStack_8c;
  undefined1 uStack_85;
  undefined4 uStack_84;
  undefined4 uStack_80;
  undefined4 uStack_7c;
  char *local_78;
  undefined8 *local_70;
  long local_68;
  long local_60;
  undefined4 uStack_54;
  undefined3 uStack_50;
  uint local_4c;
  undefined8 local_48;

  local_48 = 0xfffffffffffffffe;
  local_128 = *param_4;
  local_100 = param_4[5];
  local_120 = param_4[1];
  uStack_118 = param_4[2];
  local_110 = *(undefined4 *)(param_4 + 3);
  uStack_10c = *(undefined4 *)((long)param_4 + 0x1c);
  uStack_108 = *(undefined4 *)(param_4 + 4);
  uStack_104 = *(undefined4 *)((long)param_4 + 0x24);
  func_0x000145895670(param_3,param_4,0xb,0x145f010d3);
  func_0x000145895ad0();
  if (*param_3 == '\x01') {
    uStack_54 = *(undefined4 *)(param_3 + 1);
    uStack_50 = (undefined3)((uint)*(undefined4 *)(param_3 + 4) >> 8);
  }
  else {
    plVar1 = *(long **)(param_3 + 8);
    LOCK();
    lVar6 = *plVar1;
    *plVar1 = *plVar1 + 1;
    UNLOCK();
    if (*plVar1 == 0 || SCARRY8(lVar6,1) != *plVar1 < 0) goto LAB_14029f8fa;
  }
  uStack_8c = (undefined7)_DAT_145efdba4;
  uStack_85 = (undefined1)((ulong)_DAT_145efdba4 >> 0x38);
  uStack_84 = (undefined4)uRam0000000145efdbac;
  uStack_80 = (undefined4)((ulong)uRam0000000145efdbac >> 0x20);
  uStack_7c = 0x3f800000;
  local_f8 = _DAT_145efd9d0;
  uStack_f0 = uRam0000000145efd9d8;
  local_e8 = 0;
  uStack_e0 = _DAT_145efd9e8;
  uStack_d8 = uRam0000000145efd9f0;
  uStack_d0 = 0;
  local_c8 = _DAT_145efda00;
  uStack_c0 = uRam0000000145efda08;
  local_b8 = 0;
  uStack_b0 = _DAT_145efda18;
  uStack_a8 = uRam0000000145efda20;
  local_a0 = 0;
  puVar4 = local_158;
  func_0x0001402799f0();
  uVar5 = (undefined7)((ulong)puVar4 >> 8);
  func_0x000145ccfd60();
  if (-1 < extraout_RDX) {
    bVar7 = *(byte *)(param_5 + 0x119);
    if (bVar7 == 0) {
      local_4c = (uint)CONCAT71(uVar5,5);
    }
    else {
      local_4c = 5;
      if (bVar7 < 5) {
        local_4c = (uint)bVar7;
      }
    }
    bVar7 = 2;
    uVar8 = 0;
    lVar6 = extraout_RDX;
    local_78 = param_3;
    local_70 = param_4;
    do {
      if (lVar6 == 0) {
        lVar3 = 1;
      }
      else {
        func_0x000140002200();
        lVar3 = func_0x0001400021c0();
        if (lVar3 == 0) break;
        func_0x000145cf998b();
      }
      local_68 = lVar6;
      local_60 = lVar3;
      func_0x00014003b910();
      if (local_68 != 0) {
        func_0x0001400021d0();
      }
      if ((uVar8 & 1) != 0 || 5 < bVar7) {
        return local_70;
      }
      bVar9 = bVar7 == 5;
      uVar8 = (ulong)bVar9;
      bVar7 = bVar7 + 1;
      if (bVar9) {
        bVar7 = 5;
      }
      func_0x000145ccfd60();
      lVar6 = extraout_RDX_00;
    } while (-1 < extraout_RDX_00);
    func_0x000145e9bd8b();
                    /* WARNING: Does not return */
    pcVar2 = (code *)invalidInstructionException();
    (*pcVar2)();
  }
  func_0x000145e9bd8b();
LAB_14029f8fa:
                    /* WARNING: Does not return */
  pcVar2 = (code *)invalidInstructionException();
  (*pcVar2)();
}
