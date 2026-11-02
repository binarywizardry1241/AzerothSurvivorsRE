/* WARNING: Removing unreachable block (ram,0x000145465d2e) */

long * entry(undefined8 param_1,undefined8 param_2,undefined4 param_3,long *param_4,
            undefined4 param_5,undefined4 param_6)

{
  long lVar1;
  code *pcVar2;
  long lVar3;
  long lVar4;
  undefined4 *puVar5;
  long lVar6;
  ulong in_stack_00000030;
  undefined8 local_60;
  undefined4 uStack_3e;
  undefined8 local_40;
  undefined2 uStack_3a;

  func_0x000140002200();
  puVar5 = (undefined4 *)func_0x0001400021c0();
  if (puVar5 == (undefined4 *)0x0) {
    func_0x00014590379b();
                    /* WARNING: Does not return */
    pcVar2 = (code *)invalidInstructionException();
    (*pcVar2)();
  }
  *puVar5 = param_3;
  puVar5[1] = param_5;
  puVar5[2] = param_6;
  local_60 = CONCAT26(uStack_3a,CONCAT42(uStack_3e,0x5f));
  if (in_stack_00000030 < 0x15) {
    if (in_stack_00000030 == 0) goto LAB_1454653e5;
  }
  else {
    func_0x0001457744b0();
  }
  func_0x0001457731ed();
LAB_1454653e5:
  if (in_stack_00000030 + 0xc == 0x20) {
    func_0x000145903690();
  }
  *(undefined1 *)((long)puVar5 + in_stack_00000030 + 0xc) = 0;
  lVar6 = in_stack_00000030 + 0xd;
  if (lVar6 == 0x20) {
    func_0x000145903690();
  }
  *(undefined1 *)((long)puVar5 + lVar6) = 0;
  lVar6 = lVar6 + 1;
  if (lVar6 == 0x20) {
    func_0x000145903690();
  }
  *(undefined1 *)((long)puVar5 + lVar6) = 0;
  lVar6 = lVar6 + 1;
  if (lVar6 == 0x20) {
    func_0x000145903690();
  }
  *(undefined1 *)((long)puVar5 + lVar6) = 0;
  lVar6 = lVar6 + 1;
  if (lVar6 == 0x20) {
    func_0x000145903690();
  }
  *(undefined1 *)((long)puVar5 + lVar6) = 0;
  *param_4 = 0x20;
  param_4[1] = (long)puVar5;
  param_4[2] = lVar6 + 1;
  param_4[3] = local_60;
  lVar3 = *param_4;
  lVar4 = param_4[1];
  lVar6 = param_4[2];
  lVar1 = param_4[3];
  if ((ulong)(lVar3 - lVar6) < 4) {
    func_0x0001457744b0();
  }
  *(undefined4 *)(lVar4 + lVar6) = 0;
  *param_4 = lVar3;
  param_4[1] = lVar4;
  param_4[2] = lVar6 + 4;
  param_4[3] = lVar1;
  lVar3 = *param_4;
  lVar4 = param_4[1];
  lVar6 = param_4[2];
  lVar1 = param_4[3];
  if ((ulong)(lVar3 - lVar6) < 4) {
    func_0x0001457744b0();
  }
  *(undefined4 *)(lVar4 + lVar6) = 0;
  *param_4 = lVar3;
  param_4[1] = lVar4;
  param_4[2] = lVar6 + 4;
  param_4[3] = lVar1;
  lVar3 = *param_4;
  lVar4 = param_4[1];
  lVar6 = param_4[2];
  lVar1 = param_4[3];
  if ((ulong)(lVar3 - lVar6) < 4) {
    func_0x0001457744b0();
  }
  *(undefined4 *)(lVar4 + lVar6) = 0;
  *param_4 = lVar3;
  param_4[1] = lVar4;
  param_4[2] = lVar6 + 4;
  param_4[3] = lVar1;
  lVar3 = *param_4;
  lVar4 = param_4[1];
  lVar6 = param_4[2];
  lVar1 = param_4[3];
  if ((ulong)(lVar3 - lVar6) < 4) {
    func_0x0001457744b0();
  }
  *(undefined4 *)(lVar4 + lVar6) = 0;
  *param_4 = lVar3;
  param_4[1] = lVar4;
  param_4[2] = lVar6 + 4;
  param_4[3] = lVar1;
  lVar3 = *param_4;
  lVar4 = param_4[1];
  lVar6 = param_4[2];
  lVar1 = param_4[3];
  if ((ulong)(lVar3 - lVar6) < 4) {
    func_0x0001457744b0();
  }
  *(undefined4 *)(lVar4 + lVar6) = 0;
  *param_4 = lVar3;
  param_4[1] = lVar4;
  param_4[2] = lVar6 + 4;
  param_4[3] = lVar1;
  lVar3 = *param_4;
  lVar4 = param_4[1];
  lVar6 = param_4[2];
  lVar1 = param_4[3];
  if ((ulong)(lVar3 - lVar6) < 4) {
    func_0x0001457744b0();
  }
  *(undefined4 *)(lVar4 + lVar6) = 0;
  *param_4 = lVar3;
  param_4[1] = lVar4;
  param_4[2] = lVar6 + 4;
  param_4[3] = lVar1;
  lVar3 = *param_4;
  lVar4 = param_4[1];
  lVar6 = param_4[2];
  lVar1 = param_4[3];
  if ((ulong)(lVar3 - lVar6) < 4) {
    func_0x0001457744b0();
  }
  *(undefined4 *)(lVar4 + lVar6) = 0;
  *param_4 = lVar3;
  param_4[1] = lVar4;
  param_4[2] = lVar6 + 4;
  param_4[3] = lVar1;
  lVar3 = *param_4;
  lVar4 = param_4[1];
  lVar6 = param_4[2];
  lVar1 = param_4[3];
  if ((ulong)(lVar3 - lVar6) < 4) {
    func_0x0001457744b0();
  }
  *(undefined4 *)(lVar4 + lVar6) = 0;
  *param_4 = lVar3;
  param_4[1] = lVar4;
  param_4[2] = lVar6 + 4;
  param_4[3] = lVar1;
  lVar3 = *param_4;
  lVar4 = param_4[1];
  lVar6 = param_4[2];
  lVar1 = param_4[3];
  if ((ulong)(lVar3 - lVar6) < 4) {
    func_0x0001457744b0();
  }
  *(undefined4 *)(lVar4 + lVar6) = 0;
  *param_4 = lVar3;
  param_4[1] = lVar4;
  param_4[2] = lVar6 + 4;
  param_4[3] = lVar1;
  lVar3 = *param_4;
  lVar4 = param_4[1];
  lVar6 = param_4[2];
  lVar1 = param_4[3];
  if ((ulong)(lVar3 - lVar6) < 4) {
    func_0x0001457744b0();
  }
  *(undefined4 *)(lVar4 + lVar6) = 0;
  *param_4 = lVar3;
  param_4[1] = lVar4;
  param_4[2] = lVar6 + 4;
  param_4[3] = lVar1;
  lVar3 = *param_4;
  lVar4 = param_4[1];
  lVar6 = param_4[2];
  lVar1 = param_4[3];
  if ((ulong)(lVar3 - lVar6) < 4) {
    func_0x0001457744b0();
  }
  *(undefined4 *)(lVar4 + lVar6) = 0;
  *param_4 = lVar3;
  param_4[1] = lVar4;
  param_4[2] = lVar6 + 4;
  param_4[3] = lVar1;
  lVar3 = *param_4;
  lVar4 = param_4[1];
  lVar6 = param_4[2];
  lVar1 = param_4[3];
  if ((ulong)(lVar3 - lVar6) < 4) {
    func_0x0001457744b0();
  }
  *(undefined4 *)(lVar4 + lVar6) = 0;
  *param_4 = lVar3;
  param_4[1] = lVar4;
  param_4[2] = lVar6 + 4;
  param_4[3] = lVar1;
  lVar3 = *param_4;
  lVar4 = param_4[1];
  lVar6 = param_4[2];
  lVar1 = param_4[3];
  if ((ulong)(lVar3 - lVar6) < 4) {
    func_0x0001457744b0();
  }
  *(undefined4 *)(lVar4 + lVar6) = 0;
  *param_4 = lVar3;
  param_4[1] = lVar4;
  param_4[2] = lVar6 + 4;
  param_4[3] = lVar1;
  lVar3 = *param_4;
  lVar4 = param_4[1];
  lVar6 = param_4[2];
  lVar1 = param_4[3];
  if ((ulong)(lVar3 - lVar6) < 4) {
    func_0x0001457744b0();
  }
  *(undefined4 *)(lVar4 + lVar6) = 0;
  *param_4 = lVar3;
  param_4[1] = lVar4;
  param_4[2] = lVar6 + 4;
  param_4[3] = lVar1;
  lVar3 = *param_4;
  lVar4 = param_4[1];
  lVar6 = param_4[2];
  lVar1 = param_4[3];
  if ((ulong)(lVar3 - lVar6) < 4) {
    func_0x0001457744b0();
  }
  *(undefined4 *)(lVar4 + lVar6) = 0;
  *param_4 = lVar3;
  param_4[1] = lVar4;
  param_4[2] = lVar6 + 4;
  param_4[3] = lVar1;
  lVar3 = *param_4;
  lVar4 = param_4[1];
  lVar6 = param_4[2];
  lVar1 = param_4[3];
  if ((ulong)(lVar3 - lVar6) < 4) {
    func_0x0001457744b0();
  }
  *(undefined4 *)(lVar4 + lVar6) = 0;
  *param_4 = lVar3;
  param_4[1] = lVar4;
  param_4[2] = lVar6 + 4;
  param_4[3] = lVar1;
  lVar3 = *param_4;
  lVar4 = param_4[1];
  lVar6 = param_4[2];
  lVar1 = param_4[3];
  if ((ulong)(lVar3 - lVar6) < 4) {
    func_0x0001457744b0();
  }
  *(undefined4 *)(lVar4 + lVar6) = 0;
  *param_4 = lVar3;
  param_4[1] = lVar4;
  param_4[2] = lVar6 + 4;
  param_4[3] = lVar1;
  lVar3 = *param_4;
  lVar4 = param_4[1];
  lVar6 = param_4[2];
  lVar1 = param_4[3];
  if ((ulong)(lVar3 - lVar6) < 4) {
    func_0x0001457744b0();
  }
  *(undefined4 *)(lVar4 + lVar6) = 0;
  *param_4 = lVar3;
  param_4[1] = lVar4;
  param_4[2] = lVar6 + 4;
  param_4[3] = lVar1;
  lVar3 = *param_4;
  lVar4 = param_4[1];
  lVar6 = param_4[2];
  lVar1 = param_4[3];
  if ((ulong)(lVar3 - lVar6) < 4) {
    func_0x0001457744b0();
  }
  *(undefined4 *)(lVar4 + lVar6) = 0;
  *param_4 = lVar3;
  param_4[1] = lVar4;
  param_4[2] = lVar6 + 4;
  param_4[3] = lVar1;
  lVar3 = *param_4;
  lVar4 = param_4[1];
  lVar6 = param_4[2];
  lVar1 = param_4[3];
  if ((ulong)(lVar3 - lVar6) < 4) {
    func_0x0001457744b0();
  }
  *(undefined4 *)(lVar4 + lVar6) = 0;
  *param_4 = lVar3;
  param_4[1] = lVar4;
  param_4[2] = lVar6 + 4;
  param_4[3] = lVar1;
  lVar3 = *param_4;
  lVar4 = param_4[1];
  lVar6 = param_4[2];
  lVar1 = param_4[3];
  if ((ulong)(lVar3 - lVar6) < 4) {
    func_0x0001457744b0();
  }
  *(undefined4 *)(lVar4 + lVar6) = 0;
  *param_4 = lVar3;
  param_4[1] = lVar4;
  param_4[2] = lVar6 + 4;
  param_4[3] = lVar1;
  lVar3 = *param_4;
  lVar4 = param_4[1];
  lVar6 = param_4[2];
  lVar1 = param_4[3];
  if ((ulong)(lVar3 - lVar6) < 4) {
    func_0x0001457744b0();
  }
  *(undefined4 *)(lVar4 + lVar6) = 0;
  *param_4 = lVar3;
  param_4[1] = lVar4;
  param_4[2] = lVar6 + 4;
  param_4[3] = lVar1;
  lVar3 = *param_4;
  lVar4 = param_4[1];
  lVar6 = param_4[2];
  lVar1 = param_4[3];
  if ((ulong)(lVar3 - lVar6) < 4) {
    func_0x0001457744b0();
  }
  *(undefined4 *)(lVar4 + lVar6) = 0;
  *param_4 = lVar3;
  param_4[1] = lVar4;
  param_4[2] = lVar6 + 4;
  param_4[3] = lVar1;
  lVar3 = *param_4;
  lVar4 = param_4[1];
  lVar6 = param_4[2];
  lVar1 = param_4[3];
  if ((ulong)(lVar3 - lVar6) < 4) {
    func_0x0001457744b0();
  }
  *(undefined4 *)(lVar4 + lVar6) = 0;
  *param_4 = lVar3;
  param_4[1] = lVar4;
  param_4[2] = lVar6 + 4;
  param_4[3] = lVar1;
  return param_4;
}
