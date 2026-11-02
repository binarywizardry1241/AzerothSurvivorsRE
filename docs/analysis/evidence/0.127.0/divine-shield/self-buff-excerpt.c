/* Selected current self-buff interior; omitted unrelated arms. Not an original function signature. */
  fVar25 = _DAT_146233128 * *(float *)(param_2 + 0xb) * *(float *)(unaff_R12 + 0x20) *
           *(float *)(unaff_R12 + 0x48);
  if (((param_2[1] == 0xd) &&
      (*(long *)(*param_2 + 5) == 0x646c656968735f65 && *(long *)*param_2 == 0x735f656e69766964)) &&
     (_DAT_1462330f0 <= fVar25)) {
    fVar25 = _DAT_1462330f0;
  }
  if (fVar25 <= _DAT_146258c70) {
    fVar25 = _DAT_146258c70;
  }
  fVar27 = *(float *)(param_1 + 0xcc0);
  if (uVar4 == 0xc) {
    if (in_XMM8_Da * _DAT_14624caa0 < *(float *)(param_1 + 0x538)) {
      return 0;
    }
    if ((param_2[1] == 0xd) &&
       (*(long *)(*param_2 + 5) == 0x646c656968735f65 && *(long *)*param_2 == 0x735f656e69766964)) {
      if (fVar27 < *(float *)(param_1 + 0x540) + _DAT_146233150) {
        return 0;
      }
      *(float *)(param_1 + 0x540) = fVar27;
      func_0x000145ce5f30(param_1,param_2,param_2,param_1 + 0x3d0);
    }
    *(undefined8 *)(unaff_RBP + 0x100) = *(undefined8 *)(param_1 + 0x4b0);
    *(undefined4 *)(unaff_RBP + 0x130) = 2;
    *(undefined4 *)(unaff_RBP + 0x48) = 0;
    func_0x000145b03330();
    func_0x000145bda7d0();
    uVar17 = (undefined4)param_2[8];
    func_0x000145c0c6c0();
    fVar27 = fVar27 + fVar25;
    lVar18 = *(long *)(param_1 + 0x3e0);
    if (lVar18 == *(long *)(param_1 + 0x3d0)) {
      func_0x000146061ee0();
    }
    lVar13 = *(long *)(param_1 + 0x3d8);
    lVar16 = lVar18 * 0x20;
    *(undefined8 *)(lVar13 + lVar16) = 0;
    *(undefined8 *)(lVar13 + 8 + lVar16) = *(undefined8 *)(unaff_RBP + 0x80);
    *(undefined4 *)(lVar13 + 0x10 + lVar16) = *(undefined4 *)(unaff_RBP + 0x88);
    *(undefined4 *)(lVar13 + 0x14 + lVar16) = uVar17;
    *(float *)(lVar13 + 0x18 + lVar16) = fVar27;
    *(undefined4 *)(lVar13 + 0x1c + lVar16) = 0;
    *(long *)(param_1 + 0x3e0) = lVar18 + 1;
    func_0x000145c0d580();
    return 1;
  }
