void entry(undefined8 param_1,undefined8 param_2,undefined1 param_3,long param_4)

{
  byte *pbVar1;
  undefined8 uVar2;
  long *plVar3;
  long lVar4;
  code *pcVar5;
  undefined1 *puVar6;
  long *plVar7;
  undefined1 auVar8 [16];
  undefined8 *local_48;
  undefined8 local_40;
  undefined8 local_38;
  undefined8 local_30;

  local_38 = 0x145dd3b50;
  local_30 = 0x2a;
  if (*(char *)(param_4 + 0x58) != '\0') {
    local_48 = &local_38;
    local_40 = 0x144ff7ea0;
    func_0x000145d93a70(param_1,param_2,&local_48,0x145dd3c48,0x145dd3c78);
                    /* WARNING: Does not return */
    pcVar5 = (code *)invalidInstructionException();
    (*pcVar5)();
  }
  pbVar1 = *(byte **)(param_4 + 0x48);
  if (((*pbVar1 & 1) != 0) &&
     (auVar8[0] = -(pbVar1[8] == DAT_145d973d0), auVar8[1] = -(pbVar1[9] == bRam0000000145d973d1),
     auVar8[2] = -(pbVar1[10] == bRam0000000145d973d2),
     auVar8[3] = -(pbVar1[0xb] == bRam0000000145d973d3),
     auVar8[4] = -(pbVar1[0xc] == bRam0000000145d973d4),
     auVar8[5] = -(pbVar1[0xd] == bRam0000000145d973d5),
     auVar8[6] = -(pbVar1[0xe] == bRam0000000145d973d6),
     auVar8[7] = -(pbVar1[0xf] == bRam0000000145d973d7),
     auVar8[8] = -(pbVar1[0x10] == bRam0000000145d973d8),
     auVar8[9] = -(pbVar1[0x11] == bRam0000000145d973d9),
     auVar8[10] = -(pbVar1[0x12] == bRam0000000145d973da),
     auVar8[0xb] = -(pbVar1[0x13] == bRam0000000145d973db),
     auVar8[0xc] = -(pbVar1[0x14] == bRam0000000145d973dc),
     auVar8[0xd] = -(pbVar1[0x15] == bRam0000000145d973dd),
     auVar8[0xe] = -(pbVar1[0x16] == bRam0000000145d973de),
     auVar8[0xf] = -(pbVar1[0x17] == bRam0000000145d973df),
     (ushort)((ushort)(SUB161(auVar8 >> 7,0) & 1) | (ushort)(SUB161(auVar8 >> 0xf,0) & 1) << 1 |
              (ushort)(SUB161(auVar8 >> 0x17,0) & 1) << 2 |
              (ushort)(SUB161(auVar8 >> 0x1f,0) & 1) << 3 |
              (ushort)(SUB161(auVar8 >> 0x27,0) & 1) << 4 |
              (ushort)(SUB161(auVar8 >> 0x2f,0) & 1) << 5 |
              (ushort)(SUB161(auVar8 >> 0x37,0) & 1) << 6 |
              (ushort)(SUB161(auVar8 >> 0x3f,0) & 1) << 7 |
              (ushort)(SUB161(auVar8 >> 0x47,0) & 1) << 8 |
              (ushort)(SUB161(auVar8 >> 0x4f,0) & 1) << 9 |
              (ushort)(SUB161(auVar8 >> 0x57,0) & 1) << 10 |
              (ushort)(SUB161(auVar8 >> 0x5f,0) & 1) << 0xb |
              (ushort)(SUB161(auVar8 >> 0x67,0) & 1) << 0xc |
              (ushort)(SUB161(auVar8 >> 0x6f,0) & 1) << 0xd |
              (ushort)(SUB161(auVar8 >> 0x77,0) & 1) << 0xe | (ushort)(auVar8[0xf] >> 7) << 0xf) ==
     0xffff)) {
    uVar2 = *(undefined8 *)(param_4 + 0x10);
    plVar7 = *(long **)(param_4 + 0x30);
    plVar3 = *(long **)(*(long *)(param_4 + 0x38) + 0x10);
    if (plVar3[4] == *plVar3) {
      puVar6 = (undefined1 *)func_0x000145d505a0(plVar7,param_4,1,*(long *)(param_4 + 0x38),1);
      if (puVar6 == (undefined1 *)0x0) {
        func_0x000145d51670();
                    /* WARNING: Does not return */
        pcVar5 = (code *)invalidInstructionException();
        (*pcVar5)();
      }
    }
    else {
      puVar6 = (undefined1 *)(plVar3[4] + -1);
      plVar3[4] = (long)puVar6;
    }
    *puVar6 = param_3;
    lVar4 = plVar7[2];
    if (lVar4 == *plVar7) {
      func_0x000145bf4c40();
    }
    *(undefined8 *)(plVar7[1] + lVar4 * 8) = uVar2;
    plVar7[2] = lVar4 + 1;
    lVar4 = plVar7[5];
    if (lVar4 == plVar7[3]) {
      func_0x000145bf4c40();
    }
    *(undefined1 **)(plVar7[4] + lVar4 * 8) = puVar6;
    plVar7[5] = lVar4 + 1;
    *(undefined1 *)(param_4 + 0x58) = 1;
    return;
  }
  local_48 = &local_38;
  local_40 = 0x144ff7ea0;
  func_0x000145d93a70(param_1,param_4,&local_48,0x145dd3b7a,0x145dd3c30);
                    /* WARNING: Does not return */
  pcVar5 = (code *)invalidInstructionException();
  (*pcVar5)();
}
