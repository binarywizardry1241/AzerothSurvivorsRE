
/* WARNING: Control flow encountered bad instruction data */

void entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,long param_4)

{
  long lVar1;
  undefined8 uVar2;
  undefined8 uVar3;
  long extraout_RDX;
  
  lVar1 = *(long *)(param_4 + 0x160);
  uVar2 = *(undefined8 *)(param_4 + 0x168);
  uVar3 = *(undefined8 *)(param_4 + 0x170);
  *(undefined8 *)(param_4 + 0x160) = 0;
  *(undefined8 *)(param_4 + 0x168) = 1;
  *(undefined8 *)(param_4 + 0x170) = 0;
  func_0x000140207170(uVar3,param_3,uVar3,uVar2);
  if (extraout_RDX == 0) {
    if (lVar1 != 0) {
                    /* WARNING: Bad instruction - Truncating control flow here */
      halt_baddata();
    }
  }
  else {
    func_0x000140246550();
  }
  return;
}

