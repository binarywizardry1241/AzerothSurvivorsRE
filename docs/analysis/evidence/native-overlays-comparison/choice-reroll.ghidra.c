
/* WARNING: Control flow encountered bad instruction data */

void entry(ulong param_1,undefined8 param_2,undefined8 param_3,long param_4)

{
  ushort uVar1;
  uint uVar2;
  uint uVar3;
  uint uVar4;
  int iVar5;
  long lVar6;
  ulong uVar7;
  char cVar8;
  ulong in_R10;
  ulong uVar9;
  bool bVar10;
  long local_60;
  long local_58;
  undefined8 local_50;
  ulong local_48;
  undefined8 local_40;
  undefined1 local_38 [32];

  if (*(char *)(param_4 + 0x95f) != '\x02') {
    return;
  }
  if (*(char *)(param_4 + 0x95d) == -1) {
    return;
  }
  if (*(int *)(param_4 + 0x4ac) != 0) {
    *(int *)(param_4 + 0x4ac) = *(int *)(param_4 + 0x4ac) + -1;
    halt_baddata();
  }
  uVar2 = *(uint *)(param_4 + 0x4b0);
  uVar3 = 1;
  if ((((uVar2 != 0) && (((uVar2 & 1) == 0 || (uVar3 = 3, uVar2 != 1)))) &&
      (((uVar2 & 2) == 0 || (uVar3 = uVar3 * 9, (uVar2 & 0xfffffffe) != 2)))) &&
     ((((uVar2 & 4) == 0 || (uVar3 = uVar3 * 0x51, (uVar2 & 0xfffffffc) != 4)) &&
      (((uVar2 & 8) == 0 || (uVar3 = uVar3 * 0x19a1, (uVar2 & 0xfffffff8) != 8)))))) {
    in_R10 = CONCAT71((int7)(in_R10 >> 8),1);
    uVar4 = 0xffffff9c;
    if ((uVar2 & 0x10) == 0) goto LAB_1454e7903;
    uVar9 = (ulong)uVar3;
    uVar3 = (uint)(uVar9 * 0x290d741);
    if (((uVar2 & 0xfffffff0) != 0x10) || ((int)(uVar9 * 0x290d741 >> 0x20) != 0))
    goto LAB_1454e7903;
  }
  uVar4 = (uint)((ulong)uVar3 * 100);
  in_R10 = CONCAT71((int7)(in_R10 >> 8),(int)((ulong)uVar3 * 100 >> 0x20) != 0);
LAB_1454e7903:
  if ((char)in_R10 == '\0') {
    iVar5 = *(uint *)(param_4 + 0x408) - uVar4;
    if (*(uint *)(param_4 + 0x408) < uVar4) {
      return;
    }
  }
  else {
    iVar5 = *(int *)(param_4 + 0x408) + 1;
    if (*(int *)(param_4 + 0x408) != -1) {
      return;
    }
  }
  *(int *)(param_4 + 0x408) = iVar5;
  *(uint *)(param_4 + 0x4b0) = uVar2 + 1;
  local_58 = *(long *)(param_4 + 0x8b8);
  if (local_58 == 0) {
    local_58 = 0;
LAB_1454e79ba:
    local_60 = param_4 + 0x8b8;
    local_50 = 0;
    local_40 = 0x498;
    local_48 = in_R10;
    func_0x000145427a50(param_1,param_4,&local_60,local_38);
                    /* WARNING: Bad instruction - Truncating control flow here */
    halt_baddata();
  }
  lVar6 = *(long *)(param_4 + 0x8c0);
  do {
    uVar7 = (ulong)((uint)*(ushort *)(local_58 + 0x36) * 2);
    uVar9 = 0xffffffffffffffff;
    do {
      in_R10 = (ulong)*(ushort *)(local_58 + 0x36);
      if (uVar7 == 0) goto LAB_1454e79a1;
      uVar1 = *(ushort *)(local_58 + 0x3a + uVar9 * 2);
      cVar8 = (uVar1 < 0x498) - (0x498 < uVar1);
      param_1 = (ulong)CONCAT11((char)(uVar1 >> 8),cVar8);
      in_R10 = uVar9 + 1;
      uVar7 = uVar7 - 2;
      uVar9 = in_R10;
    } while (cVar8 == '\x01');
    if (cVar8 == '\0') {
      *(int *)(local_58 + 8 + in_R10 * 4) = iVar5 * 10000;
      halt_baddata();
    }
LAB_1454e79a1:
    bVar10 = lVar6 == 0;
    lVar6 = lVar6 + -1;
    if (bVar10) goto LAB_1454e79ba;
    local_58 = *(long *)(local_58 + 0x50 + in_R10 * 8);
  } while( true );
}
