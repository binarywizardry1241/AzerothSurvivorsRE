/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_14018d8e0(undefined8 param_1,undefined8 param_2,long *param_3)

{
  uint *puVar1;
  undefined4 uVar2;
  long lVar3;
  long lVar4;
  char *pcVar5;
  code *pcVar6;
  undefined8 uVar7;
  long lVar8;
  undefined8 *puVar9;
  ulong uVar10;
  long lVar11;
  long lVar12;
  ulong uVar13;
  long lVar14;
  uint uVar15;
  long lVar16;
  uint *puVar17;
  undefined1 auVar18 [16];
  undefined1 auVar19 [16];
  undefined1 auVar20 [16];
  undefined1 auVar21 [16];
  char cVar22;
  char cVar23;
  char cVar24;
  char cVar25;
  char cVar26;
  char cVar27;
  char cVar28;
  char cVar29;
  char cVar30;
  char cVar31;
  char cVar32;
  char cVar33;
  char cVar34;
  char cVar35;
  char cVar36;
  char cVar37;
  char cVar38;
  char cVar39;
  char cVar40;
  char cVar41;
  char cVar42;
  char cVar43;
  char cVar44;
  char cVar45;
  char cVar46;
  char cVar47;
  char cVar48;
  char cVar49;
  char cVar50;
  char cVar51;
  char cVar52;
  char cVar53;
  long local_88;
  long local_70;

  lVar3 = *param_3;
  lVar4 = param_3[1];
  uVar2 = *(undefined4 *)((long)param_3 + 0x14);
  puVar17 = *(uint **)(lVar3 + 0xf8);
  puVar1 = puVar17 + *(long *)(lVar3 + 0x100);
  if (*(char *)(lVar3 + 0x108) == '\0') {
    lVar16 = 0;
    lVar14 = 8;
    cVar42 = '\0';
    cVar43 = '\0';
    cVar44 = '\0';
    cVar45 = '\0';
    cVar46 = '\0';
    cVar47 = '\0';
    cVar48 = '\0';
    cVar49 = '\0';
    cVar50 = '\0';
    cVar51 = '\0';
    cVar52 = '\0';
    cVar53 = '\0';
    lVar12 = 0;
    uVar10 = 0;
    cVar22 = DAT_145de4cf0;
    cVar23 = cRam0000000145de4cf1;
    cVar24 = cRam0000000145de4cf2;
    cVar25 = cRam0000000145de4cf3;
    cVar26 = cRam0000000145de4cf4;
    cVar27 = cRam0000000145de4cf5;
    cVar28 = cRam0000000145de4cf6;
    cVar29 = cRam0000000145de4cf7;
    cVar30 = cRam0000000145de4cf8;
    cVar31 = cRam0000000145de4cf9;
    cVar32 = cRam0000000145de4cfa;
    cVar33 = cRam0000000145de4cfb;
    cVar34 = cRam0000000145de4cfc;
    cVar35 = cRam0000000145de4cfd;
    cVar36 = cRam0000000145de4cfe;
    cVar37 = cRam0000000145de4cff;
    cVar38 = DAT_145de4d10;
    cVar39 = cRam0000000145de4d11;
    cVar40 = cRam0000000145de4d12;
    cVar41 = cRam0000000145de4d13;
LAB_14018da86:
    if ((int)uVar10 == (int)lVar16) {
      do {
        if (puVar17 == puVar1) {
          return;
        }
        uVar15 = *puVar17;
        puVar17 = puVar17 + 1;
        lVar16 = *(long *)(*(long *)(lVar4 + 0x108) + 0x58 + (ulong)uVar15 * 0xa0);
      } while (lVar16 == 0);
      lVar8 = *(long *)(lVar4 + 0x108) + (ulong)uVar15 * 0xa0;
      uVar10 = (ulong)*(uint *)(lVar8 + 0x94);
      lVar14 = *(long *)(*(long *)(lVar4 + 0x1a8) + 0x18 + uVar10 * 0x48);
      lVar11 = ~*(ulong *)(*(long *)(*(long *)(lVar4 + 0x1a8) + 0x38 + uVar10 * 0x48) +
                          *(long *)(lVar3 + 0x110) * 8) * 0x30;
      lVar12 = *(long *)(lVar14 + 0x10 + lVar11);
      local_70 = *(long *)(lVar14 + 0x28 + lVar11);
      lVar14 = *(long *)(lVar8 + 0x50);
      uVar10 = 0;
    }
    lVar8 = uVar10 * 0x10;
    uVar15 = (int)uVar10 + 1;
    uVar10 = (ulong)uVar15;
    uVar13 = (ulong)~*(uint *)(lVar14 + 8 + lVar8);
    lVar11 = uVar13 * 0xf8;
    lVar8 = lVar12 + lVar11;
    if (*(long *)(lVar12 + 0x68 + lVar11) == 0x11) goto code_r0x00014018db2b;
    goto LAB_14018db56;
  }
  lVar16 = 0;
  cVar42 = '\0';
  cVar43 = '\0';
  cVar44 = '\0';
  cVar45 = '\0';
  cVar46 = '\0';
  cVar47 = '\0';
  cVar48 = '\0';
  cVar49 = '\0';
  cVar50 = '\0';
  cVar51 = '\0';
  cVar52 = '\0';
  cVar53 = '\0';
  lVar12 = 0;
  uVar10 = 0;
  cVar22 = DAT_145de4cf0;
  cVar23 = cRam0000000145de4cf1;
  cVar24 = cRam0000000145de4cf2;
  cVar25 = cRam0000000145de4cf3;
  cVar26 = cRam0000000145de4cf4;
  cVar27 = cRam0000000145de4cf5;
  cVar28 = cRam0000000145de4cf6;
  cVar29 = cRam0000000145de4cf7;
  cVar30 = cRam0000000145de4cf8;
  cVar31 = cRam0000000145de4cf9;
  cVar32 = cRam0000000145de4cfa;
  cVar33 = cRam0000000145de4cfb;
  cVar34 = cRam0000000145de4cfc;
  cVar35 = cRam0000000145de4cfd;
  cVar36 = cRam0000000145de4cfe;
  cVar37 = cRam0000000145de4cff;
  cVar38 = DAT_145de4d10;
  cVar39 = cRam0000000145de4d11;
  cVar40 = cRam0000000145de4d12;
  cVar41 = cRam0000000145de4d13;
LAB_14018d945:
  uVar13 = uVar10;
  if ((int)uVar10 == (int)lVar16) {
    do {
      if (puVar17 == puVar1) {
        return;
      }
      uVar15 = *puVar17;
      puVar17 = puVar17 + 1;
      lVar16 = *(long *)(*(long *)(lVar4 + 0x1a8) + 0x10 + (ulong)uVar15 * 0x48);
    } while (lVar16 == 0);
    lVar12 = *(long *)(lVar4 + 0x1a8) + (ulong)uVar15 * 0x48;
    lVar14 = *(long *)(lVar12 + 0x18);
    lVar8 = ~*(ulong *)(*(long *)(lVar12 + 0x38) + *(long *)(lVar3 + 0x110) * 8) * 0x30;
    lVar12 = *(long *)(lVar14 + 0x10 + lVar8);
    local_88 = *(long *)(lVar14 + 0x28 + lVar8);
    uVar13 = 0;
  }
  uVar15 = (int)uVar13 + 1;
  uVar10 = (ulong)uVar15;
  lVar14 = uVar13 * 0xf8 + lVar12;
  if (*(long *)(lVar12 + 0x68 + uVar13 * 0xf8) == 0x11) goto code_r0x00014018d9c7;
  goto LAB_14018d9f2;
code_r0x00014018db2b:
  pcVar5 = *(char **)(lVar8 + 0x60);
  auVar19[0] = -(*pcVar5 == cVar22);
  auVar19[1] = -(pcVar5[1] == cVar23);
  auVar19[2] = -(pcVar5[2] == cVar24);
  auVar19[3] = -(pcVar5[3] == cVar25);
  auVar19[4] = -(pcVar5[4] == cVar26);
  auVar19[5] = -(pcVar5[5] == cVar27);
  auVar19[6] = -(pcVar5[6] == cVar28);
  auVar19[7] = -(pcVar5[7] == cVar29);
  auVar19[8] = -(pcVar5[8] == cVar30);
  auVar19[9] = -(pcVar5[9] == cVar31);
  auVar19[10] = -(pcVar5[10] == cVar32);
  auVar19[0xb] = -(pcVar5[0xb] == cVar33);
  auVar19[0xc] = -(pcVar5[0xc] == cVar34);
  auVar19[0xd] = -(pcVar5[0xd] == cVar35);
  auVar19[0xe] = -(pcVar5[0xe] == cVar36);
  auVar19[0xf] = -(pcVar5[0xf] == cVar37);
  auVar21[0] = -(pcVar5[0x10] == cVar38);
  auVar21[1] = -(cVar39 == '\0');
  auVar21[2] = -(cVar40 == '\0');
  auVar21[3] = -(cVar41 == '\0');
  auVar21[4] = -(cVar42 == '\0');
  auVar21[5] = -(cVar43 == '\0');
  auVar21[6] = -(cVar44 == '\0');
  auVar21[7] = -(cVar45 == '\0');
  auVar21[8] = -(cVar46 == '\0');
  auVar21[9] = -(cVar47 == '\0');
  auVar21[10] = -(cVar48 == '\0');
  auVar21[0xb] = -(cVar49 == '\0');
  auVar21[0xc] = -(cVar50 == '\0');
  auVar21[0xd] = -(cVar51 == '\0');
  auVar21[0xe] = -(cVar52 == '\0');
  auVar21[0xf] = -(cVar53 == '\0');
  auVar21 = auVar21 & auVar19;
  if ((ushort)((ushort)(SUB161(auVar21 >> 7,0) & 1) | (ushort)(SUB161(auVar21 >> 0xf,0) & 1) << 1 |
               (ushort)(SUB161(auVar21 >> 0x17,0) & 1) << 2 |
               (ushort)(SUB161(auVar21 >> 0x1f,0) & 1) << 3 |
               (ushort)(SUB161(auVar21 >> 0x27,0) & 1) << 4 |
               (ushort)(SUB161(auVar21 >> 0x2f,0) & 1) << 5 |
               (ushort)(SUB161(auVar21 >> 0x37,0) & 1) << 6 |
               (ushort)(SUB161(auVar21 >> 0x3f,0) & 1) << 7 |
               (ushort)(SUB161(auVar21 >> 0x47,0) & 1) << 8 |
               (ushort)(SUB161(auVar21 >> 0x4f,0) & 1) << 9 |
               (ushort)(SUB161(auVar21 >> 0x57,0) & 1) << 10 |
               (ushort)(SUB161(auVar21 >> 0x5f,0) & 1) << 0xb |
               (ushort)(SUB161(auVar21 >> 0x67,0) & 1) << 0xc |
               (ushort)(SUB161(auVar21 >> 0x6f,0) & 1) << 0xd |
               (ushort)(SUB161(auVar21 >> 0x77,0) & 1) << 0xe |
              (ushort)(byte)(auVar21[0xf] >> 7) << 0xf) != 0xffff) {
LAB_14018db56:
    func_0x000140002200();
    puVar9 = (undefined8 *)func_0x0001400021c0();
    uVar7 = uRam0000000145de5670;
    if (puVar9 != (undefined8 *)0x0) {
      *puVar9 = _DAT_145de5668;
      puVar9[1] = uVar7;
      *(undefined1 *)(puVar9 + 2) = 0x73;
      *(undefined4 *)(local_70 + uVar13 * 4) = uVar2;
      if (*(long *)(lVar8 + 0x58) != 0) {
        func_0x0001400021d0();
      }
      *(undefined8 *)(lVar8 + 0x58) = 0x11;
      *(undefined8 **)(lVar8 + 0x60) = puVar9;
      *(undefined8 *)(lVar8 + 0x68) = 0x11;
      uVar10 = (ulong)uVar15;
      goto LAB_14018da86;
    }
    goto LAB_14018dbee;
  }
  goto LAB_14018da86;
code_r0x00014018d9c7:
  pcVar5 = *(char **)(lVar14 + 0x60);
  auVar18[0] = -(*pcVar5 == cVar22);
  auVar18[1] = -(pcVar5[1] == cVar23);
  auVar18[2] = -(pcVar5[2] == cVar24);
  auVar18[3] = -(pcVar5[3] == cVar25);
  auVar18[4] = -(pcVar5[4] == cVar26);
  auVar18[5] = -(pcVar5[5] == cVar27);
  auVar18[6] = -(pcVar5[6] == cVar28);
  auVar18[7] = -(pcVar5[7] == cVar29);
  auVar18[8] = -(pcVar5[8] == cVar30);
  auVar18[9] = -(pcVar5[9] == cVar31);
  auVar18[10] = -(pcVar5[10] == cVar32);
  auVar18[0xb] = -(pcVar5[0xb] == cVar33);
  auVar18[0xc] = -(pcVar5[0xc] == cVar34);
  auVar18[0xd] = -(pcVar5[0xd] == cVar35);
  auVar18[0xe] = -(pcVar5[0xe] == cVar36);
  auVar18[0xf] = -(pcVar5[0xf] == cVar37);
  auVar20[0] = -(pcVar5[0x10] == cVar38);
  auVar20[1] = -(cVar39 == '\0');
  auVar20[2] = -(cVar40 == '\0');
  auVar20[3] = -(cVar41 == '\0');
  auVar20[4] = -(cVar42 == '\0');
  auVar20[5] = -(cVar43 == '\0');
  auVar20[6] = -(cVar44 == '\0');
  auVar20[7] = -(cVar45 == '\0');
  auVar20[8] = -(cVar46 == '\0');
  auVar20[9] = -(cVar47 == '\0');
  auVar20[10] = -(cVar48 == '\0');
  auVar20[0xb] = -(cVar49 == '\0');
  auVar20[0xc] = -(cVar50 == '\0');
  auVar20[0xd] = -(cVar51 == '\0');
  auVar20[0xe] = -(cVar52 == '\0');
  auVar20[0xf] = -(cVar53 == '\0');
  auVar20 = auVar20 & auVar18;
  if ((ushort)((ushort)(SUB161(auVar20 >> 7,0) & 1) | (ushort)(SUB161(auVar20 >> 0xf,0) & 1) << 1 |
               (ushort)(SUB161(auVar20 >> 0x17,0) & 1) << 2 |
               (ushort)(SUB161(auVar20 >> 0x1f,0) & 1) << 3 |
               (ushort)(SUB161(auVar20 >> 0x27,0) & 1) << 4 |
               (ushort)(SUB161(auVar20 >> 0x2f,0) & 1) << 5 |
               (ushort)(SUB161(auVar20 >> 0x37,0) & 1) << 6 |
               (ushort)(SUB161(auVar20 >> 0x3f,0) & 1) << 7 |
               (ushort)(SUB161(auVar20 >> 0x47,0) & 1) << 8 |
               (ushort)(SUB161(auVar20 >> 0x4f,0) & 1) << 9 |
               (ushort)(SUB161(auVar20 >> 0x57,0) & 1) << 10 |
               (ushort)(SUB161(auVar20 >> 0x5f,0) & 1) << 0xb |
               (ushort)(SUB161(auVar20 >> 0x67,0) & 1) << 0xc |
               (ushort)(SUB161(auVar20 >> 0x6f,0) & 1) << 0xd |
               (ushort)(SUB161(auVar20 >> 0x77,0) & 1) << 0xe |
              (ushort)(byte)(auVar20[0xf] >> 7) << 0xf) != 0xffff) {
LAB_14018d9f2:
    func_0x000140002200();
    puVar9 = (undefined8 *)func_0x0001400021c0();
    uVar7 = uRam0000000145de5670;
    if (puVar9 == (undefined8 *)0x0) {
LAB_14018dbee:
      func_0x000145d992bb();
                    /* WARNING: Does not return */
      pcVar6 = (code *)invalidInstructionException();
      (*pcVar6)();
    }
    *puVar9 = _DAT_145de5668;
    puVar9[1] = uVar7;
    *(undefined1 *)(puVar9 + 2) = 0x73;
    *(undefined4 *)(local_88 + uVar13 * 4) = uVar2;
    if (*(long *)(lVar14 + 0x58) != 0) {
      func_0x0001400021d0();
    }
    *(undefined8 *)(lVar14 + 0x58) = 0x11;
    *(undefined8 **)(lVar14 + 0x60) = puVar9;
    *(undefined8 *)(lVar14 + 0x68) = 0x11;
    uVar10 = (ulong)uVar15;
  }
  goto LAB_14018d945;
}
