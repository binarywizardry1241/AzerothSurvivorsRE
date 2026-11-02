
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 * entry(void)

{
  code *pcVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  undefined4 *puVar6;
  undefined8 *puVar7;
  undefined8 *in_RCX;
  undefined4 uVar8;
  undefined4 uVar9;
  undefined4 uVar10;
  undefined4 uVar11;
  undefined4 local_68;
  undefined4 uStack_64;
  undefined4 uStack_60;
  undefined4 uStack_5c;

  uVar5 = uRam00000001458fe484;
  uVar4 = uRam00000001458fe480;
  uVar3 = uRam00000001458fe47c;
  uVar2 = _DAT_1458fe478;
  func_0x000140002200();
  puVar6 = (undefined4 *)func_0x0001400021c0();
  if (puVar6 == (undefined4 *)0x0) {
    func_0x0001458e7201();
                    /* WARNING: Does not return */
    pcVar1 = (code *)invalidInstructionException();
    (*pcVar1)();
  }
  func_0x000144c79aa0();
  uVar8 = local_68;
  uVar9 = uStack_64;
  uVar10 = uStack_60;
  uVar11 = uStack_5c;
  func_0x000144c79aa0();
  *puVar6 = 0;
  puVar6[2] = 1;
  puVar6[3] = uVar8;
  puVar6[4] = uVar9;
  puVar6[5] = uVar10;
  puVar6[6] = uVar11;
  *(undefined8 *)(puVar6 + 7) = 0x3f000000;
  puVar6[10] = 1;
  puVar6[0xb] = local_68;
  puVar6[0xc] = uStack_64;
  puVar6[0xd] = uStack_60;
  puVar6[0xe] = uStack_5c;
  puVar6[0xf] = 0x3f000000;
  func_0x000140002200();
  puVar7 = (undefined8 *)func_0x0001400021c0();
  if (puVar7 != (undefined8 *)0x0) {
    puVar7[1] = 2;
    puVar7[2] = puVar6;
    puVar7[3] = 2;
    *(undefined4 *)(puVar7 + 4) = 0x40490fdb;
    *(undefined1 *)((long)puVar7 + 0x24) = 0;
    *puVar7 = 0x8000000000000000;
    in_RCX[10] = 1;
    in_RCX[0xb] = puVar7;
    in_RCX[0xc] = 1;
    *in_RCX = CONCAT44(uVar3,uVar2);
    in_RCX[1] = CONCAT44(uVar5,uVar4);
    in_RCX[2] = CONCAT44(uVar2,0x3f800000);
    in_RCX[3] = CONCAT44(uVar4,uVar3);
    in_RCX[4] = CONCAT44(0x3f800000,uVar5);
    in_RCX[5] = CONCAT44(uVar3,uVar2);
    in_RCX[6] = CONCAT44(uVar5,uVar4);
    in_RCX[7] = CONCAT44(uVar2,0x3f800000);
    in_RCX[8] = CONCAT44(uVar4,uVar3);
    in_RCX[9] = CONCAT44(0x3f800000,uVar5);
    return in_RCX;
  }
  func_0x0001458e7201();
                    /* WARNING: Does not return */
  pcVar1 = (code *)invalidInstructionException();
  (*pcVar1)();
}
