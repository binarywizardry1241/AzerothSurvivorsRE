
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,undefined8 *param_3,undefined8 param_4,
          undefined4 *param_5)

{
  long lVar1;
  code *pcVar2;
  undefined4 uVar3;
  long lVar4;
  long lVar5;
  long lVar6;
  float fVar7;
  float fVar8;
  undefined4 in_XMM6_Da;
  float fVar9;
  undefined4 in_XMM7_Da;
  float fVar10;
  float fVar11;
  float fVar12;
  float fVar13;
  float fVar14;
  float fVar15;
  float fVar16;
  float fVar17;
  undefined1 local_278 [224];
  ulong local_198;
  undefined8 uStack_190;
  undefined8 local_148;
  undefined8 uStack_140;
  undefined8 local_138;
  undefined8 uStack_130;
  undefined8 local_128;
  undefined4 local_120;
  undefined4 uStack_11c;
  undefined4 uStack_118;
  undefined4 uStack_114;
  undefined4 *local_110;
  undefined8 uStack_108;
  undefined8 local_100;
  long local_f8;
  undefined8 local_f0;
  int local_e4;
  undefined1 local_d1;
  undefined8 local_d0;
  undefined4 local_c8;
  undefined4 local_b8;

  local_d0 = 0xfffffffffffffffe;
  local_128 = param_3[4];
  local_148 = *param_3;
  uStack_140 = param_3[1];
  local_138 = param_3[2];
  uStack_130 = param_3[3];
  local_120 = *param_5;
  uStack_11c = param_5[1];
  uStack_118 = param_5[2];
  uStack_114 = param_5[3];
  local_110 = *(undefined4 **)(param_5 + 4);
  uStack_108 = *(undefined8 *)(param_5 + 6);
  local_c8 = in_XMM6_Da;
  local_b8 = in_XMM7_Da;
  func_0x000140002200();
  lVar4 = func_0x0001400021c0();
  if (lVar4 == 0) {
    func_0x00014590379b();
                    /* WARNING: Does not return */
    pcVar2 = (code *)invalidInstructionException();
    (*pcVar2)();
  }
  local_100 = 0x400000;
  local_f8 = lVar4;
  func_0x0001457731db();
  local_f0 = 0x400000;
  lVar4 = lVar4 + 3;
  lVar6 = 0;
  fVar13 = 0.0;
  fVar9 = _DAT_14594b51c;
  fVar10 = _DAT_145907498;
  fVar11 = _DAT_14594b518;
  fVar12 = _DAT_145940390;
  fVar14 = _DAT_14594b220;
  fVar15 = _DAT_145918ac0;
  fVar16 = _DAT_145907490;
  fVar17 = _DAT_14594b520;
  do {
    lVar5 = 0;
    do {
      func_0x00014577324d((float)(int)lVar5 + fVar10 + fVar11);
      fVar7 = (float)func_0x00014577325f();
      fVar7 = (float)(~-(uint)(fVar7 < fVar13) & (uint)fVar7 |
                     (uint)(fVar7 + fVar9) & -(uint)(fVar7 < fVar13));
      if (fVar7 < fVar14) {
        fVar8 = fVar7 / fVar14;
      }
      else {
        fVar8 = fVar16;
        if ((fVar17 <= fVar7) && (fVar8 = 0.0, fVar7 < fVar12)) {
          fVar8 = (fVar12 - fVar7) / fVar14;
        }
      }
      lVar1 = lVar5 + 1;
      fVar8 = (float)func_0x00014577322f(fVar8 * fVar15);
      fVar7 = 0.0;
      if (0.0 <= fVar8) {
        fVar7 = fVar8;
      }
      fVar8 = fVar15;
      if (fVar7 <= fVar15) {
        fVar8 = fVar7;
      }
      *(char *)(lVar4 + lVar5 * 4) = (char)(int)fVar8;
      lVar5 = lVar1;
    } while (lVar1 != 0x400);
    lVar6 = lVar6 + 1;
    lVar4 = lVar4 + 0x1000;
  } while (lVar6 != 0x400);
  func_0x00014229b5b0(0x400,lVar4,0x400,local_278,0x400,&local_100);
  *local_110 = uStack_108._4_4_;
  local_d1 = 1;
  uVar3 = func_0x000144978a10();
  local_d1 = 0;
  func_0x0001401f1cc0(uVar3);
  if (local_e4 == 2) {
    local_198 = 0xffffffffffffffff;
    local_d1 = 0;
    uStack_190 = func_0x00014498b590();
    local_198 = local_198 & 0xffffffffffffff00;
    func_0x0001400d6bb0();
    return;
  }
  local_d1 = 0;
  func_0x000145903ab0();
                    /* WARNING: Does not return */
  pcVar2 = (code *)invalidInstructionException();
  (*pcVar2)();
}
