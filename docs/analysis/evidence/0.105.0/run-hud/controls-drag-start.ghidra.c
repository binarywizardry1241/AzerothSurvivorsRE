/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long *param_3,undefined8 param_4,long *param_5,
          long *param_6)

{
  uint *puVar1;
  float fVar2;
  float fVar3;
  undefined8 uVar4;
  undefined1 uVar5;
  int iVar6;
  undefined4 uVar7;
  long lVar8;
  long lVar9;
  undefined4 *puVar10;
  float *pfVar11;
  double dVar12;
  float fVar13;
  float fVar14;
  float fVar15;
  float fVar16;
  uint uVar17;
  long lVar18;
  ulong uVar19;
  int *piVar20;
  undefined8 uVar21;
  ulong uVar22;
  long lVar23;
  uint uVar24;
  uint *puVar25;
  long lVar26;
  long lVar27;
  float *pfVar28;
  undefined8 *puVar29;
  float fVar30;
  float fVar32;
  undefined1 auVar31 [16];
  undefined8 in_XMM6_Qa;
  undefined1 auVar33 [16];
  undefined1 auVar34 [16];
  undefined4 in_XMM7_Da;
  float fVar35;
  float fVar36;
  float fVar37;
  float fVar38;
  undefined8 *in_stack_00000028;
  undefined8 *in_stack_00000030;
  long local_e8;
  long local_e0;
  long local_d8;
  long local_c0;
  long local_a8;
  undefined1 (*pauStack_a0) [16];
  long local_98;
  ushort local_90;
  long local_88;
  char local_78 [8];
  int *local_70;
  undefined8 local_68;
  undefined4 local_58;

  lVar26 = *param_3;
  lVar8 = param_3[1];
  lVar23 = param_3[2];
  iVar6 = *(int *)((long)param_3 + 0x14);
  lVar9 = *param_5;
  puVar10 = (undefined4 *)param_5[2];
  uVar7 = *(undefined4 *)((long)param_5 + 0x1c);
  pfVar11 = (float *)*in_stack_00000030;
  local_a8 = *param_6;
  pauStack_a0 = (undefined1 (*) [16])param_6[1];
  local_98 = param_6[2];
  local_68 = in_XMM6_Qa;
  local_58 = in_XMM7_Da;
  func_0x0001400118b0(lVar26,*in_stack_00000028,&local_a8,local_78);
  if (local_78[0] != '\x01') {
    if (*local_70 == 1) {
      dVar12 = *(double *)(local_70 + 2);
      if ((((0.0 <= dVar12) && (0.0 <= *(double *)(local_70 + 4))) &&
          (dVar12 < (double)(uint)local_70[0x30])) &&
         (*(double *)(local_70 + 4) < (double)(uint)local_70[0x31])) {
        auVar33._0_4_ = (float)dVar12;
        auVar33._4_4_ = (float)*(double *)(local_70 + 4);
        auVar33._8_8_ = 0;
        piVar20 = local_70 + 0x32;
        if ((char)local_70[0x2e] != '\0') {
          piVar20 = local_70 + 0x2f;
        }
        auVar31._4_4_ = *piVar20;
        auVar31._0_4_ = *piVar20;
        auVar31._8_8_ = 0;
        auVar34 = divps(auVar33,auVar31);
        goto LAB_140278a74;
      }
    }
    func_0x000143608050();
    if (local_88 != 0) {
      uVar24 = (uint)local_90;
      if (local_90 == 0) {
        do {
          auVar33 = *pauStack_a0;
          local_a8 = local_a8 + -0x880;
          pauStack_a0 = pauStack_a0 + 1;
          uVar24 = (ushort)((ushort)(SUB161(auVar33 >> 7,0) & 1) |
                            (ushort)(SUB161(auVar33 >> 0xf,0) & 1) << 1 |
                            (ushort)(SUB161(auVar33 >> 0x17,0) & 1) << 2 |
                            (ushort)(SUB161(auVar33 >> 0x1f,0) & 1) << 3 |
                            (ushort)(SUB161(auVar33 >> 0x27,0) & 1) << 4 |
                            (ushort)(SUB161(auVar33 >> 0x2f,0) & 1) << 5 |
                            (ushort)(SUB161(auVar33 >> 0x37,0) & 1) << 6 |
                            (ushort)(SUB161(auVar33 >> 0x3f,0) & 1) << 7 |
                            (ushort)(SUB161(auVar33 >> 0x47,0) & 1) << 8 |
                            (ushort)(SUB161(auVar33 >> 0x4f,0) & 1) << 9 |
                            (ushort)(SUB161(auVar33 >> 0x57,0) & 1) << 10 |
                            (ushort)(SUB161(auVar33 >> 0x5f,0) & 1) << 0xb |
                            (ushort)(SUB161(auVar33 >> 0x67,0) & 1) << 0xc |
                            (ushort)(SUB161(auVar33 >> 0x6f,0) & 1) << 0xd |
                            (ushort)(SUB161(auVar33 >> 0x77,0) & 1) << 0xe |
                           (ushort)(byte)(auVar33[0xf] >> 7) << 0xf) ^ 0xffff;
        } while (uVar24 == 0);
      }
      local_90 = (ushort)uVar24;
      uVar17 = 0;
      for (; (uVar24 & 1) == 0; uVar24 = uVar24 >> 1 | 0x80000000) {
        uVar17 = uVar17 + 1;
      }
      local_90 = local_90 - 1 & local_90;
      local_88 = local_88 + -1;
      auVar34._8_8_ = 0;
      auVar34._0_8_ = *(ulong *)(local_a8 + -8 + ((ulong)uVar17 * -0x80 - (ulong)(uVar17 << 3)));
LAB_140278a74:
      puVar25 = *(uint **)(lVar26 + 0xf8);
      puVar1 = puVar25 + *(long *)(lVar26 + 0x100);
      uVar17 = iVar6 - (int)lVar23;
      uVar24 = 0xc233b000;
      if (uVar17 < 0xc233b000) {
        uVar24 = uVar17;
      }
      if (*(char *)(lVar26 + 0x108) == '\0') {
        lVar18 = 0;
        lVar23 = 8;
        uVar21 = 0;
        uVar17 = 0;
        local_c0 = 0;
        local_e8 = 0;
        local_e0 = 0;
        local_d8 = 0;
        fVar35 = _DAT_145d70c90;
        fVar36 = fRam0000000145d70c94;
        fVar37 = fRam0000000145d70c98;
        fVar38 = fRam0000000145d70c9c;
        do {
          if (uVar17 == (uint)uVar21) {
            if (puVar25 == puVar1) {
              return;
            }
            uVar17 = *puVar25;
            puVar25 = puVar25 + 1;
            if (*(long *)(*(long *)(lVar8 + 0x108) + 0x58 + (ulong)uVar17 * 0xa0) == 0) {
              do {
                if (puVar25 == puVar1) {
                  return;
                }
                uVar17 = *puVar25;
                puVar25 = puVar25 + 1;
              } while (*(long *)(*(long *)(lVar8 + 0x108) + 0x58 + (ulong)uVar17 * 0xa0) == 0);
              lVar27 = *(long *)(lVar8 + 0x108) + (ulong)uVar17 * 0xa0;
            }
            else {
              lVar27 = *(long *)(lVar8 + 0x108) + (ulong)uVar17 * 0xa0;
            }
            lVar23 = *(long *)(lVar8 + 0x1a8) + (ulong)*(uint *)(lVar27 + 0x94) * 0x48;
            uVar22 = *(ulong *)(*(long *)(lVar8 + 0x1a8) + 0x40 +
                               (ulong)*(uint *)(lVar27 + 0x94) * 0x48);
            if ((*(ulong *)(lVar26 + 0x110) < uVar22) &&
               (uVar19 = *(ulong *)(*(long *)(lVar23 + 0x38) + *(ulong *)(lVar26 + 0x110) * 8),
               uVar19 != 0)) {
              local_d8 = *(long *)(*(long *)(lVar23 + 0x18) + 0x10 + ~uVar19 * 0x30);
              uVar19 = *(ulong *)(lVar26 + 0x118);
              if (uVar22 <= uVar19) goto LAB_140278ee0;
LAB_140278ea5:
              uVar19 = *(ulong *)(*(long *)(lVar23 + 0x38) + uVar19 * 8);
              if (uVar19 == 0) goto LAB_140278ee0;
              local_e0 = *(long *)(*(long *)(lVar23 + 0x18) + 0x10 + ~uVar19 * 0x30);
              uVar19 = *(ulong *)(lVar26 + 0x120);
              if (uVar19 < uVar22) goto LAB_140278ef5;
LAB_140278f30:
              local_e8 = 0;
              uVar19 = *(ulong *)(lVar26 + 0x128);
              if (uVar22 <= uVar19) goto LAB_140278d80;
LAB_140278f49:
              uVar22 = *(ulong *)(*(long *)(lVar23 + 0x38) + uVar19 * 8);
              if (uVar22 == 0) goto LAB_140278d80;
              local_c0 = *(long *)(*(long *)(lVar23 + 0x18) + 0x10 + ~uVar22 * 0x30);
            }
            else {
              local_d8 = 0;
              uVar19 = *(ulong *)(lVar26 + 0x118);
              if (uVar19 < uVar22) goto LAB_140278ea5;
LAB_140278ee0:
              local_e0 = 0;
              uVar19 = *(ulong *)(lVar26 + 0x120);
              if (uVar22 <= uVar19) goto LAB_140278f30;
LAB_140278ef5:
              uVar19 = *(ulong *)(*(long *)(lVar23 + 0x38) + uVar19 * 8);
              if (uVar19 == 0) goto LAB_140278f30;
              local_e8 = *(long *)(*(long *)(lVar23 + 0x18) + 0x10 + ~uVar19 * 0x30);
              uVar19 = *(ulong *)(lVar26 + 0x128);
              if (uVar19 < uVar22) goto LAB_140278f49;
LAB_140278d80:
              local_c0 = 0;
            }
            lVar18 = func_0x000144e38680();
            lVar23 = *(long *)(lVar27 + 0x50);
            uVar21 = *(undefined8 *)(lVar27 + 0x58);
            uVar17 = 0;
          }
          uVar22 = (ulong)uVar17;
          uVar17 = uVar17 + 1;
          uVar22 = (ulong)~*(uint *)(lVar23 + 8 + uVar22 * 0x10);
          if ((((uint)(iVar6 - *(int *)(lVar18 + uVar22 * 4)) < uVar24) &&
              (*(char *)(local_d8 + uVar22) == '\0')) && (*(char *)(lVar9 + 0x20) == '\x02')) {
            lVar27 = uVar22 * 0x68 + local_e8;
            pfVar28 = (float *)(uVar22 * 0x20 + local_c0);
            uVar4 = *(undefined8 *)(lVar27 + 0x30);
            fVar32 = (float)((ulong)uVar4 >> 0x20);
            fVar30 = (float)uVar4;
            fVar13 = *pfVar28;
            fVar14 = pfVar28[1];
            fVar15 = pfVar28[2];
            fVar16 = pfVar28[3];
            uVar5 = *(undefined1 *)(local_e0 + uVar22);
            uVar4 = *(undefined8 *)(pfVar28 + 4);
            fVar2 = *(float *)(lVar27 + 100);
            fVar3 = *pfVar11;
            *puVar10 = uVar7;
            *(long *)(lVar9 + 0x18) = auVar34._0_8_;
            *(undefined1 *)(lVar9 + 0x20) = uVar5;
            *(ulong *)(lVar9 + 0x24) =
                 CONCAT44(fVar3 * fVar2 * (fVar32 * fVar38 * fVar16 + fVar30 * fVar36 * fVar14 +
                                          (float)((ulong)uVar4 >> 0x20)),
                          fVar3 * fVar2 * (fVar32 * fVar37 * fVar15 + fVar30 * fVar35 * fVar13 +
                                          (float)uVar4));
          }
        } while( true );
      }
      lVar18 = 0;
      uVar21 = 0;
      uVar17 = 0;
      lVar23 = 0;
      local_e8 = 0;
      local_e0 = 0;
      local_d8 = 0;
      fVar35 = _DAT_145d70c90;
      fVar36 = fRam0000000145d70c94;
      fVar37 = fRam0000000145d70c98;
      fVar38 = fRam0000000145d70c9c;
      do {
        if (uVar17 == (uint)uVar21) {
          if (puVar25 == puVar1) {
            return;
          }
          uVar22 = (ulong)*puVar25;
          puVar25 = puVar25 + 1;
          lVar23 = *(long *)(lVar8 + 0x1a8);
          if (*(long *)(lVar23 + 0x10 + uVar22 * 0x48) == 0) {
            do {
              if (puVar25 == puVar1) {
                return;
              }
              uVar17 = *puVar25;
              puVar25 = puVar25 + 1;
            } while (*(long *)(*(long *)(lVar8 + 0x1a8) + 0x10 + (ulong)uVar17 * 0x48) == 0);
            lVar18 = *(long *)(lVar8 + 0x1a8) + (ulong)uVar17 * 0x48;
            puVar29 = (undefined8 *)(lVar18 + 0x10);
            uVar22 = *(ulong *)(lVar26 + 0x110);
            uVar19 = *(ulong *)(lVar18 + 0x40);
            if (uVar22 < uVar19) goto LAB_140278b8a;
LAB_140278bc0:
            local_d8 = 0;
            uVar22 = *(ulong *)(lVar26 + 0x118);
            if (uVar19 <= uVar22) goto LAB_140278c10;
LAB_140278bd5:
            uVar22 = *(ulong *)(*(long *)(lVar18 + 0x38) + uVar22 * 8);
            if (uVar22 == 0) goto LAB_140278c10;
            local_e0 = *(long *)(*(long *)(lVar18 + 0x18) + 0x10 + ~uVar22 * 0x30);
            uVar22 = *(ulong *)(lVar26 + 0x120);
            if (uVar22 < uVar19) goto LAB_140278c25;
LAB_140278c60:
            local_e8 = 0;
            uVar22 = *(ulong *)(lVar26 + 0x128);
            if (uVar19 <= uVar22) goto LAB_140278ae0;
LAB_140278c79:
            uVar22 = *(ulong *)(*(long *)(lVar18 + 0x38) + uVar22 * 8);
            if (uVar22 == 0) goto LAB_140278ae0;
            lVar23 = *(long *)(*(long *)(lVar18 + 0x18) + 0x10 + ~uVar22 * 0x30);
          }
          else {
            lVar18 = lVar23 + uVar22 * 0x48;
            puVar29 = (undefined8 *)(lVar23 + uVar22 * 0x48 + 0x10);
            uVar22 = *(ulong *)(lVar26 + 0x110);
            uVar19 = *(ulong *)(lVar18 + 0x40);
            if (uVar19 <= uVar22) goto LAB_140278bc0;
LAB_140278b8a:
            uVar22 = *(ulong *)(*(long *)(lVar18 + 0x38) + uVar22 * 8);
            if (uVar22 == 0) goto LAB_140278bc0;
            local_d8 = *(long *)(*(long *)(lVar18 + 0x18) + 0x10 + ~uVar22 * 0x30);
            uVar22 = *(ulong *)(lVar26 + 0x118);
            if (uVar22 < uVar19) goto LAB_140278bd5;
LAB_140278c10:
            local_e0 = 0;
            uVar22 = *(ulong *)(lVar26 + 0x120);
            if (uVar19 <= uVar22) goto LAB_140278c60;
LAB_140278c25:
            uVar22 = *(ulong *)(*(long *)(lVar18 + 0x38) + uVar22 * 8);
            if (uVar22 == 0) goto LAB_140278c60;
            local_e8 = *(long *)(*(long *)(lVar18 + 0x18) + 0x10 + ~uVar22 * 0x30);
            uVar22 = *(ulong *)(lVar26 + 0x128);
            if (uVar22 < uVar19) goto LAB_140278c79;
LAB_140278ae0:
            lVar23 = 0;
          }
          lVar18 = func_0x000144e38680();
          uVar21 = *puVar29;
          uVar17 = 0;
        }
        uVar22 = (ulong)uVar17;
        uVar17 = uVar17 + 1;
        if ((((uint)(iVar6 - *(int *)(lVar18 + uVar22 * 4)) < uVar24) &&
            (*(char *)(local_d8 + uVar22) == '\0')) && (*(char *)(lVar9 + 0x20) == '\x02')) {
          lVar27 = uVar22 * 0x68 + local_e8;
          pfVar28 = (float *)(uVar22 * 0x20 + lVar23);
          uVar4 = *(undefined8 *)(lVar27 + 0x30);
          fVar32 = (float)((ulong)uVar4 >> 0x20);
          fVar30 = (float)uVar4;
          fVar13 = *pfVar28;
          fVar14 = pfVar28[1];
          fVar15 = pfVar28[2];
          fVar16 = pfVar28[3];
          uVar5 = *(undefined1 *)(local_e0 + uVar22);
          uVar4 = *(undefined8 *)(pfVar28 + 4);
          fVar2 = *(float *)(lVar27 + 100);
          fVar3 = *pfVar11;
          *puVar10 = uVar7;
          *(long *)(lVar9 + 0x18) = auVar34._0_8_;
          *(undefined1 *)(lVar9 + 0x20) = uVar5;
          *(ulong *)(lVar9 + 0x24) =
               CONCAT44(fVar3 * fVar2 * (fVar32 * fVar38 * fVar16 + fVar30 * fVar36 * fVar14 +
                                        (float)((ulong)uVar4 >> 0x20)),
                        fVar3 * fVar2 * (fVar32 * fVar37 * fVar15 + fVar30 * fVar35 * fVar13 +
                                        (float)uVar4));
        }
      } while( true );
    }
  }
  return;
}
