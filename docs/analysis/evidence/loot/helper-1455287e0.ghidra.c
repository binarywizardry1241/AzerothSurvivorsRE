
long * entry(undefined8 param_1,undefined8 param_2,long *param_3,long *param_4)

{
  byte bVar1;
  ulong uVar2;
  long lVar3;
  ulong *puVar4;
  ulong uVar5;
  byte *pbVar6;
  ulong *puVar7;
  int *piVar8;
  code *pcVar9;
  int *piVar10;
  int iVar11;
  long lVar12;
  ulong uVar13;
  ulong uVar14;
  undefined4 in_XMM6_Da;
  int iVar15;
  long local_80;
  int *piStack_78;
  long local_70;
  uint local_64;
  undefined8 local_60;
  undefined4 local_58;

  local_60 = 0xfffffffffffffffe;
  uVar2 = param_3[3];
  lVar3 = *param_3;
  puVar4 = (ulong *)param_3[1];
  uVar13 = param_3[2];
  iVar15 = (int)param_3[2] * 100 + 0x1863c;
  do {
    while( true ) {
      iVar11 = iVar15;
      uVar14 = uVar13;
      if (uVar2 <= uVar14) {
        *param_4 = 0;
        param_4[1] = 4;
        param_4[2] = 0;
        return param_4;
      }
      uVar5 = *(ulong *)(lVar3 + 0x10);
      local_58 = in_XMM6_Da;
      if (uVar5 == 0) {
        func_0x0001458e78b0();
                    /* WARNING: Does not return */
        pcVar9 = (code *)invalidInstructionException();
        (*pcVar9)();
      }
      if ((uVar14 | uVar5) >> 0x20 == 0) break;
      uVar13 = uVar14 + 1;
      iVar15 = iVar11 + 100;
      if (uVar14 % uVar5 == *puVar4) goto LAB_14552887a;
    }
    uVar13 = uVar14 + 1;
    iVar15 = iVar11 + 100;
  } while ((uVar14 & 0xffffffff) % (uVar5 & 0xffffffff) != *puVar4);
LAB_14552887a:
  uVar14 = uVar14 + 1;
  pbVar6 = (byte *)param_3[4];
  puVar7 = (ulong *)param_3[5];
  bVar1 = *pbVar6;
  uVar13 = *puVar7;
  piVar8 = (int *)param_3[6];
  iVar15 = *piVar8;
  func_0x000140002200();
  piVar10 = (int *)func_0x0001400021c0();
  if (piVar10 == (int *)0x0) {
    func_0x0001458e721b();
                    /* WARNING: Does not return */
    pcVar9 = (code *)invalidInstructionException();
    (*pcVar9)();
  }
  if (4 < uVar13) {
    uVar13 = 5;
  }
  *piVar10 = (uint)bVar1 * 1000 + (int)uVar13 * 10 + iVar11 + 100;
  piVar10[1] = iVar15;
  local_80 = 4;
  lVar12 = 1;
  piStack_78 = piVar10;
  do {
    iVar15 = (int)uVar14 * 100 + 0x1863c;
    do {
      while( true ) {
        iVar11 = iVar15;
        uVar13 = uVar14;
        if (uVar2 <= uVar13) {
          param_4[2] = lVar12;
          *param_4 = local_80;
          param_4[1] = (long)piStack_78;
          return param_4;
        }
        uVar5 = *(ulong *)(lVar3 + 0x10);
        local_70 = lVar12;
        if (uVar5 == 0) {
          func_0x0001458e78b0();
                    /* WARNING: Does not return */
          pcVar9 = (code *)invalidInstructionException();
          (*pcVar9)();
        }
        if ((uVar13 | uVar5) >> 0x20 != 0) break;
        uVar14 = uVar13 + 1;
        iVar15 = iVar11 + 100;
        if ((uVar13 & 0xffffffff) % (uVar5 & 0xffffffff) == *puVar4) goto LAB_14552895c;
      }
      uVar14 = uVar13 + 1;
      iVar15 = iVar11 + 100;
    } while (uVar13 % uVar5 != *puVar4);
LAB_14552895c:
    uVar14 = uVar13 + 1;
    uVar13 = *puVar7;
    if (4 < uVar13) {
      uVar13 = 5;
    }
    local_64 = (uint)*pbVar6;
    iVar15 = *piVar8;
    if (lVar12 == local_80) {
      func_0x000145757d40(uVar14,uVar13,lVar12,&local_80,1,4);
      piVar10 = piStack_78;
    }
    piVar10[lVar12 * 2] = local_64 * 1000 + (int)uVar13 * 10 + iVar11 + 100;
    piVar10[lVar12 * 2 + 1] = iVar15;
    lVar12 = lVar12 + 1;
  } while( true );
}
