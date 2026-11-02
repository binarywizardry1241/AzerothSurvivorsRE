
void entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 param_4,
          undefined8 *param_5)

{
  undefined4 uVar1;
  undefined4 *puVar2;
  code *pcVar3;
  ulong uVar4;
  long lVar5;
  long lVar6;
  ulong uVar7;
  long lVar8;
  ulong uVar9;
  ulong uVar10;
  ulong uVar11;
  undefined1 local_a1;
  ulong local_a0;
  ulong *local_98;
  ulong *local_90;
  ulong *local_88;
  ulong *local_80;
  long local_78;
  undefined1 *local_70;
  ulong *local_68;
  long local_60;
  long local_58;
  undefined8 local_50;
  ulong local_48;
  ulong *local_40;
  long local_38;
  
  lVar6 = *param_3;
  local_a0 = *(ulong *)(lVar6 + 0x18);
  uVar4 = *(long *)(lVar6 + 0x10) + local_a0 + *(long *)(lVar6 + 0x30);
  if (uVar4 < local_a0) {
    local_98 = &local_a0;
    local_90 = (ulong *)0x140026be0;
    local_88 = &local_48;
    local_80 = (ulong *)0x140026be0;
    local_48 = uVar4;
    func_0x000146208ee0(lVar6,param_2,&local_98,0x14627a2c8,0x146278890);
                    /* WARNING: Does not return */
    pcVar3 = (code *)invalidInstructionException();
    (*pcVar3)();
  }
  uVar7 = *(ulong *)*param_5;
  uVar11 = uVar4;
  if (uVar7 < uVar4) {
    uVar11 = uVar7;
  }
  if (uVar7 < local_a0) {
    uVar11 = local_a0;
  }
  if (uVar11 < uVar4) {
    puVar2 = (undefined4 *)param_3[2];
    uVar1 = *(undefined4 *)((long)param_3 + 0x1c);
    lVar5 = uVar11 * 0x58 + 8;
    uVar7 = uVar11;
    do {
      if (local_a0 <= uVar7) {
        lVar8 = (ulong)(*(ulong *)(lVar6 + 0x38) <= uVar7) * 0x20;
        uVar9 = *(ulong *)(lVar6 + 0x18 + lVar8);
        uVar10 = uVar7 - uVar9;
        if (uVar7 < uVar9) {
          uVar10 = 0;
        }
        if (uVar10 < *(ulong *)(lVar6 + 0x10 + lVar8)) {
          if (uVar7 <= uVar9) {
            uVar9 = uVar7;
          }
          if (*(int *)(lVar5 + uVar9 * -0x58 + *(long *)(lVar6 + 8 + lVar8)) == 0x4f) {
            *puVar2 = uVar1;
            *(undefined8 *)(lVar6 + 0x18) = *(undefined8 *)(lVar6 + 0x40);
            local_60 = lVar6 + 0x20;
            *(undefined8 *)(lVar6 + 0x38) = *(undefined8 *)(lVar6 + 0x40);
            local_98 = *(ulong **)(lVar6 + 8);
            local_80 = *(ulong **)(lVar6 + 0x10);
            *(undefined8 *)(lVar6 + 0x10) = 0;
            local_90 = local_98 + (long)local_80 * 0xb;
            local_58 = *(long *)(lVar6 + 0x30);
            *(undefined8 *)(lVar6 + 0x30) = 0;
            local_70 = *(undefined1 **)(lVar6 + 0x28);
            local_68 = (ulong *)(local_58 * 0x58 + (long)local_70);
            local_78 = 0;
            local_50 = 0;
            local_88 = (ulong *)lVar6;
            func_0x0001401098d0(lVar6,local_60,&local_98,&local_48);
            *puVar2 = uVar1;
            local_80 = local_40 + local_38 * 10;
            local_78 = uVar11 - local_a0;
            local_a0 = *(ulong *)(lVar6 + 0x40);
            local_98 = local_40;
            local_90 = local_40;
            local_88 = (ulong *)local_48;
            local_70 = &local_a1;
            local_68 = &local_a0;
            func_0x0001400f5600();
            *(ulong *)(lVar6 + 0x40) = local_a0;
            return;
          }
        }
      }
      uVar7 = uVar7 + 1;
      lVar5 = lVar5 + 0x58;
    } while (uVar4 != uVar7);
  }
  return;
}

