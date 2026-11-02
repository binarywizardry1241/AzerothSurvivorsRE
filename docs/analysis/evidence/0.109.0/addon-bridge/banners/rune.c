undefined8 *
FUN_1458ea950(undefined8 param_1,undefined8 param_2,undefined8 param_3,undefined8 *param_4,
             long param_5)

{
  code *pcVar1;
  long lVar2;
  long lVar3;
  undefined8 *local_90;
  undefined8 local_88;
  undefined8 local_80;
  undefined8 uStack_78;
  undefined8 local_70;
  undefined8 local_68;
  undefined8 local_60;
  undefined8 local_58;
  long local_50;
  undefined8 local_48;

  local_48 = 0xfffffffffffffffe;
  local_90 = &local_58;
  local_88 = 0x1400020c0;
  local_58 = param_3;
  local_50 = param_5;
  func_0x000145bcce30(param_1,param_4,0x146bf17d3,&local_80,&local_90);
  local_60 = uStack_78;
  local_68 = local_80;
  if (-1 < local_50) {
    if (local_50 == 0) {
      lVar2 = 1;
    }
    else {
      lVar3 = local_50;
      func_0x000140002200();
      lVar2 = func_0x0001400021c0();
      if (lVar2 == 0) goto LAB_1458ea9b3;
      func_0x000145bfa0e7();
      local_50 = lVar3;
    }
    param_4[6] = 0x146bf17d7;
    param_4[7] = 4;
    *param_4 = local_80;
    param_4[1] = uStack_78;
    param_4[2] = local_70;
    param_4[3] = local_50;
    param_4[4] = lVar2;
    param_4[5] = local_50;
    *(undefined1 *)(param_4 + 8) = 0;
    return param_4;
  }
LAB_1458ea9b3:
  func_0x000145d992bb();
                    /* WARNING: Does not return */
  pcVar1 = (code *)invalidInstructionException();
  (*pcVar1)();
}
