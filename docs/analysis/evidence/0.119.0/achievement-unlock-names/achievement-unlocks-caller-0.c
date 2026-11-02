/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(void)

{
  undefined8 in_R9;
  long in_stack_00000028;
  long local_a8;

  func_0x000145acf480(*(undefined8 *)(in_stack_00000028 + 0x10),in_R9,
                      *(undefined8 *)(in_stack_00000028 + 8),in_R9,
                      *(undefined8 *)(in_stack_00000028 + 0x10));
  func_0x000145b413e0();
  func_0x000145b445f0();
  func_0x000145f941db();
  func_0x0001402b9de0();
  func_0x0001402d9570();
  if (local_a8 != 0) {
    func_0x0001400021d0();
  }
  return;
}
