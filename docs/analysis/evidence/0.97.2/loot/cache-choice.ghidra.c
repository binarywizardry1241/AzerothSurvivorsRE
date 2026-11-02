
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(float param_1,undefined8 param_2,float param_3,undefined8 param_4,undefined8 param_5,
          long param_6,ulong *param_7)

{
  byte bVar1;
  long lVar2;
  undefined1 auVar3 [16];
  undefined1 auVar4 [16];
  code *pcVar5;
  long lVar6;
  long lVar7;
  long lVar8;
  long lVar9;
  long lVar10;
  long lVar11;
  long lVar12;
  long lVar13;
  int iVar14;
  uint uVar15;
  long *plVar16;
  float *pfVar17;
  ulong uVar18;
  uint uVar19;
  long lVar20;
  long lVar21;
  long *plVar22;
  ulong uVar23;
  long lVar24;
  ulong uVar25;
  long lVar26;
  ulong uVar27;
  long *plVar28;
  ulong uVar29;
  ulong uVar30;
  long *plVar31;
  long lVar32;
  long *plVar33;
  float extraout_XMM0_Da;
  float extraout_XMM0_Da_00;
  float fVar34;
  float fVar35;
  float fVar36;
  undefined4 in_XMM6_Da;
  float fVar37;
  float fVar38;
  undefined4 in_XMM7_Da;
  float fVar39;
  float fVar40;
  float fVar41;
  undefined4 uVar42;
  float fVar43;
  float fVar44;
  float fVar45;
  float fVar46;
  undefined4 uVar47;
  undefined4 uVar48;
  undefined4 uVar49;
  long local_280;
  undefined8 local_278;
  undefined8 uStack_270;
  undefined8 local_268;
  undefined8 uStack_260;
  undefined8 local_258;
  undefined8 uStack_250;
  undefined8 local_248;
  undefined8 uStack_240;
  ulong local_238;
  float *pfStack_230;
  undefined8 local_228;
  undefined8 uStack_220;
  long local_218;
  long lStack_210;
  uint local_1d4;
  long *local_1d0;
  long *plStack_1c8;
  long *local_1c0;
  long *local_1b8;
  long *local_1b0;
  ulong local_1a8;
  ulong local_1a0;
  ulong uStack_198;
  ulong local_190;
  float local_184;
  long local_180;
  ulong local_178;
  long local_170;
  long *local_168;
  long *plStack_160;
  long *local_158;
  long *local_150;
  long *plStack_148;
  long *local_140;
  ulong local_138;
  float *local_130;
  ulong local_128;
  long *local_120;
  long *local_118;
  long *local_110;
  undefined8 local_108;
  float *local_100;
  undefined1 local_f1;
  undefined8 local_f0;
  undefined4 local_e8;
  undefined4 local_d8;

  local_f0 = 0xfffffffffffffffe;
  local_138 = 0;
  local_130 = (float *)&DAT_00000008;
  local_128 = 0;
  uVar30 = *(ulong *)(param_6 + 0x2b8);
  if (uVar30 == 0) {
    local_118 = (long *)0x0;
    local_1b0 = (long *)0x0;
  }
  else {
    plVar16 = *(long **)(param_6 + 0x2b0);
    if (uVar30 == 1) {
      uVar27 = 0;
      local_118 = (long *)0x0;
LAB_1454e1e22:
      local_118 = (long *)(((ulong)*(byte *)(plVar16[uVar27 * 3] + 0x45) ^ 1) + (long)local_118);
    }
    else {
      uVar27 = 0;
      local_118 = (long *)0x0;
      plVar22 = plVar16;
      do {
        local_118 = (long *)((long)local_118 +
                            ((ulong)*(byte *)(plVar22[3] + 0x45) ^ 1) +
                            ((ulong)*(byte *)(*plVar22 + 0x45) ^ 1));
        uVar27 = uVar27 + 2;
        plVar22 = plVar22 + 6;
      } while ((uVar30 & 0xfffffffffffffffe) != uVar27);
      if ((uVar30 & 1) != 0) goto LAB_1454e1e22;
    }
    if (uVar30 < 4) {
      uVar27 = 0;
      local_1b0 = (long *)0x0;
    }
    else {
      uVar27 = 0;
      local_1b0 = (long *)0x0;
      plVar22 = plVar16;
      do {
        local_1b0 = (long *)((long)local_1b0 +
                            (ulong)*(byte *)(plVar22[9] + 0x45) +
                            (ulong)*(byte *)(plVar22[6] + 0x45) +
                            (ulong)*(byte *)(plVar22[3] + 0x45) + (ulong)*(byte *)(*plVar22 + 0x45))
        ;
        uVar27 = uVar27 + 4;
        plVar22 = plVar22 + 0xc;
      } while ((uVar30 & 0xfffffffffffffffc) != uVar27);
      if ((uVar30 & 3) == 0) goto LAB_1454e1ed5;
    }
    lVar20 = 0;
    do {
      local_1b0 = (long *)((long)local_1b0 +
                          (ulong)*(byte *)(*(long *)((long)plVar16 + lVar20 + uVar27 * 0x18) + 0x45)
                          );
      lVar20 = lVar20 + 0x18;
    } while ((ulong)(((uint)uVar30 & 3) << 3) * 3 != lVar20);
  }
LAB_1454e1ed5:
  local_120 = (long *)(*(long *)(param_6 + 0x2a0) * 0x58);
  if (*(char *)(*(long *)(param_6 + 0x378) + 0x75) == '\t') {
    uVar19 = *(int *)(*(long *)(param_6 + 0x378) + 0x68) - 7;
    local_108 = (long *)CONCAT44(local_108._4_4_,(int)CONCAT71((uint7)(uint3)(uVar19 >> 8),1));
    if ((uVar19 < 6 & 0x27U >> ((byte)uVar19 & 0x1f)) != 0) goto LAB_1454e1f5f;
  }
  if (*(long *)(param_6 + 0x2a0) != 0) {
    lVar20 = 0;
    do {
      lVar21 = *(long *)(*(long *)(param_6 + 0x298) + lVar20);
      if ((*(char *)(lVar21 + 0x75) == '\t') &&
         (uVar19 = *(int *)(lVar21 + 0x68) - 7, (uVar19 < 6 & 0x27U >> ((byte)uVar19 & 0x1f)) != 0))
      {
        local_108 = (long *)CONCAT44(local_108._4_4_,(int)CONCAT71((uint7)(uint3)(uVar19 >> 8),1));
        goto LAB_1454e1f5f;
      }
      lVar20 = lVar20 + 0x58;
    } while ((long)local_120 - lVar20 != 0);
  }
  local_108 = (long *)((ulong)local_108._4_4_ << 0x20);
LAB_1454e1f5f:
  plVar16 = (long *)0x0;
  do {
    local_1b8 = plVar16;
    if ((long)local_120 - (long)local_1b8 == 0) break;
    plVar16 = local_1b8 + 0xb;
  } while (*(char *)(*(long *)(*(long *)(param_6 + 0x298) + (long)local_1b8) + 0x75) != '\x06');
  local_108 = (long *)CONCAT44(local_108._4_4_,
                               CONCAT31((int3)((ulong)local_108 >> 8),~(byte)local_108));
  plVar16 = (long *)0x0;
  fVar39 = _DAT_1458eb488;
  fVar40 = _DAT_1458f6624;
  uVar42 = _DAT_14593e594;
  fVar36 = _DAT_1458f8de4;
  fVar44 = _DAT_1458eb514;
  local_184 = param_3;
  local_170 = param_6;
  local_e8 = in_XMM6_Da;
  local_d8 = in_XMM7_Da;
  do {
    lVar20 = *(long *)(param_6 + 0x810);
    local_180 = *(long *)(param_6 + 0x818);
    lVar24 = local_180 * 0x18;
    lVar21 = *(long *)(param_6 + 0x2b0);
    local_178 = *(long *)(param_6 + 0x2b8);
    lVar26 = local_178 * 0x18;
    local_1d4 = *(uint *)(param_6 + 0x4a8);
    local_1a8 = local_128;
LAB_1454e2070:
    do {
      do {
        if (plVar16 == (long *)0x630) {
          lVar20 = local_170;
          uVar30 = local_1a8;
          if (local_1a8 == local_138) {
            local_f1 = 1;
            param_1 = (float)func_0x000145757f60();
          }
          local_130[uVar30 * 6] = 2.5;
          (local_130 + uVar30 * 6 + 2)[0] = 1.4013e-45;
          (local_130 + uVar30 * 6 + 2)[1] = 0.0;
          uVar27 = uVar30 + 1;
          if (*(long *)(lVar20 + 0x308) != -1) {
            if (uVar27 == local_138) {
              local_f1 = 1;
              local_128 = uVar27;
              param_1 = (float)func_0x000145757f60();
            }
            local_130[uVar27 * 6] = 1.0;
            (local_130 + uVar27 * 6 + 2)[0] = 2.8026e-45;
            (local_130 + uVar27 * 6 + 2)[1] = 0.0;
            uVar27 = uVar30 + 2;
          }
          local_108 = (long *)(lVar20 + 0x308);
          local_120 = (long *)local_138;
          local_278 = (long *)0x0;
          uStack_270 = (long *)&DAT_00000008;
          local_268 = (long *)0x0;
          local_180 = lVar20 + 0x880;
          lVar20 = uVar27 * 0x18;
          plVar16 = (long *)0x0;
          uVar30 = uVar27 & 0xffffffff;
          local_100 = local_130;
          fVar39 = _DAT_1458f667c;
          fVar40 = _DAT_1459f7d90;
          local_178 = uVar27;
          local_128 = uVar27;
          goto LAB_1454e2459;
        }
        local_100 = (float *)(plVar16 + 0x28ce3c9f);
        local_110 = plVar16 + 9;
        if (local_180 != 0) {
          lVar2 = plVar16[0x28ce3ca0];
          lVar32 = 0;
          do {
            if ((*(long *)(lVar20 + 0x10 + lVar32) == lVar2) &&
               (iVar14 = func_0x000145756dd7(), plVar16 = local_110, param_1 = extraout_XMM0_Da,
               iVar14 == 0)) goto LAB_1454e2070;
            lVar32 = lVar32 + 0x18;
          } while (lVar24 != lVar32);
        }
        fVar34 = fVar39;
        if (local_178 != 0) {
          lVar2 = *(long *)((long)local_100 + 8);
          lVar32 = 0;
          do {
            fVar34 = fVar40;
            fVar40 = fVar34;
            if ((*(long *)(*(long *)(lVar21 + lVar32) + 8) == lVar2) &&
               (iVar14 = func_0x000145756dd7(), plVar16 = local_110, param_6 = local_170,
               param_1 = extraout_XMM0_Da_00, fVar40 = fVar34, iVar14 == 0)) {
              bVar1 = *(byte *)((long)local_100 + 0x44);
              if (bVar1 == 0xf) {
                if (1 < local_1d4) goto LAB_1454e2070;
              }
              else {
                if (bVar1 < 0x13) {
                    /* WARNING: Could not emulate address calculation at 0x0001454e2176 */
                    /* WARNING: Treating indirect jump as call */
                  (*(code *)((long)*(int *)((ulong)bVar1 * 4 + 0x1469ace6c) + 0x1469ace6c))
                            (fVar36,uVar42);
                  return;
                }
                param_1 = fVar36 * *(float *)((long)local_100 + 0x40) * fVar44;
                pfVar17 = (float *)(lVar21 + 0x10 + lVar32);
                if (param_1 < *pfVar17 || param_1 == *pfVar17) goto LAB_1454e2070;
              }
              if (local_1a8 == local_138) {
                local_f1 = 1;
                func_0x000145757f60();
                fVar40 = fVar34;
              }
              goto LAB_1454e22b1;
            }
            lVar32 = lVar32 + 0x18;
            fVar34 = fVar39;
          } while (lVar26 != lVar32);
        }
        plVar16 = local_110;
        param_6 = local_170;
        fVar39 = fVar34;
      } while ((((byte)local_108 & *(char *)((long)local_100 + 0x44) == '\x10') != 0) ||
              (local_120 == local_1b8 && *(char *)((long)local_100 + 0x44) == '\x12'));
      plVar22 = local_118;
      if (*(char *)((long)local_100 + 0x45) != '\0') {
        plVar22 = local_1b0;
      }
    } while ((long *)0x1 < plVar22);
    if (local_1a8 == local_138) {
      local_f1 = 1;
      func_0x000145757f60();
      fVar39 = fVar34;
    }
LAB_1454e22b1:
    local_130[local_1a8 * 6] = fVar34;
    (local_130 + local_1a8 * 6 + 2)[0] = 0.0;
    (local_130 + local_1a8 * 6 + 2)[1] = 0.0;
    *(float **)(local_130 + local_1a8 * 6 + 4) = local_100;
    local_128 = local_1a8 + 1;
    param_1 = fVar34;
  } while( true );
LAB_1454e2459:
  do {
    if (uVar27 == 0) break;
    fVar36 = fVar39;
    if ((long)plVar16 - local_178 < 0xfffffffffffffffd) {
      uVar23 = 0;
      pfVar17 = local_100;
      do {
        fVar36 = fVar36 + *pfVar17 + pfVar17[6] + pfVar17[0xc] + pfVar17[0x12];
        uVar23 = uVar23 + 4;
        pfVar17 = pfVar17 + 0x18;
      } while ((uVar27 & 0x7fffffffffffffc) != uVar23);
      if ((uVar27 & 3) != 0) goto LAB_1454e24c6;
    }
    else {
      uVar23 = 0;
LAB_1454e24c6:
      lVar21 = 0;
      do {
        fVar36 = fVar36 + *(float *)((long)local_100 + lVar21 + uVar23 * 0x18);
        lVar21 = lVar21 + 0x18;
      } while ((ulong)(((uint)uVar30 & 3) << 3) * 3 != lVar21);
    }
    if (fVar36 <= fVar40) {
      fVar36 = fVar40;
    }
    local_110 = plVar16;
    fVar36 = (float)func_0x0001454f97c0(param_1,0,fVar36);
    lVar21 = 0;
    uVar23 = 0;
    do {
      uVar29 = uVar23;
      if (fVar36 < *(float *)((long)local_100 + lVar21)) break;
      uVar23 = uVar23 + 1;
      fVar36 = fVar36 - *(float *)((long)local_100 + lVar21);
      lVar21 = lVar21 + 0x18;
      uVar29 = uVar27 - 1;
    } while (lVar20 != lVar21);
    if (uVar27 <= uVar29) {
LAB_1454e31bb:
      func_0x0001458e72eb();
      goto LAB_1454e31ce;
    }
    lVar21 = *(long *)(local_100 + uVar29 * 6 + 2);
    lVar24 = *(long *)(local_100 + uVar29 * 6 + 4);
    param_1 = (float)func_0x000145756dd1(lVar21,lVar24,local_100 + uVar29 * 6 + 6,
                                         local_100 + uVar29 * 6,(uVar27 + ~uVar29) * 0x18);
    plVar22 = local_268;
    if (lVar21 == -1) goto LAB_1454e31bb;
    if (local_268 == local_278) {
      param_1 = (float)func_0x000145758200();
    }
    uStack_270[(long)plVar22 * 2] = lVar21;
    uStack_270[(long)plVar22 * 2 + 1] = lVar24;
    local_268 = (long *)((long)plVar22 + 1);
    plVar16 = (long *)((long)local_110 + 1);
    uVar30 = (ulong)(byte)((char)uVar30 + 3);
    lVar20 = lVar20 + -0x18;
    uVar27 = uVar27 - 1;
  } while ((long)plVar22 < 2);
  plVar16 = uStack_270;
  local_1b8 = local_278;
  plVar22 = local_268;
  if (local_120 != (long *)0x0) {
    func_0x0001400021d0();
  }
  local_1a0 = 0;
  uStack_198 = 8;
  local_190 = 0;
  plVar22 = plVar16 + (long)plVar22 * 2;
  fVar39 = _DAT_1458eb488 + local_184;
  local_178 = local_170 + 0x808;
  local_120 = (long *)(local_170 + 800);
  local_1b0 = plVar16;
  lVar20 = local_170;
  plVar33 = local_108;
  fVar40 = _DAT_1458eb480;
  fVar36 = _DAT_1459c799c;
  fVar44 = _DAT_1458f8de0;
  fVar34 = _DAT_1458eb4f8;
  fVar45 = _DAT_145930f00;
  local_110 = plVar22;
  do {
    if (plVar16 == plVar22) {
      if (local_1b8 != (long *)0x0) {
        func_0x0001400021d0();
      }
      if (local_190 < 3) {
        uVar15 = *(uint *)(lVar20 + 0x930) >> 1;
        uVar19 = 0x3c;
        if (0x3c < uVar15) {
          uVar19 = uVar15;
        }
        plStack_160 = (long *)CONCAT44(plStack_160._4_4_,uVar19);
        local_168 = (long *)0x8000000000000004;
        func_0x0001454ded40();
        uVar30 = local_190;
        if (local_190 == local_1a0) {
          func_0x0001457a4a40();
        }
        func_0x000145756ddd();
        local_190 = uVar30 + 1;
      }
      param_7[2] = local_190;
      *param_7 = local_1a0;
      param_7[1] = uStack_198;
      return;
    }
    if (*plVar16 == 0) {
      plVar22 = (long *)plVar16[1];
      fVar35 = (float)*(uint *)(lVar20 + 0x3f8) * _DAT_14594f310;
      if (_DAT_14590ae44 <= fVar35) {
        fVar35 = _DAT_14590ae44;
      }
      fVar37 = *(float *)(lVar20 + 0x484) + fVar40 + fVar35 + local_184;
      fVar43 = fVar37 * fVar37;
      func_0x0001454f97c0(fVar35,0,fVar37 * fVar36 + fVar45 + fVar43 * fVar44 +
                                   fVar37 * fVar43 * fVar34 + fVar43 * fVar43);
      local_278 = (long *)0x8000000000000002;
      uStack_270 = plVar22;
      func_0x0001454ded40();
    }
    else if ((int)*plVar16 == 1) {
      fVar35 = (float)*(uint *)(lVar20 + 0x3f8) * _DAT_14594f310;
      if (_DAT_14590ae44 <= fVar35) {
        fVar35 = _DAT_14590ae44;
      }
      fVar46 = *(float *)(lVar20 + 0x484) + fVar40 + fVar35 + fVar39;
      fVar43 = fVar46 * fVar36;
      fVar37 = fVar46 * fVar46;
      fVar41 = fVar37 * fVar44;
      fVar38 = fVar37 * fVar37;
      fVar37 = fVar46 * fVar37 * fVar34;
      fVar35 = (float)func_0x0001454f97c0(fVar35,0,fVar43 + fVar45 + fVar41 + fVar37 + fVar38);
      if (fVar45 <= fVar35) {
        lVar21 = 1;
        if (fVar43 <= fVar35 + _DAT_1459c7e98) {
          fVar43 = (fVar35 + _DAT_1459c7e98) - fVar43;
          lVar21 = 2;
          if (fVar41 <= fVar43) {
            fVar43 = fVar43 - fVar41;
            lVar21 = 3;
            if (fVar37 <= fVar43) {
              if (fVar38 <= fVar43 - fVar37) goto LAB_1454e275c;
              lVar21 = 4;
            }
          }
        }
        if (*plVar33 == -1) goto LAB_1454e2768;
LAB_1454e2aaa:
        func_0x00014570c440();
      }
      else {
LAB_1454e275c:
        lVar21 = 0;
        if (*plVar33 != -1) goto LAB_1454e2aaa;
LAB_1454e2768:
        local_1d0 = (long *)0xffffffffffffffff;
      }
      local_278 = (long *)0x14671f7b0;
      uStack_270 = (long *)0x14671fd00;
      local_268 = &local_280;
      local_280 = lVar21;
      func_0x0001455294b0();
      if (local_280 == 4) {
        uVar30 = *(ulong *)(lVar20 + 0x2a0);
        if ((ulong)((long)local_168 - (long)local_158) < uVar30) {
          func_0x000145757d40();
        }
        else if (uVar30 == 0) goto LAB_1454e2bc8;
        local_118 = local_158;
        plVar22 = plStack_160 + (long)local_158 * 0xe;
        pfVar17 = (float *)0x0;
        do {
          local_100 = pfVar17;
          func_0x000145414300();
          plVar22[0xc] = local_218;
          plVar22[0xd] = lStack_210;
          plVar22[10] = local_228;
          plVar22[0xb] = uStack_220;
          plVar22[8] = local_238;
          plVar22[9] = (long)pfStack_230;
          plVar22[6] = local_248;
          plVar22[7] = uStack_240;
          plVar22[4] = (long)local_258;
          plVar22[5] = (long)uStack_250;
          plVar22[2] = (long)local_268;
          plVar22[3] = (long)uStack_260;
          *(undefined4 *)plVar22 = (undefined4)local_278;
          *(undefined4 *)((long)plVar22 + 4) = local_278._4_4_;
          *(undefined4 *)(plVar22 + 1) = (undefined4)uStack_270;
          *(undefined4 *)((long)plVar22 + 0xc) = uStack_270._4_4_;
          pfVar17 = (float *)((long)local_100 + -1);
          plVar22 = plVar22 + 0xe;
        } while (-(long)pfVar17 != uVar30);
        local_158 = (long *)((long)local_118 - (long)pfVar17);
      }
LAB_1454e2bc8:
      func_0x000145523330();
      if (local_158 == (long *)0x0) {
        func_0x000145413de0();
        if (local_158 != (long *)0x0) {
          plVar28 = plStack_160 + 7;
          plVar22 = local_158;
          do {
            if (plVar28[-7] != 0) {
              func_0x0001400021d0();
            }
            if (plVar28[-4] != 0) {
              func_0x0001400021d0();
            }
            if (plVar28[-1] != 0) {
              func_0x0001400021d0();
            }
            plVar28 = plVar28 + 0xe;
            plVar22 = (long *)((long)plVar22 + -1);
          } while (plVar22 != (long *)0x0);
        }
        if (local_168 != (long *)0x0) {
          func_0x0001400021d0();
        }
      }
      else {
        lVar21 = 0x3f;
        if (local_158 != (long *)0x0) {
          for (; (ulong)local_158 >> lVar21 == 0; lVar21 = lVar21 + -1) {
          }
        }
        uVar30 = *(ulong *)(lVar20 + 0x880);
        uVar27 = *(ulong *)(lVar20 + 0x888);
        uVar23 = *(ulong *)(lVar20 + 0x898);
        uVar29 = *(ulong *)(lVar20 + 0x890);
        do {
          uVar18 = ((uVar30 + uVar23) * 0x800000 | uVar30 + uVar23 >> 0x29) + uVar30;
          uVar25 = uVar27 << 0x11;
          uVar29 = uVar29 ^ uVar30;
          uVar23 = uVar23 ^ uVar27;
          uVar30 = uVar30 ^ uVar23;
          uVar23 = uVar23 << 0x2d | uVar23 >> 0x13;
          uVar27 = uVar27 ^ uVar29;
          auVar3._8_8_ = 0;
          auVar3._0_8_ = uVar18;
          auVar4._8_8_ = 0;
          auVar4._0_8_ = local_158;
          plVar22 = SUB168(auVar3 * auVar4,8);
          uVar29 = uVar29 ^ uVar25;
        } while (((long)local_158 << (~(byte)lVar21 & 0x3f)) - 1U < SUB168(auVar3 * auVar4,0));
        *(ulong *)(lVar20 + 0x880) = uVar30;
        *(ulong *)(lVar20 + 0x898) = uVar23;
        *(ulong *)(lVar20 + 0x888) = uVar27;
        *(ulong *)(lVar20 + 0x890) = uVar29;
        if (local_158 <= plVar22) {
          func_0x0001458e72a4();
          goto LAB_1454e31ce;
        }
        local_278 = (long *)plStack_160[(long)plVar22 * 0xe];
        uStack_270 = (long *)(plStack_160 + (long)plVar22 * 0xe)[1];
        local_268 = (long *)plStack_160[(long)plVar22 * 0xe + 2];
        uStack_260 = (long *)(plStack_160 + (long)plVar22 * 0xe + 2)[1];
        local_258 = (long *)plStack_160[(long)plVar22 * 0xe + 4];
        uStack_250 = (long *)(plStack_160 + (long)plVar22 * 0xe + 4)[1];
        local_248 = plStack_160[(long)plVar22 * 0xe + 6];
        uStack_240 = (plStack_160 + (long)plVar22 * 0xe + 6)[1];
        local_238 = plStack_160[(long)plVar22 * 0xe + 8];
        pfStack_230 = (float *)(plStack_160 + (long)plVar22 * 0xe + 8)[1];
        local_228 = plStack_160[(long)plVar22 * 0xe + 10];
        uStack_220 = (plStack_160 + (long)plVar22 * 0xe + 10)[1];
        local_218 = plStack_160[(long)plVar22 * 0xe + 0xc];
        lStack_210 = (plStack_160 + (long)plVar22 * 0xe + 0xc)[1];
        plVar31 = (long *)((long)local_158 + -1);
        plVar28 = plStack_160 + (long)plVar31 * 0xe + 0xc;
        lVar12 = *plVar28;
        uVar42 = *(undefined4 *)((long)plVar28 + 4);
        lVar13 = plVar28[1];
        uVar47 = *(undefined4 *)((long)plVar28 + 0xc);
        lVar21 = plStack_160[(long)plVar31 * 0xe + 10];
        lVar24 = (plStack_160 + (long)plVar31 * 0xe + 10)[1];
        lVar26 = plStack_160[(long)plVar31 * 0xe + 8];
        lVar2 = (plStack_160 + (long)plVar31 * 0xe + 8)[1];
        lVar32 = (plStack_160 + (long)plVar31 * 0xe)[1];
        lVar6 = plStack_160[(long)plVar31 * 0xe + 2];
        lVar7 = (plStack_160 + (long)plVar31 * 0xe + 2)[1];
        lVar8 = plStack_160[(long)plVar31 * 0xe + 4];
        lVar9 = (plStack_160 + (long)plVar31 * 0xe + 4)[1];
        lVar10 = plStack_160[(long)plVar31 * 0xe + 6];
        lVar11 = (plStack_160 + (long)plVar31 * 0xe + 6)[1];
        plStack_160[(long)plVar22 * 0xe] = plStack_160[(long)plVar31 * 0xe];
        (plStack_160 + (long)plVar22 * 0xe)[1] = lVar32;
        plStack_160[(long)plVar22 * 0xe + 2] = lVar6;
        (plStack_160 + (long)plVar22 * 0xe + 2)[1] = lVar7;
        plStack_160[(long)plVar22 * 0xe + 4] = lVar8;
        (plStack_160 + (long)plVar22 * 0xe + 4)[1] = lVar9;
        plStack_160[(long)plVar22 * 0xe + 6] = lVar10;
        (plStack_160 + (long)plVar22 * 0xe + 6)[1] = lVar11;
        plStack_160[(long)plVar22 * 0xe + 8] = lVar26;
        (plStack_160 + (long)plVar22 * 0xe + 8)[1] = lVar2;
        plStack_160[(long)plVar22 * 0xe + 10] = lVar21;
        (plStack_160 + (long)plVar22 * 0xe + 10)[1] = lVar24;
        plVar22 = plStack_160 + (long)plVar22 * 0xe + 0xc;
        *(int *)plVar22 = (int)lVar12;
        *(undefined4 *)((long)plVar22 + 4) = uVar42;
        *(int *)(plVar22 + 1) = (int)lVar13;
        *(undefined4 *)((long)plVar22 + 0xc) = uVar47;
        local_158 = plVar31;
        if (plVar31 != (long *)0x0) {
          plVar22 = plStack_160 + 7;
          do {
            if (plVar22[-7] != 0) {
              func_0x0001400021d0();
            }
            if (plVar22[-4] != 0) {
              func_0x0001400021d0();
            }
            if (plVar22[-1] != 0) {
              func_0x0001400021d0();
            }
            plVar22 = plVar22 + 0xe;
            plVar31 = (long *)((long)plVar31 + -1);
          } while (plVar31 != (long *)0x0);
        }
        if (local_168 != (long *)0x0) {
          func_0x0001400021d0();
        }
      }
      if ((local_1d0 != (long *)0xffffffffffffffff) && (local_1d0 != (long *)0x0)) {
        func_0x0001400021d0();
      }
      func_0x000140002200();
      plVar22 = (long *)func_0x0001400021c0();
      if (plVar22 == (long *)0x0) {
        func_0x0001458e7201();
        goto LAB_1454e31ce;
      }
      plVar22[0xc] = local_218;
      plVar22[0xd] = lStack_210;
      plVar22[10] = local_228;
      plVar22[0xb] = uStack_220;
      plVar22[8] = local_238;
      plVar22[9] = (long)pfStack_230;
      *(undefined4 *)(plVar22 + 6) = (undefined4)local_248;
      *(undefined4 *)((long)plVar22 + 0x34) = local_248._4_4_;
      *(undefined4 *)(plVar22 + 7) = (undefined4)uStack_240;
      *(undefined4 *)((long)plVar22 + 0x3c) = uStack_240._4_4_;
      *(undefined4 *)(plVar22 + 4) = (undefined4)local_258;
      *(undefined4 *)((long)plVar22 + 0x24) = local_258._4_4_;
      *(undefined4 *)(plVar22 + 5) = (undefined4)uStack_250;
      *(undefined4 *)((long)plVar22 + 0x2c) = uStack_250._4_4_;
      *(undefined4 *)(plVar22 + 2) = (undefined4)local_268;
      *(undefined4 *)((long)plVar22 + 0x14) = local_268._4_4_;
      *(undefined4 *)(plVar22 + 3) = (undefined4)uStack_260;
      *(undefined4 *)((long)plVar22 + 0x1c) = uStack_260._4_4_;
      *(undefined4 *)plVar22 = (undefined4)local_278;
      *(undefined4 *)((long)plVar22 + 4) = local_278._4_4_;
      *(undefined4 *)(plVar22 + 1) = (undefined4)uStack_270;
      *(undefined4 *)((long)plVar22 + 0xc) = uStack_270._4_4_;
      local_168 = (long *)0x8000000000000003;
      plStack_160 = plVar22;
      func_0x0001454ded40();
    }
    else {
      if (*plVar33 == -1) {
        func_0x0001458e7510();
LAB_1454e31ce:
                    /* WARNING: Does not return */
        pcVar5 = (code *)invalidInstructionException();
        (*pcVar5)();
      }
      func_0x00014570c440();
      func_0x00014570c440();
      uVar30 = *(ulong *)(lVar20 + 0x348);
      if (0x7ffffffffffffff8 < uVar30 << 6 || uVar30 >> 0x3a != 0) {
LAB_1454e302e:
        func_0x0001458e721b();
        goto LAB_1454e31ce;
      }
      local_100 = *(float **)(lVar20 + 0x350);
      local_118 = *(long **)(lVar20 + 0x360);
      uVar42 = *(undefined4 *)(lVar20 + 0x358);
      uVar47 = *(undefined4 *)(lVar20 + 0x35c);
      uVar48 = *(undefined4 *)(lVar20 + 0x360);
      uVar49 = *(undefined4 *)(lVar20 + 0x364);
      lVar21 = *(long *)(lVar20 + 0x368);
      if (uVar30 << 6 == 0) {
        uVar27 = 8;
        uVar23 = 0;
      }
      else {
        func_0x000140002200();
        uVar27 = func_0x0001400021c0();
        uVar23 = uVar30;
        if (uVar27 == 0) goto LAB_1454e302e;
      }
      if (uVar30 != 0) {
        func_0x000145756ddd();
      }
      lVar20 = local_170;
      uStack_250 = local_268;
      local_158 = local_1c0;
      local_168 = local_1d0;
      plStack_160 = plStack_1c8;
      local_140 = local_268;
      local_150 = local_278;
      plStack_148 = uStack_270;
      local_268 = local_1c0;
      uStack_260 = local_278;
      local_258 = uStack_270;
      pfStack_230 = local_100;
      local_228 = CONCAT44(uVar47,uVar42);
      uStack_220 = CONCAT44(uVar49,uVar48);
      lStack_210 = CONCAT44(lStack_210._4_4_,*(undefined4 *)(local_170 + 0x370));
      local_278 = local_1d0;
      uStack_270 = plStack_1c8;
      local_248 = uVar23;
      uStack_240 = uVar27;
      local_238 = uVar30;
      local_218 = lVar21;
      func_0x000140002200();
      plVar22 = (long *)func_0x0001400021c0();
      if (plVar22 == (long *)0x0) {
        func_0x0001458e7201();
        goto LAB_1454e31ce;
      }
      plVar22[0xc] = local_218;
      plVar22[0xd] = lStack_210;
      plVar22[10] = local_228;
      plVar22[0xb] = uStack_220;
      plVar22[8] = local_238;
      plVar22[9] = (long)pfStack_230;
      *(undefined4 *)(plVar22 + 6) = (undefined4)local_248;
      *(undefined4 *)((long)plVar22 + 0x34) = local_248._4_4_;
      *(undefined4 *)(plVar22 + 7) = (undefined4)uStack_240;
      *(undefined4 *)((long)plVar22 + 0x3c) = uStack_240._4_4_;
      *(undefined4 *)(plVar22 + 4) = (undefined4)local_258;
      *(undefined4 *)((long)plVar22 + 0x24) = local_258._4_4_;
      *(undefined4 *)(plVar22 + 5) = (undefined4)uStack_250;
      *(undefined4 *)((long)plVar22 + 0x2c) = uStack_250._4_4_;
      *(undefined4 *)(plVar22 + 2) = (undefined4)local_268;
      *(undefined4 *)((long)plVar22 + 0x14) = local_268._4_4_;
      *(undefined4 *)(plVar22 + 3) = (undefined4)uStack_260;
      *(undefined4 *)((long)plVar22 + 0x1c) = uStack_260._4_4_;
      *(undefined4 *)plVar22 = (undefined4)local_278;
      *(undefined4 *)((long)plVar22 + 4) = local_278._4_4_;
      *(undefined4 *)(plVar22 + 1) = (undefined4)uStack_270;
      *(undefined4 *)((long)plVar22 + 0xc) = uStack_270._4_4_;
      local_168 = (long *)0x8000000000000003;
      plStack_160 = plVar22;
      func_0x0001454ded40();
      plVar33 = local_108;
    }
    uVar30 = local_190;
    plVar22 = local_110;
    if (local_190 == local_1a0) {
      func_0x0001457a4a40();
    }
    plVar16 = plVar16 + 2;
    func_0x000145756ddd();
    local_190 = uVar30 + 1;
  } while( true );
}
