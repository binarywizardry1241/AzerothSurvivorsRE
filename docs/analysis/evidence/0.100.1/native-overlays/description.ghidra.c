
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 param_4,float *param_5)

{
  byte bVar1;
  long lVar2;
  undefined4 extraout_XMM0_Da;
  undefined4 uVar3;
  float fVar4;
  float fVar5;
  long local_f8;

  lVar2 = *param_3;
  bVar1 = *(char *)(lVar2 + 0x75) - 2;
  fVar4 = _DAT_145907490;
  if (bVar1 < 7) {
    fVar4 = *(float *)((ulong)bVar1 * 4 + 0x1469f58dc);
  }
  fVar4 = (*(float *)(lVar2 + 0x44) * _DAT_1459186f0 * *(float *)(param_3 + 2) *
           *(float *)(param_3 + 7) * fVar4 +
          (float)(-(uint)(0.0 < *(float *)(lVar2 + 0x44)) &
                 (uint)(*(float *)((long)param_3 + 0x4c) * *param_5))) * param_5[1];
  func_0x000145457cb0(lVar2,param_2,0x15,0x1469f4806);
  func_0x00014548d390(extraout_XMM0_Da,fVar4);
  func_0x0001454875e0();
  uVar3 = func_0x000145458060();
  if (local_f8 != 0) {
    uVar3 = func_0x0001400021d0();
  }
  func_0x00014548d390(uVar3,*(undefined4 *)(lVar2 + 0x4c));
  fVar4 = *(float *)(lVar2 + 0x50) *
          *(float *)((long)param_3 + 0x1c) * *(float *)((long)param_3 + 0x44) * param_5[10];
  if (_DAT_145c193e4 < fVar4) {
    fVar5 = _DAT_145915800;
    fVar4 = (float)func_0x000145773367((fVar4 + _DAT_1469da200) / _DAT_145915800);
    fVar4 = fVar4 * fVar5 + _DAT_145c193e4;
  }
  func_0x00014548d390(fVar4,fVar4);
  func_0x000145457cb0();
                    /* WARNING: Could not emulate address calculation at 0x000145487954 */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)((long)*(int *)((ulong)*(byte *)(lVar2 + 0x75) * 4 + 0x1469f5a8c) + 0x1469f5a8c))();
  return;
}
