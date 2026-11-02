undefined1  [16] entry(void)

{
  bool bVar1;
  byte *pbVar2;
  byte bVar3;
  short sVar4;
  uint uVar5;
  undefined8 uVar7;
  uint uVar8;
  long *in_RCX;
  ulong uVar9;
  byte *pbVar10;
  ulong uVar11;
  ulong uVar12;
  byte *pbVar13;
  byte *pbVar14;
  undefined8 *in_R8;
  byte bVar15;
  byte *pbVar16;
  byte *unaff_R13;
  long lVar17;
  undefined1 auVar18 [16];
  int local_58;
  long local_48;
  int *piVar6;

  if (*(char *)((long)in_RCX + 0x41) == '\0') {
    do {
      func_0x000145c30330();
      if (local_58 == 1) {
        *in_RCX = local_48;
      }
      else if ((*(char *)((long)in_RCX + 0x41) != '\0') ||
              (*(undefined1 *)((long)in_RCX + 0x41) = 1,
              (in_RCX[1] != *in_RCX | *(byte *)(in_RCX + 8)) != 1)) break;
      auVar18 = func_0x0001401f3a70();
      piVar6 = auVar18._0_8_;
      if ((5 < auVar18._8_8_) && ((short)piVar6[1] == 0x7c73 && *piVar6 == 0x65636172)) {
        lVar17 = (long)piVar6 + 6;
        pbVar16 = (byte *)(auVar18._8_8_ - 6);
        *in_R8 = 0;
        in_R8[1] = pbVar16;
        in_R8[2] = lVar17;
        in_R8[3] = pbVar16;
        in_R8[4] = 0;
        in_R8[5] = pbVar16;
        in_R8[6] = 0x2c0000002c;
        *(undefined1 *)(in_R8 + 7) = 1;
        *(undefined2 *)(in_R8 + 8) = 1;
        pbVar14 = (byte *)0x0;
        pbVar2 = (byte *)0x0;
joined_r0x000145c1e8ce:
        do {
          unaff_R13 = pbVar2;
          if (pbVar16 < pbVar14) {
LAB_145c1e997:
            *(undefined1 *)((long)in_R8 + 0x41) = 1;
            bVar1 = true;
            uVar11 = (long)pbVar16 - (long)unaff_R13;
            pbVar13 = unaff_R13;
          }
          else {
            if ((ulong)((long)pbVar16 - (long)pbVar14) < 0x10) {
              uVar11 = 0;
              if (pbVar16 != pbVar14) {
                do {
                  if (pbVar14[uVar11 + lVar17] == 0x2c) goto LAB_145c1e950;
                  uVar11 = uVar11 + 1;
                } while ((long)pbVar16 - (long)pbVar14 != uVar11);
              }
LAB_145c1e990:
              in_R8[4] = pbVar16;
              pbVar14 = pbVar16;
              goto LAB_145c1e997;
            }
            auVar18 = func_0x000145f7f230();
            uVar11 = auVar18._8_8_;
            if (auVar18._0_8_ != 1) goto LAB_145c1e990;
LAB_145c1e950:
            pbVar13 = pbVar14 + uVar11 + 1;
            in_R8[4] = pbVar13;
            pbVar10 = pbVar14 + uVar11;
            pbVar14 = pbVar13;
            pbVar2 = unaff_R13;
            if ((pbVar16 <= pbVar10) || (pbVar10[lVar17] != 0x2c)) goto joined_r0x000145c1e8ce;
            *in_R8 = pbVar13;
            bVar1 = false;
            uVar11 = (long)pbVar10 - (long)unaff_R13;
          }
          if (uVar11 != 0) {
            unaff_R13 = unaff_R13 + lVar17;
            if (uVar11 == 1) {
              bVar3 = *unaff_R13;
              if ((bVar3 == 0x2b) || (bVar3 == 0x2d)) goto LAB_145c1e8c0;
            }
            else {
              bVar3 = *unaff_R13;
            }
            uVar9 = (ulong)(bVar3 == 0x2b);
            uVar12 = uVar11 - uVar9;
            unaff_R13 = unaff_R13 + uVar9;
            if (uVar12 < 3) {
              if (uVar11 == uVar9) {
                uVar5 = 0;
              }
              else {
                uVar5 = *unaff_R13 - 0x30;
                if (9 < uVar5) goto LAB_145c1e8c0;
                if (uVar12 != 1) {
                  uVar8 = unaff_R13[1] - 0x30;
                  if (9 < uVar8) goto LAB_145c1e8c0;
                  uVar5 = CONCAT31((int3)(uVar8 >> 8),(char)uVar8 + (char)uVar5 * '\n');
                }
              }
LAB_145c1e8ad:
              unaff_R13 = (byte *)(ulong)uVar5;
              uVar7 = func_0x000145b49850();
              if ((char)uVar7 != '\0') {
                uVar7 = CONCAT71((int7)((ulong)uVar7 >> 8),1);
                goto LAB_145c1e778;
              }
            }
            else {
              uVar11 = 0;
              uVar5 = 0;
              while( true ) {
                if (uVar12 == uVar11) goto LAB_145c1e8ad;
                sVar4 = (ushort)(byte)uVar5 * 10;
                if ((char)((ushort)sVar4 >> 8) != '\0') break;
                bVar3 = (byte)sVar4;
                bVar15 = (byte)(unaff_R13[uVar11] - 0x30);
                uVar5 = (uint)(byte)(bVar3 + bVar15);
                if ((9 < unaff_R13[uVar11] - 0x30) || (uVar11 = uVar11 + 1, CARRY1(bVar3,bVar15)))
                break;
              }
            }
          }
LAB_145c1e8c0:
          pbVar2 = pbVar13;
        } while (!bVar1);
      }
      if (*(char *)((long)in_RCX + 0x41) == '\x01') break;
    } while( true );
  }
  uVar7 = 0;
LAB_145c1e778:
  auVar18._8_8_ = (ulong)unaff_R13 & 0xffffffff;
  auVar18._0_8_ = uVar7;
  return auVar18;
}
