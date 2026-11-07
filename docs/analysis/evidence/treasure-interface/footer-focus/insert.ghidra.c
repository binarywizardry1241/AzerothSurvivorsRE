// ev_c79a8ffd0dfc9fcb49771449fd5efccb8f1bfb470d4e8fd92f302a9af2212ef4
// Raw bounded owner; Ghidra gcc default ABI labels are not Win64 argument evidence.

void entry(undefined8 param_1,undefined8 param_2,long param_3,ulong *param_4)

{
  char *pcVar1;
  char *pcVar2;
  uint uVar3;
  uint uVar4;
  uint uVar5;
  uint uVar6;
  ushort uVar7;
  int *piVar8;
  code *pcVar9;
  long lVar10;
  long lVar11;
  ulong uVar12;
  int *piVar13;
  ulong uVar14;
  ulong uVar15;
  undefined1 auVar16 [16];
  undefined1 auVar17 [16];
  undefined1 auVar18 [16];
  long local_58;
  undefined4 local_50;
  uint uStack_4c;
  int local_48;
  undefined8 local_44;
  int local_3c;
  undefined4 local_38;
  uint uStack_34;
  undefined4 local_30;

  uVar14 = *param_4;
  uVar15 = uVar14 & 0xffffffff;
  piVar8 = (int *)((uVar15 ^ 0xffffffff) * 0x18 + *(long *)(param_3 + 8));
  uStack_4c = (uint)(uVar14 >> 0x20);
  piVar13 = (int *)&DAT_145913b90;
  if ((uVar15 ^ 0xffffffff) < *(ulong *)(param_3 + 0x10)) {
    piVar13 = piVar8;
  }
  uVar12 = (ulong)(uint)piVar13[4];
  if (piVar13[4] == uStack_4c) {
    local_48 = *piVar13;
    if (local_48 != 0) {
      local_44 = *(undefined8 *)(piVar13 + 1);
      local_3c = piVar13[3];
      local_50 = (undefined4)uVar14;
      local_58 = param_3;
      func_0x0001402129f0(param_1,piVar8,&local_58,(ulong)(uint3)param_4[1]);
      return;
    }
    uVar15 = 0;
    uVar12 = uVar14;
    uVar5 = uStack_4c;
  }
  else {
    uVar5 = 0;
  }
  local_38 = (undefined4)uVar15;
  local_48 = (int)uVar12;
  pcVar9 = (code *)0x140042d40;
  if (*(long *)(param_3 + 0x90) != 0) {
    lVar11 = *(long *)(param_3 + 0x78);
    uVar14 = 0x28fdfadbf3ba56af;
    lVar10 = 0;
    while( true ) {
      uVar14 = uVar14 & *(ulong *)(param_3 + 0x80);
      pcVar1 = (char *)(lVar11 + uVar14);
      auVar17[0] = -(*pcVar1 == DAT_1459132a0);
      auVar17[1] = -(pcVar1[1] == cRam00000001459132a1);
      auVar17[2] = -(pcVar1[2] == cRam00000001459132a2);
      auVar17[3] = -(pcVar1[3] == cRam00000001459132a3);
      auVar17[4] = -(pcVar1[4] == cRam00000001459132a4);
      auVar17[5] = -(pcVar1[5] == cRam00000001459132a5);
      auVar17[6] = -(pcVar1[6] == cRam00000001459132a6);
      auVar17[7] = -(pcVar1[7] == cRam00000001459132a7);
      auVar17[8] = -(pcVar1[8] == cRam00000001459132a8);
      auVar17[9] = -(pcVar1[9] == cRam00000001459132a9);
      auVar17[10] = -(pcVar1[10] == cRam00000001459132aa);
      auVar17[0xb] = -(pcVar1[0xb] == cRam00000001459132ab);
      auVar17[0xc] = -(pcVar1[0xc] == cRam00000001459132ac);
      auVar17[0xd] = -(pcVar1[0xd] == cRam00000001459132ad);
      auVar17[0xe] = -(pcVar1[0xe] == cRam00000001459132ae);
      auVar17[0xf] = -(pcVar1[0xf] == cRam00000001459132af);
      uVar7 = (ushort)(SUB161(auVar17 >> 7,0) & 1) | (ushort)(SUB161(auVar17 >> 0xf,0) & 1) << 1 |
              (ushort)(SUB161(auVar17 >> 0x17,0) & 1) << 2 |
              (ushort)(SUB161(auVar17 >> 0x1f,0) & 1) << 3 |
              (ushort)(SUB161(auVar17 >> 0x27,0) & 1) << 4 |
              (ushort)(SUB161(auVar17 >> 0x2f,0) & 1) << 5 |
              (ushort)(SUB161(auVar17 >> 0x37,0) & 1) << 6 |
              (ushort)(SUB161(auVar17 >> 0x3f,0) & 1) << 7 |
              (ushort)(SUB161(auVar17 >> 0x47,0) & 1) << 8 |
              (ushort)(SUB161(auVar17 >> 0x4f,0) & 1) << 9 |
              (ushort)(SUB161(auVar17 >> 0x57,0) & 1) << 10 |
              (ushort)(SUB161(auVar17 >> 0x5f,0) & 1) << 0xb |
              (ushort)(SUB161(auVar17 >> 0x67,0) & 1) << 0xc |
              (ushort)(SUB161(auVar17 >> 0x6f,0) & 1) << 0xd |
              (ushort)(SUB161(auVar17 >> 0x77,0) & 1) << 0xe | (ushort)(auVar17[0xf] >> 7) << 0xf;
      uVar6 = (uint)uVar7;
      while (uVar7 != 0) {
        uVar3 = 0;
        for (uVar4 = uVar6; (uVar4 & 1) == 0; uVar4 = uVar4 >> 1 | 0x80000000) {
          uVar3 = uVar3 + 1;
        }
        uVar15 = uVar3 + uVar14 & *(ulong *)(param_3 + 0x80);
        pcVar2 = (char *)(lVar11 + -0x18 + uVar15 * -0x18);
        auVar18[0] = -(*pcVar2 == DAT_1459132b0);
        auVar18[1] = -(pcVar2[1] == cRam00000001459132b1);
        auVar18[2] = -(pcVar2[2] == cRam00000001459132b2);
        auVar18[3] = -(pcVar2[3] == cRam00000001459132b3);
        auVar18[4] = -(pcVar2[4] == cRam00000001459132b4);
        auVar18[5] = -(pcVar2[5] == cRam00000001459132b5);
        auVar18[6] = -(pcVar2[6] == cRam00000001459132b6);
        auVar18[7] = -(pcVar2[7] == cRam00000001459132b7);
        auVar18[8] = -(pcVar2[8] == cRam00000001459132b8);
        auVar18[9] = -(pcVar2[9] == cRam00000001459132b9);
        auVar18[10] = -(pcVar2[10] == cRam00000001459132ba);
        auVar18[0xb] = -(pcVar2[0xb] == cRam00000001459132bb);
        auVar18[0xc] = -(pcVar2[0xc] == cRam00000001459132bc);
        auVar18[0xd] = -(pcVar2[0xd] == cRam00000001459132bd);
        auVar18[0xe] = -(pcVar2[0xe] == cRam00000001459132be);
        auVar18[0xf] = -(pcVar2[0xf] == cRam00000001459132bf);
        if ((ushort)((ushort)(SUB161(auVar18 >> 7,0) & 1) |
                     (ushort)(SUB161(auVar18 >> 0xf,0) & 1) << 1 |
                     (ushort)(SUB161(auVar18 >> 0x17,0) & 1) << 2 |
                     (ushort)(SUB161(auVar18 >> 0x1f,0) & 1) << 3 |
                     (ushort)(SUB161(auVar18 >> 0x27,0) & 1) << 4 |
                     (ushort)(SUB161(auVar18 >> 0x2f,0) & 1) << 5 |
                     (ushort)(SUB161(auVar18 >> 0x37,0) & 1) << 6 |
                     (ushort)(SUB161(auVar18 >> 0x3f,0) & 1) << 7 |
                     (ushort)(SUB161(auVar18 >> 0x47,0) & 1) << 8 |
                     (ushort)(SUB161(auVar18 >> 0x4f,0) & 1) << 9 |
                     (ushort)(SUB161(auVar18 >> 0x57,0) & 1) << 10 |
                     (ushort)(SUB161(auVar18 >> 0x5f,0) & 1) << 0xb |
                     (ushort)(SUB161(auVar18 >> 0x67,0) & 1) << 0xc |
                     (ushort)(SUB161(auVar18 >> 0x6f,0) & 1) << 0xd |
                     (ushort)(SUB161(auVar18 >> 0x77,0) & 1) << 0xe |
                    (ushort)(auVar18[0xf] >> 7) << 0xf) == 0xffff) {
          uVar14 = *(ulong *)(lVar11 + uVar15 * -0x18 + -8);
          if ((uVar14 < *(ulong *)(param_3 + 0x218)) &&
             (uVar14 = *(ulong *)(*(long *)(param_3 + 0x210) + uVar14 * 8), uVar14 != 0)) {
            lVar11 = ~uVar14 * 0x38;
            if (*(char *)(*(long *)(param_3 + 0x1e0) + 0x30 + lVar11) == '\x01') {
              pcVar9 = (code *)**(undefined8 **)(*(long *)(param_3 + 0x1e0) + lVar11 + 0x10);
            }
          }
          goto LAB_14005dc3f;
        }
        uVar7 = (ushort)(uVar6 - 1) & (ushort)uVar6;
        uVar6 = CONCAT22((short)(uVar6 - 1 >> 0x10),uVar7);
      }
      auVar16[0] = -(*pcVar1 == -1);
      auVar16[1] = -(pcVar1[1] == -1);
      auVar16[2] = -(pcVar1[2] == -1);
      auVar16[3] = -(pcVar1[3] == -1);
      auVar16[4] = -(pcVar1[4] == -1);
      auVar16[5] = -(pcVar1[5] == -1);
      auVar16[6] = -(pcVar1[6] == -1);
      auVar16[7] = -(pcVar1[7] == -1);
      auVar16[8] = -(pcVar1[8] == -1);
      auVar16[9] = -(pcVar1[9] == -1);
      auVar16[10] = -(pcVar1[10] == -1);
      auVar16[0xb] = -(pcVar1[0xb] == -1);
      auVar16[0xc] = -(pcVar1[0xc] == -1);
      auVar16[0xd] = -(pcVar1[0xd] == -1);
      auVar16[0xe] = -(pcVar1[0xe] == -1);
      auVar16[0xf] = -(pcVar1[0xf] == -1);
      if ((((((((((((((((SUB161(auVar16 >> 7,0) & 1) != 0 || (SUB161(auVar16 >> 0xf,0) & 1) != 0) ||
                      (SUB161(auVar16 >> 0x17,0) & 1) != 0) || (SUB161(auVar16 >> 0x1f,0) & 1) != 0)
                    || (SUB161(auVar16 >> 0x27,0) & 1) != 0) || (SUB161(auVar16 >> 0x2f,0) & 1) != 0
                   ) || (SUB161(auVar16 >> 0x37,0) & 1) != 0) ||
                 (SUB161(auVar16 >> 0x3f,0) & 1) != 0) || (SUB161(auVar16 >> 0x47,0) & 1) != 0) ||
               (SUB161(auVar16 >> 0x4f,0) & 1) != 0) || (SUB161(auVar16 >> 0x57,0) & 1) != 0) ||
             (SUB161(auVar16 >> 0x5f,0) & 1) != 0) || (SUB161(auVar16 >> 0x67,0) & 1) != 0) ||
           (SUB161(auVar16 >> 0x6f,0) & 1) != 0) || (SUB161(auVar16 >> 0x77,0) & 1) != 0) ||
          auVar16[0xf] < '\0') break;
      uVar14 = uVar14 + lVar10 + 0x10;
      lVar10 = lVar10 + 0x10;
    }
  }
LAB_14005dc3f:
  local_58 = 0;
  local_44 = CONCAT44(local_44._4_4_,uVar5);
  local_50 = local_38;
  uStack_34 = uStack_4c;
  local_30 = local_48;
  func_0x000145776a10();
  (*pcVar9)();
  return;
}
