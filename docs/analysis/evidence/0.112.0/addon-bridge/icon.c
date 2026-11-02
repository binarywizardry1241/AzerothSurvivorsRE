
undefined1  [16]
FUN_14599e770(undefined8 param_1,undefined8 param_2,undefined8 param_3,long param_4)

{
  long lVar1;
  byte bVar2;
  long lVar3;
  long lVar4;
  byte *pbVar5;
  long lVar6;
  undefined1 auVar7 [16];
  long *local_78;
  long local_70 [6];
  undefined8 local_40;
  undefined8 local_30 [2];
  long local_20;
  long local_18;
  undefined8 uStack_10;
  undefined8 uStack_8;

  if (*(long *)(param_4 + 0x18) != 0) {
    auVar7._8_8_ = *(long *)(param_4 + 0x18);
    auVar7._0_8_ = *(undefined8 *)(param_4 + 0x10);
    return auVar7;
  }
  local_70[1] = 1;
  local_70[2] = 0x14723e460;
  local_70[3] = 0x14723eb68;
  local_70[4] = 0;
  local_40 = 0;
  local_20 = 0;
  local_78 = local_70;
  local_30[0] = 0;
  local_70[0] = param_4;
  uStack_10 = param_1;
  uStack_8 = param_2;
  lVar3 = FUN_1459f0270(param_1,param_2,&local_78,local_70 + 2,local_30);
  if (lVar3 == 0) {
    if ((local_20 != 0) && (local_20 != local_18)) {
      lVar3 = local_20;
      do {
        lVar1 = lVar3 + 0xa0;
        if (*(long *)(lVar3 + 0x68) != 0) {
          pbVar5 = *(byte **)(lVar3 + 0x60);
          lVar4 = *(long *)(lVar3 + 0x68) << 6;
          do {
            bVar2 = *pbVar5;
            if (bVar2 < 0x24) {
              lVar6 = 0x10;
              if ((1 < bVar2 - 0x21) && (bVar2 != 2)) {
                if (bVar2 != 0x1d) goto LAB_14599e876;
                lVar6 = 8;
              }
              if (*(long *)(pbVar5 + lVar6) == *local_78) goto LAB_14599e7fd;
            }
LAB_14599e876:
            pbVar5 = pbVar5 + 0x40;
            lVar4 = lVar4 + -0x40;
          } while (lVar4 != 0);
        }
        lVar3 = lVar1;
      } while (lVar1 != local_18);
    }
    return ZEXT816(1);
  }
LAB_14599e7fd:
  return *(undefined1 (*) [16])(lVar3 + 0x50);
}
