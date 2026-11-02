/* WARNING: Removing unreachable block (ram,0x0001459b77db) */

undefined1  [16] entry(void)

{
  long *plVar1;
  uint uVar2;
  ulong uVar3;
  byte *pbVar4;
  byte bVar5;
  long *in_RCX;
  ulong uVar6;
  long lVar7;
  ulong uVar8;
  ulong uVar9;
  uint uVar10;
  byte *unaff_R15;
  undefined1 auVar11 [16];
  int local_b0;
  undefined4 uStack_ac;
  long local_a8;
  long local_a0;
  long local_98;
  char local_47;

  uVar8 = 0;
  if (*(char *)((long)in_RCX + 0x41) == '\0') {
    plVar1 = in_RCX + 2;
    do {
      unaff_R15 = (byte *)*plVar1;
      func_0x0001459c7330();
      if (local_b0 == 1) {
        uVar9 = local_a8 - *in_RCX;
        unaff_R15 = unaff_R15 + *in_RCX;
        *in_RCX = local_a0;
      }
      else {
        if (*(char *)((long)in_RCX + 0x41) != '\0') break;
        *(undefined1 *)((long)in_RCX + 0x41) = 1;
        unaff_R15 = (byte *)*in_RCX;
        uVar9 = in_RCX[1] - (long)unaff_R15;
        if ((uVar9 != 0 | *(byte *)(in_RCX + 8)) != 1) break;
        unaff_R15 = unaff_R15 + *plVar1;
      }
      if (uVar9 != 0) {
        if (uVar9 == 1) {
          bVar5 = *unaff_R15;
          if ((bVar5 == 0x2b) || (bVar5 == 0x2d)) goto LAB_1459b7540;
        }
        else {
          bVar5 = *unaff_R15;
        }
        uVar3 = (ulong)(bVar5 == 0x2b);
        uVar6 = uVar9 - uVar3;
        unaff_R15 = unaff_R15 + uVar3;
        if (uVar6 < 9) {
          if (uVar9 == uVar3) {
            pbVar4 = (byte *)0x0;
          }
          else {
            uVar2 = *unaff_R15 - 0x30;
            if (9 < uVar2) goto LAB_1459b7540;
            pbVar4 = (byte *)(ulong)uVar2;
            if (uVar6 != 1) {
              if (9 < unaff_R15[1] - 0x30) goto LAB_1459b7540;
              uVar2 = (unaff_R15[1] - 0x30) + uVar2 * 10;
              pbVar4 = (byte *)(ulong)uVar2;
              if (uVar6 != 2) {
                if (9 < unaff_R15[2] - 0x30) goto LAB_1459b7540;
                uVar2 = (unaff_R15[2] - 0x30) + uVar2 * 10;
                pbVar4 = (byte *)(ulong)uVar2;
                if (uVar6 != 3) {
                  if (9 < unaff_R15[3] - 0x30) goto LAB_1459b7540;
                  uVar2 = (unaff_R15[3] - 0x30) + uVar2 * 10;
                  pbVar4 = (byte *)(ulong)uVar2;
                  if (uVar6 != 4) {
                    if (9 < unaff_R15[4] - 0x30) goto LAB_1459b7540;
                    uVar2 = (unaff_R15[4] - 0x30) + uVar2 * 10;
                    pbVar4 = (byte *)(ulong)uVar2;
                    if (uVar6 != 5) {
                      if (9 < unaff_R15[5] - 0x30) goto LAB_1459b7540;
                      uVar2 = (unaff_R15[5] - 0x30) + uVar2 * 10;
                      pbVar4 = (byte *)(ulong)uVar2;
                      if (uVar6 != 6) {
                        if (9 < unaff_R15[6] - 0x30) goto LAB_1459b7540;
                        uVar2 = (unaff_R15[6] - 0x30) + uVar2 * 10;
                        pbVar4 = (byte *)(ulong)uVar2;
                        if (uVar6 != 7) {
                          if (9 < unaff_R15[7] - 0x30) goto LAB_1459b7540;
                          pbVar4 = (byte *)(ulong)((unaff_R15[7] - 0x30) + uVar2 * 10);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
LAB_1459b7750:
          unaff_R15 = pbVar4;
          func_0x0001459a4ba0();
          if (CONCAT44(uStack_ac,local_b0) != -1) {
            if (CONCAT44(uStack_ac,local_b0) != 0) {
              func_0x0001400021d0();
            }
            if (local_98 != 0) {
              func_0x0001400021d0();
            }
            if (local_47 != '\0') {
              uVar8 = 1;
              break;
            }
          }
        }
        else {
          pbVar4 = (byte *)0x0;
          lVar7 = 0;
          while( true ) {
            if (lVar7 == uVar9 - uVar3) goto LAB_1459b7750;
            uVar2 = (uint)((long)pbVar4 * 10);
            if ((int)((ulong)((long)pbVar4 * 10) >> 0x20) != 0) break;
            uVar10 = unaff_R15[lVar7] - 0x30;
            pbVar4 = (byte *)(ulong)(uVar2 + uVar10);
            if ((9 < uVar10) || (lVar7 = lVar7 + 1, CARRY4(uVar2,uVar10))) break;
          }
        }
      }
LAB_1459b7540:
    } while (*(char *)((long)in_RCX + 0x41) != '\x01');
  }
  auVar11._0_8_ = uVar8 & 0xffffffff;
  auVar11._8_8_ = (ulong)unaff_R15 & 0xffffffff;
  return auVar11;
}
