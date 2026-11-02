long FUN_1459d6f70(void)

{
  undefined1 uVar1;
  undefined1 *puVar2;
  byte bVar3;
  short sVar4;
  uint uVar5;
  char *pcVar6;
  ulong uVar7;
  undefined8 *in_RCX;
  byte *pbVar8;
  long extraout_RDX;
  ulong uVar9;
  long *plVar10;
  long *plVar11;
  char cVar12;
  byte bVar13;
  long lVar14;
  undefined1 auVar15 [16];
  int iStack_88;
  undefined8 uStack_80;
  long lStack_70;
  long lStack_68;
  undefined8 uStack_60;
  long lStack_58;
  undefined8 uStack_50;
  undefined1 uStack_48;

  if (*(char *)((long)in_RCX + 0x49) == '\0') {
    plVar11 = in_RCX + 3;
    plVar10 = &lStack_70;
    do {
      lVar14 = *plVar11;
      func_0x0001459d71d0();
      if ((int)lStack_70 == 1) {
        lStack_68 = lStack_68 - in_RCX[1];
        lVar14 = lVar14 + in_RCX[1];
        in_RCX[1] = uStack_60;
      }
      else {
        if (*(char *)((long)in_RCX + 0x49) != '\0') {
          return 0;
        }
        *(undefined1 *)((long)in_RCX + 0x49) = 1;
        lStack_68 = in_RCX[2] - in_RCX[1];
        if ((lStack_68 != 0 | *(byte *)(in_RCX + 9)) != 1) {
          return 0;
        }
        lVar14 = in_RCX[1] + *plVar11;
      }
      puVar2 = (undefined1 *)*in_RCX;
      uStack_60 = 0;
      uStack_48 = 1;
      uStack_50 = 0x3a0000003a;
      lStack_70 = lVar14;
      lStack_58 = lStack_68;
      func_0x0001459d71d0();
      if (iStack_88 == 1) {
        uVar1 = *puVar2;
        auVar15 = func_0x0001400695f0(plVar10,plVar11,uStack_80,lVar14);
        FUN_1459a2ab0(plVar11,in_RCX,auVar15._0_8_,uVar1,auVar15._8_8_);
        if (extraout_RDX != 0) {
          auVar15 = func_0x0001400695f0();
          uVar9 = auVar15._8_8_;
          pcVar6 = auVar15._0_8_;
          if (uVar9 != 0) {
            if (uVar9 == 1) {
              cVar12 = *pcVar6;
              if ((cVar12 == '+') || (cVar12 == '-')) goto LAB_1459d6fd0;
            }
            else {
              cVar12 = *pcVar6;
            }
            uVar7 = (ulong)(cVar12 == '+');
            pbVar8 = (byte *)(pcVar6 + uVar7);
            if (uVar9 - uVar7 < 3) {
              if (uVar9 == uVar7) {
                uVar5 = 0;
              }
              else {
                uVar5 = *pbVar8 - 0x30;
                if (9 < uVar5) goto LAB_1459d6fd0;
                if (uVar9 - uVar7 != 1) {
                  if (9 < pbVar8[1] - 0x30) goto LAB_1459d6fd0;
                  uVar5 = (uint)(byte)((char)(pbVar8[1] - 0x30) + (char)uVar5 * '\n');
                }
              }
LAB_1459d6fad:
              bVar3 = (byte)uVar5;
              if (*(byte *)(extraout_RDX + 0x9a) < (byte)uVar5) {
                bVar3 = *(byte *)(extraout_RDX + 0x9a);
              }
              if (bVar3 != 0) {
                return extraout_RDX;
              }
            }
            else {
              lVar14 = 0;
              uVar5 = 0;
              while( true ) {
                if (lVar14 == uVar9 - uVar7) goto LAB_1459d6fad;
                sVar4 = (ushort)(byte)uVar5 * 10;
                if ((char)((ushort)sVar4 >> 8) != '\0') break;
                bVar3 = (byte)sVar4;
                bVar13 = (byte)(pbVar8[lVar14] - 0x30);
                uVar5 = (uint)(byte)(bVar3 + bVar13);
                if ((9 < pbVar8[lVar14] - 0x30) || (lVar14 = lVar14 + 1, CARRY1(bVar3,bVar13)))
                break;
              }
            }
          }
        }
      }
LAB_1459d6fd0:
    } while (*(char *)((long)in_RCX + 0x49) != '\x01');
  }
  return 0;
}
