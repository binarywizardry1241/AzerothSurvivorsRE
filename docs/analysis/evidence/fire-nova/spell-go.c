
/* WARNING: Removing unreachable block (ram,0x000145c745e3) */
/* WARNING: Removing unreachable block (ram,0x000145c745bb) */
/* WARNING: Removing unreachable block (ram,0x000145c742ac) */

undefined8 * entry(void)

{
  int iVar1;
  undefined8 uVar2;
  code *pcVar3;
  undefined8 uVar4;
  undefined4 *puVar5;
  undefined8 *in_RCX;
  ulong uVar6;
  long lVar7;
  int iVar8;
  undefined4 in_R8D;
  long in_R9;
  bool bVar9;
  ulong in_stack_00000028;
  int *in_stack_00000030;
  int *in_stack_00000038;
  long local_b8;
  long local_78;
  undefined2 uStack_50;
  undefined6 uStack_4e;
  undefined4 uStack_4c;
  
  uVar2 = _uStack_50;
  iVar1 = *in_stack_00000038;
  func_0x000140002200();
  puVar5 = (undefined4 *)func_0x0001400021c0();
  if (puVar5 != (undefined4 *)0x0) {
    _uStack_50 = CONCAT62(uStack_4e,0x132);
    uVar4 = _uStack_50;
    func_0x000145aaeb70();
    uStack_4c = SUB84(uVar2,4);
    func_0x000145aaeb70();
    *puVar5 = in_R8D;
    *(short *)(puVar5 + 1) = ((short)iVar1 + 8) * 0x20;
    local_78 = 6;
    uVar6 = 0xff;
    if (in_stack_00000028 < 0xff) {
      uVar6 = in_stack_00000028;
    }
    *(char *)((long)puVar5 + 6) = (char)uVar6;
    local_b8 = 7;
    if (in_stack_00000028 != 0) {
      lVar7 = 0;
      do {
        uVar2 = *(undefined8 *)(in_R9 + lVar7);
        if (0x20U - local_b8 < 8) {
          func_0x000146005df0();
        }
        *(undefined8 *)((long)puVar5 + local_b8) = uVar2;
        local_b8 = local_b8 + 8;
      } while ((lVar7 != 0x7f0) &&
              (bVar9 = in_stack_00000028 * 8 + -8 != lVar7, lVar7 = lVar7 + 8, bVar9));
    }
    if (local_b8 == 0x20) {
      func_0x0001461adc50();
    }
    *(undefined1 *)((long)puVar5 + local_b8) = 0;
    lVar7 = local_b8 + 1;
    if (*in_stack_00000030 == 0) {
      if (0x20U - lVar7 < 2) {
        func_0x000146005df0();
      }
      *(undefined2 *)((long)puVar5 + lVar7) = 2;
      local_78 = local_b8 + 3;
      func_0x000145aaeb70();
    }
    else if (*in_stack_00000030 == 1) {
      if (0x20U - lVar7 < 2) {
        func_0x000146005df0();
      }
      *(undefined2 *)((long)puVar5 + lVar7) = 0x40;
      func_0x000145aa4130();
    }
    else {
      if (0x20U - lVar7 < 2) {
        func_0x000146005df0();
      }
      *(undefined2 *)((long)puVar5 + lVar7) = 0;
      local_78 = local_b8 + 3;
    }
    local_b8 = local_78;
    if (iVar1 != 0) {
      iVar1 = in_stack_00000038[1];
      iVar8 = in_stack_00000038[2];
      if (0x20U - local_78 < 4) {
        func_0x000146005df0();
      }
      *(int *)((long)puVar5 + local_78) = iVar1;
      if (0x20U - (local_78 + 4) < 4) {
        func_0x000146005df0();
      }
      *(int *)((long)puVar5 + local_78 + 4) = iVar8;
      local_b8 = local_78 + 8;
    }
    in_RCX[2] = local_b8;
    in_RCX[3] = CONCAT44(uStack_4c,(int)uVar4);
    *in_RCX = 0x20;
    in_RCX[1] = puVar5;
    return in_RCX;
  }
  func_0x0001461add5b();
                    /* WARNING: Does not return */
  pcVar3 = (code *)invalidInstructionException();
  (*pcVar3)();
}

