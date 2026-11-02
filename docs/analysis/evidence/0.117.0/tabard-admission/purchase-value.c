
/* WARNING: Removing unreachable block (ram,0x000145b2bde9) */

bool entry(undefined8 param_1,undefined8 param_2,char *param_3,undefined8 param_4,ulong param_5)

{
  char cVar1;
  ulong uVar2;
  byte *pbVar3;
  uint uVar4;
  int iVar6;
  uint uVar7;
  ulong uVar8;
  long lVar9;
  bool bVar10;
  ulong uVar5;

  if (param_5 == 0) {
    return false;
  }
  if (param_5 == 1) {
    cVar1 = *param_3;
    if (cVar1 == '+') {
      return false;
    }
    if (cVar1 == '-') {
      return false;
    }
  }
  else {
    cVar1 = *param_3;
  }
  uVar2 = (ulong)(cVar1 == '+');
  uVar8 = param_5 - uVar2;
  pbVar3 = (byte *)(param_3 + uVar2);
  if (uVar8 < 9) {
    if (param_5 == uVar2) {
      iVar6 = 0;
    }
    else {
      uVar4 = *pbVar3 - 0x30;
      uVar5 = (ulong)uVar4;
      if (9 < uVar4) {
        return false;
      }
      if (uVar8 != 1) {
        if (9 < pbVar3[1] - 0x30) {
          return false;
        }
        uVar4 = (pbVar3[1] - 0x30) + uVar4 * 10;
        uVar5 = (ulong)uVar4;
        if (uVar8 != 2) {
          if (9 < pbVar3[2] - 0x30) {
            return false;
          }
          uVar4 = (pbVar3[2] - 0x30) + uVar4 * 10;
          uVar5 = (ulong)uVar4;
          if (uVar8 != 3) {
            if (9 < pbVar3[3] - 0x30) {
              return false;
            }
            uVar4 = (pbVar3[3] - 0x30) + uVar4 * 10;
            uVar5 = (ulong)uVar4;
            if (uVar8 != 4) {
              if (9 < pbVar3[4] - 0x30) {
                return false;
              }
              uVar4 = (pbVar3[4] - 0x30) + uVar4 * 10;
              uVar5 = (ulong)uVar4;
              if (uVar8 != 5) {
                if (9 < pbVar3[5] - 0x30) {
                  return false;
                }
                uVar4 = (pbVar3[5] - 0x30) + uVar4 * 10;
                uVar5 = (ulong)uVar4;
                if (uVar8 != 6) {
                  if (9 < pbVar3[6] - 0x30) {
                    return false;
                  }
                  uVar4 = (pbVar3[6] - 0x30) + uVar4 * 10;
                  uVar5 = (ulong)uVar4;
                  if (uVar8 != 7) {
                    if (9 < pbVar3[7] - 0x30) {
                      return false;
                    }
                    uVar5 = (ulong)((pbVar3[7] - 0x30) + uVar4 * 10);
                  }
                }
              }
            }
          }
        }
      }
LAB_145b2bc38:
      iVar6 = (int)uVar5;
    }
    uVar4 = iVar6 - 0x15f91;
    if (((byte)(0x1fffc3f >> ((byte)uVar4 & 0x1f)) & uVar4 < 0x19) != 1) {
      return false;
    }
    bVar10 = *(long *)(*(long *)((ulong)uVar4 * 8 + 0x1475c60a0) + 0x20) == 0;
  }
  else {
    uVar5 = 0;
    lVar9 = 0;
    do {
      if (lVar9 == param_5 - uVar2) goto LAB_145b2bc38;
      uVar4 = (uint)(uVar5 * 10);
      if ((int)(uVar5 * 10 >> 0x20) != 0) {
        return false;
      }
      uVar7 = pbVar3[lVar9] - 0x30;
      uVar5 = (ulong)(uVar4 + uVar7);
      bVar10 = false;
      if (9 < uVar7) {
        return false;
      }
      lVar9 = lVar9 + 1;
    } while (!CARRY4(uVar4,uVar7));
  }
  return bVar10;
}
