
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,long *param_4,long param_5)

{
  code *pcVar1;
  long lVar2;
  ulong *puVar3;
  char cVar4;
  long lVar5;
  long lVar6;
  bool bVar7;
  undefined8 local_108;
  long local_100;
  long local_f8;
  long local_f0;
  undefined4 local_e8;
  undefined1 local_68 [24];
  long local_50;
  uint local_44;
  undefined8 local_40;

  local_40 = 0xfffffffffffffffe;
  lVar6 = *param_4;
  LOCK();
  bVar7 = *(char *)(lVar6 + 0x10) == '\0';
  if (bVar7) {
    *(char *)(lVar6 + 0x10) = '\x01';
  }
  UNLOCK();
  if (!bVar7) {
    func_0x000145eb5670(param_3,param_5,1,lVar6 + 0x10);
  }
  puVar3 = _DAT_148214a38;
  if ((*_DAT_148214a38 & 0x7fffffffffffffff) == 0) {
    local_44 = 0;
  }
  else {
    local_44 = func_0x000145eb6400();
    local_44 = local_44 ^ 1;
  }
  lVar2 = param_4[1];
  local_50 = lVar6;
  if (param_5 == 0) {
    lVar5 = 1;
  }
  else {
    func_0x000140002200();
    lVar5 = func_0x0001400021c0();
    if (lVar5 == 0) {
      func_0x000145eb6fcb();
                    /* WARNING: Does not return */
      pcVar1 = (code *)invalidInstructionException();
      (*pcVar1)();
    }
    func_0x000145d145fb();
  }
  local_108 = 0x8000000000000005;
  local_100 = param_5;
  local_f8 = lVar5;
  local_f0 = param_5;
  local_e8 = (int)lVar2;
  if (*(int *)(lVar6 + 0xa0) == -1) {
    lVar5 = *(long *)(lVar6 + 0xb0);
    func_0x000145b7a740(lVar5,*(undefined8 *)(lVar6 + 0xa8),&local_108,local_68);
    (**(code **)(lVar5 + 0x18))();
  }
  else {
    lVar5 = *(long *)(lVar6 + 0x90);
    func_0x000145b7a740(lVar5,*(undefined8 *)(lVar6 + 0x88),&local_108,local_68);
    (**(code **)(lVar5 + 0x18))();
  }
  func_0x000145811f80();
  lVar6 = local_50;
  if ((((char)local_44 == '\0') && ((*puVar3 & 0x7fffffffffffffff) != 0)) &&
     (cVar4 = func_0x000145eb6400(), cVar4 == '\0')) {
    *(undefined1 *)(lVar6 + 0x11) = 1;
  }
  LOCK();
  cVar4 = *(char *)(lVar6 + 0x10);
  *(char *)(lVar6 + 0x10) = '\0';
  UNLOCK();
  if (cVar4 == '\x02') {
    func_0x000145eb5730();
  }
  return;
}
