
long * entry(undefined8 param_1,undefined8 param_2,long *param_3,long *param_4)

{
  undefined4 *puVar1;
  long lVar2;
  long lVar3;
  code *pcVar4;
  undefined4 *puVar5;
  long lVar6;
  long lVar7;
  long lVar8;
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
  long local_70;
  undefined4 *local_68;
  long local_60;
  undefined8 local_48;

  local_48 = 0xfffffffffffffffe;
  lVar2 = param_3[1];
  if (*param_3 != lVar2) {
    lVar3 = param_3[2];
    lVar6 = *param_3;
    do {
      lVar7 = lVar6 + 0x48;
      if (*(long *)(lVar6 + 0x38) == *(long *)(lVar3 + 0xb40)) {
        *param_3 = lVar7;
        func_0x000145ce7810(param_1,param_4,lVar6,&local_88);
        if (CONCAT44(uStack_84,local_88) != -1) {
          func_0x000140002200();
          puVar5 = (undefined4 *)func_0x0001400021c0();
          if (puVar5 == (undefined4 *)0x0) {
            func_0x000145eb6fcb();
                    /* WARNING: Does not return */
            pcVar4 = (code *)invalidInstructionException();
            (*pcVar4)();
          }
          *(undefined8 *)(puVar5 + 4) = local_78;
          *puVar5 = local_88;
          puVar5[1] = uStack_84;
          puVar5[2] = uStack_80;
          puVar5[3] = uStack_7c;
          local_70 = 4;
          local_60 = 1;
          local_68 = puVar5;
          lVar6 = local_60;
          goto joined_r0x0001459c295c;
        }
        break;
      }
      lVar6 = lVar7;
    } while (lVar7 != lVar2);
  }
  *param_4 = 0;
  param_4[1] = 8;
  param_4[2] = 0;
  return param_4;
joined_r0x0001459c295c:
  local_60 = lVar6;
  if (lVar7 == lVar2) {
LAB_1459c2a05:
    param_4[2] = local_60;
    *param_4 = local_70;
    param_4[1] = (long)local_68;
    return param_4;
  }
  lVar8 = lVar7;
  while (lVar7 = lVar8 + 0x48, *(long *)(lVar8 + 0x38) != *(long *)(lVar3 + 0xb40)) {
    lVar8 = lVar7;
    if (lVar7 == lVar2) goto LAB_1459c2a05;
  }
  func_0x000145ce7810();
  if (CONCAT44(uStack_9c,local_a0) == -1) goto LAB_1459c2a05;
  if (lVar6 == local_70) {
    func_0x000145d14a10();
    puVar5 = local_68;
  }
  *(undefined8 *)(puVar5 + lVar6 * 6 + 4) = local_90;
  puVar1 = puVar5 + lVar6 * 6;
  *puVar1 = local_a0;
  puVar1[1] = uStack_9c;
  puVar1[2] = uStack_98;
  puVar1[3] = uStack_94;
  lVar6 = lVar6 + 1;
  goto joined_r0x0001459c295c;
}
