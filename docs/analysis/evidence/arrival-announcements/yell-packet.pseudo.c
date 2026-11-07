/* WARNING: Removing unreachable block (ram,0x0001458ab05f) */

undefined8 *
entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,undefined8 *param_4,
     undefined8 param_5,ulong param_6)

{
  code *pcVar1;
  undefined1 *puVar2;
  long lVar3;
  ulong in_stack_00000030;
  undefined4 uStack_5e;
  undefined8 local_60;
  undefined2 uStack_5a;
  undefined8 local_40;

  func_0x000140002200();
  puVar2 = (undefined1 *)func_0x0001400021c0();
  if (puVar2 == (undefined1 *)0x0) {
    func_0x000145d6944b();
                    /* WARNING: Does not return */
    pcVar1 = (code *)invalidInstructionException();
    (*pcVar1)();
  }
  *puVar2 = 0xc;
  *(undefined4 *)(puVar2 + 1) = 0;
  *(undefined8 *)(puVar2 + 5) = param_3;
  *(int *)(puVar2 + 0xd) = (int)param_6 + 1;
  local_40 = CONCAT26(uStack_5a,CONCAT42(uStack_5e,0x96));
  if (param_6 < 0x10) {
    if (param_6 != 0) goto LAB_1458aaed5;
  }
  else {
    func_0x000145bcb2d0();
LAB_1458aaed5:
    func_0x000145bc977b();
  }
  if (param_6 + 0x11 == 0x20) {
    func_0x000145d69340();
  }
  puVar2[param_6 + 0x11] = 0;
  if (0x20 - (param_6 + 0x12) < 8) {
    func_0x000145bcb2d0();
  }
  *(undefined8 *)(puVar2 + param_6 + 0x12) = 0;
  if (0x20 - (param_6 + 0x1a) < 4) {
    func_0x000145bcb2d0();
  }
  *(int *)(puVar2 + param_6 + 0x1a) = (int)in_stack_00000030 + 1;
  if (0x20 - (param_6 + 0x1e) < in_stack_00000030) {
    func_0x000145bcb2d0();
  }
  else if (in_stack_00000030 == 0) goto LAB_1458aafd8;
  func_0x000145bc977b();
LAB_1458aafd8:
  lVar3 = param_6 + 0x1e + in_stack_00000030;
  if (lVar3 == 0x20) {
    func_0x000145d69340();
  }
  puVar2[lVar3] = 0;
  lVar3 = lVar3 + 1;
  if (lVar3 == 0x20) {
    func_0x000145d69340();
  }
  puVar2[lVar3] = 0;
  *param_4 = 0x20;
  param_4[1] = puVar2;
  param_4[2] = lVar3 + 1;
  param_4[3] = local_40;
  return param_4;
}
