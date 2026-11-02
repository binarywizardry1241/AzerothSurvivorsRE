
long * entry(undefined8 param_1,undefined8 param_2,long param_3,long *param_4,byte param_5)

{
  code *pcVar1;
  long lVar2;
  ulong uVar3;
  long lVar4;
  undefined4 extraout_XMM0_Da;
  undefined4 extraout_XMM0_Da_00;
  undefined4 in_XMM6_Da;
  float fVar5;
  undefined1 auVar6 [16];
  undefined4 local_f0;
  undefined4 uStack_ec;
  undefined4 uStack_e8;
  undefined4 uStack_e4;
  long local_e0;
  ulong local_d8;
  long local_d0;
  float *local_c8;
  byte *local_c0;
  undefined8 local_b8;
  undefined4 uStack_b0;
  undefined4 uStack_ac;
  long local_a8;
  float local_9c;
  undefined8 *local_98;
  undefined8 local_90;
  ulong *local_88;
  undefined8 local_80;
  undefined8 local_78;
  undefined8 uStack_70;
  long local_68;
  undefined8 local_60;
  byte local_51 [9];
  undefined4 local_48;

  local_51[1] = 0xfe;
  local_51[2] = 0xff;
  local_51[3] = 0xff;
  local_51[4] = 0xff;
  local_51[5] = 0xff;
  local_51[6] = 0xff;
  local_51[7] = 0xff;
  local_51[8] = 0xff;
  local_51[0] = *(byte *)(param_3 + 0x9a);
  local_48 = in_XMM6_Da;
  if (local_51[0] == 0) {
    local_b8._0_4_ = CONCAT31(local_b8._1_3_,1);
    local_d8 = local_d8 & 0xffffffffffffff00;
    local_98 = &local_b8;
    local_90 = 0x1403efaa0;
    local_88 = &local_d8;
    local_80 = 0x1403efaa0;
    func_0x000145da9a60(param_1,param_4,&local_98,0x14723efeb,0x147221548);
                    /* WARNING: Does not return */
    pcVar1 = (code *)invalidInstructionException();
    (*pcVar1)();
  }
  if (param_5 == 0) {
    local_51[0] = 1;
    lVar2 = *(long *)(param_3 + 0x20);
    if (lVar2 != 0) goto LAB_14599de48;
LAB_14599de72:
    local_9c = (float)local_51[0];
  }
  else {
    if (param_5 < local_51[0]) {
      local_51[0] = param_5;
    }
    lVar2 = *(long *)(param_3 + 0x20);
    if (lVar2 == 0) goto LAB_14599de72;
LAB_14599de48:
    uVar3 = (ulong)(byte)((local_51[0] - 1) + (local_51[0] == 0));
    if (*(ulong *)(param_3 + 0x28) <= uVar3) {
      func_0x000145da9883();
                    /* WARNING: Does not return */
      pcVar1 = (code *)invalidInstructionException();
      (*pcVar1)();
    }
    local_9c = *(float *)(lVar2 + uVar3 * 4);
  }
  local_d8 = *(ulong *)(param_3 + 0x60);
  local_d0 = *(long *)(param_3 + 0x68) * 0x40 + local_d8;
  local_c8 = &local_9c;
  local_c0 = local_51;
  lVar2 = *(long *)(param_3 + 0x78);
  auVar6 = func_0x00014598ddd0(param_3,param_4,lVar2,*(undefined8 *)(param_3 + 0x70));
  lVar4 = auVar6._8_8_;
  if (auVar6._0_8_ == 0) {
    lVar4 = lVar2;
  }
  if (-1 < lVar4) {
    if (lVar4 == 0) {
      lVar2 = 1;
    }
    else {
      func_0x000140002200();
      lVar2 = func_0x0001400021c0();
      if (lVar2 == 0) goto LAB_14599dece;
      func_0x000145c0a3db();
    }
    local_78 = lVar4;
    uStack_70 = lVar2;
    local_68 = lVar4;
    uVar3 = func_0x00014599c320();
    if ((uVar3 & 1) != 0) {
      func_0x0001459a2c10(extraout_XMM0_Da,extraout_XMM0_Da);
      local_60 = local_90;
      func_0x00014599b090();
      if (lVar4 != 0) {
        func_0x0001400021d0();
      }
      local_68 = local_a8;
      local_78 = CONCAT44(local_b8._4_4_,(undefined4)local_b8);
      uStack_70 = CONCAT44(uStack_ac,uStack_b0);
      if (local_98 != (undefined8 *)0x0) {
        func_0x0001400021d0();
      }
    }
    uVar3 = func_0x00014599c320();
    if ((uVar3 & 1) != 0) {
      func_0x0001459a2c10(extraout_XMM0_Da_00,extraout_XMM0_Da_00);
      local_60 = local_90;
      func_0x00014599b090();
      if (local_78 != 0) {
        func_0x0001400021d0();
      }
      local_68 = local_a8;
      local_78 = CONCAT44(local_b8._4_4_,(undefined4)local_b8);
      uStack_70 = CONCAT44(uStack_ac,uStack_b0);
      if (local_98 != (undefined8 *)0x0) {
        func_0x0001400021d0();
      }
    }
    if (*(long *)(param_3 + 0x80) != 0) {
      fVar5 = *(float *)(param_3 + 0x90);
      auVar6 = func_0x00014598ddd0();
      func_0x0001459a2c10((float)local_51[0],fVar5 * (float)local_51[0],auVar6._8_8_);
      local_60 = local_90;
      func_0x00014599b090();
      if (local_98 != (undefined8 *)0x0) {
        func_0x0001400021d0();
      }
      local_98 = &local_78;
      local_90 = 0x1400020e0;
      local_80 = 0x1400020e0;
      local_88 = &local_b8;
      func_0x000145bdd130();
      if (local_78 != 0) {
        func_0x0001400021d0();
      }
      local_68 = local_e0;
      local_78 = CONCAT44(uStack_ec,local_f0);
      uStack_70 = CONCAT44(uStack_e4,uStack_e8);
      if (CONCAT44(local_b8._4_4_,(undefined4)local_b8) != 0) {
        func_0x0001400021d0();
      }
    }
    param_4[2] = local_68;
    *param_4 = local_78;
    param_4[1] = uStack_70;
    return param_4;
  }
LAB_14599dece:
  func_0x000145da94eb();
                    /* WARNING: Does not return */
  pcVar1 = (code *)invalidInstructionException();
  (*pcVar1)();
}
