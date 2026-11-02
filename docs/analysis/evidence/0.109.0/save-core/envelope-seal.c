undefined8
FUN_1458f6c40(undefined8 param_1,undefined8 param_2,undefined8 param_3,undefined8 param_4,
             long param_5)

{
  undefined4 *puVar1;
  undefined1 uVar2;
  ulong uVar3;
  code *pcVar4;
  long *plVar5;
  undefined4 *puVar6;
  long lVar7;
  undefined1 uVar8;
  long *plVar9;
  undefined1 uVar10;
  long lVar11;
  undefined8 uVar12;
  undefined1 uVar13;
  undefined1 uVar14;
  undefined1 uVar15;
  undefined1 uVar16;
  undefined1 uVar17;
  undefined1 uVar18;
  undefined1 uVar19;
  undefined4 uStack_ec;
  undefined4 uStack_e8;
  undefined4 uStack_e4;
  undefined4 uStack_e0;
  undefined4 uStack_dc;
  long alStack_d8 [3];
  undefined8 uStack_c0;
  undefined8 uStack_b8;
  long *plStack_b0;
  undefined8 uStack_a8;
  long *plStack_a0;
  undefined1 *puStack_98;
  long lStack_90;
  long lStack_88;
  long lStack_80;
  undefined4 *puStack_78;
  long lStack_70;
  long lStack_68;
  undefined4 uStack_60;
  undefined4 uStack_5c;
  undefined4 uStack_58;
  undefined4 uStack_54;
  undefined1 uStack_50;
  undefined1 uStack_4f;
  undefined1 uStack_4e;
  undefined1 uStack_4d;
  undefined1 uStack_4c;
  undefined1 uStack_4b;
  undefined1 uStack_4a;
  undefined1 uStack_49;
  undefined8 uStack_48;

  uStack_48 = 0xfffffffffffffffe;
  uStack_c0 = param_3;
  lStack_80 = param_5;
  plVar5 = (long *)func_0x000145a5f770();
  plVar9 = plVar5 + 2;
  uVar3 = plVar5[0x22];
  uStack_b8 = param_4;
  plStack_b0 = plVar5;
  if (uVar3 < 0x40) {
    lStack_68 = CONCAT71(lStack_68._1_7_,*(undefined1 *)((long)plVar5 + uVar3 * 4 + 0x10));
    plVar5[0x22] = uVar3 + 1;
    if (uVar3 == 0x3f) {
      if ((plVar5[0x2b] < 1) || (plVar5[0x2c] < 0)) {
        lVar11 = 0;
        func_0x000145a5f630();
      }
      else {
        plVar5[0x2b] = plVar5[0x2b] + -0x100;
        func_0x000145a5fb10();
        lVar11 = 0;
      }
      goto LAB_1458f6d53;
    }
    puStack_78 = (undefined4 *)
                 CONCAT71(puStack_78._1_7_,*(undefined1 *)((long)plVar5 + uVar3 * 4 + 0x14));
    plVar5[0x22] = uVar3 + 2;
    if (0x3d < uVar3) {
      if ((plVar5[0x2b] < 1) || (plVar5[0x2c] < 0)) {
        func_0x000145a5f630();
      }
      else {
        plVar5[0x2b] = plVar5[0x2b] + -0x100;
        func_0x000145a5fb10();
      }
      lStack_70 = CONCAT71(lStack_70._1_7_,(char)*plVar9);
      lVar11 = 1;
LAB_1458f717f:
      lVar7 = lVar11 * 4;
      lVar11 = lVar11 + 1;
      goto LAB_1458f6d6e;
    }
    lStack_70 = CONCAT71(lStack_70._1_7_,*(undefined1 *)((long)plVar5 + uVar3 * 4 + 0x18));
    plVar5[0x22] = uVar3 + 3;
    if (uVar3 == 0x3d) {
      if ((plVar5[0x2b] < 1) || (plVar5[0x2c] < 0)) {
        lVar11 = 0;
        func_0x000145a5f630();
      }
      else {
        plVar5[0x2b] = plVar5[0x2b] + -0x100;
        func_0x000145a5fb10();
        lVar11 = 0;
      }
      goto LAB_1458f717f;
    }
    uStack_50 = *(undefined1 *)((long)plVar5 + uVar3 * 4 + 0x1c);
    plVar5[0x22] = uVar3 + 4;
    if (uVar3 + 2 == 0x3e) {
      if ((plVar5[0x2b] < 1) || (plVar5[0x2c] < 0)) {
        func_0x000145a5f630();
      }
      else {
        plVar5[0x2b] = plVar5[0x2b] + -0x100;
        func_0x000145a5fb10();
      }
      lVar7 = 1;
      uVar8 = (char)*plVar9;
LAB_1458f7240:
      lVar11 = lVar7 + 1;
      goto LAB_1458f6d90;
    }
    uStack_49 = *(undefined1 *)((long)plVar5 + uVar3 * 4 + 0x20);
    plVar5[0x22] = uVar3 + 5;
    if (0x3a < uVar3) {
      func_0x000145914d30();
      lVar7 = 0;
      uVar8 = uStack_49;
      goto LAB_1458f7240;
    }
    uStack_4a = *(undefined1 *)((long)plVar5 + uVar3 * 4 + 0x24);
    plVar5[0x22] = uVar3 + 6;
    if (uVar3 + 4 == 0x3e) {
      func_0x000145914d30();
      uVar14 = (undefined1)*plVar9;
      lVar7 = 1;
LAB_1458f72c1:
      lVar11 = lVar7 + 1;
      uVar13 = uStack_4a;
      uVar8 = uStack_49;
      goto LAB_1458f6db2;
    }
    uVar14 = *(undefined1 *)((long)plVar5 + uVar3 * 4 + 0x28);
    plVar5[0x22] = uVar3 + 7;
    if (0x38 < uVar3) {
      func_0x000145914d30();
      lVar7 = 0;
      goto LAB_1458f72c1;
    }
    uVar15 = *(undefined1 *)((long)plVar5 + uVar3 * 4 + 0x2c);
    plVar5[0x22] = uVar3 + 8;
    if (uVar3 + 6 == 0x3e) {
      func_0x000145914d30(uVar15,uVar14,plVar9,plVar5 + 0x24);
      uVar16 = (undefined1)*plVar9;
      lVar7 = 1;
LAB_1458f7357:
      lVar11 = lVar7 + 1;
      uVar13 = uStack_4a;
      uVar8 = uStack_49;
      goto LAB_1458f6dd4;
    }
    uVar16 = *(undefined1 *)((long)plVar5 + uVar3 * 4 + 0x30);
    plVar5[0x22] = uVar3 + 9;
    if (0x36 < uVar3) {
      func_0x000145914d30(uVar15,uVar14,plVar9,plVar5 + 0x24);
      lVar7 = 0;
      goto LAB_1458f7357;
    }
    uStack_4f = *(undefined1 *)((long)plVar5 + uVar3 * 4 + 0x34);
    plVar5[0x22] = uVar3 + 10;
    if (uVar3 + 8 == 0x3e) {
      func_0x000145914d30(uVar15,uVar14,plVar9,plVar5 + 0x24);
      uStack_4e = (undefined1)*plVar9;
      lVar7 = 1;
LAB_1458f73fc:
      lVar11 = lVar7 + 1;
      uVar13 = uStack_4a;
      uVar8 = uStack_49;
      goto LAB_1458f6dfc;
    }
    uStack_4e = *(undefined1 *)((long)plVar5 + uVar3 * 4 + 0x38);
    plVar5[0x22] = uVar3 + 0xb;
    if (0x34 < uVar3) {
      func_0x000145914d30(uVar15,uVar14,plVar9,plVar5 + 0x24);
      lVar7 = 0;
      goto LAB_1458f73fc;
    }
    uVar18 = *(undefined1 *)((long)plVar5 + uVar3 * 4 + 0x3c);
    plVar5[0x22] = uVar3 + 0xc;
    if (uVar3 + 10 == 0x3e) {
      func_0x000145914d30(uVar15,uVar14,plVar9,plVar5 + 0x24);
      uVar10 = (undefined1)*plVar9;
      lVar7 = 1;
LAB_1458f74a0:
      lVar11 = lVar7 + 1;
      uVar13 = uStack_4a;
      uVar8 = uStack_49;
      goto LAB_1458f6e1e;
    }
    uVar10 = *(undefined1 *)((long)plVar5 + uVar3 * 4 + 0x40);
    plVar5[0x22] = uVar3 + 0xd;
    uStack_4d = uVar14;
    uStack_4c = uVar15;
    uStack_4b = uVar16;
    if (0x32 < uVar3) {
      func_0x000145914d30();
      lVar7 = 0;
      uVar16 = uStack_4b;
      uVar15 = uStack_4c;
      uVar14 = uStack_4d;
      goto LAB_1458f74a0;
    }
    uVar19 = (undefined1)*(undefined4 *)((long)plVar5 + uVar3 * 4 + 0x44);
    plVar5[0x22] = uVar3 + 0xe;
    if (uVar3 + 0xc == 0x3e) {
      lVar11 = 1;
      func_0x000145914d30(1,uVar10,plVar9,plVar5 + 0x24);
      uVar16 = uStack_4b;
      uVar15 = uStack_4c;
      uVar13 = uStack_4a;
      uVar8 = uStack_49;
      uVar14 = uStack_4d;
      goto LAB_1458f6e31;
    }
    uVar17 = (undefined1)*(undefined4 *)((long)plVar5 + uVar3 * 4 + 0x48);
    lVar11 = uVar3 + 0xf;
    plVar5[0x22] = lVar11;
    uVar8 = uStack_49;
    uVar13 = uStack_4a;
    if (0x30 < uVar3) {
      func_0x000145914d30(lVar11,uVar10,plVar9,plVar5 + 0x24);
      lVar11 = 0;
      uVar16 = uStack_4b;
      uVar15 = uStack_4c;
      uVar8 = uStack_49;
      uVar13 = uStack_4a;
      uVar14 = uStack_4d;
    }
  }
  else {
    if ((plVar5[0x2b] < 1) || (plVar5[0x2c] < 0)) {
      func_0x000145a5f630();
    }
    else {
      plVar5[0x2b] = plVar5[0x2b] + -0x100;
      func_0x000145a5fb10();
    }
    lStack_68 = CONCAT71(lStack_68._1_7_,(char)*plVar9);
    lVar11 = 1;
LAB_1458f6d53:
    puStack_78 = (undefined4 *)CONCAT71(puStack_78._1_7_,*(undefined1 *)((long)plVar9 + lVar11 * 4))
    ;
    lStack_70 = CONCAT71(lStack_70._1_7_,*(undefined1 *)((long)plVar5 + lVar11 * 4 + 0x14));
    lVar7 = lVar11 * 4 + 8;
    lVar11 = lVar11 + 3;
LAB_1458f6d6e:
    uStack_50 = *(undefined1 *)((long)plVar9 + lVar7);
    plVar5[0x22] = lVar11;
    uVar8 = *(undefined1 *)((long)plVar5 + lVar11 * 4 + 0x10);
    lVar7 = lVar11 + 1;
    plVar5[0x22] = lVar7;
    lVar11 = lVar11 + 2;
LAB_1458f6d90:
    uVar13 = *(undefined1 *)((long)plVar5 + lVar7 * 4 + 0x10);
    plVar5[0x22] = lVar11;
    uVar14 = *(undefined1 *)((long)plVar5 + lVar11 * 4 + 0x10);
    lVar7 = lVar11 + 1;
    plVar5[0x22] = lVar7;
    lVar11 = lVar11 + 2;
LAB_1458f6db2:
    uVar15 = *(undefined1 *)((long)plVar5 + lVar7 * 4 + 0x10);
    plVar5[0x22] = lVar11;
    uVar16 = *(undefined1 *)((long)plVar5 + lVar11 * 4 + 0x10);
    lVar7 = lVar11 + 1;
    plVar5[0x22] = lVar7;
    lVar11 = lVar11 + 2;
LAB_1458f6dd4:
    uStack_4f = *(undefined1 *)((long)plVar5 + lVar7 * 4 + 0x10);
    plVar5[0x22] = lVar11;
    uStack_4e = *(undefined1 *)((long)plVar5 + lVar11 * 4 + 0x10);
    lVar7 = lVar11 + 1;
    plVar5[0x22] = lVar7;
    lVar11 = lVar11 + 2;
LAB_1458f6dfc:
    uVar18 = *(undefined1 *)((long)plVar5 + lVar7 * 4 + 0x10);
    plVar5[0x22] = lVar11;
    uVar10 = *(undefined1 *)((long)plVar5 + lVar11 * 4 + 0x10);
    lVar7 = lVar11 + 1;
    plVar5[0x22] = lVar7;
    lVar11 = lVar11 + 2;
LAB_1458f6e1e:
    uVar19 = (undefined1)*(undefined4 *)((long)plVar5 + lVar7 * 4 + 0x10);
    plVar5[0x22] = lVar11;
    plVar9 = (long *)((long)plVar9 + lVar11 * 4);
    lVar11 = lVar11 + 1;
LAB_1458f6e31:
    uVar17 = (undefined1)(int)*plVar9;
    plVar5[0x22] = lVar11;
  }
  uVar2 = *(undefined1 *)((long)plVar5 + lVar11 * 4 + 0x10);
  plVar5[0x22] = lVar11 + 1;
  uStack_60 = CONCAT13(uStack_50,
                       CONCAT12((undefined1)lStack_70,
                                CONCAT11(puStack_78._0_1_,(undefined1)lStack_68)));
  uStack_5c = CONCAT13(uVar15,CONCAT12(uVar14,CONCAT11(uVar13,uVar8)));
  uStack_58 = CONCAT13(uVar18,CONCAT12(uStack_4e,CONCAT11(uStack_4f,uVar16)));
  uStack_54 = CONCAT13(uVar2,CONCAT12(uVar17,CONCAT11(uVar19,uVar10)));
  *plStack_b0 = *plStack_b0 + -1;
  if (*plStack_b0 == 0) {
    func_0x000145a5f750();
  }
  if (-1 < lStack_80) {
    if (lStack_80 == 0) {
      lVar11 = 1;
    }
    else {
      func_0x000140002200();
      lVar11 = func_0x0001400021c0();
      if (lVar11 == 0) goto LAB_1458f6eaf;
      func_0x000145bfa0e7();
    }
    puVar6 = &uStack_60;
    lStack_68 = lVar11;
    FUN_1458f6000();
    plStack_b0 = (long *)0x146ed338a;
    uStack_a8 = 3;
    puStack_98 = (undefined1 *)0x10;
    lStack_90 = lStack_68;
    lStack_88 = lStack_80;
    plStack_a0 = (long *)puVar6;
    FUN_1458f6280();
    lVar11 = lStack_80 + 0x24;
    if (-1 < lVar11) {
      lVar7 = lStack_80;
      func_0x000140002200();
      puVar6 = (undefined4 *)func_0x0001400021c0(1);
      if (puVar6 != (undefined4 *)0x0) {
        *puVar6 = uStack_60;
        puVar6[1] = uStack_5c;
        puVar6[2] = uStack_58;
        puVar6[3] = uStack_54;
        if (lVar7 != 0) {
          func_0x000145bfa0e7();
        }
        *(undefined4 *)((long)puVar6 + lVar7 + 0x20) = uStack_dc;
        puVar1 = (undefined4 *)((long)puVar6 + lVar7 + 0x10);
        *puVar1 = uStack_ec;
        puVar1[1] = uStack_e8;
        puVar1[2] = uStack_e4;
        puVar1[3] = uStack_e0;
        plVar9 = alStack_d8;
        puStack_78 = puVar6;
        lStack_70 = lVar11;
        FUN_1458e7ae0();
        func_0x0001400021d0();
        plStack_b0 = (long *)0x146ed3390;
        uStack_a8 = 0x1400020c0;
        puStack_98 = &DAT_1400020e0;
        uVar12 = uStack_b8;
        plStack_a0 = plVar9;
        func_0x000145bcce30();
        lVar11 = lStack_80;
        if (alStack_d8[0] != 0) {
          func_0x0001400021d0();
        }
        if (lVar11 != 0) {
          func_0x0001400021d0();
        }
        return uVar12;
      }
    }
    func_0x000145d992bb();
                    /* WARNING: Does not return */
    pcVar4 = (code *)invalidInstructionException();
    (*pcVar4)();
  }
LAB_1458f6eaf:
  func_0x000145d992bb();
                    /* WARNING: Does not return */
  pcVar4 = (code *)invalidInstructionException();
  (*pcVar4)();
}
