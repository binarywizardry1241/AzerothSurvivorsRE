
void entry(undefined8 param_1,undefined8 param_2,long param_3,undefined8 param_4)

{
  undefined4 *puVar1;
  undefined8 uVar2;
  undefined8 uVar3;
  ulong uVar4;
  ulong uVar5;
  code *pcVar6;
  undefined4 uVar7;
  undefined4 uVar8;
  undefined4 uVar9;
  ulong uVar10;
  ulong uVar11;
  undefined8 *puVar12;
  undefined4 *puVar13;
  ulong uVar14;
  uint uVar15;
  ulong uVar16;
  
  uVar4 = *(ulong *)(param_3 + 0x778);
  if (uVar4 != 0) {
    uVar5 = *(ulong *)(param_3 + 0x770);
    func_0x000140002200(param_3,param_4);
    uVar10 = func_0x0001400021c0();
    if (uVar10 == 0) {
      func_0x0001458e721b();
                    /* WARNING: Does not return */
      pcVar6 = (code *)invalidInstructionException();
      (*pcVar6)();
    }
    if ((uVar4 < 0x11) || (uVar10 < (uVar4 * 0x10 + uVar5) - 8 && uVar5 < uVar10 + uVar4 * 8)) {
      uVar11 = 0;
    }
    else {
      uVar11 = 4;
      if ((uVar4 & 3) != 0) {
        uVar11 = (ulong)((uint)uVar4 & 3);
      }
      uVar11 = uVar4 - uVar11;
      puVar13 = (undefined4 *)(uVar5 + 0x20);
      uVar14 = 0;
      do {
        uVar2 = *(undefined8 *)(puVar13 + -4);
        uVar9 = puVar13[-7];
        uVar7 = *puVar13;
        uVar8 = puVar13[1];
        uVar3 = *(undefined8 *)(puVar13 + 4);
        puVar1 = (undefined4 *)(uVar10 + uVar14 * 8);
        *puVar1 = puVar13[-8];
        puVar1[1] = uVar9;
        puVar1[2] = (int)uVar2;
        puVar1[3] = (int)((ulong)uVar2 >> 0x20);
        puVar1 = (undefined4 *)(uVar10 + 0x10 + uVar14 * 8);
        *puVar1 = uVar7;
        puVar1[1] = uVar8;
        puVar1[2] = (int)uVar3;
        puVar1[3] = (int)((ulong)uVar3 >> 0x20);
        uVar14 = uVar14 + 4;
        puVar13 = puVar13 + 0x10;
      } while (uVar11 != uVar14);
    }
    uVar15 = (uint)uVar4 - (int)uVar11 & 3;
    uVar14 = uVar11;
    if (uVar15 != 0) {
      uVar16 = 0;
      do {
        *(undefined8 *)(uVar10 + uVar14 * 8) = *(undefined8 *)(uVar11 * 0x10 + uVar5 + uVar16 * 2);
        uVar14 = uVar14 + 1;
        uVar16 = uVar16 + 8;
      } while (uVar15 << 3 != uVar16);
    }
    if (uVar11 - uVar4 < 0xfffffffffffffffd) {
      puVar12 = (undefined8 *)(uVar14 * 0x10 + uVar5 + 0x30);
      do {
        *(undefined8 *)(uVar10 + uVar14 * 8) = puVar12[-6];
        *(undefined8 *)(uVar10 + 8 + uVar14 * 8) = puVar12[-4];
        *(undefined8 *)(uVar10 + 0x10 + uVar14 * 8) = puVar12[-2];
        *(undefined8 *)(uVar10 + 0x18 + uVar14 * 8) = *puVar12;
        uVar14 = uVar14 + 4;
        puVar12 = puVar12 + 8;
      } while (uVar4 != uVar14);
    }
  }
  func_0x0001454ee2a0();
  func_0x000145544f90();
  if (uVar4 != 0) {
    func_0x0001400021d0();
  }
  return;
}

