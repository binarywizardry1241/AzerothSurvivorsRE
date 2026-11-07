
long entry(void)

{
  code *pcVar1;
  undefined4 *puVar2;
  undefined8 *puVar3;
  long in_RCX;
  undefined4 uVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  undefined4 uVar8;
  undefined4 uVar9;
  undefined4 uVar10;
  undefined4 uVar11;
  undefined4 local_88;
  undefined4 uStack_84;
  undefined4 uStack_80;
  undefined4 uStack_7c;

  func_0x000140002200();
  puVar2 = (undefined4 *)func_0x0001400021c0();
  if (puVar2 == (undefined4 *)0x0) {
    func_0x0001458e7201();
  }
  else {
    func_0x000144c79aa0();
    uVar4 = local_88;
    uVar5 = uStack_84;
    uVar6 = uStack_80;
    uVar7 = uStack_7c;
    func_0x000144c79aa0();
    uVar8 = local_88;
    uVar9 = uStack_84;
    uVar10 = uStack_80;
    uVar11 = uStack_7c;
    func_0x000144c79aa0();
    *puVar2 = 0;
    puVar2[2] = 1;
    puVar2[3] = uVar4;
    puVar2[4] = uVar5;
    puVar2[5] = uVar6;
    puVar2[6] = uVar7;
    *(undefined8 *)(puVar2 + 7) = 0x3f000000;
    puVar2[10] = 1;
    puVar2[0xb] = uVar8;
    puVar2[0xc] = uVar9;
    puVar2[0xd] = uVar10;
    puVar2[0xe] = uVar11;
    *(undefined8 *)(puVar2 + 0xf) = 0x3f000000;
    puVar2[0x12] = 1;
    puVar2[0x13] = local_88;
    puVar2[0x14] = uStack_84;
    puVar2[0x15] = uStack_80;
    puVar2[0x16] = uStack_7c;
    puVar2[0x17] = 0x3f000000;
    func_0x000140002200();
    puVar3 = (undefined8 *)func_0x0001400021c0();
    if (puVar3 != (undefined8 *)0x0) {
      puVar3[1] = 3;
      puVar3[2] = puVar2;
      puVar3[3] = 3;
      *(undefined4 *)(puVar3 + 4) = 0x3fc90fdb;
      *(undefined1 *)((long)puVar3 + 0x24) = 0;
      *puVar3 = 0x8000000000000000;
      func_0x000145756ddd();
      *(undefined8 *)(in_RCX + 0x180) = 1;
      *(undefined8 **)(in_RCX + 0x188) = puVar3;
      *(undefined8 *)(in_RCX + 400) = 1;
      return in_RCX;
    }
    func_0x0001458e7201();
  }
                    /* WARNING: Does not return */
  pcVar1 = (code *)invalidInstructionException();
  (*pcVar1)();
}
