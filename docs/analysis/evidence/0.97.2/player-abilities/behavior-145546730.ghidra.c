
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 *
entry(undefined8 param_1,undefined8 param_2,long param_3,undefined8 *param_4,undefined8 *param_5)

{
  undefined4 uVar1;
  undefined4 uVar2;
  long lVar3;
  undefined4 *puVar4;
  long lVar5;
  undefined4 *puVar6;
  float fVar7;
  float fVar8;
  float fVar9;
  float fVar10;
  float fVar11;
  undefined4 local_d8;
  undefined4 uStack_d4;
  undefined4 uStack_d0;
  undefined4 uStack_cc;
  long local_a8;
  long local_90;
  
  local_90 = 0;
  local_a8 = 0;
  puVar6 = *(undefined4 **)(param_3 + 8);
  lVar3 = *(long *)(param_3 + 0x10);
  puVar4 = *(undefined4 **)(param_3 + 0x18);
  if (puVar6 != puVar4) {
    fVar7 = (float)*param_5;
    fVar8 = (float)((ulong)*param_5 >> 0x20);
    fVar9 = _DAT_14590aec8;
    do {
      while( true ) {
        uVar1 = *puVar6;
        fVar10 = (float)*(undefined8 *)(puVar6 + 1);
        fVar11 = (float)((ulong)*(undefined8 *)(puVar6 + 1) >> 0x20);
        uVar2 = puVar6[7];
        local_d8 = (undefined4)*(undefined8 *)(puVar6 + 3);
        uStack_d4 = (undefined4)((ulong)*(undefined8 *)(puVar6 + 3) >> 0x20);
        uStack_d0 = (undefined4)*(undefined8 *)(puVar6 + 5);
        uStack_cc = (undefined4)((ulong)*(undefined8 *)(puVar6 + 5) >> 0x20);
        if ((fVar11 - fVar8) * (fVar11 - fVar8) + (fVar10 - fVar7) * (fVar10 - fVar7) <= fVar9)
        break;
        if (local_a8 == 0) {
          func_0x0001457580b0();
        }
        lVar5 = local_a8 * 0x20;
        *(undefined4 *)(lVar5 + 8) = uVar1;
        *(ulong *)(lVar5 + 0xc) = CONCAT44(fVar11,fVar10);
        *(undefined4 *)(lVar5 + 0x14) = local_d8;
        *(undefined4 *)(lVar5 + 0x18) = uStack_d4;
        *(undefined4 *)(lVar5 + 0x1c) = uStack_d0;
        *(undefined4 *)(lVar5 + 0x20) = uStack_cc;
        *(undefined4 *)(lVar5 + 0x24) = uVar2;
        local_a8 = local_a8 + 1;
        puVar6 = puVar6 + 8;
        if (puVar6 == puVar4) goto LAB_1455468ac;
      }
      if (local_90 == 0) {
        func_0x0001457580b0();
      }
      lVar5 = local_90 * 0x20;
      *(undefined4 *)(lVar5 + 8) = uVar1;
      *(ulong *)(lVar5 + 0xc) = CONCAT44(fVar11,fVar10);
      *(undefined4 *)(lVar5 + 0x14) = local_d8;
      *(undefined4 *)(lVar5 + 0x18) = uStack_d4;
      *(undefined4 *)(lVar5 + 0x1c) = uStack_d0;
      *(undefined4 *)(lVar5 + 0x20) = uStack_cc;
      *(undefined4 *)(lVar5 + 0x24) = uVar2;
      local_90 = local_90 + 1;
      puVar6 = puVar6 + 8;
    } while (puVar6 != puVar4);
  }
LAB_1455468ac:
  if (lVar3 != 0) {
    func_0x0001400021d0();
  }
  param_4[2] = local_90;
  *param_4 = 0;
  param_4[1] = 8;
  param_4[3] = 0;
  param_4[4] = 8;
  param_4[5] = local_a8;
  return param_4;
}

