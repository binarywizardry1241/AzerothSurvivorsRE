long * entry(undefined8 param_1,undefined8 param_2,long *param_3,long *param_4)

{
  char cVar1;
  code *pcVar2;
  uint uVar3;
  ushort uVar4;
  long lVar5;
  long lVar6;
  long lVar7;
  byte bVar8;
  char cVar9;
  char *pcVar10;
  long lVar11;
  long lVar12;
  undefined8 uVar13;
  uint uVar14;
  uint uVar15;
  uint uVar16;
  uint uVar17;
  uint uVar18;
  uint uVar19;
  long local_70;
  undefined4 *local_68;
  long local_60;

  bVar8 = (char)param_3[7] - 2;
  if (bVar8 < 10) {
    lVar11 = *(long *)((ulong)bVar8 * 8 + 0x146f86458);
  }
  else {
    lVar11 = 0x146f7b0f8;
  }
  cVar9 = *(char *)(lVar11 + 0x8c);
  *(char *)(param_3 + 7) = cVar9;
  cVar1 = *(char *)((long)param_3 + 0x39);
  if (7 < (byte)(cVar1 - 1U)) {
    bVar8 = cVar9 - 1;
    if (bVar8 < 0xb) {
      pcVar10 = *(char **)((ulong)bVar8 * 8 + 0x146f864a8);
    }
    else {
      pcVar10 = &DAT_146f85fd8;
    }
    cVar1 = *pcVar10;
    *(char *)((long)param_3 + 0x39) = cVar1;
  }
  *(bool *)((long)param_3 + 0x3a) = *(char *)((long)param_3 + 0x3a) != '\0';
  lVar11 = func_0x000145a82ca0(cVar1,param_4,param_3[5],param_3[4]);
  lVar11 = *(long *)(lVar11 * 0xf0 + 0x146f78db8);
  func_0x000140002200();
  lVar12 = func_0x0001400021c0();
  if (lVar12 == 0) {
    func_0x00014614ad6b();
  }
  else {
    func_0x000145fa3aab();
    if (param_3[3] != 0) {
      func_0x0001400021d0();
    }
    param_3[3] = lVar11;
    param_3[4] = lVar12;
    param_3[5] = lVar11;
    cVar9 = func_0x000145a99200();
    if (cVar9 == -1) {
      func_0x0001401f3a70();
      func_0x000145a99a90();
      if (local_70 != -1) {
        lVar11 = *param_3;
        goto joined_r0x000145a984b5;
      }
    }
    func_0x000140002200();
    local_60 = 4;
    local_68 = (undefined4 *)func_0x0001400021c0();
    if (local_68 != (undefined4 *)0x0) {
      *local_68 = 0x6f726548;
      local_70 = 4;
      lVar11 = *param_3;
joined_r0x000145a984b5:
      if (lVar11 != 0) {
        func_0x0001400021d0();
      }
      *param_3 = local_70;
      param_3[1] = (long)local_68;
      param_3[2] = local_60;
      uVar13 = func_0x000145a7fa60();
      *(int *)((long)param_3 + 0x3b) = (int)uVar13;
      *(char *)((long)param_3 + 0x3f) = (char)((ulong)uVar13 >> 0x20);
      lVar11 = param_3[6];
      uVar3 = (uint)((ulong)lVar11 >> 0x20);
      uVar14 = 300;
      if ((uVar3 & 0xffff) < 300) {
        uVar14 = uVar3;
      }
      uVar14 = uVar14 - 100;
      if ((ushort)((ulong)lVar11 >> 0x20) < 100) {
        uVar14 = 0;
      }
      uVar15 = (uint)((ulong)lVar11 >> 0x10) & 0xffff;
      if (499 < uVar15) {
        uVar15 = 500;
      }
      uVar15 = uVar15 - 100;
      if ((ushort)((ulong)lVar11 >> 0x10) < 100) {
        uVar15 = 0;
      }
      uVar17 = (uVar15 & 0xffff) * 0x47af >> 0x10;
      uVar16 = 500;
      if (((uint)lVar11 & 0xffff) < 500) {
        uVar16 = (uint)lVar11;
      }
      uVar16 = uVar16 - 100;
      if ((ushort)lVar11 < 100) {
        uVar16 = 0;
      }
      uVar18 = (uVar16 & 0xffff) * 0x47af >> 0x10;
      uVar4 = (ushort)((ulong)lVar11 >> 0x30);
      uVar19 = 0x96;
      if (uVar4 < 0x96) {
        uVar19 = (uint)uVar4;
      }
      uVar19 = uVar19 - 100;
      if (uVar3 >> 0x12 < 0x19) {
        uVar19 = 0;
      }
      param_3[6] = (ulong)((((uVar16 - uVar18 & 0xffff) >> 1) + uVar18 >> 4) * 0x19 + 100 & 0xffff)
                   | (ulong)((((uVar15 - uVar17 & 0xffff) >> 1) + uVar17 >> 4) * 0x190000 + 0x640000
                            ) |
                     (ulong)(((uVar14 & 0xffff) / 5 & 0xfffffffe) * 5 + 100 & 0xffff) << 0x20 |
                     (ulong)(((uVar19 & 0xffff) / 5) * 5 + 100) << 0x30;
      lVar11 = *param_3;
      lVar12 = param_3[1];
      lVar5 = param_3[2];
      lVar6 = param_3[3];
      lVar7 = param_3[5];
      param_4[4] = param_3[4];
      param_4[5] = lVar7;
      param_4[2] = lVar5;
      param_4[3] = lVar6;
      *param_4 = lVar11;
      param_4[1] = lVar12;
      param_4[6] = param_3[6];
      param_4[7] = param_3[7];
      return param_4;
    }
    func_0x00014614ad6b();
  }
                    /* WARNING: Does not return */
  pcVar2 = (code *)invalidInstructionException();
  (*pcVar2)();
}
