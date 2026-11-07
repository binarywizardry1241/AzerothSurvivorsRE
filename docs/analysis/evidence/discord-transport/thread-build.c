/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

long * entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,long *param_4,ulong param_5)

{
  code *pcVar1;
  ulong uVar2;
  char cVar3;
  long lVar4;
  ulong uVar5;
  long *plVar6;
  undefined4 *puVar7;
  uint uVar8;
  ulong uVar9;
  ulong uVar10;
  undefined1 auVar11 [16];
  char in_stack_00000028;
  long in_stack_00000030;
  long *in_stack_00000038;
  undefined4 *in_stack_00000040;
  undefined8 local_108;
  undefined8 uStack_100;
  undefined8 local_f8;
  undefined8 uStack_f0;
  int local_e8;
  undefined4 uStack_e4;
  undefined8 uStack_e0;
  undefined4 local_d8;
  undefined4 uStack_d4;
  undefined8 local_a8;
  undefined8 uStack_a0;
  long local_98;
  long lStack_90;
  undefined4 local_88;
  undefined4 uStack_84;
  undefined4 uStack_80;
  undefined4 uStack_7c;
  long *local_78;
  undefined8 local_68;
  long *local_60;
  long *local_58;
  long *local_50;
  undefined1 local_46;
  undefined1 local_45;
  undefined1 local_44;
  undefined1 local_43;
  undefined1 local_42;
  undefined1 local_41;
  undefined8 local_40;

  plVar6 = _DAT_14808a9e0;
  local_40 = 0xfffffffffffffffe;
  local_68 = param_3;
  if (((param_5 & 1) != 0) || (*_DAT_14808a9e0 != 0)) goto LAB_140046a29;
  local_41 = 1;
  local_42 = 1;
  local_43 = 1;
  func_0x000145bb9990(0,param_4,0x145da91c8,&local_a8,0xe);
  if (local_a8 == (long *)0xffffffffffffffff) {
    uVar9 = 0x200000;
  }
  else {
    local_58 = local_a8;
    func_0x000145bd5650();
    if ((local_e8 == 1) || (uVar2 = CONCAT44(uStack_d4,local_d8), uVar2 == 0)) {
LAB_1400469e7:
      uVar9 = 0x200000;
    }
    else {
      if (uVar2 == 1) {
        cVar3 = *uStack_e0;
        if ((cVar3 == '+') || (cVar3 == '-')) goto LAB_1400469e7;
      }
      else {
        cVar3 = *uStack_e0;
      }
      uVar10 = (ulong)(cVar3 == '+');
      if (0x10 < uVar2 - uVar10) {
        uVar9 = 0;
        lVar4 = 0;
        while( true ) {
          if (lVar4 == uVar2 + -uVar10) goto joined_r0x000140046a00;
          auVar11._8_8_ = 0;
          auVar11._0_8_ = uVar9;
          uVar5 = SUB168(auVar11 * ZEXT816(10),0);
          if (SUB168(auVar11 * ZEXT816(10),8) != 0) break;
          uVar8 = (byte)uStack_e0[lVar4 + uVar10] - 0x30;
          uVar9 = uVar5 + uVar8;
          if ((9 < uVar8) || (lVar4 = lVar4 + 1, CARRY8(uVar5,(ulong)uVar8))) break;
        }
        goto LAB_1400469e7;
      }
      if (uVar2 == uVar10) {
        uVar9 = 0;
      }
      else {
        uVar9 = 0;
        lVar4 = 0;
        do {
          if (9 < (byte)uStack_e0[lVar4 + uVar10] - 0x30) {
            uVar9 = 0x200000;
            break;
          }
          uVar9 = (ulong)((byte)uStack_e0[lVar4 + uVar10] - 0x30) + uVar9 * 10;
          lVar4 = lVar4 + 1;
        } while (lVar4 != uVar2 + -uVar10);
      }
    }
joined_r0x000140046a00:
    if (local_58 != (long *)0x0) {
      func_0x0001400021d0();
    }
  }
  *plVar6 = uVar9 + 1;
LAB_140046a29:
  local_41 = 1;
  local_42 = 1;
  local_43 = 1;
  func_0x000145ba4a80();
  local_41 = 1;
  local_42 = 1;
  local_43 = 0;
  local_50 = (long *)func_0x000145baed70();
  if (in_stack_00000028 == '\0') {
    local_45 = 1;
    local_46 = 1;
    func_0x000145bb7890();
  }
  else {
    local_108 = 0;
    uStack_100 = 8;
    local_f8 = 0;
    uStack_f0 = 0;
  }
  local_a8 = (long *)0x1;
  uStack_a0 = (undefined4 *)0x1;
  local_98 = in_stack_00000030;
  lStack_90 = 0;
  func_0x000140002200();
  plVar6 = (long *)func_0x0001400021c0();
  local_58 = plVar6;
  if (plVar6 == (long *)0x0) {
    func_0x000145d992a1();
  }
  else {
    *(undefined4 *)(plVar6 + 4) = local_88;
    *(undefined4 *)((long)plVar6 + 0x24) = uStack_84;
    *(undefined4 *)(plVar6 + 5) = uStack_80;
    *(undefined4 *)((long)plVar6 + 0x2c) = uStack_7c;
    plVar6[2] = local_98;
    plVar6[3] = lStack_90;
    *plVar6 = (long)local_a8;
    plVar6[1] = (long)uStack_a0;
    LOCK();
    lVar4 = *plVar6;
    *plVar6 = *plVar6 + 1;
    UNLOCK();
    local_60 = plVar6;
    if (*plVar6 != 0 && SCARRY8(lVar4,1) == *plVar6 < 0) {
      if (plVar6[2] != 0) {
        local_44 = 1;
        func_0x000145ba4b00();
      }
      local_88 = (undefined4)local_f8;
      uStack_84 = local_f8._4_4_;
      uStack_80 = (undefined4)uStack_f0;
      uStack_7c = uStack_f0._4_4_;
      local_98 = local_108;
      lStack_90 = uStack_100;
      local_a8 = in_stack_00000038;
      uStack_a0 = in_stack_00000040;
      local_78 = plVar6;
      func_0x000140002200();
      puVar7 = (undefined4 *)func_0x0001400021c0();
      if (puVar7 == (undefined4 *)0x0) {
        func_0x000145d992a1();
      }
      else {
        *(long **)(puVar7 + 0xc) = plVar6;
        local_e8 = (int)in_stack_00000038;
        uStack_e4 = (undefined4)((ulong)in_stack_00000038 >> 0x20);
        uStack_e0._0_4_ = SUB84(in_stack_00000040,0);
        uStack_e0._4_4_ = (undefined4)((ulong)in_stack_00000040 >> 0x20);
        puVar7[8] = (undefined4)local_f8;
        puVar7[9] = local_f8._4_4_;
        puVar7[10] = (undefined4)uStack_f0;
        puVar7[0xb] = uStack_f0._4_4_;
        puVar7[4] = (undefined4)local_108;
        puVar7[5] = local_108._4_4_;
        puVar7[6] = (undefined4)uStack_100;
        puVar7[7] = uStack_100._4_4_;
        *puVar7 = local_e8;
        puVar7[1] = uStack_e4;
        puVar7[2] = (undefined4)uStack_e0;
        puVar7[3] = uStack_e0._4_4_;
        LOCK();
        lVar4 = *local_50;
        *local_50 = *local_50 + 1;
        UNLOCK();
        if (*local_50 != 0 && SCARRY8(lVar4,1) == *local_50 < 0) {
          local_a8 = local_50;
          local_98 = 0x145da90d0;
          uStack_a0 = puVar7;
          func_0x000140002200();
          puVar7 = (undefined4 *)func_0x0001400021c0();
          if (puVar7 != (undefined4 *)0x0) {
            *(long *)(puVar7 + 4) = local_98;
            *puVar7 = (undefined4)local_a8;
            puVar7[1] = local_a8._4_4_;
            puVar7[2] = (undefined4)uStack_a0;
            puVar7[3] = uStack_a0._4_4_;
            local_44 = 0;
            auVar11 = func_0x000145ba4b90();
            if (auVar11._0_8_ == 1) {
              param_4[1] = auVar11._8_8_;
              *param_4 = 0;
              LOCK();
              *local_60 = *local_60 + -1;
              UNLOCK();
              if (*local_60 == 0) {
                func_0x000145bb2690();
              }
              LOCK();
              *local_50 = *local_50 + -1;
              UNLOCK();
              if (*local_50 == 0) {
                local_41 = 0;
                local_42 = 0;
                local_43 = 0;
                func_0x000145bb27d0();
              }
            }
            else {
              *param_4 = (long)local_50;
              param_4[1] = (long)local_60;
              param_4[2] = auVar11._8_8_;
            }
            return param_4;
          }
          func_0x000145d992a1();
        }
      }
    }
  }
                    /* WARNING: Does not return */
  pcVar1 = (code *)invalidInstructionException();
  (*pcVar1)();
}
