
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,char *param_3,undefined8 param_4,undefined8 param_5
          ,long param_6)

{
  char cVar1;
  long *plVar2;
  code *pcVar3;
  undefined8 uVar4;
  long lVar5;
  long extraout_RDX;
  long extraout_RDX_00;
  long in_stack_00000028;
  long in_stack_00000030;
  long local_360;
  
  if (in_stack_00000030 != 0) {
    func_0x000145aaef50(*(undefined4 *)(in_stack_00000028 + 0x38),in_stack_00000030,
                        *(undefined8 *)(in_stack_00000028 + 0x28),
                        *(undefined8 *)(in_stack_00000028 + 0x20));
    func_0x000145aca320();
    func_0x000145be05d0();
  }
  uVar4 = func_0x000145aaf610();
  func_0x000145bbfea0(uVar4);
  func_0x000145aaa940();
  func_0x000145fd7da0();
  func_0x000145aaf080();
  func_0x000145aac2d0();
  if (extraout_RDX < 0) {
LAB_14014bf4e:
    func_0x0001461add5b();
    goto LAB_14014ca0f;
  }
  if (extraout_RDX != 0) {
    func_0x000140002200(extraout_RDX);
    lVar5 = func_0x0001400021c0();
    if (lVar5 == 0) goto LAB_14014bf4e;
    func_0x00014600504b();
  }
  func_0x000145be05e0();
  func_0x00014014ba40();
  func_0x000145bbfea0();
  func_0x000145bc0330();
  func_0x000145bbfea0();
  func_0x000140147860();
  func_0x000145bbfea0();
  func_0x000145bbfea0();
  func_0x000140147860();
  func_0x0001402441d0();
  func_0x00014028a170();
  func_0x0001402441d0();
  func_0x000140289c00();
  uVar4 = func_0x000145bbfea0();
  func_0x000145bbfea0(*(undefined8 *)(param_6 + 0xf8),uVar4,4,0x1461c51a7);
  func_0x000140147860();
  func_0x000145bbfea0();
  if (-1 < extraout_RDX_00) {
    if (extraout_RDX_00 == 0) {
      cVar1 = *param_3;
    }
    else {
      func_0x000140002200();
      lVar5 = func_0x0001400021c0();
      if (lVar5 == 0) goto LAB_14014c603;
      func_0x00014600504b();
      cVar1 = *param_3;
    }
    if (cVar1 != '\x01') {
      plVar2 = *(long **)(param_3 + 8);
      LOCK();
      lVar5 = *plVar2;
      *plVar2 = *plVar2 + 1;
      UNLOCK();
      if (*plVar2 == 0 || SCARRY8(lVar5,1) != *plVar2 < 0) goto LAB_14014ca0f;
    }
    func_0x00014025a890();
    func_0x0001402441d0();
    func_0x000145bbfea0();
    func_0x0001401488f0();
    if (local_360 != 0) {
      func_0x0001400021d0();
    }
    return;
  }
LAB_14014c603:
  func_0x0001461add5b();
LAB_14014ca0f:
                    /* WARNING: Does not return */
  pcVar3 = (code *)invalidInstructionException();
  (*pcVar3)();
}

