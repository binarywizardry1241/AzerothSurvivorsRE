
/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,char param_3,long param_4)

{
  undefined4 *puVar1;
  int iVar2;
  long lVar3;
  undefined4 *puVar4;
  code *pcVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  undefined4 uVar8;
  ulong uVar9;
  undefined1 *puVar10;
  long lVar11;
  ulong uVar12;
  ulong uVar13;
  uint uVar14;
  long lVar15;
  long lVar16;
  undefined4 *puVar17;
  ulong uVar18;
  float fVar19;
  float fVar20;
  float fVar21;
  float fVar22;
  float fVar23;
  undefined4 local_a0;
  undefined4 uStack_9c;
  undefined4 uStack_98;
  undefined4 uStack_94;
  undefined4 local_90;
  undefined4 uStack_8c;
  undefined4 uStack_88;
  undefined4 uStack_84;
  undefined4 uStack_7c;
  long local_78;
  long local_70;
  undefined8 local_58;

  if (param_3 == '\0') {
    *(uint *)(param_4 + 0x93c) =
         *(int *)(param_4 + 0x93c) + -1 + (uint)(*(int *)(param_4 + 0x93c) == 0);
    *(undefined1 *)(param_4 + 0x9b6) = 1;
  }
  else if (param_3 == '\x01') {
    *(uint *)(param_4 + 0x940) =
         *(int *)(param_4 + 0x940) + -1 + (uint)(*(int *)(param_4 + 0x940) == 0);
  }
  else {
    *(uint *)(param_4 + 0x944) =
         *(int *)(param_4 + 0x944) + -1 + (uint)(*(int *)(param_4 + 0x944) == 0);
  }
  lVar15 = *(long *)(param_4 + 0x590);
  *(undefined8 *)(param_4 + 0x590) = 0;
  for (; lVar15 != 0; lVar15 = lVar15 + -1) {
    func_0x000145497810();
  }
  uVar9 = *(ulong *)(param_4 + 0x548);
  if (uVar9 != 0) {
    fVar21 = (float)*(undefined8 *)(param_4 + 0x400);
    fVar23 = (float)((ulong)*(undefined8 *)(param_4 + 0x400) >> 0x20);
    fVar22 = *(float *)(param_4 + 0x488);
    uVar13 = 0;
    uVar14 = 0;
    do {
      while ((*(int *)(*(long *)(param_4 + 0x540) + 0x20 + uVar13 * 0x48) != 0 ||
             ((lVar15 = *(long *)(param_4 + 0x540) + uVar13 * 0x48, *(int *)(lVar15 + 0x18) == 0 &&
              (fVar19 = (float)*(undefined8 *)(lVar15 + 0x34) - fVar21,
              fVar20 = (float)((ulong)*(undefined8 *)(lVar15 + 0x34) >> 0x20) - fVar23,
              fVar22 < SQRT(fVar20 * fVar20 + fVar19 * fVar19)))))) {
        uVar13 = uVar13 + 1;
        if (uVar9 <= uVar13) goto LAB_1454edead;
      }
      uVar14 = uVar14 + *(int *)(lVar15 + 0x24);
      func_0x0001454e3210();
      uVar9 = *(ulong *)(param_4 + 0x548);
    } while (uVar13 < uVar9);
LAB_1454edead:
    if (uVar14 != 0) {
      func_0x00014577322f((float)uVar14 * *(float *)(param_4 + 0x48c));
      func_0x0001454c69e0();
    }
  }
  if (((*(int *)(param_4 + 0x940) != 0) || (*(int *)(param_4 + 0x944) != 0)) ||
     ((*(int *)(param_4 + 0x93c) != 0 &&
      ((*(char *)(param_4 + 0x9ae) != '\x01' || (*(char *)(param_4 + 0x9af) != '\0')))))) {
                    /* WARNING: Bad instruction - Truncating control flow here */
    halt_baddata();
  }
  *(undefined1 *)(param_4 + 0x9b7) = 0xff;
  *(undefined1 *)(param_4 + 0x9af) = 0;
  lVar15 = *(long *)(param_4 + 0x10);
  *(undefined8 *)(param_4 + 0x10) = 0;
  if (lVar15 != 0) {
    func_0x000140002200();
    lVar15 = func_0x0001400021c0();
    if (lVar15 == 0) {
      func_0x00014590379b();
                    /* WARNING: Does not return */
      pcVar5 = (code *)invalidInstructionException();
      (*pcVar5)();
    }
    lVar16 = *(long *)(param_4 + 0x560);
    if (lVar16 == *(long *)(param_4 + 0x550)) {
      func_0x000145774710();
    }
    lVar3 = *(long *)(param_4 + 0x558);
    lVar11 = lVar16 * 0x20;
    *(undefined8 *)(lVar3 + lVar11) = 0x20;
    *(long *)(lVar3 + 8 + lVar11) = lVar15;
    *(undefined8 *)(lVar3 + 0x10 + lVar11) = 0;
    *(undefined2 *)(lVar3 + 0x18 + lVar11) = 0x17e;
    *(long *)(param_4 + 0x560) = lVar16 + 1;
  }
  *(undefined1 *)(param_4 + 0x9b9) = 1;
  func_0x0001454a5900();
  fVar22 = *(float *)(param_4 + 0x934);
  uVar9 = *(ulong *)(param_4 + 0x318);
  if (uVar9 == 0) {
    uVar13 = 0;
LAB_1454ee03e:
    fVar22 = fVar22 + _DAT_145907490;
    if (uVar13 == *(ulong *)(param_4 + 0x308)) {
LAB_1454ee04b:
      func_0x00014577ffc0();
    }
LAB_1454ee050:
    lVar15 = *(long *)(param_4 + 0x310);
    *(undefined4 *)(lVar15 + uVar13 * 0x18) = 0xb;
    *(undefined4 *)(lVar15 + 0xc + uVar13 * 0x18) = 0x3fc;
    *(float *)(lVar15 + 0x10 + uVar13 * 0x18) = fVar22;
    *(undefined4 *)(lVar15 + 0x14 + uVar13 * 0x18) = 0;
    *(ulong *)(param_4 + 0x318) = uVar13 + 1;
    func_0x000145466ab0();
    lVar15 = *(long *)(param_4 + 0x560);
    if (lVar15 == *(long *)(param_4 + 0x550)) {
      func_0x000145774710();
    }
    lVar16 = *(long *)(param_4 + 0x558);
    puVar4 = (undefined4 *)(lVar16 + 0x10 + lVar15 * 0x20);
    *puVar4 = local_90;
    puVar4[1] = uStack_8c;
    puVar4[2] = uStack_88;
    puVar4[3] = uStack_84;
    puVar4 = (undefined4 *)(lVar16 + lVar15 * 0x20);
    *puVar4 = local_a0;
    puVar4[1] = uStack_9c;
    puVar4[2] = uStack_98;
    puVar4[3] = uStack_94;
    *(long *)(param_4 + 0x560) = lVar15 + 1;
    func_0x00014549e650();
    func_0x000140002200();
    puVar10 = (undefined1 *)func_0x0001400021c0();
    if (puVar10 != (undefined1 *)0x0) {
      *puVar10 = 0x7b;
      func_0x000145456ed0();
      if (CONCAT44(uStack_7c,2) == local_70) {
        func_0x0001457744b0();
      }
      local_58 = CONCAT44(uStack_7c,2);
      *(undefined1 *)(local_78 + local_70) = 0x7d;
      lVar15 = *(long *)(param_4 + 0x578);
      if (lVar15 == *(long *)(param_4 + 0x568)) {
        func_0x0001457745c0();
      }
      lVar16 = *(long *)(param_4 + 0x570);
      *(undefined8 *)(lVar16 + lVar15 * 0x18) = local_58;
      *(long *)(lVar16 + 8 + lVar15 * 0x18) = local_78;
      *(long *)(lVar16 + 0x10 + lVar15 * 0x18) = local_70 + 1;
      *(long *)(param_4 + 0x578) = lVar15 + 1;
      return;
    }
    func_0x00014590379b();
                    /* WARNING: Does not return */
    pcVar5 = (code *)invalidInstructionException();
    (*pcVar5)();
  }
  puVar4 = *(undefined4 **)(param_4 + 0x310);
  uVar12 = 0;
  puVar17 = puVar4;
LAB_1454ee020:
  if (puVar17[3] != 0x3fc) goto code_r0x0001454ee02e;
  uVar18 = uVar12 + 1;
  uVar13 = uVar12;
  if (uVar18 < uVar9) {
    if (((int)uVar9 + (int)uVar12 & 1U) == 0) {
      if (puVar17[9] != 0x3fc) {
        *(undefined8 *)(puVar17 + 4) = *(undefined8 *)(puVar17 + 10);
        *puVar17 = puVar17[6];
        puVar17[1] = puVar17[7];
        puVar17[2] = puVar17[8];
        puVar17[3] = puVar17[9];
        uVar13 = uVar12 + 1;
      }
      uVar18 = uVar12 + 2;
    }
    if (uVar9 - 2 != uVar12) {
      puVar17 = puVar4 + uVar18 * 6;
      lVar15 = uVar9 - uVar18;
      do {
        if (puVar17[3] == 0x3fc) {
          iVar2 = puVar17[9];
        }
        else {
          *(undefined8 *)(puVar4 + uVar13 * 6 + 4) = *(undefined8 *)(puVar17 + 4);
          uVar6 = puVar17[1];
          uVar7 = puVar17[2];
          uVar8 = puVar17[3];
          puVar1 = puVar4 + uVar13 * 6;
          *puVar1 = *puVar17;
          puVar1[1] = uVar6;
          puVar1[2] = uVar7;
          puVar1[3] = uVar8;
          uVar13 = uVar13 + 1;
          iVar2 = puVar17[9];
        }
        if (iVar2 != 0x3fc) {
          *(undefined8 *)(puVar4 + uVar13 * 6 + 4) = *(undefined8 *)(puVar17 + 10);
          uVar6 = puVar17[7];
          uVar7 = puVar17[8];
          uVar8 = puVar17[9];
          puVar1 = puVar4 + uVar13 * 6;
          *puVar1 = puVar17[6];
          puVar1[1] = uVar6;
          puVar1[2] = uVar7;
          puVar1[3] = uVar8;
          uVar13 = uVar13 + 1;
        }
        puVar17 = puVar17 + 0xc;
        lVar15 = lVar15 + -2;
      } while (lVar15 != 0);
    }
  }
  *(ulong *)(param_4 + 0x318) = uVar13;
  fVar22 = fVar22 + _DAT_145907490;
  if (uVar13 != *(ulong *)(param_4 + 0x308)) goto LAB_1454ee050;
  goto LAB_1454ee04b;
code_r0x0001454ee02e:
  uVar12 = uVar12 + 1;
  puVar17 = puVar17 + 6;
  uVar13 = uVar9;
  if (uVar9 == uVar12) goto LAB_1454ee03e;
  goto LAB_1454ee020;
}
