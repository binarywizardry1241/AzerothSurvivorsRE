
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(void)

{
  undefined8 in_RCX;
  undefined8 in_R9;
  float fVar1;
  float fVar2;
  float fVar3;
  float *in_stack_00000028;

  fVar3 = *in_stack_00000028;
  fVar2 = _DAT_1459e4774 * in_stack_00000028[2];
  fVar1 = in_stack_00000028[1] * _DAT_1459e4774 + _DAT_145a083e8;
  func_0x000145773235(fVar1,in_R9,in_RCX);
  func_0x000145773247(fVar1);
  fVar3 = fVar3 * _DAT_1459f4040;
  func_0x000145773247(fVar3);
  fVar2 = fVar2 + _DAT_1459e4f70;
  func_0x000145773235(fVar2);
  func_0x000145773247(fVar2);
  func_0x000145773235(fVar3);
  func_0x000145542830();
  return;
}
