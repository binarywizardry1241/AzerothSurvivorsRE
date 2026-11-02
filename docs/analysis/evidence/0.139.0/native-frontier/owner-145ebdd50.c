/* WARNING: Removing unreachable block (ram,0x000145ebe5e4) */
/* WARNING: Removing unreachable block (ram,0x000145ec036f) */
/* WARNING: Removing unreachable block (ram,0x000145ebe576) */
/* WARNING: Removing unreachable block (ram,0x000145ec039a) */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,float param_2)

{
  int *piVar1;
  char *pcVar2;
  undefined1 uVar3;
  ushort uVar4;
  code *pcVar5;
  undefined8 uVar6;
  undefined8 uVar7;
  undefined8 *puVar8;
  byte bVar9;
  char cVar10;
  uint uVar11;
  int iVar12;
  byte *pbVar13;
  undefined4 *puVar14;
  ulong uVar15;
  long lVar16;
  long *plVar17;
  long in_RCX;
  long lVar18;
  long lVar19;
  long lVar20;
  long lVar21;
  ulong uVar22;
  int iVar23;
  long *plVar24;
  undefined8 uVar25;
  undefined8 *puVar26;
  undefined4 uVar27;
  ulong uVar28;
  long lVar29;
  float *in_R9;
  ulong uVar30;
  float *pfVar31;
  ulong uVar32;
  ulong uVar33;
  ulong uVar34;
  undefined8 *puVar35;
  bool bVar36;
  float fVar37;
  float fVar38;
  undefined1 auVar39 [16];
  undefined8 extraout_XMM0_Qb;
  float fVar40;
  float fVar41;
  undefined1 auVar42 [16];
  float fVar43;
  undefined1 auVar44 [16];
  undefined1 auVar45 [16];
  undefined1 auVar46 [16];
  undefined1 auVar47 [16];
  undefined1 auVar48 [16];
  undefined1 auVar49 [16];
  undefined1 auVar50 [16];
  undefined1 auVar51 [16];
  undefined1 auVar52 [16];
  float fVar53;
  float fVar54;
  float fVar55;
  float fVar56;
  float fVar57;
  float fVar58;
  undefined4 uVar59;
  float fVar60;
  undefined4 local_238;
  undefined4 uStack_234;
  long local_230;
  long local_228;
  undefined4 local_218;
  undefined4 uStack_214;
  undefined4 uStack_210;
  undefined4 uStack_20c;
  undefined4 uStack_208;
  undefined4 uStack_204;
  undefined4 uStack_200;
  undefined4 uStack_1fc;
  ulong local_1b0;
  undefined8 *local_1a0;
  long local_198;
  long *local_170;
  undefined4 uStack_168;
  undefined4 uStack_164;
  undefined4 uStack_160;
  undefined4 uStack_15c;
  undefined4 uStack_158;
  undefined1 uStack_154;
  undefined1 uStack_153;
  undefined2 uStack_152;

  fVar38 = *(float *)(in_RCX + 0xe88);
  local_1a0 = (undefined8 *)&DAT_00000008;
  local_198 = 0;
  local_1b0 = 0;
  puVar26 = *(undefined8 **)(in_RCX + 0x460);
  lVar19 = *(long *)(in_RCX + 0x468);
  fVar53 = 0.0;
  fVar55 = 0.0;
  puVar8 = puVar26;
  fVar54 = _DAT_1464d5b60;
  while (puVar35 = puVar8, puVar35 != puVar26 + lVar19 * 4) {
    fVar57 = *(float *)((long)puVar35 + 0x1c);
    if (fVar53 < fVar57) {
      fVar40 = *(float *)(puVar35 + 3) - fVar38;
      fVar56 = fVar40;
      if (fVar40 <= param_2) {
        fVar56 = param_2;
      }
      fVar56 = param_2 / (float)(~-(uint)NAN(fVar56) & (uint)fVar56 |
                                (uint)fVar40 & -(uint)NAN(fVar56));
      if (fVar54 <= fVar56) {
        fVar56 = fVar54;
      }
      fVar56 = fVar56 * fVar57;
      *(float *)((long)puVar35 + 0x1c) = fVar57 - fVar56;
      uVar59 = *(undefined4 *)((long)puVar35 + 0x14);
      uVar25 = *puVar35;
      if (local_198 == 0) {
        func_0x000146326e10();
      }
      lVar18 = local_198 * 0x10;
      *(undefined8 *)(lVar18 + 8) = uVar25;
      *(undefined4 *)(lVar18 + 0x10) = uVar59;
      *(float *)(lVar18 + 0x14) = fVar56;
      local_198 = local_198 + 1;
      fVar55 = fVar55 + fVar56;
    }
    puVar8 = puVar35 + 4;
    if (*(float *)(puVar35 + 3) <= fVar38) {
      uVar59 = *(undefined4 *)((long)puVar35 + 0x14);
      if (local_1b0 == 0) {
        func_0x00014632b470();
      }
      *(undefined4 *)(local_1b0 * 4 + 4) = uVar59;
      local_1b0 = local_1b0 + 1;
    }
  }
  if (local_1b0 == 0) goto LAB_145ebe16f;
  uVar28 = local_1b0 & 0x1ffffffffffffff0;
  lVar19 = uVar28 * 4 + 4;
  uVar11 = (uint)local_1b0 & 0xf;
  uVar30 = 0;
  do {
    if (uVar28 == uVar30) {
      uVar30 = (ulong)(uVar11 * 4);
      uVar33 = 0;
      goto LAB_145ebdff0;
    }
    lVar18 = uVar30 * 4;
    lVar21 = uVar30 * 4;
    lVar20 = uVar30 * 4;
    lVar29 = uVar30 * 4;
    auVar48._0_4_ = -(uint)(*(int *)(lVar29 + 0x34) == _DAT_147a1abf0);
    auVar48._4_4_ = -(uint)(*(int *)(lVar29 + 0x38) == iRam0000000147a1abf4);
    auVar48._8_4_ = -(uint)(*(int *)(lVar29 + 0x3c) == iRam0000000147a1abf8);
    auVar48._12_4_ = -(uint)(*(int *)(lVar29 + 0x40) == iRam0000000147a1abfc);
    auVar45._0_4_ = -(uint)(*(int *)(lVar20 + 0x24) == _DAT_147a1abf0);
    auVar45._4_4_ = -(uint)(*(int *)(lVar20 + 0x28) == iRam0000000147a1abf4);
    auVar45._8_4_ = -(uint)(*(int *)(lVar20 + 0x2c) == iRam0000000147a1abf8);
    auVar45._12_4_ = -(uint)(*(int *)(lVar20 + 0x30) == iRam0000000147a1abfc);
    auVar45 = packssdw(auVar45,auVar48);
    auVar50._0_4_ = -(uint)(*(int *)(lVar21 + 0x14) == _DAT_147a1abf0);
    auVar50._4_4_ = -(uint)(*(int *)(lVar21 + 0x18) == iRam0000000147a1abf4);
    auVar50._8_4_ = -(uint)(*(int *)(lVar21 + 0x1c) == iRam0000000147a1abf8);
    auVar50._12_4_ = -(uint)(*(int *)(lVar21 + 0x20) == iRam0000000147a1abfc);
    auVar42._0_4_ = -(uint)(*(int *)(lVar18 + 4) == _DAT_147a1abf0);
    auVar42._4_4_ = -(uint)(*(int *)(lVar18 + 8) == iRam0000000147a1abf4);
    auVar42._8_4_ = -(uint)(*(int *)(lVar18 + 0xc) == iRam0000000147a1abf8);
    auVar42._12_4_ = -(uint)(*(int *)(lVar18 + 0x10) == iRam0000000147a1abfc);
    auVar42 = packssdw(auVar42,auVar50);
    auVar42 = packsswb(auVar42,auVar45);
    uVar30 = uVar30 + 0x10;
  } while ((((((((((((((((SUB161(auVar42 >> 7,0) & 1) == 0 && (SUB161(auVar42 >> 0xf,0) & 1) == 0)
                       && (SUB161(auVar42 >> 0x17,0) & 1) == 0) &&
                      (SUB161(auVar42 >> 0x1f,0) & 1) == 0) && (SUB161(auVar42 >> 0x27,0) & 1) == 0)
                    && (SUB161(auVar42 >> 0x2f,0) & 1) == 0) && (SUB161(auVar42 >> 0x37,0) & 1) == 0
                   ) && (SUB161(auVar42 >> 0x3f,0) & 1) == 0) &&
                 (SUB161(auVar42 >> 0x47,0) & 1) == 0) && (SUB161(auVar42 >> 0x4f,0) & 1) == 0) &&
               (SUB161(auVar42 >> 0x57,0) & 1) == 0) && (SUB161(auVar42 >> 0x5f,0) & 1) == 0) &&
             (SUB161(auVar42 >> 0x67,0) & 1) == 0) && (SUB161(auVar42 >> 0x6f,0) & 1) == 0) &&
           (SUB161(auVar42 >> 0x77,0) & 1) == 0) && -1 < auVar42[0xf]);
  goto LAB_145ebe003;
  while (piVar1 = (int *)(lVar19 + uVar28), uVar28 = uVar28 + 4, *piVar1 != iVar12) {
LAB_145ebe0c0:
    if (uVar11 << 2 == uVar28) goto LAB_145ebe104;
  }
  goto LAB_145ebe0cf;
  while (piVar1 = (int *)(lVar19 + uVar33), uVar33 = uVar33 + 4, *piVar1 != 0x2ca2) {
LAB_145ebdff0:
    if (uVar30 == uVar33) {
      in_R9 = (float *)0x0;
      iVar12 = *(int *)(in_RCX + 0x540);
      if (iVar12 == 0) goto LAB_145ebe104;
      goto LAB_145ebe053;
    }
  }
LAB_145ebe003:
  fVar53 = *(float *)(in_RCX + 0x56c) - *(float *)(in_RCX + 0x570);
  if (fVar53 <= 0.0) {
    fVar53 = 0.0;
  }
  *(float *)(in_RCX + 0x56c) = fVar53;
  *(undefined4 *)(in_RCX + 0x570) = 0;
  in_R9 = (float *)CONCAT71((int7)(uVar30 >> 8),1);
  iVar12 = *(int *)(in_RCX + 0x540);
  if (iVar12 != 0) {
LAB_145ebe053:
    uVar30 = 0;
    do {
      if (uVar28 == uVar30) {
        uVar28 = 0;
        goto LAB_145ebe0c0;
      }
      lVar18 = uVar30 * 4;
      lVar21 = uVar30 * 4;
      lVar20 = uVar30 * 4;
      lVar29 = uVar30 * 4;
      auVar46._0_4_ = -(uint)(*(int *)(lVar21 + 0x14) == iVar12);
      auVar46._4_4_ = -(uint)(*(int *)(lVar21 + 0x18) == iVar12);
      auVar46._8_4_ = -(uint)(*(int *)(lVar21 + 0x1c) == iVar12);
      auVar46._12_4_ = -(uint)(*(int *)(lVar21 + 0x20) == iVar12);
      auVar44._0_4_ = -(uint)(*(int *)(lVar18 + 4) == iVar12);
      auVar44._4_4_ = -(uint)(*(int *)(lVar18 + 8) == iVar12);
      auVar44._8_4_ = -(uint)(*(int *)(lVar18 + 0xc) == iVar12);
      auVar44._12_4_ = -(uint)(*(int *)(lVar18 + 0x10) == iVar12);
      auVar42 = packssdw(auVar44,auVar46);
      auVar49._0_4_ = -(uint)(*(int *)(lVar20 + 0x24) == iVar12);
      auVar49._4_4_ = -(uint)(*(int *)(lVar20 + 0x28) == iVar12);
      auVar49._8_4_ = -(uint)(*(int *)(lVar20 + 0x2c) == iVar12);
      auVar49._12_4_ = -(uint)(*(int *)(lVar20 + 0x30) == iVar12);
      auVar52._0_4_ = -(uint)(*(int *)(lVar29 + 0x34) == iVar12);
      auVar52._4_4_ = -(uint)(*(int *)(lVar29 + 0x38) == iVar12);
      auVar52._8_4_ = -(uint)(*(int *)(lVar29 + 0x3c) == iVar12);
      auVar52._12_4_ = -(uint)(*(int *)(lVar29 + 0x40) == iVar12);
      auVar50 = packssdw(auVar49,auVar52);
      auVar42 = packsswb(auVar42,auVar50);
      uVar30 = uVar30 + 0x10;
    } while ((((((((((((((((SUB161(auVar42 >> 7,0) & 1) == 0 && (SUB161(auVar42 >> 0xf,0) & 1) == 0)
                         && (SUB161(auVar42 >> 0x17,0) & 1) == 0) &&
                        (SUB161(auVar42 >> 0x1f,0) & 1) == 0) &&
                       (SUB161(auVar42 >> 0x27,0) & 1) == 0) && (SUB161(auVar42 >> 0x2f,0) & 1) == 0
                      ) && (SUB161(auVar42 >> 0x37,0) & 1) == 0) &&
                    (SUB161(auVar42 >> 0x3f,0) & 1) == 0) && (SUB161(auVar42 >> 0x47,0) & 1) == 0)
                  && (SUB161(auVar42 >> 0x4f,0) & 1) == 0) && (SUB161(auVar42 >> 0x57,0) & 1) == 0)
                && (SUB161(auVar42 >> 0x5f,0) & 1) == 0) && (SUB161(auVar42 >> 0x67,0) & 1) == 0) &&
              (SUB161(auVar42 >> 0x6f,0) & 1) == 0) && (SUB161(auVar42 >> 0x77,0) & 1) == 0) &&
             -1 < auVar42[0xf]);
LAB_145ebe0cf:
    if (((byte)in_R9 & iVar12 == 0x2ca2) == 0) {
      fVar53 = *(float *)(in_RCX + 0x56c) - *(float *)(in_RCX + 0x544);
      if (fVar53 <= 0.0) {
        fVar53 = 0.0;
      }
      *(float *)(in_RCX + 0x56c) = fVar53;
    }
    *(undefined8 *)(in_RCX + 0x540) = 0;
  }
LAB_145ebe104:
  uVar28 = *(ulong *)(in_RCX + 0x468);
  if (uVar28 != 0) {
    lVar19 = *(long *)(in_RCX + 0x460);
    in_R9 = (float *)(lVar19 + 0x38);
    uVar30 = 0;
    do {
      if (in_R9[-8] <= fVar38) {
        uVar33 = uVar30 + 1;
        if (uVar33 < uVar28) {
          uVar22 = uVar30 - uVar28;
          uVar15 = uVar22;
          if ((uVar22 & 1) == 0) {
            uVar15 = uVar30;
            if (fVar38 < *in_R9) {
              *(undefined8 *)(in_R9 + -10) = *(undefined8 *)(in_R9 + -2);
              *(undefined8 *)(in_R9 + -8) = *(undefined8 *)in_R9;
              *(undefined8 *)(in_R9 + -0xe) = *(undefined8 *)(in_R9 + -6);
              *(undefined8 *)(in_R9 + -0xc) = *(undefined8 *)(in_R9 + -4);
              uVar15 = uVar30 + 1;
            }
            uVar33 = uVar30 + 2;
            uVar30 = uVar15;
          }
          if (uVar22 != 0xfffffffffffffffe) {
            lVar18 = uVar28 - uVar33;
            in_R9 = (float *)(uVar33 * 0x20 + lVar19 + 0x38);
            uVar15 = uVar30;
            do {
              if (in_R9[-8] <= fVar38) {
                fVar53 = *in_R9;
              }
              else {
                uVar25 = *(undefined8 *)(in_R9 + -0xe);
                uVar6 = *(undefined8 *)(in_R9 + -0xc);
                uVar7 = *(undefined8 *)(in_R9 + -8);
                puVar26 = (undefined8 *)(lVar19 + 0x10 + uVar15 * 0x20);
                *puVar26 = *(undefined8 *)(in_R9 + -10);
                puVar26[1] = uVar7;
                puVar26 = (undefined8 *)(lVar19 + uVar15 * 0x20);
                *puVar26 = uVar25;
                puVar26[1] = uVar6;
                uVar15 = uVar15 + 1;
                fVar53 = *in_R9;
              }
              if (fVar38 < fVar53) {
                uVar25 = *(undefined8 *)(in_R9 + -6);
                uVar6 = *(undefined8 *)(in_R9 + -4);
                uVar7 = *(undefined8 *)in_R9;
                puVar26 = (undefined8 *)(lVar19 + 0x10 + uVar15 * 0x20);
                *puVar26 = *(undefined8 *)(in_R9 + -2);
                puVar26[1] = uVar7;
                puVar26 = (undefined8 *)(lVar19 + uVar15 * 0x20);
                *puVar26 = uVar25;
                puVar26[1] = uVar6;
                uVar15 = uVar15 + 1;
              }
              in_R9 = in_R9 + 0x10;
              lVar18 = lVar18 + -2;
            } while (lVar18 != 0);
          }
          *(ulong *)(in_RCX + 0x468) = uVar15;
        }
        else {
          *(ulong *)(in_RCX + 0x468) = uVar30;
        }
        break;
      }
      uVar30 = uVar30 + 1;
      in_R9 = in_R9 + 8;
    } while (uVar30 != uVar28);
  }
  func_0x000145ec9960();
  func_0x000145ebbd70();
LAB_145ebe16f:
  fVar53 = *(float *)(in_RCX + 0x570);
  fVar57 = fVar53;
  if (*(float *)(in_RCX + 0x56c) <= fVar53) {
    fVar57 = *(float *)(in_RCX + 0x56c);
  }
  *(uint *)(in_RCX + 0x570) = -(uint)NAN(fVar57) & (uint)fVar53 | ~-(uint)NAN(fVar57) & (uint)fVar57
  ;
  fVar53 = *(float *)(in_RCX + 0x5c8);
  fVar57 = *(float *)((ulong)(4 < *(byte *)(in_RCX + 0x3f7)) * 4 + 0x147a1ac00);
  fVar56 = ((float)(~-(uint)(fVar38 - *(float *)(in_RCX + 0x63c) < _DAT_1464e2da0) &
                   (uint)(*(float *)(in_RCX + 0x61c) * fVar53)) + *(float *)(in_RCX + 0x5f0)) *
           param_2 * fVar57;
  fVar55 = fVar55 * fVar57;
  fVar38 = *(float *)(in_RCX + 0x568);
  if (fVar38 < fVar53) {
    fVar40 = fVar38 + fVar56 + fVar55;
    fVar57 = fVar40;
    if (fVar53 <= fVar40) {
      fVar57 = fVar53;
    }
    fVar53 = (float)(~-(uint)NAN(fVar57) & (uint)fVar57 | (uint)fVar40 & -(uint)NAN(fVar57));
    *(float *)(in_RCX + 0x568) = fVar53;
    fVar57 = 0.0;
    if (fVar53 <= 0.0) {
      fVar53 = 0.0;
    }
    fVar53 = (float)func_0x000146325f57(fVar53);
    uVar59 = (int)(long)fVar53;
    if (fVar53 < fVar57) {
      uVar59 = 0;
    }
    uVar27 = 0xffffffff;
    if (fVar53 <= _DAT_1465154d8) {
      uVar27 = uVar59;
    }
    plVar17 = (long *)(in_RCX + 0xe20);
    lVar19 = *(long *)(in_RCX + 0xe20);
    plVar24 = plVar17;
    if (lVar19 != 0) {
      lVar18 = *(long *)(in_RCX + 0xe28);
      do {
        in_R9 = (float *)(ulong)*(ushort *)(lVar19 + 0x36);
        uVar28 = (ulong)((uint)*(ushort *)(lVar19 + 0x36) * 2);
        pfVar31 = (float *)0xffffffffffffffff;
        do {
          if (uVar28 == 0) goto LAB_145ebe2d3;
          uVar4 = *(ushort *)(lVar19 + 0x3a + (long)pfVar31 * 2);
          pfVar31 = (float *)((long)pfVar31 + 1);
          uVar28 = uVar28 - 2;
        } while ((char)((uVar4 < 0x16) - (0x16 < uVar4)) == '\x01');
        in_R9 = pfVar31;
        if (uVar4 < 0x16 == 0x16 < uVar4) {
          *(undefined4 *)(lVar19 + 8 + (long)pfVar31 * 4) = uVar27;
          goto LAB_145ebe32c;
        }
LAB_145ebe2d3:
        bVar36 = lVar18 == 0;
        lVar18 = lVar18 + -1;
        if (bVar36) break;
        lVar19 = *(long *)(lVar19 + 0x50 + (long)in_R9 * 8);
      } while( true );
    }
    uStack_160 = 0;
    uStack_15c = 0;
    uStack_158 = SUB84(in_R9,0);
    uStack_154 = (undefined1)((ulong)in_R9 >> 0x20);
    uStack_153 = (undefined1)((ulong)in_R9 >> 0x28);
    uStack_152 = (undefined2)((ulong)in_R9 >> 0x30);
    func_0x000145fd4840();
    local_170 = plVar17;
LAB_145ebe32c:
    fVar53 = (float)func_0x000146325f57();
    uVar59 = (int)(long)fVar53;
    if (fVar53 < 0.0) {
      uVar59 = 0;
    }
    uVar27 = 0xffffffff;
    if (fVar53 <= _DAT_1465154d8) {
      uVar27 = uVar59;
    }
    lVar19 = *plVar24;
    if (lVar19 != 0) {
      lVar18 = *(long *)(in_RCX + 0xe28);
      do {
        in_R9 = (float *)(ulong)*(ushort *)(lVar19 + 0x36);
        uVar28 = (ulong)((uint)*(ushort *)(lVar19 + 0x36) * 2);
        pfVar31 = (float *)0xffffffffffffffff;
        do {
          if (uVar28 == 0) goto LAB_145ebe3b3;
          uVar4 = *(ushort *)(lVar19 + 0x3a + (long)pfVar31 * 2);
          pfVar31 = (float *)((long)pfVar31 + 1);
          uVar28 = uVar28 - 2;
        } while ((char)((uVar4 < 0x1c) - (0x1c < uVar4)) == '\x01');
        in_R9 = pfVar31;
        if (uVar4 < 0x1c == 0x1c < uVar4) {
          *(undefined4 *)(lVar19 + 8 + (long)pfVar31 * 4) = uVar27;
          goto LAB_145ebe415;
        }
LAB_145ebe3b3:
        bVar36 = lVar18 == 0;
        lVar18 = lVar18 + -1;
        if (bVar36) break;
        lVar19 = *(long *)(lVar19 + 0x50 + (long)in_R9 * 8);
      } while( true );
    }
    uStack_160 = 0;
    uStack_15c = 0;
    uStack_158 = SUB84(in_R9,0);
    uStack_154 = (undefined1)((ulong)in_R9 >> 0x20);
    uStack_153 = (undefined1)((ulong)in_R9 >> 0x28);
    uStack_152 = (undefined2)((ulong)in_R9 >> 0x30);
    func_0x000145fd4840();
    local_170 = plVar24;
  }
LAB_145ebe415:
  uVar25 = 0x147a1c090;
  uStack_210 = 0x47a1c090;
  uStack_20c = 1;
  local_218 = 0;
  func_0x000145ece500();
  fVar53 = 0.0;
  local_170 = (long *)((ulong)local_170 & 0xffffffff00000000);
  uStack_168 = (undefined4)uVar25;
  uStack_164 = (undefined4)((ulong)uVar25 >> 0x20);
  func_0x000145ec4bc0();
  if (fVar53 < fVar55) {
    fVar56 = (*(float *)(in_RCX + 0x568) - fVar38) - fVar56;
    auVar39 = ZEXT416((uint)fVar56);
    fVar38 = 0.0;
    if (0.0 <= fVar56) {
      fVar38 = fVar56;
    }
    fVar53 = fVar55;
    if (fVar38 <= fVar55) {
      fVar53 = fVar38;
    }
    if (local_198 != 0) {
      puVar26 = (undefined8 *)(local_198 * 0x10 + 8);
      do {
        uStack_214 = *(undefined4 *)(local_1a0 + 1);
        local_170 = (long *)0xfffffffffffffffe;
        local_218 = 1;
        uStack_210 = (undefined4)*local_1a0;
        uStack_20c = (undefined4)((ulong)*local_1a0 >> 0x20);
        auVar39._0_8_ =
             func_0x000145ec4bc0(auVar39._0_8_,(*(float *)((long)local_1a0 + 0xc) * fVar53) / fVar55
                                );
        auVar39._8_8_ = extraout_XMM0_Qb;
        local_1a0 = local_1a0 + 2;
      } while (local_1a0 != puVar26);
    }
    fVar55 = fVar55 - fVar53;
    if (0.0 < fVar55) {
      lVar19 = 0;
      do {
        if (*(long *)(in_RCX + 0xa20) << 6 == lVar19) goto LAB_145ebe625;
        lVar18 = lVar19 + 0x40;
        pcVar2 = (char *)(*(long *)(in_RCX + 0xa18) + lVar19);
        lVar19 = lVar18;
      } while (*pcVar2 != '\x14');
      fVar38 = *(float *)(*(long *)(in_RCX + 0xa18) + -0x3c + lVar18) * *(float *)(in_RCX + 0x5c8);
      if (*(float *)(in_RCX + 0x56c) < fVar38) {
        fVar56 = *(float *)(in_RCX + 0x56c) + fVar55;
        fVar57 = fVar56;
        if (fVar38 <= fVar56) {
          fVar57 = fVar38;
        }
        *(uint *)(in_RCX + 0x56c) =
             ~-(uint)NAN(fVar57) & (uint)fVar57 | (uint)fVar56 & -(uint)NAN(fVar57);
      }
    }
LAB_145ebe625:
    if (0.0 < fVar53 + fVar55) {
      lVar19 = 0;
      do {
        if (*(long *)(in_RCX + 0xa20) << 6 == lVar19) goto LAB_145ebe671;
        pcVar2 = (char *)(*(long *)(in_RCX + 0xa18) + lVar19);
        lVar19 = lVar19 + 0x40;
      } while (*pcVar2 != '\x15');
      *(float *)(in_RCX + 0x228) = fVar53 + fVar55 + *(float *)(in_RCX + 0x228);
    }
  }
LAB_145ebe671:
  func_0x000145f23850();
  bVar9 = *(char *)(in_RCX + 0x3dc) - 2;
  if (bVar9 < 10) {
    pbVar13 = *(byte **)((ulong)bVar9 * 8 + 0x147a1ecc8);
    bVar9 = *pbVar13;
  }
  else {
    pbVar13 = &DAT_1473223d0;
    bVar9 = DAT_1473223d0;
  }
  if ((bVar9 & 1) != 0) {
    uVar28 = *(ulong *)(in_RCX + 0x9f0);
    if ((uVar28 != 0) && (uVar28 != 1)) {
      uVar30 = 0;
      do {
        uVar30 = uVar30 + 2;
      } while ((uVar28 & 0xfffffffffffffffe) != uVar30);
    }
    fVar38 = *(float *)(pbVar13 + 8);
    fVar53 = *(float *)(in_RCX + 0x624) - param_2;
    *(float *)(in_RCX + 0x624) = fVar53;
    if (fVar53 <= 0.0) {
      uStack_168 = *(undefined4 *)(in_RCX + 0x558);
      local_170 = *(long **)(in_RCX + 0x550);
      func_0x000145f22650();
      if (CONCAT44(uStack_204,uStack_208) == 0) {
        *(undefined4 *)(in_RCX + 0x624) = _DAT_1464e41ac;
      }
      else {
        uVar28 = *(ulong *)(in_RCX + 0xdf0);
        uVar33 = *(ulong *)(in_RCX + 0xdf8) ^ *(ulong *)(in_RCX + 0xde8);
        uVar30 = *(ulong *)(in_RCX + 0xe00) ^ uVar28;
        *(ulong *)(in_RCX + 0xdf0) = uVar28 ^ uVar33;
        *(ulong *)(in_RCX + 0xde8) = *(ulong *)(in_RCX + 0xde8) ^ uVar30;
        *(ulong *)(in_RCX + 0xdf8) = uVar33 ^ uVar28 << 0x11;
        *(ulong *)(in_RCX + 0xe00) = uVar30 << 0x2d | uVar30 >> 0x13;
        func_0x000145d787b0();
        lVar19 = *(long *)(in_RCX + 0x710);
        if (lVar19 == *(long *)(in_RCX + 0x700)) {
          func_0x000146326cc0();
        }
        lVar18 = *(long *)(in_RCX + 0x708);
        puVar26 = (undefined8 *)(lVar18 + 0x10 + lVar19 * 0x20);
        *puVar26 = CONCAT44(uStack_15c,uStack_160);
        puVar26[1] = CONCAT26(uStack_152,CONCAT15(uStack_153,CONCAT14(uStack_154,uStack_158)));
        plVar17 = (long *)(lVar18 + lVar19 * 0x20);
        *plVar17 = (long)local_170;
        plVar17[1] = CONCAT44(uStack_164,uStack_168);
        *(long *)(in_RCX + 0x710) = lVar19 + 1;
        func_0x000145ee6190();
        *(float *)(in_RCX + 0x624) = SQRT(*(float *)(in_RCX + 0x5d0)) * fVar38 * _DAT_1465240b8;
      }
      if (CONCAT44(uStack_214,local_218) != 0) {
        func_0x0001400021d0();
      }
    }
  }
  uVar28 = *(ulong *)(in_RCX + 0x408);
  fVar56 = 0.0;
  uVar30 = 0;
  fVar38 = _DAT_1464d5d10;
  fVar53 = _DAT_1464d5c50;
  fVar55 = _DAT_1464e2df8;
  fVar57 = _DAT_1464e7ad0;
  fVar40 = _DAT_1464e421c;
  fVar60 = _DAT_1465154d8;
  while (uVar33 = uVar30, uVar33 < uVar28) {
    if (*(ulong *)(in_RCX + 0x408) <= uVar33) {
      func_0x0001464ce413();
      goto LAB_145ec06c0;
    }
    lVar19 = *(long *)(in_RCX + 0x400);
    lVar18 = uVar33 * 0x58;
    fVar37 = fVar54;
    if (*(long *)(in_RCX + 0xa20) != 0) {
      plVar17 = (long *)**(long **)(lVar19 + lVar18);
      lVar21 = (*(long **)(lVar19 + lVar18))[1];
      lVar20 = *(long *)(in_RCX + 0xa18);
      lVar29 = 0;
      do {
        if ((*(char *)(lVar20 + lVar29) == '*') && (*(char *)(lVar20 + 2 + lVar29) == '\n')) {
          if (lVar21 == 0xb) {
            if (*(long *)((long)plVar17 + 3) != 0x656b697274736d72 || *plVar17 != 0x7274736d726f7473
               ) break;
          }
          else if ((lVar21 != 9) || ((char)plVar17[1] != 'r' || *plVar17 != 0x657469626b636f72))
          break;
          if (*(float *)(in_RCX + 0xe88) <= *(float *)(in_RCX + 0x13c) &&
              *(float *)(in_RCX + 0x13c) != *(float *)(in_RCX + 0xe88)) {
            fVar37 = ((float)*(byte *)(lVar20 + 1 + lVar29) * _DAT_1464d5ea0) / _DAT_1464d5e80 +
                     fVar54;
          }
          break;
        }
        lVar29 = lVar29 + 0x40;
      } while (*(long *)(in_RCX + 0xa20) << 6 != lVar29);
    }
    fVar58 = *(float *)(lVar19 + 0xc + lVar18);
    *(float *)(lVar19 + lVar18 + 0xc) = fVar58 - fVar37 * param_2;
    uVar30 = *(ulong *)(in_RCX + 0x408);
    if (uVar30 <= uVar33) {
      func_0x0001464ce413();
      goto LAB_145ec06c0;
    }
    plVar17 = *(long **)(*(long *)(in_RCX + 0x400) + lVar18);
    if ((int)plVar17[0xd] == 0xc) {
      lVar19 = *(long *)(in_RCX + 0x400) + lVar18;
      fVar37 = fVar55;
      if (plVar17[1] == 0xd) {
        if (*(long *)(*plVar17 + 5) == CONCAT53(uRam0000000147a1fd58,_DAT_147a1fd55) &&
            *(long *)*plVar17 == CONCAT35(_DAT_147a1fd55,_DAT_147a1fd50)) {
          fVar37 = *(float *)(plVar17 + 0xb) * fVar57 * *(float *)(lVar19 + 0x20) *
                   *(float *)(lVar19 + 0x48);
          if (_DAT_1464d5ea0 <= fVar37) {
            fVar37 = _DAT_1464d5ea0;
          }
          fVar37 = fVar53 - fVar37;
        }
      }
      else if ((plVar17[1] == 8) && (fVar37 = fVar38, *(long *)*plVar17 != _DAT_147a1fd48)) {
        fVar37 = fVar55;
      }
      fVar43 = *(float *)(plVar17 + 9) * fVar57 * *(float *)(lVar19 + 0x14) *
               *(float *)(lVar19 + 0x3c) * *(float *)(in_RCX + 0x5d0);
      fVar41 = fVar43;
      if (fVar43 <= fVar37) {
        fVar41 = fVar37;
      }
      fVar37 = (float)(~-(uint)NAN(fVar41) & (uint)fVar41 | (uint)fVar43 & -(uint)NAN(fVar41));
      if (((fVar37 < fVar58) && (fVar58 = *(float *)(lVar19 + 0xc), fVar58 <= fVar37)) &&
         (fVar56 < fVar58)) {
        local_218 = (undefined4)plVar17[8];
        uVar25 = *(undefined8 *)(in_RCX + 0x538);
        func_0x000140002200();
        puVar14 = (undefined4 *)func_0x0001400021c0();
        if (puVar14 == (undefined4 *)0x0) {
          func_0x0001464ce07b();
          goto LAB_145ec06c0;
        }
        *puVar14 = local_218;
        *(undefined8 *)(puVar14 + 1) = uVar25;
        lVar19 = *(long *)(in_RCX + 0x710);
        if (lVar19 == *(long *)(in_RCX + 0x700)) {
          func_0x000146326cc0();
        }
        lVar21 = *(long *)(in_RCX + 0x708);
        lVar20 = lVar19 * 0x20;
        *(undefined8 *)(lVar21 + lVar20) = 0x20;
        *(undefined4 **)(lVar21 + 8 + lVar20) = puVar14;
        *(undefined8 *)(lVar21 + 0x10 + lVar20) = 0xc;
        *(undefined2 *)(lVar21 + 0x18 + lVar20) = 0x1de;
        fVar58 = fVar58 * fVar40;
        uStack_214 = (undefined4)(long)fVar58;
        if (fVar58 < fVar56) {
          uStack_214 = 0;
        }
        *(long *)(in_RCX + 0x710) = lVar19 + 1;
        if (fVar60 < fVar58) {
          uStack_214 = 0xffffffff;
        }
        uVar59 = local_218;
        func_0x000145d79880();
        lVar19 = *(long *)(in_RCX + 0x710);
        if (lVar19 == *(long *)(in_RCX + 0x700)) {
          func_0x000146326cc0();
        }
        lVar21 = *(long *)(in_RCX + 0x708);
        puVar26 = (undefined8 *)(lVar21 + 0x10 + lVar19 * 0x20);
        *puVar26 = CONCAT44(uStack_15c,uStack_160);
        puVar26[1] = CONCAT26(uStack_152,CONCAT15(uStack_153,CONCAT14(uStack_154,uStack_158)));
        plVar17 = (long *)(lVar21 + lVar19 * 0x20);
        *plVar17 = (long)local_170;
        plVar17[1] = CONCAT44(uStack_164,uStack_168);
        *(long *)(in_RCX + 0x710) = lVar19 + 1;
        uVar25 = *(undefined8 *)(in_RCX + 0x538);
        func_0x000140002200();
        puVar14 = (undefined4 *)func_0x0001400021c0();
        if (puVar14 == (undefined4 *)0x0) {
          func_0x0001464ce07b();
          goto LAB_145ec06c0;
        }
        *puVar14 = uVar59;
        *(undefined8 *)(puVar14 + 1) = uVar25;
        lVar19 = *(long *)(in_RCX + 0x710);
        if (lVar19 == *(long *)(in_RCX + 0x700)) {
          func_0x000146326cc0();
        }
        lVar21 = *(long *)(in_RCX + 0x708);
        lVar20 = lVar19 * 0x20;
        *(undefined8 *)(lVar21 + lVar20) = 0x20;
        *(undefined4 **)(lVar21 + 8 + lVar20) = puVar14;
        *(undefined8 *)(lVar21 + 0x10 + lVar20) = 0xc;
        *(undefined2 *)(lVar21 + 0x18 + lVar20) = 0x135;
        *(long *)(in_RCX + 0x710) = lVar19 + 1;
        uVar30 = *(ulong *)(in_RCX + 0x408);
      }
    }
    if (uVar30 <= uVar33) {
      func_0x0001464ce413();
      goto LAB_145ec06c0;
    }
    lVar19 = *(long *)(in_RCX + 0x400);
    fVar37 = *(float *)(lVar19 + 0xc + lVar18);
    uVar30 = uVar33 + 1;
    if (*(char *)(*(long *)(lVar19 + lVar18) + 0x75) == '\v') {
      if (fVar37 <= fVar56) {
        fVar37 = fVar56;
      }
      *(float *)(lVar19 + lVar18 + 0xc) = fVar37;
    }
    else if (fVar37 <= fVar56) {
      *(undefined4 *)(lVar19 + lVar18 + 0xc) = 0x7f800000;
      if (*(ulong *)(in_RCX + 0x408) <= uVar33) {
        func_0x0001464ce413();
        goto LAB_145ec06c0;
      }
      local_170 = *(long **)(*(long *)(in_RCX + 0x400) + lVar18);
      lVar21 = *(long *)(in_RCX + 0x400) + lVar18;
      plVar17 = (long *)*local_170;
      lVar19 = local_170[1];
      if (lVar19 == 9) {
        if ((char)plVar17[1] != 'r' || *plVar17 != 0x657469626b636f72) goto LAB_145ebeefa;
LAB_145ebf0de:
        uStack_168 = *(undefined4 *)(lVar21 + 8);
        uStack_15c = *(undefined4 *)(lVar21 + 0x14);
        uStack_158 = *(undefined4 *)(lVar21 + 0x18);
        uStack_164 = (undefined4)*(undefined8 *)(lVar21 + 0xc);
        uStack_160 = (undefined4)((ulong)*(undefined8 *)(lVar21 + 0xc) >> 0x20);
        uVar25 = *(undefined8 *)(lVar21 + 0x1c);
        uStack_154 = (undefined1)uVar25;
        uStack_153 = (undefined1)((ulong)uVar25 >> 8);
        uStack_152 = (undefined2)((ulong)uVar25 >> 0x10);
        *(undefined2 *)(in_RCX + 0x142) = 1;
        *(undefined8 *)(in_RCX + 0x108) = 0;
        cVar10 = func_0x000145f17720();
        *(undefined1 *)(in_RCX + 0x142) = 0;
        if (cVar10 != '\0') {
          lVar20 = *(long *)(in_RCX + 0xf8);
          plVar24 = *(long **)(in_RCX + 0x100);
          lVar21 = *(long *)(in_RCX + 0x108);
          *(undefined8 *)(in_RCX + 0xf8) = 0;
          *(undefined8 *)(in_RCX + 0x100) = 8;
          *(undefined8 *)(in_RCX + 0x108) = 0;
          if (lVar20 != -1) {
            if (lVar21 != 0) {
              if ((lVar19 == 9) && ((char)plVar17[1] == 'r' && *plVar17 == 0x657469626b636f72)) {
                lVar21 = -1;
                lVar19 = 0;
                do {
                  if (*(long *)(in_RCX + 0xa20) << 6 == lVar19) goto LAB_145ebf207;
                  lVar21 = lVar21 + 1;
                  pcVar2 = (char *)(*(long *)(in_RCX + 0xa18) + lVar19);
                  lVar19 = lVar19 + 0x40;
                } while (*pcVar2 != '+');
                lVar19 = *plVar24;
                lVar29 = *(long *)(in_RCX + 0x650) * 0x208;
                lVar16 = *(long *)(in_RCX + 0x648) + -0x208;
                do {
                  if (lVar29 == 0) goto LAB_145ebf207;
                  lVar29 = lVar29 + -0x208;
                  plVar17 = (long *)(lVar16 + 0x2f8);
                  lVar16 = lVar16 + 0x208;
                } while (*plVar17 != lVar19);
                func_0x000145dc6770();
                local_218 = (undefined4)lVar19;
                uStack_214 = (undefined4)((ulong)lVar19 >> 0x20);
                func_0x000145f20b30();
                func_0x000145d840f0();
                lVar29 = *(long *)(in_RCX + 0x710);
                if (lVar29 == *(long *)(in_RCX + 0x700)) {
                  func_0x000146326cc0();
                }
                lVar16 = *(long *)(in_RCX + 0x708);
                puVar26 = (undefined8 *)(lVar16 + 0x10 + lVar29 * 0x20);
                *puVar26 = CONCAT44(uStack_204,uStack_208);
                puVar26[1] = CONCAT44(uStack_1fc,uStack_200);
                plVar17 = (long *)(lVar16 + lVar29 * 0x20);
                *plVar17 = lVar19;
                plVar17[1] = CONCAT44(uStack_20c,uStack_210);
                *(long *)(in_RCX + 0x710) = lVar29 + 1;
                plVar17 = (long *)func_0x000145d867a0();
                uVar25 = *(undefined8 *)(in_RCX + 0x20);
                uVar6 = *(undefined8 *)(in_RCX + 0x28);
                *(undefined8 *)(in_RCX + 0x20) = 1;
                *(long *)(in_RCX + 0x28) = lVar21;
                if (local_228 != 0) {
                  lVar19 = local_230;
                  do {
                    plVar24 = (long *)*plVar17;
                    fVar37 = 0.0;
                    if (plVar17[1] == 0xb) {
                      if (*(long *)((long)plVar24 + 3) == 0x656b697274736d72 &&
                          *plVar24 == 0x7274736d726f7473) goto LAB_145ebfd17;
                    }
                    else if ((plVar17[1] == 9) &&
                            ((char)plVar24[1] == 'r' && *plVar24 == 0x657469626b636f72)) {
LAB_145ebfd17:
                      if (*(long *)(in_RCX + 0xa20) != 0) {
                        lVar21 = *(long *)(in_RCX + 0xa18);
                        lVar29 = 0;
                        do {
                          if ((*(char *)(lVar21 + lVar29) == '*') &&
                             (*(char *)(lVar21 + 2 + lVar29) == '\0')) {
                            fVar37 = ((float)*(byte *)(lVar21 + 1 + lVar29) * _DAT_1464d5dc8) /
                                     _DAT_1464d5e80;
                            break;
                          }
                          lVar29 = lVar29 + 0x40;
                        } while (*(long *)(in_RCX + 0xa20) << 6 != lVar29);
                      }
                    }
                    uVar15 = *(ulong *)(in_RCX + 0xde8);
                    uVar22 = *(ulong *)(in_RCX + 0xdf0);
                    uVar30 = *(ulong *)(in_RCX + 0xe00) + uVar15;
                    uVar34 = *(ulong *)(in_RCX + 0xdf8) ^ uVar15;
                    uVar32 = *(ulong *)(in_RCX + 0xe00) ^ uVar22;
                    *(ulong *)(in_RCX + 0xdf0) = uVar22 ^ uVar34;
                    *(ulong *)(in_RCX + 0xde8) = uVar15 ^ uVar32;
                    *(ulong *)(in_RCX + 0xdf8) = uVar34 ^ uVar22 << 0x11;
                    *(ulong *)(in_RCX + 0xe00) = uVar32 << 0x2d | uVar32 >> 0x13;
                    if (((((float)(uint)((uVar30 * 0x800000 | uVar30 >> 0x29) + uVar15 >> 0x28) *
                           _DAT_1465a1e90 < fVar37 + *(float *)(in_RCX + 0x5d4)) &&
                         (plVar17[1] == 0xb)) &&
                        (*(long *)(*plVar17 + 3) == 0x656b697274736d72 &&
                         *(long *)*plVar17 == 0x7274736d726f7473)) &&
                       (*(long *)(in_RCX + 0x260) != 0)) {
                      lVar21 = 0;
                      do {
                        lVar29 = *(long *)(*(long *)(in_RCX + 600) + lVar21);
                        if (*(long *)(lVar29 + 0x48) == 0x12) {
                          pcVar2 = *(char **)(lVar29 + 0x40);
                          auVar47[0] = -(*pcVar2 == DAT_147a1ac10);
                          auVar47[1] = -(pcVar2[1] == cRam0000000147a1ac11);
                          auVar47[2] = -(pcVar2[2] == cRam0000000147a1ac12);
                          auVar47[3] = -(pcVar2[3] == cRam0000000147a1ac13);
                          auVar47[4] = -(pcVar2[4] == cRam0000000147a1ac14);
                          auVar47[5] = -(pcVar2[5] == cRam0000000147a1ac15);
                          auVar47[6] = -(pcVar2[6] == cRam0000000147a1ac16);
                          auVar47[7] = -(pcVar2[7] == cRam0000000147a1ac17);
                          auVar47[8] = -(pcVar2[8] == cRam0000000147a1ac18);
                          auVar47[9] = -(pcVar2[9] == cRam0000000147a1ac19);
                          auVar47[10] = -(pcVar2[10] == cRam0000000147a1ac1a);
                          auVar47[0xb] = -(pcVar2[0xb] == cRam0000000147a1ac1b);
                          auVar47[0xc] = -(pcVar2[0xc] == cRam0000000147a1ac1c);
                          auVar47[0xd] = -(pcVar2[0xd] == cRam0000000147a1ac1d);
                          auVar47[0xe] = -(pcVar2[0xe] == cRam0000000147a1ac1e);
                          auVar47[0xf] = -(pcVar2[0xf] == cRam0000000147a1ac1f);
                          auVar51[0] = -((char)*(undefined2 *)(pcVar2 + 0x10) == DAT_147a1ac20);
                          auVar51[1] = -((char)((ushort)*(undefined2 *)(pcVar2 + 0x10) >> 8) ==
                                        cRam0000000147a1ac21);
                          auVar51[2] = -(cRam0000000147a1ac22 == '\0');
                          auVar51[3] = -(cRam0000000147a1ac23 == '\0');
                          auVar51[4] = -(cRam0000000147a1ac24 == '\0');
                          auVar51[5] = -(cRam0000000147a1ac25 == '\0');
                          auVar51[6] = -(cRam0000000147a1ac26 == '\0');
                          auVar51[7] = -(cRam0000000147a1ac27 == '\0');
                          auVar51[8] = -(cRam0000000147a1ac28 == '\0');
                          auVar51[9] = -(cRam0000000147a1ac29 == '\0');
                          auVar51[10] = -(cRam0000000147a1ac2a == '\0');
                          auVar51[0xb] = -(cRam0000000147a1ac2b == '\0');
                          auVar51[0xc] = -(cRam0000000147a1ac2c == '\0');
                          auVar51[0xd] = -(cRam0000000147a1ac2d == '\0');
                          auVar51[0xe] = -(cRam0000000147a1ac2e == '\0');
                          auVar51[0xf] = -(cRam0000000147a1ac2f == '\0');
                          auVar51 = auVar51 & auVar47;
                          if ((ushort)((ushort)(SUB161(auVar51 >> 7,0) & 1) |
                                       (ushort)(SUB161(auVar51 >> 0xf,0) & 1) << 1 |
                                       (ushort)(SUB161(auVar51 >> 0x17,0) & 1) << 2 |
                                       (ushort)(SUB161(auVar51 >> 0x1f,0) & 1) << 3 |
                                       (ushort)(SUB161(auVar51 >> 0x27,0) & 1) << 4 |
                                       (ushort)(SUB161(auVar51 >> 0x2f,0) & 1) << 5 |
                                       (ushort)(SUB161(auVar51 >> 0x37,0) & 1) << 6 |
                                       (ushort)(SUB161(auVar51 >> 0x3f,0) & 1) << 7 |
                                       (ushort)(SUB161(auVar51 >> 0x47,0) & 1) << 8 |
                                       (ushort)(SUB161(auVar51 >> 0x4f,0) & 1) << 9 |
                                       (ushort)(SUB161(auVar51 >> 0x57,0) & 1) << 10 |
                                       (ushort)(SUB161(auVar51 >> 0x5f,0) & 1) << 0xb |
                                       (ushort)(SUB161(auVar51 >> 0x67,0) & 1) << 0xc |
                                       (ushort)(SUB161(auVar51 >> 0x6f,0) & 1) << 0xd |
                                       (ushort)(SUB161(auVar51 >> 0x77,0) & 1) << 0xe |
                                      (ushort)(byte)(auVar51[0xf] >> 7) << 0xf) == 0xffff) break;
                        }
                        lVar21 = lVar21 + 0x10;
                      } while (*(long *)(in_RCX + 0x260) << 4 != lVar21);
                    }
                    uVar3 = *(undefined1 *)(in_RCX + 0x236);
                    *(undefined1 *)(in_RCX + 0x236) = 3;
                    func_0x000145ee6190();
                    lVar19 = lVar19 + 8;
                    *(undefined1 *)(in_RCX + 0x236) = uVar3;
                  } while (lVar19 != local_230 + local_228 * 8);
                }
                if (CONCAT44(uStack_234,local_238) != 0) {
                  func_0x0001400021d0();
                }
                *(undefined8 *)(in_RCX + 0x20) = uVar25;
                *(undefined8 *)(in_RCX + 0x28) = uVar6;
              }
LAB_145ebf207:
              func_0x000145ea2c30();
            }
joined_r0x000145ebf22a:
            if (lVar20 != 0) {
              func_0x0001400021d0();
            }
            goto LAB_145ebef86;
          }
        }
LAB_145ebf6ef:
        bVar36 = false;
      }
      else {
        if (lVar19 == 0xb) {
          if (*(long *)((long)plVar17 + 3) == 0x656b697274736d72 && *plVar17 == 0x7274736d726f7473)
          goto LAB_145ebf0de;
          if (((*(long *)((long)plVar17 + 3) != 0x6b636f68735f6874 || *plVar17 != 0x68735f6874726165
               ) && (*(long *)((long)plVar17 + 3) != 0x6b636f68735f656d ||
                     *plVar17 != 0x68735f656d616c66)) &&
             (*(long *)((long)plVar17 + 3) != 0x6b636f68735f7473 || *plVar17 != 0x68735f74736f7266))
          goto LAB_145ebeefa;
          if (*(long *)(in_RCX + 0xa20) != 0) {
            uVar59 = *(undefined4 *)(in_RCX + 0xe88);
            lVar19 = *(long *)(in_RCX + 0xa18);
            lVar29 = *(long *)(in_RCX + 0xa20) << 6;
            lVar20 = 0;
            do {
              if ((*(char *)(lVar19 + lVar20) == '*') && (*(char *)(lVar19 + 2 + lVar20) == '\x03'))
              {
                bVar36 = true;
                goto LAB_145ebf3aa;
              }
              lVar20 = lVar20 + 0x40;
            } while (lVar29 != lVar20);
            bVar36 = false;
LAB_145ebf3aa:
            lVar20 = 0;
            do {
              if ((*(char *)(lVar19 + lVar20) == '*') && (*(char *)(lVar19 + 2 + lVar20) == '\x02'))
              {
                bVar9 = 1;
                goto LAB_145ebf428;
              }
              lVar20 = lVar20 + 0x40;
            } while (lVar29 != lVar20);
            if (bVar36) {
              bVar9 = 0;
LAB_145ebf428:
              uStack_210 = *(undefined4 *)(lVar21 + 8);
              uStack_204 = *(undefined4 *)(lVar21 + 0x14);
              uStack_200 = *(undefined4 *)(lVar21 + 0x18);
              uVar25 = *(undefined8 *)(lVar21 + 0x1c);
              local_218 = SUB84(local_170,0);
              uStack_214 = (undefined4)((ulong)local_170 >> 0x20);
              uStack_20c = (undefined4)*(undefined8 *)(lVar21 + 0xc);
              uStack_208 = (undefined4)((ulong)*(undefined8 *)(lVar21 + 0xc) >> 0x20);
              uStack_1fc = (undefined4)uVar25;
              *(undefined1 *)(in_RCX + 0x141) = 1;
              *(undefined8 *)(in_RCX + 0xf0) = 0;
              uStack_154 = (undefined1)uVar25;
              uStack_153 = (undefined1)((ulong)uVar25 >> 8);
              uStack_152 = (undefined2)((ulong)uVar25 >> 0x10);
              cVar10 = func_0x000145f17720();
              *(undefined1 *)(in_RCX + 0x141) = 0;
              uStack_168 = uStack_210;
              uStack_164 = uStack_20c;
              uStack_160 = uStack_208;
              uStack_15c = uStack_204;
              uStack_158 = uStack_200;
              if (cVar10 != '\0') {
                lVar20 = *(long *)(in_RCX + 0xe0);
                lVar19 = *(long *)(in_RCX + 0xf0);
                *(undefined8 *)(in_RCX + 0xe0) = 0;
                *(undefined8 *)(in_RCX + 0xe8) = 8;
                *(undefined8 *)(in_RCX + 0xf0) = 0;
                *(long **)(in_RCX + 0x120) = plVar17;
                *(undefined8 *)(in_RCX + 0x128) = 0xb;
                *(undefined4 *)(in_RCX + 0x130) = uVar59;
                if ((bool)(bVar9 & lVar19 != 0)) {
                  func_0x000145ea21f0();
                  if (*(long *)(in_RCX + 0xa20) != 0) {
                    lVar19 = 0;
                    do {
                      if ((*(char *)(*(long *)(in_RCX + 0xa18) + lVar19) == '*') &&
                         (*(char *)(*(long *)(in_RCX + 0xa18) + 2 + lVar19) == '\v')) {
                        uVar30 = *(ulong *)(in_RCX + 0xde8);
                        uVar15 = *(ulong *)(in_RCX + 0xdf0);
                        uVar32 = *(ulong *)(in_RCX + 0xdf8) ^ uVar30;
                        uVar22 = uVar15 ^ *(ulong *)(in_RCX + 0xe00);
                        *(ulong *)(in_RCX + 0xdf0) = uVar32 ^ uVar15;
                        *(ulong *)(in_RCX + 0xde8) = uVar22 ^ uVar30;
                        *(ulong *)(in_RCX + 0xdf8) = uVar32 ^ uVar15 << 0x11;
                        uVar15 = *(ulong *)(in_RCX + 0xe00) + uVar30;
                        *(ulong *)(in_RCX + 0xe00) = uVar22 << 0x2d | uVar22 >> 0x13;
                        if ((float)(uint)((uVar15 * 0x800000 | uVar15 >> 0x29) + uVar30 >> 0x28) *
                            _DAT_1465a1e90 < _DAT_1464e41a0) {
                          func_0x000145ea21f0();
                        }
                        break;
                      }
                      lVar19 = lVar19 + 0x40;
                    } while (*(long *)(in_RCX + 0xa20) << 6 != lVar19);
                  }
                }
                goto joined_r0x000145ebf22a;
              }
              goto LAB_145ebf6ef;
            }
          }
          uStack_168 = *(undefined4 *)(lVar21 + 8);
          uStack_15c = *(undefined4 *)(lVar21 + 0x14);
          uStack_158 = *(undefined4 *)(lVar21 + 0x18);
          uStack_164 = (undefined4)*(undefined8 *)(lVar21 + 0xc);
          uStack_160 = (undefined4)((ulong)*(undefined8 *)(lVar21 + 0xc) >> 0x20);
          uVar25 = *(undefined8 *)(lVar21 + 0x1c);
          uStack_154 = (undefined1)uVar25;
          uStack_153 = (undefined1)((ulong)uVar25 >> 8);
          uStack_152 = (undefined2)((ulong)uVar25 >> 0x10);
          cVar10 = func_0x000145f17720();
        }
        else {
LAB_145ebeefa:
          uStack_168 = *(undefined4 *)(lVar21 + 8);
          uStack_15c = *(undefined4 *)(lVar21 + 0x14);
          uStack_158 = *(undefined4 *)(lVar21 + 0x18);
          uStack_164 = (undefined4)*(undefined8 *)(lVar21 + 0xc);
          uStack_160 = (undefined4)((ulong)*(undefined8 *)(lVar21 + 0xc) >> 0x20);
          uVar25 = *(undefined8 *)(lVar21 + 0x1c);
          uStack_154 = (undefined1)uVar25;
          uStack_153 = (undefined1)((ulong)uVar25 >> 8);
          uStack_152 = (undefined2)((ulong)uVar25 >> 0x10);
          cVar10 = func_0x000145f17720();
        }
        if (cVar10 == '\0') goto LAB_145ebf6ef;
LAB_145ebef86:
        if (*(ulong *)(in_RCX + 0x408) <= uVar33) {
          func_0x0001464ce413();
          goto LAB_145ec06c0;
        }
        if ((*(int *)(in_RCX + 0x224) == 0) && (*(long *)(in_RCX + 0xa20) != 0)) {
          lVar19 = *(long *)(*(long *)(in_RCX + 0x400) + lVar18);
          uStack_168 = *(undefined4 *)(lVar19 + 0x40);
          uStack_154 = *(undefined1 *)(lVar19 + 0x74);
          uStack_15c = *(undefined4 *)(in_RCX + 0x558);
          uStack_164 = (undefined4)*(undefined8 *)(in_RCX + 0x550);
          uStack_160 = (undefined4)((ulong)*(undefined8 *)(in_RCX + 0x550) >> 0x20);
          uStack_153 = 3;
          local_170 = (long *)0x0;
          uStack_158 = 0;
          uStack_152 = 0;
          func_0x000145f2dab0();
        }
        bVar36 = true;
        if (fVar56 < *(float *)(in_RCX + 0x604)) {
          uVar30 = *(ulong *)(in_RCX + 0xa20);
          if ((uVar30 != 0) && (uVar30 != 1)) {
            uVar15 = 0;
            do {
              uVar15 = uVar15 + 2;
            } while ((uVar30 & 0xfffffffffffffffe) != uVar15);
          }
          iVar12 = func_0x000145f637b0();
          *(undefined1 *)(in_RCX + 0xb24) = 1;
          if (iVar12 != 0) {
            iVar23 = 0;
            do {
              if (*(ulong *)(in_RCX + 0x408) <= uVar33) {
                func_0x0001464ce413();
                goto LAB_145ec06c0;
              }
              lVar19 = *(long *)(in_RCX + 0x400);
              local_170 = *(long **)(lVar19 + lVar18);
              uStack_168 = *(undefined4 *)(lVar19 + 8 + lVar18);
              uStack_15c = *(undefined4 *)(lVar19 + 0x14 + lVar18);
              uStack_158 = *(undefined4 *)(lVar19 + 0x18 + lVar18);
              uVar25 = *(undefined8 *)(lVar19 + 0xc + lVar18);
              uStack_164 = (undefined4)uVar25;
              uStack_160 = (undefined4)((ulong)uVar25 >> 0x20);
              uVar25 = *(undefined8 *)(lVar19 + 0x1c + lVar18);
              uStack_154 = (undefined1)uVar25;
              uStack_153 = (undefined1)((ulong)uVar25 >> 8);
              uStack_152 = (undefined2)((ulong)uVar25 >> 0x10);
              func_0x000145f17720();
              iVar23 = iVar23 + 1;
            } while (iVar23 != iVar12);
          }
          *(undefined1 *)(in_RCX + 0xb24) = 0;
        }
      }
      if (*(ulong *)(in_RCX + 0x408) <= uVar33) {
        func_0x0001464ce413();
        goto LAB_145ec06c0;
      }
      lVar19 = *(long *)(in_RCX + 0x400) + lVar18;
      plVar17 = *(long **)(*(long *)(in_RCX + 0x400) + lVar18);
      lVar18 = plVar17[1];
      fVar37 = fVar55;
      if (lVar18 == 0xd) {
        if (*(long *)(*plVar17 + 5) == CONCAT53(uRam0000000147a1fd58,_DAT_147a1fd55) &&
            *(long *)*plVar17 == CONCAT35(_DAT_147a1fd55,_DAT_147a1fd50)) {
          fVar37 = *(float *)(plVar17 + 0xb) * fVar57 * *(float *)(lVar19 + 0x20) *
                   *(float *)(lVar19 + 0x48);
          if (_DAT_1464d5ea0 <= fVar37) {
            fVar37 = _DAT_1464d5ea0;
          }
          fVar37 = fVar53 - fVar37;
        }
      }
      else if ((lVar18 == 8) && (fVar37 = fVar38, *(long *)*plVar17 != _DAT_147a1fd48)) {
        fVar37 = fVar55;
      }
      fVar41 = *(float *)(plVar17 + 9) * fVar57 * *(float *)(lVar19 + 0x14) *
               *(float *)(lVar19 + 0x3c) * *(float *)(in_RCX + 0x5d0);
      fVar58 = fVar41;
      if (fVar41 <= fVar37) {
        fVar58 = fVar37;
      }
      fVar37 = (float)(~-(uint)NAN(fVar58) & (uint)fVar58 | (uint)fVar41 & -(uint)NAN(fVar58));
      if ((int)plVar17[0xd] == 0xc) {
        fVar58 = *(float *)(plVar17 + 0xb) * fVar57 * *(float *)(lVar19 + 0x20) *
                 *(float *)(lVar19 + 0x48);
        if (((lVar18 == 0xd) &&
            (*(long *)(*plVar17 + 5) == 0x646c656968735f65 &&
             *(long *)*plVar17 == 0x735f656e69766964)) && (_DAT_1464d5ea0 <= fVar58)) {
          fVar58 = _DAT_1464d5ea0;
        }
        if (fVar58 <= _DAT_1464e4250) {
          fVar58 = _DAT_1464e4250;
        }
        fVar37 = fVar37 + fVar58;
      }
      uVar30 = uVar33 + 1;
      if (bVar36) {
        fVar58 = *(float *)(lVar19 + 0xc);
        fVar41 = fVar58;
        if (fVar37 <= fVar58) {
          fVar41 = fVar37;
        }
        fVar37 = (float)(-(uint)NAN(fVar41) & (uint)fVar58 | ~-(uint)NAN(fVar41) & (uint)fVar41);
        *(float *)(lVar19 + 0xc) = fVar37;
        if (*(long *)(in_RCX + 0xa20) != 0) {
          plVar24 = (long *)*plVar17;
          lVar19 = *(long *)(in_RCX + 0xa18);
          lVar18 = 0;
          do {
            if ((*(char *)(lVar19 + lVar18) == '*') && (*(char *)(lVar19 + 2 + lVar18) == '\n')) {
              if (plVar17[1] == 0xb) {
                if (*(long *)((long)plVar24 + 3) != 0x656b697274736d72 ||
                    *plVar24 != 0x7274736d726f7473) break;
              }
              else if ((plVar17[1] != 9) ||
                      ((char)plVar24[1] != 'r' || *plVar24 != 0x657469626b636f72)) break;
              if ((*(float *)(in_RCX + 0xe88) < *(float *)(in_RCX + 0x13c)) &&
                 (fVar58 = ((float)*(byte *)(lVar19 + 1 + lVar18) * _DAT_1464d5ea0) / _DAT_1464d5e80
                           + fVar54, fVar54 < fVar58)) {
                fVar41 = *(float *)(in_RCX + 0x13c) - *(float *)(in_RCX + 0xe88);
                if (fVar37 <= fVar58 * fVar41) {
                  fVar37 = fVar37 / fVar58;
                }
                else {
                  fVar37 = fVar37 - (fVar58 + _DAT_1464e7a54) * fVar41;
                }
              }
              break;
            }
            lVar18 = lVar18 + 0x40;
          } while (*(long *)(in_RCX + 0xa20) << 6 != lVar18);
        }
        fVar37 = fVar37 * fVar40;
        uStack_214 = (undefined4)(long)fVar37;
        if (fVar37 < fVar56) {
          uStack_214 = 0;
        }
        local_218 = (undefined4)plVar17[8];
        if (fVar60 < fVar37) {
          uStack_214 = 0xffffffff;
        }
        func_0x000145d79880();
        lVar19 = *(long *)(in_RCX + 0x710);
        if (lVar19 == *(long *)(in_RCX + 0x700)) {
          func_0x000146326cc0();
        }
        lVar18 = *(long *)(in_RCX + 0x708);
        puVar26 = (undefined8 *)(lVar18 + 0x10 + lVar19 * 0x20);
        *puVar26 = CONCAT44(uStack_15c,uStack_160);
        puVar26[1] = CONCAT26(uStack_152,CONCAT15(uStack_153,CONCAT14(uStack_154,uStack_158)));
        plVar17 = (long *)(lVar18 + lVar19 * 0x20);
        *plVar17 = (long)local_170;
        plVar17[1] = CONCAT44(uStack_164,uStack_168);
        *(long *)(in_RCX + 0x710) = lVar19 + 1;
        uVar25 = *(undefined8 *)(in_RCX + 0x538);
        func_0x000140002200();
        puVar14 = (undefined4 *)func_0x0001400021c0();
        if (puVar14 == (undefined4 *)0x0) {
          func_0x0001464ce07b();
          goto LAB_145ec06c0;
        }
        *puVar14 = local_218;
        *(undefined8 *)(puVar14 + 1) = uVar25;
        lVar19 = *(long *)(in_RCX + 0x710);
        if (lVar19 == *(long *)(in_RCX + 0x700)) {
          func_0x000146326cc0();
        }
        lVar18 = *(long *)(in_RCX + 0x708);
        lVar21 = lVar19 * 0x20;
        *(undefined8 *)(lVar18 + lVar21) = 0x20;
        *(undefined4 **)(lVar18 + 8 + lVar21) = puVar14;
        *(undefined8 *)(lVar18 + 0x10 + lVar21) = 0xc;
        *(undefined2 *)(lVar18 + 0x18 + lVar21) = 0x135;
        *(long *)(in_RCX + 0x710) = lVar19 + 1;
      }
      else {
        *(undefined4 *)(lVar19 + 0xc) = 0x3e4ccccd;
      }
    }
  }
  param_2 = *(float *)(in_RCX + 0x4ec) - param_2;
  *(float *)(in_RCX + 0x4ec) = param_2;
  if (param_2 <= 0.0) {
    cVar10 = func_0x000145f17720();
    plVar17 = *(long **)(in_RCX + 0x4e0);
    fVar38 = _DAT_1464e2df8;
    if (plVar17[1] == 0xd) {
      if (*(long *)(*plVar17 + 5) == CONCAT53(uRam0000000147a1fd58,_DAT_147a1fd55) &&
          *(long *)*plVar17 == CONCAT35(_DAT_147a1fd55,_DAT_147a1fd50)) {
        fVar38 = *(float *)(plVar17 + 0xb) * _DAT_1464e7ad0 * *(float *)(in_RCX + 0x500) *
                 *(float *)(in_RCX + 0x528);
        if (_DAT_1464d5ea0 <= fVar38) {
          fVar38 = _DAT_1464d5ea0;
        }
        fVar38 = fVar53 - fVar38;
      }
    }
    else if ((plVar17[1] == 8) && (*(long *)*plVar17 == _DAT_147a1fd48)) {
      fVar38 = _DAT_1464d5d10;
    }
    if (cVar10 == '\0') {
      *(undefined4 *)(in_RCX + 0x4ec) = 0x3f000000;
    }
    else {
      fVar53 = *(float *)(plVar17 + 9) * _DAT_1464e7ad0 * *(float *)(in_RCX + 0x4f4) *
               *(float *)(in_RCX + 0x51c) * *(float *)(in_RCX + 0x5d0);
      fVar54 = fVar53;
      if (fVar53 <= fVar38) {
        fVar54 = fVar38;
      }
      *(uint *)(in_RCX + 0x4ec) =
           ~-(uint)NAN(fVar54) & (uint)fVar54 | (uint)fVar53 & -(uint)NAN(fVar54);
      uVar59 = (undefined4)plVar17[8];
      func_0x000145d79880();
      lVar19 = *(long *)(in_RCX + 0x710);
      if (lVar19 == *(long *)(in_RCX + 0x700)) {
        func_0x000146326cc0();
      }
      lVar18 = *(long *)(in_RCX + 0x708);
      puVar26 = (undefined8 *)(lVar18 + 0x10 + lVar19 * 0x20);
      *puVar26 = CONCAT44(uStack_204,uStack_208);
      puVar26[1] = CONCAT44(uStack_1fc,uStack_200);
      puVar26 = (undefined8 *)(lVar18 + lVar19 * 0x20);
      *puVar26 = CONCAT44(uStack_214,local_218);
      puVar26[1] = CONCAT44(uStack_20c,uStack_210);
      *(long *)(in_RCX + 0x710) = lVar19 + 1;
      uVar25 = *(undefined8 *)(in_RCX + 0x538);
      func_0x000140002200();
      puVar14 = (undefined4 *)func_0x0001400021c0();
      if (puVar14 == (undefined4 *)0x0) {
        func_0x0001464ce07b();
LAB_145ec06c0:
                    /* WARNING: Does not return */
        pcVar5 = (code *)invalidInstructionException();
        (*pcVar5)();
      }
      *puVar14 = uVar59;
      *(undefined8 *)(puVar14 + 1) = uVar25;
      lVar19 = *(long *)(in_RCX + 0x710);
      if (lVar19 == *(long *)(in_RCX + 0x700)) {
        func_0x000146326cc0();
      }
      lVar18 = *(long *)(in_RCX + 0x708);
      lVar21 = lVar19 * 0x20;
      *(undefined8 *)(lVar18 + lVar21) = 0x20;
      *(undefined4 **)(lVar18 + 8 + lVar21) = puVar14;
      *(undefined8 *)(lVar18 + 0x10 + lVar21) = 0xc;
      *(undefined2 *)(lVar18 + 0x18 + lVar21) = 0x135;
      *(long *)(in_RCX + 0x710) = lVar19 + 1;
    }
  }
  func_0x000145f23850();
  return;
}
