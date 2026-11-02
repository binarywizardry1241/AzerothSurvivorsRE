/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined4 param_1,float param_2,undefined8 param_3,undefined8 param_4,
          undefined8 *param_5,undefined8 *param_6)

{
  byte bVar1;
  long *plVar2;
  float *pfVar3;
  undefined8 uVar4;
  char cVar5;
  long lVar6;
  ulong uVar7;
  byte *pbVar8;
  undefined1 *puVar9;
  long lVar10;
  float fVar11;
  float fVar12;
  undefined1 local_c8;
  undefined3 local_c7;
  float fStack_c4;
  byte bStack_c0;
  undefined4 uStack_bf;
  undefined2 uStack_bb;
  undefined1 uStack_b9;
  undefined8 uStack_b8;
  undefined8 uStack_b0;
  float local_a8;
  undefined4 uStack_a4;
  undefined4 uStack_a0;
  undefined4 uStack_9c;
  undefined4 local_98;
  undefined4 uStack_94;
  undefined4 uStack_90;
  undefined4 uStack_8c;

  pbVar8 = (byte *)*param_6;
  plVar2 = (long *)*param_5;
  lVar10 = param_5[1];
  if (pbVar8 != (byte *)param_6[1]) {
    pfVar3 = (float *)param_6[2];
    uVar7 = (long)param_6[1] - (long)pbVar8;
    puVar9 = (undefined1 *)(lVar10 * 0x40 + param_5[2]);
    lVar6 = 0;
    fVar11 = _DAT_145d6d754;
    fVar12 = _DAT_145ef1c48;
    do {
      cVar5 = *pbVar8 - 0x23;
      if (*pbVar8 < 0x23) {
        cVar5 = '\x02';
      }
      if (cVar5 == '\0') {
        fStack_c4 = *(float *)(pbVar8 + 4) * *pfVar3;
        bStack_c0 = pbVar8[8];
        local_c8 = 0x23;
      }
      else if (cVar5 == '\x01') {
        bVar1 = pbVar8[0x24];
        uStack_b0 = *(undefined8 *)(pbVar8 + 0x18);
        uVar4 = *(undefined8 *)(pbVar8 + 8);
        uStack_b8 = *(undefined8 *)(pbVar8 + 0x10);
        bStack_c0 = (byte)uVar4;
        uStack_bf = (undefined4)((ulong)uVar4 >> 8);
        uStack_bb = (undefined2)((ulong)uVar4 >> 0x28);
        uStack_b9 = (undefined1)((ulong)uVar4 >> 0x38);
        local_a8 = *(float *)(pbVar8 + 0x20) * *pfVar3;
        if (bVar1 == 1) {
          if (fVar11 <= local_a8) {
            local_a8 = fVar11;
          }
          uStack_a4 = CONCAT31(uStack_a4._1_3_,1);
        }
        else if (bVar1 == 2) {
          local_a8 = (float)func_0x000145bc9817(local_a8 + fVar12);
          uStack_a4 = CONCAT31(uStack_a4._1_3_,2);
        }
        else {
          uStack_a4 = CONCAT31(uStack_a4._1_3_,bVar1);
        }
        local_c8 = 0x24;
      }
      else {
        func_0x0001458e0750(param_1,param_2,*pfVar3);
      }
      *(undefined4 *)(puVar9 + 0x30) = local_98;
      *(undefined4 *)(puVar9 + 0x34) = uStack_94;
      *(undefined4 *)(puVar9 + 0x38) = uStack_90;
      *(undefined4 *)(puVar9 + 0x3c) = uStack_8c;
      *(float *)(puVar9 + 0x20) = local_a8;
      *(undefined4 *)(puVar9 + 0x24) = uStack_a4;
      *(undefined4 *)(puVar9 + 0x28) = uStack_a0;
      *(undefined4 *)(puVar9 + 0x2c) = uStack_9c;
      *(undefined4 *)(puVar9 + 0x10) = (undefined4)uStack_b8;
      *(undefined4 *)(puVar9 + 0x14) = uStack_b8._4_4_;
      *(undefined4 *)(puVar9 + 0x18) = (undefined4)uStack_b0;
      *(undefined4 *)(puVar9 + 0x1c) = uStack_b0._4_4_;
      *puVar9 = local_c8;
      *(ulong *)(puVar9 + 1) = CONCAT17(bStack_c0,CONCAT43(fStack_c4,local_c7));
      *(undefined4 *)(puVar9 + 9) = uStack_bf;
      *(undefined2 *)(puVar9 + 0xd) = uStack_bb;
      puVar9[0xf] = uStack_b9;
      lVar6 = lVar6 + -1;
      puVar9 = puVar9 + 0x40;
      pbVar8 = pbVar8 + 0x40;
      param_1 = (undefined4)uStack_b8;
      param_2 = local_a8;
    } while (-lVar6 != uVar7 >> 6);
    lVar10 = lVar10 - lVar6;
  }
  *plVar2 = lVar10;
  return;
}
