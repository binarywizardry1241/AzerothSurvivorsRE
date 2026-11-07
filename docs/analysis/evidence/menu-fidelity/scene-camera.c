/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Possible PIC construction at 0x00014084fee6: Changing call to branch */
/* WARNING: Removing unreachable block (ram,0x00014084feeb) */
/* WARNING: Removing unreachable block (ram,0x00014084ff01) */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_14084f860(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 param_4,
                  long *param_5,ulong *param_6)

{
  uint *puVar1;
  float *pfVar2;
  undefined4 uVar3;
  undefined1 auVar4 [16];
  undefined1 auVar5 [16];
  ulong *puVar6;
  byte bVar7;
  char cVar8;
  ulong uVar9;
  uint *puVar10;
  uint uVar11;
  ulong unaff_RBP;
  long lVar12;
  long lVar13;
  long lVar14;
  long lVar15;
  long in_R10;
  long lVar16;
  long lVar17;
  uint uVar18;
  int iVar19;
  long lVar20;
  bool bVar21;
  float extraout_XMM0_Da;
  float fVar22;
  float fVar23;
  float fVar24;
  float fVar25;
  float fVar26;
  float fVar27;
  float fVar28;
  long *in_stack_00000028;
  float *in_stack_00000030;
  float local_108;
  float fStack_104;
  float fStack_100;
  float fStack_fc;
  undefined8 local_e0;

  lVar12 = *param_3;
  lVar13 = param_3[1];
  uVar3 = *(undefined4 *)((long)param_3 + 0x14);
  lVar14 = *param_5;
  uVar9 = *param_6;
  lVar16 = *in_stack_00000028;
  if (_DAT_148044208 == 0) {
    LOCK();
    bVar21 = DAT_1480441d8 == '\0';
    if (bVar21) {
      DAT_1480441d8 = '\x01';
    }
    UNLOCK();
  }
  else {
    func_0x000145c273e2();
    LOCK();
    bVar21 = DAT_1480441d8 == '\0';
    if (bVar21) {
      DAT_1480441d8 = '\x01';
    }
    UNLOCK();
  }
  if (!bVar21) {
    func_0x000145d97960();
  }
  puVar6 = _DAT_14808a9e8;
  if ((*_DAT_14808a9e8 & 0x7fffffffffffffff) == 0) {
    bVar7 = 0;
    fVar27 = _DAT_1480441e8;
    fVar22 = _DAT_1480441ec;
    fVar24 = _DAT_1480441f0;
    fVar28 = _DAT_148044200;
  }
  else {
    bVar7 = func_0x000145d986f0();
    bVar7 = bVar7 ^ 1;
    unaff_RBP = uVar9;
    fVar27 = _DAT_1480441e8;
    fVar22 = _DAT_1480441ec;
    fVar24 = _DAT_1480441f0;
    fVar28 = _DAT_148044200;
  }
  _DAT_1480441e8 = fVar27;
  _DAT_1480441ec = fVar22;
  _DAT_1480441f0 = fVar24;
  _DAT_148044200 = fVar28;
  if ((_DAT_1480441dc == 1) && (DAT_148044205 != '\0')) {
    if (((bVar7 == 0) && ((*puVar6 & 0x7fffffffffffffff) != 0)) &&
       (cVar8 = func_0x000145d986f0(), cVar8 == '\0')) {
      DAT_1480441d9 = 1;
    }
    cVar8 = DAT_1480441d8;
    LOCK();
    DAT_1480441d8 = 0;
    UNLOCK();
    if (cVar8 != '\x02') {
      fVar26 = 0.0;
      fVar23 = 0.0;
      fVar25 = fVar24;
      if (lVar14 != 0) {
        fStack_100 = (float)((uint)fVar27 ^ _DAT_145dcd0a0);
        local_108 = (float)(_DAT_145dcd0a0 ^ (uint)fVar22);
        uVar9 = func_0x0001417080b0();
        fVar23 = 0.0;
        fStack_104 = fVar24;
        if (((uVar9 & 1) != 0) && (fVar23 = (fVar28 + extraout_XMM0_Da) - fVar25, fVar23 <= 0.0)) {
          fVar23 = 0.0;
        }
      }
      fVar24 = *(float *)(lVar16 + 0x58) + *(float *)(lVar16 + 0x58);
      if (_DAT_145d9d2a0 <= fVar24) {
        fVar24 = _DAT_145d9d2a0;
      }
      fVar24 = fVar24 * (fVar23 - *in_stack_00000030) + *in_stack_00000030;
      *in_stack_00000030 = fVar24;
      fVar25 = fVar25 + fVar24;
      fVar22 = fVar26 * fVar24 - fVar22;
      fVar27 = fVar26 * fVar24 - fVar27;
      FUN_1407e6e70();
      puVar10 = *(uint **)(lVar12 + 0xf8);
      puVar1 = puVar10 + *(long *)(lVar12 + 0x100);
      if (*(char *)(lVar12 + 0x108) == '\0') {
        lVar14 = 0;
        lVar20 = 8;
        lVar16 = 0;
        uVar18 = 0;
        do {
          if (uVar18 == (uint)lVar14) {
            do {
              if (puVar10 == puVar1) {
                return;
              }
              uVar18 = *puVar10;
              puVar10 = puVar10 + 1;
              lVar14 = *(long *)(*(long *)(lVar13 + 0x108) + 0x58 + (ulong)uVar18 * 0xa0);
            } while (lVar14 == 0);
            lVar15 = *(long *)(lVar13 + 0x108) + (ulong)uVar18 * 0xa0;
            uVar9 = (ulong)*(uint *)(lVar15 + 0x94);
            lVar20 = *(long *)(*(long *)(lVar13 + 0x1a8) + 0x18 + uVar9 * 0x48);
            lVar17 = ~*(ulong *)(*(long *)(*(long *)(lVar13 + 0x1a8) + 0x38 + uVar9 * 0x48) +
                                *(long *)(lVar12 + 0x110) * 8) * 0x30;
            lVar16 = *(long *)(lVar20 + 0x10 + lVar17);
            in_R10 = *(long *)(lVar20 + 0x28 + lVar17);
            lVar20 = *(long *)(lVar15 + 0x50);
            uVar18 = 0;
          }
          uVar9 = (ulong)uVar18;
          uVar18 = uVar18 + 1;
          uVar9 = (ulong)~*(uint *)(lVar20 + 8 + uVar9 * 0x10);
          lVar15 = uVar9 * 0x30;
          pfVar2 = (float *)(lVar16 + lVar15);
          fVar24 = *(float *)(lVar16 + 0x10 + lVar15);
          if ((fVar24 != fVar22) || (NAN(fVar24) || NAN(fVar22))) goto LAB_14084fc40;
          if ((pfVar2[5] != fVar25) || (NAN(pfVar2[5]) || NAN(fVar25))) goto LAB_14084fc40;
          if ((((((pfVar2[6] != fVar27) || (NAN(pfVar2[6]) || NAN(fVar27))) ||
                (auVar5._4_4_ = -(uint)(pfVar2[1] == fStack_104),
                auVar5._0_4_ = -(uint)(*pfVar2 == local_108),
                auVar5._8_4_ = -(uint)(pfVar2[2] == fStack_100),
                auVar5._12_4_ = -(uint)(pfVar2[3] == fStack_fc),
                iVar19 = movmskps((int)lVar15,auVar5), iVar19 != 0xf)) ||
               ((pfVar2[7] != 1.0 || (NAN(pfVar2[7]))))) || (pfVar2[8] != 1.0)) ||
             (((NAN(pfVar2[8]) || (pfVar2[9] != 1.0)) || (NAN(pfVar2[9]))))) {
LAB_14084fc40:
            *(undefined4 *)(in_R10 + uVar9 * 4) = uVar3;
            *pfVar2 = local_108;
            pfVar2[1] = fStack_104;
            pfVar2[2] = fStack_100;
            pfVar2[3] = fStack_fc;
            pfVar2[4] = fVar22;
            pfVar2[5] = fVar25;
            pfVar2[6] = fVar27;
            pfVar2[7] = 1.0;
            pfVar2[8] = 1.0;
            pfVar2[9] = 1.0;
            *(undefined8 *)(pfVar2 + 10) = local_e0;
          }
        } while( true );
      }
      lVar14 = 0;
      lVar16 = 0;
      uVar18 = 0;
      do {
        if (uVar18 == (uint)lVar14) {
          do {
            if (puVar10 == puVar1) {
              return;
            }
            uVar18 = *puVar10;
            puVar10 = puVar10 + 1;
            lVar14 = *(long *)(*(long *)(lVar13 + 0x1a8) + 0x10 + (ulong)uVar18 * 0x48);
          } while (lVar14 == 0);
          lVar16 = *(long *)(lVar13 + 0x1a8) + (ulong)uVar18 * 0x48;
          lVar20 = *(long *)(lVar16 + 0x18);
          lVar15 = ~*(ulong *)(*(long *)(lVar16 + 0x38) + *(long *)(lVar12 + 0x110) * 8) * 0x30;
          lVar16 = *(long *)(lVar20 + 0x10 + lVar15);
          param_6 = *(ulong **)(lVar20 + 0x28 + lVar15);
          uVar18 = 0;
        }
        uVar9 = (ulong)uVar18;
        uVar18 = uVar18 + 1;
        lVar20 = uVar9 * 0x30;
        pfVar2 = (float *)(lVar16 + lVar20);
        fVar24 = *(float *)(lVar16 + 0x10 + lVar20);
        if ((fVar24 != fVar22) || (NAN(fVar24) || NAN(fVar22))) goto LAB_14084faf0;
        if ((pfVar2[5] != fVar25) || (NAN(pfVar2[5]) || NAN(fVar25))) goto LAB_14084faf0;
        if ((pfVar2[6] != fVar27) || (NAN(pfVar2[6]) || NAN(fVar27))) goto LAB_14084faf0;
        auVar4._4_4_ = -(uint)(pfVar2[1] == fStack_104);
        auVar4._0_4_ = -(uint)(*pfVar2 == local_108);
        auVar4._8_4_ = -(uint)(pfVar2[2] == fStack_100);
        auVar4._12_4_ = -(uint)(pfVar2[3] == fStack_fc);
        uVar11 = movmskps((int)unaff_RBP,auVar4);
        unaff_RBP = (ulong)uVar11;
        if (((uVar11 != 0xf) || (((pfVar2[7] != 1.0 || (NAN(pfVar2[7]))) || (pfVar2[8] != 1.0)))) ||
           (((NAN(pfVar2[8]) || (pfVar2[9] != 1.0)) || (NAN(pfVar2[9]))))) {
LAB_14084faf0:
          *(undefined4 *)((long)param_6 + uVar9 * 4) = uVar3;
          *pfVar2 = local_108;
          pfVar2[1] = fStack_104;
          pfVar2[2] = fStack_100;
          pfVar2[3] = fStack_fc;
          pfVar2[4] = fVar22;
          pfVar2[5] = fVar25;
          pfVar2[6] = fVar27;
          pfVar2[7] = 1.0;
          pfVar2[8] = 1.0;
          pfVar2[9] = 1.0;
          *(undefined8 *)(pfVar2 + 10) = local_e0;
        }
      } while( true );
    }
  }
  else {
    *in_stack_00000030 = 0.0;
    if ((bVar7 == 0) &&
       (((*puVar6 & 0x7fffffffffffffff) != 0 && (cVar8 = func_0x000145d986f0(), cVar8 == '\0')))) {
      DAT_1480441d9 = 1;
    }
    LOCK();
    UNLOCK();
    if (DAT_1480441d8 != '\x02') {
      DAT_1480441d8 = 0;
      return;
    }
  }
  DAT_1480441d8 = 0;
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}
