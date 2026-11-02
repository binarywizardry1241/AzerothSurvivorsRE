/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,undefined8 *param_3,undefined8 param_4,
          long *param_5,long *param_6)

{
  undefined4 uVar1;
  undefined4 uVar2;
  long lVar3;
  undefined4 *puVar4;
  undefined8 uVar5;
  char cVar6;
  ulong uVar7;
  long lVar8;
  long lVar9;
  undefined4 *puVar10;
  ulong uVar11;
  ulong uVar12;
  ulong uVar13;
  undefined8 *local_68;
  undefined8 local_60;
  undefined8 local_58;
  undefined8 local_50;
  undefined8 local_48;
  undefined8 **local_40;
  undefined8 local_38;
  long local_30;

  lVar9 = param_3[1];
  lVar3 = *param_5;
  puVar4 = (undefined4 *)param_5[2];
  uVar1 = *(undefined4 *)((long)param_5 + 0x1c);
  lVar8 = *param_6;
  puVar10 = (undefined4 *)param_6[2];
  uVar13 = *(ulong *)*param_3;
  uVar7 = 0;
  uVar12 = uVar13 - *(ulong *)(lVar9 + 0x18);
  if (uVar13 < *(ulong *)(lVar9 + 0x18)) {
    uVar12 = uVar7;
  }
  uVar11 = uVar13 - *(ulong *)(lVar9 + 0x38);
  if (uVar13 < *(ulong *)(lVar9 + 0x38)) {
    uVar11 = uVar7;
  }
  uVar13 = *(ulong *)(lVar9 + 0x10) - uVar12;
  if (*(ulong *)(lVar9 + 0x10) < uVar12) {
    uVar13 = uVar7;
  }
  uVar12 = *(ulong *)(lVar9 + 0x30) - uVar11;
  if (*(ulong *)(lVar9 + 0x30) < uVar11) {
    uVar12 = uVar7;
  }
  uVar2 = *(undefined4 *)((long)param_6 + 0x1c);
  *(ulong *)*param_3 = *(ulong *)(lVar9 + 0x40);
  if (uVar12 + uVar13 != 0) {
    *puVar4 = uVar1;
    *(undefined1 *)(lVar3 + 0x19) = 0;
    if (*(char *)(lVar3 + 0x18) == '\x01') {
      *puVar4 = uVar1;
      *(undefined1 *)(lVar3 + 0x18) = 0;
      if ((*_DAT_14807cfa8 < 3) &&
         (((DAT_1480436d0 - 1 < 2 ||
           ((DAT_1480436d0 != 0 && (cVar6 = func_0x000145d45220(), cVar6 != '\0')))) &&
          (cVar6 = func_0x000144c5d8d0(), cVar6 != '\0')))) {
        local_30 = _DAT_1480436c0 + 0x30;
        local_58 = 0x145ea97bf;
        local_50 = 0x4f;
        local_68 = &local_58;
        local_60 = 0x145ea3bd8;
        local_48 = 1;
        local_40 = &local_68;
        local_38 = 1;
        func_0x000144c5f0f0();
      }
      *puVar10 = uVar2;
      lVar9 = *(long *)(lVar8 + 0x30);
      uVar5 = *(undefined8 *)(lVar8 + 0x40);
      if (lVar9 == *(long *)(lVar8 + 0x20)) {
        func_0x000145bfaef0();
      }
      lVar3 = *(long *)(lVar8 + 0x28);
      *(undefined8 *)(lVar3 + lVar9 * 0x10) = uVar5;
      *(undefined1 *)(lVar3 + 8 + lVar9 * 0x10) = 0;
      *(long *)(lVar8 + 0x30) = lVar9 + 1;
      *(long *)(lVar8 + 0x40) = *(long *)(lVar8 + 0x40) + 1;
    }
  }
  return;
}
