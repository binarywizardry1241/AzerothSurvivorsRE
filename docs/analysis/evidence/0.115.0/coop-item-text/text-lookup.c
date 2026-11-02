/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 * entry(undefined8 param_1,undefined8 param_2,uint param_3,undefined8 *param_4)

{
  byte bVar1;
  char cVar2;
  ulong uVar3;
  ulong *puVar4;
  bool bVar5;
  undefined4 local_48;
  undefined4 uStack_44;
  undefined4 uStack_40;
  undefined4 uStack_3c;
  undefined8 local_38;

  if (0xefffff < param_3) {
    uVar3 = (ulong)(param_3 - 0xf00000);
    LOCK();
    bVar5 = DAT_1482147d8 == '\0';
    if (bVar5) {
      DAT_1482147d8 = '\x01';
    }
    UNLOCK();
    if (!bVar5) {
      func_0x000145eb5670();
    }
    puVar4 = _DAT_148214a38;
    if ((*_DAT_148214a38 & 0x7fffffffffffffff) == 0) {
      bVar1 = 0;
    }
    else {
      bVar1 = func_0x000145eb6400();
      bVar1 = bVar1 ^ 1;
    }
    if (uVar3 < _DAT_1482147f0) {
      func_0x000145ce7810();
      param_4[2] = local_38;
      *(undefined4 *)param_4 = local_48;
      *(undefined4 *)((long)param_4 + 4) = uStack_44;
      *(undefined4 *)(param_4 + 1) = uStack_40;
      *(undefined4 *)((long)param_4 + 0xc) = uStack_3c;
    }
    else {
      *param_4 = 0xffffffffffffffff;
    }
    if (((bVar1 == 0) && ((*puVar4 & 0x7fffffffffffffff) != 0)) &&
       (cVar2 = func_0x000145eb6400(), cVar2 == '\0')) {
      DAT_1482147d9 = 1;
    }
    cVar2 = DAT_1482147d8;
    LOCK();
    DAT_1482147d8 = 0;
    UNLOCK();
    if (cVar2 == '\x02') {
      func_0x000145eb5730();
    }
    return param_4;
  }
  *param_4 = 0xffffffffffffffff;
  return param_4;
}
