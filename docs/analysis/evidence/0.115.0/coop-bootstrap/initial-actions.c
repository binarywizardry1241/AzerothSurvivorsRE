void FUN_14597e330(longlong param_1)

{
  undefined4 uVar1;
  ulonglong uVar2;
  longlong *plVar3;
  longlong lVar4;
  code *pcVar5;
  ulonglong uVar6;
  longlong lVar7;
  undefined4 *puVar8;
  longlong *plVar9;
  undefined4 uStack_68;
  undefined4 uStack_64;
  undefined4 uStack_60;
  undefined4 uStack_5c;
  undefined4 uStack_58;
  undefined4 uStack_54;
  undefined4 uStack_50;
  undefined4 uStack_4c;
  ulonglong uStack_48;
  longlong lStack_40;
  ulonglong uStack_38;
  undefined8 uStack_30;

  uStack_30 = 0xfffffffffffffffe;
  uVar2 = *(ulonglong *)(param_1 + 0x348);
  lVar7 = uVar2 * 0x10;
  if (uVar2 == 0) {
    lStack_40 = 8;
  }
  else {
    plVar3 = *(longlong **)(param_1 + 0x340);
    FUN_140002200();
    lStack_40 = thunk_FUN_145cbdd70(lVar7,8);
    if (lStack_40 == 0) {
      FUN_145eb6fcb(8,lVar7);
                    /* WARNING: Does not return */
      pcVar5 = (code *)invalidInstructionException();
      (*pcVar5)();
    }
    if (uVar2 == 1) {
      uVar6 = 0;
    }
    else {
      puVar8 = (undefined4 *)(lStack_40 + 0x18);
      uVar6 = 0;
      plVar9 = plVar3;
      do {
        uVar1 = *(undefined4 *)(*plVar9 + 0x40);
        *(ulonglong *)(puVar8 + -6) = uVar6;
        puVar8[-4] = uVar1;
        uVar1 = *(undefined4 *)(plVar9[0xb] + 0x40);
        *(ulonglong *)(puVar8 + -2) = uVar6 + 1;
        *puVar8 = uVar1;
        uVar6 = uVar6 + 2;
        plVar9 = plVar9 + 0x16;
        puVar8 = puVar8 + 8;
      } while (uVar6 != (uVar2 & 0xfffffffffffffffe));
      if ((uVar2 & 1) == 0) goto LAB_14597e407;
    }
    uVar1 = *(undefined4 *)(plVar3[uVar6 * 0xb] + 0x40);
    *(ulonglong *)(lStack_40 + uVar6 * 0x10) = uVar6;
    *(undefined4 *)(lStack_40 + 8 + uVar6 * 0x10) = uVar1;
  }
LAB_14597e407:
  uVar1 = *(undefined4 *)(*(longlong *)(param_1 + 0x420) + 0x40);
  uStack_48 = uVar2;
  uStack_38 = uVar2;
  FUN_145d151d0(&uStack_48);
  *(undefined8 *)(lStack_40 + lVar7) = 0xb;
  *(undefined4 *)(lStack_40 + 8 + lVar7) = uVar1;
  uStack_38 = uVar2 + 1;
  FUN_1459acf50(&uStack_68,lStack_40,uStack_38);
  lVar7 = *(longlong *)(param_1 + 0x640);
  if (lVar7 == *(longlong *)(param_1 + 0x630)) {
    FUN_145d150f0(param_1 + 0x630);
  }
  lVar4 = *(longlong *)(param_1 + 0x638);
  puVar8 = (undefined4 *)(lVar4 + 0x10 + lVar7 * 0x20);
  *puVar8 = uStack_58;
  puVar8[1] = uStack_54;
  puVar8[2] = uStack_50;
  puVar8[3] = uStack_4c;
  puVar8 = (undefined4 *)(lVar4 + lVar7 * 0x20);
  *puVar8 = uStack_68;
  puVar8[1] = uStack_64;
  puVar8[2] = uStack_60;
  puVar8[3] = uStack_5c;
  *(longlong *)(param_1 + 0x640) = lVar7 + 1;
  if (uStack_48 != 0) {
    thunk_FUN_145cbddd0(lStack_40,uStack_48 << 4,8);
  }
  return;
}
