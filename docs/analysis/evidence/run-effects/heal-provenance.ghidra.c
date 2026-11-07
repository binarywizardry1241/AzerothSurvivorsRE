
void entry(undefined8 param_1,undefined8 param_2,long param_3,long *param_4,int param_5)

{
  char cVar1;
  code *pcVar2;
  undefined1 auVar3 [16];
  long lVar4;
  long lVar5;
  long lVar6;
  undefined1 uVar7;
  ulong uVar8;
  long lVar9;
  bool bVar10;
  undefined1 auVar11 [16];
  long local_68;
  undefined8 local_60;
  undefined8 local_50;
  undefined8 local_48;

  local_48 = 0xfffffffffffffffe;
  cVar1 = *(char *)(param_3 + 0x129);
  if (cVar1 == '\x02') {
    *param_4 = -1;
    param_4[1] = 0x1469f691d;
    param_4[2] = 4;
    lVar5 = 0x18;
    lVar4 = 0x1469f6921;
    uVar7 = 0;
    goto LAB_1454a0894;
  }
  if (cVar1 == '\x03') {
    if ((*(int *)(param_3 + 0x20) == 1) &&
       (uVar8 = *(ulong *)(param_3 + 0x28), uVar8 < *(ulong *)(param_3 + 0x730)))
    goto LAB_1454a05a3;
  }
  else if (*(long *)(param_3 + 0x40) == 0) {
    if (((cVar1 == '\x01') && (*(int *)(param_3 + 0x30) == 1)) &&
       (uVar8 = *(ulong *)(param_3 + 0x38), uVar8 < *(ulong *)(param_3 + 0x730)))
    goto LAB_1454a05a3;
  }
  else {
    uVar8 = *(ulong *)(param_3 + 0x48);
    if (uVar8 < *(ulong *)(param_3 + 0x730)) {
LAB_1454a05a3:
      lVar5 = *(long *)(param_3 + 0x728);
      lVar4 = *(long *)(lVar5 + 0x10 + uVar8 * 0x28);
      if (*(long *)(lVar5 + uVar8 * 0x28) == -1) {
        param_4[1] = *(long *)(lVar5 + 8 + uVar8 * 0x28);
        param_4[2] = lVar4;
        *param_4 = -1;
      }
      else {
        if (lVar4 < 0) {
LAB_1454a05cf:
          func_0x00014590379b();
                    /* WARNING: Does not return */
          pcVar2 = (code *)invalidInstructionException();
          (*pcVar2)();
        }
        if (lVar4 == 0) {
          lVar6 = 1;
        }
        else {
          func_0x000140002200();
          lVar6 = func_0x0001400021c0();
          if (lVar6 == 0) goto LAB_1454a05cf;
          func_0x0001457731ed();
        }
        *param_4 = lVar4;
        param_4[1] = lVar6;
        param_4[2] = lVar4;
      }
      lVar5 = lVar5 + uVar8 * 0x28;
      lVar4 = *(long *)(lVar5 + 0x18);
      lVar5 = *(long *)(lVar5 + 0x20);
      uVar7 = 1;
      goto LAB_1454a0894;
    }
  }
  if (param_5 == 0) {
LAB_1454a0800:
    if (cVar1 == '\x03') {
      uVar7 = 1;
      lVar5 = 0x14;
      lVar4 = 0x1469f6975;
      lVar9 = 7;
      lVar6 = 0x1469f696e;
    }
    else {
LAB_1454a0848:
      bVar10 = param_5 != 0;
      lVar6 = 0x1469f699a;
      if (!bVar10) {
        lVar6 = 0x1469f6989;
      }
      lVar4 = 0x1469f699f;
      if (!bVar10) {
        lVar4 = 0x1469f698e;
      }
      lVar5 = (ulong)bVar10 * 9 + 0xc;
      lVar9 = 5;
LAB_1454a0882:
      uVar7 = 0;
    }
LAB_1454a0885:
    *param_4 = -1;
    param_4[1] = lVar6;
    param_4[2] = lVar9;
    goto LAB_1454a0894;
  }
  lVar4 = 0;
  do {
    if (*(long *)(param_3 + 0x2b8) * 0x58 - lVar4 == 0) {
      lVar5 = 0;
      goto LAB_1454a06b0;
    }
    lVar9 = *(long *)(*(long *)(param_3 + 0x2b0) + lVar4);
  } while ((*(int *)(lVar9 + 0x40) != param_5) &&
          (lVar4 = lVar4 + 0x58, *(int *)(lVar9 + 100) != param_5));
  goto LAB_1454a06cd;
  while ((lVar9 = *(long *)(*(long *)(param_3 + 0xb8) + lVar5), *(int *)(lVar9 + 0x40) != param_5 &&
         (lVar5 = lVar5 + 0x60, *(int *)(lVar9 + 100) != param_5))) {
LAB_1454a06b0:
    if (*(long *)(param_3 + 0xc0) * 0x60 == lVar5) {
      lVar6 = 0x3480;
      lVar5 = 0x146736b48;
      goto LAB_1454a0788;
    }
  }
  goto LAB_1454a06cd;
  while( true ) {
    if ((*(int *)(lVar9 + 0x40) == param_5) || (*(int *)(lVar9 + 100) == param_5))
    goto LAB_1454a06cd;
    if (*(int *)(lVar9 + 0xb8) == param_5) {
      lVar9 = lVar9 + 0x78;
      goto LAB_1454a06cd;
    }
    lVar6 = lVar6 + -0xf0;
    lVar5 = lVar9 + 0xf0;
    if (*(int *)(lVar9 + 0xdc) == param_5) break;
LAB_1454a0788:
    lVar9 = lVar5;
    if (lVar6 == 0) {
      lVar5 = 0x13;
      if (param_5 != 0x1d3) {
        if (param_5 != 0x3b85) goto LAB_1454a0800;
        lVar4 = 0x1469f6942;
        lVar9 = 9;
        lVar6 = 0x1469f6939;
        goto LAB_1454a0882;
      }
      if (cVar1 != '\x03') goto LAB_1454a0848;
      uVar7 = 1;
      lVar4 = 0x1469f695b;
      lVar9 = 6;
      lVar6 = 0x1469f6955;
      goto LAB_1454a0885;
    }
  }
  lVar9 = lVar9 + 0x78;
LAB_1454a06cd:
  func_0x000145728390(param_1,lVar4,0x14672b907,&local_68);
  auVar3 = *(undefined1 (*) [16])(lVar9 + 0x10);
  local_50 = local_60;
  auVar11 = func_0x000145457cb0();
  if (local_68 != 0) {
    func_0x0001400021d0();
  }
  if (auVar11._0_8_ == 0) {
    auVar11 = auVar3;
  }
  lVar4 = *(long *)(lVar9 + 0x20);
  lVar5 = *(long *)(lVar9 + 0x28);
  *param_4 = -1;
  *(undefined1 (*) [16])(param_4 + 1) = auVar11;
  uVar7 = 0;
LAB_1454a0894:
  param_4[3] = lVar4;
  param_4[4] = lVar5;
  *(undefined1 *)(param_4 + 5) = uVar7;
  return;
}
