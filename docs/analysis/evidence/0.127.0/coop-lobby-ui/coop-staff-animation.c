
/* WARNING: Removing unreachable block (ram,0x0001402e4128) */
/* WARNING: Removing unreachable block (ram,0x0001402e4130) */
/* WARNING: Removing unreachable block (ram,0x0001402e4141) */
/* WARNING: Removing unreachable block (ram,0x0001402e4341) */
/* WARNING: Removing unreachable block (ram,0x0001402e4346) */
/* WARNING: Removing unreachable block (ram,0x0001402e434c) */
/* WARNING: Removing unreachable block (ram,0x0001402e434e) */
/* WARNING: Heritage AFTER dead removal. Example location: s0xfffffffffffffe50 : 0x0001402e3fca */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* WARNING: Restarted to delay deadcode elimination for space: stack */

void entry(undefined8 param_1,undefined8 param_2,undefined8 *param_3,undefined8 param_4,
          long *param_5,undefined8 *param_6)

{
  byte *pbVar1;
  byte bVar2;
  int iVar3;
  undefined4 *puVar4;
  code *pcVar5;
  long *plVar6;
  byte bVar7;
  uint *puVar8;
  ulong uVar9;
  byte bVar10;
  uint uVar11;
  ulong uVar12;
  undefined4 uVar13;
  long extraout_RDX;
  long lVar14;
  long lVar15;
  byte *pbVar16;
  long lVar17;
  ulong uVar18;
  ulong uVar19;
  long lVar20;
  char cVar21;
  uint *puVar22;
  ulong uVar23;
  ulong *puVar24;
  long lVar25;
  long lVar26;
  uint uVar27;
  long lVar28;
  bool bVar29;
  undefined8 uVar30;
  undefined8 *in_stack_00000028;
  undefined8 *in_stack_00000030;
  undefined8 local_1b8;
  byte *local_1b0;
  ulong local_1a8;
  long local_d8;
  long *local_d0;
  long local_c8;
  long local_c0;
  long local_b8;
  long local_b0;
  long local_a8;
  undefined8 local_a0;
  undefined8 local_98;
  undefined4 local_90;
  undefined3 uStack_8c;
  long local_88;
  ulong *local_80;
  undefined4 *local_78;
  byte *local_70;
  long local_68;
  undefined4 local_5c;
  ulong local_58;
  undefined4 local_50;
  undefined1 local_49;
  undefined8 local_48;
  
  local_48 = 0xfffffffffffffffe;
  local_68 = *param_5;
  if (*(long *)(local_68 + 0x50) == 0) {
LAB_1402e374a:
    local_50 = 0;
    local_80 = (ulong *)*param_3;
    lVar20 = param_3[1];
    cVar21 = *(char *)(local_68 + 0x1b4);
  }
  else {
    puVar8 = *(uint **)(local_68 + 0x18);
    lVar20 = *(long *)(local_68 + 0x20);
    if (lVar20 == 4) {
      bVar29 = *puVar8 == 0x7466656c;
LAB_1402e3784:
      local_50 = (undefined4)CONCAT71((int7)((ulong)puVar8 >> 8),bVar29);
    }
    else {
      if (lVar20 == 6) {
        uVar27 = (ushort)puVar8[1] ^ 0x6465 | *puVar8 ^ 0x6e696f6a;
        puVar8 = (uint *)(ulong)uVar27;
        bVar29 = uVar27 == 0;
        goto LAB_1402e3784;
      }
      if (lVar20 != 7) goto LAB_1402e374a;
      if (*(int *)((long)puVar8 + 3) != 0x676e6974 || *puVar8 != 0x74736f68) {
        bVar29 = *(int *)((long)puVar8 + 3) == 0x676e696e && *puVar8 == 0x6e696f6a;
        goto LAB_1402e3784;
      }
      local_50 = (undefined4)CONCAT71((int7)((ulong)puVar8 >> 8),1);
    }
    local_80 = (ulong *)*param_3;
    lVar20 = param_3[1];
    cVar21 = *(char *)(local_68 + 0x1b4);
  }
  if (cVar21 == '\0') {
LAB_1402e3985:
    *local_80 = *(ulong *)(lVar20 + 0x40);
    return;
  }
  local_78 = (undefined4 *)param_5[2];
  local_5c = *(undefined4 *)((long)param_5 + 0x1c);
  local_98 = *in_stack_00000028;
  puVar4 = (undefined4 *)*in_stack_00000030;
  lVar26 = in_stack_00000030[4];
  lVar15 = in_stack_00000030[5];
  if (*(char *)(local_68 + 0x1ba) == '\0') {
    cVar21 = '\x06';
    if ((char)local_50 == '\0') goto LAB_1402e3985;
  }
  else {
    cVar21 = '\x06';
    if ((char)local_50 == '\0') {
      cVar21 = *(char *)(local_68 + 0x1ba);
    }
  }
  local_a0 = *param_6;
  *(undefined4 *)in_stack_00000030[2] = *(undefined4 *)((long)in_stack_00000030 + 0x1c);
  puVar22 = *(uint **)(lVar26 + 0xf8);
  puVar8 = puVar22 + *(long *)(lVar26 + 0x100);
  if (*(char *)(lVar26 + 0x108) == '\0') {
    lVar28 = 8;
    lVar17 = 0;
    uVar27 = 0;
    lVar14 = 0;
    local_88 = 0;
    lVar25 = 0;
    do {
      if (uVar27 == (uint)lVar14) {
        do {
          if (puVar22 == puVar8) goto LAB_1402e3b44;
          uVar27 = *puVar22;
          puVar22 = puVar22 + 1;
          lVar14 = *(long *)(*(long *)(lVar15 + 0x108) + 0x58 + (ulong)uVar27 * 0xa0);
        } while (lVar14 == 0);
        lVar28 = *(long *)(lVar15 + 0x108) + (ulong)uVar27 * 0xa0;
        uVar18 = (ulong)*(uint *)(lVar28 + 0x94);
        lVar17 = *(long *)(lVar15 + 0x1a8) + uVar18 * 0x48;
        uVar18 = *(ulong *)(*(long *)(lVar15 + 0x1a8) + 0x40 + uVar18 * 0x48);
        if ((*(ulong *)(lVar26 + 0x110) < uVar18) &&
           (uVar9 = *(ulong *)(*(long *)(lVar17 + 0x38) + *(ulong *)(lVar26 + 0x110) * 8),
           uVar9 != 0)) {
          lVar25 = *(long *)(*(long *)(lVar17 + 0x18) + 0x10 + ~uVar9 * 0x30);
          uVar9 = *(ulong *)(lVar26 + 0x118);
          if (uVar18 <= uVar9) goto LAB_1402e3a88;
LAB_1402e3a51:
          uVar9 = *(ulong *)(*(long *)(lVar17 + 0x38) + uVar9 * 8);
          if (uVar9 == 0) goto LAB_1402e3a88;
          local_88 = *(long *)(*(long *)(lVar17 + 0x18) + 0x10 + ~uVar9 * 0x30);
          uVar9 = *(ulong *)(lVar26 + 0x120);
          if (uVar9 < uVar18) goto LAB_1402e3a9e;
LAB_1402e3ac1:
          lVar17 = 0;
        }
        else {
          lVar25 = 0;
          uVar9 = *(ulong *)(lVar26 + 0x118);
          if (uVar9 < uVar18) goto LAB_1402e3a51;
LAB_1402e3a88:
          uVar9 = *(ulong *)(lVar26 + 0x120);
          local_88 = 0;
          if (uVar18 <= uVar9) goto LAB_1402e3ac1;
LAB_1402e3a9e:
          uVar18 = *(ulong *)(*(long *)(lVar17 + 0x38) + uVar9 * 8);
          if (uVar18 == 0) goto LAB_1402e3ac1;
          lVar17 = *(long *)(*(long *)(lVar17 + 0x18) + 0x10 + ~uVar18 * 0x30);
        }
        lVar28 = *(long *)(lVar28 + 0x50);
        uVar27 = 0;
      }
      uVar18 = (ulong)uVar27;
      uVar27 = uVar27 + 1;
      uVar18 = (ulong)~*(uint *)(lVar28 + 8 + uVar18 * 0x10);
    } while ((*(char *)(lVar25 + uVar18 * 0x10) != '\a') ||
            (*(char *)(uVar18 * 0x10 + lVar25 + 1) != cVar21));
    local_88 = local_88 + uVar18 * 0x68;
    lVar17 = lVar17 + uVar18 * 0x20;
  }
  else {
    lVar17 = 0;
    uVar27 = 0;
    lVar14 = 0;
    local_88 = 0;
    lVar25 = 0;
    do {
      if (uVar27 == (uint)lVar14) {
        do {
          if (puVar22 == puVar8) goto LAB_1402e3b44;
          uVar27 = *puVar22;
          puVar22 = puVar22 + 1;
          lVar14 = *(long *)(*(long *)(lVar15 + 0x1a8) + 0x10 + (ulong)uVar27 * 0x48);
        } while (lVar14 == 0);
        lVar17 = *(long *)(lVar15 + 0x1a8) + (ulong)uVar27 * 0x48;
        uVar18 = *(ulong *)(lVar17 + 0x40);
        if ((*(ulong *)(lVar26 + 0x110) < uVar18) &&
           (uVar9 = *(ulong *)(*(long *)(lVar17 + 0x38) + *(ulong *)(lVar26 + 0x110) * 8),
           uVar9 != 0)) {
          lVar25 = *(long *)(*(long *)(lVar17 + 0x18) + 0x10 + ~uVar9 * 0x30);
          uVar9 = *(ulong *)(lVar26 + 0x118);
          if (uVar18 <= uVar9) goto LAB_1402e3916;
LAB_1402e38e7:
          uVar9 = *(ulong *)(*(long *)(lVar17 + 0x38) + uVar9 * 8);
          if (uVar9 == 0) goto LAB_1402e3916;
          local_88 = *(long *)(*(long *)(lVar17 + 0x18) + 0x10 + ~uVar9 * 0x30);
          uVar9 = *(ulong *)(lVar26 + 0x120);
          if (uVar9 < uVar18) goto LAB_1402e3925;
LAB_1402e3948:
          lVar17 = 0;
        }
        else {
          lVar25 = 0;
          uVar9 = *(ulong *)(lVar26 + 0x118);
          if (uVar9 < uVar18) goto LAB_1402e38e7;
LAB_1402e3916:
          local_88 = 0;
          uVar9 = *(ulong *)(lVar26 + 0x120);
          if (uVar18 <= uVar9) goto LAB_1402e3948;
LAB_1402e3925:
          uVar18 = *(ulong *)(*(long *)(lVar17 + 0x38) + uVar9 * 8);
          if (uVar18 == 0) goto LAB_1402e3948;
          lVar17 = *(long *)(*(long *)(lVar17 + 0x18) + 0x10 + ~uVar18 * 0x30);
        }
        uVar27 = 0;
      }
      uVar18 = (ulong)uVar27;
      uVar27 = uVar27 + 1;
    } while ((*(char *)(lVar25 + uVar18 * 0x10) != '\a') ||
            (*(char *)(uVar18 * 0x10 + lVar25 + 1) != cVar21));
    local_88 = local_88 + uVar18 * 0x68;
    lVar17 = lVar17 + uVar18 * 0x20;
  }
  uVar30 = CONCAT44(*(float *)(local_88 + 100) *
                    ((float)((ulong)*(undefined8 *)(lVar17 + 0x10) >> 0x20) +
                    (float)((ulong)*(undefined8 *)(local_88 + 0x30) >> 0x20) * fRam000000014625b864)
                    ,*(float *)(local_88 + 100) *
                     ((float)*(undefined8 *)(lVar17 + 0x10) -
                     (float)*(undefined8 *)(local_88 + 0x30) * _DAT_14625b860));
  *(undefined1 *)(puVar4 + 6) = 1;
  uVar13 = 1;
LAB_1402e3b4f:
  *puVar4 = uVar13;
  *(undefined8 *)(puVar4 + 1) = uVar30;
  uVar18 = *local_80;
  uVar23 = 0;
  uVar9 = uVar18 - *(ulong *)(lVar20 + 0x18);
  if (uVar18 < *(ulong *)(lVar20 + 0x18)) {
    uVar9 = uVar23;
  }
  uVar12 = uVar18 - *(ulong *)(lVar20 + 0x38);
  if (uVar18 < *(ulong *)(lVar20 + 0x38)) {
    uVar12 = uVar23;
  }
  lVar26 = uVar9 * 0x58 + *(long *)(lVar20 + 8);
  uVar18 = *(ulong *)(lVar20 + 0x10);
  uVar19 = uVar18 - uVar9;
  if (uVar18 < uVar9) {
    uVar19 = uVar23;
  }
  if (uVar18 < uVar9) {
    lVar26 = 8;
  }
  lVar15 = uVar12 * 0x58 + *(long *)(lVar20 + 0x28);
  uVar18 = *(ulong *)(lVar20 + 0x30) - uVar12;
  if (*(ulong *)(lVar20 + 0x30) < uVar12) {
    lVar15 = 8;
    uVar18 = uVar23;
  }
  *local_80 = (*(long *)(lVar20 + 0x40) - uVar18) - uVar19;
  local_88 = uVar19 * 0x58 + lVar26;
  local_d8 = uVar18 * 0x58 + lVar15;
  local_c8 = local_68 + 0x130;
  local_c0 = local_68 + 0x118;
  local_b8 = local_68 + 0xe8;
  local_b0 = local_68 + 0x100;
  local_a8 = local_68 + 0xd0;
  local_d0 = (long *)(local_68 + 0x160);
  uVar18 = 0;
  puVar24 = local_80;
  do {
    do {
      while( true ) {
        while( true ) {
          do {
            plVar6 = local_d0;
            if ((lVar26 == 0) || (lVar26 == local_88)) {
              if ((lVar15 == 0) || (lVar15 == local_d8)) {
                if ((uVar18 & 1) == 0) {
                  return;
                }
                *local_78 = local_5c;
                *(long *)(local_68 + 0x1a8) = *(long *)(local_68 + 0x1a8) + 1;
                return;
              }
              *puVar24 = *puVar24 + 1;
              cVar21 = *(char *)(lVar15 + 0x54);
              lVar17 = lVar15 + 0x58;
              lVar14 = 0;
              lVar20 = lVar15;
            }
            else {
              *puVar24 = *puVar24 + 1;
              cVar21 = *(char *)(lVar26 + 0x54);
              lVar17 = lVar15;
              lVar14 = lVar26 + 0x58;
              lVar20 = lVar26;
            }
            lVar26 = lVar14;
            lVar15 = lVar17;
          } while (cVar21 != '\0');
          if ((char)local_50 == '\0') {
                    /* WARNING: Could not emulate address calculation at 0x0001402e3cff */
                    /* WARNING: Treating indirect jump as call */
            (*(code *)((long)*(int *)((ulong)*(byte *)(local_68 + 0x1ba) * 4 + 0x14627aa74) +
                      0x14627aa74))();
            return;
          }
          iVar3 = *(int *)(lVar20 + 8);
          *local_78 = local_5c;
          if (iVar3 != 0x11) break;
          local_58 = *(ulong *)(local_68 + 0x160);
          local_70 = *(byte **)(local_68 + 0x168);
          uVar18 = *(ulong *)(local_68 + 0x170);
          *(undefined8 *)(local_68 + 0x160) = 0;
          *(undefined8 *)(local_68 + 0x168) = 1;
          *(undefined8 *)(local_68 + 0x170) = 0;
          local_49 = 0;
          func_0x000140207170();
          if (extraout_RDX == 0) {
            uVar18 = 1;
            if (local_58 != 0) {
              func_0x0001400021d0();
            }
          }
          else {
            local_1b8 = local_58;
            local_1b0 = local_70;
            local_49 = 1;
            local_1a8 = uVar18;
            func_0x000140246550();
            uVar18 = 1;
          }
        }
        local_58 = 0xa0;
        uVar27 = *(uint *)(lVar20 + 8);
        puVar24 = local_80;
        if (uVar27 == 1) break;
        if (uVar27 < 0x1d) {
                    /* WARNING: Could not emulate address calculation at 0x0001402e3dcb */
                    /* WARNING: Treating indirect jump as call */
          (*(code *)((long)*(int *)((ulong)uVar27 * 4 + 0x14627aa90) + 0x14627aa90))();
          return;
        }
      }
      bVar2 = *(byte *)(lVar20 + 0x28);
    } while (bVar2 == 0xff);
    if (bVar2 == 0x19) {
      pbVar16 = *(byte **)(lVar20 + 0x30);
      LOCK();
      lVar17 = *(long *)pbVar16;
      *(long *)pbVar16 = *(long *)pbVar16 + 1;
      UNLOCK();
      if (*(long *)pbVar16 == 0 || SCARRY8(lVar17,1) != *(long *)pbVar16 < 0) goto LAB_1402e43ea;
    }
    else {
      uStack_8c = (undefined3)((uint)*(undefined4 *)(lVar20 + 0x2c) >> 8);
      local_90 = *(undefined4 *)(lVar20 + 0x29);
      pbVar16 = *(byte **)(lVar20 + 0x30);
    }
    uVar18 = *(ulong *)(lVar20 + 0x38);
    local_1b8 = CONCAT71(CONCAT34(uStack_8c,local_90),bVar2);
    local_1b0 = pbVar16;
    local_1a8 = uVar18;
    lVar20 = (ulong)bVar2 - 0x17;
    if (bVar2 < 0x18) {
      lVar20 = 0;
    }
    if (lVar20 == 0) {
      if (0x17 < bVar2) {
        func_0x000146208f10();
LAB_1402e43ea:
                    /* WARNING: Does not return */
        pcVar5 = (code *)invalidInstructionException();
        (*pcVar5)();
      }
      pbVar16 = (byte *)((long)&local_1b8 + 1);
      uVar18 = (ulong)bVar2;
    }
    else if ((int)lVar20 != 1) {
      pbVar16 = pbVar16 + 0x10;
    }
    local_70 = pbVar16 + uVar18;
    while (puVar24 = local_80, pbVar16 != local_70) {
      bVar2 = *pbVar16;
      uVar27 = (uint)bVar2;
      if ((char)bVar2 < '\0') {
        uVar11 = bVar2 & 0x1f;
        pbVar1 = pbVar16 + 1;
        if (bVar2 < 0xe0) {
          pbVar16 = pbVar16 + 2;
          uVar27 = uVar11 << 6 | *pbVar1 & 0x3f;
        }
        else {
          uVar27 = pbVar16[2] & 0x3f | (*pbVar1 & 0x3f) << 6;
          if (bVar2 < 0xf0) {
            pbVar16 = pbVar16 + 3;
            uVar27 = uVar27 | uVar11 << 0xc;
          }
          else {
            pbVar1 = pbVar16 + 3;
            pbVar16 = pbVar16 + 4;
            uVar27 = *pbVar1 & 0x3f | uVar27 << 6 | (bVar2 & 7) << 0x12;
          }
        }
      }
      else {
        pbVar16 = pbVar16 + 1;
      }
      if (0x20 < uVar27 - 0x7f && 0x1f < uVar27) {
        uVar18 = (ulong)uVar27;
        if ((ulong)plVar6[2] < 0x20) {
          uVar9 = func_0x00014603cbd0();
        }
        else {
          uVar9 = func_0x00014603c5b0();
        }
        if (uVar9 < local_58) {
          uVar27 = (uint)uVar18;
          lVar20 = plVar6[2];
          if (uVar27 < 0x80) {
            if (*plVar6 == lVar20) {
              func_0x000146061b30();
            }
            *(char *)(plVar6[1] + lVar20) = (char)uVar18;
            lVar17 = 1;
          }
          else {
            uVar9 = 4 - (ulong)(uVar27 < 0x10000);
            if (uVar27 < 0x800) {
              uVar9 = 2;
            }
            if ((ulong)(*plVar6 - lVar20) < uVar9) {
              func_0x000146061b30();
            }
            uVar27 = (uint)uVar18;
            bVar7 = (byte)uVar18 & 0x3f | 0x80;
            bVar2 = (byte)(uVar18 >> 6);
            lVar17 = plVar6[1];
            if (uVar27 < 0x800) {
              *(byte *)(lVar17 + lVar20) = bVar2 | 0xc0;
              *(byte *)(lVar17 + 1 + lVar20) = bVar7;
              lVar17 = 2;
            }
            else {
              bVar10 = bVar2 & 0x3f | 0x80;
              bVar2 = (byte)(uVar18 >> 0xc);
              if (uVar27 < 0x10000) {
                *(byte *)(lVar17 + lVar20) = bVar2 | 0xe0;
                *(byte *)(lVar17 + 1 + lVar20) = bVar10;
                *(byte *)(lVar17 + 2 + lVar20) = bVar7;
                lVar17 = 3;
              }
              else {
                *(byte *)(lVar17 + lVar20) = (byte)(uVar27 >> 0x12) | 0xf0;
                *(byte *)(lVar17 + 1 + lVar20) = bVar2 & 0x3f | 0x80;
                *(byte *)(lVar17 + 2 + lVar20) = bVar10;
                *(byte *)(lVar17 + 3 + lVar20) = bVar7;
                lVar17 = 4;
              }
            }
          }
          plVar6[2] = lVar20 + lVar17;
        }
      }
    }
    if (0x18 < (byte)local_1b8) {
      LOCK();
      *(long *)local_1b0 = *(long *)local_1b0 + -1;
      UNLOCK();
      if (*(long *)local_1b0 == 0) {
        func_0x00014267f1e0();
      }
    }
    uVar18 = 1;
  } while( true );
LAB_1402e3b44:
  *(undefined1 *)(puVar4 + 6) = 1;
  uVar13 = *puVar4;
  uVar30 = *(undefined8 *)(puVar4 + 1);
  goto LAB_1402e3b4f;
}

