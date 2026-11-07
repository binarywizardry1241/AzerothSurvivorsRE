/* WARNING: Removing unreachable block (ram,0x0001458aa2be) */

undefined4 *
FUN_1458a9e50(undefined8 param_1,undefined8 param_2,undefined8 param_3,undefined4 *param_4,
             undefined8 param_5,undefined8 param_6)

{
  char *pcVar1;
  byte bVar2;
  byte bVar3;
  uint uVar4;
  uint uVar5;
  ulong uVar6;
  uint uVar7;
  undefined4 uVar8;
  byte *pbVar9;
  ulong uVar10;
  ulong uVar11;
  char cVar12;
  ulong uVar13;
  long lVar14;
  byte bVar15;
  undefined8 local_b0;
  undefined8 uStack_a8;
  undefined8 local_a0;
  long local_98;
  undefined8 *local_90;
  long local_88;
  undefined4 local_80;
  undefined4 uStack_7c;
  undefined4 uStack_78;
  undefined4 uStack_74;

  func_0x000140089200(param_1,param_4,param_6,param_5);
  func_0x0001459bd2c0();
  if ((((local_88 == 4) && (local_90[1] == 6)) &&
      ((short)((int *)*local_90)[1] == 0x746e && *(int *)*local_90 == 0x656c6174)) &&
     (uVar11 = local_90[3], uVar11 != 0)) {
    pcVar1 = (char *)local_90[2];
    if (uVar11 == 1) {
      cVar12 = *pcVar1;
      if ((cVar12 == '+') || (cVar12 == '-')) goto LAB_1458a9ee9;
    }
    else {
      cVar12 = *pcVar1;
    }
    uVar6 = (ulong)(cVar12 == '+');
    pbVar9 = (byte *)(pcVar1 + uVar6);
    if (uVar11 - uVar6 < 3) {
      if (uVar11 == uVar6) {
        bVar3 = 0;
      }
      else {
        bVar3 = (byte)(*pbVar9 - 0x30);
        if (9 < *pbVar9 - 0x30) goto LAB_1458a9ee9;
        if (uVar11 - uVar6 != 1) {
          if (9 < pbVar9[1] - 0x30) goto LAB_1458a9ee9;
          bVar3 = (char)(pbVar9[1] - 0x30) + bVar3 * '\n';
        }
      }
LAB_1458a9fde:
      uVar11 = local_90[5];
      if (uVar11 != 0) {
        pcVar1 = (char *)local_90[4];
        if (uVar11 == 1) {
          cVar12 = *pcVar1;
          if ((cVar12 == '+') || (cVar12 == '-')) goto LAB_1458a9ee9;
        }
        else {
          cVar12 = *pcVar1;
        }
        uVar13 = (ulong)(cVar12 == '+');
        uVar6 = uVar11 - uVar13;
        pbVar9 = (byte *)(pcVar1 + uVar13);
        if (uVar6 < 9) {
          if (uVar11 == uVar13) {
            uVar10 = 0;
LAB_1458aa101:
            uVar10 = uVar10 << 0x20;
          }
          else {
            uVar7 = *pbVar9 - 0x30;
            uVar10 = (ulong)uVar7;
            if (9 < uVar7) goto LAB_1458a9ee9;
            if (uVar6 == 1) goto LAB_1458aa101;
            if (9 < pbVar9[1] - 0x30) goto LAB_1458a9ee9;
            uVar7 = (pbVar9[1] - 0x30) + uVar7 * 10;
            uVar10 = (ulong)uVar7;
            if (uVar6 == 2) goto LAB_1458aa101;
            if (9 < pbVar9[2] - 0x30) goto LAB_1458a9ee9;
            uVar7 = (pbVar9[2] - 0x30) + uVar7 * 10;
            uVar10 = (ulong)uVar7;
            if (uVar6 == 3) {
LAB_1458aa09b:
              uVar10 = uVar10 << 0x20;
            }
            else {
              if (9 < pbVar9[3] - 0x30) goto LAB_1458a9ee9;
              uVar7 = (pbVar9[3] - 0x30) + uVar7 * 10;
              uVar10 = (ulong)uVar7;
              if (uVar6 == 4) goto LAB_1458aa09b;
              if (9 < pbVar9[4] - 0x30) goto LAB_1458a9ee9;
              uVar7 = (pbVar9[4] - 0x30) + uVar7 * 10;
              uVar10 = (ulong)uVar7;
              if (uVar6 == 5) goto LAB_1458aa09b;
              if (9 < pbVar9[5] - 0x30) goto LAB_1458a9ee9;
              uVar7 = (pbVar9[5] - 0x30) + uVar7 * 10;
              uVar10 = (ulong)uVar7;
              if (uVar6 == 6) goto LAB_1458aa09b;
              if (9 < pbVar9[6] - 0x30) goto LAB_1458a9ee9;
              uVar7 = (pbVar9[6] - 0x30) + uVar7 * 10;
              uVar10 = (ulong)uVar7;
              if (uVar6 == 7) goto LAB_1458aa09b;
              if (9 < pbVar9[7] - 0x30) goto LAB_1458a9ee9;
              uVar10 = (ulong)((pbVar9[7] - 0x30) + uVar7 * 10) << 0x20;
            }
          }
          uVar11 = uVar10 >> 0x20;
          uVar8 = (undefined4)(uVar10 >> 0x20);
          uVar7 = 0x6e;
          do {
            uVar4 = (uint)uVar11 - (uVar7 - 0x1e);
            if ((((uint)uVar11 < uVar7 - 0x1e) ||
                (uVar5 = uVar4 - (uVar7 - 0xf), uVar4 < uVar7 - 0xf)) ||
               (uVar11 = (ulong)(uVar5 - uVar7), uVar5 < uVar7)) break;
            uVar7 = uVar7 + 0x2d;
          } while (uVar7 != 0x36b);
          func_0x00014590fa90();
          func_0x0001459106e0();
          local_80._3_1_ = (byte)local_b0;
          local_80 = (uint)local_80._3_1_ << 0x18;
          uStack_7c = (undefined4)((ulong)local_b0 >> 8);
          uStack_78._0_3_ = (undefined3)((ulong)local_b0 >> 0x28);
          uStack_78._3_1_ = (undefined1)uStack_a8;
          uStack_74 = (undefined4)((ulong)uStack_a8 >> 8);
          *param_4 = uVar8;
          *(byte *)(param_4 + 1) = bVar3;
          *(int *)((long)param_4 + 5) = local_80;
          *(undefined4 *)((long)param_4 + 9) = uStack_7c;
          *(undefined4 *)((long)param_4 + 0xd) = uStack_78;
          *(undefined4 *)((long)param_4 + 0x11) = uStack_74;
          *(undefined8 *)(param_4 + 4) = uStack_a8;
          *(undefined8 *)(param_4 + 6) = local_a0;
          goto joined_r0x0001458a9ef8;
        }
        uVar10 = 0;
        lVar14 = 0;
        while( true ) {
          if (lVar14 == uVar11 - uVar13) goto LAB_1458aa101;
          uVar7 = (uint)(uVar10 * 10);
          if ((int)(uVar10 * 10 >> 0x20) != 0) break;
          uVar4 = pbVar9[lVar14] - 0x30;
          uVar10 = (ulong)(uVar7 + uVar4);
          if ((9 < uVar4) || (lVar14 = lVar14 + 1, CARRY4(uVar7,uVar4))) break;
        }
      }
    }
    else {
      lVar14 = 0;
      bVar3 = 0;
      while( true ) {
        if (lVar14 == uVar11 - uVar6) goto LAB_1458a9fde;
        if ((char)((ushort)((ushort)bVar3 * 10) >> 8) != '\0') break;
        bVar2 = (byte)((ushort)bVar3 * 10);
        bVar15 = (byte)(pbVar9[lVar14] - 0x30);
        bVar3 = bVar2 + bVar15;
        if ((9 < pbVar9[lVar14] - 0x30) || (lVar14 = lVar14 + 1, CARRY1(bVar2,bVar15))) break;
      }
    }
  }
LAB_1458a9ee9:
  *(undefined8 *)(param_4 + 2) = 0xffffffffffffffff;
joined_r0x0001458a9ef8:
  if (local_98 != 0) {
    func_0x0001400021d0();
  }
  return param_4;
}
