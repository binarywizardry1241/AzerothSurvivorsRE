
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

ulong entry(void)

{
  ulong uVar1;
  undefined8 *puVar2;
  long lVar3;
  long lVar4;
  undefined4 *puVar5;
  code *pcVar6;
  long lVar7;
  undefined4 uVar8;
  undefined4 uVar9;
  undefined4 uVar10;
  undefined4 uVar11;
  undefined4 uVar12;
  undefined4 uVar13;
  undefined4 uVar14;
  undefined1 uVar15;
  uint uVar16;
  long in_RCX;
  ulong uVar17;
  long lVar18;
  undefined8 *in_R8;
  undefined1 *puVar19;
  ulong uVar20;
  float fVar21;
  undefined1 auVar22 [16];
  undefined8 uStack_48;
  
  uStack_48 = 0x145ae4886;
  auVar22 = func_0x0001460044e0();
  uVar17 = auVar22._8_8_;
  lVar7 = -auVar22._0_8_;
  *(undefined8 *)(&stack0x000013f0 + lVar7) = 0xfffffffffffffffe;
  if (uVar17 != 0) {
    uVar1 = *(ulong *)(in_RCX + 0xa30);
    puVar19 = (undefined1 *)(uVar1 - uVar17);
    if (uVar17 <= uVar1) {
      *(undefined8 **)(&stack0x000013d0 + lVar7) = in_R8;
      *(ulong *)(&stack0x000013d8 + lVar7) = uVar17;
      uVar17 = uVar17 - 1;
      *(ulong *)(&stack0x000013e0 + lVar7) = uVar17;
      if (uVar1 <= uVar17) {
LAB_145ae4bfe:
        *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145ae4c14;
        func_0x0001461ade2b();
                    /* WARNING: Does not return */
        pcVar6 = (code *)invalidInstructionException();
        (*pcVar6)();
      }
      lVar3 = *(long *)(in_RCX + 0xa28);
      lVar18 = uVar17 * 0x9f0;
      lVar4 = *(long *)(lVar3 + lVar18);
      *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145ae497d;
      func_0x00014600504b(lVar18,in_RCX,lVar3 + lVar18 + 8,&stack0x000009d0 + lVar7,0x9e8);
      *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145ae4997;
      func_0x000146005057();
      *(ulong *)(in_RCX + 0xa30) = uVar1 - 1;
      if (lVar4 == 2) goto LAB_145ae4bfe;
      *(long *)(&stack0xffffffffffffffe0 + lVar7) = lVar4;
      *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145ae49c5;
      func_0x00014600504b();
      uVar17 = *(ulong *)(&stack0x000013e0 + lVar7);
      if (*(char *)(in_RCX + 0xd52) == '\x01') {
        *(undefined8 *)(&stack0x000013c8 + lVar7) = *(undefined8 *)(in_RCX + 0xc50);
        lVar3 = *(long *)(in_RCX + 0x678);
        lVar4 = *(long *)(in_RCX + 0x680);
        *(undefined8 *)(in_RCX + 0x680) = 0;
        *(long *)(&stack0x000009e8 + lVar7) = lVar4;
        *(undefined8 *)(&stack0x000009f0 + lVar7) = 0;
        *(long *)(&stack0x000009d0 + lVar7) = lVar3;
        *(long *)(&stack0x000009d8 + lVar7) = lVar4 * 0x20 + lVar3;
        *(long *)(&stack0x000009e0 + lVar7) = in_RCX + 0x670;
        puVar19 = &stack0x000013c8 + lVar7;
        *(undefined1 **)(&stack0x000009f8 + lVar7) = puVar19;
        (&stack0x000013ef)[lVar7] = 1;
        *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145ae4a5d;
        func_0x000145c8c410();
        lVar3 = *(long *)(in_RCX + 0x690);
        lVar4 = *(long *)(in_RCX + 0x698);
        *(undefined8 *)(in_RCX + 0x698) = 0;
        *(long *)(&stack0x000009e8 + lVar7) = lVar4;
        *(undefined8 *)(&stack0x000009f0 + lVar7) = 0;
        *(long *)(&stack0x000009d0 + lVar7) = lVar3;
        *(long *)(&stack0x000009d8 + lVar7) = lVar3 + lVar4 * 0x18;
        *(long *)(&stack0x000009e0 + lVar7) = in_RCX + 0x688;
        *(undefined1 **)(&stack0x000009f8 + lVar7) = puVar19;
        (&stack0x000013ef)[lVar7] = 1;
        *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145ae4ace;
        func_0x000145c8c340();
      }
      *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145ae4adb;
      func_0x000145b20420();
      *(undefined8 *)(in_RCX + 0xc50) = *(undefined8 *)(&stack0x000013d8 + lVar7);
      puVar5 = *(undefined4 **)(&stack0x000013d0 + lVar7);
      uVar8 = *puVar5;
      uVar9 = puVar5[1];
      uVar10 = puVar5[2];
      uVar11 = puVar5[3];
      uVar12 = puVar5[5];
      uVar13 = puVar5[6];
      uVar14 = puVar5[7];
      *(undefined4 *)(&stack0x000009e0 + lVar7) = puVar5[4];
      *(undefined4 *)(&stack0x000009e4 + lVar7) = uVar12;
      *(undefined4 *)(&stack0x000009e8 + lVar7) = uVar13;
      *(undefined4 *)(&stack0x000009ec + lVar7) = uVar14;
      *(undefined4 *)(&stack0x000009d0 + lVar7) = uVar8;
      *(undefined4 *)(&stack0x000009d4 + lVar7) = uVar9;
      *(undefined4 *)(&stack0x000009d8 + lVar7) = uVar10;
      *(undefined4 *)(&stack0x000009dc + lVar7) = uVar11;
      *(long *)(&stack0x000009f0 + lVar7) = in_RCX;
      (&stack0x000013ef)[lVar7] = 1;
      *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145ae4b2d;
      uVar15 = func_0x000145bb79f0();
      uVar20 = CONCAT71((int7)((ulong)puVar19 >> 8),uVar15);
      (&stack0x000013ef)[lVar7] = 1;
      *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145ae4b40;
      func_0x000145afc720();
      *(undefined8 *)(in_RCX + 0xc50) = 0;
      *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145ae4b5b;
      func_0x000145b20420();
      *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145ae4b70;
      func_0x00014600504b();
      uVar1 = *(ulong *)(in_RCX + 0xa30);
      if (uVar1 < uVar17) {
        *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145ae4bfb;
        func_0x0001461adda4();
                    /* WARNING: Does not return */
        pcVar6 = (code *)invalidInstructionException();
        (*pcVar6)();
      }
      if (uVar1 == *(ulong *)(in_RCX + 0xa20)) {
        *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145ae4b8d;
        func_0x00014618c050();
      }
      if (uVar17 < uVar1) {
        *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145ae4bb3;
        func_0x000146005057();
      }
      *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145ae4bc8;
      func_0x00014600504b();
      *(ulong *)(in_RCX + 0xa30) = uVar1 + 1;
      goto LAB_145ae4bd2;
    }
  }
  *(undefined4 *)(in_RCX + 0xd10) = *(undefined4 *)*in_R8;
  puVar2 = (undefined8 *)in_R8[1];
  *(undefined4 *)(&stack0x000009d8 + lVar7) = *(undefined4 *)(puVar2 + 1);
  *(undefined8 *)(&stack0x000009d0 + lVar7) = *puVar2;
  fVar21 = (float)*(uint *)in_R8[3] / _DAT_1461c0c48;
  *(undefined4 *)(in_RCX + 0xbd0) = 1;
  *(float *)(in_RCX + 0xbd4) = fVar21;
  *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145ae4911;
  uVar16 = func_0x000145b0a060();
  uVar20 = (ulong)uVar16;
  *(undefined4 *)(in_RCX + 0xbd0) = 0;
  *(undefined8 *)((long)&uStack_48 + lVar7) = 0x145ae4926;
  func_0x000145afc720();
LAB_145ae4bd2:
  return uVar20 & 0xffffffff;
}

