
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(void)

{
  undefined4 *puVar1;
  undefined4 *puVar2;
  int iVar3;
  long lVar4;
  ulong uVar5;
  long lVar6;
  code *pcVar7;
  undefined4 uVar8;
  undefined4 uVar9;
  undefined4 uVar10;
  long in_RCX;
  ulong uVar11;
  ulong uVar12;
  undefined4 *puVar13;
  long lVar14;
  ulong uVar15;
  float fVar16;
  undefined4 in_XMM6_Da;
  float fVar17;
  undefined4 in_XMM7_Da;
  undefined8 local_f8;
  undefined8 uStack_f0;
  undefined8 local_e8;
  undefined8 uStack_e0;
  undefined8 local_d8;
  undefined8 local_d0;
  undefined8 local_c8;
  undefined8 local_c0;
  undefined1 local_b8;
  undefined4 local_b0;
  undefined4 uStack_ac;
  long local_a8;
  long local_a0;
  long local_90;
  long local_88;
  undefined8 local_80;
  undefined4 local_78;
  undefined4 local_68;

  local_80 = 0xfffffffffffffffe;
  *(undefined4 *)(in_RCX + 0xc28) = 0;
  *(undefined1 *)(in_RCX + 0xc46) = 1;
  *(undefined4 *)(in_RCX + 0xac0) = 0;
  local_78 = in_XMM6_Da;
  local_68 = in_XMM7_Da;
  func_0x0001459ab7f0(in_RCX + 0x630,in_RCX,*(undefined8 *)(in_RCX + 0x478),&local_f8,
                      *(undefined4 *)(in_RCX + 0x560));
  lVar14 = *(long *)(in_RCX + 0x640);
  if (lVar14 == *(long *)(in_RCX + 0x630)) {
    func_0x000145d150f0();
  }
  lVar4 = *(long *)(in_RCX + 0x638);
  puVar2 = (undefined4 *)(lVar4 + 0x10 + lVar14 * 0x20);
  *puVar2 = (undefined4)local_e8;
  puVar2[1] = local_e8._4_4_;
  puVar2[2] = (undefined4)uStack_e0;
  puVar2[3] = uStack_e0._4_4_;
  puVar2 = (undefined4 *)(lVar4 + lVar14 * 0x20);
  *puVar2 = (undefined4)local_f8;
  puVar2[1] = local_f8._4_4_;
  puVar2[2] = (undefined4)uStack_f0;
  puVar2[3] = uStack_f0._4_4_;
  *(long *)(in_RCX + 0x640) = lVar14 + 1;
  *(int *)(in_RCX + 0x560) = *(int *)(in_RCX + 0x560) + 1;
  func_0x0001458092f0();
  fVar17 = *(float *)(in_RCX + 0x490);
  fVar16 = _DAT_145ee037c * fVar17;
  *(float *)(in_RCX + 0x4f8) = fVar16;
  if (fVar16 <= 0.0) {
    fVar16 = 0.0;
  }
  func_0x000145d1465b(fVar16);
  func_0x000145d1465b(fVar17);
  func_0x0001458092f0();
  func_0x0001458092f0();
  local_b0 = 2;
  func_0x0001459b8330();
  lVar14 = *(long *)(in_RCX + 0x640);
  if (lVar14 == *(long *)(in_RCX + 0x630)) {
    func_0x000145d150f0();
  }
  lVar4 = *(long *)(in_RCX + 0x638);
  puVar2 = (undefined4 *)(lVar4 + 0x10 + lVar14 * 0x20);
  *puVar2 = (undefined4)local_e8;
  puVar2[1] = local_e8._4_4_;
  puVar2[2] = (undefined4)uStack_e0;
  puVar2[3] = uStack_e0._4_4_;
  puVar2 = (undefined4 *)(lVar4 + lVar14 * 0x20);
  *puVar2 = (undefined4)local_f8;
  puVar2[1] = local_f8._4_4_;
  puVar2[2] = (undefined4)uStack_f0;
  puVar2[3] = uStack_f0._4_4_;
  *(long *)(in_RCX + 0x640) = lVar14 + 1;
  uVar5 = *(ulong *)(in_RCX + 0x3a8);
  if (uVar5 == 0) {
    uVar12 = 0;
LAB_1459003dd:
    fVar17 = *(float *)(in_RCX + 0xb9c) + _DAT_145ee02b0;
    if (uVar12 == *(ulong *)(in_RCX + 0x398)) {
LAB_1459003f6:
      func_0x000145d402b0();
    }
LAB_145900402:
    lVar14 = *(long *)(in_RCX + 0x3a0);
    *(undefined4 *)(lVar14 + uVar12 * 0x18) = 0xc;
    *(undefined4 *)(lVar14 + 0xc + uVar12 * 0x18) = 0x3fc;
    *(float *)(lVar14 + 0x10 + uVar12 * 0x18) = fVar17;
    *(undefined4 *)(lVar14 + 0x14 + uVar12 * 0x18) = 0;
    *(ulong *)(in_RCX + 0x3a8) = uVar12 + 1;
    func_0x000145904950();
    func_0x000140002200();
    uStack_f0 = (undefined1 *)func_0x0001400021c0();
    if (uStack_f0 == (undefined1 *)0x0) {
      func_0x000145eb6fcb();
                    /* WARNING: Does not return */
      pcVar7 = (code *)invalidInstructionException();
      (*pcVar7)();
    }
    *uStack_f0 = 0x7b;
    local_f8 = 1;
    local_e8 = 1;
    uStack_e0 = CONCAT71(uStack_e0._1_7_,1);
    func_0x000145858350();
    local_88 = CONCAT44(uStack_ac,local_b0);
    lVar14 = local_a0;
    if (local_88 == local_a0) {
      func_0x000145d14a10();
      local_88 = CONCAT44(uStack_ac,local_b0);
      lVar14 = local_a0;
    }
    local_90 = local_a8;
    *(undefined1 *)(local_a8 + lVar14) = 0x7d;
    lVar4 = *(long *)(in_RCX + 0x658);
    if (lVar4 == *(long *)(in_RCX + 0x648)) {
      func_0x000145d14e50();
    }
    lVar6 = *(long *)(in_RCX + 0x650);
    *(long *)(lVar6 + lVar4 * 0x18) = local_88;
    *(long *)(lVar6 + 8 + lVar4 * 0x18) = local_90;
    *(long *)(lVar6 + 0x10 + lVar4 * 0x18) = lVar14 + 1;
    *(long *)(in_RCX + 0x658) = lVar4 + 1;
    func_0x0001458dff90();
    func_0x0001458e0370();
    local_c8 = 0x14700cd94;
    local_c0 = 7;
    uStack_e0 = 0;
    local_d8 = 1;
    local_d0 = 0;
    local_b8 = 0;
    func_0x00014591e8f0();
    return;
  }
  puVar2 = *(undefined4 **)(in_RCX + 0x3a0);
  uVar11 = 0;
  puVar13 = puVar2;
LAB_1459003c0:
  if (puVar13[3] != 0x3fc) goto code_r0x0001459003cd;
  uVar15 = uVar11 + 1;
  uVar12 = uVar11;
  if (uVar15 < uVar5) {
    if (((int)uVar5 + (int)uVar11 & 1U) == 0) {
      if (puVar13[9] != 0x3fc) {
        *(undefined8 *)(puVar13 + 4) = *(undefined8 *)(puVar13 + 10);
        *puVar13 = puVar13[6];
        puVar13[1] = puVar13[7];
        puVar13[2] = puVar13[8];
        puVar13[3] = puVar13[9];
        uVar12 = uVar11 + 1;
      }
      uVar15 = uVar11 + 2;
    }
    if (uVar5 - 2 != uVar11) {
      puVar13 = puVar2 + uVar15 * 6;
      lVar14 = uVar5 - uVar15;
      do {
        if (puVar13[3] == 0x3fc) {
          iVar3 = puVar13[9];
        }
        else {
          *(undefined8 *)(puVar2 + uVar12 * 6 + 4) = *(undefined8 *)(puVar13 + 4);
          uVar8 = puVar13[1];
          uVar9 = puVar13[2];
          uVar10 = puVar13[3];
          puVar1 = puVar2 + uVar12 * 6;
          *puVar1 = *puVar13;
          puVar1[1] = uVar8;
          puVar1[2] = uVar9;
          puVar1[3] = uVar10;
          uVar12 = uVar12 + 1;
          iVar3 = puVar13[9];
        }
        if (iVar3 != 0x3fc) {
          *(undefined8 *)(puVar2 + uVar12 * 6 + 4) = *(undefined8 *)(puVar13 + 10);
          uVar8 = puVar13[7];
          uVar9 = puVar13[8];
          uVar10 = puVar13[9];
          puVar1 = puVar2 + uVar12 * 6;
          *puVar1 = puVar13[6];
          puVar1[1] = uVar8;
          puVar1[2] = uVar9;
          puVar1[3] = uVar10;
          uVar12 = uVar12 + 1;
        }
        puVar13 = puVar13 + 0xc;
        lVar14 = lVar14 + -2;
      } while (lVar14 != 0);
    }
  }
  *(ulong *)(in_RCX + 0x3a8) = uVar12;
  fVar17 = *(float *)(in_RCX + 0xb9c) + _DAT_145ee02b0;
  if (uVar12 != *(ulong *)(in_RCX + 0x398)) goto LAB_145900402;
  goto LAB_1459003f6;
code_r0x0001459003cd:
  uVar11 = uVar11 + 1;
  puVar13 = puVar13 + 6;
  uVar12 = uVar5;
  if (uVar5 == uVar11) goto LAB_1459003dd;
  goto LAB_1459003c0;
}
