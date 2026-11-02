
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,long param_4)

{
  long *plVar1;
  undefined8 *puVar2;
  undefined1 uVar3;
  int iVar4;
  int iVar5;
  code *pcVar6;
  uint uVar7;
  long lVar8;
  long lVar9;
  ulong uVar10;
  ulong uVar11;
  long *plVar12;
  long lVar13;
  long *plVar14;
  ulong uVar15;
  uint uVar16;
  float fVar17;
  undefined4 in_XMM6_Da;
  undefined4 in_XMM7_Da;
  undefined4 uVar18;
  undefined4 uVar19;
  undefined4 uVar20;
  undefined4 uVar21;
  undefined4 uVar22;
  undefined4 uVar23;
  undefined4 uVar24;
  undefined4 uVar25;
  int iStack_138;
  long local_120;
  long *local_118;
  ulong local_110;
  long **local_108;
  long local_100;
  long local_f8;
  undefined4 *puStack_f0;
  undefined8 local_e8;
  undefined8 uStack_e0;
  long *local_d8;
  undefined4 local_cc;
  long local_c8;
  long *local_c0;
  undefined1 local_b1;
  undefined8 local_b0;
  undefined4 local_a8;
  undefined4 local_98;
  
  local_b0 = 0xfffffffffffffffe;
  if (4 < *(uint *)(param_4 + 2000)) {
    fVar17 = _DAT_1459eb2d0;
    if (*(long *)(param_4 + 0x730) != 0) {
      lVar13 = *(long *)(param_4 + 0x728);
      lVar8 = 0;
      do {
        if ((*(long *)(lVar13 + 8 + lVar8) == 9) &&
           ((char)(*(long **)(lVar13 + lVar8))[1] == 'e' &&
            **(long **)(lVar13 + lVar8) == 0x7461665f6c616573)) {
          fVar17 = *(float *)(lVar13 + 0x10 + lVar8);
          break;
        }
        lVar8 = lVar8 + 0x18;
      } while (*(long *)(param_4 + 0x730) * 0x18 != lVar8);
    }
    if ((fVar17 <= *(float *)(param_4 + 0x8e4)) && (*(long *)(param_4 + 0x2a0) != 0)) {
      lVar13 = *(long *)(param_4 + 0x298);
      lVar8 = 0;
      do {
        plVar14 = *(long **)(lVar13 + lVar8);
        if ((plVar14[1] == 9) &&
           ((char)((long *)*plVar14)[1] == 'e' && *(long *)*plVar14 == 0x7461665f6c616573)) {
          iVar4 = *(int *)(lVar13 + 0x18 + lVar8);
          iStack_138 = (int)*(undefined8 *)(lVar13 + lVar8 + 0x40);
          iVar5 = *(int *)(param_4 + 0x48c);
          puStack_f0 = (undefined4 *)CONCAT44(puStack_f0._4_4_,*(undefined4 *)(param_4 + 0x3f0));
          local_f8 = *(long *)(param_4 + 1000);
          local_a8 = in_XMM6_Da;
          local_98 = in_XMM7_Da;
          func_0x0001454ee0d0(param_1,param_4,param_4,&local_120,&local_f8);
          if (local_110 == 0) {
            if (local_120 == 0) {
              return;
            }
            local_c0 = local_118;
          }
          else {
            local_c0 = local_118;
            local_cc = *(undefined4 *)(param_4 + 0x8e4);
            puStack_f0 = &local_cc;
            local_108 = &local_d8;
            local_f8 = param_4;
            local_d8 = &local_f8;
            if (local_110 != 1) {
              if (local_110 < 0x15) {
                lVar13 = 8;
                do {
                  func_0x0001454f1030();
                  lVar13 = lVar13 + 8;
                } while (local_110 * 8 - lVar13 != 0);
              }
              else {
                local_b1 = 1;
                func_0x00014553a210();
              }
            }
            uVar16 = iVar5 + iVar4 + *(int *)((long)plVar14 + 0x54) + iStack_138;
            if (*(int *)((long)plVar14 + 0x54) == 0) {
              uVar16 = 0;
            }
            uVar7 = 3;
            if (uVar16 < 3) {
              uVar7 = uVar16;
            }
            uVar11 = 1;
            if (uVar16 != 0) {
              uVar11 = (ulong)uVar7;
            }
            uVar10 = local_110;
            if (uVar11 <= local_110) {
              uVar10 = uVar11;
            }
            *(undefined4 *)(param_4 + 2000) = 0;
            local_b1 = 1;
            func_0x0001454d49e0();
            if ((int)uVar11 == 0) {
              local_b1 = 1;
              func_0x0001458e75b3();
                    /* WARNING: Does not return */
              pcVar6 = (code *)invalidInstructionException();
              (*pcVar6)();
            }
            local_100 = *local_c0;
            local_108 = (long **)((ulong)local_108 & 0xffffffff00000000);
            local_d8 = (long *)((ulong)local_d8 & 0xffffffff00000000);
            local_b1 = 1;
            func_0x00014544b1a0();
            lVar13 = *(long *)(param_4 + 0x548);
            if (lVar13 == *(long *)(param_4 + 0x538)) {
              func_0x0001457580b0();
            }
            lVar8 = *(long *)(param_4 + 0x540);
            puVar2 = (undefined8 *)(lVar8 + 0x10 + lVar13 * 0x20);
            *puVar2 = local_e8;
            puVar2[1] = uStack_e0;
            plVar14 = (long *)(lVar8 + lVar13 * 0x20);
            *plVar14 = local_f8;
            plVar14[1] = (long)puStack_f0;
            *(long *)(param_4 + 0x548) = lVar13 + 1;
            local_c8 = local_120;
            plVar14 = local_c0 + uVar10;
            plVar12 = local_c0;
            do {
              lVar8 = *plVar12;
              plVar12 = plVar12 + 1;
              lVar13 = *(long *)(param_4 + 0x4c8);
              lVar9 = 0;
              do {
                if (*(long *)(param_4 + 0x4d0) * 0x160 - lVar9 == 0) break;
                lVar9 = lVar9 + 0x160;
                plVar1 = (long *)(lVar13 + 0x88);
                lVar13 = lVar13 + 0x160;
              } while (*plVar1 != lVar8);
              uVar11 = *(ulong *)(param_4 + 0x888);
              uVar15 = *(ulong *)(param_4 + 0x890) ^ *(ulong *)(param_4 + 0x880);
              uVar10 = *(ulong *)(param_4 + 0x898) ^ uVar11;
              *(ulong *)(param_4 + 0x888) = uVar11 ^ uVar15;
              *(ulong *)(param_4 + 0x880) = *(ulong *)(param_4 + 0x880) ^ uVar10;
              *(ulong *)(param_4 + 0x890) = uVar15 ^ uVar11 << 0x11;
              *(ulong *)(param_4 + 0x898) = uVar10 << 0x2d | uVar10 >> 0x13;
              uVar3 = *(undefined1 *)(param_4 + 0x111);
              *(undefined1 *)(param_4 + 0x111) = 3;
              uVar18 = *(undefined4 *)(param_4 + 0x20);
              uVar19 = *(undefined4 *)(param_4 + 0x24);
              uVar20 = *(undefined4 *)(param_4 + 0x28);
              uVar21 = *(undefined4 *)(param_4 + 0x2c);
              uVar22 = *(undefined4 *)(param_4 + 0x40);
              uVar23 = *(undefined4 *)(param_4 + 0x44);
              uVar24 = *(undefined4 *)(param_4 + 0x48);
              uVar25 = *(undefined4 *)(param_4 + 0x4c);
              *(undefined8 *)(param_4 + 0x20) = 0;
              *(undefined8 *)(param_4 + 0x40) = 0;
              func_0x0001454c2eb0();
              *(undefined1 *)(param_4 + 0x111) = uVar3;
              *(undefined4 *)(param_4 + 0x20) = uVar18;
              *(undefined4 *)(param_4 + 0x24) = uVar19;
              *(undefined4 *)(param_4 + 0x28) = uVar20;
              *(undefined4 *)(param_4 + 0x2c) = uVar21;
              *(undefined4 *)(param_4 + 0x40) = uVar22;
              *(undefined4 *)(param_4 + 0x44) = uVar23;
              *(undefined4 *)(param_4 + 0x48) = uVar24;
              *(undefined4 *)(param_4 + 0x4c) = uVar25;
            } while (plVar12 != plVar14);
            if (local_c8 == 0) {
              return;
            }
          }
          func_0x0001400021d0();
          return;
        }
        lVar8 = lVar8 + 0x58;
      } while (*(long *)(param_4 + 0x2a0) * 0x58 - lVar8 != 0);
    }
  }
  return;
}

