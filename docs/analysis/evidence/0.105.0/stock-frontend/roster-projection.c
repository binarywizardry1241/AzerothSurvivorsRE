void entry(ulong param_1,undefined8 param_2,undefined8 *param_3,long *param_4)

{
  undefined1 uVar1;
  undefined1 uVar2;
  uint uVar3;
  long lVar4;
  undefined8 uVar5;
  undefined1 uVar6;
  uint uVar7;
  undefined4 *puVar8;
  ulong unaff_R14;
  undefined4 in_XMM6_Da;
  undefined4 uVar9;
  undefined4 uVar10;
  undefined4 uVar11;
  undefined4 uVar12;
  undefined8 in_XMM7_Qa;
  undefined1 auVar13 [16];
  undefined1 local_2ac [308];
  undefined8 local_178;
  undefined4 local_170;
  undefined4 uStack_16c;
  undefined4 uStack_168;
  undefined4 uStack_164;
  undefined8 local_c8;
  undefined8 local_c0;
  undefined4 local_b8;
  undefined1 local_b4;
  undefined1 local_b3;
  undefined1 local_b2;
  undefined4 local_b1;
  undefined1 local_ad;
  undefined1 local_ac;
  long local_a8;
  undefined8 *local_a0;
  long local_98;
  long local_90;
  long local_88;
  long *local_80;
  long local_78;
  undefined8 local_70;
  undefined4 local_68;
  undefined8 local_58;

  local_70 = 0xfffffffffffffffe;
  lVar4 = *param_4;
  local_80 = (long *)*param_3;
  local_78 = param_3[1];
  if (lVar4 != param_4[1]) {
    local_a8 = param_4[2];
    local_a0 = (undefined8 *)(local_a8 + 200);
    local_98 = param_4[3] + 0xad0;
    local_90 = -((ulong)(param_4[1] - lVar4) / 0x38);
    puVar8 = (undefined4 *)(lVar4 + 0x33);
    local_88 = 0;
    local_68 = in_XMM6_Da;
    local_58 = in_XMM7_Qa;
    do {
      uVar5 = *(undefined8 *)((long)puVar8 + -0x2b);
      uVar9 = *(undefined4 *)((long)puVar8 + -0x23);
      uVar10 = *(undefined4 *)((long)puVar8 + -0x1f);
      uVar11 = *(undefined4 *)((long)puVar8 + -0x1b);
      uVar12 = *(undefined4 *)((long)puVar8 + -0x17);
      uVar1 = *(undefined1 *)((long)puVar8 + -3);
      unaff_R14 = CONCAT71((int7)(unaff_R14 >> 8),uVar1);
      param_1 = CONCAT71((int7)(param_1 >> 8),*(undefined1 *)((long)puVar8 + -2));
      uVar2 = *(undefined1 *)((long)puVar8 + -1);
      local_ad = *(undefined1 *)(puVar8 + 1);
      local_b1 = *puVar8;
      uVar3 = *(uint *)((long)puVar8 + -0x13);
      uVar7 = 0x3c;
      if (uVar3 < 0x3c) {
        uVar7 = uVar3;
      }
      uVar6 = (char)uVar7;
      if (uVar3 == 0) {
        uVar6 = 1;
      }
      auVar13._8_8_ = 0;
      auVar13._0_8_ = *(ulong *)(local_a8 + 0xc0);
      local_b8 = *(undefined4 *)(local_a0 + 1);
      local_c0 = *local_a0;
      func_0x00014588c920(param_1,puVar8,local_98,local_2ac,param_1 & 0xffffffff,
                          unaff_R14 & 0xffffffff);
      func_0x0001458bd260();
      func_0x000140070120();
      local_b3 = (undefined1)param_1;
      local_c8 = CONCAT44(auVar13._0_4_,auVar13._4_4_);
      local_178 = uVar5;
      local_170 = uVar9;
      uStack_16c = uVar10;
      uStack_168 = uVar11;
      uStack_164 = uVar12;
      local_b4 = uVar1;
      local_b2 = uVar2;
      local_ac = uVar6;
      func_0x000145bc977b();
      local_88 = local_88 + -1;
      puVar8 = puVar8 + 0xe;
    } while (local_90 != local_88);
    local_78 = local_78 - local_88;
  }
  *local_80 = local_78;
  return;
}
