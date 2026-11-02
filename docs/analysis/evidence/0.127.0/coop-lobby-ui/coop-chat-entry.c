
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(void)

{
  code *pcVar1;
  undefined4 *puVar2;
  undefined8 *puVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  undefined4 local_68;
  undefined4 uStack_64;
  undefined4 uStack_60;
  undefined4 uStack_5c;
  
  func_0x000140002200();
  puVar2 = (undefined4 *)func_0x0001400021c0();
  if (puVar2 == (undefined4 *)0x0) {
    func_0x000146208951();
  }
  else {
    func_0x000144ea3c40();
    uVar4 = local_68;
    uVar5 = uStack_64;
    uVar6 = uStack_60;
    uVar7 = uStack_5c;
    func_0x000144ea3c40();
    *puVar2 = 0;
    puVar2[2] = 1;
    puVar2[3] = uVar4;
    puVar2[4] = uVar5;
    puVar2[5] = uVar6;
    puVar2[6] = uVar7;
    *(undefined8 *)(puVar2 + 7) = 0x3f000000;
    puVar2[10] = 1;
    puVar2[0xb] = local_68;
    puVar2[0xc] = uStack_64;
    puVar2[0xd] = uStack_60;
    puVar2[0xe] = uStack_5c;
    puVar2[0xf] = 0x3f000000;
    func_0x000140002200();
    puVar3 = (undefined8 *)func_0x0001400021c0();
    if (puVar3 != (undefined8 *)0x0) {
      puVar3[1] = 2;
      puVar3[2] = puVar2;
      puVar3[3] = 2;
      *(undefined4 *)(puVar3 + 4) = 0x40490fdb;
      *(undefined1 *)((long)puVar3 + 0x24) = 0;
      *puVar3 = 0x8000000000000000;
      func_0x00014606171b();
      func_0x00014606171b();
      func_0x0001402f5b00();
      func_0x000140335bb0();
      return;
    }
    func_0x000146208951();
  }
                    /* WARNING: Does not return */
  pcVar1 = (code *)invalidInstructionException();
  (*pcVar1)();
}

