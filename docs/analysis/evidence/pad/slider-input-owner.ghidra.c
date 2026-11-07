/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,float param_3,undefined8 param_4,undefined8 param_5
          ,ulong param_6,long param_7)

{
  ulong *puVar1;
  undefined8 *puVar2;
  long lVar3;
  code *pcVar4;
  long lVar5;
  ulong uVar6;
  long lVar7;
  float fVar8;
  float fVar9;
  undefined1 auVar11 [16];
  float fVar12;
  undefined8 uStack_98;
  undefined8 local_90;
  undefined8 uStack_88;
  ulong uStack_78;
  undefined8 local_70;
  ulong uVar10;

  if (((param_6 < 0x69) && (lVar5 = param_6 * 0x98, *(ulong *)(lVar5 + 0x145dc2290) < 5)) &&
     (*(long *)(param_7 + 0xb0) != -1)) {
    auVar11 = ZEXT416(*(uint *)(lVar5 + 0x145dc22a8));
    uVar10 = (ulong)*(uint *)(lVar5 + 0x145dc22a8);
    fVar8 = *(float *)(lVar5 + 0x145dc22ac);
    fVar12 = *(float *)(lVar5 + 0x145dc22b0);
    if (param_6 < *(ulong *)(param_7 + 0xc0)) {
      uVar6 = func_0x000145bebbd0(param_6,param_7,
                                  *(undefined8 *)(*(long *)(param_7 + 0xb8) + 0x10 + param_6 * 0x18)
                                  ,*(undefined8 *)(*(long *)(param_7 + 0xb8) + 8 + param_6 * 0x18));
      uVar10 = auVar11._0_8_;
      if ((uVar6 & 1) == 0) {
        uVar10 = uVar6 >> 0x20;
      }
    }
    fVar9 = auVar11._0_4_;
    if (fVar8 < fVar9) {
      func_0x000145da9a60();
                    /* WARNING: Does not return */
      pcVar4 = (code *)invalidInstructionException();
      (*pcVar4)();
    }
    if (fVar12 <= 0.0) {
      fVar12 = (fVar8 - fVar9) / _DAT_145db1734;
    }
    fVar12 = param_3 * fVar12 + (float)uVar10;
    if (fVar9 <= fVar12) {
      auVar11._0_4_ = fVar12;
    }
    if (auVar11._0_4_ <= fVar8) {
      fVar8 = auVar11._0_4_;
    }
    func_0x00014012bfd0(uVar10,fVar8);
    lVar5 = *(long *)(param_7 + 0x40);
    if (lVar5 == *(long *)(param_7 + 0x30)) {
      func_0x000145c0db60();
    }
    lVar3 = *(long *)(param_7 + 0x38);
    lVar7 = lVar5 * 0x38;
    *(undefined8 *)(lVar3 + 0x30 + lVar7) = local_70;
    puVar1 = (ulong *)(lVar3 + 0x20 + lVar7);
    *puVar1 = param_6;
    puVar1[1] = uStack_78;
    puVar2 = (undefined8 *)(lVar3 + 0x10 + lVar7);
    *puVar2 = local_90;
    puVar2[1] = uStack_88;
    *(undefined8 *)(lVar3 + lVar7) = 0x8000000000000000;
    ((undefined8 *)(lVar3 + lVar7))[1] = uStack_98;
    *(long *)(param_7 + 0x40) = lVar5 + 1;
  }
  return;
}
