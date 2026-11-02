
/* WARNING: Control flow encountered bad instruction data */

void entry(undefined8 param_1,undefined8 param_2,long param_3,long param_4,ulong param_5,
          undefined8 param_6)

{
  undefined4 *puVar1;
  long lVar2;
  long lVar3;
  long lVar4;
  undefined1 local_278 [568];
  undefined4 local_40;
  undefined4 uStack_3c;
  undefined4 uStack_38;
  undefined4 uStack_34;
  undefined8 local_30;
  undefined8 local_28;
  
  local_28 = 0xfffffffffffffffe;
  if (param_3 == 1) {
    func_0x000145b91b10(param_4,param_5,param_6,local_278);
    if ((*(int *)(param_4 + 0xd98) == 3) && (param_5 < *(ulong *)(param_4 + 0xdd8))) {
      lVar3 = *(long *)(param_4 + 0xdd0);
      func_0x000145d14a90();
      lVar3 = lVar3 + param_5 * 0x4e8;
      lVar4 = *(long *)(lVar3 + 0x288);
      if (lVar4 == *(long *)(lVar3 + 0x278)) {
        func_0x000146061bd0();
      }
      lVar2 = *(long *)(lVar3 + 0x280);
      *(undefined8 *)(lVar2 + 0x10 + lVar4 * 0x18) = local_30;
      puVar1 = (undefined4 *)(lVar2 + lVar4 * 0x18);
      *puVar1 = local_40;
      puVar1[1] = uStack_3c;
      puVar1[2] = uStack_38;
      puVar1[3] = uStack_34;
      *(long *)(lVar3 + 0x288) = lVar4 + 1;
    }
    func_0x000145baa5d0();
    return;
  }
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}

