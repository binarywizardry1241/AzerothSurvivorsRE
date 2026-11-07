/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,ulong *param_3,undefined8 param_4,long *param_5,
          long *param_6)

{
  uint *puVar1;
  int iVar2;
  ulong uVar3;
  code *pcVar4;
  undefined8 **ppuVar5;
  undefined8 **ppuVar6;
  undefined8 **ppuVar7;
  ulong uVar8;
  long lVar9;
  undefined4 *puVar10;
  char cVar11;
  long lVar12;
  long lVar13;
  ulong uVar14;
  char *pcVar15;
  ulong uVar16;
  undefined8 **ppuVar17;
  long lVar18;
  long lVar19;
  undefined8 *puVar20;
  uint *puVar21;
  char *pcVar22;
  undefined8 **ppuVar23;
  undefined8 uVar24;
  float extraout_XMM0_Da;
  float fVar25;
  float extraout_XMM0_Da_00;
  uint uVar26;
  uint uVar27;
  undefined4 extraout_XMM0_Da_01;
  undefined4 uVar28;
  undefined4 extraout_XMM0_Da_02;
  undefined4 in_XMM6_Da;
  float fVar29;
  undefined4 in_XMM7_Da;
  float fVar30;
  float fVar31;
  float fVar32;
  float fVar33;
  float fVar34;
  float fVar35;
  undefined1 auVar36 [12];
  undefined1 auVar37 [16];
  long *in_stack_00000028;
  long *in_stack_00000030;
  undefined8 *in_stack_00000038;
  long *in_stack_00000040;
  undefined8 *in_stack_00000048;
  undefined4 uStack_350;
  undefined4 uStack_34c;
  int local_330;
  int iStack_32c;
  undefined4 uStack_2ec;
  undefined4 uStack_28c;
  ulong local_250;
  ulong local_248;
  undefined8 **local_240;
  undefined8 **local_238;
  undefined8 **ppuStack_230;
  undefined8 **local_228;
  undefined4 uStack_220;
  undefined4 uStack_21c;
  ulong local_218;
  undefined4 local_210;
  undefined4 local_20c;
  undefined8 local_208;
  undefined8 ***local_200;
  undefined8 *local_1f8;
  undefined8 local_1f0;
  long local_1e8;
  long local_1e0;
  long local_1d8;
  long local_1d0;
  undefined4 *local_1c8;
  undefined8 local_1c0;
  undefined4 local_1b4;
  long local_1b0;
  long local_1a8;
  char *local_1a0;
  undefined8 **local_198;
  undefined8 **ppuStack_190;
  undefined8 **local_188;
  undefined8 **local_180;
  undefined8 uStack_178;
  ulong local_170;
  undefined8 **local_168;
  undefined8 **local_160;
  undefined8 **local_158;
  ulong local_150;
  undefined2 local_148;
  undefined1 local_146;
  undefined1 local_140;
  long local_130;
  undefined4 local_128;
  int local_124;
  uint local_120;
  undefined4 local_11c;
  undefined8 **local_118;
  long local_110;
  undefined8 **local_108;
  ulong local_100;
  long local_f8;
  undefined8 **local_f0;
  undefined8 **local_e8;
  undefined8 **local_e0;
  char local_d3;
  undefined1 local_d2;
  undefined1 local_d1;
  undefined8 local_d0;
  undefined4 local_c8;
  undefined4 local_b8;

  local_d0 = 0xfffffffffffffffe;
  uVar3 = param_3[4];
  ppuVar5 = (undefined8 **)*param_3;
  ppuVar6 = (undefined8 **)param_3[1];
  ppuVar7 = (undefined8 **)param_3[2];
  uVar8 = param_3[3];
  local_1e8 = *param_5;
  lVar9 = param_5[1];
  local_1a8 = *param_6;
  local_1d8 = *in_stack_00000030;
  local_1c8 = (undefined4 *)in_stack_00000030[2];
  local_1c0 = *in_stack_00000038;
  local_1d0 = *in_stack_00000040;
  puVar10 = (undefined4 *)in_stack_00000040[2];
  if (local_1d8 == 0 || (*in_stack_00000028 == 0 || local_1a8 == 0)) {
    return;
  }
  fVar31 = _DAT_145d6d36c;
  if (((int *)*in_stack_00000048 != (int *)0x0) &&
     (iVar2 = *(int *)*in_stack_00000048, fVar31 = _DAT_145db7fc0, iVar2 != 0)) {
    fVar31 = *(float *)((ulong)(iVar2 == 1) * 4 + 0x145e4cde8);
  }
  uStack_28c = (undefined4)((ulong)in_stack_00000030[3] >> 0x20);
  local_11c = uStack_28c;
  iStack_32c = (int)((ulong)param_5[2] >> 0x20);
  puVar21 = *(uint **)(local_1e8 + 0xf8);
  puVar1 = puVar21 + *(long *)(local_1e8 + 0x100);
  local_d3 = *(char *)(local_1e8 + 0x108);
  uStack_2ec = (undefined4)((ulong)in_stack_00000040[3] >> 0x20);
  local_1b4 = uStack_2ec;
  local_124 = iStack_32c;
  local_330 = (int)param_5[2];
  local_120 = 0xc233b000;
  if ((uint)(iStack_32c - local_330) < 0xc233b000) {
    local_120 = iStack_32c - local_330;
  }
  local_130 = 8;
  local_f8 = 0;
  lVar19 = 0;
  lVar12 = 0;
  uVar24 = 0;
  uVar16 = 0;
  lVar13 = 8;
  fVar30 = _DAT_145d6d36c;
  fVar32 = _DAT_145d6d754;
  fVar33 = _DAT_145e4cdf0;
  fVar34 = _DAT_145d9aecc;
  local_c8 = in_XMM6_Da;
  local_b8 = in_XMM7_Da;
LAB_14059a15a:
  do {
    do {
      do {
        lVar18 = local_130;
        if (local_d3 == '\0') {
          do {
            if ((int)uVar16 == (int)uVar24) {
              if (puVar21 == puVar1) {
                return;
              }
              uVar26 = *puVar21;
              puVar21 = puVar21 + 1;
              if (*(long *)(*(long *)(lVar9 + 0x108) + 0x58 + (ulong)uVar26 * 0xa0) == 0) {
                do {
                  if (puVar21 == puVar1) {
                    return;
                  }
                  uVar26 = *puVar21;
                  puVar21 = puVar21 + 1;
                } while (*(long *)(*(long *)(lVar9 + 0x108) + 0x58 + (ulong)uVar26 * 0xa0) == 0);
                lVar13 = *(long *)(lVar9 + 0x108) + (ulong)uVar26 * 0xa0;
              }
              else {
                lVar13 = *(long *)(lVar9 + 0x108) + (ulong)uVar26 * 0xa0;
              }
              puVar20 = (undefined8 *)(lVar13 + 0x58);
              lVar19 = *(long *)(lVar9 + 0x1a8) + (ulong)*(uint *)(lVar13 + 0x94) * 0x48;
              uVar16 = *(ulong *)(*(long *)(lVar9 + 0x1a8) + 0x40 +
                                 (ulong)*(uint *)(lVar13 + 0x94) * 0x48);
              if ((*(ulong *)(local_1e8 + 0x110) < uVar16) &&
                 (uVar14 = *(ulong *)(*(long *)(lVar19 + 0x38) + *(ulong *)(local_1e8 + 0x110) * 8),
                 uVar14 != 0)) {
                local_f8 = *(long *)(*(long *)(lVar19 + 0x18) + 0x10 + ~uVar14 * 0x30);
                uVar14 = *(ulong *)(local_1e8 + 0x118);
                if (uVar16 <= uVar14) goto LAB_14059a3f0;
LAB_14059a3c7:
                uVar16 = *(ulong *)(*(long *)(lVar19 + 0x38) + uVar14 * 8);
                if (uVar16 == 0) goto LAB_14059a3f0;
                lVar19 = *(long *)(*(long *)(lVar19 + 0x18) + 0x10 + ~uVar16 * 0x30);
              }
              else {
                local_f8 = 0;
                uVar14 = *(ulong *)(local_1e8 + 0x118);
                if (uVar14 < uVar16) goto LAB_14059a3c7;
LAB_14059a3f0:
                lVar19 = 0;
              }
              lVar12 = func_0x000144e38110(puVar21,lVar13,*(undefined8 *)(local_1e8 + 0x120));
              lVar13 = *(long *)(lVar13 + 0x50);
              uVar24 = *puVar20;
              uVar16 = 0;
            }
            lVar18 = (uVar16 & 0xffffffff) * 0x10;
            uVar16 = (ulong)((int)uVar16 + 1);
            uVar14 = (ulong)~*(uint *)(lVar13 + 8 + lVar18);
          } while ((local_120 <= (uint)(local_124 - *(int *)(lVar12 + uVar14 * 4))) ||
                  (ppuVar17 = *(undefined8 ***)(lVar18 + lVar13), lVar18 = local_130,
                  (int)ppuVar17 == 0));
        }
        else {
          do {
            if ((int)uVar16 == (int)uVar24) {
              if (puVar21 == puVar1) {
                return;
              }
              uVar16 = (ulong)*puVar21;
              puVar21 = puVar21 + 1;
              lVar19 = *(long *)(lVar9 + 0x1a8);
              if (*(long *)(lVar19 + 0x10 + uVar16 * 0x48) == 0) {
                do {
                  if (puVar21 == puVar1) {
                    return;
                  }
                  uVar26 = *puVar21;
                  puVar21 = puVar21 + 1;
                } while (*(long *)(*(long *)(lVar9 + 0x1a8) + 0x10 + (ulong)uVar26 * 0x48) == 0);
                lVar18 = *(long *)(lVar9 + 0x1a8) + (ulong)uVar26 * 0x48;
                lVar19 = lVar18;
              }
              else {
                lVar18 = lVar19 + uVar16 * 0x48;
                lVar19 = lVar19 + uVar16 * 0x48;
              }
              puVar20 = (undefined8 *)(lVar19 + 0x10);
              uVar16 = *(ulong *)(lVar18 + 0x40);
              if ((*(ulong *)(local_1e8 + 0x110) < uVar16) &&
                 (uVar14 = *(ulong *)(*(long *)(lVar18 + 0x38) + *(ulong *)(local_1e8 + 0x110) * 8),
                 uVar14 != 0)) {
                local_f8 = *(long *)(*(long *)(lVar18 + 0x18) + 0x10 + ~uVar14 * 0x30);
                uVar14 = *(ulong *)(local_1e8 + 0x118);
                if (uVar16 <= uVar14) goto LAB_14059a280;
LAB_14059a257:
                uVar16 = *(ulong *)(*(long *)(lVar18 + 0x38) + uVar14 * 8);
                if (uVar16 == 0) goto LAB_14059a280;
                lVar19 = *(long *)(*(long *)(lVar18 + 0x18) + 0x10 + ~uVar16 * 0x30);
              }
              else {
                local_f8 = 0;
                uVar14 = *(ulong *)(local_1e8 + 0x118);
                if (uVar14 < uVar16) goto LAB_14059a257;
LAB_14059a280:
                lVar19 = 0;
              }
              lVar12 = func_0x000144e38110(puVar21,puVar20,*(undefined8 *)(local_1e8 + 0x120),lVar18
                                          );
              lVar18 = *(long *)(lVar18 + 8);
              uVar24 = *puVar20;
              uVar16 = 0;
            }
            uVar14 = uVar16 & 0xffffffff;
            uVar16 = (ulong)((int)uVar16 + 1);
          } while ((local_120 <= (uint)(local_124 - *(int *)(lVar12 + uVar14 * 4))) ||
                  (ppuVar17 = *(undefined8 ***)(lVar18 + uVar14 * 8), (int)ppuVar17 == 0));
        }
        local_130 = lVar18;
        local_1e0 = uVar14 * 0x10 + local_f8;
        local_110 = uVar14 * 0x38 + lVar19;
        if ((int)ppuVar17 == 0) {
          return;
        }
        local_118 = ppuVar17;
      } while (*(char *)(local_1e0 + 0xc) != '\x03');
      local_1b0 = lVar13;
      auVar36 = func_0x0001459d2b00();
      lVar13 = local_1b0;
    } while ((auVar36._0_8_ & 1) == 0);
    local_128 = auVar36._8_4_;
    lVar13 = func_0x000145a7b160();
    if ((lVar13 != 0) && (uVar14 = func_0x000145a7c300(), uVar14 != 0)) {
      local_f0 = (undefined8 **)CONCAT71(local_f0._1_7_,DAT_148004b98);
      local_100 = uVar14;
      func_0x0001459d2940();
      uStack_350 = (undefined4)uVar8;
      uStack_34c = (undefined4)(uVar8 >> 0x20);
      if ((int)local_198 == 1) {
        fVar29 = local_188._0_4_ * fVar32;
        uVar14 = func_0x0001459cd660();
        fVar25 = extraout_XMM0_Da;
        if ((uVar14 & 1) != 0) goto LAB_14059a62e;
LAB_14059a66d:
        fVar25 = fVar30;
      }
      else {
        fVar29 = 0.0;
        uVar14 = func_0x0001459cd660();
        fVar25 = extraout_XMM0_Da_00;
        if ((uVar14 & 1) == 0) goto LAB_14059a66d;
LAB_14059a62e:
        fVar25 = (float)(~-(uint)(0.0 < fVar25) & (uint)fVar30 |
                        (uint)fVar25 & -(uint)(0.0 < fVar25));
      }
      if ((((char)local_f0 == '\0') && (*(int *)(local_100 + 0x30) != 0)) &&
         (*(int *)(local_100 + 0x34) != 0)) {
        auVar37 = func_0x000145a7bdc0();
        if (auVar37._0_8_ != (char *)0x0) {
          local_1a0 = auVar37._0_8_;
          local_e8 = auVar37._8_8_;
          func_0x00014023ff50();
          local_108 = ppuStack_190;
          if ((int)local_198 == 1) {
            func_0x000145d6944b();
                    /* WARNING: Does not return */
            pcVar4 = (code *)invalidInstructionException();
            (*pcVar4)();
          }
          local_e0 = local_188;
          if (local_e8 != (undefined8 **)0x0) {
            func_0x000145bc977b();
          }
          *local_1c8 = local_11c;
          local_d1 = 1;
          func_0x000140573390();
          local_168 = local_108;
          local_160 = local_e0;
          local_158 = local_e8;
          uVar26 = func_0x000145bc97bd(fVar29);
          uVar27 = func_0x000145bc97c3(fVar29);
          local_150 = local_150 & 0xffffffff00000000;
          local_148 = 1;
          local_146 = 0;
          local_198 = (undefined8 **)((ulong)uVar26 << 0x20);
          ppuStack_190 = (undefined8 **)((ulong)uVar27 << 0x20);
          local_188 = (undefined8 **)0x0;
          local_180 = (undefined8 **)((ulong)(uint)fVar25 << 0x20);
          uStack_178 = CONCAT44(fVar25,fVar25);
          local_140 = 0;
          local_d1 = 0;
          func_0x000140a82d00();
          local_198 = local_118;
          if (ppuVar7 != (undefined8 **)0x0) {
            local_248 = uVar3;
          }
          local_d1 = 0;
          ppuStack_190 = ppuVar5;
          local_188 = ppuVar6;
          local_180 = ppuVar7;
          uStack_178 = uVar8;
          local_170 = local_248;
          func_0x000144e61ed0();
        }
      }
      pcVar15 = (char *)func_0x000145a7c220();
      if (pcVar15 != (char *)0x0) {
        if ((pcVar15[0x60] == '\0') || (*(int *)(pcVar15 + 0x74) != 9)) {
          if ((*(int *)(pcVar15 + 0x78) == 1) && (*(int *)(pcVar15 + 0x8c) == 9)) {
            pcVar22 = pcVar15 + 0x78;
            goto LAB_14059a914;
          }
          if ((*(int *)(pcVar15 + 0x90) == 1) && (*(int *)(pcVar15 + 0xa4) == 9)) {
            pcVar22 = pcVar15 + 0x90;
            goto LAB_14059a914;
          }
          if ((*(int *)(pcVar15 + 0xa8) == 1) && (*(int *)(pcVar15 + 0xbc) == 9)) {
            pcVar22 = pcVar15 + 0xa8;
            goto LAB_14059a914;
          }
        }
        else {
          pcVar22 = pcVar15 + 0x60;
LAB_14059a914:
          if ((char)local_f0 == '\0') {
            uVar26 = (uint)(*(float *)(pcVar22 + 4) + fVar33) >> 0xe & 0xff;
            if (5 < uVar26) {
              uVar26 = 6;
            }
            fVar29 = *(float *)(pcVar22 + 8);
            local_108 = *(undefined8 ***)((ulong)(uVar26 << 4) + 0x145e56050);
            local_f0 = *(undefined8 ***)((ulong)(uVar26 << 4) + 0x145e56058);
            local_1a0 = pcVar15;
            func_0x00014023ff50();
            local_e0 = ppuStack_190;
            if ((int)local_198 == 1) {
              func_0x000145d6944b();
                    /* WARNING: Does not return */
              pcVar4 = (code *)invalidInstructionException();
              (*pcVar4)();
            }
            local_e8 = local_188;
            func_0x000145bc977b();
            *local_1c8 = local_11c;
            local_d2 = 1;
            func_0x000140573390();
            local_240 = local_118;
            if (ppuVar7 != (undefined8 **)0x0) {
              local_250 = uVar3;
            }
            uStack_220 = uStack_350;
            uStack_21c = uStack_34c;
            local_238 = ppuVar5;
            ppuStack_230 = ppuVar6;
            local_228 = ppuVar7;
            local_218 = local_250;
            uVar14 = func_0x0001459d28e0();
            uVar28 = extraout_XMM0_Da_01;
            if ((uVar14 & 1) == 0) {
              uVar28 = 0;
            }
            fVar35 = fVar25 * fVar25;
            if (fVar34 <= fVar25 * fVar25) {
              fVar35 = fVar34;
            }
            local_180 = (undefined8 **)((ulong)local_118 ^ 0x9e3779b97f4a7c15);
            local_198 = local_e0;
            ppuStack_190 = local_e8;
            local_188 = local_f0;
            uStack_178 = CONCAT44(fVar35 * fVar29 * fVar31,uVar28);
            local_170 = local_170 & 0xffffffff00000000;
            local_168 = (undefined8 **)((ulong)local_168 & 0xffffffffffffff00);
            local_d2 = 0;
            func_0x000140a87870();
            pcVar15 = local_1a0;
          }
        }
        if (*pcVar15 != '\0') {
          uVar28 = *(undefined4 *)(pcVar15 + 4);
          *puVar10 = local_1b4;
          ppuVar17 = *(undefined8 ***)(local_1d0 + 0x30);
          ppuVar23 = *(undefined8 ***)(local_1d0 + 0x40);
          if (ppuVar17 == *(undefined8 ***)(local_1d0 + 0x20)) {
            local_e8 = (undefined8 **)CONCAT44(local_e8._4_4_,uVar28);
            local_f0 = ppuVar17;
            local_e0 = *(undefined8 ***)(local_1d0 + 0x40);
            func_0x000145bcb530();
            ppuVar17 = local_f0;
            ppuVar23 = local_e0;
            uVar28 = local_e8._0_4_;
          }
          lVar13 = *(long *)(local_1d0 + 0x28);
          lVar18 = (long)ppuVar17 * 0x20;
          *(undefined4 *)(lVar13 + lVar18) = 0;
          *(undefined4 *)(lVar13 + 4 + lVar18) = uVar28;
          *(undefined8 ***)(lVar13 + 8 + lVar18) = local_118;
          *(undefined8 ***)(lVar13 + 0x18 + lVar18) = ppuVar23;
          *(ulong *)(local_1d0 + 0x30) = (long)ppuVar17 + 1;
          *(long *)(local_1d0 + 0x40) = *(long *)(local_1d0 + 0x40) + 1;
        }
      }
      lVar13 = local_1b0;
      if (((*_DAT_147ff6fa8 < 2) &&
          ((DAT_147fbb2a0 - 1 < 2 ||
           ((DAT_147fbb2a0 != 0 &&
            (cVar11 = func_0x000145d15470(), lVar13 = local_1b0, cVar11 != '\0')))))) &&
         (cVar11 = func_0x000144c46ce0(), lVar13 = local_1b0, cVar11 != '\0')) {
        local_e8 = (undefined8 **)(local_100 + 0x38);
        local_f0 = (undefined8 **)(_DAT_147fbb290 + 0x30);
        local_e0 = (undefined8 **)(local_100 + 0x30);
        local_100 = local_100 + 0x34;
        local_210 = func_0x0001459d28e0();
        local_198 = (undefined8 **)&local_128;
        ppuStack_190 = (undefined8 **)0x145badf80;
        local_188 = local_e0;
        local_180 = (undefined8 **)0x145badf80;
        uStack_178 = local_100;
        local_170 = 0x145badf80;
        local_168 = local_e8;
        local_160 = (undefined8 **)0x145badf80;
        local_158 = (undefined8 **)&local_210;
        local_150 = 0x1405abf50;
        local_208 = 0x145e560c0;
        local_200 = &local_198;
        local_1f8 = &local_208;
        local_1f0 = 0x145e4cf50;
        local_240 = (undefined8 **)0x1;
        local_238 = &local_1f8;
        ppuStack_230 = (undefined8 **)0x1;
        local_228 = local_f0;
        local_20c = extraout_XMM0_Da_02;
        func_0x000144c48500();
        lVar13 = local_1b0;
      }
      goto LAB_14059a15a;
    }
    lVar13 = local_1b0;
    if ((*_DAT_147ff6fa8 < 2) &&
       (((DAT_147fbb288 - 1 < 2 ||
         ((DAT_147fbb288 != 0 &&
          (cVar11 = func_0x000145d15470(), lVar13 = local_1b0, cVar11 != '\0')))) &&
        (cVar11 = func_0x000144c46ce0(), lVar13 = local_1b0, cVar11 != '\0')))) {
      local_180 = (undefined8 **)(_DAT_147fbb278 + 0x30);
      local_240 = (undefined8 **)&local_128;
      local_238 = (undefined8 **)0x145badf80;
      local_208 = 0x145e56108;
      local_200 = &local_240;
      local_1f8 = &local_208;
      local_1f0 = 0x145e4cf50;
      local_198 = (undefined8 **)0x1;
      ppuStack_190 = &local_1f8;
      local_188 = (undefined8 **)0x1;
      func_0x000144c48500();
      lVar13 = local_1b0;
    }
  } while( true );
}
