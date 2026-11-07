
/* WARNING: Removing unreachable block (ram,0x000145435ad4) */

void entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,long param_4)

{
  code *pcVar1;
  char cVar2;
  byte bVar3;
  int iVar4;
  undefined4 uVar5;
  ulong uVar7;
  ulong uVar8;
  undefined4 extraout_EDX;
  long lVar10;
  long extraout_RDX;
  ulong uVar11;
  ulong uVar12;
  uint uVar13;
  undefined1 auVar14 [16];
  long local_268;
  long local_258;
  long local_98;
  long local_80;
  undefined8 local_78;
  long local_70;
  undefined8 local_68;
  undefined8 local_60;
  undefined8 local_58;
  long local_48;
  long local_40;
  undefined8 local_38;
  char *pcVar6;
  ulong uVar9;

  local_38 = 0xfffffffffffffffe;
  func_0x000145436620(param_4,param_2,param_4,&local_80);
  local_58 = local_78;
  func_0x000145515c90();
  func_0x000145515850();
  if (local_268 == -1) {
LAB_145435760:
    local_68 = 0x14673d9b0;
    local_60 = 0x33;
    func_0x000145711f90();
    func_0x000145469260();
  }
  else {
    if ((local_258 != local_70) || (iVar4 = func_0x0001457731e7(), iVar4 != 0)) {
      if (local_268 != 0) {
        func_0x0001400021d0();
      }
      goto LAB_145435760;
    }
    if (local_268 != 0) {
      func_0x0001400021d0();
    }
    func_0x000145469260();
  }
  if ((((((((((*(int *)(param_4 + 0x1c8) == 0) && (*(long *)(param_4 + 0x10) == 0)) &&
            (*(long *)(param_4 + 0x150) == -1)) &&
           ((*(long *)(param_4 + 0x28) == 0 && (*(long *)(param_4 + 0x40) == 0)))) &&
          (*(long *)(param_4 + 0x58) == 0)) &&
         (((cVar2 = func_0x00014543c630(), cVar2 != '\0' && (*(long *)(param_4 + 0x70) == 0)) &&
          ((cVar2 = func_0x000145495c60(), cVar2 != '\0' &&
           (((*(long *)(param_4 + 0x88) == 0 &&
             (bVar3 = func_0x0001454959b0(), (bVar3 & *(long *)(param_4 + 0xa0) == 0) == 1)) &&
            (cVar2 = func_0x00014546a4a0(), cVar2 != '\0')))))))) &&
        ((*(long *)(param_4 + 0xb8) == 0 && (cVar2 = func_0x000140c72770(), cVar2 != '\0')))) &&
       ((*(long *)(param_4 + 0xd0) == 0 &&
        (((cVar2 = func_0x00014546a520(), cVar2 != '\0' &&
          (iVar4 = func_0x0001457731e7(), iVar4 == 0)) &&
         ((*(long *)(param_4 + 0xe8) == 0 &&
          (((*(long *)(param_4 + 0x100) == 0 && (cVar2 = func_0x00014546a4a0(), cVar2 != '\0')) &&
           (*(long *)(param_4 + 0x118) == 0)))))))))) &&
      (((*(long *)(param_4 + 0x130) == 0 && (cVar2 = func_0x000140c72770(), cVar2 != '\0')) &&
       (*(long *)(param_4 + 0x148) == 0)))) && (cVar2 = func_0x00014543ca60(), cVar2 != '\0')) {
    func_0x0001400a96c0();
    goto LAB_145435d3d;
  }
  func_0x0001400a96c0();
  uVar5 = func_0x000145703e20();
  local_68 = CONCAT44(extraout_EDX,uVar5);
  func_0x000145703dd0();
  uVar11 = 8;
  func_0x000145469db0();
  local_40 = 0;
  local_48 = 8;
  auVar14 = func_0x0001400a4890();
  uVar9 = auVar14._8_8_;
  pcVar6 = auVar14._0_8_;
  if (uVar9 == 0) {
LAB_145435be8:
    if (local_40 != 0) {
      func_0x0001400021d0();
    }
  }
  else {
    if (uVar9 == 1) {
      cVar2 = *pcVar6;
      if ((cVar2 == '+') || (cVar2 == '-')) goto LAB_145435be8;
    }
    else {
      cVar2 = *pcVar6;
    }
    uVar12 = (ulong)(cVar2 == '+');
    if (0x10 < uVar9 - uVar12) {
      uVar8 = 0;
      lVar10 = 0;
      while( true ) {
        if (lVar10 == uVar9 + -uVar12) goto LAB_145435cfe;
        auVar14._8_8_ = 0;
        auVar14._0_8_ = uVar8;
        uVar7 = SUB168(auVar14 * ZEXT816(10),0);
        if (SUB168(auVar14 * ZEXT816(10),8) != 0) break;
        uVar13 = (byte)pcVar6[lVar10 + uVar12] - 0x30;
        uVar8 = uVar7 + uVar13;
        if ((9 < uVar13) || (lVar10 = lVar10 + 1, CARRY8(uVar7,(ulong)uVar13))) break;
      }
      goto LAB_145435be8;
    }
    if (uVar9 == uVar12) {
      uVar8 = 0;
    }
    else {
      uVar8 = 0;
      lVar10 = 0;
      do {
        if (9 < (byte)pcVar6[lVar10 + uVar12] - 0x30) goto LAB_145435be8;
        uVar8 = (ulong)((byte)pcVar6[lVar10 + uVar12] - 0x30) + uVar8 * 10;
        lVar10 = lVar10 + 1;
      } while (lVar10 != uVar9 + -uVar12);
    }
LAB_145435cfe:
    if (local_40 != 0) {
      func_0x0001400021d0();
    }
    if (uVar8 <= uVar11 && uVar11 - uVar8 < 0xe10) goto LAB_145435d3d;
  }
  cVar2 = func_0x000145469450();
  if (cVar2 != '\0') {
    func_0x00014572f900();
    if (extraout_RDX < 0) {
LAB_145435c3f:
      func_0x00014590379b();
                    /* WARNING: Does not return */
      pcVar1 = (code *)invalidInstructionException();
      (*pcVar1)();
    }
    if (extraout_RDX == 0) {
      lVar10 = 1;
    }
    else {
      func_0x000140002200();
      lVar10 = func_0x0001400021c0(1);
      if (lVar10 == 0) goto LAB_145435c3f;
      func_0x0001457731ed();
    }
    local_48 = lVar10;
    local_40 = extraout_RDX;
    func_0x000145468b20();
    if (local_40 != 0) {
      func_0x0001400021d0();
    }
  }
LAB_145435d3d:
  if (local_98 != 0) {
    func_0x0001400021d0();
  }
  if (local_80 != 0) {
    func_0x0001400021d0();
  }
  return;
}
