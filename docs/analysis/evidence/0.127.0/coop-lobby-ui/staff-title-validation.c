
/* WARNING: Removing unreachable block (ram,0x000145b05ed0) */
/* WARNING: Removing unreachable block (ram,0x000145b05f83) */
/* WARNING: Removing unreachable block (ram,0x000145b05f8f) */
/* WARNING: Removing unreachable block (ram,0x000145b05fa1) */
/* WARNING: Removing unreachable block (ram,0x000145b05f48) */
/* WARNING: Removing unreachable block (ram,0x000145b05f6c) */

undefined8 * entry(void)

{
  code *pcVar1;
  int iVar2;
  undefined8 *in_RCX;
  long in_R8;
  undefined8 in_R9;
  undefined1 auVar3 [16];
  long in_stack_00000028;
  long in_stack_00000030;
  long in_stack_00000040;
  ulong in_stack_00000048;
  int local_f0;
  
  if (((((in_stack_00000028 != 0) && (*(long *)(in_R8 + 0x10) == in_stack_00000028)) &&
       (iVar2 = func_0x000146061721(in_R8,in_RCX,in_R9,*(undefined8 *)(in_R8 + 8)), iVar2 == 0)) &&
      ((*(long *)(in_R8 + 0x60) == in_stack_00000030 &&
       (*(long *)(in_R8 + 0x28) == in_stack_00000040)))) &&
     ((iVar2 = func_0x000146061721(), iVar2 == 0 &&
      ((in_stack_00000048 < *(ulong *)(in_R8 + 0x68) && (*(long *)(in_R8 + 0x40) != 0)))))) {
    func_0x000145d34680();
    if (local_f0 == 1) {
      func_0x000145d3d590();
      func_0x0001401c7670();
    }
    else {
      auVar3 = func_0x000145d2c9f0();
      if (auVar3._0_8_ != 0) {
        pcVar1 = (code *)*auVar3._8_8_;
        if (pcVar1 != (code *)0x0) {
          (*pcVar1)();
        }
        if (auVar3._8_8_[1] != 0) {
          func_0x0001400021d0();
        }
      }
    }
  }
  *in_RCX = 0xffffffffffffffff;
  return in_RCX;
}

