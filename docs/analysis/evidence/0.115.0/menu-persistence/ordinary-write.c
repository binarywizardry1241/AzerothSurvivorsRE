
/* WARNING: Removing unreachable block (ram,0x000145832244) */

void FUN_145831e10(undefined8 param_1,undefined8 param_2,undefined8 param_3,long param_4)

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
  long lStack_268;
  long lStack_258;
  long lStack_98;
  long lStack_80;
  undefined8 uStack_78;
  long lStack_70;
  undefined8 uStack_68;
  undefined8 uStack_60;
  undefined8 uStack_58;
  long lStack_48;
  long lStack_40;
  undefined8 uStack_38;
  char *pcVar6;
  ulong uVar9;
  
  uStack_38 = 0xfffffffffffffffe;
  FUN_145832a60(param_4,param_2,param_4,&lStack_80);
  uStack_58 = uStack_78;
  func_0x0001458d32a0();
  func_0x0001458d2fb0();
  if (lStack_268 == -1) {
LAB_145831ed0:
    uStack_68 = 0x146ccbb10;
    uStack_60 = 0x33;
    func_0x000145cd0810();
    func_0x00014580aee0();
  }
  else {
    if ((lStack_258 != lStack_70) || (iVar4 = func_0x000145d14601(), iVar4 != 0)) {
      if (lStack_268 != 0) {
        func_0x0001400021d0();
      }
      goto LAB_145831ed0;
    }
    if (lStack_268 != 0) {
      func_0x0001400021d0();
    }
    func_0x00014580aee0();
  }
  if ((((((((((*(int *)(param_4 + 0x1c8) == 0) && (*(long *)(param_4 + 0x10) == 0)) &&
            (*(long *)(param_4 + 0x150) == -1)) &&
           ((*(long *)(param_4 + 0x28) == 0 && (*(long *)(param_4 + 0x40) == 0)))) &&
          (*(long *)(param_4 + 0x58) == 0)) &&
         (((cVar2 = func_0x000145839210(), cVar2 != '\0' && (*(long *)(param_4 + 0x70) == 0)) &&
          ((cVar2 = func_0x00014586c2f0(), cVar2 != '\0' &&
           (((*(long *)(param_4 + 0x88) == 0 &&
             (bVar3 = func_0x00014586c040(), (bVar3 & *(long *)(param_4 + 0xa0) == 0) == 1)) &&
            (cVar2 = func_0x00014584d310(), cVar2 != '\0')))))))) &&
        ((*(long *)(param_4 + 0xb8) == 0 && (cVar2 = func_0x000140c912e0(), cVar2 != '\0')))) &&
       ((*(long *)(param_4 + 0xd0) == 0 &&
        (((cVar2 = func_0x00014584d390(), cVar2 != '\0' &&
          (iVar4 = func_0x000145d14601(), iVar4 == 0)) &&
         ((*(long *)(param_4 + 0xe8) == 0 &&
          (((*(long *)(param_4 + 0x100) == 0 && (cVar2 = func_0x00014584d310(), cVar2 != '\0')) &&
           (*(long *)(param_4 + 0x118) == 0)))))))))) &&
      (((*(long *)(param_4 + 0x130) == 0 && (cVar2 = func_0x000140c912e0(), cVar2 != '\0')) &&
       (*(long *)(param_4 + 0x148) == 0)))) && (cVar2 = func_0x000145839640(), cVar2 != '\0')) {
    func_0x000140093cb0();
    goto LAB_1458324ad;
  }
  func_0x000140093cb0();
  uVar5 = func_0x000145cc1fd0();
  uStack_68 = CONCAT44(extraout_EDX,uVar5);
  func_0x000145cc1f80();
  uVar11 = 8;
  func_0x00014580ba30();
  lStack_40 = 0;
  lStack_48 = 8;
  auVar14 = func_0x0001401edaa0();
  uVar9 = auVar14._8_8_;
  pcVar6 = auVar14._0_8_;
  if (uVar9 == 0) {
LAB_145832358:
    if (lStack_40 != 0) {
      func_0x0001400021d0();
    }
  }
  else {
    if (uVar9 == 1) {
      cVar2 = *pcVar6;
      if ((cVar2 == '+') || (cVar2 == '-')) goto LAB_145832358;
    }
    else {
      cVar2 = *pcVar6;
    }
    uVar12 = (ulong)(cVar2 == '+');
    if (0x10 < uVar9 - uVar12) {
      uVar8 = 0;
      lVar10 = 0;
      while( true ) {
        if (lVar10 == uVar9 + -uVar12) goto LAB_14583246e;
        auVar14._8_8_ = 0;
        auVar14._0_8_ = uVar8;
        uVar7 = SUB168(auVar14 * ZEXT816(10),0);
        if (SUB168(auVar14 * ZEXT816(10),8) != 0) break;
        uVar13 = (byte)pcVar6[lVar10 + uVar12] - 0x30;
        uVar8 = uVar7 + uVar13;
        if ((9 < uVar13) || (lVar10 = lVar10 + 1, CARRY8(uVar7,(ulong)uVar13))) break;
      }
      goto LAB_145832358;
    }
    if (uVar9 == uVar12) {
      uVar8 = 0;
    }
    else {
      uVar8 = 0;
      lVar10 = 0;
      do {
        if (9 < (byte)pcVar6[lVar10 + uVar12] - 0x30) goto LAB_145832358;
        uVar8 = (ulong)((byte)pcVar6[lVar10 + uVar12] - 0x30) + uVar8 * 10;
        lVar10 = lVar10 + 1;
      } while (lVar10 != uVar9 + -uVar12);
    }
LAB_14583246e:
    if (lStack_40 != 0) {
      func_0x0001400021d0();
    }
    if (uVar8 <= uVar11 && uVar11 - uVar8 < 0xe10) goto LAB_1458324ad;
  }
  cVar2 = func_0x00014580b0d0();
  if (cVar2 != '\0') {
    func_0x000145cee4c0();
    if (extraout_RDX < 0) {
LAB_1458323af:
      func_0x000145eb6fcb();
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
      if (lVar10 == 0) goto LAB_1458323af;
      func_0x000145d145fb();
    }
    lStack_48 = lVar10;
    lStack_40 = extraout_RDX;
    func_0x00014580a7a0();
    if (lStack_40 != 0) {
      func_0x0001400021d0();
    }
  }
LAB_1458324ad:
  if (lStack_98 != 0) {
    func_0x0001400021d0();
  }
  if (lStack_80 != 0) {
    func_0x0001400021d0();
  }
  return;
}

