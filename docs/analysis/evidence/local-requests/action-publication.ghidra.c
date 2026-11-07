
void entry(void)

{
  undefined4 uVar1;
  long *plVar2;
  code *pcVar3;
  long lVar4;
  long in_RCX;
  ulong uVar5;
  long lVar6;
  ulong uVar7;
  undefined4 *puVar8;
  long *plVar9;
  undefined4 local_68;
  undefined4 uStack_64;
  undefined4 uStack_60;
  undefined4 uStack_5c;
  undefined4 local_58;
  undefined4 uStack_54;
  undefined4 uStack_50;
  undefined4 uStack_4c;

  uVar7 = *(ulong *)(in_RCX + 0x2b8);
  lVar6 = uVar7 * 0x10;
  if (uVar7 == 0) {
    lVar4 = 8;
  }
  else {
    plVar2 = *(long **)(in_RCX + 0x2b0);
    func_0x000140002200();
    lVar4 = func_0x0001400021c0();
    if (lVar4 == 0) {
      func_0x00014590379b();
                    /* WARNING: Does not return */
      pcVar3 = (code *)invalidInstructionException();
      (*pcVar3)();
    }
    if (uVar7 == 1) {
      uVar5 = 0;
    }
    else {
      puVar8 = (undefined4 *)(lVar4 + 0x18);
      uVar5 = 0;
      plVar9 = plVar2;
      do {
        uVar1 = *(undefined4 *)(*plVar9 + 0x40);
        *(ulong *)(puVar8 + -6) = uVar5;
        puVar8[-4] = uVar1;
        uVar1 = *(undefined4 *)(plVar9[0xb] + 0x40);
        *(ulong *)(puVar8 + -2) = uVar5 + 1;
        *puVar8 = uVar1;
        uVar5 = uVar5 + 2;
        plVar9 = plVar9 + 0x16;
        puVar8 = puVar8 + 8;
      } while (uVar5 != (uVar7 & 0xfffffffffffffffe));
      if ((uVar7 & 1) == 0) goto LAB_1454f5fd7;
    }
    uVar1 = *(undefined4 *)(plVar2[uVar5 * 0xb] + 0x40);
    *(ulong *)(lVar4 + uVar5 * 0x10) = uVar5;
    *(undefined4 *)(lVar4 + 8 + uVar5 * 0x10) = uVar1;
  }
LAB_1454f5fd7:
  uVar1 = *(undefined4 *)(*(long *)(in_RCX + 0x390) + 0x40);
  func_0x000145774860();
  *(undefined8 *)(lVar4 + lVar6) = 0xb;
  *(undefined4 *)(lVar4 + 8 + lVar6) = uVar1;
  func_0x00014545c420();
  lVar6 = *(long *)(in_RCX + 0x560);
  if (lVar6 == *(long *)(in_RCX + 0x550)) {
    func_0x000145774710();
  }
  lVar4 = *(long *)(in_RCX + 0x558);
  puVar8 = (undefined4 *)(lVar4 + 0x10 + lVar6 * 0x20);
  *puVar8 = local_58;
  puVar8[1] = uStack_54;
  puVar8[2] = uStack_50;
  puVar8[3] = uStack_4c;
  puVar8 = (undefined4 *)(lVar4 + lVar6 * 0x20);
  *puVar8 = local_68;
  puVar8[1] = uStack_64;
  puVar8[2] = uStack_60;
  puVar8[3] = uStack_5c;
  *(long *)(in_RCX + 0x560) = lVar6 + 1;
  if (uVar7 != 0) {
    func_0x0001400021d0();
  }
  return;
}
