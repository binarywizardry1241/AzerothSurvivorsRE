
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,char *param_3,undefined8 param_4,long param_5,
          long param_6)

{
  int iVar1;
  long *plVar2;
  code *pcVar3;
  undefined8 uVar4;
  undefined8 uVar5;
  ulong uVar6;
  long lVar7;
  ulong uVar8;
  long lVar9;
  ulong uVar10;
  long lVar11;
  undefined1 uVar12;
  undefined8 local_2c8;
  long local_98;
  long local_90;
  ulong local_88;
  undefined4 uStack_80;
  undefined3 uStack_7c;
  long local_78;
  long lStack_70;
  long local_68;
  undefined8 local_60;
  undefined8 local_58;
  undefined1 local_4a;
  undefined1 local_49;
  undefined8 local_48;

  local_48 = 0xfffffffffffffffe;
  local_78 = 0;
  lStack_70 = 8;
  local_68 = 0;
  local_4a = 1;
  func_0x000140106870(param_1,param_2,param_5,&local_98,param_5 + param_6);
  if (local_88 != 0) {
    uVar6 = 0;
    lVar9 = local_90;
    do {
      iVar1 = *(int *)(lVar9 + uVar6 * 4);
      uVar10 = uVar6;
      if ((iVar1 == 0x2b) || (iVar1 == 0x2d)) {
        if ((local_88 <= uVar6 + 1) || (9 < *(int *)(lVar9 + 4 + uVar6 * 4) - 0x30U))
        goto LAB_1400c73c8;
joined_r0x0001400c738d:
        uVar10 = uVar6 + 1;
        uVar8 = uVar6;
        if (uVar10 < local_88) {
          do {
            iVar1 = *(int *)(lVar9 + uVar10 * 4);
            if (((9 < iVar1 - 0x30U) && (iVar1 != 0x25)) && (iVar1 != 0x2e)) {
              uVar8 = uVar10 - 1;
              goto LAB_1400c74d2;
            }
            uVar10 = uVar10 + 1;
          } while (local_88 != uVar10);
          uVar8 = local_88 - 1;
          uVar10 = local_88;
        }
LAB_1400c74d2:
        if ((local_88 <= uVar8) || (uVar10 < uVar6)) {
          local_49 = 1;
          func_0x0001458e77c0();
          goto LAB_1400c77e7;
        }
        local_2c8 = 0;
        if (uVar10 * 4 + uVar6 * -4 != 0) {
          func_0x000145757d40();
        }
        func_0x00014008acf0();
        lVar11 = local_68;
        local_58 = 0;
        local_60 = 1;
        uVar12 = 1;
        uVar6 = uVar10;
        uVar4 = 1;
        uVar5 = 0;
        if (local_68 == local_78) {
          func_0x0001457580b0();
          uVar4 = local_60;
          uVar5 = local_58;
        }
      }
      else {
        if (iVar1 - 0x30U < 10) goto joined_r0x0001400c738d;
LAB_1400c73c8:
        do {
          iVar1 = *(int *)(lVar9 + uVar10 * 4);
          uVar8 = uVar10;
          if ((iVar1 - 0x30U < 10) ||
             ((((uVar10 = uVar10 + 1, iVar1 == 0x2d || (iVar1 == 0x2b)) && (uVar10 < local_88)) &&
              (*(int *)(lVar9 + uVar10 * 4) - 0x30U < 10)))) break;
          uVar8 = local_88;
        } while (local_88 != uVar10);
        if ((uVar8 < uVar6) || (local_88 < uVar8)) {
          local_49 = 1;
          func_0x0001458e77c0();
          goto LAB_1400c77e7;
        }
        local_2c8 = 0;
        if (uVar8 != uVar6) {
          func_0x000145757d40();
        }
        func_0x00014008acf0();
        lVar11 = local_68;
        local_58 = 0;
        local_60 = 1;
        uVar4 = 1;
        uVar5 = 0;
        if (local_68 == local_78) {
          func_0x0001457580b0();
          uVar4 = local_60;
          uVar5 = local_58;
        }
        local_58 = uVar5;
        local_60 = uVar4;
        uVar12 = 0;
        uVar6 = uVar8;
        uVar4 = local_60;
        uVar5 = local_58;
      }
      local_58 = uVar5;
      local_60 = uVar4;
      lVar7 = lVar11 * 0x20;
      *(undefined8 *)(lStack_70 + lVar7) = local_58;
      *(undefined8 *)(lStack_70 + 8 + lVar7) = local_60;
      *(undefined8 *)(lStack_70 + 0x10 + lVar7) = local_2c8;
      *(undefined1 *)(lStack_70 + 0x18 + lVar7) = uVar12;
      local_68 = lVar11 + 1;
    } while (uVar6 < local_88);
  }
  if (*param_3 == '\x01') {
    uStack_80 = *(undefined4 *)(param_3 + 1);
    uStack_7c = (undefined3)((uint)*(undefined4 *)(param_3 + 4) >> 8);
  }
  else {
    plVar2 = *(long **)(param_3 + 8);
    LOCK();
    lVar9 = *plVar2;
    *plVar2 = *plVar2 + 1;
    UNLOCK();
    if (*plVar2 == 0 || SCARRY8(lVar9,1) != *plVar2 < 0) {
LAB_1400c77e7:
                    /* WARNING: Does not return */
      pcVar3 = (code *)invalidInstructionException();
      (*pcVar3)();
    }
  }
  func_0x000145756ddd();
  func_0x000145756ddd();
  local_49 = 1;
  func_0x0001401f87d0();
  local_49 = 0;
  func_0x00014021e460();
  if (local_98 != 0) {
    func_0x0001400021d0();
  }
  return;
}
