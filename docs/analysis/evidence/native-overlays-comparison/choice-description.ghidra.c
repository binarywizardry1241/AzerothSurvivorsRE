
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
  fVar4 = _DAT_1458eb480;
  if (bVar1 < 7) {
    fVar4 = *(float *)((ulong)bVar1 * 4 + 0x1469a9f74);
  }
  fVar4 = (*(float *)(lVar2 + 0x44) * _DAT_1458f8d40 * *(float *)(param_3 + 2) *
           *(float *)(param_3 + 7) * fVar4 +
          (float)(-(uint)(0.0 < *(float *)(lVar2 + 0x44)) &
                 (uint)(*(float *)((long)param_3 + 0x4c) * *param_5))) * param_5[1];
  func_0x000145452400(lVar2,param_2,0x15,0x1469a8eb6);
  func_0x00014547ccf0(extraout_XMM0_Da,fVar4);
  func_0x000145476f40();
  uVar3 = func_0x000145452790();
  if (local_f8 != 0) {
    uVar3 = func_0x0001400021d0();
  }
  func_0x00014547ccf0(uVar3,*(undefined4 *)(lVar2 + 0x4c));
  fVar4 = *(float *)(lVar2 + 0x50) *
          *(float *)((long)param_3 + 0x1c) * *(float *)((long)param_3 + 0x44) * param_5[10];
  if (_DAT_145bfc414 < fVar4) {
    fVar5 = _DAT_1458f8de0;
    fVar4 = (float)func_0x000145756f57((fVar4 + _DAT_14698ebd0) / _DAT_1458f8de0);
    fVar4 = fVar4 * fVar5 + _DAT_145bfc414;
  }
  func_0x00014547ccf0(fVar4,fVar4);
  func_0x000145452400();
                    /* WARNING: Could not emulate address calculation at 0x0001454772b4 */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)((long)*(int *)((ulong)*(byte *)(lVar2 + 0x75) * 4 + 0x1469aa120) + 0x1469aa120))();
  return;
}
