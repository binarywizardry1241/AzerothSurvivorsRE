/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(void)

{
  char cVar1;
  uint uVar2;
  int iVar3;
  long lVar4;
  undefined1 auVar5 [16];
  byte bVar6;
  ulong uVar7;
  undefined1 *puVar8;
  long lVar9;
  long unaff_RBP;
  long lVar10;
  long unaff_R12;
  long unaff_R13;
  undefined8 unaff_R14;
  float fVar11;
  undefined4 extraout_XMM0_Da;
  undefined4 uVar12;
  undefined4 uVar13;
  undefined4 extraout_XMM0_Da_00;
  undefined4 extraout_XMM0_Dc;
  float fVar14;
  undefined1 auVar15 [16];
  float in_XMM7_Da;
  float in_XMM9_Da;
  float in_XMM9_Db;
  float in_XMM9_Dc;
  float in_XMM9_Dd;
  float in_XMM10_Da;
  uint in_XMM11_Da;
  float fVar16;

  if ((0.0 < *(float *)(unaff_R13 + 0x70)) && (*(char *)(unaff_R13 + 0x7d) != '\0')) {
    auVar15._0_4_ = in_XMM9_Da - (float)*(undefined8 *)(unaff_R13 + 0x40);
    auVar15._4_4_ = in_XMM9_Db - (float)((ulong)*(undefined8 *)(unaff_R13 + 0x40) >> 0x20);
    auVar15._8_4_ = in_XMM9_Dc - 0.0;
    auVar15._12_4_ = in_XMM9_Dd - 0.0;
    fVar11 = (float)func_0x000145c0a42f(auVar15._0_4_);
    if (_DAT_145db1398 < fVar11) {
      fVar14 = *(float *)(unaff_R13 + 0x70) * *(float *)(unaff_RBP + 0x1d8);
      fVar16 = fVar14;
      if (fVar11 <= fVar14) {
        fVar16 = fVar11;
      }
      fVar16 = (float)(~-(uint)NAN(fVar16) & (uint)fVar16 | (uint)fVar14 & -(uint)NAN(fVar16));
      auVar5._4_4_ = fVar11;
      auVar5._0_4_ = fVar11;
      auVar5._8_4_ = extraout_XMM0_Dc;
      auVar5._12_4_ = extraout_XMM0_Dc;
      auVar15 = divps(auVar15,auVar5);
      fVar11 = (float)*(undefined8 *)(unaff_R13 + 0x40);
      fVar14 = fVar16 * auVar15._0_4_ + fVar11;
      fVar16 = fVar16 * auVar15._4_4_ + (float)((ulong)*(undefined8 *)(unaff_R13 + 0x40) >> 0x20);
      lVar10 = *(long *)(*(long *)(unaff_RBP + 0x248) + 0x9b0);
      *(undefined8 *)(unaff_RBP + 0x268) = *(undefined8 *)(unaff_RBP + 0x278);
      *(undefined8 *)(unaff_RBP + 0x260) = *(undefined8 *)(unaff_RBP + 0x280);
      *(undefined8 *)(unaff_RBP + 600) = *(undefined8 *)(unaff_RBP + 0x288);
      *(undefined8 *)(unaff_RBP + 0x250) = *(undefined8 *)(unaff_RBP + 0x290);
      *(undefined1 *)(unaff_RBP + 0x2a7) = 1;
      *(undefined1 *)(unaff_RBP + 0x2a6) = 1;
      *(undefined1 *)(unaff_RBP + 0x2a5) = 1;
      *(undefined1 *)(unaff_RBP + 0x2a4) = 1;
      *(undefined1 *)(unaff_RBP + 0x2a3) = 1;
      *(undefined1 *)(unaff_RBP + 0x2a2) = 1;
      *(undefined1 *)(unaff_RBP + 0x2a1) = 1;
      *(undefined1 *)(unaff_RBP + 0x2a0) = 1;
      *(undefined1 *)(unaff_RBP + 0x29f) = 1;
      uVar7 = func_0x0001458a0b40(fVar11,fVar14,fVar16);
      uVar12 = extraout_XMM0_Da;
      if ((uVar7 & 1) == 0) {
        if (*(long *)(lVar10 + 0x68) != -1) {
          *(undefined8 *)(unaff_RBP + 0x268) = *(undefined8 *)(unaff_RBP + 0x278);
          *(undefined8 *)(unaff_RBP + 0x260) = *(undefined8 *)(unaff_RBP + 0x280);
          *(undefined8 *)(unaff_RBP + 600) = *(undefined8 *)(unaff_RBP + 0x288);
          *(undefined8 *)(unaff_RBP + 0x250) = *(undefined8 *)(unaff_RBP + 0x290);
          *(undefined1 *)(unaff_RBP + 0x2a7) = 1;
          *(undefined1 *)(unaff_RBP + 0x2a6) = 1;
          *(undefined1 *)(unaff_RBP + 0x2a5) = 1;
          *(undefined1 *)(unaff_RBP + 0x2a4) = 1;
          *(undefined1 *)(unaff_RBP + 0x2a3) = 1;
          *(undefined1 *)(unaff_RBP + 0x2a2) = 1;
          *(undefined1 *)(unaff_RBP + 0x2a1) = 1;
          *(undefined1 *)(unaff_RBP + 0x2a0) = 1;
          *(undefined1 *)(unaff_RBP + 0x29f) = 1;
          func_0x0001458a4d60();
          if (*(int *)(unaff_RBP + 0x1e0) == 1) {
            uVar12 = *(undefined4 *)(unaff_RBP + 0x1ec);
            goto LAB_1459177f2;
          }
        }
        uVar12 = *(undefined4 *)(lVar10 + 0xb8);
      }
LAB_1459177f2:
      *(ulong *)(unaff_R13 + 0x40) = CONCAT44(fVar16,fVar14);
      *(undefined4 *)(unaff_R13 + 0x48) = uVar12;
    }
  }
  if ((*(int *)(unaff_R13 + 0x10) == 6) && (*(int *)(unaff_R13 + 0x30) == 2)) {
    uVar12 = *(undefined4 *)(unaff_R13 + 0x38);
    fVar16 = in_XMM10_Da - *(float *)(unaff_R13 + 0x44);
    fVar11 = (float)func_0x000145c0a42f(in_XMM9_Da - *(float *)(unaff_R13 + 0x40),fVar16);
    if (fVar11 <= _DAT_145dad260) {
      fVar11 = _DAT_145dad260;
    }
    uVar13 = func_0x000145c0a447(fVar16);
    *(undefined4 *)(unaff_R13 + 0x4c) = uVar13;
    *(undefined4 *)(unaff_R13 + 0x30) = 2;
    *(float *)(unaff_R13 + 0x34) = fVar11;
    *(undefined4 *)(unaff_R13 + 0x38) = uVar12;
    if ((*(char *)(unaff_R13 + 0x7e) == '\x01') &&
       (_DAT_145dad260 < (float)((uint)(fVar11 - *(float *)(unaff_R13 + 0x78)) & in_XMM11_Da))) {
      *(float *)(unaff_R13 + 0x78) = fVar11;
      lVar10 = *(long *)(unaff_RBP + 0x138);
      if (lVar10 == *(long *)(unaff_RBP + 0x128)) {
        *(undefined8 *)(unaff_RBP + 0x268) = *(undefined8 *)(unaff_RBP + 0x278);
        *(undefined8 *)(unaff_RBP + 0x260) = *(undefined8 *)(unaff_RBP + 0x280);
        *(undefined8 *)(unaff_RBP + 600) = *(undefined8 *)(unaff_RBP + 0x288);
        *(undefined8 *)(unaff_RBP + 0x250) = *(undefined8 *)(unaff_RBP + 0x290);
        *(undefined1 *)(unaff_RBP + 0x2a7) = 1;
        *(undefined1 *)(unaff_RBP + 0x2a6) = 1;
        *(undefined1 *)(unaff_RBP + 0x2a5) = 1;
        *(undefined1 *)(unaff_RBP + 0x2a4) = 1;
        *(undefined1 *)(unaff_RBP + 0x2a3) = 1;
        *(undefined1 *)(unaff_RBP + 0x2a2) = 1;
        *(undefined1 *)(unaff_RBP + 0x2a1) = 1;
        *(undefined1 *)(unaff_RBP + 0x2a0) = 1;
        *(undefined1 *)(unaff_RBP + 0x29f) = 1;
        func_0x000145c0d930();
      }
      *(undefined8 *)(*(long *)(unaff_RBP + 0x130) + lVar10 * 8) = unaff_R14;
      *(long *)(unaff_RBP + 0x138) = lVar10 + 1;
    }
  }
  if (*(int *)(unaff_R13 + 0x10) == 4) {
    if ((*(float *)(unaff_R13 + 0x14) <= *(float *)(unaff_RBP + 0x234)) &&
       (*(float *)(unaff_RBP + 0x234) < *(float *)(unaff_R13 + 0x54))) {
      func_0x000145c0a42f(in_XMM9_Da - (float)*(undefined8 *)(unaff_R13 + 0x40),
                          in_XMM9_Db - (float)((ulong)*(undefined8 *)(unaff_R13 + 0x40) >> 0x20));
                    /* WARNING: Could not recover jumptable at 0x0001459179b6. Too many branches */
                    /* WARNING: Treating indirect jump as call */
      (*(code *)(*(int *)(unaff_R12 + (ulong)*(uint *)(unaff_R13 + 0x30) * 4) + unaff_R12))();
      return;
    }
  }
  else if (*(int *)(unaff_R13 + 0x10) == 3) {
    bVar6 = 1;
    if (*(char *)(unaff_R13 + 0x7d) != '\0') {
      *(float *)(unaff_R13 + 0x4c) =
           *(float *)(unaff_R13 + 0x1c) * *(float *)(unaff_RBP + 0x1d8) +
           *(float *)(unaff_R13 + 0x4c);
    }
    cVar1 = *(char *)(unaff_R13 + 0x7e);
    goto joined_r0x000145917c8b;
  }
  bVar6 = 0;
  cVar1 = *(char *)(unaff_R13 + 0x7e);
joined_r0x000145917c8b:
  if (cVar1 == '\0') {
    if (*(float *)(unaff_R13 + 0x54) - *(float *)(unaff_R13 + 100) <= *(float *)(unaff_RBP + 0x234))
    {
      *(undefined1 *)(unaff_R13 + 0x7e) = 1;
      lVar10 = *(long *)(unaff_RBP + 0x138);
      if (lVar10 == *(long *)(unaff_RBP + 0x128)) {
        *(undefined8 *)(unaff_RBP + 0x268) = *(undefined8 *)(unaff_RBP + 0x278);
        *(undefined8 *)(unaff_RBP + 0x260) = *(undefined8 *)(unaff_RBP + 0x280);
        *(undefined8 *)(unaff_RBP + 600) = *(undefined8 *)(unaff_RBP + 0x288);
        *(undefined8 *)(unaff_RBP + 0x250) = *(undefined8 *)(unaff_RBP + 0x290);
        *(undefined1 *)(unaff_RBP + 0x2a7) = 1;
        *(undefined1 *)(unaff_RBP + 0x2a6) = 1;
        *(undefined1 *)(unaff_RBP + 0x2a5) = 1;
        *(undefined1 *)(unaff_RBP + 0x2a4) = 1;
        *(undefined1 *)(unaff_RBP + 0x2a3) = 1;
        *(undefined1 *)(unaff_RBP + 0x2a2) = 1;
        *(undefined1 *)(unaff_RBP + 0x2a1) = 1;
        *(undefined1 *)(unaff_RBP + 0x2a0) = 1;
        *(undefined1 *)(unaff_RBP + 0x29f) = 1;
        func_0x000145c0d930();
      }
      *(undefined8 *)(*(long *)(unaff_RBP + 0x130) + lVar10 * 8) = unaff_R14;
      *(long *)(unaff_RBP + 0x138) = lVar10 + 1;
    }
  }
  else if ((((*(char *)(unaff_R13 + 0x7c) != '\0') ||
            (*(float *)(unaff_R13 + 0x50) <= *(float *)(unaff_R13 + 0x58) &&
             *(float *)(unaff_R13 + 0x58) != *(float *)(unaff_R13 + 0x50))) ||
           (0.0 < *(float *)(unaff_R13 + 0x70))) ||
          ((bool)(bVar6 & *(float *)(unaff_R13 + 0x1c) != 0.0))) {
    *(undefined8 *)(unaff_RBP + 0x140) = *(undefined8 *)(unaff_RBP + 0x290);
    *(undefined8 *)(unaff_RBP + 0x148) = *(undefined8 *)(unaff_RBP + 0x288);
    *(undefined8 *)(unaff_RBP + 0x150) = *(undefined8 *)(unaff_RBP + 0x40);
    *(undefined1 *)(unaff_RBP + 0x158) = *(undefined1 *)(unaff_RBP + 0x226);
    *(undefined4 *)(unaff_RBP + 0x15c) = *(undefined4 *)(unaff_RBP + 0xeb);
    *(undefined4 *)(unaff_RBP + 0x159) = *(undefined4 *)(unaff_RBP + 0xe8);
    func_0x000140002200();
    puVar8 = (undefined1 *)func_0x0001400021c0();
    if (puVar8 == (undefined1 *)0x0) {
                    /* WARNING: Bad instruction - Truncating control flow here */
      halt_baddata();
    }
    *puVar8 = 0x5b;
    *(undefined8 *)(unaff_RBP + 0x1e0) = 1;
    *(undefined1 **)(unaff_RBP + 0x1e8) = puVar8;
    *(undefined8 *)(unaff_RBP + 0x1f0) = 1;
    *(undefined1 *)(unaff_RBP + 0x1f8) = 1;
    uVar2 = *(uint *)(unaff_R13 + 0x3c);
    *(undefined1 *)(unaff_RBP + 0x1d4) = 1;
    func_0x00014598f8c0(extraout_XMM0_Da_00,SUB84((double)uVar2,0));
    *(undefined1 *)(unaff_RBP + 0x1d4) = 0;
    func_0x00014598caf0();
    fVar11 = *(float *)(unaff_R13 + 0x40);
    *(undefined1 *)(unaff_RBP + 0x1d3) = 1;
    func_0x00014598f8c0(fVar11,SUB84((double)fVar11,0));
    *(undefined1 *)(unaff_RBP + 0x1d3) = 0;
    func_0x00014598caf0();
    fVar11 = *(float *)(unaff_R13 + 0x44);
    *(undefined1 *)(unaff_RBP + 0x1d2) = 1;
    func_0x00014598f8c0(fVar11,SUB84((double)fVar11,0));
    *(undefined1 *)(unaff_RBP + 0x1d2) = 0;
    func_0x00014598caf0();
    fVar11 = *(float *)(unaff_R13 + 0x48);
    *(undefined1 *)(unaff_RBP + 0x1d1) = 1;
    func_0x00014598f8c0(fVar11,SUB84((double)fVar11,0));
    *(undefined1 *)(unaff_RBP + 0x1d1) = 0;
    func_0x00014598caf0();
    fVar11 = *(float *)(unaff_R13 + 0x4c);
    *(undefined1 *)(unaff_RBP + 0x1d0) = 1;
    func_0x00014598f8c0(fVar11,SUB84((double)fVar11,0));
    *(undefined1 *)(unaff_RBP + 0x1d0) = 0;
    func_0x00014598caf0();
    lVar10 = *(long *)(unaff_RBP + 400);
    if (*(long *)(unaff_RBP + 0x180) == lVar10) {
      func_0x000145c0d470();
    }
    *(undefined1 *)(*(long *)(unaff_RBP + 0x188) + lVar10) = 0x5d;
    *(long *)(unaff_RBP + 0x1f0) = lVar10 + 1;
    *(undefined4 *)(unaff_RBP + 0x1e0) = *(undefined4 *)(unaff_RBP + 0x180);
    *(undefined4 *)(unaff_RBP + 0x1e4) = *(undefined4 *)(unaff_RBP + 0x184);
    *(undefined4 *)(unaff_RBP + 0x1e8) = *(undefined4 *)(unaff_RBP + 0x188);
    *(undefined4 *)(unaff_RBP + 0x1ec) = *(undefined4 *)(unaff_RBP + 0x18c);
    *(undefined1 *)(unaff_RBP + 0x29e) = 0;
    func_0x00014598caf0();
    *(undefined8 *)(unaff_RBP + 0x290) = *(undefined8 *)(unaff_RBP + 0xf0);
    *(undefined8 *)(unaff_RBP + 0x288) = *(undefined8 *)(unaff_RBP + 0xf8);
    *(undefined8 *)(unaff_RBP + 0x40) = *(undefined8 *)(unaff_RBP + 0x100);
    *(undefined1 *)(unaff_RBP + 0x226) = *(undefined1 *)(unaff_RBP + 0x108);
    *(undefined4 *)(unaff_RBP + 0xe8) = *(undefined4 *)(unaff_RBP + 0x109);
    *(undefined4 *)(unaff_RBP + 0xeb) = *(undefined4 *)(unaff_RBP + 0x10c);
    *(ulong *)(unaff_RBP + -0x18) =
         CONCAT71((uint7)(uint3)((uint)*(undefined4 *)(unaff_RBP + 0x109) >> 8),1);
  }
  if (((*(uint *)(unaff_R13 + 0x10) < 6) &&
      ((0x32U >> (*(uint *)(unaff_R13 + 0x10) & 0x1f) & 1) != 0)) &&
     (*(char *)(unaff_R13 + 0x7e) != '\0')) {
    func_0x000145c0a42f(in_XMM9_Da - (float)*(undefined8 *)(unaff_R13 + 0x40),
                        in_XMM9_Db - (float)((ulong)*(undefined8 *)(unaff_R13 + 0x40) >> 0x20));
                    /* WARNING: Could not recover jumptable at 0x000145918086. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*(code *)((long)*(int *)((ulong)*(uint *)(unaff_R13 + 0x30) * 4 + 0x146c0c26c) + 0x146c0c26c))
              ();
    return;
  }
  if ((*(char *)(unaff_R13 + 0x7d) == '\0') &&
     (*(float *)(unaff_R13 + 0x54) <= *(float *)(unaff_RBP + 0x234))) {
    func_0x000145c0a42f(in_XMM9_Da - (float)*(undefined8 *)(unaff_R13 + 0x40),
                        in_XMM9_Db - (float)((ulong)*(undefined8 *)(unaff_R13 + 0x40) >> 0x20));
                    /* WARNING: Could not recover jumptable at 0x0001459182c9. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*(code *)((long)*(int *)((ulong)*(uint *)(unaff_R13 + 0x30) * 4 + 0x146c0c27c) + 0x146c0c27c))
              ();
    return;
  }
  if (*(char *)(unaff_R13 + 0x7d) != '\0') {
    iVar3 = *(int *)(unaff_R13 + 0x10);
    if (iVar3 == 6) {
      fVar11 = *(float *)(unaff_R13 + 0x14);
      fVar16 = *(float *)(unaff_R13 + 0x18);
      uVar12 = *(undefined4 *)(unaff_R13 + 0x1c);
      fVar14 = (float)func_0x000145c0a42f(in_XMM9_Da - *(float *)(unaff_R13 + 0x40),
                                          in_XMM10_Da - *(float *)(unaff_R13 + 0x44));
      if ((fVar11 < fVar14) || (fVar16 <= *(float *)(unaff_RBP + 0x234))) {
        if (*(long *)(unaff_RBP + 0x1c0) == *(long *)(unaff_RBP + 0x1b0)) {
          *(undefined8 *)(unaff_RBP + 0x268) = *(undefined8 *)(unaff_RBP + 0x278);
          *(undefined8 *)(unaff_RBP + 0x260) = *(undefined8 *)(unaff_RBP + 0x280);
          *(undefined8 *)(unaff_RBP + 600) = *(undefined8 *)(unaff_RBP + 0x288);
          *(undefined8 *)(unaff_RBP + 0x250) = *(undefined8 *)(unaff_RBP + 0x290);
          *(undefined1 *)(unaff_RBP + 0x2a7) = 1;
          *(undefined1 *)(unaff_RBP + 0x2a6) = 1;
          *(undefined1 *)(unaff_RBP + 0x2a5) = 1;
          *(undefined1 *)(unaff_RBP + 0x2a4) = 1;
          *(undefined1 *)(unaff_RBP + 0x2a3) = 1;
          *(undefined1 *)(unaff_RBP + 0x2a2) = 1;
          *(undefined1 *)(unaff_RBP + 0x2a1) = 1;
          *(undefined1 *)(unaff_RBP + 0x2a0) = 1;
          *(undefined1 *)(unaff_RBP + 0x29f) = 1;
          func_0x000145c0d930();
        }
                    /* WARNING: Bad instruction - Truncating control flow here */
        halt_baddata();
      }
      if (*(float *)(unaff_R13 + 0x68) <= *(float *)(unaff_RBP + 0x234)) {
        *(float *)(unaff_R13 + 0x68) = *(float *)(unaff_R13 + 0x68) + in_XMM7_Da;
        fVar11 = *(float *)(unaff_R13 + 0x60);
        *(undefined8 *)(unaff_RBP + 0x1a8) = *(undefined8 *)(unaff_R13 + 0x20);
        uVar13 = *(undefined4 *)(unaff_R13 + 0x5c);
        lVar10 = *(long *)(unaff_RBP + 0x60);
        if (lVar10 == *(long *)(unaff_RBP + 0x50)) {
          *(undefined8 *)(unaff_RBP + 0x268) = *(undefined8 *)(unaff_RBP + 0x278);
          *(undefined8 *)(unaff_RBP + 0x260) = *(undefined8 *)(unaff_RBP + 0x280);
          *(undefined8 *)(unaff_RBP + 600) = *(undefined8 *)(unaff_RBP + 0x288);
          *(undefined8 *)(unaff_RBP + 0x250) = *(undefined8 *)(unaff_RBP + 0x290);
          *(undefined1 *)(unaff_RBP + 0x2a7) = 1;
          *(undefined1 *)(unaff_RBP + 0x2a6) = 1;
          *(undefined1 *)(unaff_RBP + 0x2a5) = 1;
          *(undefined1 *)(unaff_RBP + 0x2a4) = 1;
          *(undefined1 *)(unaff_RBP + 0x2a3) = 1;
          *(undefined1 *)(unaff_RBP + 0x2a2) = 1;
          *(undefined1 *)(unaff_RBP + 0x2a1) = 1;
          *(undefined1 *)(unaff_RBP + 0x2a0) = 1;
          *(undefined1 *)(unaff_RBP + 0x29f) = 1;
          func_0x000145c0dcb0();
        }
        lVar4 = *(long *)(unaff_RBP + 0x58);
        lVar9 = lVar10 * 0x10;
        *(undefined8 *)(lVar4 + lVar9) = *(undefined8 *)(unaff_RBP + 0x1a8);
        *(undefined4 *)(lVar4 + 8 + lVar9) = uVar12;
        *(undefined4 *)(lVar4 + 0xc + lVar9) = uVar13;
        *(long *)(unaff_RBP + 0x60) = lVar10 + 1;
        *(float *)(unaff_RBP + 0x238) = *(float *)(unaff_RBP + 0x238) + fVar11;
      }
    }
    else if (iVar3 == 3) {
      if (*(float *)(unaff_R13 + 0x14) <= *(float *)(unaff_RBP + 0x234)) {
        if (*(long *)(unaff_RBP + 0x1c0) == *(long *)(unaff_RBP + 0x1b0)) {
          *(undefined8 *)(unaff_RBP + 0x268) = *(undefined8 *)(unaff_RBP + 0x278);
          *(undefined8 *)(unaff_RBP + 0x260) = *(undefined8 *)(unaff_RBP + 0x280);
          *(undefined8 *)(unaff_RBP + 600) = *(undefined8 *)(unaff_RBP + 0x288);
          *(undefined8 *)(unaff_RBP + 0x250) = *(undefined8 *)(unaff_RBP + 0x290);
          *(undefined1 *)(unaff_RBP + 0x2a7) = 1;
          *(undefined1 *)(unaff_RBP + 0x2a6) = 1;
          *(undefined1 *)(unaff_RBP + 0x2a5) = 1;
          *(undefined1 *)(unaff_RBP + 0x2a4) = 1;
          *(undefined1 *)(unaff_RBP + 0x2a3) = 1;
          *(undefined1 *)(unaff_RBP + 0x2a2) = 1;
          *(undefined1 *)(unaff_RBP + 0x2a1) = 1;
          *(undefined1 *)(unaff_RBP + 0x2a0) = 1;
          *(undefined1 *)(unaff_RBP + 0x29f) = 1;
          func_0x000145c0d930();
          halt_baddata();
        }
        halt_baddata();
      }
      if (*(float *)(unaff_R13 + 0x68) <= *(float *)(unaff_RBP + 0x234)) {
        *(float *)(unaff_R13 + 0x68) = *(float *)(unaff_R13 + 0x68) + *(float *)(unaff_R13 + 0x18);
        func_0x000145c0a42f(in_XMM9_Da - (float)*(undefined8 *)(unaff_R13 + 0x40),
                            in_XMM9_Db - (float)((ulong)*(undefined8 *)(unaff_R13 + 0x40) >> 0x20));
                    /* WARNING: Could not recover jumptable at 0x000145919353. Too many branches */
                    /* WARNING: Treating indirect jump as call */
        (*(code *)((long)*(int *)((ulong)*(uint *)(unaff_R13 + 0x30) * 4 + 0x146c0c2a8) +
                  0x146c0c2a8))();
        return;
      }
    }
    else if (iVar3 == 2) {
      if (*(float *)(unaff_R13 + 0x14) <= *(float *)(unaff_RBP + 0x234)) {
        if (*(long *)(unaff_RBP + 0x1c0) == *(long *)(unaff_RBP + 0x1b0)) {
          *(undefined8 *)(unaff_RBP + 0x268) = *(undefined8 *)(unaff_RBP + 0x278);
          *(undefined8 *)(unaff_RBP + 0x260) = *(undefined8 *)(unaff_RBP + 0x280);
          *(undefined8 *)(unaff_RBP + 600) = *(undefined8 *)(unaff_RBP + 0x288);
          *(undefined8 *)(unaff_RBP + 0x250) = *(undefined8 *)(unaff_RBP + 0x290);
          *(undefined1 *)(unaff_RBP + 0x2a7) = 1;
          *(undefined1 *)(unaff_RBP + 0x2a6) = 1;
          *(undefined1 *)(unaff_RBP + 0x2a5) = 1;
          *(undefined1 *)(unaff_RBP + 0x2a4) = 1;
          *(undefined1 *)(unaff_RBP + 0x2a3) = 1;
          *(undefined1 *)(unaff_RBP + 0x2a2) = 1;
          *(undefined1 *)(unaff_RBP + 0x2a1) = 1;
          *(undefined1 *)(unaff_RBP + 0x2a0) = 1;
          *(undefined1 *)(unaff_RBP + 0x29f) = 1;
          func_0x000145c0d930();
          halt_baddata();
        }
        halt_baddata();
      }
      fVar11 = *(float *)(unaff_R13 + 0x68);
      if (fVar11 <= *(float *)(unaff_RBP + 0x234)) {
        *(undefined4 *)(unaff_RBP + 0x270) = *(undefined4 *)(unaff_R13 + 0x18);
        *(float *)(unaff_R13 + 0x68) = fVar11 + _DAT_145dad260;
        func_0x000145c0a42f(in_XMM9_Da - (float)*(undefined8 *)(unaff_R13 + 0x40),
                            in_XMM9_Db - (float)((ulong)*(undefined8 *)(unaff_R13 + 0x40) >> 0x20));
                    /* WARNING: Could not recover jumptable at 0x0001459192d7. Too many branches */
                    /* WARNING: Treating indirect jump as call */
        (*(code *)((long)*(int *)((ulong)*(uint *)(unaff_R13 + 0x30) * 4 + 0x146c0c2b8) +
                  0x146c0c2b8))();
        return;
      }
    }
  }
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}
