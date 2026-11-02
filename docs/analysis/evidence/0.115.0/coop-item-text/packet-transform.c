undefined8 *
entry(undefined8 param_1,undefined8 param_2,long param_3,undefined8 *param_4,undefined8 param_5,
     undefined8 param_6)

{
  code *pcVar1;
  ulong uVar2;
  long lVar3;
  long lVar4;
  byte *pbVar5;
  byte *pbVar6;
  ulong uVar7;
  ulong uVar8;
  byte bVar9;
  bool bVar10;
  long local_c0;
  undefined4 local_98;
  undefined4 uStack_94;
  undefined4 uStack_90;
  undefined4 uStack_8c;
  undefined4 local_88;
  int iStack_84;
  undefined4 uStack_80;
  undefined4 uStack_7c;
  long local_78;
  long local_70;
  long local_68;
  long local_60;
  long local_58;
  long local_50;
  undefined8 local_48;

  local_48 = 0xfffffffffffffffe;
  if ((*(short *)(param_3 + 0x18) != 0x96) || (uVar8 = *(ulong *)(param_3 + 0x10), uVar8 == 0)) {
LAB_1459b0594:
    *param_4 = 0xffffffffffffffff;
    return param_4;
  }
  bVar9 = **(byte **)(param_3 + 8);
  pbVar6 = *(byte **)(param_3 + 8) + 5;
  pbVar5 = (byte *)0x1;
  if (uVar8 < 5) {
    pbVar6 = (byte *)0x1;
  }
  uVar7 = uVar8 - 5;
  if (uVar8 - 1 < 4) {
    uVar7 = 0;
  }
  if (bVar9 == 0xc) {
    if (((((5 < uVar8) && (uVar7 != 1)) && (2 < uVar7)) && ((uVar7 != 3 && (4 < uVar7)))) &&
       ((uVar7 = uVar7 - 4, uVar7 != 1 && ((2 < uVar7 && (uVar7 != 3)))))) {
      pbVar5 = pbVar6 + 8;
    }
    uVar7 = 0;
    if (0xb < uVar8 - 1) {
      uVar7 = uVar8 - 0xd;
    }
  }
  else {
    pbVar5 = pbVar6;
    if (bVar9 != 0x5a) goto LAB_1459b0594;
  }
  pbVar5 = pbVar5 + 4;
  uVar8 = uVar7 - 4;
  bVar10 = uVar8 != 0;
  if (3 >= uVar7) {
    uVar8 = 0;
    pbVar5 = (byte *)0x1;
  }
  uVar2 = 0;
  if (3 < uVar7 && bVar10) {
    uVar7 = 0;
    do {
      uVar2 = uVar7;
      if (pbVar5[uVar7] == 0) break;
      uVar7 = uVar7 + 1;
      uVar2 = uVar8;
    } while (uVar8 != uVar7);
  }
  local_60 = param_5;
  func_0x000145ce4d50(param_6,param_4,pbVar5,&local_98,uVar2);
  local_78 = CONCAT44(uStack_94,local_98);
  local_68 = CONCAT44(uStack_8c,uStack_90);
  local_50 = CONCAT44(iStack_84,local_88);
  if (local_78 == -1) {
    if (iStack_84 < 0) {
LAB_1459b06c6:
      func_0x000145eb6fcb();
                    /* WARNING: Does not return */
      pcVar1 = (code *)invalidInstructionException();
      (*pcVar1)();
    }
    if (local_50 == 0) {
      local_68 = 1;
      local_50 = 0;
      local_78 = 0;
    }
    else {
      local_58 = CONCAT44(local_58._4_4_,(uint)bVar9);
      func_0x000140002200();
      lVar3 = func_0x0001400021c0();
      if (lVar3 == 0) goto LAB_1459b06c6;
      func_0x000145d145fb();
      local_78 = local_50;
      bVar9 = (byte)local_58;
      local_68 = lVar3;
    }
  }
  uVar7 = uVar2 + 1;
  pbVar5 = pbVar5 + uVar2 + 1;
  if (uVar8 <= uVar2) {
    pbVar5 = (byte *)0x1;
  }
  pbVar6 = (byte *)0x1;
  uVar2 = 0;
  if (uVar8 >= uVar7) {
    uVar2 = uVar8 - uVar7;
  }
  if ((uVar8 < uVar7 || uVar8 - uVar7 == 0) || (uVar2 < 4)) {
LAB_1459b06d4:
    pbVar6 = pbVar6 + 4;
    lVar3 = uVar2 - 0xc;
    if (uVar2 < 0xc) {
      pbVar6 = (byte *)0x1;
      lVar3 = 0;
    }
    if (uVar2 >= 0xc && uVar2 - 0xc != 0) {
      lVar4 = 0;
      do {
        if (pbVar6[lVar4] == 0) break;
        lVar4 = lVar4 + 1;
      } while (lVar3 != lVar4);
    }
  }
  else if (7 < uVar2) {
    pbVar6 = pbVar5 + 8;
    goto LAB_1459b06d4;
  }
  func_0x000145ce4d50();
  local_70 = CONCAT44(uStack_94,local_98);
  local_58 = CONCAT44(uStack_8c,uStack_90);
  lVar3 = CONCAT44(iStack_84,local_88);
  if (local_70 == -1) {
    if (iStack_84 < 0) {
LAB_1459b0844:
      func_0x000145eb6fcb();
                    /* WARNING: Does not return */
      pcVar1 = (code *)invalidInstructionException();
      (*pcVar1)();
    }
    if (lVar3 == 0) {
      local_58 = 1;
      local_70 = 0;
    }
    else {
      func_0x000140002200();
      lVar4 = func_0x0001400021c0();
      if (lVar4 == 0) goto LAB_1459b0844;
      func_0x000145d145fb();
      local_70 = lVar3;
      local_58 = lVar4;
    }
  }
  func_0x0001458de3d0();
  func_0x0001458de3d0();
  local_60 = CONCAT44(uStack_94,local_98);
  local_50 = local_c0;
  if (bVar9 == 0xc) {
    func_0x0001459ac240();
  }
  else {
    func_0x0001459a9360();
  }
  *(undefined4 *)(param_4 + 2) = local_88;
  *(int *)((long)param_4 + 0x14) = iStack_84;
  *(undefined4 *)(param_4 + 3) = uStack_80;
  *(undefined4 *)((long)param_4 + 0x1c) = uStack_7c;
  *(undefined4 *)param_4 = local_98;
  *(undefined4 *)((long)param_4 + 4) = uStack_94;
  *(undefined4 *)(param_4 + 1) = uStack_90;
  *(undefined4 *)((long)param_4 + 0xc) = uStack_8c;
  if (local_50 != 0) {
    func_0x0001400021d0();
  }
  lVar3 = local_70;
  lVar4 = local_78;
  if (local_60 != 0) {
    func_0x0001400021d0();
  }
  if (lVar3 != 0) {
    func_0x0001400021d0();
  }
  if (lVar4 != 0) {
    func_0x0001400021d0();
  }
  return param_4;
}
