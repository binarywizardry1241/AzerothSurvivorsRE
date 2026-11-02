undefined1  [16] entry(void)

{
  long *plVar1;
  byte bVar2;
  short sVar3;
  uint uVar4;
  undefined8 uVar5;
  ulong uVar6;
  uint uVar7;
  long in_RCX;
  ulong uVar8;
  char cVar9;
  long lVar10;
  ulong unaff_RBP;
  long *plVar11;
  byte bVar12;
  char *pcVar13;
  byte *pbVar14;
  undefined1 auVar15 [16];
  undefined1 auVar16 [12];
  int local_60;
  long local_58;
  long local_50;

  plVar11 = (long *)(in_RCX + 0x48);
  if ((*(int *)(in_RCX + 0x7c) != -1) && (*(char *)(in_RCX + 0x89) == '\0')) {
    plVar1 = (long *)(in_RCX + 0x58);
    do {
      lVar10 = *plVar1;
      func_0x000145c49380();
      if (local_60 == 1) {
        uVar8 = local_58 - *plVar11;
        pcVar13 = (char *)(lVar10 + *plVar11);
        *plVar11 = local_50;
      }
      else {
        if (*(char *)(in_RCX + 0x89) != '\0') break;
        *(undefined1 *)(in_RCX + 0x89) = 1;
        uVar8 = *(long *)(in_RCX + 0x50) - *(long *)(in_RCX + 0x48);
        if ((uVar8 != 0 | *(byte *)(in_RCX + 0x88)) != 1) break;
        pcVar13 = (char *)(*(long *)(in_RCX + 0x48) + *plVar1);
      }
      if (uVar8 != 0) {
        if (uVar8 == 1) {
          cVar9 = *pcVar13;
          if ((cVar9 == '+') || (cVar9 == '-')) goto LAB_145c48850;
        }
        else {
          cVar9 = *pcVar13;
        }
        uVar6 = (ulong)(cVar9 == '+');
        pbVar14 = (byte *)(pcVar13 + uVar6);
        if (uVar8 - uVar6 < 3) {
          if (uVar8 == uVar6) {
            uVar4 = 0;
          }
          else {
            uVar4 = *pbVar14 - 0x30;
            if (9 < uVar4) goto LAB_145c48850;
            if (uVar8 - uVar6 != 1) {
              uVar7 = pbVar14[1] - 0x30;
              if (9 < uVar7) goto LAB_145c48850;
              uVar4 = CONCAT31((int3)(uVar7 >> 8),(char)uVar7 + (char)uVar4 * '\n');
            }
          }
LAB_145c48836:
          unaff_RBP = (ulong)uVar4;
          uVar8 = func_0x000145b49850();
          if ((char)uVar8 != '\0') goto LAB_145c487e8;
        }
        else {
          lVar10 = 0;
          uVar4 = 0;
          while( true ) {
            if (lVar10 == uVar8 - uVar6) goto LAB_145c48836;
            sVar3 = (ushort)(byte)uVar4 * 10;
            if ((char)((ushort)sVar3 >> 8) != '\0') break;
            bVar2 = (byte)sVar3;
            bVar12 = (byte)(pbVar14[lVar10] - 0x30);
            uVar4 = (uint)(byte)(bVar2 + bVar12);
            if ((9 < pbVar14[lVar10] - 0x30) || (lVar10 = lVar10 + 1, CARRY1(bVar2,bVar12))) break;
          }
        }
      }
LAB_145c48850:
    } while (*(char *)(in_RCX + 0x89) != '\x01');
  }
  *(undefined4 *)(in_RCX + 0x7c) = 0xffffffff;
  if (*(int *)(in_RCX + 0x34) != -1) {
    auVar16 = func_0x000145c1e760();
    uVar8 = auVar16._0_8_;
    if ((uVar8 & 1) != 0) {
      unaff_RBP = (ulong)auVar16._8_4_;
LAB_145c487e8:
      uVar5 = CONCAT71((int7)(uVar8 >> 8),1);
      goto LAB_145c48815;
    }
  }
  *(undefined4 *)(in_RCX + 0x7c) = 0xffffffff;
  if ((*(int *)(in_RCX + 0xc4) != -1) && (*(char *)(in_RCX + 0xd1) == '\0')) {
    plVar11 = (long *)(in_RCX + 0xa0);
    do {
      lVar10 = *plVar11;
      func_0x000145c49380();
      if (local_60 == 1) {
        uVar8 = local_58 - *(long *)(in_RCX + 0x90);
        pcVar13 = (char *)(lVar10 + *(long *)(in_RCX + 0x90));
        *(long *)(in_RCX + 0x90) = local_50;
      }
      else {
        if (*(char *)(in_RCX + 0xd1) != '\0') break;
        *(undefined1 *)(in_RCX + 0xd1) = 1;
        uVar8 = *(long *)(in_RCX + 0x98) - *(long *)(in_RCX + 0x90);
        if ((uVar8 != 0 | *(byte *)(in_RCX + 0xd0)) != 1) break;
        pcVar13 = (char *)(*(long *)(in_RCX + 0x90) + *plVar11);
      }
      if (uVar8 != 0) {
        if (uVar8 == 1) {
          cVar9 = *pcVar13;
          if ((cVar9 == '+') || (cVar9 == '-')) goto LAB_145c489d0;
        }
        else {
          cVar9 = *pcVar13;
        }
        uVar6 = (ulong)(cVar9 == '+');
        pbVar14 = (byte *)(pcVar13 + uVar6);
        if (uVar8 - uVar6 < 3) {
          if (uVar8 == uVar6) {
            uVar4 = 0;
          }
          else {
            uVar4 = *pbVar14 - 0x30;
            if (9 < uVar4) goto LAB_145c489d0;
            if (uVar8 - uVar6 != 1) {
              uVar7 = pbVar14[1] - 0x30;
              if (9 < uVar7) goto LAB_145c489d0;
              uVar4 = CONCAT31((int3)(uVar7 >> 8),(char)uVar7 + (char)uVar4 * '\n');
            }
          }
LAB_145c489bc:
          unaff_RBP = (ulong)uVar4;
          uVar8 = func_0x000145b49850();
          if ((char)uVar8 != '\0') goto LAB_145c487e8;
        }
        else {
          lVar10 = 0;
          uVar4 = 0;
          while( true ) {
            if (lVar10 == uVar8 - uVar6) goto LAB_145c489bc;
            sVar3 = (ushort)(byte)uVar4 * 10;
            if ((char)((ushort)sVar3 >> 8) != '\0') break;
            bVar2 = (byte)sVar3;
            bVar12 = (byte)(pbVar14[lVar10] - 0x30);
            uVar4 = (uint)(byte)(bVar2 + bVar12);
            if ((9 < pbVar14[lVar10] - 0x30) || (lVar10 = lVar10 + 1, CARRY1(bVar2,bVar12))) break;
          }
        }
      }
LAB_145c489d0:
    } while (*(char *)(in_RCX + 0xd1) != '\x01');
  }
  *(undefined4 *)(in_RCX + 0xc4) = 0xffffffff;
  uVar5 = 0;
LAB_145c48815:
  auVar15._8_8_ = unaff_RBP & 0xffffffff;
  auVar15._0_8_ = uVar5;
  return auVar15;
}
