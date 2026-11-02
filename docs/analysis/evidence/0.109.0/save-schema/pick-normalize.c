long * entry(undefined8 param_1,undefined8 param_2,long *param_3,long *param_4)

{
  code *pcVar1;
  uint uVar2;
  ushort uVar3;
  long lVar4;
  long lVar5;
  long lVar6;
  byte bVar7;
  char cVar8;
  undefined1 *puVar9;
  long lVar10;
  undefined8 uVar11;
  long lVar12;
  long *plVar13;
  uint uVar14;
  uint uVar15;
  uint uVar16;
  uint uVar17;
  uint uVar18;
  uint uVar19;
  long local_70;
  undefined4 *local_68;
  long local_60;

  bVar7 = (char)param_3[7] - 2;
  if (bVar7 < 10) {
    lVar10 = *(long *)((ulong)bVar7 * 8 + 0x146bebb40);
  }
  else {
    lVar10 = 0x146be06e8;
  }
  cVar8 = *(char *)(lVar10 + 0x8c);
  *(char *)(param_3 + 7) = cVar8;
  bVar7 = cVar8 - 1;
  if (bVar7 < 0xb) {
    lVar12 = (ulong)bVar7 * 8;
    lVar10 = *(long *)(lVar12 + 0x146bebb90);
    puVar9 = *(undefined1 **)(lVar12 + 0x146bebbe8);
  }
  else {
    puVar9 = &DAT_146beb661;
    lVar10 = 1;
  }
  lVar12 = 0;
  do {
    if (puVar9[lVar12] == *(char *)((long)param_3 + 0x39)) goto LAB_1458a8063;
    lVar12 = lVar12 + 1;
  } while (lVar10 != lVar12);
  *(undefined1 *)((long)param_3 + 0x39) = *puVar9;
LAB_1458a8063:
  *(bool *)((long)param_3 + 0x3a) = *(char *)((long)param_3 + 0x3a) != '\0';
  lVar10 = func_0x00014588d0d0(param_3,param_4,param_3[5],param_3[4]);
  lVar10 = *(long *)(lVar10 * 0xf0 + 0x146bde3a0);
  func_0x000140002200();
  lVar12 = func_0x0001400021c0();
  if (lVar12 == 0) {
    func_0x000145d992bb();
  }
  else {
    plVar13 = param_3;
    func_0x000145bfa0e7();
    if (plVar13[3] != 0) {
      func_0x0001400021d0();
    }
    plVar13[3] = lVar10;
    plVar13[4] = lVar12;
    plVar13[5] = lVar10;
    cVar8 = func_0x0001458a8710();
    if (cVar8 == -1) {
      func_0x000140089200();
      func_0x0001458a8fa0();
      if (local_70 != -1) {
        lVar10 = *param_3;
        goto joined_r0x0001458a833a;
      }
    }
    func_0x000140002200();
    local_60 = 4;
    local_68 = (undefined4 *)func_0x0001400021c0();
    if (local_68 != (undefined4 *)0x0) {
      *local_68 = 0x6f726548;
      local_70 = 4;
      lVar10 = *param_3;
joined_r0x0001458a833a:
      if (lVar10 != 0) {
        func_0x0001400021d0();
      }
      *param_3 = local_70;
      param_3[1] = (long)local_68;
      param_3[2] = local_60;
      uVar11 = func_0x0001459a2280();
      *(int *)((long)param_3 + 0x3b) = (int)uVar11;
      *(char *)((long)param_3 + 0x3f) = (char)((ulong)uVar11 >> 0x20);
      lVar10 = param_3[6];
      uVar2 = (uint)((ulong)lVar10 >> 0x20);
      uVar14 = 300;
      if ((uVar2 & 0xffff) < 300) {
        uVar14 = uVar2;
      }
      uVar14 = uVar14 - 100;
      if ((ushort)((ulong)lVar10 >> 0x20) < 100) {
        uVar14 = 0;
      }
      uVar15 = (uint)((ulong)lVar10 >> 0x10) & 0xffff;
      if (499 < uVar15) {
        uVar15 = 500;
      }
      uVar15 = uVar15 - 100;
      if ((ushort)((ulong)lVar10 >> 0x10) < 100) {
        uVar15 = 0;
      }
      uVar17 = (uVar15 & 0xffff) * 0x47af >> 0x10;
      uVar16 = 500;
      if (((uint)lVar10 & 0xffff) < 500) {
        uVar16 = (uint)lVar10;
      }
      uVar16 = uVar16 - 100;
      if ((ushort)lVar10 < 100) {
        uVar16 = 0;
      }
      uVar18 = (uVar16 & 0xffff) * 0x47af >> 0x10;
      uVar3 = (ushort)((ulong)lVar10 >> 0x30);
      uVar19 = 0x96;
      if (uVar3 < 0x96) {
        uVar19 = (uint)uVar3;
      }
      uVar19 = uVar19 - 100;
      if (uVar2 >> 0x12 < 0x19) {
        uVar19 = 0;
      }
      param_3[6] = (ulong)((((uVar16 - uVar18 & 0xffff) >> 1) + uVar18 >> 4) * 0x19 + 100 & 0xffff)
                   | (ulong)((((uVar15 - uVar17 & 0xffff) >> 1) + uVar17 >> 4) * 0x190000 + 0x640000
                            ) |
                     (ulong)(((uVar14 & 0xffff) / 5 & 0xfffffffe) * 5 + 100 & 0xffff) << 0x20 |
                     (ulong)(((uVar19 & 0xffff) / 5) * 5 + 100) << 0x30;
      lVar10 = *param_3;
      lVar12 = param_3[1];
      lVar4 = param_3[2];
      lVar5 = param_3[3];
      lVar6 = param_3[5];
      param_4[4] = param_3[4];
      param_4[5] = lVar6;
      param_4[2] = lVar4;
      param_4[3] = lVar5;
      *param_4 = lVar10;
      param_4[1] = lVar12;
      param_4[6] = param_3[6];
      param_4[7] = param_3[7];
      return param_4;
    }
    func_0x000145d992bb();
  }
                    /* WARNING: Does not return */
  pcVar1 = (code *)invalidInstructionException();
  (*pcVar1)();
}
