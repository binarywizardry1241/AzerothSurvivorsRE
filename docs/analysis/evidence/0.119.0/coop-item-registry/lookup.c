undefined8 * FUN_145b5cdc0(undefined8 *param_1,uint param_2)

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
    bVar5 = DAT_148516728 == '\0';
    if (bVar5) {
      DAT_148516728 = '\x01';
    }
    UNLOCK();
    if (!bVar5) {
      FUN_146139860(&DAT_148516728);
    }
    puVar2 = DAT_148516b70;
    if ((*DAT_148516b70 & 0x7fffffffffffffff) == 0) {
      uVar1 = uStack_2c;
      uStack_2c = 0;
    }
    else {
      uVar4 = func_0x00014613a5f0();
      uVar1 = uStack_2c;
      uStack_2c = uVar4 ^ 1;
    }
    if (param_2 - 0xf00000 < DAT_148516740) {
      FUN_145f673f0(&uStack_48,(ulonglong)(param_2 - 0xf00000) * 0x18 + DAT_148516738,DAT_148516729)
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
       (cVar3 = func_0x00014613a5f0(), cVar3 == '\0')) {
      DAT_148516729 = 1;
    }
    cVar3 = DAT_148516728;
    LOCK();
    DAT_148516728 = 0;
    UNLOCK();
    if (cVar3 == '\x02') {
      func_0x000146139920(&DAT_148516728);
    }
    return param_1;
  }
  *param_1 = 0xffffffffffffffff;
  return param_1;
}
