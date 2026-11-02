/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

ulong entry(uint param_1,undefined8 param_2,undefined8 param_3,long param_4,ulong *param_5)

{
  byte bVar1;
  undefined1 auVar2 [16];
  undefined1 auVar3 [16];
  undefined1 auVar4 [12];
  ulong uVar5;
  uint3 uVar6;
  ulong uVar7;
  ulong uVar8;
  ulong uVar9;
  undefined8 uVar10;
  int iVar11;
  uint uVar12;
  uint uVar13;
  long lVar14;
  uint uVar15;
  undefined8 extraout_XMM0_Qb;
  undefined1 auVar16 [16];
  undefined1 auVar17 [16];
  undefined1 auVar18 [16];
  undefined1 auVar19 [12];
  undefined1 auVar20 [12];
  undefined8 local_358;
  byte local_350;
  undefined7 uStack_34f;
  byte local_347;
  uint local_50;
  char local_4c;
  uint local_44;

  uVar7 = 1;
  if (param_4 == 0) {
    uVar8 = 0;
    goto LAB_145bdbb42;
  }
  bVar1 = (byte)*param_5;
  if ((bVar1 == 0x2d) || (bVar1 == 0x2b)) {
    param_4 = param_4 + -1;
    if (param_4 == 0) {
      uVar8 = 0x100;
      goto LAB_145bdbb42;
    }
    param_5 = (ulong *)((long)param_5 + 1);
  }
  auVar17._0_8_ = func_0x000145bd6bf0(param_5,param_3,param_5,&local_358,param_4);
  auVar17._8_8_ = extraout_XMM0_Qb;
  auVar16._4_12_ = auVar17._4_12_;
  if (local_347 == 2) {
    uVar7 = 1;
    uVar15 = _DAT_145deb064;
    if (param_4 == 3) {
      uVar6 = (uint3)*param_5 & 0xdfdfdf;
      if ((uVar6 == 0x464e49) || (uVar15 = _DAT_145dd2dd0, uVar6 == 0x4e414e)) goto LAB_145bdba57;
    }
    else if ((param_4 == 8) && ((*param_5 & 0xdfdfdfdfdfdfdfdf) == 0x5954494e49464e49)) {
LAB_145bdba57:
      auVar17 = ZEXT416(uVar15);
      if (bVar1 == 0x2d) {
        auVar17._0_4_ = uVar15 ^ _DAT_145dcd0a0;
        auVar17._4_4_ = 0;
        auVar17._8_4_ = uRam0000000145dcd0a8;
        auVar17._12_4_ = uRam0000000145dcd0ac;
      }
      uVar7 = 0;
    }
    param_1 = auVar17._0_4_;
    uVar8 = 0x100;
    goto LAB_145bdbb42;
  }
  uVar7 = CONCAT71(uStack_34f,local_350);
  if ((uVar7 < 0x1000001 && (local_347 & 1) == 0) && 0xffffffffffffffe3 < local_358 - 0x12) {
    if ((long)local_358 < 0xb) {
      if ((long)local_358 < 0) {
        auVar16._0_4_ = (float)(long)uVar7 / *(float *)(local_358 * -4 + 0x147274244);
      }
      else {
        auVar16._0_4_ = (float)(long)uVar7 * *(float *)(local_358 * 4 + 0x147274244);
      }
    }
    else {
      auVar2._8_8_ = 0;
      auVar2._0_8_ = uVar7;
      auVar3._8_8_ = 0;
      auVar3._0_8_ = *(ulong *)(local_358 * 8 + 0x14726d358);
      uVar7 = SUB168(auVar2 * auVar3,0);
      if (!(bool)(~(SUB168(auVar2 * auVar3,8) != 0) & uVar7 < 0x1000001)) {
        auVar19 = func_0x000145bcf0a0();
        iVar11 = auVar19._8_4_;
        uVar15 = (uint)bVar1;
        uVar13 = local_44;
        goto joined_r0x000145bdbab3;
      }
      auVar16._0_4_ = (float)(long)uVar7 * _DAT_147259638;
    }
    auVar18 = auVar16;
    if (bVar1 == 0x2d) {
      auVar18._0_4_ = auVar16._0_4_ ^ _DAT_145dcd0a0;
      auVar18._4_4_ = 0;
      auVar18._8_4_ = auVar16._8_4_ ^ uRam0000000145dcd0a8;
      auVar18._12_4_ = auVar16._12_4_ ^ uRam0000000145dcd0ac;
    }
    param_1 = auVar18._0_4_;
    uVar8 = 0x100;
  }
  else {
    local_44 = (uint)bVar1;
    auVar19 = func_0x000145bcf0a0();
    iVar11 = auVar19._8_4_;
    uVar15 = local_44;
    uVar13 = local_44;
    if ((local_347 & -1 < iVar11) == 0) {
joined_r0x000145bdbab3:
      local_44 = uVar15;
      if (iVar11 < 0) goto LAB_145bdbab5;
    }
    else {
      auVar20 = func_0x000145bcf0a0();
      uVar15 = local_44;
      uVar13 = local_44;
      if (auVar19 != auVar20) {
LAB_145bdbab5:
        local_44 = uVar13;
        func_0x000145bd67d0();
        if ((int)local_50 < -0x144 || local_358 == 0) {
LAB_145bdbade:
          uVar13 = 0;
        }
        else {
          uVar10 = 0xff;
          uVar13 = 0xff;
          iVar11 = 0;
          if ((int)local_50 < 0x136) {
            if (0 < (int)local_50) {
              iVar11 = 0;
              do {
                uVar13 = 0x3c;
                if (local_50 < 0x13) {
                  uVar13 = (uint)*(byte *)((ulong)local_50 + 0x14726d7d0);
                }
                func_0x000145bd1a00();
                if ((int)local_50 < -0x7ff) goto LAB_145bdbade;
                iVar11 = iVar11 + uVar13;
              } while (0 < (int)local_50);
            }
            do {
              if (local_50 == 0) {
                if (4 < local_350) break;
                uVar12 = (local_350 < 2) + 1;
              }
              else {
                uVar12 = 0x3c;
                if (-local_50 < 0x13) {
                  uVar12 = (uint)*(byte *)((ulong)-local_50 + 0x14726d7d0);
                }
              }
              func_0x000145bd17a0();
              uVar13 = (uint)uVar10;
              if (0x7ff < (int)local_50) goto LAB_145bdbaf0;
              iVar11 = iVar11 - uVar12;
            } while ((int)local_50 < 1);
            uVar12 = iVar11 - 1;
            if ((int)uVar12 < -0x7e) {
              uVar10 = 0x3c;
              do {
                uVar13 = -uVar12 - 0x7e;
                if (0x3b < uVar13) {
                  uVar13 = (uint)uVar10;
                }
                func_0x000145bd1a00();
                uVar12 = uVar13 + uVar12;
              } while (uVar12 < 0xffffff82);
            }
            if ((int)(uVar12 + 0x7f) < 0xff) {
              func_0x000145bd17a0();
              uVar13 = 0xff;
              if ((local_358 == 0) || (uVar7 = (ulong)(int)local_50, (long)uVar7 < 0)) {
                auVar20._4_8_ = 0;
                auVar20._0_4_ = uVar12 + 0x7e;
                auVar19 = auVar20 << 0x40;
                local_44 = uVar15;
              }
              else {
                if (local_50 < 0x13) {
                  if (local_50 == 0) {
                    uVar8 = 0;
                  }
                  else {
                    if (local_50 == 1) {
                      uVar8 = 0;
                      uVar9 = 0;
                    }
                    else {
                      uVar8 = 0;
                      uVar5 = 0;
                      do {
                        uVar9 = uVar5;
                        lVar14 = uVar8 * 10;
                        if (uVar9 < local_358) {
                          lVar14 = lVar14 + (ulong)(&local_350)[uVar9];
                        }
                        uVar8 = lVar14 * 10;
                        if (uVar9 + 1 < local_358) {
                          uVar8 = uVar8 + *(byte *)((long)&uStack_34f + uVar9);
                        }
                        uVar5 = uVar9 + 2;
                      } while (uVar9 + 2 != (ulong)(local_50 & 0x1e));
                      if ((uVar7 & 1) == 0) goto LAB_145bdbd03;
                      uVar9 = uVar9 + 2;
                    }
                    uVar8 = uVar8 * 10;
                    if (uVar9 < local_358) {
                      uVar8 = uVar8 + (&local_350)[uVar9];
                    }
                  }
LAB_145bdbd03:
                  if (uVar7 < local_358) {
                    if (uVar7 + 1 == local_358 && (&local_350)[uVar7] == 5) {
                      if ((local_4c != '\0') ||
                         ((local_50 != 0 && ((*(byte *)((long)&local_358 + uVar7 + 7) & 1) != 0))))
                      {
LAB_145bdbd41:
                        uVar8 = uVar8 + 1;
                      }
                    }
                    else if (4 < (&local_350)[uVar7]) goto LAB_145bdbd41;
                  }
                  if (0xffffff < uVar8) goto LAB_145bdbd4c;
                }
                else {
LAB_145bdbd4c:
                  func_0x000145bd1a00();
                  uVar8 = func_0x000145bd1c00();
                  if (0xfe < (int)(uVar12 + 0x80)) goto LAB_145bdbaf0;
                  uVar12 = uVar12 + 1;
                }
                auVar19._4_4_ = 0;
                auVar19._0_4_ = (uint)uVar8 & 0x7fffff;
                auVar19._8_4_ = (0x7f - (uint)(uVar8 < 0x800000)) + uVar12;
                local_44 = uVar15;
              }
            }
            else {
              auVar19 = ZEXT412(0xff) << 0x40;
              local_44 = uVar15;
            }
            goto LAB_145bdbaf2;
          }
        }
LAB_145bdbaf0:
        auVar4._4_8_ = 0;
        auVar4._0_4_ = uVar13;
        auVar19 = auVar4 << 0x40;
        local_44 = uVar15;
      }
    }
LAB_145bdbaf2:
    param_1 = auVar19._0_4_ | auVar19._8_4_ << 0x17;
    if ((char)local_44 == '-') {
      param_1 = param_1 ^ _DAT_145dcd0a0;
    }
    uVar8 = 0;
  }
  uVar7 = 0;
LAB_145bdbb42:
  return (ulong)param_1 << 0x20 | uVar8 | uVar7;
}
