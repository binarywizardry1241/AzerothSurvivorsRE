
void entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,long *param_4,undefined8 param_5
          ,char param_6)

{
  code *pcVar1;
  undefined4 *puVar2;
  undefined1 local_78 [48];
  undefined8 local_48;

  local_48 = 0xfffffffffffffffe;
  if (param_6 != '\0') {
    func_0x000145ce7810(param_4,param_3,param_5,local_78);
    func_0x000145ce7810();
    func_0x00014012c6a0();
    if (param_6 == '\x02') {
      func_0x000140002200();
      puVar2 = (undefined4 *)func_0x0001400021c0();
      if (puVar2 == (undefined4 *)0x0) {
        func_0x000145eb6fcb();
                    /* WARNING: Does not return */
        pcVar1 = (code *)invalidInstructionException();
        (*pcVar1)();
      }
      *(undefined4 *)((long)puVar2 + 3) = 0x676e696e;
      *puVar2 = 0x6e696f6a;
      if (*param_4 != 0) {
        func_0x0001400021d0();
      }
      *param_4 = 7;
      param_4[1] = (long)puVar2;
      param_4[2] = 7;
      func_0x000145b79680();
      func_0x000145ce7810();
    }
    else {
      func_0x000145ce7810();
      func_0x000145ce7810();
      func_0x000145ce7810();
    }
    func_0x00014012c6a0();
  }
  return;
}
