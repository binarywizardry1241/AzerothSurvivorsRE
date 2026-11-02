undefined4 * FUN_145c093a0(undefined4 *param_1,longlong param_2)

{
  float fVar1;
  float fVar2;
  float fVar3;
  longlong lVar4;
  longlong *plVar5;
  undefined8 uVar6;
  code *pcVar7;
  longlong lVar8;
  int iVar9;
  longlong lVar10;
  undefined8 *puVar11;
  longlong lVar12;
  longlong lVar13;
  longlong *plVar14;
  float fVar15;
  undefined8 uStack_d0;
  undefined8 uStack_c8;
  longlong lStack_c0;
  longlong lStack_b8;
  longlong lStack_b0;
  longlong lStack_a8;
  longlong lStack_a0;
  undefined4 *puStack_98;
  longlong *plStack_90;
  longlong lStack_88;
  longlong lStack_80;
  longlong lStack_78;
  undefined8 uStack_70;
  
  uStack_70 = 0xfffffffffffffffe;
  lStack_88 = 0;
  lStack_80 = 8;
  lStack_78 = 0;
  lVar4 = *(longlong *)(param_2 + 0x650);
  plVar5 = *(longlong **)(param_2 + 0x648);
  fVar1 = *(float *)(param_2 + 0xcc0);
  plVar14 = plVar5;
LAB_145c09400:
  do {
    while( true ) {
      lVar10 = lStack_78;
      lVar12 = lStack_80;
      if (plVar14 == plVar5 + lVar4 * 0xf) {
        lVar4 = lStack_78 * 0x18;
        if (lStack_78 == 0) {
          lStack_c0 = 8;
        }
        else {
          func_0x000140002200();
          lStack_c0 = func_0x0001400021c0(lVar4,8);
          if (lStack_c0 == 0) {
            FUN_1461bb08b(8,lVar4);
                    /* WARNING: Does not return */
            pcVar7 = (code *)invalidInstructionException();
            (*pcVar7)();
          }
        }
        lStack_b8 = lVar10;
        uStack_d0 = &lStack_a8;
        lStack_a8 = 0;
        uStack_c8 = 0;
        lStack_b0 = lStack_c0;
        FUN_145cd5c00(lVar12,lVar4 + lVar12,&uStack_d0);
        lVar10 = lStack_a8;
        lVar12 = lStack_b0;
        lVar4 = lStack_b8;
        FUN_145aadfa0(&uStack_d0,lStack_b0,lStack_a8,&DAT_1476c6639,1);
        *(longlong *)(param_1 + 4) = lStack_c0;
        *param_1 = (undefined4)uStack_d0;
        param_1[1] = uStack_d0._4_4_;
        param_1[2] = (undefined4)uStack_c8;
        param_1[3] = uStack_c8._4_4_;
        if (lStack_88 != 0) {
          func_0x0001400021d0(lStack_80,lStack_88 * 0x18,8);
        }
        if (lVar10 != 0) {
          puVar11 = (undefined8 *)(lVar12 + 8);
          do {
            if (puVar11[-1] != 0) {
              func_0x0001400021d0(*puVar11,puVar11[-1],1);
            }
            puVar11 = puVar11 + 3;
            lVar10 = lVar10 + -1;
          } while (lVar10 != 0);
        }
        if (lVar4 != 0) {
          func_0x0001400021d0(lVar12,lVar4 * 0x18,8);
        }
        return param_1;
      }
      fVar2 = *(float *)((longlong)plVar14 + 0x6c);
      if (fVar1 < fVar2) break;
      plVar14 = plVar14 + 0xf;
    }
    plStack_90 = plVar14 + 0xf;
    lStack_a0 = lStack_78;
    puStack_98 = param_1;
    if (lStack_78 != 0) {
      lVar8 = lStack_78 * 0x18;
      uVar6 = *(undefined8 *)*plVar14;
      lVar10 = ((undefined8 *)*plVar14)[1];
      lVar13 = 0;
      do {
        if (((undefined8 *)**(longlong **)(lVar12 + lVar13))[1] == lVar10) {
          iVar9 = func_0x000146011e21(*(undefined8 *)**(longlong **)(lVar12 + lVar13),uVar6,lVar10);
          if (iVar9 == 0) {
            fVar3 = *(float *)(lVar12 + 0x10 + lVar13);
            fVar15 = fVar3;
            if (fVar2 <= fVar3) {
              fVar15 = fVar2;
            }
            plVar14 = (longlong *)(lVar12 + 8 + lVar13);
            *plVar14 = *plVar14 + 1;
            *(uint *)(lVar12 + 0x10 + lVar13) =
                 ~-(uint)NAN(fVar15) & (uint)fVar15 | (uint)fVar3 & -(uint)NAN(fVar15);
            plVar14 = plStack_90;
            param_1 = puStack_98;
            goto LAB_145c09400;
          }
        }
        lVar13 = lVar13 + 0x18;
      } while (lVar8 != lVar13);
    }
    param_1 = puStack_98;
    lVar10 = lStack_a0;
    if (lStack_a0 == lStack_88) {
      FUN_146015860(&lStack_88);
      lVar12 = lStack_80;
    }
    *(longlong **)(lVar12 + lVar10 * 0x18) = plVar14;
    *(undefined8 *)(lVar12 + 8 + lVar10 * 0x18) = 1;
    *(float *)(lVar12 + 0x10 + lVar10 * 0x18) = fVar2;
    lStack_78 = lVar10 + 1;
    plVar14 = plStack_90;
  } while( true );
}
