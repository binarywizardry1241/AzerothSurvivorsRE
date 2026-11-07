undefined8 * entry(void)

{
  undefined1 auVar1 [16];
  char cVar2;
  uint uVar3;
  uint uVar4;
  ulong uVar5;
  ulong uVar6;
  undefined8 *in_RCX;
  long lVar7;
  ulong uVar8;
  ulong uVar9;
  ulong uVar10;
  char *in_R8;
  undefined8 uVar11;
  long in_R9;
  int local_70 [2];
  ulong local_68;
  long local_60;
  char *local_58;
  long local_50;
  undefined8 local_48;
  long local_40;
  undefined8 local_38;
  undefined1 local_30;

  local_48 = 0;
  local_30 = 1;
  local_38 = 0x3a0000003a;
  local_58 = in_R8;
  local_50 = in_R9;
  local_40 = in_R9;
  func_0x0001458aabb0(in_R9,in_RCX,&local_58,local_70);
  if (local_70[0] == 1) {
    if (local_68 == 0) {
      uVar11 = 0;
    }
    else {
      if (local_68 == 1) {
        cVar2 = *in_R8;
        uVar11 = 0;
        if ((cVar2 == '+') || (cVar2 == '-')) goto LAB_1458a962c;
      }
      else {
        cVar2 = *in_R8;
      }
      uVar9 = (ulong)(cVar2 == '+');
      if (local_68 - uVar9 < 0x11) {
        if (local_68 == uVar9) {
          uVar6 = 0;
        }
        else {
          uVar11 = 0;
          lVar7 = 0;
          uVar6 = 0;
          do {
            if (9 < (byte)in_R8[lVar7 + uVar9] - 0x30) goto LAB_1458a962c;
            uVar6 = (ulong)((byte)in_R8[lVar7 + uVar9] - 0x30) + uVar6 * 10;
            lVar7 = lVar7 + 1;
          } while (lVar7 != local_68 + -uVar9);
        }
LAB_1458a9557:
        uVar9 = in_R9 - local_60;
        if (uVar9 == 0) {
          uVar11 = 0;
        }
        else {
          in_R8 = in_R8 + local_60;
          if (uVar9 == 1) {
            cVar2 = *in_R8;
            uVar11 = 0;
            if ((cVar2 == '+') || (cVar2 == '-')) goto LAB_1458a962c;
          }
          else {
            cVar2 = *in_R8;
          }
          uVar5 = (ulong)(cVar2 == '+');
          uVar10 = uVar9 - uVar5;
          if (uVar10 < 9) {
            if (uVar9 == uVar5) {
              uVar9 = 0;
            }
            else {
              uVar11 = 0;
              uVar8 = 0;
              uVar9 = 0;
              do {
                if (9 < (byte)in_R8[uVar8 + uVar5] - 0x30) goto LAB_1458a962c;
                uVar9 = (ulong)(((byte)in_R8[uVar8 + uVar5] - 0x30) + (int)uVar9 * 10);
                uVar8 = uVar8 + 1;
              } while (uVar10 != uVar8);
            }
LAB_1458a9609:
            uVar11 = 0;
            if (uVar6 < 0x13) {
              in_RCX[1] = uVar6;
              *(int *)(in_RCX + 2) = (int)uVar9;
              uVar11 = 1;
            }
          }
          else {
            uVar11 = 0;
            uVar8 = 0;
            uVar9 = 0;
            while( true ) {
              if (uVar10 == uVar8) goto LAB_1458a9609;
              uVar3 = (uint)(uVar9 * 10);
              if ((int)(uVar9 * 10 >> 0x20) != 0) break;
              uVar4 = (byte)in_R8[uVar8 + uVar5] - 0x30;
              uVar9 = (ulong)(uVar3 + uVar4);
              if ((9 < uVar4) || (uVar8 = uVar8 + 1, CARRY4(uVar3,uVar4))) goto LAB_1458a962c;
            }
            uVar11 = 0;
          }
        }
      }
      else {
        uVar11 = 0;
        lVar7 = 0;
        uVar6 = 0;
        while( true ) {
          if (lVar7 == local_68 + -uVar9) goto LAB_1458a9557;
          auVar1._8_8_ = 0;
          auVar1._0_8_ = uVar6;
          uVar5 = SUB168(auVar1 * ZEXT816(10),0);
          if (SUB168(auVar1 * ZEXT816(10),8) != 0) break;
          uVar3 = (byte)in_R8[lVar7 + uVar9] - 0x30;
          uVar6 = uVar5 + uVar3;
          if ((9 < uVar3) || (lVar7 = lVar7 + 1, CARRY8(uVar5,(ulong)uVar3))) break;
        }
      }
    }
  }
  else {
    uVar11 = 0;
  }
LAB_1458a962c:
  *in_RCX = uVar11;
  return in_RCX;
}
