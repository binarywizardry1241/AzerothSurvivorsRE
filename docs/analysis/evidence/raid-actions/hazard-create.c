
long entry(undefined4 param_1,undefined8 param_2,undefined8 param_3,undefined4 param_4,
          undefined8 param_5,undefined8 param_6,undefined8 param_7,long param_8,undefined8 *param_9)

{
  undefined8 *puVar1;
  long lVar2;
  long lVar3;
  undefined8 uVar4;
  undefined8 uVar5;
  ulong uVar6;
  long lVar7;
  int iVar8;
  undefined4 extraout_XMM0_Da;
  undefined4 uVar9;
  float fVar10;
  undefined4 in_stack_00000028;
  undefined4 in_stack_00000030;
  float in_stack_00000038;
  undefined4 in_stack_00000040;
  undefined4 in_stack_00000048;
  undefined8 *in_stack_00000050;
  int local_c0;
  undefined4 uStack_bc;
  undefined4 uStack_b4;
  
  iVar8 = *(int *)(param_8 + 0xa38) + 1;
  *(int *)(param_8 + 0xa38) = iVar8;
  fVar10 = *(float *)(param_8 + 0xa34);
  lVar2 = *(long *)(param_8 + 0x998);
  uVar6 = func_0x0001458d6f90(param_1,param_4,in_stack_00000028);
  uVar9 = extraout_XMM0_Da;
  if (((uVar6 & 1) == 0) &&
     ((*(long *)(lVar2 + 0x68) == -1 || (func_0x0001458dc180(), uVar9 = uStack_b4, local_c0 != 1))))
  {
    uVar9 = *(undefined4 *)(lVar2 + 0xb8);
  }
  uVar4 = *in_stack_00000050;
  uVar5 = in_stack_00000050[1];
  lVar2 = *(long *)(param_8 + 0x598);
  if (lVar2 == *(long *)(param_8 + 0x588)) {
    func_0x000145bfad30();
  }
  lVar3 = *(long *)(param_8 + 0x590);
  lVar7 = lVar2 * 0x80;
  *(undefined8 *)(lVar3 + lVar7) = 0;
  puVar1 = (undefined8 *)(lVar3 + 8 + lVar7);
  *puVar1 = CONCAT44(uStack_bc,local_c0);
  puVar1[1] = uVar4;
  *(undefined8 *)(lVar3 + 0x18 + lVar7) = uVar5;
  *(undefined8 *)(lVar3 + 0x20 + lVar7) = param_7;
  *(undefined8 *)(lVar3 + 0x28 + lVar7) = 0;
  *(undefined8 *)(lVar3 + 0x30 + lVar7) = *param_9;
  *(undefined4 *)(lVar3 + 0x38 + lVar7) = *(undefined4 *)(param_9 + 1);
  *(int *)(lVar3 + 0x3c + lVar7) = iVar8;
  *(undefined4 *)(lVar3 + 0x40 + lVar7) = param_4;
  *(undefined4 *)(lVar3 + 0x44 + lVar7) = in_stack_00000028;
  *(undefined4 *)(lVar3 + 0x48 + lVar7) = uVar9;
  *(undefined4 *)(lVar3 + 0x4c + lVar7) = in_stack_00000030;
  *(float *)(lVar3 + 0x50 + lVar7) = fVar10;
  *(float *)(lVar3 + 0x54 + lVar7) = in_stack_00000038 + fVar10;
  *(undefined4 *)(lVar3 + 0x58 + lVar7) = 0;
  *(undefined4 *)(lVar3 + 0x5c + lVar7) = in_stack_00000040;
  *(undefined4 *)(lVar3 + 0x60 + lVar7) = in_stack_00000048;
  *(undefined4 *)(lVar3 + 100 + lVar7) = 0x7f800000;
  puVar1 = (undefined8 *)(lVar3 + 0x68 + lVar7);
  *puVar1 = 0;
  puVar1[1] = 0;
  *(undefined8 *)(lVar3 + 0x77 + lVar7) = 0;
  *(long *)(param_8 + 0x598) = lVar2 + 1;
  return lVar2;
}

