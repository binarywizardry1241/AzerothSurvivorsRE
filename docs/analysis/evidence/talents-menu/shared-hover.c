/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long *param_3)

{
  undefined4 uVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  long lVar5;
  undefined8 uVar6;
  undefined8 uVar7;
  undefined8 uVar8;
  undefined8 uVar9;
  long lVar10;
  ulong uVar11;
  long lVar12;
  ulong uVar13;
  undefined8 *puVar14;
  ulong *puVar15;
  long lVar16;
  char cVar17;
  long lVar18;
  long lVar19;
  undefined8 *puVar20;
  undefined8 *puVar21;
  uint uVar22;
  uint *puVar23;
  uint uVar24;
  undefined4 in_XMM6_Da;
  uint uVar25;
  long local_1c8;
  undefined4 *local_1b8;
  long local_1b0;
  long local_1a8;
  long local_1a0;
  long local_198;
  undefined4 *local_190;
  long local_188;
  char *local_178;
  undefined4 *local_168;
  undefined4 *local_160;
  undefined4 local_158;
  undefined4 uStack_154;
  undefined4 uStack_150;
  undefined4 uStack_14c;
  undefined4 uStack_144;
  undefined4 uStack_140;
  undefined4 uStack_13c;
  undefined4 uStack_138;
  undefined4 local_11c;
  undefined4 uStack_118;
  undefined4 uStack_114;
  undefined4 uStack_110;
  long local_100;
  int local_f8;
  int local_f4;
  uint *local_f0;
  uint *local_e8;
  long local_d0;
  long local_c0;
  long local_b0;
  undefined4 local_a4;
  long local_a0;
  long local_98;
  long local_90;
  long local_80;
  undefined4 local_74;
  char local_70;
  uint local_68;
  uint local_64;
  byte local_60;
  undefined4 local_58;

  lVar5 = *param_3;
  lVar16 = param_3[1];
  local_58 = in_XMM6_Da;
  func_0x000140183810(lVar16,param_2,lVar16,&local_100,lVar5,(int)param_3[2]);
  local_198 = local_c0;
  local_1a0 = local_b0;
  local_1c8 = local_98;
  local_1a8 = local_90;
  local_1b0 = local_80;
  uVar22 = 0xc233b000;
  if ((uint)(local_f4 - local_f8) < 0xc233b000) {
    uVar22 = local_f4 - local_f8;
  }
  uVar11 = (ulong)local_68;
  local_188 = local_a0;
  puVar23 = local_f0;
  uVar25 = _DAT_145dcd0a0;
  do {
    while ((local_60 & 1) == 0) {
      do {
        uVar24 = local_64;
        if (local_64 == (uint)uVar11) {
          if (puVar23 == local_e8) {
            return;
          }
          uVar24 = *puVar23;
          puVar23 = puVar23 + 1;
          if (*(long *)(*(long *)(lVar16 + 0x108) + 0x58 + (ulong)uVar24 * 0xa0) == 0) {
            do {
              if (puVar23 == local_e8) {
                return;
              }
              uVar24 = *puVar23;
              puVar23 = puVar23 + 1;
            } while (*(long *)(*(long *)(lVar16 + 0x108) + 0x58 + (ulong)uVar24 * 0xa0) == 0);
            lVar10 = *(long *)(lVar16 + 0x108) + (ulong)uVar24 * 0xa0;
          }
          else {
            lVar10 = *(long *)(lVar16 + 0x108) + (ulong)uVar24 * 0xa0;
          }
          lVar12 = *(long *)(lVar16 + 0x1a8) + (ulong)*(uint *)(lVar10 + 0x94) * 0x48;
          uVar11 = *(ulong *)(*(long *)(lVar16 + 0x1a8) + 0x40 +
                             (ulong)*(uint *)(lVar10 + 0x94) * 0x48);
          if ((*(ulong *)(lVar5 + 0x110) < uVar11) &&
             (uVar13 = *(ulong *)(*(long *)(lVar12 + 0x38) + *(ulong *)(lVar5 + 0x110) * 8),
             uVar13 != 0)) {
            local_188 = *(long *)(*(long *)(lVar12 + 0x18) + 0x10 + ~uVar13 * 0x30);
            uVar13 = *(ulong *)(lVar5 + 0x118);
            lVar18 = *(long *)(lVar12 + 0x38);
            if (uVar13 < uVar11) goto LAB_140076f83;
LAB_140076f68:
            lVar12 = *(long *)(lVar12 + 0x18);
LAB_140076fc0:
            local_1c8 = 0;
            uVar11 = *(ulong *)(lVar5 + 0x128);
            if (*(ulong *)(lVar10 + 0x88) <= uVar11) goto LAB_140076e20;
LAB_140076fe0:
            if (*(long *)(*(long *)(lVar10 + 0x80) + uVar11 * 8) == 0) goto LAB_140076e20;
            lVar19 = ~*(ulong *)(lVar18 + uVar11 * 8) * 0x30;
            local_1a8 = *(long *)(lVar12 + 0x10 + lVar19);
            local_1b0 = *(long *)(lVar12 + 0x28 + lVar19);
            cVar17 = '\x01';
          }
          else {
            local_188 = 0;
            uVar13 = *(ulong *)(lVar5 + 0x118);
            lVar18 = *(long *)(lVar12 + 0x38);
            if (uVar11 <= uVar13) goto LAB_140076f68;
LAB_140076f83:
            uVar11 = *(ulong *)(lVar18 + uVar13 * 8);
            lVar12 = *(long *)(lVar12 + 0x18);
            if (uVar11 == 0) goto LAB_140076fc0;
            local_1c8 = *(long *)(lVar12 + 0x10 + ~uVar11 * 0x30);
            uVar11 = *(ulong *)(lVar5 + 0x128);
            if (uVar11 < *(ulong *)(lVar10 + 0x88)) goto LAB_140076fe0;
LAB_140076e20:
            cVar17 = '\0';
          }
          uVar24 = 0;
          lVar18 = ~*(ulong *)(lVar18 + *(long *)(lVar5 + 0x120) * 8) * 0x30;
          local_198 = *(long *)(lVar12 + 0x10 + lVar18);
          local_1a0 = *(long *)(lVar12 + 0x28 + lVar18);
          local_100 = func_0x000144e4f270();
          local_d0 = *(long *)(lVar10 + 0x50);
          uVar11 = *(ulong *)(lVar10 + 0x58);
          local_70 = cVar17;
        }
        local_64 = uVar24 + 1;
        uVar13 = (ulong)~*(uint *)(local_d0 + 8 + (ulong)uVar24 * 0x10);
      } while (uVar22 <= (uint)(local_f4 - *(int *)(local_100 + uVar13 * 4)));
      local_178 = (char *)(uVar13 + local_188);
      puVar20 = (undefined8 *)(uVar13 * 0x2c + local_1c8);
      puVar21 = (undefined8 *)(uVar13 * 0x50 + local_198);
      local_190 = (undefined4 *)(local_1a0 + uVar13 * 4);
      local_1b8 = local_168;
      if (local_70 != '\x01') goto LAB_140077210;
      local_1b8 = (undefined4 *)(local_1b0 + uVar13 * 4);
      puVar14 = (undefined8 *)(uVar13 * 0x20 + local_1a8);
      local_70 = '\x01';
      cVar17 = *local_178;
      local_168 = local_1b8;
joined_r0x000140077223:
      if (cVar17 != '\x02') goto LAB_14007712b;
LAB_140077229:
      uVar1 = *(undefined4 *)(puVar20 + 2);
      uVar6 = *puVar20;
      uVar7 = puVar20[1];
      uVar2 = *(undefined4 *)(puVar20 + 2);
      uStack_144 = (undefined4)*puVar20;
      uStack_140 = (undefined4)((ulong)*puVar20 >> 0x20);
      uStack_13c = (undefined4)puVar20[1];
      uStack_138 = (undefined4)((ulong)puVar20[1] >> 0x20);
      uVar3 = *(undefined4 *)(puVar20 + 2);
      uVar8 = *puVar20;
      uVar9 = puVar20[1];
      uVar4 = *(undefined4 *)(puVar20 + 2);
      local_11c = (undefined4)*puVar20;
      uStack_118 = (undefined4)((ulong)*puVar20 >> 0x20);
      uStack_114 = (undefined4)puVar20[1];
      uStack_110 = (undefined4)((ulong)puVar20[1] >> 0x20);
      *local_190 = local_a4;
      puVar21[8] = CONCAT44(uStack_114,uStack_118);
      puVar21[9] = CONCAT44(uVar4,uStack_110);
      puVar21[6] = uVar9;
      puVar21[7] = CONCAT44(local_11c,uVar3);
      puVar21[4] = CONCAT44(uVar2,uStack_138);
      puVar21[5] = uVar8;
      puVar21[2] = CONCAT44(uStack_144,uVar1);
      puVar21[3] = CONCAT44(uStack_13c,uStack_140);
      *puVar21 = uVar6;
      puVar21[1] = uVar7;
      uVar24 = 0;
      if (puVar14 != (undefined8 *)0x0) {
LAB_1400772da:
        *local_1b8 = local_74;
        *puVar14 = 1;
        *(undefined4 *)(puVar14 + 1) = 1;
        *(uint *)((long)puVar14 + 0xc) = uVar24;
      }
    }
    do {
      uVar24 = local_64;
      if (local_64 == (uint)uVar11) {
        if (puVar23 == local_e8) {
          return;
        }
        uVar11 = (ulong)*puVar23;
        puVar23 = puVar23 + 1;
        lVar10 = *(long *)(lVar16 + 0x1a8);
        if (*(long *)(lVar10 + 0x10 + uVar11 * 0x48) == 0) {
          do {
            if (puVar23 == local_e8) {
              return;
            }
            uVar24 = *puVar23;
            puVar23 = puVar23 + 1;
          } while (*(long *)(*(long *)(lVar16 + 0x1a8) + 0x10 + (ulong)uVar24 * 0x48) == 0);
          lVar12 = *(long *)(lVar16 + 0x1a8) + (ulong)uVar24 * 0x48;
          puVar15 = (ulong *)(lVar12 + 0x10);
          uVar11 = *(ulong *)(lVar5 + 0x110);
          uVar13 = *(ulong *)(lVar12 + 0x40);
          if (uVar11 < uVar13) goto LAB_140076d2b;
LAB_140076d70:
          local_188 = 0;
          uVar11 = *(ulong *)(lVar5 + 0x118);
          lVar10 = *(long *)(lVar12 + 0x38);
          if (uVar13 <= uVar11) goto LAB_140076d5c;
LAB_140076d82:
          uVar11 = *(ulong *)(lVar10 + uVar11 * 8);
          lVar12 = *(long *)(lVar12 + 0x18);
          if (uVar11 == 0) goto LAB_140076dc0;
          local_1c8 = *(long *)(lVar12 + 0x10 + ~uVar11 * 0x30);
          uVar11 = *(ulong *)(lVar5 + 0x128);
          if (uVar11 < uVar13) goto LAB_140076ddc;
LAB_140076c30:
          cVar17 = '\0';
        }
        else {
          lVar12 = lVar10 + uVar11 * 0x48;
          puVar15 = (ulong *)(lVar10 + uVar11 * 0x48 + 0x10);
          uVar11 = *(ulong *)(lVar5 + 0x110);
          uVar13 = *(ulong *)(lVar12 + 0x40);
          if (uVar13 <= uVar11) goto LAB_140076d70;
LAB_140076d2b:
          uVar11 = *(ulong *)(*(long *)(lVar12 + 0x38) + uVar11 * 8);
          if (uVar11 == 0) goto LAB_140076d70;
          local_188 = *(long *)(*(long *)(lVar12 + 0x18) + 0x10 + ~uVar11 * 0x30);
          uVar11 = *(ulong *)(lVar5 + 0x118);
          lVar10 = *(long *)(lVar12 + 0x38);
          if (uVar11 < uVar13) goto LAB_140076d82;
LAB_140076d5c:
          lVar12 = *(long *)(lVar12 + 0x18);
LAB_140076dc0:
          local_1c8 = 0;
          uVar11 = *(ulong *)(lVar5 + 0x128);
          if (uVar13 <= uVar11) goto LAB_140076c30;
LAB_140076ddc:
          uVar11 = *(ulong *)(lVar10 + uVar11 * 8);
          if (uVar11 == 0) goto LAB_140076c30;
          lVar18 = ~uVar11 * 0x30;
          local_1a8 = *(long *)(lVar12 + 0x10 + lVar18);
          local_1b0 = *(long *)(lVar12 + 0x28 + lVar18);
          cVar17 = '\x01';
        }
        uVar24 = 0;
        lVar10 = ~*(ulong *)(lVar10 + *(long *)(lVar5 + 0x120) * 8) * 0x30;
        local_198 = *(long *)(lVar12 + 0x10 + lVar10);
        local_1a0 = *(long *)(lVar12 + 0x28 + lVar10);
        local_100 = func_0x000144e4f270();
        uVar11 = *puVar15;
        local_70 = cVar17;
      }
      uVar13 = (ulong)uVar24;
      local_64 = uVar24 + 1;
    } while (uVar22 <= (uint)(local_f4 - *(int *)(local_100 + uVar13 * 4)));
    local_178 = (char *)(uVar13 + local_188);
    puVar20 = (undefined8 *)(uVar13 * 0x2c + local_1c8);
    puVar21 = (undefined8 *)(uVar13 * 0x50 + local_198);
    local_190 = (undefined4 *)(local_1a0 + uVar13 * 4);
    local_1b8 = local_160;
    if (local_70 != '\x01') {
LAB_140077210:
      local_70 = '\0';
      puVar14 = (undefined8 *)0x0;
      cVar17 = *local_178;
      goto joined_r0x000140077223;
    }
    local_1b8 = (undefined4 *)(local_1b0 + uVar13 * 4);
    puVar14 = (undefined8 *)(uVar13 * 0x20 + local_1a8);
    local_70 = '\x01';
    local_160 = local_1b8;
    if (*local_178 == '\x02') goto LAB_140077229;
LAB_14007712b:
    uVar1 = *(undefined4 *)((long)puVar20 + 0x24);
    uVar6 = *(undefined8 *)((long)puVar20 + 0x14);
    uVar7 = *(undefined8 *)((long)puVar20 + 0x1c);
    uVar2 = *(undefined4 *)((long)puVar20 + 0x24);
    uStack_144 = (undefined4)*(undefined8 *)((long)puVar20 + 0x14);
    uStack_140 = (undefined4)((ulong)*(undefined8 *)((long)puVar20 + 0x14) >> 0x20);
    uStack_13c = (undefined4)*(undefined8 *)((long)puVar20 + 0x1c);
    uStack_138 = (undefined4)((ulong)*(undefined8 *)((long)puVar20 + 0x1c) >> 0x20);
    uVar3 = *(undefined4 *)((long)puVar20 + 0x24);
    uVar8 = *(undefined8 *)((long)puVar20 + 0x14);
    uVar9 = *(undefined8 *)((long)puVar20 + 0x1c);
    uVar4 = *(undefined4 *)((long)puVar20 + 0x24);
    local_11c = (undefined4)*(undefined8 *)((long)puVar20 + 0x14);
    uStack_118 = (undefined4)((ulong)*(undefined8 *)((long)puVar20 + 0x14) >> 0x20);
    uStack_114 = (undefined4)*(undefined8 *)((long)puVar20 + 0x1c);
    uStack_110 = (undefined4)((ulong)*(undefined8 *)((long)puVar20 + 0x1c) >> 0x20);
    *local_190 = local_a4;
    puVar21[8] = CONCAT44(uStack_114,uStack_118);
    puVar21[9] = CONCAT44(uVar4,uStack_110);
    local_158 = (undefined4)uVar6;
    uStack_154 = (undefined4)((ulong)uVar6 >> 0x20);
    uStack_150 = (undefined4)uVar7;
    uStack_14c = (undefined4)((ulong)uVar7 >> 0x20);
    puVar21[6] = uVar9;
    puVar21[7] = CONCAT44(local_11c,uVar3);
    puVar21[4] = CONCAT44(uVar2,uStack_138);
    puVar21[5] = uVar8;
    puVar21[2] = CONCAT44(uStack_144,uVar1);
    puVar21[3] = CONCAT44(uStack_13c,uStack_140);
    *(undefined4 *)puVar21 = local_158;
    *(undefined4 *)((long)puVar21 + 4) = uStack_154;
    *(undefined4 *)(puVar21 + 1) = uStack_150;
    *(undefined4 *)((long)puVar21 + 0xc) = uStack_14c;
  } while (puVar14 == (undefined8 *)0x0);
  uVar24 = *(uint *)(puVar20 + 5) ^ uVar25;
  goto LAB_1400772da;
}
