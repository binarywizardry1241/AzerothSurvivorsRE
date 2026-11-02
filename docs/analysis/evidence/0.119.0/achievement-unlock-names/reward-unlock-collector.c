ulong * entry(undefined8 param_1,undefined8 param_2,int *param_3,ulong *param_4)

{
  undefined8 *puVar1;
  undefined4 *puVar2;
  code *pcVar3;
  undefined4 *puVar4;
  ulong uVar5;
  ulong uVar6;
  long lVar7;
  int local_1d0;
  undefined4 uStack_1cc;
  undefined4 local_e0;
  undefined4 uStack_dc;
  undefined4 uStack_d8;
  undefined4 uStack_d4;
  undefined8 local_d0;
  undefined8 uStack_c8;
  undefined8 local_c0;
  undefined8 uStack_b8;
  undefined4 local_b0;
  undefined4 uStack_ac;
  undefined4 uStack_a8;
  undefined4 uStack_a4;
  undefined4 local_a0;
  undefined4 uStack_9c;
  undefined4 uStack_98;
  undefined4 uStack_94;
  undefined4 local_90;
  undefined4 uStack_8c;
  undefined4 uStack_88;
  undefined4 uStack_84;
  ulong local_50;

  func_0x000145c3e7f0();
  if (CONCAT44(uStack_ac,local_b0) == 0) {
    *param_4 = 0;
    param_4[1] = 8;
    param_4[2] = 0;
  }
  else {
    if (*param_3 == -1) {
      lVar7 = 0;
    }
    else {
      func_0x000145c3eda0();
      lVar7 = CONCAT44(uStack_1cc,local_1d0);
    }
    uVar5 = 0xffffffffffffffff;
    if (lVar7 + 1U != 0) {
      uVar5 = lVar7 + 1U;
    }
    uVar6 = 4;
    if (4 < uVar5) {
      uVar6 = uVar5;
    }
    if (0x2aaaaaaaaaaaaaa < uVar5) {
LAB_145c2afc7:
      func_0x00014613b1bb();
                    /* WARNING: Does not return */
      pcVar3 = (code *)invalidInstructionException();
      (*pcVar3)();
    }
    if (uVar6 * 0x30 == 0) {
      puVar4 = (undefined4 *)&DAT_00000008;
      uVar6 = 0;
    }
    else {
      func_0x000140002200();
      puVar4 = (undefined4 *)func_0x0001400021c0();
      if (puVar4 == (undefined4 *)0x0) goto LAB_145c2afc7;
    }
    puVar4[8] = local_90;
    puVar4[9] = uStack_8c;
    puVar4[10] = uStack_88;
    puVar4[0xb] = uStack_84;
    puVar4[4] = local_a0;
    puVar4[5] = uStack_9c;
    puVar4[6] = uStack_98;
    puVar4[7] = uStack_94;
    *puVar4 = local_b0;
    puVar4[1] = uStack_ac;
    puVar4[2] = uStack_a8;
    puVar4[3] = uStack_a4;
    local_50 = 1;
    func_0x000145f941db();
    lVar7 = 0x30;
    while (func_0x000145c3e7f0(), CONCAT44(uStack_dc,local_e0) != 0) {
      if (local_50 == uVar6) {
        if (local_1d0 != -1) {
          func_0x000145c3eda0();
        }
        func_0x000145f945f0();
      }
      puVar1 = (undefined8 *)((long)puVar4 + lVar7 + 0x20);
      *puVar1 = local_c0;
      puVar1[1] = uStack_b8;
      puVar1 = (undefined8 *)((long)puVar4 + lVar7 + 0x10);
      *puVar1 = local_d0;
      puVar1[1] = uStack_c8;
      puVar2 = (undefined4 *)((long)puVar4 + lVar7);
      *puVar2 = local_e0;
      puVar2[1] = uStack_dc;
      puVar2[2] = uStack_d8;
      puVar2[3] = uStack_d4;
      local_50 = local_50 + 1;
      lVar7 = lVar7 + 0x30;
    }
    param_4[2] = local_50;
    *param_4 = uVar6;
    param_4[1] = (ulong)puVar4;
  }
  return param_4;
}
