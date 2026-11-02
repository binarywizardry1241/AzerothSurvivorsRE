void entry(undefined8 param_1,undefined8 param_2,long param_3,long *param_4,int param_5)

{
  char cVar1;
  undefined8 *puVar2;
  undefined8 uVar3;
  code *pcVar4;
  undefined1 auVar5 [16];
  undefined1 uVar6;
  long lVar7;
  ulong uVar8;
  undefined8 uVar9;
  long lVar10;
  long lVar11;
  long lVar12;
  long lVar13;
  bool bVar14;
  undefined1 auVar15 [16];
  long local_78 [3];
  undefined8 local_60;
  undefined8 local_50;
  undefined8 local_48;

  local_48 = 0xfffffffffffffffe;
  cVar1 = *(char *)(param_3 + 0x195);
  if (cVar1 == '\x02') {
    puVar2 = *(undefined8 **)(param_3 + 0x170);
    if ((puVar2 == (undefined8 *)0x0) || (puVar2[3] == 0)) {
      *param_4 = -1;
      param_4[1] = 0x146e7918d;
      param_4[2] = 4;
      lVar7 = 0x18;
      lVar11 = 0x146e79191;
      uVar6 = 0;
    }
    else {
      uVar9 = *puVar2;
      uVar3 = puVar2[1];
      auVar15 = func_0x0001458da590(uVar9,param_4,uVar3,uVar9);
      auVar5._8_8_ = uVar3;
      auVar5._0_8_ = uVar9;
      if (auVar15._0_8_ == 0) {
        auVar15 = auVar5;
      }
      lVar11 = puVar2[2];
      lVar7 = puVar2[3];
      *param_4 = -1;
      *(undefined1 (*) [16])(param_4 + 1) = auVar15;
      uVar6 = 0;
    }
    goto LAB_1458f32b9;
  }
  if (cVar1 == '\x03') {
    if ((*(int *)(param_3 + 0x20) == 1) &&
       (uVar8 = *(ulong *)(param_3 + 0x28), uVar8 < *(ulong *)(param_3 + 0x7c8)))
    goto LAB_1458f2fba;
  }
  else if (*(long *)(param_3 + 0x40) == 0) {
    if (((cVar1 == '\x01') && (*(int *)(param_3 + 0x30) == 1)) &&
       (uVar8 = *(ulong *)(param_3 + 0x38), uVar8 < *(ulong *)(param_3 + 0x7c8)))
    goto LAB_1458f2fba;
  }
  else {
    uVar8 = *(ulong *)(param_3 + 0x48);
    if (uVar8 < *(ulong *)(param_3 + 0x7c8)) {
LAB_1458f2fba:
      lVar7 = *(long *)(param_3 + 0x7c0);
      lVar11 = *(long *)(lVar7 + 0x10 + uVar8 * 0x28);
      if (*(long *)(lVar7 + uVar8 * 0x28) == -1) {
        param_4[1] = *(long *)(lVar7 + 8 + uVar8 * 0x28);
        param_4[2] = lVar11;
        *param_4 = -1;
      }
      else {
        if (lVar11 < 0) {
LAB_1458f2fe2:
          func_0x000145d6944b();
                    /* WARNING: Does not return */
          pcVar4 = (code *)invalidInstructionException();
          (*pcVar4)();
        }
        if (lVar11 == 0) {
          lVar12 = 1;
        }
        else {
          func_0x000140002200();
          lVar12 = func_0x0001400021c0();
          if (lVar12 == 0) goto LAB_1458f2fe2;
          func_0x000145bc977b();
        }
        *param_4 = lVar11;
        param_4[1] = lVar12;
        param_4[2] = lVar11;
      }
      lVar7 = lVar7 + uVar8 * 0x28;
      lVar11 = *(long *)(lVar7 + 0x18);
      lVar7 = *(long *)(lVar7 + 0x20);
      uVar6 = 1;
      goto LAB_1458f32b9;
    }
  }
  if (param_5 == 0) {
LAB_1458f319e:
    if (cVar1 == '\x03') {
      uVar6 = 1;
      lVar7 = 0x14;
      lVar11 = 0x146e791e5;
      lVar13 = 7;
      lVar12 = 0x146e791de;
    }
    else {
LAB_1458f326e:
      bVar14 = param_5 != 0;
      lVar12 = 0x146e7920a;
      if (!bVar14) {
        lVar12 = 0x146e791f9;
      }
      lVar11 = 0x146e7920f;
      if (!bVar14) {
        lVar11 = 0x146e791fe;
      }
      lVar7 = (ulong)bVar14 * 9 + 0xc;
      lVar13 = 5;
LAB_1458f32a8:
      uVar6 = 0;
    }
LAB_1458f32aa:
    *param_4 = -1;
    param_4[1] = lVar12;
    param_4[2] = lVar13;
    goto LAB_1458f32b9;
  }
  lVar11 = 0;
  do {
    if (*(long *)(param_3 + 800) * 0x68 - lVar11 == 0) {
      lVar11 = 0;
      goto LAB_1458f30a0;
    }
    lVar13 = *(long *)(*(long *)(param_3 + 0x318) + lVar11);
  } while ((*(int *)(lVar13 + 0x40) != param_5) &&
          (lVar11 = lVar11 + 0x68, *(int *)(lVar13 + 100) != param_5));
  goto LAB_1458f31d1;
  while ((lVar13 = *(long *)(*(long *)(param_3 + 0xb8) + lVar11), *(int *)(lVar13 + 0x40) != param_5
         && (lVar11 = lVar11 + 0x70, *(int *)(lVar13 + 100) != param_5))) {
LAB_1458f30a0:
    if (*(long *)(param_3 + 0xc0) * 0x70 - lVar11 == 0) {
      lVar7 = 0;
      lVar12 = 0;
      lVar11 = 0x146bacbc8;
      goto LAB_1458f30f9;
    }
  }
  goto LAB_1458f31d1;
  while( true ) {
    if ((*(int *)(lVar13 + -0x38) == param_5) || (*(int *)(lVar13 + -0x14) == param_5)) {
      lVar13 = 0x146bacb50 - lVar7;
      break;
    }
    if (lVar7 == -0x3408) {
      lVar7 = 0x13;
      if (param_5 != 0x1d3) {
        if (param_5 != 0x3b85) goto LAB_1458f319e;
        lVar11 = 0x146e791b2;
        lVar13 = 9;
        lVar12 = 0x146e791a9;
        goto LAB_1458f32a8;
      }
      if (cVar1 != '\x03') goto LAB_1458f326e;
      uVar6 = 1;
      lVar11 = 0x146e791cb;
      lVar13 = 6;
      lVar12 = 0x146e791c5;
      goto LAB_1458f32aa;
    }
    if (*(int *)(lVar13 + 0x40) == param_5) {
      lVar13 = lVar12 + 0x146bacbc8;
      break;
    }
    lVar12 = lVar12 + 0x168;
    lVar7 = lVar7 + -0x168;
    lVar11 = lVar13 + 0x168;
    if (*(int *)(lVar13 + 100) == param_5) break;
LAB_1458f30f9:
    lVar13 = lVar11;
    if (*(int *)(lVar13 + -0xb0) == param_5) {
      lVar13 = lVar12 + 0x146bacad8;
      break;
    }
    if (*(int *)(lVar13 + -0x8c) == param_5) {
      lVar13 = lVar13 + -0xf0;
      break;
    }
  }
LAB_1458f31d1:
  local_78[1] = 0x1400020c0;
  local_78[0] = lVar13;
  func_0x000145b9c4d0(param_1,param_4,0x146ba0d4f,local_78 + 2,local_78);
  lVar11 = *(long *)(lVar13 + 0x10);
  lVar7 = *(long *)(lVar13 + 0x18);
  local_50 = local_60;
  auVar15 = func_0x0001458da590();
  lVar10 = auVar15._8_8_;
  lVar12 = auVar15._0_8_;
  if (local_78[2] != 0) {
    func_0x0001400021d0();
  }
  if (lVar12 == 0) {
    lVar10 = lVar7;
    lVar12 = lVar11;
  }
  lVar11 = *(long *)(lVar13 + 0x20);
  lVar7 = *(long *)(lVar13 + 0x28);
  *param_4 = -1;
  param_4[1] = lVar12;
  param_4[2] = lVar10;
  uVar6 = 0;
LAB_1458f32b9:
  param_4[3] = lVar11;
  param_4[4] = lVar7;
  *(undefined1 *)(param_4 + 5) = uVar6;
  return;
}
