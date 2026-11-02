
undefined8 entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,long param_4)

{
  ulong *puVar1;
  uint uVar2;
  ulong uVar3;
  bool bVar4;
  long lVar5;
  byte bVar6;
  long lVar7;
  long lVar8;
  byte bVar9;
  ulong uVar10;
  ulong *puVar11;
  ulong uVar12;
  long lVar13;
  undefined4 in_XMM6_Da;
  float fVar14;
  undefined8 local_70;
  undefined4 local_68;
  long local_60;
  ulong *local_58;
  long local_50;
  undefined4 local_48;
  
  fVar14 = *(float *)(param_4 + 0x8e4);
  local_68 = *(undefined4 *)(param_4 + 0x3f0);
  local_70 = *(undefined8 *)(param_4 + 1000);
  local_48 = in_XMM6_Da;
  func_0x0001454ee0d0(param_1,param_4,param_4,&local_60,&local_70);
  if (local_50 != 0) {
    puVar1 = local_58 + local_50;
    uVar10 = *(long *)(param_4 + 0x4d0) * 0x160;
    puVar11 = local_58;
    do {
      uVar3 = *puVar11;
      puVar11 = puVar11 + 1;
      uVar12 = uVar10;
      lVar8 = *(long *)(param_4 + 0x4c8) + -0x160;
      do {
        lVar7 = lVar8;
        if (uVar12 == 0) goto LAB_1454d57d9;
        lVar8 = lVar7 + 0x160;
        uVar12 = uVar12 - 0x160;
      } while (*(ulong *)(lVar7 + 0x1e8) != uVar3);
      if (((*(long *)(lVar7 + 0x1a0) == -1) || (*(char *)(lVar7 + 0x1c0) == '\x01')) &&
         (*(float *)(lVar7 + 0x2a0) <= fVar14)) {
        if (puVar11 != puVar1) {
          do {
            uVar10 = *puVar11;
            puVar11 = puVar11 + 1;
            lVar7 = *(long *)(param_4 + 0x4d0) * 0x160;
            lVar5 = *(long *)(param_4 + 0x4c8) + -0x160;
            do {
              lVar13 = lVar5;
              if (lVar7 == 0) goto LAB_1454d5870;
              lVar7 = lVar7 + -0x160;
              lVar5 = lVar13 + 0x160;
            } while (*(ulong *)(lVar13 + 0x1e8) != uVar10);
            if (((*(long *)(lVar13 + 0x1a0) == -1) || (*(char *)(lVar13 + 0x1c0) != '\0')) &&
               (*(float *)(lVar13 + 0x2a0) <= fVar14)) {
              bVar6 = (*(long *)(lVar8 + 0x18) != -1) * '\x02' | *(byte *)(lVar8 + 0x158);
              bVar9 = (*(long *)(lVar13 + 0x178) != -1) * '\x02' | *(byte *)(lVar13 + 0x2b8);
              uVar10 = CONCAT71((int7)(uVar10 >> 8),bVar9);
              bVar4 = bVar9 < bVar6;
              if (bVar6 == bVar9) {
                uVar2 = *(uint *)(lVar13 + 0x250);
                uVar10 = (ulong)uVar2;
                bVar4 = (int)((uint)((int)uVar2 >> 0x1f) >> 1 ^ uVar2) <
                        (int)((uint)((int)*(uint *)(lVar8 + 0xf0) >> 0x1f) >> 1 ^
                             *(uint *)(lVar8 + 0xf0));
              }
              if (!bVar4) {
                lVar8 = lVar13 + 0x160;
              }
            }
LAB_1454d5870:
          } while (puVar11 != puVar1);
        }
        if (local_60 != 0) {
          func_0x0001400021d0(uVar10,lVar8,local_60 << 3,local_58,8);
        }
        return 1;
      }
LAB_1454d57d9:
    } while (puVar11 != puVar1);
  }
  if (local_60 != 0) {
    func_0x0001400021d0();
  }
  return 0;
}

