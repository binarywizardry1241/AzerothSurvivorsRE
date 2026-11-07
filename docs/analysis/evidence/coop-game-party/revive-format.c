
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

long * entry(undefined8 param_1,undefined8 param_2,long param_3,long *param_4)

{
  char cVar1;
  code *pcVar2;
  undefined4 *puVar3;
  ulong uVar4;
  long lVar5;
  long lVar6;
  long lVar7;
  long lVar8;
  float fVar9;
  float fVar10;
  undefined4 local_f8;
  undefined4 uStack_f4;
  undefined4 uStack_f0;
  undefined4 uStack_ec;
  long local_e8;
  undefined8 local_e0;
  undefined4 local_d8;
  undefined4 uStack_d4;
  undefined4 uStack_d0;
  undefined4 uStack_cc;
  ulong local_c8;
  float local_bc;
  float *local_b8;
  long local_b0;
  undefined4 local_a8;
  undefined4 uStack_a4;
  undefined4 uStack_a0;
  undefined4 uStack_9c;
  long local_98;
  undefined8 local_88;
  undefined8 uStack_80;
  long local_78;
  undefined8 local_70;
  undefined8 uStack_68;
  undefined4 *local_60;
  undefined8 local_58;
  undefined8 local_50;
  undefined8 local_48;

  local_48 = 0xfffffffffffffffe;
  if (*(char *)(param_3 + 0xc41) == '\0') {
    *param_4 = 0;
    param_4[1] = 1;
    param_4[2] = 0;
  }
  else {
    cVar1 = *(char *)(param_3 + 0xc46);
    if (((cVar1 == '\x04') && (*(char *)(param_3 + 0xc33) == '\0')) &&
       (*(char *)(param_3 + 0xc47) == '\x01')) {
      fVar9 = *(float *)(param_3 + 0xc28) / _DAT_145edffc0;
      fVar10 = 0.0;
      if (0.0 <= fVar9) {
        fVar10 = fVar9;
      }
      local_bc = _DAT_145edfeb0;
      if (fVar10 <= _DAT_145edfeb0) {
        local_bc = fVar10;
      }
      lVar8 = *(long *)(param_3 + 0x9c8);
      lVar6 = *(long *)(param_3 + 0x9d0);
      uStack_68 = lVar8 + lVar6 * 0x48;
      local_70 = (float *)lVar8;
      local_60 = (undefined4 *)param_3;
      func_0x0001459c2890(param_3,param_4,&local_70,&local_a8);
      if (local_98 == 0) {
        local_70 = (float *)0x0;
        uStack_68 = 1;
        local_60 = (undefined4 *)0x0;
      }
      else {
        local_70 = (float *)0x0;
        uStack_68 = 1;
        local_60 = (undefined4 *)0x0;
        if (*(long *)(CONCAT44(uStack_9c,uStack_a0) + 0x10) != 0) {
          local_50 = *(undefined8 *)(CONCAT44(uStack_9c,uStack_a0) + 8);
          func_0x000145d14a10();
        }
      }
      func_0x0001459e6cb0();
      local_c8 = (ulong)local_60;
      local_d8 = (undefined4)local_70;
      uStack_d4 = local_70._4_4_;
      uStack_d0 = (undefined4)uStack_68;
      uStack_cc = uStack_68._4_4_;
      local_70 = &local_bc;
      uStack_68 = 0x145cf8100;
      local_60 = &local_d8;
      local_58 = 0x1400020e0;
      func_0x000145ce7350();
      if (CONCAT44(uStack_d4,local_d8) != 0) {
        func_0x0001400021d0();
      }
      if (local_98 != 0) {
        lVar5 = CONCAT44(uStack_9c,uStack_a0) + 8;
        lVar7 = local_98;
        do {
          if (*(long *)(lVar5 + -8) != 0) {
            func_0x0001400021d0();
          }
          lVar5 = lVar5 + 0x18;
          lVar7 = lVar7 + -1;
        } while (lVar7 != 0);
      }
      if (CONCAT44(uStack_a4,local_a8) != 0) {
        func_0x0001400021d0();
      }
      local_88 = CONCAT44(uStack_f4,local_f8);
      uStack_80 = (undefined4 *)CONCAT44(uStack_ec,uStack_f0);
      local_78 = local_e8;
    }
    else {
      func_0x000140002200();
      uStack_80 = (undefined4 *)func_0x0001400021c0();
      if (uStack_80 == (undefined4 *)0x0) {
        func_0x000145eb6fcb();
                    /* WARNING: Does not return */
        pcVar2 = (code *)invalidInstructionException();
        (*pcVar2)();
      }
      *(undefined2 *)(uStack_80 + 1) = 0x303d;
      *uStack_80 = 0x6e776f64;
      local_88 = 6;
      local_78 = 6;
      lVar8 = *(long *)(param_3 + 0x9c8);
      lVar6 = *(long *)(param_3 + 0x9d0);
    }
    if ((lVar6 != 0) && ((byte)(cVar1 - 1U) < 2)) {
      lVar6 = lVar6 * 0x48;
      lVar5 = 0;
LAB_1458f55f0:
      if (*(long *)(lVar8 + 0x30 + lVar5) != *(long *)(param_3 + 0xb40)) goto code_r0x0001458f55f7;
      lVar7 = lVar8 + lVar5;
      if (lVar6 + -0x48 != lVar5) {
        uVar4 = ((lVar6 - lVar5) - 0x48U) / 0x48;
        lVar8 = lVar8 + lVar5;
        do {
          if ((*(long *)(lVar8 + 0x78) == *(long *)(param_3 + 0xb40)) &&
             ((int)((uint)((int)*(uint *)(lVar7 + 0x40) >> 0x1f) >> 1 ^ *(uint *)(lVar7 + 0x40)) <=
              (int)((uint)((int)*(uint *)(lVar8 + 0x88) >> 0x1f) >> 1 ^ *(uint *)(lVar8 + 0x88)))) {
            lVar7 = lVar8 + 0x48;
          }
          uVar4 = uVar4 - 1;
          lVar8 = lVar8 + 0x48;
        } while (uVar4 != 0);
      }
      func_0x000145ce7810();
      puVar3 = local_60;
      if (local_70 != (float *)0xffffffffffffffff) {
        local_b8 = local_70;
        local_f8 = *(undefined4 *)(lVar7 + 0x40);
        local_50 = uStack_68;
        local_70 = (float *)0x0;
        uStack_68 = 1;
        local_60 = (undefined4 *)0x0;
        if (puVar3 != (undefined4 *)0x0) {
          func_0x000145d14a10(puVar3);
        }
        func_0x0001459e6cb0();
        local_98 = (long)local_60;
        local_a8 = (undefined4)local_70;
        uStack_a4 = local_70._4_4_;
        uStack_a0 = (undefined4)uStack_68;
        uStack_9c = uStack_68._4_4_;
        uStack_68 = 0x1400020e0;
        local_60 = &local_f8;
        local_58 = 0x145cf8100;
        local_70 = (float *)&local_a8;
        func_0x000145ce7350();
        if (CONCAT44(uStack_a4,local_a8) != 0) {
          func_0x0001400021d0();
        }
        lVar8 = CONCAT44(uStack_d4,local_d8);
        uVar4 = local_c8;
        if ((ulong)(local_88 - local_78) < local_c8) {
          local_e0 = CONCAT44(uStack_cc,uStack_d0);
          local_b0 = lVar8;
          func_0x000145d14a10();
          lVar8 = local_b0;
LAB_1458f575b:
          lVar6 = local_78;
          func_0x000145d145fb();
        }
        else {
          lVar6 = local_78;
          if (local_c8 != 0) goto LAB_1458f575b;
        }
        local_78 = lVar6 + uVar4;
        if (lVar8 != 0) {
          func_0x0001400021d0();
        }
        if (local_b8 != (float *)0x0) {
          func_0x0001400021d0();
        }
      }
    }
LAB_1458f57a1:
    param_4[2] = local_78;
    *param_4 = local_88;
    param_4[1] = (long)uStack_80;
  }
  return param_4;
code_r0x0001458f55f7:
  lVar5 = lVar5 + 0x48;
  if (lVar6 == lVar5) goto LAB_1458f57a1;
  goto LAB_1458f55f0;
}
