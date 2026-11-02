
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,undefined8 param_4,
          undefined8 param_5,long param_6,long param_7,undefined8 param_8,int param_9)

{
  undefined4 *puVar1;
  float fVar2;
  undefined1 auVar3 [16];
  long lVar4;
  long lVar5;
  float fVar6;
  float fVar7;
  undefined4 in_XMM2_Dc;
  undefined4 in_XMM2_Dd;
  float fVar8;
  undefined8 in_XMM6_Qa;
  undefined1 auVar9 [16];
  undefined4 in_XMM7_Da;
  undefined4 local_f0;
  undefined4 uStack_ec;
  undefined4 uStack_e8;
  undefined4 uStack_e4;
  undefined4 local_e0;
  undefined4 uStack_dc;
  undefined4 uStack_d8;
  undefined4 uStack_d4;
  undefined8 local_d0 [2];
  long local_c0;
  undefined8 local_b8;
  undefined8 uStack_b0;
  undefined8 uStack_a8;
  int iStack_a0;
  undefined4 uStack_9c;
  undefined8 local_98;
  undefined8 local_88;
  undefined1 *local_80;
  undefined8 local_78;
  int local_70;
  undefined4 local_6c;
  undefined1 local_61;
  undefined8 local_60;
  undefined8 local_58;
  undefined4 local_48;
  
  local_60 = 0xfffffffffffffffe;
  if (*(long *)(param_7 + 0x568) != 0) {
    lVar5 = *(long *)(param_7 + 0x560);
    lVar4 = 0;
    do {
      if ((*(long *)(lVar5 + 0xf0 + lVar4) == param_6) && (*(int *)(lVar5 + 0xb0 + lVar4) != 1)) {
        fVar2 = *(float *)(lVar5 + 0x158 + lVar4);
        fVar6 = *(float *)(lVar5 + 0x15c + lVar4);
        fVar7 = (float)param_3 * fVar6;
        fVar6 = fVar6 - fVar2;
        fVar8 = fVar7;
        if (fVar6 <= fVar7) {
          fVar8 = fVar6;
        }
        auVar9._0_4_ = -(uint)NAN(fVar8) & (uint)fVar7;
        auVar9._4_4_ = (int)((ulong)param_3 >> 0x20);
        auVar9._8_4_ = in_XMM2_Dc;
        auVar9._12_4_ = in_XMM2_Dd;
        auVar9 = auVar9 | ZEXT416(~-(uint)NAN(fVar8) & (uint)fVar8);
        if (auVar9._0_4_ <= 0.0) {
          auVar3._12_4_ = 0;
          auVar3._0_12_ = auVar9._4_12_;
          auVar9 = auVar3 << 0x20;
        }
        if (auVar9._0_4_ <= 0.0) {
          return;
        }
        *(float *)(lVar5 + 0x158 + lVar4) = fVar2 + auVar9._0_4_;
        local_58 = in_XMM6_Qa;
        local_48 = in_XMM7_Da;
        func_0x000145bfa141();
        local_d0[0] = 0;
        local_c0 = 0;
        local_b8 = local_d0;
        uStack_b0 = (undefined1 *)0x0;
        uStack_a8 = 0;
        local_98 = 0x16;
        func_0x0001458d9620();
        local_70 = 0;
        local_88 = 0;
        local_80 = (undefined1 *)0x1;
        local_78 = 0;
        if (local_c0 != 0) {
          local_61 = 1;
          func_0x000145d991b0();
          *local_80 = 0;
          local_78 = 1;
          local_61 = 1;
          func_0x0001458cf2e0();
          local_61 = 1;
          func_0x0001458c0170();
          local_70 = local_70 + 1;
        }
        uStack_a8 = local_78;
        iStack_a0 = local_70;
        uStack_9c = local_6c;
        local_b8 = (undefined8 *)local_88;
        uStack_b0 = local_80;
        local_61 = 0;
        func_0x0001458bf760();
        lVar5 = *(long *)(param_7 + 0x628);
        if (lVar5 == *(long *)(param_7 + 0x618)) {
          func_0x000145bfae10();
        }
        lVar4 = *(long *)(param_7 + 0x620);
        puVar1 = (undefined4 *)(lVar4 + 0x10 + lVar5 * 0x20);
        *puVar1 = local_e0;
        puVar1[1] = uStack_dc;
        puVar1[2] = uStack_d8;
        puVar1[3] = uStack_d4;
        puVar1 = (undefined4 *)(lVar4 + lVar5 * 0x20);
        *puVar1 = local_f0;
        puVar1[1] = uStack_ec;
        puVar1[2] = uStack_e8;
        puVar1[3] = uStack_e4;
        *(long *)(param_7 + 0x628) = lVar5 + 1;
        if (param_9 != 0) {
          local_61 = 0;
          func_0x0001458c4f00();
          lVar5 = *(long *)(param_7 + 0x628);
          if (lVar5 == *(long *)(param_7 + 0x618)) {
            func_0x000145bfae10();
          }
          lVar4 = *(long *)(param_7 + 0x620);
          puVar1 = (undefined4 *)(lVar4 + 0x10 + lVar5 * 0x20);
          *puVar1 = (undefined4)uStack_a8;
          puVar1[1] = uStack_a8._4_4_;
          puVar1[2] = iStack_a0;
          puVar1[3] = uStack_9c;
          puVar1 = (undefined4 *)(lVar4 + lVar5 * 0x20);
          *puVar1 = (undefined4)local_b8;
          puVar1[1] = local_b8._4_4_;
          puVar1[2] = (undefined4)uStack_b0;
          puVar1[3] = uStack_b0._4_4_;
          *(long *)(param_7 + 0x628) = lVar5 + 1;
        }
        func_0x0001459b47a0();
        return;
      }
      lVar4 = lVar4 + 0x1d8;
    } while (*(long *)(param_7 + 0x568) * 0x1d8 - lVar4 != 0);
  }
  return;
}

