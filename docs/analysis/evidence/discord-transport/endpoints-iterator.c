void entry(undefined8 param_1,undefined8 param_2,int param_3,ulong *param_4,int param_5)

{
  code *pcVar1;
  ulong uVar2;
  undefined4 *puVar3;
  ulong uVar4;
  undefined4 *puVar5;
  ulong uVar6;
  undefined4 local_98;
  undefined4 uStack_94;
  undefined4 uStack_90;
  undefined4 uStack_8c;
  undefined8 local_88;
  undefined4 local_7f;
  undefined2 local_7b;
  undefined1 local_79;

  uVar6 = (long)param_5 - (long)param_3;
  uVar2 = 0;
  if (param_3 < param_5) {
    uVar2 = uVar6;
  }
  if (uVar2 << 5 < 0x7ffffffffffffff9 && uVar2 >> 0x3b == 0) {
    if (uVar2 == 0) {
      puVar3 = (undefined4 *)0x8;
      uVar6 = 0;
    }
    else {
      func_0x000140002200();
      puVar3 = (undefined4 *)func_0x0001400021c0();
      if (puVar3 == (undefined4 *)0x0) goto LAB_1400a923a;
    }
    uVar2 = (ulong)(uint)(param_5 - param_3);
    if (param_5 - param_3 == 0 || param_5 < param_3) {
      uVar4 = 0;
    }
    else {
      uVar4 = 0;
      puVar5 = puVar3;
      do {
        func_0x000145bcce30();
        *(undefined8 *)(puVar5 + 4) = local_88;
        *(undefined1 *)(puVar5 + 6) = 1;
        *(undefined4 *)((long)puVar5 + 0x19) = local_7f;
        *(undefined2 *)((long)puVar5 + 0x1d) = local_7b;
        *(undefined1 *)((long)puVar5 + 0x1f) = local_79;
        *puVar5 = local_98;
        puVar5[1] = uStack_94;
        puVar5[2] = uStack_90;
        puVar5[3] = uStack_8c;
        uVar4 = uVar4 + 1;
        puVar5 = puVar5 + 8;
      } while ((int)uVar2 != (int)uVar4);
    }
    param_4[2] = uVar4;
    *param_4 = uVar6;
    param_4[1] = (ulong)puVar3;
    return;
  }
LAB_1400a923a:
  func_0x000145d992bb();
                    /* WARNING: Does not return */
  pcVar1 = (code *)invalidInstructionException();
  (*pcVar1)();
}
