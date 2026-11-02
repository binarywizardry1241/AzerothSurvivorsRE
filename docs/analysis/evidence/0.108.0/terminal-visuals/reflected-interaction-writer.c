void entry(undefined8 param_1,undefined8 param_2,long param_3,undefined8 *param_4)

{
  undefined1 uVar1;
  byte *pbVar2;
  undefined8 uVar3;
  long *plVar4;
  long lVar5;
  code *pcVar6;
  long *plVar7;
  undefined1 *puVar8;
  undefined1 auVar9 [16];
  undefined1 auVar10 [16];
  undefined8 *local_48;
  undefined8 local_40;
  undefined8 local_38;
  undefined8 local_30;

  plVar7 = (long *)param_4[1];
  if ((*plVar7 == 1) &&
     (auVar9[0] = -(*(byte *)(plVar7 + 1) == DAT_145d97220),
     auVar9[1] = -(*(byte *)((long)plVar7 + 9) == bRam0000000145d97221),
     auVar9[2] = -(*(byte *)((long)plVar7 + 10) == bRam0000000145d97222),
     auVar9[3] = -(*(byte *)((long)plVar7 + 0xb) == bRam0000000145d97223),
     auVar9[4] = -(*(byte *)((long)plVar7 + 0xc) == bRam0000000145d97224),
     auVar9[5] = -(*(byte *)((long)plVar7 + 0xd) == bRam0000000145d97225),
     auVar9[6] = -(*(byte *)((long)plVar7 + 0xe) == bRam0000000145d97226),
     auVar9[7] = -(*(byte *)((long)plVar7 + 0xf) == bRam0000000145d97227),
     auVar9[8] = -(*(byte *)(plVar7 + 2) == bRam0000000145d97228),
     auVar9[9] = -(*(byte *)((long)plVar7 + 0x11) == bRam0000000145d97229),
     auVar9[10] = -(*(byte *)((long)plVar7 + 0x12) == bRam0000000145d9722a),
     auVar9[0xb] = -(*(byte *)((long)plVar7 + 0x13) == bRam0000000145d9722b),
     auVar9[0xc] = -(*(byte *)((long)plVar7 + 0x14) == bRam0000000145d9722c),
     auVar9[0xd] = -(*(byte *)((long)plVar7 + 0x15) == bRam0000000145d9722d),
     auVar9[0xe] = -(*(byte *)((long)plVar7 + 0x16) == bRam0000000145d9722e),
     auVar9[0xf] = -(*(byte *)((long)plVar7 + 0x17) == bRam0000000145d9722f),
     (ushort)((ushort)(SUB161(auVar9 >> 7,0) & 1) | (ushort)(SUB161(auVar9 >> 0xf,0) & 1) << 1 |
              (ushort)(SUB161(auVar9 >> 0x17,0) & 1) << 2 |
              (ushort)(SUB161(auVar9 >> 0x1f,0) & 1) << 3 |
              (ushort)(SUB161(auVar9 >> 0x27,0) & 1) << 4 |
              (ushort)(SUB161(auVar9 >> 0x2f,0) & 1) << 5 |
              (ushort)(SUB161(auVar9 >> 0x37,0) & 1) << 6 |
              (ushort)(SUB161(auVar9 >> 0x3f,0) & 1) << 7 |
              (ushort)(SUB161(auVar9 >> 0x47,0) & 1) << 8 |
              (ushort)(SUB161(auVar9 >> 0x4f,0) & 1) << 9 |
              (ushort)(SUB161(auVar9 >> 0x57,0) & 1) << 10 |
              (ushort)(SUB161(auVar9 >> 0x5f,0) & 1) << 0xb |
              (ushort)(SUB161(auVar9 >> 0x67,0) & 1) << 0xc |
              (ushort)(SUB161(auVar9 >> 0x6f,0) & 1) << 0xd |
              (ushort)(SUB161(auVar9 >> 0x77,0) & 1) << 0xe | (ushort)(auVar9[0xf] >> 7) << 0xf) ==
     0xffff)) {
    uVar1 = *(undefined1 *)*param_4;
    local_38 = 0x146277c00;
    local_30 = 0x2a;
    if (*(char *)(param_3 + 0x58) != '\0') {
      local_48 = &local_38;
      local_40 = 0x144ff7ea0;
      func_0x000145d93a70(param_1,param_2,&local_48,0x146277cf8,0x146277d28);
                    /* WARNING: Does not return */
      pcVar6 = (code *)invalidInstructionException();
      (*pcVar6)();
    }
    pbVar2 = *(byte **)(param_3 + 0x48);
    if (((*pbVar2 & 1) == 0) ||
       (auVar10[0] = -(pbVar2[8] == DAT_145d97220),
       auVar10[1] = -(pbVar2[9] == bRam0000000145d97221),
       auVar10[2] = -(pbVar2[10] == bRam0000000145d97222),
       auVar10[3] = -(pbVar2[0xb] == bRam0000000145d97223),
       auVar10[4] = -(pbVar2[0xc] == bRam0000000145d97224),
       auVar10[5] = -(pbVar2[0xd] == bRam0000000145d97225),
       auVar10[6] = -(pbVar2[0xe] == bRam0000000145d97226),
       auVar10[7] = -(pbVar2[0xf] == bRam0000000145d97227),
       auVar10[8] = -(pbVar2[0x10] == bRam0000000145d97228),
       auVar10[9] = -(pbVar2[0x11] == bRam0000000145d97229),
       auVar10[10] = -(pbVar2[0x12] == bRam0000000145d9722a),
       auVar10[0xb] = -(pbVar2[0x13] == bRam0000000145d9722b),
       auVar10[0xc] = -(pbVar2[0x14] == bRam0000000145d9722c),
       auVar10[0xd] = -(pbVar2[0x15] == bRam0000000145d9722d),
       auVar10[0xe] = -(pbVar2[0x16] == bRam0000000145d9722e),
       auVar10[0xf] = -(pbVar2[0x17] == bRam0000000145d9722f),
       (ushort)((ushort)(SUB161(auVar10 >> 7,0) & 1) | (ushort)(SUB161(auVar10 >> 0xf,0) & 1) << 1 |
                (ushort)(SUB161(auVar10 >> 0x17,0) & 1) << 2 |
                (ushort)(SUB161(auVar10 >> 0x1f,0) & 1) << 3 |
                (ushort)(SUB161(auVar10 >> 0x27,0) & 1) << 4 |
                (ushort)(SUB161(auVar10 >> 0x2f,0) & 1) << 5 |
                (ushort)(SUB161(auVar10 >> 0x37,0) & 1) << 6 |
                (ushort)(SUB161(auVar10 >> 0x3f,0) & 1) << 7 |
                (ushort)(SUB161(auVar10 >> 0x47,0) & 1) << 8 |
                (ushort)(SUB161(auVar10 >> 0x4f,0) & 1) << 9 |
                (ushort)(SUB161(auVar10 >> 0x57,0) & 1) << 10 |
                (ushort)(SUB161(auVar10 >> 0x5f,0) & 1) << 0xb |
                (ushort)(SUB161(auVar10 >> 0x67,0) & 1) << 0xc |
                (ushort)(SUB161(auVar10 >> 0x6f,0) & 1) << 0xd |
                (ushort)(SUB161(auVar10 >> 0x77,0) & 1) << 0xe | (ushort)(auVar10[0xf] >> 7) << 0xf)
       != 0xffff)) {
      local_48 = &local_38;
      local_40 = 0x144ff7ea0;
      func_0x000145d93a70(param_1,param_2,&local_48,0x146277c2a,0x146277ce0);
                    /* WARNING: Does not return */
      pcVar6 = (code *)invalidInstructionException();
      (*pcVar6)();
    }
    uVar3 = *(undefined8 *)(param_3 + 0x10);
    plVar7 = *(long **)(param_3 + 0x30);
    plVar4 = *(long **)(*(long *)(param_3 + 0x38) + 0x10);
    if (plVar4[4] == *plVar4) {
      puVar8 = (undefined1 *)func_0x000145d505a0(param_3,plVar7,1,*(long *)(param_3 + 0x38),1);
      if (puVar8 == (undefined1 *)0x0) {
        func_0x000145d51670();
                    /* WARNING: Does not return */
        pcVar6 = (code *)invalidInstructionException();
        (*pcVar6)();
      }
    }
    else {
      puVar8 = (undefined1 *)(plVar4[4] + -1);
      plVar4[4] = (long)puVar8;
    }
    *puVar8 = uVar1;
    lVar5 = plVar7[2];
    if (lVar5 == *plVar7) {
      func_0x000145bf4c40();
    }
    *(undefined8 *)(plVar7[1] + lVar5 * 8) = uVar3;
    plVar7[2] = lVar5 + 1;
    lVar5 = plVar7[5];
    if (lVar5 == plVar7[3]) {
      func_0x000145bf4c40();
    }
    *(undefined1 **)(plVar7[4] + lVar5 * 8) = puVar8;
    plVar7[5] = lVar5 + 1;
    *(undefined1 *)(param_3 + 0x58) = 1;
  }
  return;
}
