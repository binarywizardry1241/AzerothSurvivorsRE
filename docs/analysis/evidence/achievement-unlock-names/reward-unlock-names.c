void entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined1 (*param_4) [16])

{
  long lVar1;
  undefined8 *puVar2;
  undefined1 auVar3 [16];
  undefined1 auVar4 [16];
  undefined1 auVar5 [16];
  int iVar6;
  long lVar7;
  long lVar8;
  undefined8 uVar9;
  undefined8 uVar10;
  long lVar11;
  undefined8 uVar12;
  long *plVar13;
  undefined8 *puVar14;
  long lVar15;
  undefined1 auVar16 [16];
  undefined1 auVar17 [16];
  undefined1 auVar18 [16];
  undefined1 auVar19 [16];
  long local_70;
  undefined8 local_58;

  lVar15 = *param_3;
  if (lVar15 == -1) goto LAB_145c3ec0c;
  if (lVar15 == 0) {
LAB_145c3e9e6:
    puVar14 = (undefined8 *)param_3[0x13];
    if ((puVar14 != (undefined8 *)0x0) && (puVar2 = (undefined8 *)param_3[0x14], puVar14 != puVar2))
    {
      lVar15 = param_3[0x16];
      do {
        if (((puVar14[4] != 0) && (puVar14[5] == lVar15)) &&
           (iVar6 = func_0x000145f941e7(), iVar6 == 0)) {
          param_3[0x13] = (long)(puVar14 + 8);
          auVar16 = func_0x000145b29ab0();
          if (auVar16._0_8_ == 0) {
            auVar16._8_8_ = 6;
            auVar16._0_8_ = 0x1475e9295;
          }
          local_58 = auVar16._8_8_;
          uVar12 = auVar16._0_8_;
          func_0x000145f66f30();
          uVar9 = *puVar14;
          uVar10 = puVar14[1];
          auVar16 = func_0x000145b29ab0();
          goto LAB_145c3ebad;
        }
        puVar14 = puVar14 + 8;
      } while (puVar14 != puVar2);
      param_3[0x13] = (long)puVar14;
    }
    *param_3 = 2;
  }
  else if ((int)lVar15 != 2) {
    lVar15 = param_3[1];
    if (lVar15 != 0) {
      lVar11 = param_3[2];
      if (lVar15 != lVar11) {
        lVar1 = *(long *)(param_3[3] + 8);
        do {
          lVar7 = lVar15 + 0x78;
          if (((*(long *)(lVar15 + 0x58) == lVar1) && (iVar6 = func_0x000145f941e7(), iVar6 == 0))
             && ((*(long *)(lVar15 + 0x60) == 0 ||
                 (((lVar8 = func_0x000145b44e90(), lVar8 == 0 || (*(long *)(lVar8 + 0x58) != lVar1))
                  || (iVar6 = func_0x000145f941e7(), iVar6 != 0)))))) {
            param_3[1] = lVar7;
            auVar16 = func_0x000145b29ab0();
            uVar9 = auVar16._8_8_;
            lVar11 = auVar16._0_8_;
            auVar18 = *(undefined1 (*) [16])(lVar15 + 0x10);
            auVar16 = func_0x000145b29ab0();
            if (lVar11 == 0) {
              lVar11 = 0x1475e92a4;
              uVar9 = 7;
            }
            auVar3._8_8_ = uVar9;
            auVar3._0_8_ = lVar11;
            auVar17._8_8_ = uVar9;
            auVar17._0_8_ = lVar11;
            lVar11 = *(long *)(lVar15 + 0x20);
            lVar15 = *(long *)(lVar15 + 0x28);
            if (auVar16._0_8_ == 0) {
              auVar16 = auVar18;
              auVar17 = auVar3;
            }
            goto LAB_145c3ebe2;
          }
          lVar15 = lVar7;
        } while (lVar7 != lVar11);
        param_3[1] = lVar7;
      }
      param_3[1] = 0;
    }
    if (param_3[4] != 0) {
      lVar15 = param_3[5];
      lVar11 = param_3[6];
      if (lVar15 != lVar11) {
        lVar1 = *(long *)(param_3[4] + 8);
        plVar13 = param_3 + lVar15 * 6 + 0xc;
        do {
          if ((plVar13[-4] == lVar1) && (iVar6 = func_0x000145f941e7(), iVar6 == 0)) {
            param_3[5] = lVar15 + 1;
            auVar18 = *(undefined1 (*) [16])(plVar13 + -3);
            auVar16 = *(undefined1 (*) [16])(plVar13 + -3);
            lVar11 = plVar13[-1];
            lVar15 = *plVar13;
            auVar17 = func_0x000145b29ab0();
            if (auVar17._0_8_ == 0) {
              auVar17._8_8_ = 7;
              auVar17._0_8_ = 0x1475e92a4;
              auVar16 = auVar18;
            }
            goto LAB_145c3ebe2;
          }
          lVar15 = lVar15 + 1;
          plVar13 = plVar13 + 6;
        } while (lVar11 != lVar15);
        param_3[5] = lVar11;
      }
    }
    *param_3 = 0;
    goto LAB_145c3e9e6;
  }
  puVar14 = (undefined8 *)param_3[0x17];
  if ((puVar14 != (undefined8 *)0x0) && (puVar2 = (undefined8 *)param_3[0x18], puVar14 != puVar2)) {
    lVar15 = *(long *)(param_3[0x19] + 8);
    do {
      if ((puVar14[5] == lVar15) && (iVar6 = func_0x000145f941e7(), iVar6 == 0)) {
        param_3[0x17] = (long)(puVar14 + 8);
        auVar18 = func_0x000145b29ab0();
        if (auVar18._0_8_ == 0) {
          auVar18._8_8_ = 6;
          auVar18._0_8_ = 0x1475e9295;
        }
        local_58 = auVar18._8_8_;
        uVar12 = auVar18._0_8_;
        func_0x000145f66f30();
        uVar9 = *puVar14;
        uVar10 = puVar14[1];
        auVar16 = func_0x000145b29ab0();
LAB_145c3ebad:
        auVar4._8_8_ = uVar10;
        auVar4._0_8_ = uVar9;
        if (local_70 != 0) {
          func_0x0001400021d0();
        }
        auVar17._8_8_ = local_58;
        auVar17._0_8_ = uVar12;
        if (auVar16._0_8_ == 0) {
          auVar16 = auVar4;
        }
        lVar11 = puVar14[2];
        lVar15 = puVar14[3];
LAB_145c3ebe2:
        *param_4 = auVar17;
        param_4[1] = auVar16;
        *(long *)param_4[2] = lVar11;
        *(long *)(param_4[2] + 8) = lVar15;
        return;
      }
      puVar14 = puVar14 + 8;
    } while (puVar14 != puVar2);
    param_3[0x17] = (long)puVar14;
  }
  *param_3 = -1;
LAB_145c3ec0c:
  lVar15 = param_3[0x1a];
  if ((lVar15 != 0) && (lVar11 = param_3[0x1b], lVar15 != lVar11)) {
    lVar1 = param_3[0x1d];
    do {
      if (((*(long *)(lVar15 + 0x40) != 0) && (*(long *)(lVar15 + 0x48) == lVar1)) &&
         (iVar6 = func_0x000145f941e7(), iVar6 == 0)) {
        param_3[0x1a] = lVar15 + 0x60;
        uVar9 = 0x1475e929b;
        auVar19 = func_0x000145b29ab0();
        if (auVar19._0_8_ == 0) {
          auVar19._8_8_ = 9;
          auVar19._0_8_ = uVar9;
        }
        uVar9 = *(undefined8 *)(lVar15 + 0x10);
        uVar10 = *(undefined8 *)(lVar15 + 0x18);
        auVar16 = func_0x000145b29ab0();
        auVar5._8_8_ = uVar10;
        auVar5._0_8_ = uVar9;
        if (auVar16._0_8_ == 0) {
          auVar16 = auVar5;
        }
        uVar9 = *(undefined8 *)(lVar15 + 0x30);
        uVar10 = *(undefined8 *)(lVar15 + 0x38);
        *param_4 = auVar19;
        param_4[1] = auVar16;
        *(undefined8 *)param_4[2] = uVar9;
        *(undefined8 *)(param_4[2] + 8) = uVar10;
        return;
      }
      lVar15 = lVar15 + 0x60;
    } while (lVar15 != lVar11);
    param_3[0x1a] = lVar15;
  }
  *(undefined8 *)*param_4 = 0;
  return;
}
