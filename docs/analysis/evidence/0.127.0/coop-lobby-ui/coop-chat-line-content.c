
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 entry(undefined8 param_1,undefined8 param_2,long param_3,undefined8 param_4)

{
  char *pcVar1;
  long lVar2;
  long lVar3;
  code *pcVar4;
  long *plVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  undefined4 uVar8;
  undefined4 uVar9;
  undefined4 uVar10;
  undefined4 uVar11;
  
  func_0x000145b059c0(*(long *)(param_3 + 8),param_4,param_3,
                      *(undefined1 *)(*(long *)(param_3 + 8) + 0x3a));
  func_0x000140217830();
  func_0x000142926130();
  uVar6 = _DAT_14627b8b8;
  uVar7 = uRam000000014627b8bc;
  uVar8 = _DAT_14627b8d0;
  uVar9 = uRam000000014627b8d4;
  uVar10 = uRam000000014627b8d8;
  uVar11 = uRam000000014627b8dc;
  func_0x00014606171b();
  func_0x0001402f9cf0();
  pcVar1 = *(char **)(param_3 + 0x10);
  func_0x000146034470();
  if (*pcVar1 != '\x01') {
    plVar5 = *(long **)(pcVar1 + 8);
    LOCK();
    lVar2 = *plVar5;
    *plVar5 = *plVar5 + 1;
    UNLOCK();
    if (*plVar5 == 0 || SCARRY8(lVar2,1) != *plVar5 < 0) goto LAB_14033f469;
  }
  func_0x00014030c3f0();
  if (**(char **)(param_3 + 0x20) == '\x01') {
    plVar5 = (long *)CONCAT44(uVar9,uVar8);
    if (plVar5 == (long *)0x0) {
      plVar5 = (long *)CONCAT44(uVar11,uVar10);
    }
    lVar2 = plVar5[2];
    if ((ulong)(*plVar5 - lVar2) < 0x18) {
      func_0x000146061b30();
    }
    lVar3 = plVar5[1];
    *(undefined8 *)(lVar3 + lVar2) = 0x1403c2f30;
    *(ulong *)(lVar3 + 8 + lVar2) = CONCAT44(uVar7,uVar6);
    *(undefined1 *)(lVar3 + 0x10 + lVar2) = 0;
    plVar5[2] = lVar2 + 0x18;
  }
  func_0x000146034930();
  if (*pcVar1 != '\x01') {
    plVar5 = *(long **)(pcVar1 + 8);
    LOCK();
    lVar2 = *plVar5;
    *plVar5 = *plVar5 + 1;
    UNLOCK();
    if (*plVar5 == 0 || SCARRY8(lVar2,1) != *plVar5 < 0) {
LAB_14033f469:
                    /* WARNING: Does not return */
      pcVar4 = (code *)invalidInstructionException();
      (*pcVar4)();
    }
  }
  func_0x000140312e20();
  return param_4;
}

