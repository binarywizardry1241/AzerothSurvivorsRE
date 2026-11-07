void entry(undefined8 param_1,undefined4 param_2,undefined8 param_3,undefined8 param_4,
          undefined8 param_5,long *param_6)

{
  byte bVar1;
  byte bVar2;
  byte bVar3;
  code *pcVar4;
  long lVar5;
  long lVar6;
  uint uVar7;
  undefined4 *local_78;
  undefined8 local_70;
  long local_68;
  short *local_60;
  long local_58;
  undefined4 local_44;
  undefined8 local_40;

  local_40 = 0xfffffffffffffffe;
  local_78 = &local_44;
  local_70 = 0x145bedee0;
  local_44 = param_2;
  func_0x000145bdd130(param_3,param_6,0x145dc614d,&local_68,&local_78);
  do {
    while( true ) {
      lVar5 = local_58;
      if (local_58 == 0) goto LAB_14012c0cb;
      bVar1 = *(byte *)((long)local_60 + local_58 + -1);
      if (-1 < (char)bVar1) break;
      bVar2 = *(byte *)((long)local_60 + local_58 + -2);
      if ((char)bVar2 < -0x40) {
        bVar3 = *(byte *)((long)local_60 + local_58 + -3);
        if ((char)bVar3 < -0x40) {
          lVar6 = local_58 + -4;
          uVar7 = bVar3 & 0x3f | (*(byte *)((long)local_60 + local_58 + -4) & 7) << 6;
        }
        else {
          lVar6 = local_58 + -3;
          uVar7 = bVar3 & 0xf;
        }
        uVar7 = bVar2 & 0x3f | uVar7 << 6;
      }
      else {
        lVar6 = local_58 + -2;
        uVar7 = bVar2 & 0x1f;
      }
      local_58 = lVar6;
      if (((uint)(bVar1 & 0x3f) | uVar7 << 6) != 0x30) goto LAB_14012c0cb;
    }
    local_58 = local_58 + -1;
  } while (bVar1 == 0x30);
LAB_14012c0cb:
  do {
    lVar6 = lVar5;
    if (lVar6 == 0) {
      lVar5 = 1;
      lVar6 = 0;
      goto LAB_14012c1a2;
    }
    bVar1 = *(byte *)((long)local_60 + lVar6 + -1);
    if (-1 < (char)bVar1) {
      lVar5 = lVar6 + -1;
      if (bVar1 != 0x2e) break;
      goto LAB_14012c0cb;
    }
    bVar2 = *(byte *)((long)local_60 + lVar6 + -2);
    if ((char)bVar2 < -0x40) {
      bVar3 = *(byte *)((long)local_60 + lVar6 + -3);
      if ((char)bVar3 < -0x40) {
        lVar5 = lVar6 + -4;
        uVar7 = bVar3 & 0x3f | (*(byte *)((long)local_60 + lVar6 + -4) & 7) << 6;
      }
      else {
        lVar5 = lVar6 + -3;
        uVar7 = bVar3 & 0xf;
      }
      uVar7 = bVar2 & 0x3f | uVar7 << 6;
    }
    else {
      lVar5 = lVar6 + -2;
      uVar7 = bVar2 & 0x1f;
    }
  } while (((uint)(bVar1 & 0x3f) | uVar7 << 6) == 0x2e);
  if (lVar6 == 2) {
    lVar6 = (ulong)(*local_60 != 0x302d) + 1;
  }
  else if (lVar6 < 0) goto LAB_14012c1e3;
  func_0x000140002200();
  lVar5 = func_0x0001400021c0();
  if (lVar5 != 0) {
    func_0x000145c0a3db();
LAB_14012c1a2:
    *param_6 = lVar6;
    param_6[1] = lVar5;
    param_6[2] = lVar6;
    if (local_68 != 0) {
      func_0x0001400021d0();
    }
    return;
  }
LAB_14012c1e3:
  func_0x000145da94eb();
                    /* WARNING: Does not return */
  pcVar4 = (code *)invalidInstructionException();
  (*pcVar4)();
}
