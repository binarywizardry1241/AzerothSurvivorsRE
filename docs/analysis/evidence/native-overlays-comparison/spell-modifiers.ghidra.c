
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 *
entry(undefined8 param_1,undefined8 param_2,long param_3,undefined8 *param_4,undefined8 *param_5)

{
  undefined4 uVar1;
  undefined4 uVar2;
  undefined8 *puVar3;
  undefined4 uVar4;
  code *UNRECOVERED_JUMPTABLE;
  float fVar5;
  float fVar6;

  *param_4 = _DAT_1458eb540;
  *(undefined4 *)(param_4 + 1) = 0;
  uVar1 = uRam00000001458f8d3c;
  uVar2 = uRam00000001458f8d38;
  uVar4 = uRam00000001458f8d34;
  *(undefined4 *)((long)param_4 + 0xc) = _DAT_1458f8d30;
  *(undefined4 *)(param_4 + 2) = uVar4;
  *(undefined4 *)((long)param_4 + 0x14) = uVar2;
  *(undefined4 *)(param_4 + 3) = uVar1;
  fVar6 = 0.0;
  if (*(long *)(param_3 + 0x28) != 0) {
    UNRECOVERED_JUMPTABLE =
         (code *)((long)*(int *)((ulong)**(byte **)(param_3 + 0x20) * 4 + 0x1467206c8) + 0x1467206c8
                 );
                    /* WARNING: Could not emulate address calculation at 0x00014541603c */
                    /* WARNING: Treating indirect jump as call */
    puVar3 = (undefined8 *)
             (*UNRECOVERED_JUMPTABLE)
                       (*param_5,*(undefined8 *)(*(byte **)(param_3 + 0x20) + 0x10),0x1467206c8,
                        UNRECOVERED_JUMPTABLE);
    return puVar3;
  }
  fVar5 = _DAT_1458eb480 - 0.0;
  if (_DAT_1458eb480 - 0.0 <= _DAT_14590aefc) {
    fVar5 = _DAT_14590aefc;
  }
  *(float *)((long)param_4 + 4) = fVar5;
  fVar5 = (float)func_0x000145756e1f(0);
  uVar4 = 0;
  if (fVar6 <= fVar5) {
    uVar4 = (undefined4)(long)fVar5;
  }
  uVar2 = 0xffffffff;
  if (fVar5 <= _DAT_1458eb51c) {
    uVar2 = uVar4;
  }
  *(undefined4 *)(param_4 + 1) = uVar2;
  return param_4;
}
