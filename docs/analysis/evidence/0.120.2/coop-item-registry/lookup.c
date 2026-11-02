undefined8 * FUN_145aa2ce0(undefined8 *param_1,uint param_2)

{
  uint uVar1;
  ulonglong *puVar2;
  char cVar3;
  uint uVar4;
  bool bVar5;
  undefined4 uStack_48;
  undefined4 uStack_44;
  undefined4 uStack_40;
  undefined4 uStack_3c;
  undefined8 uStack_38;
  uint uStack_2c;
  undefined8 uStack_28;

  uStack_28 = 0xfffffffffffffffe;
  if (0xefffff < param_2) {
    LOCK();
    bVar5 = DAT_148534458 == '\0';
    if (bVar5) {
      DAT_148534458 = '\x01';
    }
    UNLOCK();
    if (!bVar5) {
      FUN_146150750(&DAT_148534458);
    }
    puVar2 = DAT_148534b78;
    if ((*DAT_148534b78 & 0x7fffffffffffffff) == 0) {
      uVar1 = uStack_2c;
      uStack_2c = 0;
    }
    else {
      uVar4 = func_0x0001461514e0();
      uVar1 = uStack_2c;
      uStack_2c = uVar4 ^ 1;
    }
    if (param_2 - 0xf00000 < DAT_148534470) {
      FUN_145f7e040(&uStack_48,(ulonglong)(param_2 - 0xf00000) * 0x18 + DAT_148534468,DAT_148534459)
      ;
      param_1[2] = uStack_38;
      *(undefined4 *)param_1 = uStack_48;
      *(undefined4 *)((longlong)param_1 + 4) = uStack_44;
      *(undefined4 *)(param_1 + 1) = uStack_40;
      *(undefined4 *)((longlong)param_1 + 0xc) = uStack_3c;
      cVar3 = (char)uStack_2c;
    }
    else {
      *param_1 = 0xffffffffffffffff;
      cVar3 = (char)uStack_2c;
      uStack_2c = uVar1;
    }
    if (((cVar3 == '\0') && ((*puVar2 & 0x7fffffffffffffff) != 0)) &&
       (cVar3 = func_0x0001461514e0(), cVar3 == '\0')) {
      DAT_148534459 = 1;
    }
    cVar3 = DAT_148534458;
    LOCK();
    DAT_148534458 = 0;
    UNLOCK();
    if (cVar3 == '\x02') {
      func_0x000146150810(&DAT_148534458);
    }
    return param_1;
  }
  *param_1 = 0xffffffffffffffff;
  return param_1;
}
