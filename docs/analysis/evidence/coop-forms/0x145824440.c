
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined1  [16] entry(void)

{
  long lVar1;
  code *pcVar2;
  char cVar3;
  undefined8 *puVar4;
  undefined8 *in_RCX;
  ulong *puVar5;
  undefined4 uVar6;
  long *plVar7;
  ulong uVar8;
  bool bVar9;
  undefined1 auVar10 [16];
  byte local_2c;

  plVar7 = (long *)*in_RCX;
  LOCK();
  bVar9 = (char)plVar7[2] == '\0';
  if (bVar9) {
    *(char *)(plVar7 + 2) = '\x01';
  }
  UNLOCK();
  if (!bVar9) {
    func_0x000145eb5670();
  }
  puVar5 = _DAT_148214a38;
  if ((*_DAT_148214a38 & 0x7fffffffffffffff) == 0) {
    local_2c = 0;
  }
  else {
    local_2c = func_0x000145eb6400();
    local_2c = local_2c ^ 1;
  }
  func_0x000145816db0();
  if (plVar7[10] == 0) {
    if (((local_2c == 0) && ((*puVar5 & 0x7fffffffffffffff) != 0)) &&
       (cVar3 = func_0x000145eb6400(), cVar3 == '\0')) {
      *(undefined1 *)((long)plVar7 + 0x11) = 1;
    }
    puVar4 = (undefined8 *)0x0;
    LOCK();
    cVar3 = (char)plVar7[2];
    *(char *)(plVar7 + 2) = '\0';
    UNLOCK();
joined_r0x000145824550:
    if (cVar3 == '\x02') {
      func_0x000145eb5730();
    }
    auVar10._8_8_ = 0x146ccacd0;
    auVar10._0_8_ = puVar4;
    return auVar10;
  }
  lVar1 = plVar7[9];
  uVar8 = 0;
  if ((ulong)plVar7[7] <= lVar1 + 1U) {
    uVar8 = plVar7[7];
  }
  plVar7[9] = (lVar1 - uVar8) + 1;
  plVar7[10] = plVar7[10] + -1;
  uVar6 = *(undefined4 *)(plVar7[8] + lVar1 * 4);
  LOCK();
  lVar1 = *plVar7;
  *plVar7 = *plVar7 + 1;
  UNLOCK();
  if (*plVar7 != 0 && SCARRY8(lVar1,1) == *plVar7 < 0) {
    func_0x000140002200();
    puVar4 = (undefined8 *)func_0x0001400021c0();
    if (puVar4 != (undefined8 *)0x0) {
      *puVar4 = plVar7;
      *(undefined4 *)(puVar4 + 1) = uVar6;
      if (((local_2c == 0) && ((*puVar5 & 0x7fffffffffffffff) != 0)) &&
         (cVar3 = func_0x000145eb6400(), cVar3 == '\0')) {
        *(undefined1 *)((long)plVar7 + 0x11) = 1;
      }
      LOCK();
      cVar3 = (char)plVar7[2];
      *(char *)(plVar7 + 2) = '\0';
      UNLOCK();
      goto joined_r0x000145824550;
    }
    func_0x000145eb6fb1();
  }
                    /* WARNING: Does not return */
  pcVar2 = (code *)invalidInstructionException();
  (*pcVar2)();
}
