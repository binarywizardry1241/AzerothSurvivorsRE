
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

  *param_4 = _DAT_145dad510;
  *(undefined4 *)(param_4 + 1) = 0;
  uVar1 = uRam0000000145db138c;
  uVar2 = uRam0000000145db1388;
  uVar4 = uRam0000000145db1384;
  *(undefined4 *)((long)param_4 + 0xc) = _DAT_145db1380;
  *(undefined4 *)(param_4 + 2) = uVar4;
  *(undefined4 *)((long)param_4 + 0x14) = uVar2;
  *(undefined4 *)(param_4 + 3) = uVar1;
  fVar6 = 0.0;
  if (*(long *)(param_3 + 0x28) != 0) {
    UNRECOVERED_JUMPTABLE =
         (code *)((long)*(int *)((ulong)**(byte **)(param_3 + 0x20) * 4 + 0x146bfed4c) + 0x146bfed4c
                 );
                    /* WARNING: Could not emulate address calculation at 0x000145897bac */
                    /* WARNING: Treating indirect jump as call */
    puVar3 = (undefined8 *)
             (*UNRECOVERED_JUMPTABLE)
                       (*param_5,*(undefined8 *)(*(byte **)(param_3 + 0x20) + 0x10),0x146bfed4c,
                        UNRECOVERED_JUMPTABLE);
    return puVar3;
  }
  fVar5 = _DAT_145dad260 - 0.0;
  if (_DAT_145dad260 - 0.0 <= _DAT_145dbab00) {
    fVar5 = _DAT_145dbab00;
  }
  *(float *)((long)param_4 + 4) = fVar5;
  fVar5 = (float)func_0x000145c0a41d(0);
  uVar4 = 0;
  if (fVar6 <= fVar5) {
    uVar4 = (undefined4)(long)fVar5;
  }
  uVar2 = 0xffffffff;
  if (fVar5 <= _DAT_145db6b44) {
    uVar2 = uVar4;
  }
  *(undefined4 *)(param_4 + 1) = uVar2;
  return param_4;
}
