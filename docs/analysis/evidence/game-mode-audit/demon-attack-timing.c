/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 FUN_14594e0f0(float *param_1,ulong param_2,ulong param_3,long param_4,long param_5)

{
  int *piVar1;
  float *pfVar2;
  char cVar3;
  ulong uVar4;
  long lVar5;
  long *plVar6;
  code *pcVar7;
  long *plVar8;
  long lVar9;
  long lVar10;
  ulong uVar11;
  float fVar12;
  float fVar13;
  undefined4 uVar14;
  undefined4 in_XMM6_Da;
  float fVar15;
  undefined4 in_XMM7_Da;
  undefined8 *local_f8;
  undefined8 local_f0;
  undefined8 local_98;
  undefined8 local_90;
  float local_78;
  undefined8 local_70;
  undefined4 local_68;
  undefined4 local_58;

  local_f8 = &local_98;
  local_70 = 0xfffffffffffffffe;
  local_68 = in_XMM6_Da;
  local_58 = in_XMM7_Da;
  if (*(ulong *)(param_4 + 0xd8) <= param_3) {
    func_0x000145d697e3(param_1,param_2,*(ulong *)(param_4 + 0xd8),param_3,0x146e7a940);
                    /* WARNING: Does not return */
    pcVar7 = (code *)invalidInstructionException();
    (*pcVar7)();
  }
  lVar10 = *(long *)(*(long *)(param_4 + 0xd0) + 0x18 + param_3 * 0x78);
  cVar3 = *(char *)(lVar10 + 0x39);
  if (cVar3 == '\0') {
    local_78 = *(float *)(lVar10 + 0x30);
    uVar14 = 0;
    goto LAB_14594e425;
  }
  uVar4 = *(ulong *)(param_4 + 0x380);
  if (uVar4 == 0) {
    fVar15 = 0.0;
  }
  else {
    fVar13 = *(float *)(param_4 + 0x9ec);
    fVar12 = *(float *)(param_4 + 0x4b8) + _DAT_145d6d36c;
    lVar5 = *(long *)(param_4 + 0x378);
    if (uVar4 == 1) {
      fVar15 = 0.0;
      uVar11 = 0;
    }
    else {
      param_2 = uVar4 & 0xfffffffffffffffe;
      param_1 = (float *)(lVar5 + 0x28);
      fVar15 = 0.0;
      uVar11 = 0;
      do {
        if ((fVar13 < param_1[-6]) && (param_1[-10] == 1.4013e-44)) {
          fVar15 = fVar15 + param_1[-8] * fVar12;
        }
        if ((fVar13 < *param_1) && (param_1[-4] == 1.4013e-44)) {
          fVar15 = fVar15 + param_1[-2] * fVar12;
        }
        uVar11 = uVar11 + 2;
        param_1 = param_1 + 0xc;
      } while (param_2 != uVar11);
      if ((uVar4 & 1) == 0) goto LAB_14594e222;
    }
    if ((fVar13 < *(float *)(lVar5 + 0x10 + uVar11 * 0x18)) &&
       (piVar1 = (int *)(lVar5 + uVar11 * 0x18), *piVar1 == 10)) {
      fVar15 = fVar15 + fVar12 * (float)piVar1[2];
    }
  }
LAB_14594e222:
  if (cVar3 == '\x05') {
    fVar13 = _DAT_145d6d36c - *(float *)(param_4 + 0x480);
    if (fVar13 <= 0.0) {
      fVar13 = 0.0;
    }
    fVar15 = fVar15 + fVar13;
    if (*(long *)(param_4 + 0x568) != 0) {
      lVar5 = *(long *)(param_4 + 0x560);
      lVar9 = 0;
      do {
        if (((*(long *)(lVar5 + 0x88 + lVar9) == param_5) && (*(int *)(lVar5 + 0x68 + lVar9) == 0))
           && (fVar13 = *(float *)(lVar5 + 0xf4 + lVar9) * _DAT_145d6d748,
              pfVar2 = (float *)(lVar5 + 0xf0 + lVar9), *pfVar2 <= fVar13 && fVar13 != *pfVar2)) {
          fVar15 = fVar15 + _DAT_145d6d878;
          break;
        }
        lVar9 = lVar9 + 0x160;
      } while (*(long *)(param_4 + 0x568) * 0x160 - lVar9 != 0);
    }
  }
  else if (cVar3 == '\a') {
    local_98 = 0x146e7a958;
    local_90 = 0xb;
    lVar10 = 0;
    do {
      if (*(long *)(lVar10 + 0x146bacae0) == 0xb) {
        param_1 = (float *)(**(ulong **)(lVar10 + 0x146bacad8) ^ 0x625f776f64616873);
        param_2 = *(ulong *)((long)*(ulong **)(lVar10 + 0x146bacad8) + 3) ^ 0x746c6f625f776f64 |
                  (ulong)param_1;
        if (param_2 == 0) {
          plVar8 = (long *)(lVar10 + 0x146bacad8);
          fVar13 = _DAT_145d6d36c;
          if (*(long *)(param_4 + 800) == 0) goto LAB_14594e3a8;
          lVar10 = 0;
          goto LAB_14594e2dd;
        }
      }
      lVar10 = lVar10 + 0x78;
      if (lVar10 == 0x34f8) {
        local_f0 = 0x1400020c0;
        func_0x000145d699c0(param_1,param_2,&local_f8,0x146babcb8,0x146babcc8);
                    /* WARNING: Does not return */
        pcVar7 = (code *)invalidInstructionException();
        (*pcVar7)();
      }
    } while( true );
  }
  uVar14 = 0;
  local_78 = *(float *)(lVar10 + 0x30) / (fVar15 + _DAT_145d6d36c);
LAB_14594e425:
  return CONCAT44(uVar14,local_78);
  while (lVar10 = lVar10 + 0x68, *(long *)(param_4 + 800) * 0x68 - lVar10 != 0) {
LAB_14594e2dd:
    plVar6 = *(long **)(*(long *)(param_4 + 0x318) + lVar10);
    if ((plVar6[1] == 0xb) &&
       (*(long *)(*plVar6 + 3) == 0x746c6f625f776f64 && *(long *)*plVar6 == 0x625f776f64616873)) {
      plVar8 = plVar6;
      fVar13 = *(float *)(*(long *)(param_4 + 0x318) + 0x2c + lVar10);
      break;
    }
  }
LAB_14594e3a8:
  uVar14 = 0;
  func_0x0001458e3800(&local_f8,plVar8,param_4 + 0x1b0,&local_f8);
  func_0x0001458e3a30();
  func_0x0001458784e0();
  local_78 = fVar13 * *(float *)(plVar8 + 9) * _DAT_145d73d40 * local_98._4_4_ *
             *(float *)(param_4 + 0x480) * local_78;
  if (local_78 <= _DAT_145d73d44) {
    local_78 = _DAT_145d73d44;
  }
  local_78 = local_78 / (fVar15 + _DAT_145d6d36c);
  if (local_78 <= _DAT_145d6d754) {
    local_78 = _DAT_145d6d754;
  }
  goto LAB_14594e425;
}
