
long * entry(undefined8 param_1,undefined8 param_2,long *param_3,long *param_4)

{
  undefined4 *puVar1;
  long lVar2;
  long *plVar3;
  code *pcVar4;
  undefined4 *puVar5;
  long lVar6;
  long lVar7;
  long lVar8;
  undefined4 local_140;
  undefined4 uStack_13c;
  undefined4 uStack_138;
  undefined4 uStack_134;
  undefined4 local_130;
  undefined4 uStack_12c;
  undefined4 uStack_128;
  undefined4 uStack_124;
  undefined4 local_120;
  undefined4 uStack_11c;
  undefined4 uStack_118;
  undefined4 uStack_114;
  undefined4 local_110;
  undefined4 uStack_10c;
  undefined4 uStack_108;
  undefined4 uStack_104;
  undefined8 local_100;
  undefined8 uStack_f8;
  undefined8 local_f0;
  undefined8 uStack_e8;
  undefined8 local_e0;
  undefined8 uStack_d8;
  undefined4 local_d0;
  undefined4 uStack_cc;
  undefined4 uStack_c8;
  undefined4 uStack_c4;
  undefined4 local_c0;
  undefined4 uStack_bc;
  undefined4 uStack_b8;
  undefined4 uStack_b4;
  undefined4 local_b0;
  undefined4 uStack_ac;
  undefined4 uStack_a8;
  undefined4 uStack_a4;
  undefined4 local_a0;
  undefined4 uStack_9c;
  undefined4 uStack_98;
  undefined4 uStack_94;
  undefined8 local_90;
  undefined8 uStack_88;
  undefined8 local_80;
  undefined8 uStack_78;
  undefined8 local_70;
  undefined8 uStack_68;
  long local_60;
  undefined4 *local_58;
  long local_50;
  undefined8 local_48;

  local_48 = 0xfffffffffffffffe;
  lVar2 = param_3[1];
  if (*param_3 != lVar2) {
    plVar3 = (long *)param_3[2];
    lVar6 = *param_3;
    do {
      lVar7 = lVar6 + 0x50;
      if (*(long *)(lVar6 + 0x40) == *plVar3) {
        *param_3 = lVar7;
        func_0x000145413de0(param_1,param_4,lVar6,&local_d0);
        if (CONCAT44(uStack_cc,local_d0) != -1) {
          func_0x000140002200();
          puVar5 = (undefined4 *)func_0x0001400021c0();
          if (puVar5 == (undefined4 *)0x0) {
            func_0x0001458e721b();
                    /* WARNING: Does not return */
            pcVar4 = (code *)invalidInstructionException();
            (*pcVar4)();
          }
          *(undefined8 *)(puVar5 + 0x18) = local_70;
          *(undefined8 *)(puVar5 + 0x1a) = uStack_68;
          *(undefined8 *)(puVar5 + 0x14) = local_80;
          *(undefined8 *)(puVar5 + 0x16) = uStack_78;
          *(undefined8 *)(puVar5 + 0x10) = local_90;
          *(undefined8 *)(puVar5 + 0x12) = uStack_88;
          puVar5[0xc] = local_a0;
          puVar5[0xd] = uStack_9c;
          puVar5[0xe] = uStack_98;
          puVar5[0xf] = uStack_94;
          puVar5[8] = local_b0;
          puVar5[9] = uStack_ac;
          puVar5[10] = uStack_a8;
          puVar5[0xb] = uStack_a4;
          puVar5[4] = local_c0;
          puVar5[5] = uStack_bc;
          puVar5[6] = uStack_b8;
          puVar5[7] = uStack_b4;
          *puVar5 = local_d0;
          puVar5[1] = uStack_cc;
          puVar5[2] = uStack_c8;
          puVar5[3] = uStack_c4;
          local_60 = 4;
          local_50 = 1;
          local_58 = puVar5;
          lVar6 = local_50;
          goto joined_r0x0001455295a6;
        }
        break;
      }
      lVar6 = lVar7;
    } while (lVar7 != lVar2);
  }
  *param_4 = 0;
  param_4[1] = 8;
  param_4[2] = 0;
  return param_4;
joined_r0x0001455295a6:
  local_50 = lVar6;
  if (lVar7 == lVar2) {
LAB_145529676:
    param_4[2] = local_50;
    *param_4 = local_60;
    param_4[1] = (long)local_58;
    return param_4;
  }
  lVar8 = lVar7;
  while (lVar7 = lVar8 + 0x50, *(long *)(lVar8 + 0x40) != *plVar3) {
    lVar8 = lVar7;
    if (lVar7 == lVar2) goto LAB_145529676;
  }
  func_0x000145413de0();
  if (CONCAT44(uStack_13c,local_140) == -1) goto LAB_145529676;
  if (lVar6 == local_60) {
    func_0x000145757d40();
    puVar5 = local_58;
  }
  *(undefined8 *)(puVar5 + lVar6 * 0x1c + 0x18) = local_e0;
  *(undefined8 *)((long)(puVar5 + lVar6 * 0x1c + 0x18) + 8) = uStack_d8;
  *(undefined8 *)(puVar5 + lVar6 * 0x1c + 0x14) = local_f0;
  *(undefined8 *)((long)(puVar5 + lVar6 * 0x1c + 0x14) + 8) = uStack_e8;
  *(undefined8 *)(puVar5 + lVar6 * 0x1c + 0x10) = local_100;
  *(undefined8 *)((long)(puVar5 + lVar6 * 0x1c + 0x10) + 8) = uStack_f8;
  puVar1 = puVar5 + lVar6 * 0x1c + 0xc;
  *puVar1 = local_110;
  puVar1[1] = uStack_10c;
  puVar1[2] = uStack_108;
  puVar1[3] = uStack_104;
  puVar1 = puVar5 + lVar6 * 0x1c + 8;
  *puVar1 = local_120;
  puVar1[1] = uStack_11c;
  puVar1[2] = uStack_118;
  puVar1[3] = uStack_114;
  puVar1 = puVar5 + lVar6 * 0x1c + 4;
  *puVar1 = local_130;
  puVar1[1] = uStack_12c;
  puVar1[2] = uStack_128;
  puVar1[3] = uStack_124;
  puVar1 = puVar5 + lVar6 * 0x1c;
  *puVar1 = local_140;
  puVar1[1] = uStack_13c;
  puVar1[2] = uStack_138;
  puVar1[3] = uStack_134;
  lVar6 = lVar6 + 1;
  goto joined_r0x0001455295a6;
}
