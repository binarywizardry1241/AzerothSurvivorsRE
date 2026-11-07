
/* WARNING: Removing unreachable block (ram,0x0001454e9397) */
/* WARNING: Removing unreachable block (ram,0x0001454e93d0) */
/* WARNING: Removing unreachable block (ram,0x0001454e9450) */
/* WARNING: Removing unreachable block (ram,0x0001454e93d5) */
/* WARNING: Removing unreachable block (ram,0x0001454e93ec) */
/* WARNING: Removing unreachable block (ram,0x0001454e9460) */
/* WARNING: Removing unreachable block (ram,0x0001454e93f8) */
/* WARNING: Removing unreachable block (ram,0x0001454e9405) */
/* WARNING: Removing unreachable block (ram,0x0001454e9409) */
/* WARNING: Removing unreachable block (ram,0x0001454e940d) */
/* WARNING: Removing unreachable block (ram,0x0001454e9411) */
/* WARNING: Removing unreachable block (ram,0x0001454e946c) */
/* WARNING: Removing unreachable block (ram,0x0001454e9475) */
/* WARNING: Removing unreachable block (ram,0x0001454e94ae) */
/* WARNING: Removing unreachable block (ram,0x0001454e94b1) */
/* WARNING: Removing unreachable block (ram,0x0001454e94bd) */
/* WARNING: Removing unreachable block (ram,0x0001454e94cc) */
/* WARNING: Removing unreachable block (ram,0x0001454e99ce) */
/* WARNING: Removing unreachable block (ram,0x0001454e94dc) */
/* WARNING: Removing unreachable block (ram,0x0001454e94ec) */
/* WARNING: Removing unreachable block (ram,0x0001454e9370) */
/* WARNING: Removing unreachable block (ram,0x0001454e938e) */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 entry(long param_1,long param_2)

{
  char *pcVar1;
  undefined4 *puVar2;
  ulong uVar3;
  undefined1 uVar4;
  undefined1 uVar5;
  uint uVar6;
  undefined4 uVar7;
  long lVar8;
  ulong uVar9;
  ulong uVar10;
  bool bVar11;
  code *pcVar12;
  long lVar13;
  uint uVar14;
  long *plVar15;
  ulong uVar16;
  undefined8 uVar17;
  long lVar18;
  long *unaff_RBP;
  long lVar19;
  ulong uVar20;
  long *unaff_R14;
  long lVar21;
  float fVar22;
  float in_XMM6_Da;
  float fVar23;
  float fVar24;
  undefined4 uVar25;
  undefined4 uVar26;
  undefined4 uVar27;
  undefined4 uVar28;
  float in_XMM10_Da;
  float fVar29;
  float fVar30;
  undefined4 uVar31;
  undefined4 uVar32;
  float fVar33;
  
  *(int *)(unaff_RBP + 0x18) = (int)unaff_R14[1];
  unaff_RBP[0x17] = *unaff_R14;
  func_0x0001454ee2a0(param_1,param_2,param_1,unaff_RBP + 0x1c,unaff_RBP + 0x17);
  if (unaff_RBP[0x1e] == 0) {
    if (unaff_RBP[0x1c] != 0) {
      func_0x0001400021d0();
    }
    uVar17 = 0;
  }
  else {
    lVar19 = *(long *)unaff_RBP[0x1d];
    if (unaff_RBP[0x1c] != 0) {
      func_0x0001400021d0();
    }
    lVar8 = *(long *)(param_1 + 0x6f8);
    lVar18 = *(long *)(param_1 + 0x700);
    lVar21 = 0;
    *(undefined4 *)((long)unaff_RBP + 0x34) = _DAT_145930f04;
    do {
      if (lVar18 << 6 == lVar21) goto LAB_1454e92b4;
      pcVar1 = (char *)(lVar8 + lVar21);
      lVar21 = lVar21 + 0x40;
    } while (*pcVar1 != '\x17');
    *(undefined4 *)((long)unaff_RBP + 0x34) = _DAT_1458eb480;
LAB_1454e92b4:
    func_0x000140002200();
    plVar15 = (long *)func_0x0001400021c0();
    if (plVar15 == (long *)0x0) {
      func_0x0001458e7201();
                    /* WARNING: Does not return */
      pcVar12 = (code *)invalidInstructionException();
      (*pcVar12)();
    }
    *plVar15 = lVar19;
    unaff_RBP[0x17] = 1;
    unaff_RBP[0x18] = (long)plVar15;
    unaff_RBP[0x19] = 1;
    in_XMM6_Da = in_XMM6_Da *
                 *(float *)(unaff_RBP[0xf] + 0x1c) * *(float *)(unaff_RBP[0xf] + 0x44) *
                 *(float *)(param_2 + 0x50);
    bVar11 = _DAT_145bfc414 < in_XMM6_Da;
    unaff_RBP[0x23] = lVar19;
    if (bVar11) {
      func_0x000145756f57((in_XMM6_Da + _DAT_14698ebd0) / _DAT_1458f8de0);
    }
    unaff_RBP[0xb] = unaff_RBP[0x23];
    *(undefined4 *)(unaff_RBP + 10) = 0;
    *(undefined4 *)(unaff_RBP + 0x12) = 0;
    *(undefined1 *)((long)unaff_RBP + 0x126) = 1;
    func_0x00014544b1a0();
    lVar19 = *(long *)(param_1 + 0x548);
    if (lVar19 == *(long *)(param_1 + 0x538)) {
      func_0x0001457580b0();
    }
    lVar21 = *(long *)(param_1 + 0x540);
    lVar18 = unaff_RBP[0x1c];
    uVar31 = *(undefined4 *)((long)unaff_RBP + 0xe4);
    lVar13 = unaff_RBP[0x1d];
    uVar32 = *(undefined4 *)((long)unaff_RBP + 0xec);
    lVar8 = unaff_RBP[0x1f];
    plVar15 = (long *)(lVar21 + 0x10 + lVar19 * 0x20);
    *plVar15 = unaff_RBP[0x1e];
    plVar15[1] = lVar8;
    puVar2 = (undefined4 *)(lVar21 + lVar19 * 0x20);
    *puVar2 = (int)lVar18;
    puVar2[1] = uVar31;
    puVar2[2] = (int)lVar13;
    puVar2[3] = uVar32;
    *(long *)(param_1 + 0x548) = lVar19 + 1;
    *unaff_RBP = unaff_RBP[0x17];
    unaff_RBP[-1] = unaff_RBP[0x18];
    if (unaff_RBP[0x19] != 0) {
      lVar19 = unaff_RBP[0x19] << 3;
      *(undefined4 *)(unaff_RBP + 7) = *(undefined4 *)(unaff_RBP[0xf] + 0x48);
      *(undefined4 *)((long)unaff_RBP + 0x74) = *(undefined4 *)(unaff_RBP[0xf] + 0x50);
      unaff_RBP[-4] = param_1 + 0x4f0;
      lVar21 = 0;
      do {
        lVar8 = *(long *)(unaff_RBP[-1] + lVar21 * 8);
        uVar9 = *(ulong *)(param_1 + 0x880);
        uVar3 = *(ulong *)(param_1 + 0x898) + uVar9;
        uVar10 = *(ulong *)(param_1 + 0x888);
        uVar20 = *(ulong *)(param_1 + 0x890) ^ uVar9;
        uVar16 = *(ulong *)(param_1 + 0x898) ^ uVar10;
        *(ulong *)(param_1 + 0x888) = uVar10 ^ uVar20;
        *(ulong *)(param_1 + 0x880) = uVar9 ^ uVar16;
        *(ulong *)(param_1 + 0x890) = uVar20 ^ uVar10 << 0x11;
        *(ulong *)(param_1 + 0x898) = uVar16 << 0x2d | uVar16 >> 0x13;
        fVar33 = (float)(uint)((uVar3 * 0x800000 | uVar3 >> 0x29) + uVar9 >> 0x28) * _DAT_1459eb3c0;
        fVar24 = *(float *)(param_1 + 0x464);
        fVar22 = (float)func_0x000145756e73(*(undefined4 *)((long)unaff_RBP + 0x34),
                                            (float)(int)lVar21);
        fVar22 = fVar22 * in_XMM10_Da;
        lVar18 = unaff_RBP[0x11];
        uVar6 = *(uint *)(lVar18 + 0x68);
        uVar31 = *(undefined4 *)(lVar18 + 0x6c);
        uVar14 = uVar6 - 1;
        unaff_RBP[0x23] = lVar19;
        unaff_RBP[0xf] = lVar8;
        unaff_RBP[9] = (ulong)uVar6;
        if (uVar14 < 10) {
                    /* WARNING: Could not emulate address calculation at 0x0001454e9c4e */
                    /* WARNING: Treating indirect jump as call */
          uVar17 = (*(code *)((long)*(int *)((ulong)uVar14 * 4 + 0x1469acfc4) + 0x1469acfc4))();
          return uVar17;
        }
        uVar32 = *(undefined4 *)(lVar18 + 0x70);
        fVar30 = *(float *)(param_1 + 0x468) * fVar22;
        fVar29 = *(float *)(param_1 + 0x8e4);
        *(bool *)((long)unaff_RBP + 0x86) = fVar33 < fVar24;
        uVar7 = *(undefined4 *)(lVar18 + 0x40);
        uVar4 = *(undefined1 *)(lVar18 + 0x74);
        fVar23 = (float)lVar21 * _DAT_1458f6630;
        uVar17 = *(undefined8 *)(param_1 + 0x3d0);
        uVar25 = *(undefined4 *)(param_1 + 0x40);
        uVar26 = *(undefined4 *)(param_1 + 0x44);
        uVar27 = *(undefined4 *)(param_1 + 0x48);
        uVar28 = *(undefined4 *)(param_1 + 0x4c);
        uVar5 = *(undefined1 *)(param_1 + 0x7ec);
        lVar19 = *(long *)(param_1 + 0x500);
        if (lVar19 == *(long *)(param_1 + 0x4f0)) {
          func_0x0001457642b0();
        }
        lVar8 = *(long *)(param_1 + 0x4f8);
        lVar18 = lVar19 * 0x50;
        puVar2 = (undefined4 *)(lVar8 + lVar18);
        *puVar2 = uVar25;
        puVar2[1] = uVar26;
        puVar2[2] = uVar27;
        puVar2[3] = uVar28;
        *(undefined4 *)(lVar8 + 0x10 + lVar18) = 0;
        *(long *)(lVar8 + 0x20 + lVar18) = unaff_RBP[0xf];
        *(undefined8 *)(lVar8 + 0x28 + lVar18) = uVar17;
        *(int *)(lVar8 + 0x30 + lVar18) = (int)unaff_RBP[9];
        *(undefined4 *)(lVar8 + 0x34 + lVar18) = uVar31;
        *(undefined4 *)(lVar8 + 0x38 + lVar18) = uVar32;
        *(float *)(lVar8 + 0x3c + lVar18) = fVar23 + fVar29;
        *(undefined4 *)(lVar8 + 0x40 + lVar18) = uVar7;
        *(uint *)(lVar8 + 0x44 + lVar18) =
             ~-(uint)(fVar33 < fVar24) & (uint)fVar22 | (uint)fVar30 & -(uint)(fVar33 < fVar24);
        *(undefined1 *)(lVar8 + 0x48 + lVar18) = *(undefined1 *)((long)unaff_RBP + 0x86);
        *(undefined1 *)(lVar8 + 0x49 + lVar18) = 0;
        *(undefined1 *)(lVar8 + 0x4a + lVar18) = uVar5;
        *(undefined1 *)(lVar8 + 0x4b + lVar18) = uVar4;
        *(long *)(param_1 + 0x500) = lVar19 + 1;
        lVar21 = lVar21 + 1;
        lVar19 = unaff_RBP[0x23] + -8;
      } while (lVar19 != 0);
    }
    if (*unaff_RBP != 0) {
      func_0x0001400021d0();
    }
    uVar17 = 1;
  }
  return uVar17;
}

