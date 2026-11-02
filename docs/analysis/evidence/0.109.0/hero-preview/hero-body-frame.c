/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 *
entry(undefined8 param_1,undefined8 param_2,undefined4 param_3,undefined8 param_4,undefined8 param_5
     ,long param_6,undefined8 *param_7)

{
  code *pcVar1;
  undefined8 *puVar2;
  float fVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  undefined4 uVar8;
  undefined4 local_100;
  undefined8 local_d8;
  undefined8 uStack_d0;
  undefined8 uStack_b0;

  if ((*(byte *)(param_6 + 0x2c) & 1) == 0) {
    uVar6 = (undefined4)_DAT_145f3db70;
    uVar7 = (undefined4)((ulong)_DAT_145f3db70 >> 0x20);
    uVar4 = (undefined4)_DAT_145f3db80;
    uVar5 = (undefined4)((ulong)_DAT_145f3db80 >> 0x20);
    local_100 = _DAT_145f3db90;
    fVar3 = 0.0;
    uVar8 = _DAT_145f3db94;
  }
  else {
    local_100 = *(undefined4 *)(param_6 + 0x54);
    uVar4 = (undefined4)*(undefined8 *)(param_6 + 0x4c);
    uVar5 = (undefined4)((ulong)*(undefined8 *)(param_6 + 0x4c) >> 0x20);
    uVar6 = (undefined4)*(undefined8 *)(param_6 + 0x30);
    uVar7 = (undefined4)((ulong)*(undefined8 *)(param_6 + 0x30) >> 0x20);
    fVar3 = *(float *)(param_6 + 0x48) * _DAT_145d9d2a4;
    uVar8 = *(undefined4 *)(param_6 + 0x38);
  }
  func_0x000145bfa117(fVar3);
  func_0x000145bfa11d(fVar3);
  func_0x0001407e6e70();
  func_0x000140002200();
  puVar2 = (undefined8 *)func_0x0001400021c0();
  if (puVar2 != (undefined8 *)0x0) {
    *puVar2 = CONCAT44(uVar5,uVar4);
    *(undefined4 *)(puVar2 + 1) = local_100;
    *(undefined4 *)((long)puVar2 + 0xc) = param_3;
    param_7[4] = 0x3f8000003f800000;
    param_7[5] = uStack_b0;
    param_7[2] = CONCAT44(uVar7,uVar6);
    param_7[3] = CONCAT44(0x3f800000,uVar8);
    *param_7 = local_d8;
    param_7[1] = uStack_d0;
    *(undefined4 *)(param_7 + 6) = 8;
    param_7[7] = puVar2;
    param_7[8] = 0x145f485f0;
    return param_7;
  }
  func_0x000145d992a1();
                    /* WARNING: Does not return */
  pcVar1 = (code *)invalidInstructionException();
  (*pcVar1)();
}
