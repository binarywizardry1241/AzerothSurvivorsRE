
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined1  [16] entry(void)

{
  ulong uVar1;
  long *plVar2;
  code *pcVar3;
  long lVar4;
  long lVar5;
  ulong uVar6;
  undefined8 uVar7;
  long in_RCX;
  long *plVar8;
  float fVar9;
  undefined4 extraout_XMM0_Da;
  undefined4 uVar10;
  undefined8 in_XMM6_Qa;
  undefined4 uVar11;
  float fVar12;
  undefined4 in_XMM6_Dc;
  undefined4 in_XMM6_Dd;
  undefined4 uVar13;
  float fVar14;
  undefined8 in_XMM7_Qa;
  undefined4 uVar15;
  undefined4 in_XMM7_Dc;
  undefined4 in_XMM7_Dd;
  undefined1 auVar16 [16];
  undefined8 uStack_48;

  uVar15 = (undefined4)((ulong)in_XMM7_Qa >> 0x20);
  uVar13 = (undefined4)in_XMM7_Qa;
  uVar11 = (undefined4)((ulong)in_XMM6_Qa >> 0x20);
  uVar10 = (undefined4)in_XMM6_Qa;
  uStack_48 = 0x1459008a6;
  auVar16 = func_0x000145d13ac0();
  plVar8 = auVar16._8_8_;
  lVar4 = -auVar16._0_8_;
  *(undefined4 *)(&stack0x00002220 + lVar4) = uVar13;
  *(undefined4 *)(&stack0x00002224 + lVar4) = uVar15;
  *(undefined4 *)(&stack0x00002228 + lVar4) = in_XMM7_Dc;
  *(undefined4 *)(&stack0x0000222c + lVar4) = in_XMM7_Dd;
  *(undefined4 *)(&stack0x00002210 + lVar4) = uVar10;
  *(undefined4 *)(&stack0x00002214 + lVar4) = uVar11;
  *(undefined4 *)(&stack0x00002218 + lVar4) = in_XMM6_Dc;
  *(undefined4 *)(&stack0x0000221c + lVar4) = in_XMM6_Dd;
  *(undefined8 *)(&stack0x00002208 + lVar4) = 0xfffffffffffffffe;
  uVar1 = *(ulong *)(in_RCX + 0x988);
  if ((3 < uVar1) || (*(char *)(in_RCX + 0xc46 + (ulong)*(byte *)(in_RCX + 0xc41)) != '\0')) {
    if (*plVar8 != 0) {
      *(undefined8 *)((long)&uStack_48 + lVar4) = 0x145900905;
      func_0x0001400021d0();
    }
    if (plVar8[3] != 0) {
      *(undefined8 *)((long)&uStack_48 + lVar4) = 0x145900921;
      func_0x0001400021d0();
    }
    uVar7 = 0;
    goto LAB_145900923;
  }
  lVar5 = *(long *)(in_RCX + 0x2b0);
  plVar8[0x1f] = *(long *)(in_RCX + 0x2a8);
  plVar8[0x20] = lVar5;
  uVar10 = *(undefined4 *)(in_RCX + 0x2c4);
  uVar11 = *(undefined4 *)(in_RCX + 0x2c8);
  uVar13 = *(undefined4 *)(in_RCX + 0x2cc);
  *(undefined4 *)(plVar8 + 0x22) = *(undefined4 *)(in_RCX + 0x2c0);
  *(undefined4 *)((long)plVar8 + 0x114) = uVar10;
  *(undefined4 *)(plVar8 + 0x23) = uVar11;
  *(undefined4 *)((long)plVar8 + 0x11c) = uVar13;
  *(long *)(&stack0x000021f8 + lVar4) = plVar8[0x24];
  plVar2 = *(long **)(in_RCX + 0xae0);
  LOCK();
  lVar5 = *plVar2;
  *plVar2 = *plVar2 + 1;
  UNLOCK();
  if (*plVar2 == 0 || SCARRY8(lVar5,1) != *plVar2 < 0) {
                    /* WARNING: Does not return */
    pcVar3 = (code *)invalidInstructionException();
    (*pcVar3)();
  }
  *(undefined8 *)((long)&uStack_48 + lVar4) = 0x1459009ad;
  func_0x000145d145fb(plVar8,in_RCX,plVar8,&stack0x00000968 + lVar4,0x188);
  *(long **)(&stack0x00000af0 + lVar4) = plVar2;
  *(undefined8 *)((long)&uStack_48 + lVar4) = 0x1459009d1;
  func_0x0001458d72a0();
  plVar8 = (long *)(uVar1 + 1);
  *(undefined8 *)((long)&uStack_48 + lVar4) = 0x1459009e0;
  lVar5 = func_0x0001458095e0();
  fVar14 = ((float)(long)plVar8 / _DAT_145ee0200) * _DAT_145ee3c54;
  *(undefined8 *)((long)&uStack_48 + lVar4) = 0x145900a0b;
  fVar9 = (float)func_0x000145d14637(fVar14);
  *(undefined8 *)((long)&uStack_48 + lVar4) = 0x145900a16;
  fVar14 = (float)func_0x000145d14631(fVar14);
  uVar7 = *(undefined8 *)(lVar5 * 0xf0 + 0x146cc0dd0);
  fVar9 = fVar9 * _DAT_1460e81e0 + (float)uVar7;
  fVar12 = fVar14 * fRam00000001460e81e4 + (float)((ulong)uVar7 >> 0x20);
  (&stack0x00002207)[lVar4] = 1;
  *(undefined8 *)((long)&uStack_48 + lVar4) = 0x145900a47;
  uVar6 = func_0x000145990ae0(fVar14,CONCAT44(fVar12,fVar9),fVar12);
  uVar10 = extraout_XMM0_Da;
  if ((uVar6 & 1) == 0) {
    if (plVar2[0xd] != -1) {
      (&stack0x00002207)[lVar4] = 1;
      *(undefined8 *)((long)&uStack_48 + lVar4) = 0x145900a70;
      func_0x0001459953a0();
      if (*(int *)(&stack0x00000968 + lVar4) == 1) {
        uVar10 = *(undefined4 *)(&stack0x00000974 + lVar4);
        goto LAB_145900a8d;
      }
    }
    uVar10 = (undefined4)plVar2[0x17];
  }
LAB_145900a8d:
  *(ulong *)(&stack0x00001a90 + lVar4) = CONCAT44(fVar12,fVar9);
  *(undefined4 *)(&stack0x00001a98 + lVar4) = uVar10;
  (&stack0x000021e0)[lVar4] = *(undefined1 *)(in_RCX + 0xc30);
  *(undefined8 *)((long)&uStack_48 + lVar4) = 0x145900ac5;
  func_0x000145d145fb();
  (&stack0x00002207)[lVar4] = 0;
  *(undefined8 *)((long)&uStack_48 + lVar4) = 0x145900ad8;
  func_0x00014581eb00();
  if (uVar1 == *(ulong *)(in_RCX + 0x978)) {
    *(undefined8 *)((long)&uStack_48 + lVar4) = 0x145900aea;
    func_0x000145e984e0();
  }
  *(undefined8 *)((long)&uStack_48 + lVar4) = 0x145900b08;
  func_0x000145d145fb();
  *(long **)(in_RCX + 0x988) = plVar8;
  *(undefined1 *)(in_RCX + 0xc41) = 1;
  uVar7 = 1;
LAB_145900923:
  auVar16._8_8_ = plVar8;
  auVar16._0_8_ = uVar7;
  return auVar16;
}
