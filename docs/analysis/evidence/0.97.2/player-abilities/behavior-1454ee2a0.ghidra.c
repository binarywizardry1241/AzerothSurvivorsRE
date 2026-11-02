
void entry(undefined8 param_1,undefined8 param_2,long param_3,long *param_4)

{
  code *pcVar1;
  undefined1 *puVar2;
  undefined4 *puVar3;
  long lVar4;
  long lVar5;
  ulong uVar6;
  ulong uVar7;
  ulong uVar8;
  ulong uVar9;
  long lVar10;
  ulong uVar11;
  undefined8 *puVar12;
  long lVar13;
  undefined4 local_dc;
  undefined1 *local_d8;
  long local_d0;
  ulong local_c8;
  long local_c0;
  long local_b8;
  undefined4 *local_b0;
  long local_a8;
  long local_a0;
  long local_98;
  long local_90;
  undefined1 *local_88;
  long local_80;
  ulong local_78;
  long local_70;
  long local_68;
  ulong local_60;
  ulong local_58;
  undefined1 local_4c;
  undefined1 local_4b;
  undefined1 local_4a;
  undefined1 local_49;
  undefined8 local_48;
  
  local_48 = 0xfffffffffffffffe;
  local_dc = *(undefined4 *)(param_3 + 0x8e4);
  func_0x0001454ee0d0();
  puVar2 = local_d8;
  local_c0 = local_d0 + local_c8 * 8;
  local_d8 = (undefined1 *)local_d0;
  local_c8 = (ulong)puVar2;
  local_b0 = &local_dc;
  local_b8 = param_3;
  func_0x00014552bae0();
  uVar11 = local_60;
  lVar4 = local_68;
  local_d8 = &local_4c;
  if (local_60 < 2) {
    if (local_60 != 0) goto LAB_1454ee34d;
    uVar9 = 0;
  }
  else {
    if (local_60 < 0x15) {
      func_0x0001454f4d00();
    }
    else {
      func_0x000145539850();
    }
LAB_1454ee34d:
    uVar8 = 0;
    lVar5 = 0;
    do {
      uVar9 = uVar8;
      if (*(char *)(lVar4 + 0x10 + lVar5) == '\x03') break;
      uVar8 = uVar8 + 1;
      lVar5 = lVar5 + 0x20;
      uVar9 = uVar11;
    } while (uVar11 << 5 != lVar5);
  }
  uVar8 = uVar11 - uVar9;
  lVar5 = 8;
  lVar10 = uVar11 - uVar9;
  if (lVar10 != 0) {
    func_0x000140002200();
    lVar5 = func_0x0001400021c0();
    if (lVar5 == 0) {
      func_0x0001458e721b();
LAB_1454ee7e7:
                    /* WARNING: Does not return */
      pcVar1 = (code *)invalidInstructionException();
      (*pcVar1)();
    }
  }
  lVar13 = uVar9 * 0x20;
  local_a8 = lVar10;
  local_a0 = lVar5;
  local_60 = uVar9;
  func_0x000145756ddd();
  if (uVar9 == 0) {
    uVar7 = 0;
  }
  else {
    uVar6 = 0;
    lVar5 = 0;
    do {
      local_58 = uVar9;
      if (*(char *)(lVar4 + 0x10 + lVar5) == '\x02') {
        local_78 = uVar11;
        func_0x000140002200();
        lVar4 = func_0x0001400021c0();
        if (lVar4 == 0) {
          local_49 = 1;
          func_0x0001458e721b();
          goto LAB_1454ee7e7;
        }
        local_60 = uVar6;
        func_0x000145756ddd();
        local_49 = 1;
        func_0x000145546730();
        puVar3 = local_b0;
        uVar9 = local_c8;
        local_88 = local_d8;
        local_80 = local_d0;
        local_90 = local_c0;
        local_98 = local_b8;
        local_d8 = &local_4c;
        if (1 < local_c8) {
          if (local_c8 < 0x15) {
            func_0x000141928eb0();
          }
          else {
            local_4a = 0;
            local_4b = 1;
            func_0x0001455399f0();
          }
        }
        if (local_70 - uVar6 < uVar9) {
          func_0x000145757d40();
          uVar6 = local_60;
LAB_1454ee4f4:
          func_0x000145756ddd();
        }
        else if (uVar9 != 0) goto LAB_1454ee4f4;
        uVar11 = local_78;
        uVar6 = uVar6 + uVar9;
        uVar9 = local_58;
        local_60 = uVar6;
        if (local_88 != (undefined1 *)0x0) {
          func_0x0001400021d0();
        }
        if ((undefined4 *)(local_70 - uVar6) < puVar3) {
          func_0x000145757d40();
          uVar6 = local_60;
          uVar9 = local_58;
          uVar11 = local_78;
LAB_1454ee559:
          func_0x000145756ddd();
        }
        else if (puVar3 != (undefined4 *)0x0) goto LAB_1454ee559;
        uVar7 = uVar6 + (long)puVar3;
        local_60 = uVar7;
        if (local_90 != 0) {
          func_0x0001400021d0();
        }
        break;
      }
      uVar6 = uVar6 + 1;
      lVar5 = lVar5 + 0x20;
      uVar7 = uVar9;
    } while (lVar13 != lVar5);
  }
  uVar8 = uVar8 & 0x7ffffffffffffff;
  if (local_70 - uVar7 < uVar8) {
    local_78 = uVar11;
    local_58 = uVar9;
    func_0x000145757d40();
    uVar7 = local_60;
    uVar9 = local_58;
    uVar11 = local_78;
LAB_1454ee62c:
    func_0x000145756ddd();
    uVar6 = uVar7 + uVar8;
    if (uVar11 != uVar9) {
LAB_1454ee651:
      func_0x0001400021d0();
    }
  }
  else {
    if (uVar11 != uVar9) goto LAB_1454ee62c;
    uVar6 = uVar7 + uVar8;
    if (uVar11 != uVar9) goto LAB_1454ee651;
  }
  if (uVar6 != 0) {
    if ((uVar7 + uVar8) - 1 < 3) {
      uVar11 = 0;
    }
    else {
      puVar12 = (undefined8 *)(local_68 + 0x78);
      uVar11 = 0;
      do {
        *(undefined8 *)(local_68 + uVar11 * 8) = puVar12[-0xc];
        *(undefined8 *)(local_68 + 8 + uVar11 * 8) = puVar12[-8];
        *(undefined8 *)(local_68 + 0x10 + uVar11 * 8) = puVar12[-4];
        *(undefined8 *)(local_68 + 0x18 + uVar11 * 8) = *puVar12;
        uVar11 = uVar11 + 4;
        puVar12 = puVar12 + 0x10;
      } while ((uVar6 & 0x3fffffffffffffc) != uVar11);
      if ((uVar6 & 3) == 0) goto LAB_1454ee711;
    }
    uVar8 = 0;
    do {
      *(undefined8 *)(local_68 + uVar11 * 8 + uVar8) =
           *(undefined8 *)(uVar11 * 0x20 + local_68 + 0x18 + uVar8 * 4);
      uVar8 = uVar8 + 8;
    } while (((uint)uVar6 & 3) << 3 != uVar8);
  }
LAB_1454ee711:
  *param_4 = local_70 << 2;
  param_4[1] = local_68;
  param_4[2] = uVar6;
  return;
}

