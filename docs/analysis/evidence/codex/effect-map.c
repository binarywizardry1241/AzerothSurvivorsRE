void entry(undefined8 param_1,undefined8 param_2,long param_3,long param_4,undefined8 *param_5)

{
  undefined4 *puVar1;
  uint *puVar2;
  byte bVar3;
  long lVar4;
  code *pcVar5;
  char cVar6;
  uint uVar7;
  long lVar8;
  ulong uVar9;
  ulong uVar10;
  undefined4 in_XMM6_Da;
  undefined4 in_XMM7_Da;
  undefined1 auVar11 [16];
  undefined4 local_150;
  undefined4 uStack_14c;
  undefined4 uStack_148;
  undefined4 uStack_144;
  undefined8 local_140;
  undefined1 local_d8 [24];
  undefined8 local_c0;
  undefined4 local_b8;
  undefined4 local_a8;

  local_c0 = 0xfffffffffffffffe;
  if (param_4 == param_3) {
    *(undefined8 *)*param_5 = param_5[1];
  }
  else {
    uVar9 = 0;
    local_b8 = in_XMM6_Da;
    local_a8 = in_XMM7_Da;
    do {
      puVar2 = (uint *)(param_4 + uVar9 * 0x40);
      bVar3 = *(byte *)(param_4 + uVar9 * 0x40);
      cVar6 = bVar3 - 0x23;
      if (bVar3 < 0x23) {
        cVar6 = '\x02';
      }
      if (cVar6 == '\0') {
        func_0x000145898850();
      }
      else {
        if (cVar6 == '\x01') {
          uVar10 = (ulong)(byte)puVar2[9];
          func_0x0001458998b0(uVar10,uVar9,puVar2 + 2,local_d8);
                    /* WARNING: Could not recover jumptable at 0x0001459d7e9f. Too many branches */
                    /* WARNING: Treating indirect jump as call */
          (*(code *)((long)*(int *)((uVar10 & 0xffffffff) * 4 + 0x1472385e8) + 0x1472385e8))();
          return;
        }
        uVar7 = (*puVar2 & 0xff) - 3;
        if (uVar7 < 0x15) {
                    /* WARNING: Could not emulate address calculation at 0x0001459d7fbb */
                    /* WARNING: Treating indirect jump as call */
          (*(code *)((long)*(int *)((ulong)uVar7 * 4 + 0x147238594) + 0x147238594))();
          return;
        }
        auVar11 = func_0x0001458ec500();
        lVar8 = auVar11._8_8_;
        if (auVar11._0_8_ == 0) {
          lVar8 = 0xe;
        }
        if (lVar8 < 0) {
LAB_1459dab6a:
          func_0x000145d992bb();
                    /* WARNING: Does not return */
          pcVar5 = (code *)invalidInstructionException();
          (*pcVar5)();
        }
        if (lVar8 != 0) {
          func_0x000140002200();
          lVar8 = func_0x0001400021c0();
          if (lVar8 == 0) goto LAB_1459dab6a;
          func_0x000145bfa0e7();
        }
        func_0x000145898220();
        func_0x000145898470();
      }
      lVar8 = param_5[1];
      lVar4 = param_5[2];
      *(undefined8 *)(lVar4 + 0x10 + lVar8 * 0x18) = local_140;
      puVar1 = (undefined4 *)(lVar4 + lVar8 * 0x18);
      *puVar1 = local_150;
      puVar1[1] = uStack_14c;
      puVar1[2] = uStack_148;
      puVar1[3] = uStack_144;
      param_5[1] = lVar8 + 1;
      uVar9 = uVar9 + 1;
    } while (uVar9 != (ulong)(param_3 - param_4) >> 6);
    *(long *)*param_5 = lVar8 + 1;
  }
  return;
}
