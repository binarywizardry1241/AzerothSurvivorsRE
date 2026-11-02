uint * FUN_145c8e500(uint *param_1,longlong *param_2)

{
  float fVar1;
  uint uVar2;
  uint uVar3;
  uint uVar4;
  uint uVar5;
  uint uVar6;
  uint uVar7;
  undefined4 *puVar8;
  longlong lVar9;
  undefined8 uVar10;
  longlong lVar11;
  uint *puVar12;
  uint *puVar13;
  byte bVar14;
  uint uVar15;
  ulonglong uVar16;
  uint uVar17;
  uint uVar18;
  float fVar19;
  longlong lStack_1e0;
  undefined8 uStack_1d8;
  undefined8 uStack_1d0;
  uint uStack_1c8;
  uint uStack_1c4;
  uint uStack_1c0;
  uint uStack_1bc;
  uint uStack_1b8;
  uint uStack_1b4;
  uint uStack_1b0;
  uint uStack_1ac;
  uint uStack_1a8;
  uint uStack_1a4;
  uint uStack_1a0;
  uint uStack_19c;
  uint uStack_198;
  uint uStack_194;
  uint uStack_190;
  uint uStack_18c;
  uint uStack_188;
  uint uStack_184;
  uint uStack_180;
  uint uStack_17c;
  uint uStack_178;
  uint uStack_174;
  uint uStack_170;
  uint uStack_16c;
  uint uStack_168;
  uint uStack_164;
  uint uStack_160;
  uint uStack_15c;
  uint uStack_158;
  uint uStack_154;
  uint uStack_150;
  uint uStack_14c;
  uint uStack_148;
  uint uStack_144;
  uint uStack_140;
  uint uStack_13c;
  longlong lStack_138;
  longlong lStack_130;
  longlong lStack_128;
  undefined8 uStack_120;
  ulonglong uStack_118;
  longlong lStack_110;
  longlong lStack_108;
  longlong lStack_100;
  longlong lStack_f8;
  uint *puStack_f0;
  longlong lStack_e8;
  longlong lStack_e0;
  longlong lStack_d8;
  uint uStack_cc;
  longlong lStack_c8;
  ulonglong uStack_c0;
  ulonglong uStack_b8;
  uint uStack_ac;
  uint uStack_a8;
  uint uStack_a4;
  uint uStack_a0;
  uint uStack_9c;
  uint uStack_98;
  uint uStack_94;
  undefined8 uStack_90;

  uStack_90 = 0xfffffffffffffffe;
  puVar12 = (uint *)*param_2;
  uVar16 = param_2[1];
  if (uVar16 < 4) {
LAB_145c8e58d:
    *param_2 = (longlong)puVar12 + uVar16;
    param_2[1] = 0;
    *(undefined **)param_1 = &DAT_1475fb400;
    param_1[2] = 0xfffffffe;
    param_1[3] = 0xffffffff;
    return param_1;
  }
  uVar2 = *puVar12;
  *param_2 = (longlong)(puVar12 + 1);
  param_2[1] = uVar16 - 4;
  if ((int)uVar2 < 0) {
    *param_1 = uVar2 & 0x7fffffff;
    param_1[2] = 0xffffffff;
    param_1[3] = 0xffffffff;
    return param_1;
  }
  if (uVar16 - 4 < 4) goto LAB_145c8e58d;
  uVar3 = puVar12[1];
  *param_2 = (longlong)(puVar12 + 2);
  param_2[1] = uVar16 - 8;
  if (uVar16 - 8 < 4) goto LAB_145c8e58d;
  uVar4 = puVar12[2];
  *param_2 = (longlong)(puVar12 + 3);
  param_2[1] = uVar16 - 0xc;
  FUN_145cc58f0(&lStack_1e0,param_2);
  uVar10 = uStack_1d0;
  lStack_e0 = lStack_1e0;
  if (lStack_1e0 == -1) {
    *(undefined8 *)param_1 = uStack_1d8;
    param_1[2] = 0xfffffffe;
    param_1[3] = 0xffffffff;
    return param_1;
  }
  uStack_120 = uStack_1d8;
  uVar17 = 0;
  while (uVar17 < 3) {
    FUN_145cc58f0(&lStack_1e0,param_2);
    uVar17 = uVar17 + 1;
    if (lStack_1e0 != 0) {
      if (lStack_1e0 == -1) {
        *(undefined8 *)param_1 = uStack_1d8;
        goto LAB_145c8e918;
      }
      func_0x0001400021d0(uStack_1d8,lStack_1e0,1);
    }
  }
  puVar12 = (uint *)*param_2;
  uVar16 = param_2[1];
  if (3 < uVar16) {
    uVar17 = *puVar12;
    *param_2 = (longlong)(puVar12 + 1);
    param_2[1] = uVar16 - 4;
    if (3 < uVar16 - 4) {
      uVar5 = puVar12[1];
      *param_2 = (longlong)(puVar12 + 2);
      param_2[1] = uVar16 - 8;
      if (3 < uVar16 - 8) {
        uVar15 = puVar12[2];
        *param_2 = (longlong)(puVar12 + 3);
        param_2[1] = uVar16 - 0xc;
        if (3 < uVar16 - 0xc) {
          uVar18 = puVar12[3];
          *param_2 = (longlong)(puVar12 + 4);
          param_2[1] = uVar16 - 0x10;
          if (3 < uVar16 - 0x10) {
            uVar6 = puVar12[4];
            *param_2 = (longlong)(puVar12 + 5);
            param_2[1] = uVar16 - 0x14;
            if (3 < uVar16 - 0x14) {
              uStack_1c8 = puVar12[5];
              *param_2 = (longlong)(puVar12 + 6);
              param_2[1] = uVar16 - 0x18;
              uStack_1c4 = uVar17;
              if (3 < uVar16 - 0x18) {
                uVar17 = puVar12[6];
                *param_2 = (longlong)(puVar12 + 7);
                param_2[1] = uVar16 - 0x1c;
                if (3 < uVar16 - 0x1c) {
                  uStack_1c0 = puVar12[7];
                  *param_2 = (longlong)(puVar12 + 8);
                  param_2[1] = uVar16 - 0x20;
                  uStack_1bc = uVar17;
                  if (3 < uVar16 - 0x20) {
                    uVar17 = puVar12[8];
                    *param_2 = (longlong)(puVar12 + 9);
                    param_2[1] = uVar16 - 0x24;
                    uStack_1b8 = uVar5;
                    uStack_1b4 = uVar15;
                    uStack_1b0 = uVar18;
                    uStack_1ac = uVar6;
                    if (3 < uVar16 - 0x24) {
                      uStack_1a8 = puVar12[9];
                      *param_2 = (longlong)(puVar12 + 10);
                      param_2[1] = uVar16 - 0x28;
                      if (3 < uVar16 - 0x28) {
                        uStack_1a4 = puVar12[10];
                        *param_2 = (longlong)(puVar12 + 0xb);
                        param_2[1] = uVar16 - 0x2c;
                        if (3 < uVar16 - 0x2c) {
                          uStack_1a0 = puVar12[0xb];
                          *param_2 = (longlong)(puVar12 + 0xc);
                          param_2[1] = uVar16 - 0x30;
                          if (3 < uVar16 - 0x30) {
                            uStack_19c = puVar12[0xc];
                            *param_2 = (longlong)(puVar12 + 0xd);
                            param_2[1] = uVar16 - 0x34;
                            if (3 < uVar16 - 0x34) {
                              uStack_198 = puVar12[0xd];
                              *param_2 = (longlong)(puVar12 + 0xe);
                              param_2[1] = uVar16 - 0x38;
                              if (3 < uVar16 - 0x38) {
                                uStack_194 = puVar12[0xe];
                                *param_2 = (longlong)(puVar12 + 0xf);
                                param_2[1] = uVar16 - 0x3c;
                                if (3 < uVar16 - 0x3c) {
                                  uStack_190 = puVar12[0xf];
                                  *param_2 = (longlong)(puVar12 + 0x10);
                                  param_2[1] = uVar16 - 0x40;
                                  if (3 < uVar16 - 0x40) {
                                    uStack_18c = puVar12[0x10];
                                    *param_2 = (longlong)(puVar12 + 0x11);
                                    param_2[1] = uVar16 - 0x44;
                                    if (3 < uVar16 - 0x44) {
                                      uStack_188 = puVar12[0x11];
                                      *param_2 = (longlong)(puVar12 + 0x12);
                                      param_2[1] = uVar16 - 0x48;
                                      if (3 < uVar16 - 0x48) {
                                        uStack_184 = puVar12[0x12];
                                        *param_2 = (longlong)(puVar12 + 0x13);
                                        param_2[1] = uVar16 - 0x4c;
                                        if (3 < uVar16 - 0x4c) {
                                          uStack_180 = puVar12[0x13];
                                          *param_2 = (longlong)(puVar12 + 0x14);
                                          param_2[1] = uVar16 - 0x50;
                                          lStack_138 = 0;
                                          lStack_130 = 4;
                                          uStack_b8 = 0;
                                          lVar11 = 4;
                                          lStack_c8 = 0;
                                          do {
                                            lStack_128 = lStack_c8;
                                            puVar12 = (uint *)*param_2;
                                            uVar16 = param_2[1];
                                            do {
                                              if (9 < (uint)uStack_b8) {
                                                puVar12 = (uint *)*param_2;
                                                uVar16 = param_2[1];
                                                if (3 < uVar16) {
                                                  uVar5 = *puVar12;
                                                  *param_2 = (longlong)(puVar12 + 1);
                                                  param_2[1] = uVar16 - 4;
                                                  if (3 < uVar16 - 4) {
                                                    fVar1 = (float)puVar12[1];
                                                    *param_2 = (longlong)(puVar12 + 2);
                                                    param_2[1] = uVar16 - 8;
                                                    if (3 < uVar16 - 8) {
                                                      lStack_c8 = CONCAT44(lStack_c8._4_4_,
                                                                           puVar12[2]);
                                                      *param_2 = (longlong)(puVar12 + 3);
                                                      param_2[1] = uVar16 - 0xc;
                                                      lStack_f8 = 0;
                                                      puStack_f0 = (uint *)&DAT_00000004;
                                                      lStack_e8 = 0;
                                                      if (fVar1 <= 0.0) {
                                                        puVar12 = (uint *)&DAT_00000004;
                                                        uVar15 = 0;
                                                        goto LAB_145c8eb61;
                                                      }
                                                      FUN_145fc4c00(&lStack_f8);
                                                      *puStack_f0 = uVar5;
                                                      puStack_f0[1] = (uint)fVar1;
                                                      puStack_f0[2] = (uint)lStack_c8;
                                                      uStack_b8 = uStack_b8 & 0xffffffff00000000;
                                                      lStack_e8 = 1;
                                                      puVar12 = puStack_f0;
                                                      goto LAB_145c8eb51;
                                                    }
                                                  }
                                                }
                                                *param_2 = (longlong)puVar12 + uVar16;
LAB_145c8ea8c:
                                                param_2[1] = 0;
                                                *(undefined **)param_1 = &DAT_1475fb400;
                                                param_1[2] = 0xfffffffe;
                                                param_1[3] = 0xffffffff;
                                                goto LAB_145c8eaa6;
                                              }
                                              if (uVar16 < 4) {
LAB_145c8ea3e:
                                                *param_2 = (longlong)puVar12 + uVar16;
                                                goto LAB_145c8ea8c;
                                              }
                                              uStack_9c = *puVar12;
                                              *param_2 = (longlong)(puVar12 + 1);
                                              param_2[1] = uVar16 - 4;
                                              if (uVar16 - 4 < 4) goto LAB_145c8ea3e;
                                              uVar5 = puVar12[1];
                                              puVar12 = puVar12 + 2;
                                              *param_2 = (longlong)puVar12;
                                              uVar16 = uVar16 - 8;
                                              param_2[1] = uVar16;
                                              uStack_b8 = (ulonglong)((uint)uStack_b8 + 1);
                                            } while (uVar5 == 0 && uStack_9c == 0);
                                            if (lStack_c8 == lStack_138) {
                                              FUN_145fc4810(&lStack_138);
                                              lVar11 = lStack_130;
                                            }
                                            *(uint *)(lVar11 + lStack_c8 * 8) = uStack_9c;
                                            *(uint *)(lVar11 + 4 + lStack_c8 * 8) = uVar5;
                                            lStack_c8 = lStack_c8 + 1;
                                          } while( true );
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  *param_2 = (longlong)puVar12 + uVar16;
  param_2[1] = 0;
  *(undefined **)param_1 = &DAT_1475fb400;
LAB_145c8e918:
  param_1[2] = 0xfffffffe;
  param_1[3] = 0xffffffff;
  goto LAB_145c8e920;
LAB_145c8eb51:
  uVar15 = (uint)uStack_b8;
LAB_145c8eb61:
  lVar11 = lStack_e8;
  if (3 < uVar15) goto LAB_145c8edc4;
  puVar13 = (uint *)*param_2;
  uVar16 = param_2[1];
  if (3 < uVar16) {
    uVar18 = *puVar13;
    *param_2 = (longlong)(puVar13 + 1);
    param_2[1] = uVar16 - 4;
    if (uVar16 - 4 < 4) goto LAB_145c8edb9;
    fVar19 = (float)puVar13[1];
    *param_2 = (longlong)(puVar13 + 2);
    param_2[1] = uVar16 - 8;
    if (uVar16 - 8 < 4) goto LAB_145c8edb9;
    uStack_b8 = CONCAT44(uStack_b8._4_4_,uVar15 + 1);
    uStack_9c = puVar13[2];
    *param_2 = (longlong)(puVar13 + 3);
    param_2[1] = uVar16 - 0xc;
    if (0.0 < fVar19) goto LAB_145c8ed72;
    if (uVar15 == 3) goto LAB_145c8edc4;
    puVar13 = (uint *)*param_2;
    uVar16 = param_2[1];
    if (uVar16 < 4) goto LAB_145c8edb9;
    uVar18 = *puVar13;
    *param_2 = (longlong)(puVar13 + 1);
    param_2[1] = uVar16 - 4;
    if (uVar16 - 4 < 4) goto LAB_145c8edb9;
    fVar19 = (float)puVar13[1];
    *param_2 = (longlong)(puVar13 + 2);
    param_2[1] = uVar16 - 8;
    if (uVar16 - 8 < 4) goto LAB_145c8edb9;
    uStack_b8 = CONCAT44(uStack_b8._4_4_,uVar15 + 2);
    uStack_9c = puVar13[2];
    *param_2 = (longlong)(puVar13 + 3);
    param_2[1] = uVar16 - 0xc;
    if (0.0 < fVar19) goto LAB_145c8ed72;
    if (1 < uVar15) goto LAB_145c8edc4;
    puVar13 = (uint *)*param_2;
    uVar16 = param_2[1];
    if (uVar16 < 4) goto LAB_145c8edb9;
    uVar18 = *puVar13;
    *param_2 = (longlong)(puVar13 + 1);
    param_2[1] = uVar16 - 4;
    if (uVar16 - 4 < 4) goto LAB_145c8edb9;
    fVar19 = (float)puVar13[1];
    *param_2 = (longlong)(puVar13 + 2);
    param_2[1] = uVar16 - 8;
    if (uVar16 - 8 < 4) goto LAB_145c8edb9;
    uStack_b8 = CONCAT44(uStack_b8._4_4_,uVar15 + 3);
    uStack_9c = puVar13[2];
    *param_2 = (longlong)(puVar13 + 3);
    param_2[1] = uVar16 - 0xc;
    if (0.0 < fVar19) {
LAB_145c8ed72:
      if (lStack_e8 == lStack_f8) {
        FUN_145fc4c00(&lStack_f8);
        puVar12 = puStack_f0;
      }
      puVar12[lVar11 * 3] = uVar18;
      puVar12[lVar11 * 3 + 1] = (uint)fVar19;
      puVar12[lVar11 * 3 + 2] = uStack_9c;
      lStack_e8 = lVar11 + 1;
      goto LAB_145c8eb51;
    }
    if (uVar15 != 0) goto LAB_145c8edc4;
    puVar13 = (uint *)*param_2;
    uVar16 = param_2[1];
    if (3 < uVar16) {
      uVar18 = *puVar13;
      *param_2 = (longlong)(puVar13 + 1);
      param_2[1] = uVar16 - 4;
      if (uVar16 - 4 < 4) goto LAB_145c8edb9;
      fVar19 = (float)puVar13[1];
      *param_2 = (longlong)(puVar13 + 2);
      param_2[1] = uVar16 - 8;
      if (3 < uVar16 - 8) {
        uStack_9c = puVar13[2];
        *param_2 = (longlong)(puVar13 + 3);
        param_2[1] = uVar16 - 0xc;
        uStack_b8 = CONCAT44(uStack_b8._4_4_,4);
        if (0.0 < fVar19) goto LAB_145c8ed72;
        goto LAB_145c8edc4;
      }
    }
  }
LAB_145c8edb9:
  *param_2 = uVar16 + (longlong)puVar13;
  goto LAB_145c8eef5;
LAB_145c8edc4:
  puVar8 = (undefined4 *)*param_2;
  uVar16 = param_2[1];
  if (uVar16 < 4) {
LAB_145c8eeef:
    *param_2 = (longlong)puVar8 + uVar16;
LAB_145c8eef5:
    param_2[1] = 0;
    *(undefined **)param_1 = &DAT_1475fb400;
    param_1[2] = 0xfffffffe;
    param_1[3] = 0xffffffff;
  }
  else {
    uStack_b8 = CONCAT44(uStack_b8._4_4_,*puVar8);
    *param_2 = (longlong)(puVar8 + 1);
    param_2[1] = uVar16 - 4;
    if (uVar16 - 4 < 4) goto LAB_145c8eeef;
    uStack_9c = puVar8[1];
    *param_2 = (longlong)(puVar8 + 2);
    param_2[1] = uVar16 - 8;
    if (uVar16 - 8 < 4) goto LAB_145c8eeef;
    uStack_17c = puVar8[2];
    *param_2 = (longlong)(puVar8 + 3);
    param_2[1] = uVar16 - 0xc;
    if (uVar16 - 0xc < 4) goto LAB_145c8eeef;
    uStack_178 = puVar8[3];
    *param_2 = (longlong)(puVar8 + 4);
    param_2[1] = uVar16 - 0x10;
    if (uVar16 - 0x10 < 4) goto LAB_145c8eeef;
    uStack_174 = puVar8[4];
    *param_2 = (longlong)(puVar8 + 5);
    param_2[1] = uVar16 - 0x14;
    if (uVar16 - 0x14 < 4) goto LAB_145c8eeef;
    uStack_170 = puVar8[5];
    *param_2 = (longlong)(puVar8 + 6);
    param_2[1] = uVar16 - 0x18;
    if (uVar16 - 0x18 < 4) goto LAB_145c8eeef;
    uStack_16c = puVar8[6];
    *param_2 = (longlong)(puVar8 + 7);
    param_2[1] = uVar16 - 0x1c;
    if (uVar16 - 0x1c < 4) goto LAB_145c8eeef;
    uStack_168 = puVar8[7];
    *param_2 = (longlong)(puVar8 + 8);
    param_2[1] = uVar16 - 0x20;
    if (uVar16 - 0x20 < 4) goto LAB_145c8eeef;
    uStack_164 = puVar8[8];
    *param_2 = (longlong)(puVar8 + 9);
    param_2[1] = uVar16 - 0x24;
    if (uVar16 - 0x24 < 4) goto LAB_145c8eeef;
    uVar15 = puVar8[9];
    *param_2 = (longlong)(puVar8 + 10);
    param_2[1] = uVar16 - 0x28;
    lStack_110 = 0;
    lStack_108 = 4;
    uStack_118 = 0;
    lVar11 = 4;
    lStack_d8 = 0;
    uStack_cc = 0;
    uStack_c0 = 0;
LAB_145c8f034:
    bVar14 = (byte)uStack_c0;
    lStack_100 = lStack_d8;
    if (bVar14 < 5) {
      puVar12 = (uint *)*param_2;
      uVar16 = param_2[1];
      if (3 < uVar16) {
        uStack_94 = *puVar12;
        *param_2 = (longlong)(puVar12 + 1);
        param_2[1] = uVar16 - 4;
        if (uVar16 - 4 < 4) goto LAB_145c8f5b1;
        uVar18 = puVar12[1];
        *param_2 = (longlong)(puVar12 + 2);
        param_2[1] = uVar16 - 8;
        if (uVar16 - 8 < 4) goto LAB_145c8f5b1;
        uStack_ac = puVar12[2];
        *param_2 = (longlong)(puVar12 + 3);
        param_2[1] = uVar16 - 0xc;
        if (uVar16 - 0xc < 4) goto LAB_145c8f5b1;
        uStack_a8 = puVar12[3];
        *param_2 = (longlong)(puVar12 + 4);
        param_2[1] = uVar16 - 0x10;
        if (uVar16 - 0x10 < 4) goto LAB_145c8f5b1;
        uStack_a4 = puVar12[4];
        *param_2 = (longlong)(puVar12 + 5);
        param_2[1] = uVar16 - 0x14;
        if (uVar16 - 0x14 < 4) goto LAB_145c8f5b1;
        uVar6 = (uint)uStack_c0;
        uStack_98 = uVar6 + 1;
        uStack_a0 = puVar12[5];
        *param_2 = (longlong)(puVar12 + 6);
        param_2[1] = uVar16 - 0x18;
        uStack_118 = uStack_118 & 0xffffffff;
        if (bVar14 == 0) {
          uStack_118 = (ulonglong)uStack_ac;
        }
        if (uStack_94 != 0) {
          uVar16 = (ulonglong)uStack_98;
          uStack_98 = uVar6;
          goto LAB_145c8f55e;
        }
        if (bVar14 == 4) goto LAB_145c8f600;
        puVar12 = (uint *)*param_2;
        uVar16 = param_2[1];
        if (uVar16 < 4) goto LAB_145c8f5b1;
        uStack_94 = *puVar12;
        *param_2 = (longlong)(puVar12 + 1);
        param_2[1] = uVar16 - 4;
        if (uVar16 - 4 < 4) goto LAB_145c8f5b1;
        uVar18 = puVar12[1];
        *param_2 = (longlong)(puVar12 + 2);
        param_2[1] = uVar16 - 8;
        if (uVar16 - 8 < 4) goto LAB_145c8f5b1;
        uStack_ac = puVar12[2];
        *param_2 = (longlong)(puVar12 + 3);
        param_2[1] = uVar16 - 0xc;
        if (uVar16 - 0xc < 4) goto LAB_145c8f5b1;
        uStack_a8 = puVar12[3];
        *param_2 = (longlong)(puVar12 + 4);
        param_2[1] = uVar16 - 0x10;
        if (uVar16 - 0x10 < 4) goto LAB_145c8f5b1;
        uStack_a4 = puVar12[4];
        *param_2 = (longlong)(puVar12 + 5);
        param_2[1] = uVar16 - 0x14;
        if (uVar16 - 0x14 < 4) goto LAB_145c8f5b1;
        uStack_a0 = puVar12[5];
        *param_2 = (longlong)(puVar12 + 6);
        param_2[1] = uVar16 - 0x18;
        uVar16 = (ulonglong)(uVar6 + 2);
        if (uStack_94 != 0) goto LAB_145c8f55e;
        if (2 < bVar14) goto LAB_145c8f600;
        puVar12 = (uint *)*param_2;
        uVar16 = param_2[1];
        if (uVar16 < 4) goto LAB_145c8f5b1;
        uStack_94 = *puVar12;
        *param_2 = (longlong)(puVar12 + 1);
        param_2[1] = uVar16 - 4;
        if (uVar16 - 4 < 4) goto LAB_145c8f5b1;
        uVar18 = puVar12[1];
        *param_2 = (longlong)(puVar12 + 2);
        param_2[1] = uVar16 - 8;
        if (uVar16 - 8 < 4) goto LAB_145c8f5b1;
        uStack_ac = puVar12[2];
        *param_2 = (longlong)(puVar12 + 3);
        param_2[1] = uVar16 - 0xc;
        if (uVar16 - 0xc < 4) goto LAB_145c8f5b1;
        uStack_a8 = puVar12[3];
        *param_2 = (longlong)(puVar12 + 4);
        param_2[1] = uVar16 - 0x10;
        if (uVar16 - 0x10 < 4) goto LAB_145c8f5b1;
        uStack_a4 = puVar12[4];
        *param_2 = (longlong)(puVar12 + 5);
        param_2[1] = uVar16 - 0x14;
        if (uVar16 - 0x14 < 4) goto LAB_145c8f5b1;
        uStack_a0 = puVar12[5];
        *param_2 = (longlong)(puVar12 + 6);
        param_2[1] = uVar16 - 0x18;
        if (uStack_94 != 0) {
          uVar16 = (ulonglong)(uVar6 + 3);
          uStack_98 = uVar6 + 2;
          goto LAB_145c8f55e;
        }
        if (bVar14 == 2) goto LAB_145c8f600;
        puVar12 = (uint *)*param_2;
        uVar16 = param_2[1];
        if (uVar16 < 4) goto LAB_145c8f5b1;
        uStack_94 = *puVar12;
        *param_2 = (longlong)(puVar12 + 1);
        param_2[1] = uVar16 - 4;
        if (uVar16 - 4 < 4) goto LAB_145c8f5b1;
        uVar18 = puVar12[1];
        *param_2 = (longlong)(puVar12 + 2);
        param_2[1] = uVar16 - 8;
        if (uVar16 - 8 < 4) goto LAB_145c8f5b1;
        uStack_ac = puVar12[2];
        *param_2 = (longlong)(puVar12 + 3);
        param_2[1] = uVar16 - 0xc;
        if (uVar16 - 0xc < 4) goto LAB_145c8f5b1;
        uStack_a8 = puVar12[3];
        *param_2 = (longlong)(puVar12 + 4);
        param_2[1] = uVar16 - 0x10;
        if (uVar16 - 0x10 < 4) goto LAB_145c8f5b1;
        uStack_a4 = puVar12[4];
        *param_2 = (longlong)(puVar12 + 5);
        param_2[1] = uVar16 - 0x14;
        if (uVar16 - 0x14 < 4) goto LAB_145c8f5b1;
        uStack_98 = uVar6 | 4;
        uStack_a0 = puVar12[5];
        *param_2 = (longlong)(puVar12 + 6);
        param_2[1] = uVar16 - 0x18;
        if (uStack_94 != 0) {
          uVar16 = (ulonglong)uStack_98;
          uStack_98 = uVar6 + 3;
LAB_145c8f55e:
          uStack_c0 = uVar16;
          if (lStack_d8 == lStack_110) {
            FUN_145fe4450(&lStack_110);
            lVar11 = lStack_108;
          }
          lVar9 = lStack_d8 * 0x1c;
          *(uint *)(lVar11 + lVar9) = uStack_94;
          *(uint *)(lVar11 + 4 + lVar9) = uVar18;
          *(uint *)(lVar11 + 8 + lVar9) = uStack_ac;
          *(uint *)(lVar11 + 0xc + lVar9) = uStack_a8;
          *(uint *)(lVar11 + 0x10 + lVar9) = uStack_a4;
          *(uint *)(lVar11 + 0x14 + lVar9) = uStack_a0;
          *(char *)(lVar11 + 0x18 + lVar9) = (char)uStack_98;
          lStack_d8 = lStack_d8 + 1;
          if (uVar18 == 0 && uStack_cc == 0) {
            uStack_cc = 1;
            uStack_160 = uStack_94;
            uStack_15c = uStack_a8;
            uStack_158 = uStack_a4;
            uStack_154 = uStack_a0;
          }
          goto LAB_145c8f034;
        }
        if (bVar14 != 0) goto LAB_145c8f600;
        puVar12 = (uint *)*param_2;
        uVar16 = param_2[1];
        if (3 < uVar16) {
          uStack_94 = *puVar12;
          *param_2 = (longlong)(puVar12 + 1);
          param_2[1] = uVar16 - 4;
          if (uVar16 - 4 < 4) goto LAB_145c8f5b1;
          uVar18 = puVar12[1];
          *param_2 = (longlong)(puVar12 + 2);
          param_2[1] = uVar16 - 8;
          if (3 < uVar16 - 8) {
            uStack_ac = puVar12[2];
            *param_2 = (longlong)(puVar12 + 3);
            param_2[1] = uVar16 - 0xc;
            if (3 < uVar16 - 0xc) {
              uStack_a8 = puVar12[3];
              *param_2 = (longlong)(puVar12 + 4);
              param_2[1] = uVar16 - 0x10;
              if (3 < uVar16 - 0x10) {
                uStack_a4 = puVar12[4];
                *param_2 = (longlong)(puVar12 + 5);
                param_2[1] = uVar16 - 0x14;
                if (3 < uVar16 - 0x14) {
                  uStack_a0 = puVar12[5];
                  *param_2 = (longlong)(puVar12 + 6);
                  param_2[1] = uVar16 - 0x18;
                  uStack_c0 = CONCAT71((int7)(uVar16 - 0x18 >> 8),5);
                  uVar16 = uStack_c0;
                  if (uStack_94 != 0) goto LAB_145c8f55e;
                  goto LAB_145c8f600;
                }
              }
            }
          }
        }
      }
LAB_145c8f5b1:
      *param_2 = uVar16 + (longlong)puVar12;
      goto LAB_145c8f5b7;
    }
LAB_145c8f600:
    puVar12 = (uint *)*param_2;
    uVar16 = param_2[1];
    if (uVar16 < 4) {
      *param_2 = (longlong)puVar12 + uVar16;
LAB_145c8f5b7:
      param_2[1] = 0;
      *(undefined **)param_1 = &DAT_1475fb400;
LAB_145c8f5c9:
      param_1[2] = 0xfffffffe;
      param_1[3] = 0xffffffff;
    }
    else {
      uStack_94 = *puVar12;
      *param_2 = (longlong)(puVar12 + 1);
      param_2[1] = uVar16 - 4;
      FUN_145cc58f0(&lStack_1e0,param_2);
      if (lStack_1e0 == -1) {
        *(undefined8 *)param_1 = uStack_1d8;
        goto LAB_145c8f5c9;
      }
      puVar12 = (uint *)*param_2;
      uVar16 = param_2[1];
      if (3 < uVar16) {
        uStack_ac = *puVar12;
        *param_2 = (longlong)(puVar12 + 1);
        param_2[1] = uVar16 - 4;
        if (3 < uVar16 - 4) {
          uStack_98 = puVar12[1];
          *param_2 = (longlong)(puVar12 + 2);
          param_2[1] = uVar16 - 8;
          if (3 < uVar16 - 8) {
            uVar18 = puVar12[2];
            lStack_d8 = CONCAT44(lStack_d8._4_4_,uVar18);
            *param_2 = (longlong)(puVar12 + 3);
            param_2[1] = uVar16 - 0xc;
            if (3 < uVar16 - 0xc) {
              uVar6 = puVar12[3];
              uStack_c0 = CONCAT44(uStack_c0._4_4_,uVar6);
              *param_2 = (longlong)(puVar12 + 4);
              param_2[1] = uVar16 - 0x10;
              if (3 < uVar16 - 0x10) {
                uStack_a8 = puVar12[4];
                *param_2 = (longlong)(puVar12 + 5);
                param_2[1] = uVar16 - 0x14;
                if (3 < uVar16 - 0x14) {
                  uStack_a4 = puVar12[5];
                  *param_2 = (longlong)(puVar12 + 6);
                  param_2[1] = uVar16 - 0x18;
                  if (3 < uVar16 - 0x18) {
                    uStack_a0 = puVar12[6];
                    *param_2 = (longlong)(puVar12 + 7);
                    param_2[1] = uVar16 - 0x1c;
                    if (3 < uVar16 - 0x1c) {
                      uStack_150 = puVar12[7];
                      *param_2 = (longlong)(puVar12 + 8);
                      param_2[1] = uVar16 - 0x20;
                      if (3 < uVar16 - 0x20) {
                        uStack_14c = puVar12[8];
                        *param_2 = (longlong)(puVar12 + 9);
                        param_2[1] = uVar16 - 0x24;
                        if (3 < uVar16 - 0x24) {
                          uStack_148 = puVar12[9];
                          *param_2 = (longlong)(puVar12 + 10);
                          param_2[1] = uVar16 - 0x28;
                          if (3 < uVar16 - 0x28) {
                            uStack_144 = puVar12[10];
                            *param_2 = (longlong)(puVar12 + 0xb);
                            param_2[1] = uVar16 - 0x2c;
                            if (3 < uVar16 - 0x2c) {
                              uStack_140 = puVar12[0xb];
                              *param_2 = (longlong)(puVar12 + 0xc);
                              param_2[1] = uVar16 - 0x30;
                              if (3 < uVar16 - 0x30) {
                                uStack_13c = puVar12[0xc];
                                *param_2 = (longlong)(puVar12 + 0xd);
                                param_2[1] = uVar16 - 0x34;
                                if (3 < uVar16 - 0x34) {
                                  uVar7 = puVar12[0xd];
                                  *param_2 = (longlong)(puVar12 + 0xe);
                                  param_2[1] = uVar16 - 0x38;
                                  *(longlong *)(param_1 + 0xc) = lStack_128;
                                  *(longlong *)(param_1 + 8) = lStack_138;
                                  *(longlong *)(param_1 + 10) = lStack_130;
                                  *(longlong *)(param_1 + 0x12) = lStack_e8;
                                  *(longlong *)(param_1 + 0xe) = lStack_f8;
                                  *(uint **)(param_1 + 0x10) = puStack_f0;
                                  *(longlong *)(param_1 + 0x18) = lStack_100;
                                  *(longlong *)(param_1 + 0x14) = lStack_110;
                                  *(longlong *)(param_1 + 0x16) = lStack_108;
                                  *param_1 = uVar2;
                                  *(longlong *)(param_1 + 2) = lStack_e0;
                                  *(undefined8 *)(param_1 + 4) = uStack_120;
                                  *(undefined8 *)(param_1 + 6) = uVar10;
                                  *(longlong *)(param_1 + 0x1a) = lStack_1e0;
                                  *(undefined8 *)(param_1 + 0x1c) = uStack_1d8;
                                  *(undefined8 *)(param_1 + 0x1e) = uStack_1d0;
                                  param_1[0x20] = uStack_9c;
                                  param_1[0x21] = uStack_17c;
                                  param_1[0x22] = uStack_178;
                                  param_1[0x23] = uStack_174;
                                  param_1[0x24] = uStack_170;
                                  param_1[0x25] = uStack_16c;
                                  param_1[0x26] = uStack_cc;
                                  param_1[0x27] = uStack_160;
                                  param_1[0x28] = uStack_15c;
                                  param_1[0x29] = uStack_158;
                                  param_1[0x2a] = uStack_154;
                                  param_1[0x2b] = uVar3;
                                  param_1[0x2c] = uVar4;
                                  param_1[0x2d] = uStack_1c4;
                                  param_1[0x2e] = uStack_1b8;
                                  param_1[0x2f] = uStack_1b4;
                                  param_1[0x30] = uStack_1b0;
                                  param_1[0x31] = uStack_1ac;
                                  param_1[0x32] = uStack_1c8;
                                  param_1[0x33] = uStack_1bc;
                                  param_1[0x34] = uStack_1c0;
                                  param_1[0x35] = uVar17;
                                  param_1[0x36] = uStack_1a8;
                                  param_1[0x37] = uStack_1a4;
                                  param_1[0x38] = uStack_1a0;
                                  param_1[0x39] = uStack_19c;
                                  param_1[0x3a] = uStack_198;
                                  param_1[0x3b] = uStack_194;
                                  param_1[0x3c] = uStack_190;
                                  param_1[0x3d] = uStack_18c;
                                  param_1[0x3e] = uStack_188;
                                  param_1[0x3f] = uStack_184;
                                  param_1[0x40] = uStack_180;
                                  param_1[0x41] = uVar5;
                                  param_1[0x42] = (uint)fVar1;
                                  param_1[0x43] = (uint)lStack_c8;
                                  param_1[0x44] = (uint)uStack_b8;
                                  param_1[0x45] = uStack_168;
                                  param_1[0x46] = uStack_164;
                                  param_1[0x47] = uVar15;
                                  param_1[0x48] = (uint)uStack_118;
                                  param_1[0x49] = uStack_94;
                                  param_1[0x4a] = uStack_ac;
                                  param_1[0x4b] = uStack_98;
                                  param_1[0x4c] = uVar18;
                                  param_1[0x4d] = uVar6;
                                  param_1[0x4e] = uStack_a8;
                                  param_1[0x4f] = uStack_a4;
                                  param_1[0x50] = uStack_a0;
                                  param_1[0x51] = uStack_150;
                                  param_1[0x52] = uStack_14c;
                                  param_1[0x53] = uStack_148;
                                  param_1[0x54] = uStack_144;
                                  param_1[0x55] = uStack_140;
                                  param_1[0x56] = uStack_13c;
                                  param_1[0x57] = uVar7;
                                  return param_1;
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      *param_2 = (longlong)puVar12 + uVar16;
      param_2[1] = 0;
      *(undefined **)param_1 = &DAT_1475fb400;
      param_1[2] = 0xfffffffe;
      param_1[3] = 0xffffffff;
      if (lStack_1e0 != 0) {
        func_0x0001400021d0(uStack_1d8,lStack_1e0,1);
      }
    }
    if (lStack_110 != 0) {
      func_0x0001400021d0(lStack_108,lStack_110 * 0x1c,4);
    }
  }
  if (lStack_f8 != 0) {
    func_0x0001400021d0(puStack_f0,lStack_f8 * 0xc,4);
  }
LAB_145c8eaa6:
  if (lStack_138 != 0) {
    func_0x0001400021d0(lStack_130,lStack_138 << 3,4);
  }
LAB_145c8e920:
  if (lStack_e0 != 0) {
    func_0x0001400021d0(uStack_120,lStack_e0,1);
  }
  return param_1;
}
