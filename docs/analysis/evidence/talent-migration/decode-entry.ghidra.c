long entry(void)

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
  int local_88;
  undefined8 local_80;
  long local_70;
  long local_68;
  undefined8 local_60;
  long local_58;
  undefined8 local_50;
  undefined1 local_48;

  if (*(char *)((long)in_RCX + 0x49) == '\0') {
    plVar11 = in_RCX + 3;
    plVar10 = &local_70;
    do {
      lVar14 = *plVar11;
      func_0x0001459a67a0();
      if ((int)local_70 == 1) {
        local_68 = local_68 - in_RCX[1];
        lVar14 = lVar14 + in_RCX[1];
        in_RCX[1] = local_60;
      }
      else {
        if (*(char *)((long)in_RCX + 0x49) != '\0') {
          return 0;
        }
        *(undefined1 *)((long)in_RCX + 0x49) = 1;
        local_68 = in_RCX[2] - in_RCX[1];
        if ((local_68 != 0 | *(byte *)(in_RCX + 9)) != 1) {
          return 0;
        }
        lVar14 = in_RCX[1] + *plVar11;
      }
      puVar2 = (undefined1 *)*in_RCX;
      local_60 = 0;
      local_48 = 1;
      local_50 = 0x3a0000003a;
      local_70 = lVar14;
      local_58 = local_68;
      func_0x0001459a67a0();
      if (local_88 == 1) {
        uVar1 = *puVar2;
        auVar15 = func_0x00014006f550(plVar10,plVar11,local_80,lVar14);
        func_0x0001458e6190(plVar11,in_RCX,auVar15._0_8_,uVar1,auVar15._8_8_);
        if (extraout_RDX != 0) {
          auVar15 = func_0x00014006f550();
          uVar9 = auVar15._8_8_;
          pcVar6 = auVar15._0_8_;
          if (uVar9 != 0) {
            if (uVar9 == 1) {
              cVar12 = *pcVar6;
              if ((cVar12 == '+') || (cVar12 == '-')) goto LAB_1459a65a0;
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
                if (9 < uVar5) goto LAB_1459a65a0;
                if (uVar9 - uVar7 != 1) {
                  if (9 < pbVar8[1] - 0x30) goto LAB_1459a65a0;
                  uVar5 = (uint)(byte)((char)(pbVar8[1] - 0x30) + (char)uVar5 * '\n');
                }
              }
LAB_1459a657d:
              bVar3 = (byte)uVar5;
              if (*(byte *)(extraout_RDX + 0x72) < (byte)uVar5) {
                bVar3 = *(byte *)(extraout_RDX + 0x72);
              }
              if (bVar3 != 0) {
                return extraout_RDX;
              }
            }
            else {
              lVar14 = 0;
              uVar5 = 0;
              while( true ) {
                if (lVar14 == uVar9 - uVar7) goto LAB_1459a657d;
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
LAB_1459a65a0:
    } while (*(char *)((long)in_RCX + 0x49) != '\x01');
  }
  return 0;
}
