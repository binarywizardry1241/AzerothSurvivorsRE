/* WARNING: Control flow encountered bad instruction data */

void entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,undefined8 param_4,char *param_5
          )

{
  char cVar1;
  bool bVar2;
  undefined1 auVar3 [16];
  long local_40;
  undefined8 local_38;

  cVar1 = *param_5;
  *param_5 = '\x01';
  if (cVar1 == '\0') {
    func_0x00014063a3d0(param_1,param_3,0x145d71270,param_3,0xe,0x145d70ef1);
  }
  func_0x00014063cd20();
  if (local_40 != -1) {
    auVar3 = func_0x00014006f550();
    if (auVar3._8_8_ == 1) {
      bVar2 = *auVar3._0_8_ == '1';
    }
    else {
      bVar2 = false;
    }
    if (local_40 != 0) {
      func_0x0001400021d0(param_1,bVar2,local_40,local_38,1);
    }
  }
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}
