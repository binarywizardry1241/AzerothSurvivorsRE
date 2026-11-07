void entry(undefined8 param_1,undefined8 param_2,char param_3,long param_4,undefined8 param_5)

{
  long lVar1;
  int iVar2;
  undefined8 *puVar3;
  undefined8 uVar4;
  long lVar5;
  long lVar6;
  long lVar7;
  bool bVar8;
  long local_70;
  undefined8 *local_68;
  long local_60;
  long local_58;
  long local_48;

  if (param_3 == *(char *)(param_4 + 0x76) && param_3 != -1) {
    *(undefined1 *)(param_4 + 0x77) = 0xfe;
  }
  else {
    if ((*(char *)(param_4 + 0x76) == '\x06') && (*(long *)(param_4 + 0x18) != -1)) {
      func_0x0001458d7400(param_1,param_4,param_5,&local_70);
      lVar6 = local_60;
      lVar7 = *(long *)(param_4 + 0x28);
      bVar8 = true;
      puVar3 = local_68;
      if (lVar7 == local_60) {
        if (lVar7 != 0) {
          lVar1 = *(long *)(param_4 + 0x20);
          lVar5 = 0x18;
          do {
            if (((*(long *)(lVar1 + -8 + lVar5) != *(long *)((long)puVar3 + lVar5 + -8)) ||
                (iVar2 = func_0x000145bfa0e1(), iVar2 != 0)) ||
               (*(char *)(lVar1 + lVar5) != *(char *)((long)puVar3 + lVar5))) goto LAB_14013eba6;
            lVar5 = lVar5 + 0x20;
            lVar7 = lVar7 + -1;
          } while (lVar7 != 0);
        }
        if (*(long *)(param_4 + 0x40) == local_48) {
          iVar2 = func_0x000145bfa0e1();
          bVar8 = iVar2 != 0;
        }
      }
LAB_14013eba6:
      if (lVar6 != 0) {
        puVar3 = puVar3 + 1;
        do {
          if (puVar3[-1] != 0) {
            func_0x0001400021d0();
          }
          puVar3 = puVar3 + 4;
          lVar6 = lVar6 + -1;
        } while (lVar6 != 0);
      }
      if (local_70 != 0) {
        func_0x0001400021d0();
      }
      if (local_58 != 0) {
        func_0x0001400021d0();
      }
      if (bVar8) {
        *(char *)(param_4 + 0x77) = param_3;
        return;
      }
    }
    *(undefined1 *)(param_4 + 0x77) = 0xfe;
    if (param_3 == -1) {
      *(undefined1 *)(param_4 + 0x72) = 0;
      return;
    }
  }
  *(undefined1 *)(param_4 + 0x72) = 1;
  *(char *)(param_4 + 0x76) = param_3;
  if ((param_3 == '\x02') && (*(char *)(param_4 + 0x48) != '\0')) {
    func_0x0001459a6c50();
    if (local_60 == 0) {
      if (local_70 != 0) {
        func_0x0001400021d0();
      }
    }
    else {
      uVar4 = *local_68;
      if (local_70 != 0) {
        func_0x0001400021d0();
      }
      *(undefined8 *)(param_4 + 0x50) = uVar4;
    }
  }
  return;
}
