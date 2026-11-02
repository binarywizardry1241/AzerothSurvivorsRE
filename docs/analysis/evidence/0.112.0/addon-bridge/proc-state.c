
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_1459510e0(undefined8 param_1,undefined8 param_2,long param_3,undefined8 *param_4)

{
  undefined8 *puVar1;
  undefined4 *puVar2;
  undefined4 uVar3;
  uint uVar4;
  undefined8 uVar5;
  long lVar6;
  ulong uVar7;
  long *plVar8;
  long lVar9;
  long lVar10;
  float fVar11;
  float extraout_XMM0_Da;
  float fVar12;
  float fVar13;
  undefined4 in_XMM6_Da;
  long *local_80;
  undefined4 local_78;
  undefined8 local_74;
  undefined4 local_6c;
  undefined4 local_68;
  undefined8 local_64;
  undefined8 local_5c;
  undefined8 uStack_54;
  undefined4 local_4c;
  undefined8 local_48;
  undefined4 uStack_40;
  undefined4 uStack_3c;
  undefined4 uStack_38;
  undefined4 uStack_34;
  undefined4 uStack_30;
  undefined4 local_28;

  if (*(long *)(param_3 + 0x338) != 0) {
    lVar6 = *(long *)(param_3 + 0x330);
    lVar9 = *(long *)(param_3 + 0x338) * 0x58;
    lVar10 = 0;
    do {
      if (((*(long **)(lVar6 + lVar10))[1] == 9) &&
         (plVar8 = (long *)**(long **)(lVar6 + lVar10),
         (char)plVar8[1] == 'e' && *plVar8 == 0x676172646f6f6c62)) {
        uVar3 = *(undefined4 *)(param_3 + 0x8f4);
        *param_4 = 0x146c0abba;
        param_4[1] = 9;
        param_4[2] = CONCAT44(uRam00000001463974d4,uVar3);
        return;
      }
      lVar10 = lVar10 + 0x58;
    } while (lVar9 - lVar10 != 0);
    lVar10 = 0;
    do {
      if (((*(long **)(lVar6 + lVar10))[1] == 9) &&
         (plVar8 = (long *)**(long **)(lVar6 + lVar10),
         (char)plVar8[1] == 'e' && *plVar8 == 0x7461665f6c616573)) {
        uVar4 = *(uint *)(param_3 + 0x900);
        uVar5 = 0x146c0abc3;
        goto LAB_14595121d;
      }
      lVar10 = lVar10 + 0x58;
    } while (lVar9 - lVar10 != 0);
    lVar10 = 0;
    do {
      if (((*(long **)(lVar6 + lVar10))[1] == 9) &&
         (plVar8 = (long *)**(long **)(lVar6 + lVar10),
         (char)plVar8[1] == 'e' && *plVar8 == 0x7269665f6c756f73)) {
        uVar4 = *(uint *)(param_3 + 0x908);
        uVar5 = 0x146c0abcc;
LAB_14595121d:
        *param_4 = uVar5;
        param_4[1] = 9;
        *(float *)(param_4 + 2) = (float)uVar4;
        *(undefined4 *)((long)param_4 + 0x14) = 0x40a00000;
        return;
      }
      lVar10 = lVar10 + 0x58;
    } while (lVar9 - lVar10 != 0);
    lVar10 = 0;
    do {
      local_80 = *(long **)(lVar6 + lVar10);
      if ((local_80[1] == 9) &&
         (plVar8 = (long *)*local_80, (char)plVar8[1] == 'l' && *plVar8 == 0x6c6577746867696c)) {
        local_78 = *(undefined4 *)(lVar6 + 8 + lVar10);
        local_6c = *(undefined4 *)(lVar6 + 0x14 + lVar10);
        local_68 = *(undefined4 *)(lVar6 + 0x18 + lVar10);
        local_4c = *(undefined4 *)(lVar6 + 0x34 + lVar10);
        puVar1 = (undefined8 *)(lVar6 + 0x24 + lVar10);
        local_5c = *puVar1;
        uStack_54 = puVar1[1];
        puVar1 = (undefined8 *)(lVar6 + 0x38 + lVar10);
        local_48 = *puVar1;
        puVar2 = (undefined4 *)(lVar6 + 0x44 + lVar10);
        uStack_38 = puVar2[1];
        uStack_34 = puVar2[2];
        uStack_30 = puVar2[3];
        _uStack_40 = CONCAT44(*puVar2,(int)puVar1[1]);
        local_74 = *(undefined8 *)(lVar6 + 0xc + lVar10);
        local_64 = *(undefined8 *)(lVar6 + 0x1c + lVar10);
        fVar13 = *(float *)(param_3 + 0xa4c);
        if (*(long *)(param_3 + 0x8c0) != 0) {
          lVar6 = *(long *)(param_3 + 0x8c0) * 0x20;
          fVar11 = *(float *)(*(long *)(param_3 + 0x8b8) + -4 + lVar6);
          if (fVar11 <= _DAT_145dad478) {
            fVar11 = _DAT_145dad478;
          }
          fVar11 = (*(float *)(*(long *)(param_3 + 0x8b8) + -0xc + lVar6) - fVar13) / fVar11;
          goto LAB_1459513de;
        }
        local_28 = in_XMM6_Da;
        uVar7 = func_0x00014599ad30(param_4,plVar8,param_3 + 0x480,&local_80);
        fVar11 = extraout_XMM0_Da;
        if ((uVar7 & 1) == 0) {
          fVar11 = _DAT_145db1734;
        }
        fVar12 = _DAT_145ec2940;
        if (*(long *)(param_3 + 0x860) == 0) goto LAB_1459513c3;
        lVar6 = *(long *)(param_3 + 0x858);
        lVar9 = 0;
        goto LAB_145951399;
      }
      lVar10 = lVar10 + 0x58;
    } while (lVar9 - lVar10 != 0);
  }
  *param_4 = 0;
  return;
LAB_145951399:
  if ((*(long *)(lVar6 + 8 + lVar9) == 9) &&
     ((char)(*(long **)(lVar6 + lVar9))[1] == (char)plVar8[1] &&
      **(long **)(lVar6 + lVar9) == *plVar8)) {
    fVar12 = *(float *)(lVar6 + 0x10 + lVar9);
    goto LAB_1459513c3;
  }
  lVar9 = lVar9 + 0x18;
  if (*(long *)(param_3 + 0x860) * 0x18 == lVar9) {
LAB_1459513c3:
    fVar12 = fVar12 - fVar13;
    if (fVar12 <= 0.0) {
      fVar12 = 0.0;
    }
    fVar11 = _DAT_145dad260 - fVar12 / fVar11;
LAB_1459513de:
    fVar13 = 0.0;
    if (0.0 <= fVar11) {
      fVar13 = fVar11;
    }
    fVar11 = _DAT_145dad260;
    if (fVar13 <= _DAT_145dad260) {
      fVar11 = fVar13;
    }
    *param_4 = 0x146c0abd5;
    param_4[1] = 9;
    *(float *)(param_4 + 2) = fVar11;
    *(undefined4 *)((long)param_4 + 0x14) = 0x3f800000;
    return;
  }
  goto LAB_145951399;
}
