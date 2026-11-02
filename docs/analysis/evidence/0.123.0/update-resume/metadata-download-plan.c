
/* WARNING: Removing unreachable block (ram,0x00014005e453) */
/* WARNING: Removing unreachable block (ram,0x00014005e46c) */
/* WARNING: Removing unreachable block (ram,0x00014005e485) */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

long * entry(undefined8 param_1,undefined8 param_2,long param_3,long *param_4,ulong param_5)

{
  code *pcVar1;
  long *plVar2;
  char *pcVar3;
  undefined8 *puVar4;
  long lVar5;
  long lVar6;
  long *plVar7;
  ulong uVar8;
  undefined1 auVar9 [16];
  long local_1b0;
  long local_1a8;
  long local_1a0;
  undefined4 local_198;
  undefined4 uStack_194;
  undefined4 uStack_190;
  undefined4 uStack_18c;
  long local_188;
  long lStack_180;
  long local_178;
  long lStack_170;
  long local_168;
  char local_a0;
  undefined8 local_98;
  long local_60;
  long local_48;
  
  func_0x000140477390();
  func_0x000140477290();
  auVar9 = func_0x000140477630();
  plVar7 = auVar9._8_8_;
  plVar2 = auVar9._0_8_;
  func_0x000140476d20();
  func_0x00014047aa70();
  func_0x00014600504b();
  if (local_1b0 != -2) {
    func_0x00014600504b();
    func_0x000140002200();
    lVar5 = func_0x0001400021c0();
    if (lVar5 != 0) {
      func_0x00014600504b();
      param_4[1] = lVar5;
      lVar5 = 0x1461b9548;
      goto LAB_14005e193;
    }
    func_0x0001461add41();
    goto LAB_14005e4c1;
  }
  func_0x00014600504b();
  func_0x00014047cac0();
  func_0x00014006bdf0();
  if (local_a0 == -1) {
    func_0x000140002200();
    puVar4 = (undefined8 *)func_0x0001400021c0();
    if (puVar4 == (undefined8 *)0x0) {
      func_0x0001461add41();
      goto LAB_14005e4c1;
    }
    *puVar4 = local_98;
    param_4[1] = (long)puVar4;
    lVar5 = 0x1461b94d0;
LAB_14005e193:
    param_4[2] = lVar5;
    *param_4 = -1;
    LOCK();
    *plVar2 = *plVar2 + -1;
    UNLOCK();
    if (*plVar2 == 0) {
      func_0x0001404745b0();
    }
    LOCK();
    *plVar7 = *plVar7 + -1;
    UNLOCK();
    if (*plVar7 == 0) {
      func_0x000140474380();
    }
    return param_4;
  }
  LOCK();
  *plVar2 = *plVar2 + -1;
  UNLOCK();
  if (*plVar2 == 0) {
    func_0x0001404745b0();
  }
  LOCK();
  *plVar7 = *plVar7 + -1;
  UNLOCK();
  if (*plVar7 == 0) {
    func_0x000140474380();
  }
  pcVar3 = (char *)func_0x000142cdd5d0();
  if (pcVar3 == (char *)0x0) {
    pcVar3 = _DAT_1485be338;
  }
  if (*pcVar3 == '\x03') {
    lVar5 = *(long *)(pcVar3 + 0x18);
    if (-1 < lVar5) {
      if (lVar5 == 0) goto LAB_14005e2bb;
      func_0x000140002200();
      lVar6 = func_0x0001400021c0();
      if (lVar6 != 0) {
        func_0x00014600504b();
        pcVar3 = (char *)func_0x000142cdd5d0();
        if (pcVar3 == (char *)0x0) {
          pcVar3 = _DAT_1485be338;
        }
        local_60 = 1;
        if (*pcVar3 == '\x03') {
          local_48 = *(long *)(pcVar3 + 0x18);
          if (local_48 < 0) {
LAB_14005e2a6:
            func_0x0001461add5b();
            goto LAB_14005e4c1;
          }
          if (local_48 == 0) goto LAB_14005e362;
          func_0x000140002200();
          local_60 = func_0x0001400021c0();
          if (local_60 == 0) goto LAB_14005e2a6;
          func_0x00014600504b();
        }
        else {
LAB_14005e362:
          local_48 = 0;
        }
        while( true ) {
          auVar9 = func_0x000145fe08c0();
          uVar8 = auVar9._8_8_;
          if (auVar9._0_8_ != 1) break;
          if ((uVar8 < param_5) && (*(char *)(param_3 + uVar8) == '/')) {
            if ((uVar8 + 1 < param_5) && (*(char *)(param_3 + uVar8 + 1) < -0x40)) {
              func_0x0001461adf70();
              goto LAB_14005e4c1;
            }
            break;
          }
          if (param_5 < uVar8) break;
        }
        func_0x00014005d970();
        param_4[0xf] = local_168;
        param_4[0xd] = local_178;
        param_4[0xe] = lStack_170;
        param_4[0xb] = local_188;
        param_4[0xc] = lStack_180;
        *(undefined4 *)(param_4 + 9) = local_198;
        *(undefined4 *)((long)param_4 + 0x4c) = uStack_194;
        *(undefined4 *)(param_4 + 10) = uStack_190;
        *(undefined4 *)((long)param_4 + 0x54) = uStack_18c;
        *param_4 = lVar5;
        param_4[1] = lVar6;
        param_4[2] = lVar5;
        param_4[3] = local_48;
        param_4[4] = local_60;
        param_4[5] = local_48;
        param_4[6] = -2;
        param_4[7] = local_1a8;
        param_4[8] = local_1a0;
        goto LAB_14005e2f9;
      }
    }
    func_0x0001461add5b();
LAB_14005e4c1:
                    /* WARNING: Does not return */
    pcVar1 = (code *)invalidInstructionException();
    (*pcVar1)();
  }
LAB_14005e2bb:
  auVar9 = func_0x000145fd8770();
  *(undefined1 (*) [16])(param_4 + 1) = auVar9;
  *param_4 = -1;
LAB_14005e2f9:
  func_0x0001400469b0();
  return param_4;
}

