
void entry(undefined4 param_1,undefined8 param_2,undefined8 param_3,undefined8 param_4,long param_5,
          long param_6,undefined8 *param_7)

{
  undefined4 *puVar1;
  byte bVar2;
  long *plVar3;
  code *pcVar4;
  char cVar5;
  int iVar6;
  long lVar7;
  long *plVar8;
  undefined8 *puVar9;
  long lVar10;
  long lVar11;
  undefined8 uVar12;
  long lVar13;
  ulong uVar14;
  ulong uVar15;
  long lVar16;
  undefined4 in_XMM6_Da;
  undefined4 in_XMM7_Da;
  undefined1 auVar17 [16];
  undefined4 local_190;
  undefined4 uStack_18c;
  undefined4 uStack_188;
  undefined4 uStack_184;
  undefined8 local_180;
  long local_170;
  undefined4 local_168;
  undefined4 uStack_164;
  undefined4 uStack_160;
  undefined4 uStack_15c;
  long local_158;
  long local_150;
  long *local_148;
  long *plStack_140;
  long *local_138;
  undefined8 local_108;
  undefined8 uStack_100;
  long local_f8 [3];
  undefined8 local_e0;
  undefined4 local_d8;
  undefined4 local_c8;

  local_e0 = 0xfffffffffffffffe;
  plVar3 = (long *)*param_7;
  lVar7 = param_7[1];
  if (param_6 != param_5) {
    lVar11 = param_7[2];
    uVar14 = (ulong)(param_5 - param_6) >> 6;
    uVar12 = 2;
    lVar10 = 0x146719a68;
    uVar15 = 0;
    local_158 = lVar11;
    local_150 = param_6;
    local_d8 = in_XMM6_Da;
    local_c8 = in_XMM7_Da;
    do {
      lVar13 = param_6 + uVar15 * 0x40;
      bVar2 = *(byte *)(param_6 + uVar15 * 0x40);
      cVar5 = bVar2 - 0x1e;
      if (bVar2 < 0x1e) {
        cVar5 = (char)uVar12;
      }
      if (cVar5 != '\0') {
        if (cVar5 != '\x01') {
          func_0x000140002200();
          plVar8 = (long *)func_0x0001400021c0();
          if (plVar8 == (long *)0x0) {
            func_0x0001458e721b();
          }
          else {
            local_108 = (long *)0x1;
            local_f8[0] = 0;
            local_148 = local_f8;
            plStack_140 = (long *)0x0;
            local_138 = plVar8;
            uStack_100 = plVar8;
            func_0x00014551d7a0();
            plVar8 = uStack_100;
            local_148 = local_108;
            plStack_140 = uStack_100;
            local_138 = (long *)local_f8[0];
            if (local_f8[0] != 0) {
              lVar13 = *uStack_100;
              local_108 = (long *)uStack_100[1];
              uStack_100 = (long *)uStack_100[2];
              lVar16 = local_f8[0] + -1;
              func_0x000145756dd1();
              local_138 = (long *)lVar16;
              if (lVar13 != -1) {
                local_168 = (undefined4)local_108;
                uStack_164 = local_108._4_4_;
                uStack_160 = (undefined4)uStack_100;
                uStack_15c = uStack_100._4_4_;
                local_170 = lVar13;
                if (lVar16 != 0) {
                  plVar8 = plVar8 + 1;
                  do {
                    if (plVar8[-1] != 0) {
                      func_0x0001400021d0();
                    }
                    plVar8 = plVar8 + 3;
                    lVar16 = lVar16 + -1;
                  } while (lVar16 != 0);
                }
                if (local_148 != (long *)0x0) {
                  func_0x0001400021d0();
                }
                local_148 = &local_170;
                plStack_140 = (long *)0x1400020e0;
                func_0x00014570bf80();
                uVar12 = 2;
                param_6 = local_150;
                if (local_170 != 0) {
                  func_0x0001400021d0();
                  param_6 = local_150;
                }
                goto LAB_145519455;
              }
            }
            func_0x0001458e72eb();
          }
          goto LAB_14551b187;
        }
        uVar15 = (ulong)*(byte *)(lVar13 + 0x24);
        if (*(char *)(lVar13 + 8) == '\x01') {
          local_108 = *(long **)(lVar13 + 0x10);
          plVar3 = *(long **)(lVar13 + 0x18);
          lVar7 = 0;
          uStack_100 = plVar3;
          goto LAB_145519501;
        }
        func_0x000140002200();
        puVar9 = (undefined8 *)func_0x0001400021c0();
        if (puVar9 != (undefined8 *)0x0) {
          *puVar9 = 0x6570732072756f79;
          *(undefined4 *)((long)puVar9 + 7) = 0x736c6c65;
                    /* WARNING: Could not emulate address calculation at 0x0001455197e5 */
                    /* WARNING: Treating indirect jump as call */
          (*(code *)((long)*(int *)(uVar15 * 4 + 0x146cea280) + 0x146cea280))();
          return;
        }
        func_0x0001458e721b();
        goto LAB_14551b187;
      }
      func_0x0001454175c0(param_1,param_2,*(undefined4 *)(lVar13 + 4));
LAB_145519455:
      *(undefined8 *)(lVar11 + 0x10 + lVar7 * 0x18) = local_180;
      puVar1 = (undefined4 *)(lVar11 + lVar7 * 0x18);
      *puVar1 = local_190;
      puVar1[1] = uStack_18c;
      puVar1[2] = uStack_188;
      puVar1[3] = uStack_184;
      lVar7 = lVar7 + 1;
      uVar15 = uVar15 + 1;
      param_1 = local_190;
    } while (uVar15 != uVar14);
  }
  *plVar3 = lVar7;
  return;
LAB_145519501:
  if ((*(long **)(lVar7 + 8 + lVar10) == plVar3) && (iVar6 = func_0x000145756dd7(), iVar6 == 0)) {
    local_108 = (long *)(lVar10 + lVar7);
    uStack_100 = (long *)0x1400020c0;
    func_0x00014570bf80();
    lVar7 = *(long *)(lVar7 + 0x18 + lVar10);
    auVar17 = func_0x000145452400(uVar14);
    lVar11 = auVar17._8_8_;
    if (local_148 != (long *)0x0) {
      func_0x0001400021d0();
    }
    if (auVar17._0_8_ == 0) {
      lVar11 = lVar7;
    }
    if (-1 < lVar11) {
      if (lVar11 == 0) {
                    /* WARNING: Could not recover jumptable at 0x0001455199de. Too many branches */
                    /* WARNING: Treating indirect jump as call */
        (*(code *)((long)*(int *)(uVar15 * 4 + 0x146cea29c) + 0x146cea29c))(2);
        return;
      }
      func_0x000140002200();
      lVar7 = func_0x0001400021c0();
      if (lVar7 != 0) {
        func_0x000145756ddd();
                    /* WARNING: Could not recover jumptable at 0x0001455195f8. Too many branches */
                    /* WARNING: Treating indirect jump as call */
        (*(code *)((long)*(int *)(uVar15 * 4 + 0x146cea29c) + 0x146cea29c))(2);
        return;
      }
    }
    func_0x0001458e721b();
    goto LAB_14551b187;
  }
  lVar7 = lVar7 + 0x78;
  if (lVar7 == 0x3480) {
    local_148 = &local_108;
    plStack_140 = (long *)0x1400020c0;
    func_0x0001458e7790();
LAB_14551b187:
                    /* WARNING: Does not return */
    pcVar4 = (code *)invalidInstructionException();
    (*pcVar4)();
  }
  goto LAB_145519501;
}
