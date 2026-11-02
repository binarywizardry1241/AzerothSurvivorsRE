
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 *
entry(undefined8 param_1,undefined8 param_2,long param_3,undefined8 *param_4,char param_5,
     undefined8 param_6)

{
  code *pcVar1;
  double dVar2;
  ulong uVar3;
  int iVar4;
  long lVar5;
  uint uVar6;
  long lVar7;
  ulong uVar8;
  double dVar9;
  undefined4 in_XMM6_Da;
  float fVar10;
  undefined8 in_XMM7_Qa;
  undefined8 in_stack_00000028;
  double in_stack_00000030;
  double local_f0;
  undefined4 *local_e8;
  undefined8 local_e0;
  double *local_d8;
  long local_d0;
  undefined1 local_c1;
  undefined8 local_c0;
  undefined4 local_b8;
  undefined8 local_a8;

  local_c0 = 0xfffffffffffffffe;
  local_b8 = in_XMM6_Da;
  local_a8 = in_XMM7_Qa;
  lVar5 = func_0x000145b05300(param_1,param_4,in_stack_00000028,param_6);
  if (*(char *)(param_3 + 0xcb) == param_5) {
    lVar7 = lVar5 * 0xf0 + 0x14703a5b0;
    lVar5 = func_0x000145b05300();
    if (((*(long *)(lVar5 * 0xf0 + 0x14703a5c0) == *(long *)(lVar7 + 0x10)) &&
        (iVar4 = func_0x000146061721(), iVar4 == 0)) &&
       (fVar10 = *(float *)(param_3 + 0x98), (uint)ABS(fVar10) < 0x7f800000)) {
      in_stack_00000030 = in_stack_00000030 + _DAT_146fda530;
      dVar9 = 0.0;
      local_d0 = param_3;
      if (in_stack_00000030 < 0.0) {
        local_d8 = (double *)0x0;
        local_c1 = 0;
        local_f0 = in_stack_00000030;
        func_0x000146208ee0();
      }
      else {
        lVar5 = *(long *)(lVar7 + 0x88);
        func_0x000140002200();
        local_e8 = (undefined4 *)func_0x0001400021c0();
        if (local_e8 != (undefined4 *)0x0) {
          if (dVar9 <= (double)fVar10) {
            dVar9 = (double)fVar10;
          }
          if (dVar9 <= in_stack_00000030) {
            in_stack_00000030 = dVar9;
          }
          dVar9 = _DAT_147050bb0 * in_stack_00000030 + _DAT_14620d1a0;
          if (_DAT_146248a98 <= dVar9) {
            dVar9 = _DAT_146248a98;
          }
          dVar2 = 0.0;
          if (0.0 <= dVar9) {
            dVar2 = dVar9;
          }
          dVar9 = _DAT_146248a98;
          if (dVar2 <= _DAT_146248a98) {
            dVar9 = dVar2;
          }
          uVar6 = (int)(long)dVar9 + 5;
          *local_e8 = *(undefined4 *)(lVar5 + 0x40);
          local_e8[1] = *(undefined4 *)(lVar5 + 0xa8);
          local_e8[2] = *(undefined4 *)(lVar5 + 0x110);
          local_e8[3] = *(undefined4 *)(lVar5 + 0x178);
          local_e8[4] = *(undefined4 *)(lVar5 + 0x1e0);
          local_f0 = 2.47032822920623e-323;
          local_e0 = 5;
          local_d8 = &local_f0;
          lVar5 = *(long *)(param_3 + 0x60);
          lVar7 = *(long *)(param_3 + 0x80);
          uVar3 = *(ulong *)(param_3 + 0x88);
          func_0x000145ce7230();
          uVar8 = (ulong)uVar6;
          func_0x000145ce5980();
          func_0x000145ce75c0();
          if (lVar5 != -1) {
            func_0x000145ce5b50();
            lVar5 = uVar3 - uVar8;
            if ((uVar8 <= uVar3) && (lVar5 != 0)) {
              lVar7 = lVar7 + uVar8 * 0x28 + 8;
              do {
                if (*(long *)(lVar7 + -8) != 0) {
                  func_0x0001400021d0();
                }
                lVar7 = lVar7 + 0x28;
                lVar5 = lVar5 + -1;
              } while (lVar5 != 0);
            }
          }
          func_0x00014606171b();
          if (local_f0 == 0.0) {
            return param_4;
          }
          func_0x0001400021d0();
          return param_4;
        }
        local_c1 = 0;
        func_0x00014620896b();
      }
                    /* WARNING: Does not return */
      pcVar1 = (code *)invalidInstructionException();
      (*pcVar1)();
    }
  }
  *param_4 = 0xffffffffffffffff;
  func_0x000145b45910();
  return param_4;
}
