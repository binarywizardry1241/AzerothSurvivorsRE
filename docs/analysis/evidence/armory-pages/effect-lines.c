undefined8 *
entry(undefined8 param_1,undefined8 param_2,long param_3,undefined8 *param_4,long param_5)

{
  undefined4 *puVar1;
  code *pcVar2;
  undefined4 *puVar3;
  long lVar4;
  undefined4 local_a0;
  undefined4 uStack_9c;
  undefined4 uStack_98;
  undefined4 uStack_94;
  undefined8 local_90;
  undefined4 local_88;
  undefined4 uStack_84;
  undefined4 uStack_80;
  undefined4 uStack_7c;
  undefined8 local_78;
  long local_60;

  do {
    if (param_3 == param_5) {
      *param_4 = 0;
      param_4[1] = 8;
      param_4[2] = 0;
      return param_4;
    }
    param_3 = param_3 + 8;
    func_0x0001459a0760();
  } while (CONCAT44(uStack_84,local_88) == -1);
  func_0x000140002200();
  puVar3 = (undefined4 *)func_0x0001400021c0();
  if (puVar3 != (undefined4 *)0x0) {
    *(undefined8 *)(puVar3 + 4) = local_78;
    *puVar3 = local_88;
    puVar3[1] = uStack_84;
    puVar3[2] = uStack_80;
    puVar3[3] = uStack_7c;
    local_60 = 1;
    lVar4 = 1;
    while (param_3 != param_5) {
      func_0x0001459a0760();
      param_3 = param_3 + 8;
      if (CONCAT44(uStack_9c,local_a0) != -1) {
        if (lVar4 == 4) {
          func_0x000145bfa970();
        }
        *(undefined8 *)(puVar3 + lVar4 * 6 + 4) = local_90;
        puVar1 = puVar3 + lVar4 * 6;
        *puVar1 = local_a0;
        puVar1[1] = uStack_9c;
        puVar1[2] = uStack_98;
        puVar1[3] = uStack_94;
        lVar4 = lVar4 + 1;
        local_60 = lVar4;
      }
    }
    param_4[2] = local_60;
    *param_4 = 4;
    param_4[1] = puVar3;
    return param_4;
  }
  func_0x000145d992bb();
                    /* WARNING: Does not return */
  pcVar2 = (code *)invalidInstructionException();
  (*pcVar2)();
}
